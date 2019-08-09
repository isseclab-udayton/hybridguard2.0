var serviceURL = "http://www.innolife.com/json/";
var innonews;
var innonewscount = 0;
var page = 2;

$('#innonewsSearchPage').on('pageinit', function(event) {
    $('#searchinput').keydown(function(e) {
        var inputcode = e.keyCode;
        if(inputcode==13) {
            var word = jQuery("#innonewsSearchForm input:text").val();
            getInnonewsSearch(word);
        }
    });
});

function getInnonewsSearch(word) {
     $.getJSON(serviceURL + 'json_news_search.php?s=' + word, function(data) {
        $('#innonewsSearch li').remove();
        innonewscount = data.itemCount;
        innonews = data.items;
        var view_html;
        $.each(innonews, function(index, news) {
            if(news.cid>6) view_html = 'innodbview.html';
            else           view_html = 'innonewsview.html';
            $('#innonewsSearch').append('<li><a href="' + view_html + '?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        $('#innonewsSearch').listview('refresh');
    });

    var newsTitle = 'Search';
    $('#innonewsCategory').text(newsTitle);
}

