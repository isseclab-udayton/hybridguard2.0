<!-- ------------------------ Film Vorschau ----------------------- -->

var pager_stop_up = 0;

$(document).delegate('#upcoming_movies', 'pageinit', function(){ 
	genre_dlg("upcoming_movies");
    
    /********** Height fuer Content-Wrapper ************/
    var deviceViewportHeight = $('body').height();
    $(this).find('.content-wrapper').height(deviceViewportHeight -110);
}); 

$(document).delegate('#upcoming_movies', 'pageshow', function(){ 
	/*if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
		openPopupInfo('Fehler!', 'kein Internet :(');
	}
	else{*/
		showUpMovies(num_items);
	//}	
}); 

function up_pager(direction){

	var num_items_temp = num_items;
	if(direction == "back"){
		if(pager_start_up >= num_items){
			pager_start_up = pager_start_up - num_items;
			pager_stop_up = 0;
		}
		else{
			$.mobile.changePage('#start');
		}
	}
	else{
		if( (pager_start_up + num_items) <= (pager_end_up + num_items) && pager_stop_up != 1){
			
			pager_start_up = pager_start_up + num_items;
			if(pager_start_up + num_items > pager_end_up){
				num_items_temp = pager_end_up - pager_start_up;
				pager_stop_up = 1;
			}
		}
	}
	showUpMovies(num_items_temp);
}
function showUpMovies(limit){
	var grid_count = 97; // "a"
	
	// page indicator
	$('#up_movies_dots').empty();
	var dot_white = Math.round(pager_start_up / num_items);
	var dot_count = Math.ceil(pager_end_up / num_items);
	//alert(dot_count);
	
	var css_class = ""; 
	if(pager_start_up != 0){
		$('#up_movies_dots').append('<span>&laquo;</span>');
	}
	for(var i = 0; i < dot_count; i++){
		if(dot_white == i){
			css_class = "dot-white";
		}
		else{
			css_class = "dot";
		}
		$('#up_movies_dots').append('<span class="'+css_class+'"></span>');
	}
	if(pager_stop_up != 1 && num_items < pager_end_up){
		$('#up_movies_dots').append('<span>&raquo;</span>');
	}
	
	if(pager_start_up > 0){
		limit = pager_start_up+','+limit;
	}

	// grid leeren
	var z = 0;
    var n = 1;
	for(var i = 0; i < num_items; i++){
		if(i == 3){
			n = 2;
			z = 0;
		}
		$('#content_upcoming_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html("");
		z++;
	}
	//alert('http://www.vionnow.de/json/listUpMovies/limit/'+limit);
    $.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/listUpcomingMovies/limit/'+limit+'/width/'+window.innerWidth,
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
 		 	    			$('#content_upcoming_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
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
 	   		 	    			   $('#content_upcoming_movies'+n+' .ui-block-'+String.fromCharCode(grid_count + z)).html(film);
 	   		 	    			   z++;
		 	    			    
	    			    	      }, errorCB
	    			        	  );
	    			     });
 	    				}// else	
	    			});
 				
 			},
 			error: function(){
 				showUpMovies(num_items);
 			}
    });
}
$('#upcoming_movies').live("swipeleft", function(){
	up_pager("forward");
});

$('#upcoming_movies').live("swiperight", function(){
	
	up_pager("back");
});
