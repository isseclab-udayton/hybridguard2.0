var g_intCurrentIndex = 0;

function PlayStart(e)
{
    if (g_arrCPs === null) {
        TestCourseSetup();
    }

    if (g_strCourseName) {
       $('#lblCourseName').text(g_strCourseName);
       $('#divCourseName').show(); 
    }
    else $('#divCourseName').hide();
    
    g_dtStartTime = null;
    
    playTheme('Theme.mp3');
    
    //if (IsDebug() === false) if (AdMob) AdMob.showInterstitial();    
}

function onDismissInterstitialAd(data)
{
}

function TestCourseSetup(e)
{
    g_intCurrentIndex = 0;
    g_strCourseName = 'Demo Course';
    g_arrCPs = new Array();
    
    var objCP = new Checkpoint();

    objCP.Clue = 'A home away from home. Except smaller.';
    objCP.Image = 'img/cubby.jpg';
    objCP.CodeNum = '123';
    
    g_arrCPs[0] = objCP;
}

function StartCourse()
{
    if (IsDebug() === false) if (AdMob) AdMob.hideBanner();
    
    if (g_arrCPs.length === 0) {
        TestCourseSetup();
    }
    
    console.log('g_dtStartTime = ' + g_dtStartTime);
    
    NavigateToPage('#p_viewclue');
    playTheme('Game.mp3');
}

function GetCurrentClue(e)
{
    if (g_dtStartTime === null) {
        $('#divStart').show();
        $('#imgStart').show();
        setTimeout(AnimateStart1, 500);
    }
    else {
        $('#divStart').hide();
        $('#imgStart').hide();
    }
    
    var objClue = g_arrCPs[g_intCurrentIndex];
    
    $('#p_lblClue').text(objClue.Clue);
    $('#p_imgClue').get(0).src = objClue.Image;
    
    e.view.options.title = 'Clue ' + (g_intCurrentIndex + 1) + ' of ' + g_arrCPs.length;
}

function AnimateStart1()
{
    $('#imgStart').get(0).src = 'img/TalkStart2.png';
    setTimeout(AnimateStart2, 500);
}

function AnimateStart2()
{
    $('#imgStart').get(0).src = 'img/TalkStart3.png';
    setTimeout(AnimateStart3, 500);
}

function AnimateStart3()
{
    $('#imgStart').get(0).src = 'img/TalkStart4.png';
    $('#imgStart').animate({
        bottom: "-480px"
    }, 500, function() {
        $('#imgStart').get(0).src = 'img/TalkStart1.png';
        $('#divStart').hide();
        g_dtStartTime = new Date();
        $('#imgStart').css('bottom', '0px');
    });    
}

function ThisIsTheFunction()
{
    var strUserCode = $('#p_txtCode').val();
    var objClue = g_arrCPs[g_intCurrentIndex];
    if (objClue.CodeNum.toUpperCase() === strUserCode.toUpperCase()) {
        g_intCurrentIndex++;
    	//navigator.notification.alert("You found it!  Congratulations!", ProperCodeReturn);
        $('#divFound').show();
        playSoundEffect('KidsCheering.mp3');
        setTimeout(ProperCodeReturn, 4000);
    }
    else
    	navigator.notification.alert("Sorry, that's not the right code. Keep Looking!");
}

function ProperCodeReturn() {
    //console.log("ProperCodeReturn");
    $('#divFound').hide();
    $('#p_txtCode').val('')
    if (g_intCurrentIndex >= g_arrCPs.length) {
        g_dtEndTime = new Date();
        
        //console.log(g_dtStartTime);
        $('#p_lblCourseTime').text(GetTimeDifference(g_dtStartTime, g_dtEndTime));
        g_dtStartTime = null;
    	NavigateToPage('#p_viewEnd');
    }
    else
    	NavigateToPage('#p_viewclue', 'slide:right');
}

function RestartCourse() {
    g_intCurrentIndex = 0;
    NavigateToPage('#p_viewmain', 'overlay:down');
    if (IsDebug() === false) if (AdMob) AdMob.showInterstitial();
}

function AbortMission() {
    navigator.notification.confirm('Are you sure you want to give up?', AbortMissionConfirmed, 'Cancel Course', 'Yes,No');
}

function AbortMissionConfirmed(intBtn)
{
    if (intBtn === 1) {
		MsgBox("Better luck next time!");
        if (IsDebug() === false) if (AdMob) AdMob.showBanner(AdMob.AD_POSITION.BOTTOM_CENTER);
        NavigateToPage('#p_viewmain', 'slide:right');
    }
}

function p_viewEndShow(e)
{
    $('#divTime').hide();
    $('#divDance').hide();
    $('#divTalk').show();
    $('#imgDance').css('margin-right', '-236px');
    $('#imgDance').get(0).src = 'img/walking.gif';
    setTimeout(AnimateTalk1, 500);
    if  ((g_blnDidSetup === true) && (g_blnSaved === false)) {
        $('#divDidSetup').show();
    }
    else {
        $('#divDidSetup').hide();
    }
    playTheme('Complete.mp3');
}

function AnimateTalk1()
{
    $('#imgTalk').get(0).src = 'img/Talky2.png';
    setTimeout(AnimateTalk2, 1000);
}

function AnimateTalk2()
{
    $('#imgTalk').get(0).src = 'img/Talky3.png';
    setTimeout(AnimateTalk3, 600);
}

function AnimateTalk3()
{
    $('#imgTalk').get(0).src = 'img/Talky4.png';
    setTimeout(function () { $('#divTime').show(); }, 200);
    $('#divTalk').attr('onclick', 'CloseTalkDiv();');
}

function CloseTalkDiv()
{
    if (IsDebug() === false) if (AdMob) AdMob.showBanner(AdMob.AD_POSITION.BOTTOM_CENTER);
    $('#divTalk').removeAttr('onclick');
    $('#imgTalk').get(0).src = 'img/Talky1.png';
    $('#divTalk').hide();
    $('#divDance').show();
    $("#imgDance").animate({
        'margin-right': "-38px"
    }, 2000, 'linear', function() {
        $('#imgDance').get(0).src = 'img/dancing.gif';
    });
}

function BackToMain()
{
    if ((g_blnDidSetup === true) && (g_blnSaved === false))
    {
        navigator.notification.confirm('This course has not yet been saved.  Would you like to save it now?', SaveCourseConfirmed, 'Save Course', 'Yes,No');
    }
    else {
        if (IsDebug() === false) if (AdMob) AdMob.hideBanner();
        NavigateToPage("index.html", "overlay:up");
    }
}

function SaveCourseConfirmed(intBtn)
{
    if (intBtn === 1) 
        NavigateToPage('savecourse.html', 'slide:left');
    else
    	NavigateToPage("index.html", "overlay:up");
}

function ShowFullImage(objImg)
{
    $('#imgFull').get(0).src = objImg.src;
    NavigateToPage("#p_viewImgZoom");
}