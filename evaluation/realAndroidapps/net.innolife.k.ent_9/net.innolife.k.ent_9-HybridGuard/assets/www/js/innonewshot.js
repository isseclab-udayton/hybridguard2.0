var serviceURL = "http://www.innolife.com/json/";
var innonews;

$('#innonewsHotPage').on('pageinit', function(event) {
    getinnonewsHotlist();
});

function getinnonewsHotlist() {
     $.getJSON(serviceURL + 'json_news_hot.php', function(data) {
        $('#innonewshotList li').remove();
        innonews = data.items;
        $.each(innonews, function(index, news) {
            $('#innonewshotList').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        $('#innonewshotList').listview('refresh');
    });
}
