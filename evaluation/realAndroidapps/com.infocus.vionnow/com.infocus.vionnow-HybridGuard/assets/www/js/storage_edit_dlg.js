$('#storage_list').live( 'pagehide', function( ) {
	for(var div = 1; div < 3; div++){
		$('#voting'+div+'_plus').attr("checked",false);
		$('#voting'+div+'_minus').attr("checked",false);
		$('#reason'+div+'_1').attr("checked",false);
		$('#reason'+div+'_2').attr("checked",false);
		$('#reason'+div+'_3').attr("checked",false);
		$('#reason'+div+'_4').attr("checked",false);
		$('#reason'+div+'_5').attr("checked",false);;
	}	
});

function deleteItem(){
	var id = sessionStorage.getItem("movie_id");
    if(confirm('Titel wirklich aus der Merkliste entfernen?')){
        db.transaction(
        function(tx) {
        	tx.executeSql('UPDATE movie_storage SET deleted=1, modified='+Math.round(Date.now()/1000)+' WHERE id='+id+';',	
        [],
        function (tx, resultSet) {
        }, errorCB
        );
        });
    }else{
        alert('Gute Entscheidung!');
    }
    if($.mobile.activePage.attr('id') == "movie_detail"){
    	checkStorageList();
    	$('#storage_edit_dlg1').popup( "close" );
    }
    else{
    	db.transaction(queryDBStorage, errorCB); 
    	$('#storage_edit_dlg2').popup( "close" );
    }
    showStartNew();
	showStartUp();
}

function deleteItemComplete(id){
        db.transaction(
        function(tx) {
        	tx.executeSql('DELETE FROM movie_storage WHERE id='+id+';',	
        [],
        function (tx, resultSet) {
        }, errorCB
        );
        });
   
    showStartNew();
	showStartUp();
}

function insertMovieDB() {
	var id = sessionStorage.getItem("movie_id");
	var actual_cover = sessionStorage.getItem("actual_cover");
	var actual_title = sessionStorage.getItem("actual_title");
	//alert('REPLACE INTO movie_storage (id, cover, title) VALUES ('+id+', "'+actual_cover+'", "'+actual_title+'");');
	db.transaction(
	     function(tx) {
	    	 tx.executeSql('REPLACE INTO movie_storage (id, cover, title) VALUES ('+id+', "'+actual_cover+'", "'+actual_title+'");',
	         [],
	         function (tx, resultSet) {
	    		 editItem(id, 1);
	         }, errorCB
	         );
	         });
	/*var myselect = $('select#storage_select1');
	
	myselect.empty();
	myselect.append( new Option('Diesen Film...', '0'));
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT * FROM storage_reason;',
	        [],
	        function (tx, resultSet) {
	        	len = resultSet.rows.length;
	        	//alert(len);
	        	
	        	for (var i=0; i<len; i++){
	        		myselect.append( new Option(resultSet.rows.item(i).name,resultSet.rows.item(i).css_class) );
	        	}
	        	
	        
	        	myselect.selectmenu();
	        	myselect.selectmenu("refresh");
	        }, errorCB
	        );
	        });*/
}

