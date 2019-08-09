<!-- ------------------ Detailseiten mit Parameter Übergabe ----------------------- --> 

    
    $('#news_detail').live('pageshow', function(event, ui) {
    	//id = getParameterByName('cid');
    	//alert('http://www.vionnow.de/json/showNews/id/'+id);
    	var id = sessionStorage.getItem("news_id");
    	var output_news = $('#content_news_detail');
    	
    	//var slider = new Swipe(document.getElementById('slider'));
    	$.ajax({
    		beforeSend: function() { $.mobile.showPageLoadingMsg(); },
        	complete: function() { $.mobile.hidePageLoadingMsg();var slider = new Swipe(document.getElementById('slider')); },
			url: 'http://www.vionnow.de/json/showNews/id/'+id,
			dataType: 'jsonp',
			jsonp: 'jsoncallback',
			timeout: 10000,
			success: function(data){
	    		var title = '<p><b>'+data.Titel+'</b></p>';
	    		output_news.html(title);
				if(data.link){
	    			var link = '<p><img src="img/play.jpg" onClick="playTrailer(\''+data.link+'\')" /></p>';
		    		output_news.append(link);
		    		output_news.append(data.link_text);
	    		}
				if(data.Thumbs){
					var gal_thumbs = '<div id="slider" class="swipe"><div>';
					$.each(data.Thumbs, function(i,item){
						if(i == 0){
							gal_thumbs += '<div style="display:block"><div><img src="'+item+'" /></div></div>';
						}
						else{
							gal_thumbs += '<div style="display:none"><div><img src="'+item+'" /></div></div>';
						}	
					});
					gal_thumbs += '</div></div>';
					output_news.append(gal_thumbs);
				}	
	    		var content = '<p>'+data.Inhalt+'</p>';
	    		output_news.append(content);
	    		
			},
			error: function(){
				output_news.text('There was an error loading the data.');
			}
     	});	
    	
    	
    });
    $('#news_detail').live( 'pagehide', function( ) {
    	$('#content_news_detail').empty();
    });
    