$('#storage_edit').live( 'pagehide', function( ) {
	    close_storage_edit();
		$('#voting_plus').attr("checked",false);
		$('#voting_minus').attr("checked",false);
		$('#reason_1').attr("checked",false);
		$('#reason_2').attr("checked",false);
		$('#reason_3').attr("checked",false);
		$('#reason_4').attr("checked",false);
		$('#reason_5').attr("checked",false);
});
$('#storage_edit').live( 'pageshow', function( ) {
	if(firebug != 1){
	    var id = sessionStorage.getItem("movie_id");
	    //alert(id); 
	    db.transaction(
    	    function(tx) {
    	        strsql = 'SELECT * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE deleted != 1 AND movie_storage.id='+id;	
    	        tx.executeSql(strsql,
    	        [],function (tx, results) {
    	        	if(results.rows.length == 0){
    	        		$(".options-toggle-edit").attr('onclick', 'close_storage_edit()');
    	        		$(".options-toggle-edit .ui-btn-text").text("Abbrechen");
    	        	}
    	        	else{
    	        		$(".options-toggle-edit").attr('onclick', 'deleteItem()');
    	        		$(".options-toggle-edit .ui-btn-text").text("Löschen");
    	        	}
    	        }	
    	        , errorCB
    	  );
        });
	}
	
});
function deleteItem(){
	openPopupConfirm('Best&auml;tigen', 'Titel wirklich aus der Sammlung l&ouml;schen?', 'deleteItemConfirmed()', 'Löschen');
}

function deleteItemConfirmed(){
	
	var id = sessionStorage.getItem("movie_id");
	db.transaction(
	        function(tx) {
	        	tx.executeSql('UPDATE movie_storage SET deleted=1, modified='+Math.round(Date.now()/1000)+' WHERE id='+id+';',	
	        [],
	        function (tx, resultSet) {
	        		
	        		if(sessionStorage.getItem("referrer") == "movie_detail"){
	        	    	checkStorageList();
	        	    }
	        	    else{
	        	    	db.transaction(queryDBStorage, errorCB); 
	        	    }
	        	    showStartNew();
	        		showStartUp();
	        		$('#popconfirm_storage_edit').popup({ history: false });
	        		$('#popconfirm_storage_edit').popup("close");
	        		setTimeout("storageChangePage()",500);
	        		/*$( "#popconfirm_storage_edit" ).popup({
	        			popupafterclose: function(event, ui) { $.mobile.changePage('#'+sessionStorage.getItem("referrer"));}
	        		});*/
	        		
	        }, errorCB
	        );
	        });
}
function storageChangePage(){
	$.mobile.changePage('#'+sessionStorage.getItem("referrer"));
}
function deleteItemComplete(id){
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
	    		 editItem(id);
	         }, errorCB
	         );
	         });

}

function editItem(id){
	//var id = sessionStorage.getItem("movie_id");
	//alert($.mobile.activePage.attr('id'));
	$('#voting_plus').attr("checked",false);
	$('#voting_minus').attr("checked",false);
	$('#reason_1').attr("checked",false);
	$('#reason_2').attr("checked",false);
	$('#reason_3').attr("checked",false);
	$('#reason_4').attr("checked",false);
	$('#reason_5').attr("checked",false);
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT * FROM movie_storage WHERE id='+id+';',
	        [],
	        function (tx, result) {
	        	//alert(result.rows.item(0).title);
	        	$('textarea#storage_textarea').val(result.rows.item(0).comment);
	        	$('#storage_place').val(result.rows.item(0).place);
	        	$('#voting_'+result.rows.item(0).voting).attr("checked",true);
	        	$('#reason_'+result.rows.item(0).storage_reason).attr("checked",true);
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
	        	        	$('#voting_plus').checkboxradio(); 
	        	        	$('#voting_minus').checkboxradio();
	        	        	$('#reason_1').checkboxradio(); 
	        	        	$('#reason_2').checkboxradio(); 
	        	        	$('#reason_3').checkboxradio(); 
	        	        	$('#reason_4').checkboxradio(); 
	        	        	$('#reason_5').checkboxradio(); 
	        	        	$('#voting_plus').checkboxradio("refresh"); 
	        	        	$('#voting_minus').checkboxradio("refresh"); 
	        	        	$('#reason_1').checkboxradio("refresh"); 
	        	        	$('#reason_2').checkboxradio("refresh"); 
	        	        	$('#reason_3').checkboxradio("refresh"); 
	        	        	$('#reason_4').checkboxradio("refresh"); 
	        	        	$('#reason_5').checkboxradio("refresh"); 
	        	        }, errorCB
	        	        );
	        	        });
	        	
	        	
	        }, errorCB
	        );
	        });
	setSession_MovieID(id);
}

function save_storage_edit(){
	var id = sessionStorage.getItem("movie_id");
	if($('#storage_textarea').val()){
		var comment = $('#storage_textarea').val();
	}
	else{
		var comment = "";
	}
	if($('#storage_place').val()){
		var place = $('#storage_place').val();
	}
	else{
		var place = "";
	}
	var voting_tmp = $('input[name=voting]:checked').val();
	if(voting_tmp){
		voting = voting_tmp;
	}
	else{
		voting = "";
	}
	
	//var storage_reason = $('#storage_select').attr("selectedIndex");
	//var storage_reason = $('option:selected', '#storage_select'+popup_div).index();
	var storage_reason_tmp = $('input[name=storage_reason]:checked').val();
	if(storage_reason_tmp){
		storage_reason = storage_reason_tmp;
	}
	else{
		storage_reason = "";
	}
	if(!storage_reason){
		openPopupInfo('Sammlung', 'Bitte eine Kategorie auswählen oder Vorgang abbrechen');
		//alert("Bitte eine Kategorie auswählen oder Vorgang abbrechen");
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
 				db.transaction(
 				        function(tx) {
 				        tx.executeSql('UPDATE movie_storage SET comment="'+comment+'", place="'+place+'", voting="'+voting+'", storage_reason='+storage_reason+', modified='+data.msg+', deleted = 0 WHERE id='+id+';',
 				        [],
 				        function (tx, resultSet) {
 				        	if(sessionStorage.getItem("referrer") == "movie_detail"){
 				   			checkStorageList();
	 				   	    }
	 				   	    else{
	 				   	    	db.transaction(queryDBStorage, errorCB); 
	 				   	    }
 				        	showStartNew();
 				        	showStartUp();
 				        	if(continue_barcode == 1){
 				        		getBarcode(1);
 				        	}
 				        	else{
 				        		$.mobile.changePage('#'+sessionStorage.getItem("referrer"));
 				        	}	
 				        }, errorCB
 				        );
 				        });
 				
 				
 			},
 			error: function(){
 				alert("Fehler Save");
 			}
        });
	}
	
}

function close_storage_edit(){
	var id = sessionStorage.getItem("movie_id");
	if(!$('input[name=storage_reason]:checked').val()){
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
	if(continue_barcode == 1){
 		getBarcode(1);
 	}
 	else{
 		$.mobile.changePage('#'+sessionStorage.getItem("referrer"));
 	}	
	
}
