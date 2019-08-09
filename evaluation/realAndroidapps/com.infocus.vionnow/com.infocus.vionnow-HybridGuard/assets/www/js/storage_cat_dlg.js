$("#popupStorageCat li").live('click', function(e) {
	sessionStorage.setItem("storage_cat", $(this).attr('id'));	
});

$('#refresh').live( 'pageshow', function( ) {
	$.mobile.changePage('#storage_list');
});

function storage_cat_dlg(){
	output_storage_cat = $('#popupStorageCat');
	var storage_cat = '<ul data-role="listview" data-inset="true" data-theme="a">';
	storage_cat += '<li data-role="divider" data-theme="a">Kategorie</li>';
	db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT * FROM storage_reason;',
	        [],
	        function (tx, result) {
	        	len = result.rows.length;        	
	        	for (var i=0; i<(len); i++){
	        		storage_cat += '<li id="'+result.rows.item(i).id+'"><a href="#storage_list">'+result.rows.item(i).name+'</a></li>';
	        	}
	        	storage_cat += '</ul>';
	        	output_storage_cat.append(storage_cat); 
	        }, errorCB
	        );
	        });
	//für ff ohne db
	/*storage_cat += '<li id="Thriller"><a href="#genre_movies">Thriller</a></li>';
	storage_cat += '</ul>';
	output_storage_cat.html(storage_cat).trigger('create');*/ 
}



