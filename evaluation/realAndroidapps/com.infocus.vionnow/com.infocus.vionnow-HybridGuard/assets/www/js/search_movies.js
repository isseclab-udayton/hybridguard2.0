<!-- ------------------------ Film Suche ----------------------- -->

var pager_start_search = 0;
var pager_end_search = 0;
var multi_dot_search = 0;
var glob_dot_white_search = 0;
var pager_stop_search = 0;

$('#search_movies').live( 'pageinit', function( ) {
	genre_dlg("search_movies");
}); 

$('#search_movies').live( 'pageshow', function( ) {
	/********** Height fuer Content-Wrapper ************/
	setTimeout("setViewportHeight()",500);
	if(sessionStorage.getItem("referrer") != "movie_detail"){
		pager_start_search = 0;
		multi_dot_search = 0;
		glob_dot_white_search = 0;
		pager_stop_up = 0;
	}
	showSearchMovies(num_items);
}); 


function setViewportHeight(){
	var deviceViewportHeight = $('body').height();
    //alert(deviceViewportHeight);
    $('.subpage').find('.content-wrapper').height(deviceViewportHeight -110);
}

function initSearch(){
	pager_start_search = 0;
	multi_dot_search = 0;
	glob_dot_white_search = 0;
	pager_stop_search = 0;
}

function search_pager(direction){
	var num_items_temp = num_items;
	if(direction == "back"){
		if(pager_start_search >= num_items){
			pager_start_search = pager_start_search - num_items;
			if(glob_dot_white_search % max_dot_count == 0 && glob_dot_white_search != 0){
				multi_dot_search--;
				//alert('multi: '+multi_dot_search);
			}
			pager_stop_search = 0;
		}	
	}
	else{
		if( (pager_start_search + num_items) <= (pager_end_search + num_items) && pager_stop_search !=1 && num_items < pager_end_search){
			
			pager_start_search = pager_start_search + num_items;
			if((glob_dot_white_search+1) % max_dot_count == 0 && glob_dot_white_search != 0){
				multi_dot_search++;
				//alert('multi: '+multi_dot_search);
			}
		}
	}
	showSearchMovies(num_items_temp);
}
function showSearchMovies(limit){
	var grid_count = 97; // "a"
	var search = $('#search_'+sessionStorage.getItem("referrer")).val();
	if(!search){
		search = sessionStorage.getItem("search");
	}
	//alert(search);
	sessionStorage.setItem("search", search);
	$.ajax({
		url: 'http://www.vionnow.de/json/searchMovies/search/'+search+'/count/1/width/'+window.innerWidth,
		dataType: 'jsonp',
		jsonp: 'jsoncallback',
		timeout: 5000,
		success: function(data){
			if(data){
				pager_end_search = data.Count;
				
				// page indicator
				var dot_white = Math.round(pager_start_search / num_items);
				glob_dot_white_search = dot_white;
				//alert(dot_white);
				
				//alert(multi_dot_search * max_dot_count);
				dot_white = dot_white - (multi_dot_search * max_dot_count);
				//alert(dot_white);
				var dot_count = Math.ceil(pager_end_search / num_items);
				if( pager_start_search + num_items > pager_end_search){
					pager_stop_search = 1;
				}
				if(Math.floor(dot_count / max_dot_count) == multi_dot_search){
					dot_count = (dot_count % max_dot_count);
				}
				if(dot_count > max_dot_count){
					dot_count = max_dot_count;
				}
				
				//alert(dot_count);
				var css_class = ""; 
				
				$('#search_movies_dots').empty();
				if(pager_start_search != 0){
					$('#search_movies_dots').append('<span>&laquo;</span>');
				}
				for(var i = 0; i < dot_count; i++){
					if(dot_white == i){
						css_class = "dot-white";
					}
					else{
						css_class = "dot";
					}
					$('#search_movies_dots').append('<span class="'+css_class+'"></span>');
				}
				
				if(pager_stop_search != 1 && num_items < pager_end_search){
					$('#search_movies_dots').append('<span>&raquo;</span>');
				}	
			}	
		},
		error: function(){
			showSearchMovies(num_items);
		}
	});
	
	
	
	if(pager_start_search > 0){
		limit = pager_start_search+','+limit;
	}

	// grid leeren
	var z = 0;
    var n = 1;
	for(var i = 0; i < num_items; i++){
		if(i == 3){
			n = 2;
			z = 0;
		}
		$('#content_search_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html("");
		z++;
	}
	
	//alert('http://www.vionnow.de/json/searchMovies/search/'+search+'/limit/'+limit);
    $.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/searchMovies/search/'+search+'/limit/'+limit+'/width/'+window.innerWidth,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 5000,
 			success: function(data){
                $('#search-error').hide();
 				if(data){
 					var z = 0;
     				var n = 1;
	    			$.each(data, function(i,item){
	    				if(i == 3){
 	    					n = 2;
 	    					z = 0;
 	    				}
 	    				if(firebug == 1){
 	 						var film = '<div class="cover"><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
 		 	    			$('#content_search_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
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
	 	   		 	    			   $('#content_search_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
	 	   		 	    			   z++;
			 	    			  //alert(item.Titel);
			 	    			    
 	    			    	      }, errorCB
 	    			        	  );
 	    			     });
 	    				} // else
 	    			});
 				}
 				else{
 					//$('#content_search_movies1').html('<p>Die Suche ergab keinen Treffer</p>');
                    $('#search-error').show();
 				}
     		},
     		error: function(){
     			showSearchMovies(num_items);
     	    }
   });
}   

$('#search_movies').live("swipeleft", function(){
	search_pager("forward");
});

$('#search_movies').live("swiperight", function(){
	search_pager("back");
});
