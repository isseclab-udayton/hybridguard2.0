var serviceURL = "http://www.innolife.com/json/";

var innotoday;
var page = 2;

$('#innotodayListPage').on('pageinit', function(event) {
    getInnotodayList();
});

function getInnotodayList() {
     $.getJSON(serviceURL + 'json_news_today.php', function(data) {
        $('#innotodayList li').remove();
		innotoday = data.items;
		$.each(innotoday, function(index, news) {
			$('#innotodayList').append('<li><a href="innotodayview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
		});
        $('#innotodayList').append('<li id="innotodayTemp' + page + '"></li>').listview('refresh');
        $('#innotodayMore').html('<li><h3 id="innotodayClick' + page + '">Twenty More...</h3></li>').listview('refresh');

        $('#innotodayClick2').click(function() {
            getInnotodayClick(page);
        });

    });

    var todayTitle = "Taday\'s Korea";
    $('#innotodayCategory').text(todayTitle);
}

function getInnotodayClick(page) { 
    $('#innotodayMore').html('<li><h3>Loading...</h3></li>').listview('refresh');
    $.getJSON(serviceURL + 'json_news_today.php?p=' + page, function(data) {
        $('#innotodayTemp' + page).remove();
        $('#innotodayMore li').remove();
        innotoday = data.items;
        $.each(innotoday, function(index, news) {
            $('#innotodayList').append('<li><a href="innotodayview.html?id=' + news.iid + '" data-transition="slide">' +
                '<img src="' + news.image + '" /><h4>' + news.title + '</h4>' +
                '<p>' + news.category + ' ' + news.datetime + '</p>' +
                '</a></li>');
        });
        page ++;
        $('#innotodayList').append('<li id="innotodayTemp' + page + '"></li>').listview('refresh');
        if(page < 11) {
            $('#innotodayMore').html('<li><h3 id="innotodayClick' + page + '">Twenty More...</h3></li>').listview('refresh');
        }

        var innoClick = '#innotodayClick' + page;
        $(innoClick).click(function() {
            getInnotodayClick(page);
        });
    });
}

function getUrlVars() { 
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function getTextCut(txt,cut) { 
    var cutFigure = cut; // カットする文字数
    var afterTxt = '…'; // 文字カット後に表示するテキスト
    var textLength = txt.length;
    var textTrim = txt.substr(0,(cutFigure)) + afterTxt;
    if(cutFigure < textLength) {
        return textTrim;
    } else if(cutFigure >= textLength) {
        return txt;
    }
}
