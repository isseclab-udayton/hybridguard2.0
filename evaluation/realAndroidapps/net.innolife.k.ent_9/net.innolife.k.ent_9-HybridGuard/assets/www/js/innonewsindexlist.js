var innonews;
var innonewstoday;
var innodb1;
var innodb2;
var innonewshot;

$('#innonewsIndexListPage').on('pageinit', function(event) {
    getInnonewsIndexList();
    getInnonewsTodayIndex();
    getinnodbStarIndex();
    getinnodbDramaIndex();
    getinnonewsHotIndex();
});

function getInnonewsIndexList() {
    $.getJSON(serviceURL + 'json_news1.php', function(data) {
        $('#innonewsIndexList li').remove();
        innonews = data.items;
        console.log(innonews);
        $.each(innonews, function(index, news) {
            $('#innonewsIndexList').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        $('#innonewsIndexList').listview('refresh');
    });
}

function getInnonewsTodayIndex() {
    $.getJSON(serviceURL + 'json_news_today1.php', function(data) {
        $('#innonewsTodayIndex li').remove();
        innonewstoday = data.items;
        console.log(innonewstoday);
        var innonewstoday_count = 1;
        $.each(innonewstoday, function(index, news) {
            $('#innonewsTodayIndex' + innonewstoday_count).html('<a href="innotodayview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><p>' + news.title + '</p>' + '</a>');
            innonewstoday_count++;
        });
    });
}

function getinnodbStarIndex() {
    $.getJSON(serviceURL + 'json_db1.php', function(data) {
        $('#innodbStarIndex li').remove();
        innodb1 = data.items;
        console.log(innodb1);
        $.each(innodb1, function(index, news) {
            $('#innodbStarIndex').append('<li><a href="innodbview.html?id=' + news.iid + '" data-transition="slide">' +
                '<small>[' + news.category + '] ' + news.title + '</small>' +
                '</a></li>');
        });
        $('#innodbStarIndex').listview('refresh');
    });
}

function getinnodbDramaIndex() {
    $.getJSON(serviceURL + 'json_db2.php', function(data) {
        $('#innodbDramaIndex li').remove();
        innodb2 = data.items;
        console.log(innodb2);
        $.each(innodb2, function(index, news) {
            $('#innodbDramaIndex').append('<li><a href="innodbview.html?id=' + news.iid + '" data-transition="slide">' +
                '<small>[' + news.category + '] ' + news.title + '</small>' +
                '</a></li>');
        });
        $('#innodbDramaIndex').listview('refresh');
    });
}

function getinnonewsHotIndex() {
    $.getJSON(serviceURL + 'json_news_hot1.php', function(data) {
        $('#innonewsHotIndex li').remove();
        innonewshot = data.items;
        console.log(innonewshot);
        $.each(innonewshot, function(index, news) {
            $('#innonewsHotIndex').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<small>' + news.title + '</small>' +
                '</a></li>');
        });
        $('#innonewsHotIndex').listview('refresh');
    });
}
