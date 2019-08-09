<!-- ------------------------ Genre ----------------------- -->
$('#genre_movies').live( 'pageinit', function( ) {
	genre_dlg("genre_movies");
                        
    /********** Height fuer Content-Wrapper ************/
    var deviceViewportHeight = $('body').height();
    $('.subpage').find('.content-wrapper').height(deviceViewportHeight -110);
});

$('#genre_movies').live( 'pageshow', function( ) {
	if(sessionStorage.getItem("referrer") != "movie_detail"){
		pager_start_search = 0;
		multi_dot_search = 0;
		glob_dot_white_search = 0;
		pager_stop_up = 0;
	}
	showGenreMovies(num_items);
}); 



function genre_pager(direction){
	//alert(pager_end_search);
	if(direction == "back"){
		if(pager_start_search >= num_items){
			pager_start_search = pager_start_search - num_items;
			if(glob_dot_white_search % max_dot_count == 0 && glob_dot_white_search != 0){
				multi_dot_search--;
				//alert('multi: '+multi_dot_search);
			}
		}	
	}
	else{
		pager_start_search = pager_start_search + num_items;
		if((glob_dot_white_search+1) % max_dot_count == 0 && glob_dot_white_search != 0){
			multi_dot_search++;
			//alert('multi: '+multi_dot_search);
		}
	}
	showGenreMovies(num_items);
}

 
/*$("#genreMenu").live('change', function(e) {
	$(searchMenu).hide();
	sessionStorage.setItem("genre", $(this).val());
    showGenreMovies(num_items);
});*/




function showGenreMovies(limit){
	var search = sessionStorage.getItem("genre");
	//alert(search);
	var grid_count = 97; // "a"
	
	$header = $('#genre_movies').children( ":jqmData(role=header)" );
	$header.find("h1").html(search);
	
	// page indicator
	var dot_white = Math.round(pager_start_search / num_items);
	glob_dot_white_search = dot_white;
	//alert(dot_white);
	
	//alert(multi_dot_search * max_dot_count);
	dot_white = dot_white - (multi_dot_search * max_dot_count);
	//alert(dot_white);
	//var dot_count = Math.ceil(pager_end_search / num_items);
	
	dot_count = max_dot_count;
			
	//alert(dot_count);
	var css_class = ""; 
	
	$('#genre_movies_dots').empty();
	if(pager_start_search != 0){
		$('#genre_movies_dots').append('<span>&laquo;</span>');
	}
	for(var i = 0; i < dot_count; i++){
		if(dot_white == i){
			css_class = "dot-white";
		}
		else{
			css_class = "dot";
		}
		
		$('#genre_movies_dots').append('<span class="'+css_class+'"></span>');
	}
	$('#genre_movies_dots').append('<span>&raquo;</span>');
	
	if(pager_start_search > 0){
		limit = pager_start_search+','+limit;
	}
	
	//alert('http://www.vionnow.de/json/searchMovies/search/'+search+'/limit/'+limit);
    $.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/genreMovies/search/'+search+'/limit/'+limit+'/width/'+window.innerWidth,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 5000,
 			success: function(data){
 				var z = 0;
 				var n = 1;
 				if(data){
	    			$.each(data, function(i,item){
	    				if(i == 3){
 	    					n = 2;
 	    					z = 0;
 	    				}
 	    				if(firebug == 1){
 	 						var film = '<div class="cover"><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
 		 	    			$('#content_genre_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
 		 	    			z++;
 	 					}
 	    				else{
	    				db.transaction(
 	    			    	    function(tx) {
 	    			    	    	strsql = 'SELECT * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE deleted != 1 AND movie_storage.id='+item.ID;	
 	    			    	        tx.executeSql(strsql,
 	    			    	        [],
 	    			    	        function (tx, result) {
	 	    			    	        if(result.rows.length > 0){	
		 	    			    	        if(result.rows.item(0).css_class){
		 				 	    			    st_class = 'storage-'+result.rows.item(0).css_class;
		 	    			    	        }
		 	    			    	        else{
		 	    			    	        	st_class = 'storage';
		 	    			    	        }
	 	    			    	        }    
		 	    			    	    else{
		 	    			    	    	st_class = 'no-storage';
		 	    			    	    }    
	 	    			    	       n = 1;
	 	    			    	       if(i >= 3){
	 	    			    	    	   n = 2;
	 	    			    	       }
	 	    			    	       if(i == 3){
	 	    			    	    	  z = 0;	
	 	    	 	    			   }
	 	    			    	       var film = '<div class="cover"><div class="stored-in '+st_class+'"></div><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
	 	   		 	    			   $('#content_genre_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
	 	   		 	    			   z++;
			 	    			    
 	    			    	      }, errorCB
 	    			        	  );
 	    			     });
 	    				} // else
 	    			});
 				}
 				else{
 					//$('#content_genre_movies1').html('<p>Die Suche ergab keinen Treffer</p>');
 				}
     		},
     		error: function(){
     			showGenreMovies(num_items);
     	    }
   });
}    
$('#genre_movies').live("swipeleft", function(){
	genre_pager("forward");
});

$('#genre_movies').live("swiperight", function(){
	genre_pager("back");
});
