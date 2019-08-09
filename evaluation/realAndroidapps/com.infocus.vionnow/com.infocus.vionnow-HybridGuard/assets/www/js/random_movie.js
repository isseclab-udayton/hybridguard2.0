

$('#random_movie').live( 'pagehide', function( ) {
	 $('#content_random_movie').empty();
});


	
    
    function showRandMovie(){
    	var output_film = $('#content_random_movie');	
    	output_film.empty();
		//alert("Hallo");
		
		//alert('http://www.vionnow.de/json/listNewMovies/limit/'+limit);
        $.ajax({
	        	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	        	complete: function() { $.mobile.hidePageLoadingMsg() },
     			url: 'http://www.vionnow.de/json/randomMovie',
     			dataType: 'jsonp',
     			jsonp: 'jsoncallback',
     			timeout: 10000,
     			success: function(data){
 	    			var film = '<a href="#movie_detail" onClick="setSession_MovieID('+data.ID+')"><img src="'+data.Cover+'"></a>';
			 	    output_film.html(film).trigger('create');     				
     			},
     			error: function(){
     				//showRandMovie();
     			}
        });
        $.mobile.changePage('#random_movie');
    }
	