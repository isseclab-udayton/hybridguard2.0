function CancelGame()
{
   navigator.notification.confirm('Are you sure you want to cancel the setup of this course?', CancelGameConfirmed, 'Cancel Course', 'Yes,No');
}

function CancelGameConfirmed(intBtn)
{
    if (intBtn === 1) {
        if (IsDebug() === false) if (AdMob) AdMob.hideBanner();
        NavigateToPage('index.html','slide:right');
    }
}

function MainRefresh(e)
{
    $('#divSetupTalk').hide();
    
    if (g_arrCPs.length === 0)
    {
        $('#s_btnDone').hide();
        $('#s_divTable').hide();
        
        //if (IsDebug() === false) if (AdMob) AdMob.showInterstitial();
        if (localStorage.getItem("CompletedASetup") === null)
        {
            $('#imgSetupTalk').get(0).src = 'img/Setup.png';
            $('#divSetupTalk').show();
        }
        else
            if (IsDebug() === false) if (AdMob) AdMob.showBanner(AdMob.AD_POSITION.BOTTOM_CENTER);  
    }
    else {
        if (g_arrCPs.length === 1 && localStorage.getItem("CompletedASetup") === null) {            
            if (IsDebug() === false) if (AdMob) AdMob.hideBanner();
            $('#imgSetupTalk').get(0).src = 'img/FirstCP.png';
            $('#divSetupTalk').show();           
        }
        
        $('#s_btnDone').show();
        $('#s_divTable').show();
        $("#s_tblcheckpoints").html(kendo.render(kendo.template($("#s_cpTemplate").html()), GetCheckpointData()));
        $("#s_tblcheckpoints").kendoTouch({
            filter: ">li",
            enableSwipe: true,
            touchstart: sc_touchstart,
            tap: sc_navigate,
            swipe: sc_swipe
        });
    }
}

function sc_navigate(e) {
    $('.delete').hide();
    intID = parseInt($(e.touch.target).find(".hidden").text())
    EditClue(intID);
}

function sc_swipe(e) {
    $('.delete').hide();
    var button = kendo.fx($(e.touch.currentTarget).find("[data-role=button]"));
    button.expand().duration(200).play();
    g_blnDeleteRun = false;
}

function sc_touchstart(e) {
    var target, listview, button, intID;
    
    target = $(e.touch.initialTouch);
    listview = $("#s_tblcheckpoints").data("kendoMobileListView");
    button = $(e.touch.target).find("[data-role=button]:visible");

    if (target.closest("[data-role=button]")[0]) {
        intID = parseInt($(e.touch.target).find(".hidden").text())
        $(e.touch.target).slideUp();
        
        DeleteCheckPoint(intID);
        //prevent `swipe`
        this.events.cancel();
        e.event.stopPropagation();
    } else if (button[0]) {
        button.hide();
        //prevent `swipe`
        this.events.cancel();
    } else {
        listview.items().find("[data-role=button]:visible").hide();
    }
}

var g_blnDeleteRun = false;

function DeleteCheckPoint(intID)
{
    if (g_blnDeleteRun === true) return;
    g_blnDeleteRun = true;
    //fruits.splice(2, 2);
    var arrNew = new Array();
    var intIndex = 0;
    for (var i = 0; i < g_arrCPs.length; i++)
    {
        if (i !== (intID - 1)) {
            arrNew[intIndex] = g_arrCPs[i];
            arrNew[intIndex].Index = (intIndex + 1);
            intIndex++;
        }
    }
    g_arrCPs = arrNew;
}

function GetCheckpointData()
{
    return JSON.parse(JSON.stringify(g_arrCPs));
}

function LoadRiddles()
{
    CreateRiddleJSON();
    LoadDropDown('s_ddRiddle', 's_tRiddle', g_objRiddleJSON);
}

function NewCheckpoint(e)
{
    $('#s_txtClue').val('');
    $('#s_txtCode').val('');
    $('#divPhoto').hide();
    NavigateToPage('#s_viewcheckpoint');
}

function s_getRiddle()
{
    $('#s_txtClue').val($('#s_ddRiddle').val());
}

function ValidateCP1()
{
	if ($('#s_txtClue').val().length === 0) MsgBox('Please enter a clue.');
	else NavigateToPage('#s_viewcheckpoint2');
}

function ValidateCP2()
{
    if ($('#imgPhoto').get(0).src.length === 0) MsgBox('Please take a photo.');
	else NavigateToPage('#s_viewcheckpoint3');
}

