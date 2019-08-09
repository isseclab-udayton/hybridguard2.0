var serviceURL = "http://www.innolife.com/json/";

$(document).on('pageshow', '#innonewsIndexListPage', function(event) {
	$.getJSON(serviceURL + 'json_news_top.php', displayTopnews);
});

function displayTopnews(data) {
	var maxWidth = $(window).width() - 0;
    var news = data.item;
    var w = news.width;
	console.log(news);
    if(w > maxWidth) {
        w = maxWidth;
    }
    $('#innonewsTop li').remove();
    $('#innonewsTop').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide"><img src="' + news.picture + '" style="width:' + w + 'px;" /><h4>' + news.title + '</h4></a><br />');
}

