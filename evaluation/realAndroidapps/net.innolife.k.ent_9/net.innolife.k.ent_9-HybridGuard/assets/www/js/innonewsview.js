$(document).on('pageshow', '#detailsPage', function(event) {
	var id = getUrlVars()["id"];
	$.getJSON(serviceURL + 'json_news_view.php?id='+id, displayInnonews);
	getinnonewsHot();
});

function shareTwitter(share_text,share_url) {
    window.plugins.share.show({
		subject: '',
		text: share_text + ' ' + share_url
		},function() {}, // Success function
		function() {alert('Share failed')} // Failure function
	);
}

function shareFacebook(share_text,share_url) {
    window.plugins.share.show({
    	subject: '',
		text: share_text + ' ' + share_url
		},function() {}, // Success function
		function() {alert('Share failed')} // Failure function
	);
}

function displayInnonews(data) {
	var maxWidth = $(window).width() - 34;
    var news = data.item;
    var w = news.width;
    var c_id = news.cid;
    var i_id = news.iid;
    var news_text = news.text;
    var pcURL2 = 'http://www.innolife.com/list.php?ac_id=' + c_id + '&ai_id=' + i_id;
    var pcURL3 = 'http://m.innolife.com/innonewsviewdirect.html?id=' + i_id;
    var e_title = encodeURIComponent(news.title);
    var cut_text = getTextCut(news.text, '100');
    var tw_url = 'https://twitter.com/share?url=' + encodeURIComponent(pcURL2) + '&via=innolifenet&text=' + e_title;
    var fb_url = 'http://www.facebook.com/dialog/feed?app_id=376192059183517&link=' + encodeURIComponent(pcURL2) + '&picture=' + encodeURIComponent(news.picture) + '&name=' + e_title + '&caption=' + encodeURIComponent(cut_text) + '&description=&redirect_uri=' + encodeURIComponent(pcURL3);
    var kakao_url = 'kakaolink://sendurl?msg=' + e_title + '&url=' + pcURL3 + '&appid=m.innolife.net&appver=1.3.3&type=link&appname=K.ENT';
    var news_text = news.text;
    var p = "</p><p>";
    news_text =  news_text.replace(/\r\n/g, "<br />");
    news_text =  news_text.replace(/(\n|\r)/g, "<br />");
    news_text =  news_text.replace(/(<br \/>){2,}/g, "\n" + p + "\n");
    news_text =  news_text.replace(/<br \/>/g, "<br />\n");
	console.log(news);
    $('#innonewsDetailsCategory').text(news.category);
    $('#innonewsTitle').text(news.title);
	$('#innonewsText').html(news_text);
    $('#innonewsCategoryDatetime').text(news.category + ' ' + news.datetime);
    if(w > maxWidth) {
        $('#innonewsPic').attr('src', news.picture).width(maxWidth)
        .css("padding-left","0").css("padding-right","0");
    }
    else {
        $('#innonewsPic').attr('src', news.picture);
    }
    $('#twitter-link').click(function(){
        shareTwitter(news.title,pcURL3);
    });
    //$('#facebook-link').click(function(){
    //    shareFacebook(news.title,pcURL3);
    //});
    //$('#twitter-link').attr('href', tw_url);
    $('#facebook-link').attr('href', fb_url);
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
