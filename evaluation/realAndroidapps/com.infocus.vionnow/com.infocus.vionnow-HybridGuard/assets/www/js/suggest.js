function suggest(){
	var search_suggest = $('#suggest_'+$.mobile.activePage.attr("id"));
	$('#suggest_start').empty();
	if($('#search_'+$.mobile.activePage.attr("id")).val().length >= 3){
		var search = $('#search_'+$.mobile.activePage.attr("id")).val();
		var film = "";
		$.ajax({
			url: 'http://www.vionnow.de/json/searchSuggest/search/'+search,
			dataType: 'jsonp',
			jsonp: 'jsoncallback',
			timeout: 10000,
			success: function(data){
				if(data){
                    film += '<ul>';
					$.each(data, function(i,item){
						film += '<li><a href="#movie_detail" onClick="setSession_MovieID('+item.ID+')">'+item.Title+'</a></li>';
					});
                    film += '</ul>';
					search_suggest.html(film);
				}	
			},
			error: function(){
				//alert("falsch");
			}
		});
	}	
}


