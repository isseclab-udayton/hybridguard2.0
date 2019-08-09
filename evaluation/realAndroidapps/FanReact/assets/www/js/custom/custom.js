var globalChecked;
var globalCapturedImageUrl;

// on ready is run only once but after $(document).bind('pageinit')
$(document).on("ready", function () {


    // customize default alert to notification.alert
    //var deviceType = (navigator.userAgent.match(/iPad/i)) == "iPad" ? "iPad" : (navigator.userAgent.match(/iPhone/i)) == "iPhone" ? "iPhone" : (navigator.userAgent.match(/Android/i)) == "Android" ? "Android" : (navigator.userAgent.match(/BlackBerry/i)) == "BlackBerry" ? "BlackBerry" : "null";
    //if (deviceType != "Android") {
    //    window.alert = function (txt) { navigator.notification.alert(txt, null, "Alert", "Close") };
    //}
    
    window.alert = customNamespace.popup.show ;

    customNamespace.getBadWord();

    // initialize menu popup once
    $('#popupMenu').popup();
    $('#commonCapturePopup').popup();
    $('#index-commonAlertPopup').popup();

    //Changes for notification - start
    // phoneNotificationSettingsNameSpace.getSettingsFromSQLite();
});


$(document).bind('pageinit', function (event) {
    event.preventDefault();
    event.stopPropagation();
    event.stopImmediatePropagation();
    customNamespace.page.event.onPageShow();
});

$(window).scroll(function (event) {
    event.preventDefault();
    scrollNamespace.call();
});

