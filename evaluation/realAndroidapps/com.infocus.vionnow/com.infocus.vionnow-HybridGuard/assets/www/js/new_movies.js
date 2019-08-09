<!-- ------------------------ Film Neuheiten  ----------------------- -->
var pager_start_new = 0;
var multi_dot_new = 0;
var glob_dot_white_new = 0;

$(document).delegate('#new_movies', 'pageinit', function(){ 
	genre_dlg("new_movies");
    
    /********** Height fuer Content-Wrapper ************/
    var deviceViewportHeight = $('body').height();
    $('.subpage').find('.content-wrapper').height(deviceViewportHeight -110);
}); 
	$(document).delegate('#new_movies', 'pageshow', function(){ 
		/*if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
			openPopupInfo('Fehler!', 'kein Internet :(');
	  	}
		else{*/
			showNewMovies(num_items);
		//}	
	}); 
	
	$('#new_movies').live( 'pagehide', function( ) {
		//multi_dot_new = 0;
		glob_dot_white_new = 0;
	}); 
	
    function pager(direction){
    	if(direction == "back"){
    		if(pager_start_new >= num_items){
    			pager_start_new = pager_start_new - num_items;
    			if(glob_dot_white_new % max_dot_count == 0 && glob_dot_white_new != 0){
    				multi_dot_new--;
    				//alert('multi: '+multi_dot_new);
    			}
    		}
    		else{
    			$.mobile.changePage('#start');
    		}
    	}
    	else{
    		pager_start_new = pager_start_new + num_items;
    		if((glob_dot_white_new+1) % max_dot_count == 0 && glob_dot_white_new != 0){
				multi_dot_new++;
				//alert('multi: '+multi_dot_new);
			}
    	}
    	showNewMovies(num_items);
    }
    function showNewMovies(limit){
    	var grid_count = 97; // "a"
    	//var output_film = $('#content_new_movies');	
    	
    	// page indicator
		var dot_white = Math.round(pager_start_new / num_items);
		glob_dot_white_new = dot_white;
		//alert(dot_white);
		
		//alert(multi_dot_new * max_dot_count);
		dot_white = dot_white - (multi_dot_new * max_dot_count);
		//alert(dot_white);
		//var dot_count = Math.ceil(pager_end_new / num_items);
		
		dot_count = max_dot_count;
				
		//alert(dot_count);
		var css_class = ""; 
		
		$('#new_movies_dots').empty();
		if(pager_start_new != 0){
			$('#new_movies_dots').append('<span>&laquo;</span>');
		}
		for(var i = 0; i < dot_count; i++){
			if(dot_white == i){
				css_class = "dot-white";
			}
			else{
				css_class = "dot";
			}
			
			$('#new_movies_dots').append('<span class="'+css_class+'"></span>');
		}
		$('#new_movies_dots').append('<span>&raquo;</span>');
    	
		if(pager_start_new > 0){
			limit = pager_start_new+','+limit;
		}
		//alert('http://www.vionnow.de/json/listNewMovies/limit/'+limit+'/width/'+window.innerHeight);
        $.ajax({
	        	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	        	complete: function() { $.mobile.hidePageLoadingMsg(); },
     			url: 'http://www.vionnow.de/json/listNewMovies/limit/'+limit+'/width/'+window.innerWidth,
     			dataType: 'jsonp',
     			jsonp: 'jsoncallback',
     			timeout: 5000,
     			success: function(data){
     				var z = 0;
     				var n = 1;
 	    			$.each(data, function(i,item){
 	    				if(i == 3){
 	    					n = 2;
 	    					z = 0;
 	    				}
 	    				if(firebug == 1){
 	    					var film = '<div class="cover"><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
 	 	    			    $('#content_new_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
 	 						
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
		 	   	 	    			       $('#content_new_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
		 	    			    	       
		 	   		 	    			   z++;
				 	    			  //alert(item.Titel);
				 	    			    
	 	    			    	      }, errorCB
	 	    			        	  );
	 	    			     });
 	    			    }//else
 	    				
 	    			});
 	    			
     				
     			},
     			error: function(){
     				showNewMovies(num_items);
     			}
        });
    }
	$('#new_movies').live("swipeleft", function(event){
		pager("forward");
		event.preventDefault();
	});
	
	$('#new_movies').live("swiperight", function(event){
		pager("back");
		event.preventDefault();
	});