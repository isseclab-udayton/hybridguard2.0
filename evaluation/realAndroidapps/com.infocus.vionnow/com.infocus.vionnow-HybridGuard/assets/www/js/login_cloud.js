$('#login_cloud').live('pagebeforeshow', function(event) {
    	$('#login').hide();
    	$('#register').hide();
});

$('#login_cloud').live( 'pageshow', function( ) {
	synchronize_decide();
}); 


function synchronize_decide(){
	var id = sessionStorage.getItem("user_id");
	//alert(id);
	if(id){
		if(id == "999999"){
			showLogin();
		}
		else{
			synchronize(id, 0);
		}
	}
	else{
		showRegister();
	}
}

function showRegister(){
	$('#register').show();
	$('#login').hide();
}
function showLogin(){
	$('#login').show();
	$('#register').hide();
}
function loginSync(){
	var name = $('#login_name').val();
	var password = $('#login_password').val();
    $.ajax({
	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	complete: function() { $.mobile.hidePageLoadingMsg() },
		url: encodeURI('http://www.vionnow.de/json/signinJson?username='+name+'&password='+password),
		dataType: 'jsonp',
		jsonp: 'jsoncallback',
		timeout: 10000,
		success: function(data){
			 if(data.msg){
				 openPopupInfo('Information', data.msg);
				 //alert(data.msg);
			 }
			 else{
				 var user_id = data.user_id;
				 db.transaction(
     					function(tx) {
     						 tx.executeSql('REPLACE INTO vn_settings (s_key, s_value) VALUES ("user_id", "'+user_id+'")',
	        				 [],
	        			     function (tx, resultSet) {
     							sessionStorage.setItem("user_id", user_id); 
     							sessionStorage.setItem("cloud_message", "Deine Nutzer-Id wurde erfolgreich gespeichert.\nZukünfig ist keine neue Anmeldung erforderlich");
     							//openPopupInfo('Information', 'Deine Nutzer-Id wurde erfolgreich gespeichert.\nZukünfig ist keine neue Anmeldung erforderlich');
	        					//alert("Deine Nutzer-Id wurde erfolgreich gespeichert.\nZukünfig ist keine neue Anmeldung erforderlich");
	        					synchronize(user_id, 0);
	        				 }, errorCB
	        				 );  	 
     			       });
				 
			 }
			 
		},
		error: function(){
			//showRandMovie();
		}
   });
   //synchronize(17);	
}

function getUserId(){
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT s_value FROM vn_settings WHERE s_key = "user_id"',
	        [],
	        function (tx, result) {
	        	//alert(result.rows.item(0).s_value);
	        	if(result.rows.length > 0){
	        		sessionStorage.setItem("user_id", result.rows.item(0).s_value);
	        		//synchronize(result.rows.item(0).s_value);
	        	}	
	        }, errorCB
	        );
	        });
}

function registerSync(){
	var name = $('#register_name').val();
	var email = $('#register_email').val();
	var password = $('#register_password').val();
	//alert(name+' '+password+' '+email);
    $.ajax({
	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	complete: function() { $.mobile.hidePageLoadingMsg() },
		url: encodeURI('http://www.vionnow.de/json/registerJson?username='+name+'&password='+password+'&email='+email),
		dataType: 'jsonp',
		jsonp: 'jsoncallback',
		timeout: 10000,
		success: function(data){
			if(data.error != 1){
				db.transaction(
		    	        function(tx) {
		    	        	tx.executeSql('REPLACE INTO vn_settings (s_key, s_value) VALUES ("user_id", "999999");',
		  				 [],
		  			     function (tx, resultSet) {
		    	        		sessionStorage.setItem("user_id", "999999");
		    	        		openPopupInfo('Information', data.msg);
								//alert(data.msg); 
								showLogin();
									
		  				 }, errorCB
		  				 );
		    	        });
			}
			else{
				openPopupInfo('Information', data.msg);
				//alert(data.msg); 
			}
			  				
		},
		error: function(){
			//showRandMovie();
		}
   });
}

