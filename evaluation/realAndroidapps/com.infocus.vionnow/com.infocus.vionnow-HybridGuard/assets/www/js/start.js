<!-- ------------------------ Startseite  ----------------------- -->    

$('#start').live( 'pageshow', function( ) {
	pager_start_storage = 0;	
	multi_dot_storage = 0;
	glob_dot_white_storage = 0;
	pager_stop_storage = 0;
	continue_barcode = 0;
    
    // Flexslider
    addJavascript('flexslider/jquery.flexslider.js', 'head');
    
});
	
	function setPagerEndUp(){
		$.ajax({
 			url: 'http://www.vionnow.de/json/UpcomingMoviesCount',
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 3000,
 			success: function(data){
 				pager_end_up = data.Count;					
 			},
 			error: function(){
 				setPagerEndUp();
 			}
    	});
	}
	
    function showStartNew(){
    	
    	var grid_count = 97; // "a"
        $.ajax({
        	    beforeSend: function() { $.mobile.showPageLoadingMsg(); },
        	    complete: function() { $.mobile.hidePageLoadingMsg() },
     			url: 'http://www.vionnow.de/json/listNewMovies/limit/3/width/'+window.innerWidth,
     			dataType: 'jsonp',
     			jsonp: 'jsoncallback',
     			timeout: 3000,
     			success: function(data){
     				//output_film.append('<div class="ui-grid-b">');
 	    			$.each(data, function(i,item){
 	    				if(firebug == 1){
 	 	    			    var film = '<div class="cover"><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
 	 	    			    $('#content_film .ui-block-'+String.fromCharCode(grid_count + i)).html(film);
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
	 	    			    	       var film = '<div class="cover"><div class="stored-in '+st_class+'"></div><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
	 	   	 	    			       $('#content_film .ui-block-'+String.fromCharCode(grid_count + i)).html(film);
		    			    	      }, errorCB
		    			         );
		    			     });
	 	    			} // else
 	    				
	    			});
     			},
     			error: function(){
     				showStartNew();
     			}
        });
    }
    function showStartUp(){
    	var grid_count = 97; // "a"
        $.ajax({
        	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
        	complete: function() { $.mobile.hidePageLoadingMsg(); $('#start_content').show(); },
 			url: 'http://www.vionnow.de/json/listUpcomingMovies/limit/3/width/'+window.innerWidth,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 3000,
 			success: function(data){
 				$.each(data, function(i,item){
 					if(firebug == 1){
 						var film = '<div class="cover"><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
	 	    			$('#content_film_up .ui-block-'+String.fromCharCode(grid_count + i)).html(film);
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
                                                  var film = '<div class="cover"><div class="stored-in '+st_class+'"></div><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" /></a></div>';
	 	    		 	    			$('#content_film_up .ui-block-'+String.fromCharCode(grid_count + i)).html(film);
    			    	            }, errorCB
	    			    	  );
    			        });
 					} // else	
    			});
 				//
 			},
 			error: function(){
 			    showStartUp();
 			}
        });
        
    }
    /*function showStartNews(){  
    	var output_news = $('#content_news');	
    	output_news.empty();
        $.ajax({
        	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
        	complete: function() { $.mobile.hidePageLoadingMsg() }, //Hide spinner
 			url: 'http://www.vionnow.de/json/listNews/limit/3',
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 10000,
 			success: function(data){
 					output_news.append("<ul>");
	    			$.each(data, function(i,item){
	    			    //var news = '<p><a href="#" onClick="OpenNewsDetail('+item.ID+')"><img src="'+item.Thumb+'"></a>'+item.Titel+'</p>';
	    				//var news = '<a href="?cid='+item.ID+'#news_detail" rel="external"><img src="'+item.Thumb+'"></a>'+item.Titel;
	    				var news = '<a href="#news_detail" onClick="setSession_NewsID('+item.ID+')"><img src="'+item.Thumb+'"></a>'+item.Titel;
	    			  //alert(item.Titel);
	    			  output_news.append(news);
	    			});
	    			output_news.append("</ul>");
 				
 			},
 			error: function(){
 			    output_news.text('There was an error loading the data.');
 			}
        });
    }*/
    
    function genre(){
    	var myselect = $('select#select-genre');
    	myselect.empty();
    	myselect.append( new Option('Genre...', '0'));
    	$.ajax({
    			url: 'http://www.vionnow.de/json/listGenres',
    			dataType: 'jsonp',
    			jsonp: 'jsoncallback',
    			timeout: 10000,
    			success: function(data){
        			$.each(data, function(i,item){
        				//alert(item.genre);
        				myselect.append( new Option(item.genre, item.genre));
        			});
    				
    			},
    			error: function(){
    				genre();
    			}
        });
    	myselect.selectmenu("refresh");
    }
    
    function getBannerImgs(){
		$.ajax({
 			url: 'http://www.vionnow.de/json/banner/width/'+window.innerWidth,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 10000,
 			success: function(data){
 				var banner = '';
 				$.each(data, function(i,item){
 					banner += '<li>';
 					if(item.ext_link){
 						banner += '<a href="'+item.ext_link+'" rel="external" target="_blank"><img src="'+item.Cover+'" alt="top movie"></a>';
 					}
 					else{
 						banner += '<a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')"><img src="'+item.Cover+'" alt="top movie"></a>';
 					}	
 					banner += '</li>';
 				});
 				$('.slides').html(banner);
               // Slideshow initialisieren
               
                    $('.wmuSlider').flexslider({
                        animation: "slide",
                        easing: "swing",
                        touch: true
                    });
              
 			},
 			error: function(){
 				openPopupInfo('Server Fehler!', 'Der Server ist momentan nicht erreichbar. Bitte versuchen Sie es sp&auml;ter noch einmal.');
            }
      });
	}
   
    // Neuheiten per Swipe
    $('#content_film').live("swipeleft", function(event){
        event.preventDefault();
        $.mobile.changePage('#new_movies');
    });

    // Vorschau per Swipe
    $('#content_film_up').live("swipeleft", function(event){
        event.preventDefault();
        $.mobile.changePage('#upcoming_movies');
    });

    