var customNamespace = {
    convertDate: function (inputDate) {
        inputDate = inputDate.replace(/-/g, '/')
        inputDate = new Date(inputDate);
        var today = new Date();
        var nDifference = Math.abs(new Date() - inputDate);
        var one_day = 1000 * 60 * 60 * 24;
        var one_hour = 1000 * 60 * 60;
        var one_minute = 1000 * 60;
        var one_second = 1000;

        var weekday = new Array(7);
        weekday[0] = "Sun";
        weekday[1] = "Mon";
        weekday[2] = "Tue";
        weekday[3] = "Wed";
        weekday[4] = "Thu";
        weekday[5] = "Fri";
        weekday[6] = "Sat";

        if (nDifference > one_day) {
            return "on " + weekday[inputDate.getDay()] + " " + (inputDate.getMonth() + 1) + "/" + inputDate.getDate();
        }
        else if (nDifference > one_hour && nDifference < one_day) {
            return Math.round(nDifference / one_hour) + " h";
        }
        else if (nDifference > one_minute && nDifference < one_hour) {
            return Math.round(nDifference / one_minute) + " m";
        }
        else if (nDifference > one_second && nDifference < one_minute) {
            return Math.round(nDifference / one_second) + " s";
        }
    },

    refreshPage: function () {
        $.mobile.changePage(
          window.location.href,
          {
              allowSamePageTransition: true,
              transition: 'none',
              showLoadMsg: false,
              reloadPage: true
          }
        );
    },

    checkPageIdtoAppendOrnot: function () {

        var pages = $("[data-role=page]");
        var lastPageDiv;
        for (var i = 1; i < pages.length; i++) {
            lastPageDiv = pages[i];
        }

        var pageId = $(lastPageDiv).attr('id');

        if (pageId == undefined) { return false; }

        $('#searchPopup').remove();
        $('#popupBasic').remove();
        $.get('../commonForAllPage/commonForAllPage.html', function (data) {
            $(lastPageDiv).append(data);
            $(lastPageDiv).trigger('create');
        });

        switch (pageId) {
            case 'searchTeamView':
            case 'followingView':
            case 'gameCenterView':
            case 'teampage':
                $('#commonForAllPagePreventFlashSolution').show();
                break;

            case 'welcomeView':
            case 'privacyPolicyView':
            case 'registerView':
            case 'index':
            case 'loginView':
            case 'intro':
                // do not show header and footer for above pages
                break;
            default:
                $('#commonForAllPagePreventFlashSolution').show();
                break;
        }
    },

    removeBackButton: function () {
        $('.ui-header p a').css({
            'background-image': 'url(../../images/logo-fanreact-without-back.png)',
            'background-size': '35px auto',
            width: '56px',
        });
        $('.ui-header p a').addClass('logoWithoutBack');
        $('.ui-header p a').removeAttr("data-rel");
        $('#dropdown').removeAttr("data-rel");
    },

    customAlert: function (msg, header) {
        // doesn't not work all the time 
        $('a.btn').css("background", 'green');
        //$('#alertMsg').css("box-shadow", "0 0 0 .3em " + 'pink');
        $('#alertMsg h2').css("color", 'green');

        $('#alertMsg h2').html(header);
        if (header == undefined) {
            $('#alertMsg h2').hide();
        }
        $('#alertMsg p').html(msg);
        $('#alertMsg').fadeIn();
        console.log( msg + header )
        setTimeout(function () {
            $('#alertMsg').fadeOut();
        }, 1000); // 1 second = 1000
    },

    // Changes size of main padding to accomodate fixed panels
    sizing: function () {
        var headerHeight = $('#index-header').is(":visible") == true ? $('#index-header').height() : $.mobile.activePage.find('.Id-customHeader').height() ;
        
        // var footerHeight = $('.ui-footer').height();
        var footerHeight = $('.ui-footer').height() ;

        $('.ui-content').css("padding-top", headerHeight);
        $('.ui-content').css("padding-bottom", footerHeight);


        var height = parseInt(headerHeight, 10);
        height = height + 1;
        $('#refresh').css("top", height + 'px');

    },


    // Invite a friend to download FanReact
    invite: function () {

        try {
            var msg = "Download FanReact, look me up @" + loginNameSpace.profileHandle + ", and get in the game! http://api.fanreact.com/store";
            window.plugins.socialsharing.share(msg, 'FanReact ');
            return false;
        } catch (err) { console.log(err.message) }

        var t;
        var c = 'body=' + encodeURIComponent("Download FanReact, look me up @" + loginNameSpace.profileHandle + ", and get in the game! http://api.fanreact.com/store");
        var ver;

        var deviceType = (navigator.userAgent.match(/iPad/i)) == "iPad" ? "iPad" : (navigator.userAgent.match(/iPhone/i)) == "iPhone" ? "iPhone" : (navigator.userAgent.match(/Android/i)) == "Android" ? "Android" : (navigator.userAgent.match(/BlackBerry/i)) == "BlackBerry" ? "BlackBerry" : "null";

        if (deviceType == "iPhone" || deviceType == "iPad") {
            //Test ios version             
            if (/iP(hone|od|ad)/.test(navigator.platform)) {
                // supports iOS 2.0 and later: <http://bit.ly/TJjs1V>
                var v = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);
                ver = [parseInt(v[1], 10), parseInt(v[2], 10), parseInt(v[3] || 0, 10)];
            }

            if (ver[0] <= 7) {
                t = '&';
                window.location = 'mailto:?subject=Connect with FanReact' + t + c;
            } else {
                t = '&';
                window.location = 'sms:' + t + c;
            }
        } else {
            t = '?';
            window.location = 'sms:' + t + c;
        }
    },

    getBadWord: function () {
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedAppPreferences';
        //console.log(chosenUrl);
        var thisNamespace = customNamespace;
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            var feed = data.Data[3];
            thisNamespace.BadWord = feed.badWordsToRemove.split("\n");
        }).fail(function () {
        });
    },

    filterBadWord: function (someString) {
        String.prototype.repeat = function (num) {
            return new Array(num + 1).join(this);
        }

        var filter = customNamespace.BadWord;
        // filter = ['ass', 'words', 'fuck', 'shit'];

        var txt = someString;

        // iterate over all words
        for (var i = 0; i < filter.length; i++) {

            // Create a regular expression and make it global
            var pattern = new RegExp('\\b' + filter[i] + '\\b', 'g');

            // Create a new string filled with '*'
            var replacement = '*'.repeat(filter[i].length);

            txt = txt.replace(pattern, replacement);
        }

        // returning txt will set the new text value for the current element
        return txt;
    },

    filterTextAsRequired: function (someString) {
        var string = someString;

        var regex = /^[a-z_A-Z0-9]*$/; // allow alphabet and _ only
        if (regex.test(string)) { // yes, aphabet and _ only
        } else { // no, something inside beside aphabet and _
            return false;
        }

        regex = new RegExp(/\_/g) // checking for _ in the string

        var count = 0;
        if (string.search('_') != -1) {
            count = string.match(regex).length; // count occurence of regex in string
        }
        if (count > 2) // if _ appear twice in string
        {
            return false;
        }

        return true;
    },
    
    detectImg: function (inputTag) {

        var txt = $(inputTag).val();
        var isImgUrl= /https?:\/\/.*?\.(?:png|jpg|jpeg|gif)/i;
        txt=txt.replace(isImgUrl,'<img src="$&"/>');
        if (txt.length >= 1) {
            $(inputTag).val(txt);
        }
    },
    
    replaceURLFn : function ( autolinker, match ) {
        var s =  match.getAnchorHref();
        if (s.indexOf("HTTP") >= 1 ){
            switch( match.getType() ) {
                case 'url' :
                    console.log( "url: ", match.getUrl() );
                    var tag = autolinker.getTagBuilder().build( match );  // returns an `Autolinker.HtmlTag` instance, which provides mutator methods for easy changes
                    tag.setAttr( 'rel', 'nofollow' );
                    tag.setAttr('onclick', "window.open('" + match.getUrl() + "', '_blank', 'location=yes')");
                    tag.setAttr("href", "#");
                    return tag;
            }
        }
    },    
    
    commentImg: function (txt) {
        
        
        var s = txt.toUpperCase();
        if (s.indexOf("<IMG") <= 0 || s.indexOf("HREF=") <= 0 ){
        
            var regex = new RegExp('\.gifv', 'ig');
            txt = txt.replace(regex, '\.gif');
            
            var etxt = String(txt);
            var itxt = String(txt);
            
            //extract just the first image
            var ireg = /https?:\/\/([a-z\-%20+_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i;
            var iarr = itxt.match(ireg);
            
            if (iarr != null){
                itxt = iarr[0]; 
                if (itxt != ""){
                    itxt = "<span><img src='" + itxt + "' style='width:auto; height:auto; max-width:100px !important; max-height:100px !important;'/><span>"
                }
            }
            else{
                itxt = "";
            }
            
            //now remove the first image
            var isImgUrl= /https?:\/\/([a-z\-%20+_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i;
            etxt = etxt.replace(isImgUrl,"");
            
            etxt = etxt.replace(/\"/g, "");        
            
            etxt = Autolinker.link( etxt, {truncate: 20, replaceFn: customNamespace.replaceURLFn} ); 
            
            if (etxt != null && etxt != "" && itxt.trim() != ""){
                itxt = "<br>" + itxt;
                
            }        
            
            txt = etxt + "<br>" + itxt;
        }
        
        return txt;
        
    },
    
    sendToTwitter: function (msg,url) { 
        if (msg != ""){            
            window.plugins.socialsharing.shareViaTwitter(msg, null /* img */, url);
        }
        return false;
    },
    
    sendToFaceBook: function (msg,url) { 
        if (msg != ""){           
            window.plugins.socialsharing.shareViaFacebook(msg, null /* img */, url, function() {}, function(errormsg){}); 
            //window.plugins.socialsharing.shareViaFacebookWithPasteMessageHint(msg, null /* img */, url, msg, function() {}, function(errormsg){});
        }
        return false;
    }, 
    
    appOverride: function () {    

        var s = "";
        var v = "";
        var userid = loginNameSpace.loggedUserID;
        if (userid != ""){
            var appname="FR"; // white label app name
           
            $.ajax({
            url:"http://www.fanreact.com/mobilefan.php",
            data:{user:userid,app:appname},
            dataType:"jsonp",
            success:function(v)
            {
                s=v.data.status;
                console.log(s);            
            }
            });
        } 
        return s;
    },    
    
    socShare: function (msg,url,socialsite) {    

        var s = url.trim(); 
        url = url.trim();

        if (url != "" && msg != ""){
            var username="fanreact"; // bit.ly username
            var key="R_65b0cc86fa57444ba5ef7d71fd309ad0";
            
            $.ajax({
            url:"http://api.bit.ly/v3/shorten",
            data:{longUrl:url,apiKey:key,login:username},
            dataType:"jsonp",
            success:function(v)
            {
                s=v.data.url;
                if (socialsite=="twitter"){
                   customNamespace.sendToTwitter(msg,s);
                }
                else
                {
                   customNamespace.sendToFaceBook(msg,s);
                }                
            }
            });
        }
        else{
            if (socialsite=="twitter"){
               customNamespace.sendToTwitter(msg + " " + url);
            }
            else
            {
               customNamespace.sendToFaceBook(msg + " " + url);
            }
        }
        
        return s;
    },
    
    replaceImg: function (txt,cut) {

        var s = txt.toUpperCase();
        if (s.indexOf("<IMG") <= 0 || s.indexOf("HREF=") <= 0 ){        
        
            var regex = new RegExp('\.gifv', 'ig');
            txt = txt.replace(regex, '\.gif');
            
            var etxt = String(txt);
            var itxt = String(txt);
            
            //extract just the first image
            //var ireg = /([a-z\-_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i;
            var ireg = /https?:\/\/([a-z\-%20+_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i;
            var iarr = itxt.match(ireg);
            
            if (iarr != null){
                itxt = iarr[0]; 
                if (itxt != ""){
                    itxt = "<img src='" + itxt + "' id='postImage' class='postImage' style='width:auto !important; height:auto !important; max-width:100% !important;'/>"
                }
            }
            else{
                itxt = "";
            }
               
            //now remove the first image
            var isImgUrl= /https?:\/\/([a-z\-%20+_0-9\/\:\.]*\.(jpg|jpeg|png|gif))/i;
            etxt = etxt.replace(isImgUrl,"");
            
            etxt = etxt.replace(/\"/g, "");        
            
            if (cut == 1 && etxt != null && etxt != ""){
               if (etxt.length > 30 ){
               etxt = customNamespace.subString( etxt , 0, 30);
               }
            } 
            else{
               etxt = Autolinker.link( etxt, {truncate: 20, replaceFn: customNamespace.replaceURLFn} ); 
            }
            
            
            if (etxt != null && etxt != "" && itxt.trim() != ""){
                itxt = "<br><br>" + itxt;
                
            }
            
            txt = etxt + itxt;
        }
        
        return txt;
    },
    
    capFirstLetter: function (inputTag) {

        var text = $(inputTag).val();
        //text = text.substring(0, 1).toUpperCase() + text.substring(1, text.length);
        //$(inputTag).val(text);
        if (text.length == 1) {
            $(inputTag).val(text.toUpperCase());
        }
    },

    capFirst: function (inputTag) {
        text = $(inputTag).val().split(" ");
        var returnText = "";
        var pattern = new RegExp('^(https?:\\/\\/)?' + // protocol
                      '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + // domain name
                      '((\\d{1,3}\\.){3}\\d{1,3}))' + // OR ip (v4) address
                      '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
                      '(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
                      '(\\#[-a-z\\d_]*)?$', 'i'); // fragment locator

        $.each(text, function (index, splitted) {
            if (index == 0 && !pattern.test(splitted)) { // if the first letter and not look like a link then capitalize first letter
                splitted = splitted.substr(0, 1).toUpperCase() + splitted.substr(1);
            } else if (index == 0 && pattern.test(splitted)) {
                splitted = splitted.substr(0, 1).toLowerCase() + splitted.substr(1);
            }
            returnText += splitted + " ";
        });
        returnText = $.trim(returnText)

        $(inputTag).val(returnText);
    },

    onResume: function () {
        console.log("on resume");

    },

    // on page define function
    recent: null,
    trending: null,
    commonPopupTakePhoto: null,
    commonPopupTakeVideo: null,
    BadWord: null,
    refresh: null,

}


//////////////////////////////////// begin custom console ///////////////////////////////

customNamespace.console = function (anything) {
    //console.log(anything);
    var data = anything;
    var profileId = loginNameSpace.loggedUserID;

    try {
        var msg = JSON.stringify(anything) + '<br>';
    } catch (err) {
        var msg = anything + '<br>';
    }

    $('#debugDivText').prepend(msg);

    $('#debugDiv').hide();
    if (profileId == 264) {
        $('#debugDiv').show();
    }
}

//////////////////////////////////// end custom console ///////////////////////////////

//////////////////////////////////// begin custom substring ///////////////////////////////

customNamespace.subString = function (someString, start, end) {
    if (someString.length < end) { return someString }
    var cutted = someString.substring(start, end);
    var lastSpace = cutted.lastIndexOf(" ");
    var desired = cutted.substring(start, lastSpace) + "...";
    if ((end - lastSpace) > 10) {
        desired = cutted.substring(start, end) + "...";
    }
    return desired;
}

//////////////////////////////////// end custom substring ///////////////////////////////

//////////////////////////////////// begin hide show event on keyboard hide show ///////////////////////////////

customNamespace.softKeyboardCheck = 0;
customNamespace.onKeyboardHide = function (event) {

    if (loginNameSpace.profileHandle != null) {
        $('#commonForAllPagePreventFlashSolution').show();
        $('input').css('height', '+=1').css('height', '-=1');
        $('[ui-header]').css('top', '0');
        $('[data-role=footer]').css('bottom', '-1px');
        $('[data-role=footer]').css('padding-bottom', '1px');   
        
        //$('.Id-customHeader').show(); // show custom header for specific page
        customNamespace.sizing();
    }
}
customNamespace.onKeyboardShow = function () {

    if (loginNameSpace.profileHandle != null) {
        $('#commonForAllPagePreventFlashSolution').hide();
        //$('.Id-customHeader').hide(); // hide custom header for specific page
    	//customNamespace.sizing();
    }
}

customNamespace.toggleHeaderandFooterOnInput = function () {

    var onFocus = function () {
        customNamespace.softKeyboardCheck += 1;
        $('#commonForAllPagePreventFlashSolution').hide();
    };

    var onBlur = function () {
        customNamespace.softKeyboardCheck -= 1;

        setTimeout(function () {
            if (customNamespace.softKeyboardCheck == 0) {

                setTimeout(function () {
                    $('#commonForAllPagePreventFlashSolution').show();
                    $('.postMedia').css('height', '+=1').css('height', '-=1');
                }, 100);
            }
        }, 500);

    };

    // hide footer and header on typing
    $('[type=text]').on('focus', onFocus);
    $('[type=text]').on('blur', onBlur);
    $('textarea').on('focus', onFocus);
    $('textarea').on('blur', onBlur);
    $('select').on('focus', onFocus);
    $('select').on('blur', onBlur);
}

//////////////////////////////////// end hide show event on keyboard hide show  ///////////////////////////////


document.addEventListener("resume", customNamespace.onResume, false);

window.addEventListener("native.keyboardshow", customNamespace.onKeyboardShow);

window.addEventListener("native.keyboardhide", customNamespace.onKeyboardHide);


//////////////////////////////////// page event ///////////////////////////////////////////

customNamespace.page = {};
customNamespace.page.event = {};
customNamespace.page.event.var = {};
customNamespace.page.event.var.refresh = true;
customNamespace.page.event.var.modify = function(name,value){
    customNamespace.page.event.var[name] = value;    
};
customNamespace.page.event.onPageShow = function () {

    //console.log("viewing: " + document.URL);
    customNamespace.checkPageIdtoAppendOrnot();

    scrollNamespace.var.modify('getMoreButton', '.getMore');

    $('a').each(function () { $(this).attr('data-transition', 'none'); });

    notificationNameSpace.getNotificationCount();
    fansNameSpace.getNotificationCount();

    //customNamespace.commonPopupTakePhoto = function () {
    //    $('#topostView').trigger('click');
    //    postNameSpace.track = 'topost';
    //    cameraApp._capturePhoto();
    //}

    //customNamespace.commonPopupTakeVideo = function () {
    //    $('#topostView').trigger('click');
    //    postNameSpace.track = 'topost';
    //    recordVideoNameSpace.CaptureVideo();
    //}


    $("#commonCapturePopupTakeVideo").show();

    // set li tag display at footer
    //$('#capturePhotoButtonli').show();
    //$('#takePhotoForGameCenterli').hide();
    //$('#takePhotoForTeamPageli').hide();
    //$('#takePhotoForCommentli').hide();

    // hide all 2 and 3 panels fixed position 
    $('#tabbedPanelstwo').hide();
    $('#tabbedPanelsthree').hide();
    $('#tabbedPanelstwoForFanPage').hide();

    // hide refresh button
    $('#refresh').hide();
    scrollNamespace.refreshOnnPageDefinedCall();

    // renew scroll function
    //scrollNamespace.refreshOnnPageDefinedCall();

    $('.flagPostId').hide();
    $('.notificationCountFromFeed').hide();

    // title onclick function
    //$("#dropdown").removeAttr("href");
    //customNamespace.addBackButton();

    // initilize search popup
    $('#searchPopup').popup();

    try{
    var activePage = $.mobile.activePage.attr('id');
    } catch(err){ var activePage = 'undefined' } ;
    customNamespace.page.event.var.refresh = true ;
}

customNamespace.page.goTo = function ( url ) {
    
    var getHtmlName = function( urlString ){
        var currentPageUrlAsArray = urlString.split('/');
        return currentPageUrlAsArray[ currentPageUrlAsArray.length - 1 ] ;
    }    
    var determineIfGoToViewsOrGetOut = function( url ){
        var currentPageUrl = document.URL ;
        if( currentPageUrl.search( '/views/' ) != -1 ){
            url = '../../' + url ;
        } else {
            url = url ;
        }
        console.log( url )
    	location.hash = url ;

    }
    
   	determineIfGoToViewsOrGetOut( url )
}

//////////////////////////////////// page event ////////////////////////////////////////////

customNamespace.display = {};
customNamespace.display.html = function ( dataObject ,  templateId , displayId ) {
    
    var data = dataObject ;
    var source   = $( '#' + templateId ).html();
    var template = Handlebars.compile(source);
    var context = data ;
    var html = template(context);
    if( displayId != undefined ) { $('#' + displayId).html( html ) };
    return html ;
}

customNamespace.string = {} ;
customNamespace.string.shortenUrl = function( text , templateId ){
    
    templateId = templateId == undefined ? 'index-shortenedUrl-template' : templateId ;

    var geturl = function(url){

        url = url.substr( 0, 12).search( 'https://') != -1 ? url.replace('https://','')  : url ;
        url = url.substr( 0, 12).search( 'http://') != -1 ? url.replace('http://','') : url  ;
        url = url.substr( 0, 12).search( 'www.') != -1 ? url.replace('www.','') : url ;
        url = url.search( '/') != -1 ? url.substr( 0, url.search( '/') ) : url ;
        return url;
    }
    
    var urlRegex = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;  
    text = text.replace(urlRegex, function(url) {
        return customNamespace.display.html( { url : url , shortenedUrl : geturl(url) } , templateId ) ;
    })

    return text ;
}



customNamespace.format = {};
customNamespace.format.dateAsDuration = function ( time ) {

    time = moment( time ).utc().locale("en").fromNow( true ) ;
    time = time.replace( 'seconds' , '1m').replace( 'a minute' , '1m').replace(' minutes', 'm');
    time = time.replace( 'an hour' , '1h').replace( ' hours' , 'h');
    time = time.replace( 'a day' , '1d').replace( ' days' , 'd');
    time = time.replace( 'a month ' , '1mon').replace( ' months' , 'm');
    time = time.replace( 'a year' , '1y').replace( ' years' , 'y');
    time = time.replace( 'a few' , '')

    time = time.trim() ;


    return time ;
}
customNamespace.format.nFormatter = function(num) {
    if( isNaN( num ) == true){ console.log( 'num is not a number' ); return 0 ; }
    var sign = num < 0 ? '-' : '' ;
    num = Math.abs(num) ;
    var formattedNumber = num ;
    formattedNumber = num >= 1000 ? Math.floor(num / 1000).toFixed(0).replace(/\.0$/, '') + 'k+' : formattedNumber;
    formattedNumber = num >= 1000000 ? Math.floor(num / 1000000).toFixed(0).replace(/\.0$/, '') + 'M+' : formattedNumber;
    formattedNumber = num >= 1000000000 ? Math.floor(num / 1000000000).toFixed(0).replace(/\.0$/, '') + 'G+' : formattedNumber;
    
    formattedNumber = sign + formattedNumber ;
    return formattedNumber;
}

customNamespace.image = {};
customNamespace.image.var = {};
customNamespace.image.var.thumbnailSize = 100;
customNamespace.image.var.fullWidthSize = 200;
customNamespace.image.resize = function ( url , width ) {
    return domainNameSpace.name + '/?alttemplate=PluginImageGen&width=' + ( width || 100 ) + '&url=' + url ;
}
customNamespace.image.resizeAsThumbnail = function ( url ) {
    url = url.trim();
    var type = url.trim().substring( url.trim().length - 4 , url.trim().length ) ;
    if( url == '' || url == undefined || url.trim().substring(0,4) != 'http' || type == '.gif' || url.search('alttemplate=PluginImageGen' ) != -1  ){ return url ; }
    return domainNameSpace.name + '/?alttemplate=PluginImageGen&width=' + customNamespace.image.var.thumbnailSize + '&url=' + url ;
}
customNamespace.image.resizeAsFullWidth = function ( url ) {
    url = url.trim();
    var type = url.trim().substring( url.trim().length - 4 , url.trim().length ) ;
    if( url == '' || url == undefined ||  url.trim().substring(0,4) != 'http' || type == '.gif' || url.search('alttemplate=PluginImageGen' ) != -1  ){ return url ; }
    return domainNameSpace.name + '/?alttemplate=PluginImageGen&width=' + customNamespace.image.var.fullWidthSize + '&url=' + url ;
}

customNamespace.image.defineDefaultSize = function () {
    $(document).ready( function(){
        customNamespace.image.var.thumbnailSize = $( '.' + 'Id-SampleThumbnailSize' ).width() * 2 || customNamespace.image.var.thumbnailSize;
        customNamespace.image.var.fullWidthSize = $( 'body' ).width() < customNamespace.image.var.fullWidthSize ? customNamespace.image.var.fullWidthSize :  $( 'body' ).width() ;       

    });
}
customNamespace.image.defineDefaultSize(); 

customNamespace.header = {};
customNamespace.header.var = {};
customNamespace.header.var.titleOnclick = {} ;
customNamespace.header.changeTitle = function( data , onSuccess , onFail ){
    var name = data.onclick == undefined || data.backButton == true ? '<i class="fa fa-angle-left"></i> &nbsp;' + data.text : data.text ;
    var html = data.html ;
    
    var titleOnclick = typeof data.onclick == 'undefined'  ? function(){ history.back(); } : data.onclick ;

    $('#dropdown' ).html( html || name );
    customNamespace.header.var.titleOnclick = titleOnclick ;
    
    customNamespace.header.shrinkTitle( data );
}
customNamespace.header.shrinkTitle = function( data , onSuccess , onFail ){   
    data = data == undefined ? {} : data ;
    var headerBtnsWidth = $('.headerBtns').width();
    var titleWidth = $('body').width() - headerBtnsWidth - ( data.extraPadding || 0 ) ;
    var id =  data.Id == undefined ? '#dropdown' : data.Id ;
    titleWidth = data.size == undefined ? titleWidth : titleWidth + data.size ;
    $( id ).css('width', titleWidth + 'px') ;
}



customNamespace.popup = {};
customNamespace.popup.var = {};
customNamespace.popup.var.onBottomButtonClick = function(){};
customNamespace.popup.show = function( data , onSuccess , onFail ){
    
    data = typeof data === 'string' ? { msg : data } : data ;
    $('#index-commonAlertPopup-head').html( data.name || 'FanReact');
    $('#index-commonAlertPopup-msg').html( data.msg || '' );
    if( typeof data.onBottomButtonClick == 'undefined' ){
        data.onBottomButtonClick = function(){ $('#index-commonAlertPopup').popup('close') }
    }
    customNamespace.popup.var.onBottomButtonClick = data.onBottomButtonClick ;
    $('#index-commonAlertPopup').popup('open');
};
customNamespace.popup.takeUrlAsLink = function( data , onSuccess , onFail ){
    
    $('#commonCapturePopup').find('.Id-input').val('');
    if( navigator.connection.type != 'none' ){ $('#commonCapturePopup').find('.Id-input').show(); }
    if( navigator.connection.type == 'none' ){ $('#commonCapturePopup').find('.Id-input').hide(); }
    customNamespace.popup.var.takeUrlOnChange = data.onChange ;
};

customNamespace.screen = {};
customNamespace.screen.orientation =  function( type ){
	try{
    	type == 'unlock' ? window.screen.unlockOrientation() : window.screen.lockOrientation( 'portrait' );
    } catch(err){}
}


customNamespace.collection = { interval : {} };

customNamespace.compileAngularElement = function( elSelector) {
    elSelector = elSelector || '#' + $.mobile.activePage.attr('id');

    var elSelector = (typeof elSelector == 'string') ? elSelector : null ;  
        // The new element to be added
    if (elSelector != null ) {
        var $div = $( elSelector );

        // The parent of the new element
        var $target = $("[ng-app]");

      angular.element($target).injector().invoke(['$compile', function ($compile) {
                var $scope = angular.element($target).scope();
                $compile($div)($scope);
                // Finally, refresh the watch expressions in the new element
                $scope.$apply();
            }]);
    }

}

// check if app is in foreground of background 
document.addEventListener("resume", function () {
    customNamespace.isViewing = true;
}, false);
document.addEventListener("pause", function () {
    customNamespace.isViewing = false;
}, false);