function editItem(id, div){
	//var id = sessionStorage.getItem("movie_id");
	//alert($.mobile.activePage.attr('id'));
	$('#voting'+div+'_plus').attr("checked",false);
	$('#voting'+div+'_minus').attr("checked",false);
	$('#reason'+div+'_1').attr("checked",false);
	$('#reason'+div+'_2').attr("checked",false);
	$('#reason'+div+'_3').attr("checked",false);
	$('#reason'+div+'_4').attr("checked",false);
	$('#reason'+div+'_5').attr("checked",false);; 
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT * FROM movie_storage WHERE id='+id+';',
	        [],
	        function (tx, result) {
	        	//alert(result.rows.item(0).title);
	        	$('textarea#storage_textarea'+div).val(result.rows.item(0).comment);
	        	$('#storage_place'+div).val(result.rows.item(0).place);
	        	$('#voting'+div+'_'+result.rows.item(0).voting).attr("checked",true);
	        	$('#reason'+div+'_'+result.rows.item(0).storage_reason).attr("checked",true);
	        	//$('#voting1_plus').attr("checked",true);
	        	//$('#voting_slider'+div).val(result.rows.item(0).voting);
	        	/*var myselect = $('select#storage_select'+div);
	        		
	        	myselect.empty();
	        	myselect.append( new Option('Diesen Film...', '0'));*/
	        	db.transaction(
	        	        function(tx) {
	        	        tx.executeSql('SELECT * FROM storage_reason;',
	        	        [],
	        	        function (tx, resultSet) {
	        	        	len = resultSet.rows.length;
	        	        	//alert(len);
	        	        	
	        	        	for (var i=0; i<len; i++){
	        	        		//myselect.append( new Option(resultSet.rows.item(i).name,resultSet.rows.item(i).css_class) );
	        	        	}
		        	        if(result.rows.item(0).storage_reason){
		        	        	//myselect[0].selectedIndex = result.rows.item(0).storage_reason;
		        	        }

	        	        	//myselect.selectmenu();
	        	        	//myselect.selectmenu("refresh");
	        	        	$('#voting'+div+'_plus').checkboxradio(); 
	        	        	$('#voting'+div+'_minus').checkboxradio();
	        	        	$('#reason'+div+'_1').checkboxradio(); 
	        	        	$('#reason'+div+'_2').checkboxradio(); 
	        	        	$('#reason'+div+'_3').checkboxradio(); 
	        	        	$('#reason'+div+'_4').checkboxradio(); 
	        	        	$('#reason'+div+'_5').checkboxradio(); 
	        	        	$('#voting'+div+'_plus').checkboxradio("refresh"); 
	        	        	$('#voting'+div+'_minus').checkboxradio("refresh"); 
	        	        	$('#reason'+div+'_1').checkboxradio("refresh"); 
	        	        	$('#reason'+div+'_2').checkboxradio("refresh"); 
	        	        	$('#reason'+div+'_3').checkboxradio("refresh"); 
	        	        	$('#reason'+div+'_4').checkboxradio("refresh"); 
	        	        	$('#reason'+div+'_5').checkboxradio("refresh"); 
	        	        }, errorCB
	        	        );
	        	        });
	        	
	        	
	        }, errorCB
	        );
	        });
	setSession_MovieID(id);
}

function save_storage_edit(popup_div){
	var id = sessionStorage.getItem("movie_id");
	if($('#storage_textarea'+popup_div).val()){
		var comment = $('#storage_textarea'+popup_div).val();
	}
	else{
		var comment = "";
	}
	if($('#storage_place'+popup_div).val()){
		var place = $('#storage_place'+popup_div).val();
	}
	else{
		var place = "";
	}
	var voting_tmp = $('input[name=voting'+popup_div+']:checked').val();
	if(voting_tmp){
		voting = voting_tmp;
	}
	else{
		voting = "";
	}
	
	//var storage_reason = $('#storage_select').attr("selectedIndex");
	//var storage_reason = $('option:selected', '#storage_select'+popup_div).index();
	var storage_reason_tmp = $('input[name=storage_reason'+popup_div+']:checked').val();
	if(storage_reason_tmp){
		storage_reason = storage_reason_tmp;
	}
	else{
		storage_reason = "";
	}
	if(!storage_reason){
		alert("Bitte eine Kategorie auswählen!");
	}
	else{		
		$.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/getServerTime',
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 10000,
 			success: function(data){
 				alert('UPDATE movie_storage SET comment="'+comment+'", place="'+place+'", voting="'+voting+'", storage_reason='+storage_reason+', modified='+data.msg+', deleted = 0 WHERE id='+id+';');
 				db.transaction(
 				        function(tx) {
 				        tx.executeSql('UPDATE movie_storage SET comment="'+comment+'", place="'+place+'", voting="'+voting+'", storage_reason='+storage_reason+', modified='+data.msg+', deleted = 0 WHERE id='+id+';',
 				        [],
 				        function (tx, resultSet) {
 				        	if($.mobile.activePage.attr('id') == "movie_detail"){
 				   			checkStorageList();
 				   	    	$('#storage_edit_dlg1').popup( "close" );
	 				   	    }
	 				   	    else{
	 				   	    	db.transaction(queryDBStorage, errorCB); 
	 				   	    	$('#storage_edit_dlg2').popup( "close" );
	 				   	    	
	 				   	    }
 				        }, errorCB
 				        );
 				        });
 				
 				
 			},
 			error: function(){
 				alert("Fehler Save");
 				//save_storage_edit(popup_div)
 			}
        });
		
		
		
	}
	showStartNew();
	showStartUp();
}

function close_storage_edit(popup_div){
	var id = sessionStorage.getItem("movie_id");
	if(!$('input[name=storage_reason'+popup_div+']:checked').val()){
		db.transaction(
			function(tx) {
		        tx.executeSql('DELETE FROM movie_storage WHERE id='+id+';',
		        [],
		        function (tx, resultSet) {
		        	showStartNew();
		        	showStartUp();
		        }, errorCB
	        );
	    });
	}
	if($.mobile.activePage.attr('id') == "movie_detail"){
    	$('#storage_edit_dlg'+popup_div).popup( "close" );
    }
    else{
    	$('#storage_edit_dlg'+popup_div).popup( "close" );
    }
}