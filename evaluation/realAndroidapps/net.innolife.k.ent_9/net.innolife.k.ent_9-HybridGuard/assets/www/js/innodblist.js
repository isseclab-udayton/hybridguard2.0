var serviceURL = "http://www.innolife.com/json/";
var innodb;
var page = 2;

$('#innodbListPage').on('pageinit', function(event) {
    var cat = getUrlVars()["c"];
    getInnodbList(cat);
});

function getInnodbList(cat) {
     $.getJSON(serviceURL + 'json_db.php?c=' + cat, function(data) {
        $('#innodbList li').remove();
		innodb = data.items;
		$.each(innodb, function(index, news) {
			$('#innodbList').append('<li><a href="innodbview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
		});
        $('#innodbList').append('<li id="innodbTemp' + page + '"></li>').listview('refresh');
        $('#innodbMore').html('<li><h3 id="innodbClick' + page + '">Twenty More...</h3></li>').listview('refresh');

        $('#innodbClick2').click(function() {
            getInnodbClick(cat, page);
        });

    });

    var newsTitle;
    if(cat==7) newsTitle = 'Singer';
    else if(cat==8) newsTitle = 'Actor';
    else if(cat==9) newsTitle = 'Drama';
    else if(cat==10) newsTitle = 'Movie';
    else if(cat==11) newsTitle = 'Album';
    else newsTitle = 'Profile';
    $('#innodbCategory').text(newsTitle);
}

function getInnodbClick(cat, page) { 
    $('#innodbMore').html('<li><h3>Loading...</h3></li>').listview('refresh');
    $.getJSON(serviceURL + 'json_db.php?c=' + cat + '&p=' + page, function(data) {
        $('#innodbTemp' + page).remove();
        $('#innodbMore li').remove();
        innodb = data.items;
        $.each(innodb, function(index, news) {
            $('#innodbList').append('<li><a href="innodbview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        page = page + 1;
        $('#innodbList').append('<li id="innodbTemp' + page + '"></li>').listview('refresh');
        if(page < 11) {
            $('#innodbMore').html('<li><h3 id="innodbClick' + page + '">Twenty More...</h3></li>').listview('refresh');
        }

        var innoClick = '#innodbClick' + page;
        $(innoClick).click(function() {
            getInnodbClick(cat, page);
        });
    });
}