function synchronize(user_id, pdf){
	
	//alert(user_id);
	db.transaction(
			function(tx) {
		        tx.executeSql('SELECT * FROM movie_storage',
		        [],
		        function (tx, results) {
		        	var storage_data=[];
		        	len = results.rows.length;
		        	for (var i=0; i<len; i++){
		        		storage_data.push({"id":results.rows.item(i).id, 
		        			"title":results.rows.item(i).title,
		        			"cover":results.rows.item(i).cover,
		        			"comment":results.rows.item(i).comment,
		        			"place":results.rows.item(i).place,
		        			"voting":results.rows.item(i).voting,
		        			"storage_reason":results.rows.item(i).storage_reason,
		        			"modified":results.rows.item(i).modified,
		        			"deleted":results.rows.item(i).deleted,
		        			"user_id":user_id
		        		});
		        	}
		        	if(len == 0){
		        		storage_data.push({"id":"", 
		        			"title":"",
		        			"cover":"",
		        			"comment":"",
		        			"place":"",
		        			"voting":"",
		        			"storage_reason":"",
		        			"modified":"",
		        			"deleted":"",
		        			"user_id":user_id
		        		});
		        		
		        	}
		        	
		        	$.ajax({ 
		        		beforeSend: function() { $.mobile.showPageLoadingMsg(); },
		    	    	complete: function() { $.mobile.hidePageLoadingMsg(); },
		        		type: "POST", 
		        		url: "http://vionnow.de/json/synchronize", 
		        		contentType: "application/json; charset=utf-8",
		        		dataType: 'json',
		        		data: JSON.stringify({ Storage: storage_data }),
		        		success: function(data) { 
		        			var message = "";
				        	var count_deleted = 0;
				        	var count_replace = 0;
		        			if(data.msg == "ok"){
		        				message += "\n"+len+" Titel wurden auf den Server übertragen\n";
		        			}
		        			else{
			        			$.each(data, function(i,item){
			        				db.transaction(
			        					function(tx) {
			        						 if(item.deleted == 1){
			        							 deleteItemComplete(item.id);
			        							 count_deleted++;
			        							 	 
			        						 }
			        						 else{
				        						 //alert('REPLACE INTO movie_storage (id, title, cover, comment, place, voting, storage_reason, modified, deleted) VALUES ('+item.id+', "'+item.title+'", "'+item.cover+'", "'+item.comment+'", "'+item.place+'", "'+item.voting+'", '+item.storage_reason+', '+item.modified+', "'+item.deleted+'");');
				        					   	 tx.executeSql('REPLACE INTO movie_storage (id, title, cover, comment, place, voting, storage_reason, modified, deleted) VALUES ('+item.id+', "'+item.title+'", "'+item.cover+'", "'+item.comment+'", "'+item.place+'", "'+item.voting+'", '+item.storage_reason+', '+item.modified+', "'+item.deleted+'");',
				        					     [],
				        					     function (tx, resultSet) {
				        					   		count_replace++;
				        					   			
				        					     }, errorCB
				        					   	 );
			        						 }   	 
			        			       });
			        			});
		        			}// else
		        			if(count_deleted > 0){
		        				message += count_deleted+" Titel wurden gelöscht\n";
		        			}
		        			if(count_replace < 0){
		        				message += count_deleted+" Titel wurden vom Server abgeholt\n";
		        			}
		        			
		        			showStartNew();
				        	showStartUp();
		        			
		        			if(pdf == 1){
		        				createPDF(user_id);
		        			}
		        			else{
		        				if(sessionStorage.getItem("cloud_message") == ''){
		        					sessionStorage.setItem("cloud_message", "Daten erfolgreich synchronisiert!"+message);
		        				}	
		        				//alert("Daten erfolgreich synchronisiert!"+message);
		        			}
		        			$.mobile.changePage('#storage_list');
		        			
		        		},
		        		error: function(){
		        			alert("Fehler");
		     			}
		        	});
		        	
		        	
		        	
		        }, errorCB
		    );
	 });

}
function getPDF(){
	var user_id = sessionStorage.getItem("user_id");
	if(user_id){
		synchronize(user_id, 1);
	}
	else{
		openPopupInfo('Information', 'Für diese Funktion musst Du registriert sein\nRegistriere Dich einfach (synchronisieren) oder versende Deine Sammlung als csv-Datei.');
		//alert("Für diese Funktion musst Du registriert sein\nRegistriere Dich einfach (synchronisieren) oder versende Deine Sammlung als csv-Datei.")
	}
}

function createPDF(user_id){
	var storage_data=[];
	storage_data.push({
		"user_id":user_id
	});

	$.ajax({ 
		beforeSend: function() { $.mobile.showPageLoadingMsg(); },
    	complete: function() { $.mobile.hidePageLoadingMsg(); },
		type: "POST", 
		url: "http://vionnow.de/json/storagePdf", 
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		data: JSON.stringify({ Storage: storage_data }),
		success: function(data) { 
			if(data.msg == "ok"){
				openPopupInfo('Information', 'Die Daten werden übertragen. Es öffent sich in Kürze eine Auswahl zur Verarbeitung.');
				//alert("Die Daten werden übertragen. Es öffent sich in Kürze eine Auswahl zur Verarbeitung.");
				downloadPdf(user_id);
			}	
		},
    	error: function(){
    			alert("Fehler2");
 		}
    });				
}