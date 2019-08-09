$('#pg_start_movies li').live('click', function(e) {
	sessionStorage.setItem("genre", $(this).attr('id'));
});

$('#pg_new_movies li').live('click', function(e) {
	sessionStorage.setItem("genre", $(this).attr('id'));
});

$('#pg_upcoming_movies li').live('click', function(e) {
	sessionStorage.setItem("genre", $(this).attr('id'));
});

$('#pg_search_movies li').live('click', function(e) {
	sessionStorage.setItem("genre", $(this).attr('id'));
});

$('#pg_genre_movies li').live('click', function(e) {
	sessionStorage.setItem("genre", $(this).attr('id'));
});

function genre_dlg(pop_div){
	//alert('#pg_'+pop_div);
	output_genre = $('#pg_'+pop_div);
	var genre = '<ul data-role="listview" data-inset="true" style="min-width:210px;" data-theme="a">';
	genre += '<li data-role="divider" data-theme="a">Genre</li>';
	if(firebug != 1){
	  db.transaction(
	        function(tx) {
	        tx.executeSql('SELECT * FROM vionnow_genre;',
	        [],
	        function (tx, result) {
	        	len = result.rows.length;
	        	//alert(len);        	
	        	for (var i=0; i<(len); i++){
	        		genre += '<li id="'+result.rows.item(i).genre+'"><a href="#genre_movies">'+result.rows.item(i).genre+'</a></li>';
	        	}
	        	//genre += '<li id="Thriller"><a href="#genre_movies">'+result.rows.item(0).genre+'</a></li>';
	        	genre += '</ul>';
	        	output_genre.html(genre).trigger('create'); 
	        		

	        }, errorCB
	        );
	        });
	}
	else{
	// für ff ohne db
		genre += '<li id="Thriller"><a href="#genre_movies">Thriller</a></li>';
		genre += '</ul>';
		output_genre.html(genre).trigger('create'); 
	}	
}



