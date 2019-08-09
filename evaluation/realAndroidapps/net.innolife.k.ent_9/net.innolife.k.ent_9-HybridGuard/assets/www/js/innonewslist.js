var serviceURL = "http://www.innolife.com/json/";

var innonews;
var page = 2;

$('#innonewsListPage').on('pageinit', function(event) {
    var cat = getUrlVars()["c"];
    getInnonewsList(cat);
});

function getInnonewsList(cat) {
     $.getJSON(serviceURL + 'json_news.php?c=' + cat, function(data) {
        $('#innonewsList li').remove();
		innonews = data.items;
		$.each(innonews, function(index, news) {
			$('#innonewsList').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
		});
        $('#innonewsList').append('<li id="innonewsTemp' + page + '"></li>').listview('refresh');
        $('#innonewsMore').html('<li><h3 id="innonewsClick' + page + '">Twenty More...</h3></li>').listview('refresh');

        $('#innonewsClick2').click(function() {
            getInnonewsClick(cat, page);
        });

    });

    var newsTitle;
    if(cat==6) newsTitle = 'K-POP';
    else if(cat==5) newsTitle = 'Movie';
    else if(cat==4) newsTitle = 'Drama';
    else if(cat==3) newsTitle = 'Entertainment';
    else newsTitle = 'Headline';
    $('#innonewsCategory').text(newsTitle);
}

function getInnonewsClick(cat, page) { 
    $('#innonewsMore').html('<li><h3>Loading...</h3></li>').listview('refresh');
    $.getJSON(serviceURL + 'json_news.php?c=' + cat + '&p=' + page, function(data) {
        $('#innonewsTemp' + page).remove();
        $('#innonewsMore li').remove();
        innonews = data.items;
        $.each(innonews, function(index, news) {
            $('#innonewsList').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        page = page + 1;
        $('#innonewsList').append('<li id="innonewsTemp' + page + '"></li>').listview('refresh');
        if(page < 11) {
            $('#innonewsMore').html('<li><h3 id="innonewsClick' + page + '">Twenty More...</h3></li>').listview('refresh');
        }

        var innoClick = '#innonewsClick' + page;
        $(innoClick).click(function() {
            getInnonewsClick(cat, page);
        });
    });
}
