
/*<!-- ------------------------ News ------------------------- -->*/
var pager_start_news = 0;
var num_items_news = 5;

$(document).delegate('#news', 'pageinit', function(){
	showNews(num_items_news);
}); 

function news_pager(direction){
	if(direction == "back"){
		if(pager_start_news >= num_items_news){
			pager_start_news = pager_start_news - num_items_news;
		}	
	}
	else{
		pager_start_news = pager_start_news + num_items_news;
	
	}
	showNews(num_items_news);
}
function showNews(limit){
	var output_news = $('#content_all_news');	
	output_news.empty();
	if(pager_start_news > 0){
		limit = pager_start_news+','+limit;
	}

    $.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/listNews/limit/'+limit,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 10000,
 			success: function(data){
					var news = '<ul data-role="listview" data-split-icon="gear" data-theme="a">';
	    			$.each(data, function(i,item){
	    			  news += '<li><a href="#news_detail" onClick="setSession_NewsID('+item.ID+')"><img src="'+item.Thumb+'" /><p>'+item.Titel+'</p></a></li>';
	    			  
	    			});
					news += '</ul>';
					output_news.html(news).trigger('create');     	
 				
 			},
 			error: function(){
 				showNews(num_items_news);
 			}
    });
}
$('#content_all_news').live("swipeleft", function(){
	news_pager("forward");
});

$('#content_all_news').live("swiperight", function(){
	news_pager("back");
});