function PlaceCheckpoint()
{
    if ($('#s_txtCode').val().length === 0) {
    	MsgBox('Please enter a code that can be found at the checkpoint');
    	return;
    }

    var cp;
    
    if (g_objCP) cp = g_objCP;
    else cp= new Checkpoint();
    
	cp.Clue = $('#s_txtClue').val();
    cp.CodeNum = $('#s_txtCode').val();
    cp.Display = '';
       
    if ($('#divPhoto').css('display') === 'none')
    {
        cp.Image = '';       
    }
    else
    {
        cp.Image = $('#imgPhoto').get(0).src;
    }
    if (g_objCP) {
        g_arrCPs[g_objCP.Index - 1] = cp;
        g_objCP = null;
    }
    else {
        cp.Index = g_arrCPs.length + 1;
    	g_arrCPs[g_arrCPs.length] = cp;
    }
    NavigateToPage('#s_viewmain','slide:right');
}

function ClueSetupBack()
{
	g_objCP = null;
	NavigateToPage('#s_viewmain', 'slide:right');
}

function EditClue(intIndex)
{    
    g_objCP = g_arrCPs[intIndex - 1];
    EditClueConfirmed(1);
    //navigator.notification.confirm('Would you like to edit clue # ' + intIndex + '?', EditClueConfirmed, 'Edit Checkpoint', 'Yes,No');
}

function EditClueConfirmed(intBtn)
{   
    $('#btnPC').focus();
    if (intBtn === 1) {
        $('#s_txtClue').val(g_objCP.Clue);
    	$('#s_txtCode').val(g_objCP.CodeNum);
        $('#imgPhoto').get(0).src = g_objCP.Image;
        NavigateToPage('#s_viewcheckpoint');
    }
    else g_objCP = null;
}

function FinishedSetup()
{
    navigator.notification.confirm('Are you finished setting up the course?', SetupCompleteConfirmed, 'Setup Complete', 'Yes,No');
}

function SetupCompleteConfirmed(intBtn)
{   
    if (intBtn === 1) {
        g_blnDidSetup = true;
        NavigateToPage('#s_viewchoice');
    }
}

function s_viewchoiceShow(e)
{
    $('#divDoneTalk').hide();
    if (localStorage.getItem("CompletedASetup") === null) {            
        if (IsDebug() === false) if (AdMob) AdMob.hideBanner();
        $('#divDoneTalk').show();
        localStorage.setItem("CompletedASetup", "true");
    }
    if (g_blnSaved === false) $('#s_divSave').show();
    else $('#s_divSave').hide();
}

//PhoneGap image capture ----------------------------------------------------------
function capturePhoto() {
    navigator.camera.getPicture(uploadPhoto,
        photoNotSelected,
        { quality: 50,        
        destinationType: navigator.camera.DestinationType.FILE_URI,
        sourceType: navigator.camera.PictureSourceType.CAMERA,
        encodingType: Camera.EncodingType.PNG,
        targetWidth: 1600,
        targetHeight: 1200}
        );
}

function uploadPhoto(imageURI) {
    movePic(imageURI);
}

function photoNotSelected(message) {

}

function uploadPhotoFail(error) { 
    switch (error.code) { 
        case FileTransferError.FILE_NOT_FOUND_ERR: 
            navigator.notification.alert("Photo file not found"); 
            break; 

        case FileTransferError.INVALID_URL_ERR: 
            navigator.notification.alert("Bad Photo URL"); 
            break; 

        case FileTransferError.CONNECTION_ERR:
            navigator.notification.alert("Connection error"); 
            break; 
    }
}

//File System Methods---------------------------------------------------------------

function movePic(file){ 
    if (IsDebug() === true) {
        $('#imgPhoto').get(0).src = file;
        $('#divPhoto').show();
    }
    else
    	window.resolveLocalFileSystemURI(file, resolveOnSuccess, resOnError); 
} 

//Callback function when the file system uri has been resolved
function resolveOnSuccess(entry){ 
    var d = new Date();
    var n = d.getTime();
    //new file name
    var newFileName = n + ".jpg";
    var myFolderApp = "ClueHunt";

    window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function(fileSys) {      
    //The folder is created if doesn't exist
    fileSys.root.getDirectory( myFolderApp,
                    {create:true, exclusive: false},
                    function(directory) {
                        entry.moveTo(directory, newFileName,  successMove, resOnError);
                    },
                    resOnError);
    },
    resOnError);
}

//Callback function when the file has been moved successfully - inserting the complete path
function successMove(entry) {
    $('#imgPhoto').get(0).src = entry.nativeURL;
    $('#divPhoto').show();
}

function resOnError(error) {
    console.log('Move to persistent storage failed: ' + JSON.stringify(error));
}
