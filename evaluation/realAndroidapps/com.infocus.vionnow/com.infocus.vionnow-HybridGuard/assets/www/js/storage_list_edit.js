
$('#storage_edit_page').live('pageshow', function(event) {
	editItemPage();	
});

function editItemPage(){
	var id = sessionStorage.getItem("movie_id");
	db.transaction(
	    function(tx) {
	        tx.executeSql('SELECT * FROM movie_storage WHERE id='+id+';',
	        [],
	        function (tx, result) {
	        	$('#storage_edit_header').html("<h3>"+result.rows.item(0).title+"</h3>");
	        	//alert(result.rows.item(0).title);
	        	$('textarea#storage_textarea_page').val(result.rows.item(0).comment);
	        	$('#storage_place_page').val(result.rows.item(0).place);
	        	$('#voting_slider_page').val(result.rows.item(0).voting);
	        	var myselect = $("select#storage_select_page");
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
				        	myselect[0].selectedIndex = result.rows.item(0).storage_reason;
				        	myselect.selectmenu("refresh");
	        	        }, errorCB
	        	        );
	        	        });
	        }, errorCB
	    );
	});
}


