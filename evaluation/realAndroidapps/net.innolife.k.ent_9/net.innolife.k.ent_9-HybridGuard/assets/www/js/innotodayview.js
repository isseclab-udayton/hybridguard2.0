$(document).on('pageshow', '#detailsPage3', function(event) {
	var id = getUrlVars()["id"];
	$.getJSON(serviceURL + 'json_news_today_view.php?id='+id, displayInnotoday);
	getinnonewsHot();
});

function displayInnotoday(data3) {
	var maxWidth = $(window).width() - 34;
    var news = data3.item;
	console.log(news);
    var c_id = news.cid;
    var i_id = news.iid;
    //var pcURL2 = 'http://www.innolife.com/list.php?ac_id=' + c_id + '&ai_id=' + i_id;
    //var pcURL3 = 'http://m.innolife.com/innotodayviewdirect.html?id=' + i_id;
    //var e_title = encodeURIComponent(news.title);
    //var cut_text = getTextCut(news.text, '100');
    //var tw_url = 'https://twitter.com/share?url=' + encodeURIComponent(pcURL3) + '&via=innolifenet&text=' + e_title;
    //var fb_url = 'http://www.facebook.com/dialog/feed?app_id=205611039562789&link=' + encodeURIComponent(pcURL3) + '&picture=' + encodeURIComponent(news.picture) + '&name=' + e_title + '&caption=' + encodeURIComponent(cut_text) + '&description=&redirect_uri=' + encodeURIComponent(pcURL3);
    //var kakao_url = 'kakaolink://sendurl?msg=' + e_title + '&url=' + pcURL3 + '&appid=m.innolife.com&appver=1.3.3&type=link&appname=innoNEWS';
    $('#innotodayTitle').text(news.title);
    $('#innotodayCategoryDatetime').text(news.category + ' ' + news.datetime);
    for(var i=0; i<15; i++) {
        if(news.picture.length>i) {
            var w = news.width[i];
            if(w > maxWidth) {
                $('#innotodayPic' + i).attr('src', news.picture[i]).width(maxWidth)
                .css("padding-left","0").css("padding-right","0");
            }
            else {
                $('#innotodayPic' + i).attr('src', news.picture[i]);
            }
            $('#innotodayText' + i).text(news.text[i]);
        }
        else {
            $('#innotodayPic' + i).remove();
            $('#innotodayText' + i).remove();
        }
    }

    //$('#twitter-link').attr('href', tw_url);
    //$('#facebook-link').attr('href', fb_url);
    //$('#kakao-link').attr('href', kakao_url);
}

function getinnonewsHot() {
    $.getJSON(serviceURL + 'json_news_hot1.php', function(data2) {
        $('#innonewsHot li').remove();
        var innonewshot2 = data2.items;
        $.each(innonewshot2, function(index, news) {
            $('#innonewsHot').append('<li><a href="innonewsview.html?id=' + news.iid + '" data-transition="slide">' +
                '<small>' + news.title + '</small>' +
                '</a></li>');
        });
        $('#innonewsHot').listview('refresh');
    });
}
