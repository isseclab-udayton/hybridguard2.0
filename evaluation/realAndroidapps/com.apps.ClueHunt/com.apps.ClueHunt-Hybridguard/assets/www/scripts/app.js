(function (global) {
    var app = global.app = global.app || {};

    document.addEventListener('deviceready', function () {
        $("#imgfs").hide();               

        app.application = new kendo.mobile.Application(document.body, { skin: "flat" });
        
        openDB();
        initDB();
        
        if(AdMob) {
            AdMob.prepareInterstitial( {adId:"ca-app-pub-8426536886162187/6982725350", autoShow:false} );
            AdMob.createBanner( {
                adId:"ca-app-pub-8426536886162187/5439575758", 
                position:AdMob.AD_POSITION.BOTTOM_CENTER, 
                overlap:true,
                autoShow:false} );
        }
        
        navigator.splashscreen.hide();
    }, false);
    
    //document.addEventListener('onInterstitialDismiss', onDismissInterstitialAd);
})(window);



function NavigateToPage(strURL, strTransition) {
    var app = kendo.mobile.application;
    if (!(strTransition)) strTransition = 'slide';
    app.navigate(strURL, strTransition);
}

function viewhome_init() {
    $("#divhomebtn1").css({'left': '-500px', 'right': '500px'});
    $("#divhomebtn2").css({'left': '500px', 'right': '-500px'});
    $("#imgkid").hide();
    $("#imgkid").css({'margin-right': '-248px'});
    $("#imgfs").get(0).src = 'img/footsteps.gif';
    $("#imgfs").show();
    $("#imgkid").get(0).src = 'img/walking.gif';
    $("#imgInfo").hide();
}

function viewhome_show(e) {
    g_intCurrentIndex = 0;
    g_arrCPs = null;
    g_blnSaved = false;
    g_blnDidSetup = false;
    g_strCourseName = null;
    setTimeout(function() {
        if ($("#divhomebtn1" ).css("left") !== '0px')
        {
            $("#divhomebtn1").animate({
                left: "0px",
                right:"0px"
            }, 2000, function() {
                // Animation complete.
            });
            $("#divhomebtn2").animate({
                left: "0px",
                right:"0px"
            }, 2000, function() {
                // Animation complete
                
                //show info btn
                $( "#imgInfo" ).fadeIn( "slow", function() {
                    // Animation complete
                });
            });
            $("#imgkid").show();
            $("#imgkid").animate({
                "margin-right": "-45px"
            }, 5500, 'linear', function() {
                $("#imgkid").get(0).src = 'img/blinky2.gif';
            });
        }
    }, 3000);
    playTheme('Theme.mp3');
}

function ShowSavedCourses()
{
    NavigateToPage('#viewSavedCourse');
}

function padLeft(strText, paddingValue) {
   return (paddingValue + strText).slice(-paddingValue.length);
}

function GetTimeDifference(dtDateStart, dtDateEnd)
{
    if (dtDateStart > dtDateEnd) return "0 secs";
    var msec = dtDateEnd - dtDateStart;
    // 28800000 milliseconds (8 hours)

    var days = Math.floor(msec / 1000 / 60 / 60 / 24);
    msec -= days * 1000 * 60 * 60 * 24;
    var hh = Math.floor(msec / 1000 / 60 / 60);
    msec -= hh * 1000 * 60 * 60;
    var mm = Math.floor(msec / 1000 / 60);
    msec -= mm * 1000 * 60;
    var ss = Math.floor(msec / 1000);
    //msec -= ss * 1000;
    
    var strReturn = '';
    var strLabel = 'day';
    if (days > 0) {
        if (days > 1) strLabel = 'days';
        strReturn = days + ' ' + strLabel + ', ';
    }
    var strHr = '' + hh;
    strHr = padLeft(strHr, '00');
    strReturn += strHr + ':';

    var strMin = '' + mm;
    strMin = padLeft(strMin, '00');
    strReturn += strMin + ':';

    var strSec = '' + ss;
    strSec = padLeft(strSec, '00');
    strReturn += strSec;
    
	return strReturn;
}

function LoadDropDown(strDropDown, strTemplate, strJSON)
{
    var template = kendo.template($("#" + strTemplate).html());
    var dataSource = new kendo.data.DataSource({
        data: strJSON,
        change: function () {
            $("#" + strDropDown).html(kendo.render(template, this.view()));
        }
    });
    dataSource.read();
}

function SetupCourse()
{
    g_intCurrentIndex = 0;
    g_objCourse = new clsCourse();
    g_arrCPs = new Array();
    playTheme('Setup.mp3');
    NavigateToPage("setupcourse.html");
}

function IsDebug()
{
    return (document.location.pathname.indexOf("Simulator") >= 0);
}

function GetParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function MsgBox(strMessage, strTitle)
{
    if (!strTitle) strTitle = "Clue Hunt";
    navigator.notification.alert(strMessage, null, strTitle, 'OK');
}

function ShowWait() {    
    kendo.mobile.application.showLoading();
}

function HideWait() {
    kendo.mobile.application.hideLoading();
}

var g_objMedia = null;
var g_strCurrentMedia = null;
var g_blnReplay = false;

function playTheme(strFile) {
    if (g_strCurrentMedia) {
        //check if already playing
        if (g_strCurrentMedia === strFile)
        {
            g_objMedia.getCurrentPosition(
                // success callback
                function(position) {
                    var intDur = g_objMedia.getDuration();

                    if (position > -1 && position < intDur) {
                        //already playing, so all good
                    }
                    else
                    {
                        //start 'er up again
                        g_strCurrentMedia = null;
                        playTheme(strFile);
                    }
                },
                // error callback
                function(e) {
                    console.log("Error getting pos=" + e);
                }
            );
            //Check whether to restart it or ignore
            return;            
        }
    }
    g_strCurrentMedia = strFile;
    
    g_blnReplay = false;
    if (g_objMedia) g_objMedia.stop();
    
    var path = "";
    var devicePlatform = device.platform;
    if (devicePlatform === "iOS") {
        path = "media/" + strFile;
    } else if (devicePlatform === "Android" || devicePlatform === 'android') {
        path = "/android_asset/www/media/" + strFile;
    }
    g_objMedia = new Media(path, onAudioSuccess, onAudioError, onStatus);
    g_objMedia.play({numberOfLoops: 1});

    g_blnReplay = true;
};

function playSoundEffect(strFile)
{
    var path = "";
    var devicePlatform = device.platform;
    if (devicePlatform === "iOS") {
        path = "media/" + strFile;
    } else if (devicePlatform === "Android" || devicePlatform === 'android') {
        path = "/android_asset/www/media/" + strFile;
    }
    var objMedia = new Media(path, onAudioSuccess, onAudioError);
    objMedia.play({numberOfLoops: 1});
}

function onAudioSuccess()
{ 
}

function onAudioError(error) 
{
    console.log('code: ' + error.code + ', message: ' + error.message);

}

function onStatus(status) {
    if (g_blnReplay === true && status === Media.MEDIA_STOPPED ) {
        g_objMedia.play({numberOfLoops: 1});
    }
}

function DismissFooter(objImg, blnShowBannerAd)
{
     $(objImg).parent().hide();
    if (IsDebug() === false && blnShowBannerAd === true) if (AdMob) AdMob.showBanner(AdMob.AD_POSITION.BOTTOM_CENTER);
}