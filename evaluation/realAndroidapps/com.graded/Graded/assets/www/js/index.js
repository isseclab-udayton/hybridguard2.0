String.prototype.cleanup = function() {
   return this.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "_");
}
String.prototype.cleanupNothing = function() {
   return this.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "");
}
var done = {
    classwork:false,
    grades:false,
    schedule:false,
    gpa:false
};
var count = 0;
var deviceInfo = 'Other';
var platform;
var preventInf = false;
var isEnable = 0;
var push;
var newVer;
var users;

var manifest;
var activeIndex;
var ads = [];
var errors= [];
var app = {
    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
        document.addEventListener("backbutton", this.onBackKeyDown, false);
    },
    onDeviceReady: function() {
        StatusBar.show();
        changeNav();
        navigator.geolocation.getCurrentPosition(function(geo){
            loc = geo;
            console.log("Location:");
            console.log(geo["latitude"], geo["longitude"]);
        },function(e){
            console.error(e);
        }
        );
        window.FirebasePlugin.grantPermission();
        notificationSetup();
        console.log(cordova);
        FastClick.attach(document.body);
        if(device.platform !== null && device.platform !== undefined) {
            deviceInfo = device.platform + ' ' + device.version;
        }

        document.addEventListener("offline", offline);
        if (navigator.notification) { // Override default HTML alert with native dialog
            window.alert = function (message) {
                navigator.notification.alert(
                    message,    // message
                    null,       // callback
                    "Graded", // title
                    'OK'        // buttonName
                );
            };
            window.confirm = function (message,callback,title,buttons) {
                navigator.notification.confirm(
                    message,    // message
                    callback,    // callback
                    title,
                    buttons
                );
            };

        }
        if (cordova.platformId == 'ios'|| window.navigator.vendor == "Apple Computer, Inc.") {
            StatusBar.overlaysWebView();
            $('#colorNav').addClass('iosNav');
            $('.main').addClass('iosBody');

            console.log(cordova);

        }
        if(navigator.platform == "iPhone"){
            $('#scale').attr("content","user-scalable=no, initial-scale=1.0, maximum-scale=0.9, minimum-scale=0.9, width=device-width");
        }else if(navigator.platform == "iPad"){
            $('#scale').attr("content","user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width");
        }
        
        window.FirebasePlugin.onNotificationOpen(function(success) {
            console.log(success);
        }, function(error) {
            console.log(error);
        });

    },
    onBackKeyDown: function(){
        if(window.location.hash.includes("#/class")){
            goBack(true);
        }else{
            goBack(false);
        }
    }


};
app.initialize();

$('document').ready(function() {
    var clipboard = new Clipboard('.btn');

    clipboard.on('success', function(e) {
        Materialize.toast("Copied.", 1000);
    });   
    $('select').material_select();
    $("#waiting").hide();
    if (localStorage.getItem('defaultPage') == 'classwork') {
        relocate = '#/classwork';
    }
    if (localStorage.getItem('dank') == 'true') {
        enableDank();
        isDank = true;
    }
    $(".button-collapse").sideNav();
    $.getJSON("https://app.graded.us/version", function (data) {
        if (platform == 'ios') {
            if (data['version'] > 1.0) {
                newVer = data;
            }
        } else {
            if (data['Android_version'] > 1.0) {
                newVer = data;
            }
        }
        manifest = data;
        if(data["alert"][1] != '' && data["alert"][0] != localStorage.getItem("alert")){
            Materialize.toast(data["alert"][1],data["alert"][2]);
            localStorage.setItem("alert",data["alert"][0]);
        }
    });
    // console.oldLog = console.log;

    // window.console.log = function(value)
    // {
    //     console.oldLog(value);
    //     if(typeof value == "object"){
    //         value = JSON.stringify(value);
    //     }
    //     errors.push(value);
    // };
    console.oldErr = console.error;

    window.console.error = function(value)
    {
        console.oldErr(value);
        if(typeof value == "object"){
            value = JSON.stringify(value);
        }
        errors.push(value);
    };

    users = localStorage.getItem("user_list");
    activeIndex = parseInt(localStorage.getItem("activeUser"));
    if (users != null){
        users = JSON.parse(users);
        if(users.length > 1){
            $("#lout").text("Log out all users");
        }
        for (u in users) {
            if(u == activeIndex) {
                $('#userbox').append('<li class="collection-item active" onclick="" id="user' + u + '"><div>' + users[u]["profile"]["name"] + '<a onclick="logUserOut('+u+',true)" class="secondary-content"><i class="material-icons">cancel</i></a></div></li>');
            }else{
                $('#userbox').append('<li class="collection-item"  id="user' + u + '"><div><span onclick="switchUser('+u+')">' + users[u]["profile"]["name"] + '</span><a class="secondary-content" onclick="logUserOut('+u+',false)"><i class="material-icons">cancel</i></a></div></li>');
            }
        }
    }
});
function notificationSetup(){
    window.FirebasePlugin.getInstanceId(function(token) {
        // save this server-side and use it to push notifications to this device
        localStorage.setItem('pushID',token);
        console.log("PUSH TOKEN: " + token);
    }, function(error) {
        console.error(error);
    });
}
function changeNav(){
    platform = cordova.platformId;
    var primaryColor = localStorage.getItem('primaryColor');
    var pColor = localStorage.getItem('pColor');
    console.log(primaryColor);
    if(primaryColor != null && pColor != null){
        $('.nav-wrapper').removeClass('purple').addClass(primaryColor);
        $('nav').removeClass('purple').addClass(primaryColor);
        $('#pColor').removeClass('profile darken-3').addClass(pColor + "");     
        
    }
    var darkerColor = localStorage.getItem('darkerColor');
    var iosColor = localStorage.getItem('iosColor');
    if(darkerColor != null){
        if(cordova.platformId == 'ios'){
            StatusBar.backgroundColorByHexString(iosColor);
        }else{
            StatusBar.backgroundColorByHexString(darkerColor);
        }

    }

}
function uSure(index){
    console.log(index);
    if(index==1){
        logOut();
    }
}
function appendMsg(html){
    $("#bulletin").append(html);
}
function noInternet(data){
    if(data["status"] == 0) {
        offline();
    }else{
        $('#loading').hide();
        $('#404').show();
        $('#code').text(data['status'] + " " + data.getResponseHeader('Error'));
        $('#traceback').append(data.getResponseHeader('Traceback-ID'));
        $("#errorPageBtn").attr("error", data.getResponseHeader('Error')).attr("traceback", data.getResponseHeader('Traceback-ID'));

        if(data.getResponseHeader('Traceback-ID') === null){
            $("#resp").show();
            $("#respframe").append(data["responseText"]);
        }
    }
    console.log(data);
}
function offline() {
    $('#404').hide();
    $('#loading').hide();
    $('#offline').show();
}
function reload(){
    location.reload();
}
function disableRefresh(){
    $('#refresh1').hide();
    $('#refresh2').hide();
}
function enableRefresh(){
    $('#refresh1').show();
    $('#refresh2').show();

}
function logUserOut(index,isActive){
    if(isActive){
        localStorage.setItem("activeUser","0");
    }
    delete users[index];
    users.splice(index, 1);
    $('#userbox').empty();
    for (u in users) {
        if(u == activeIndex) {
            $('#userbox').append('<li class="collection-item active" onclick="" id="user' + u + '"><div>' + users[u]["profile"]["name"] + '<a onclick="logUserOut('+u+',true)" class="secondary-content"><i class="material-icons">cancel</i></a></div></li>');
        }else{
            $('#userbox').append('<li class="collection-item"  id="user' + u + '"><div><span onclick="switchUser('+u+')">' + users[u]["profile"]["name"] + '</span><a class="secondary-content" onclick="logUserOut('+u+',false)"><i class="material-icons">cancel</i></a></div></li>');
        }
    }
    localStorage.setItem("user_list",JSON.stringify(users));
    if(users.length == 0){
        logOut();
    }

}
function switchUser(index){
    var a = users[index];
    localStorage.setItem("1", JSON.stringify(a));
    localStorage.setItem("activeUser",index.toString());
    reload();
}


function collapse(){
    if(count == 0) {
        $('#dropdown').css("transform", "rotate(180deg)");
        $(".profile-dropdown").css("height", "140px");
        count = 1;
    }else if(count == 1){
        $('#dropdown').css("transform", "rotate(0deg)");
        $(".profile-dropdown").css("height", "0px");
        count = 0;
    }
}
function logOut(){
    var temp = localStorage.getItem("pushID");
    localStorage.clear();
    localStorage.setItem("pushID",temp);
    window.location = 'signin.html'
}
function changeHeader(title, id){
    $(".active").removeClass("active");
    $("#" + id + "_nav_itm").addClass("active");
    $("#header").text(title);
}
function profile(name,school){
    $(document).ready(function(){
        $('#name').text(name);
        $('#school').text(school);
    });
}
function handleOpenURL(url) {
    var appName = url.replace("graded://login/", "");
    window.location = "auth.html#" + appName;
}
function hide(){
    $('.button-collapse').sideNav('hide');
}
function tabs(){
    $('.app').ready(function(){
        $('ul.tabs').tabs();
    });
}
function modal(){
    $('.app').ready(function(){
        $('.modal-trigger').leanModal({
                dismissible: true, // Modal can be dismissed by clicking outside of the modal
                opacity: .5, // Opacity of modal background
                in_duration: 300, // Transition in duration
                out_duration: 200, // Transition out duration
                complete: function(){$('.toast').show();}// Callback for Modal close
            }
        );
    });

}
function tabSwitch(a){
    if(a == 0){
        $('#one').show();
        $('#two').hide();
    }else{
        $('#two').show();
        $('#one').hide();
    }
}
function dummyLoad(loc){
    $('#dummy').ready(function(){
        window.location=loc;
    })
}
function launch(){
    $('.toast').hide();
}
function showThing(){
    $('.toast').show();
}
function checkBox(check){
    $("#" + check).attr("checked", true);
}
function hideGPAWarn(){
    if(hideDisclaimer === null){
        localStorage.setItem('hideDisclaimer','hide');
        hideDisclaimer = 'hide';
    }else if(hideDisclaimer !== null){
        hideDisclaimer = null;
        localStorage.removeItem('hideDisclaimer');
    }
}
function changeNavColor(newColor, pColor, darkerColor,iosNav){
    var oldColor = localStorage.getItem('primaryColor');
    $('.nav-wrapper').removeClass(oldColor).addClass(newColor);
    $('nav').removeClass(oldColor).addClass(newColor);
    $('#pColor').removeClass(oldColor).addClass(pColor + "");
    if(platform == 'ios'){
        StatusBar.backgroundColorByHexString(iosNav);
    }else{
        StatusBar.backgroundColorByHexString(darkerColor);
    }
    localStorage.setItem('primaryColor',newColor);
    localStorage.setItem('darkerColor',darkerColor);
    localStorage.setItem('iosColor',iosNav);
    localStorage.setItem('pColor',pColor);
}
function pathToDank(){
    if(isEnable == 10){
        Materialize.toast('Dank Memes option enabled in settings',4000);
        localStorage.setItem('showMemeOption','true')
    }else if(isEnable >= 5){
        Materialize.toast(10 - isEnable,2000)
    }
    isEnable+=1;
}
function goBack(t){
    if(t)
        transition("right");
    window.history.back();
}
function transition(type){
    var options = {
        "direction"        : type, // 'left|right|up|down', default 'left' (which is like 'next')
        "duration"         :  250, // in milliseconds (ms), default 400
        "iosdelay"         :  0, // ms to wait for the iOS webview to update before animation kicks in, default 60
        "androiddelay"     :  100, // same as above but for Android, default 70
        "winphonedelay"    :  70, // same as above but for Windows Phone, default 200,
    };
    window.plugins.nativepagetransitions.slide(
        options,
        function (msg) {console.log("success: " + msg)}, // called when the animation has finished
        function (msg) {alert("error: " + msg)} // called in case you pass in weird values
    );
}
function newMessage(){
    var snarkyMessages = ["Please Wait...", "...","Hold up...","Any day now...","\"Wait you must\" - Yoda...","-_______-","Patience is a virtue...not really","Fun Fact: Reedy is superior lol (Loading)"];
    $("#waitingText").text(snarkyMessages[Math.floor((Math.random() * 8) + 1)]);
}
function switchToBackBtn(){
    $(".button-collapse").addClass("hide");
    $(".back-btn").removeClass("hide");
}
function switchToMenuBtn(){
    $(".button-collapse").removeClass("hide");
    $(".back-btn").addClass("hide");
}
function dank(){
    if($("#dankToggler").text() == "Enable Dank Memes!"){
        enableDank();
        $("#dankToggler").text("Disable Dank Memes");
    }else{
        isDank = false;
        $("#dankToggler").text("Enable Dank Memes!");
        localStorage.setItem('dank','false');
        $('html').removeClass('dank');
        $('#pColor').removeClass('memes');

    }
}
function enableDank(){
    $('html').addClass('dank');
    $('#pColor').addClass('memes');
    isDank = true;
    localStorage.setItem('dank','true')
}


function changeLogoToDank(){
    $('#logo').attr('src','gradedLogo_dank.png');
    $('#ads').text('Click to Praise Pepe');
    $('#adLine1').text('Pepes make people smile. Thou shall hold a shrine for pepe in only one place!');
    $('#adLine2').text('-The Lit-George-cares policy')
}
function changeDefaultPage(a){
    localStorage.setItem('defaultPage',a)
}
function sendCreds(code){
    if(code != ""){
        code = code.toUpperCase();
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/redeemkey",
            data: {key:code,payload:JSON.stringify(credentials)},
            success: function(data){
                Materialize.toast("Request Sent");
            },
            error:function(err){
                
                console.error("=====QR CODE ERR=====");
                console.error(err);
                Materialize.toast("An error has occured");

            },
            dataType: "JSON"
        });
    }
}
function enterCode(){
    navigator.notification.prompt("Type in the code displayed", promptCallback, ["Graded App"], ["Done", "Cancel"]);

}
function promptCallback(r){
    console.log("BUTTON INDEX: " + r.buttonIndex + " TEXT: " + r.input1);
    if(r.buttonIndex == 1){
        var code = r.input1.toUpperCase();
        if(code.length !== 6){
            Materialize.toast("Invalid Code");
        }else{
            console.log(JSON.stringify(credentials));
            sendCreds(code);
        }
    }
}
function scanQRCode(){
    cordova.plugins.barcodeScanner.scan(
        function (result) {
            console.log("We got a barcode\n" +
                "Result: " + result.text + "\n" +
                "Format: " + result.format + "\n" +
                "Cancelled: " + result.cancelled);
            sendCreds(result.text.toUpperCase());
        },
        function (error) {
            alert("Scanning failed: " + error);
        }
    );
}
function notifInFive(){
    var now = new Date().getTime(),
    _5_sec_from_now = new Date(now + 5*1000);
    var sound = cordova.platformId == 'android' ? 'file://sound.mp3' : 'file://sound.wav';
    cordova.plugins.notification.local.schedule({
        title: "Delayed 5s Notification",
        text: "Yep",
        at: _5_sec_from_now,
        id:3,
        led: "FF0000",
        icon: "res://notification_info.png",
        smallIcon: "res://notification_info.png",
        sound: sound
    });
}
function cancelNotifs(){
    var i = parseInt(prompt("ID"));
    cordova.plugins.notification.local.cancel(i, function () {
        Materialize.toast("Canceled Notif " + i, 3000)
        showNotifs();
    });

}
function showNotifs(){
    cordova.plugins.notification.local.getScheduled(function (notifications) {
        $("#notifContainer").empty();
        console.log(notifications)
        for(notif in notifications){
            $("#notifContainer").append("<p>" + notifications[notif]["title"] + " " + notifications[notif]["text"] + "  -  " + new Date(notifications[notif]["at"] * 1000));
        }
    });
}
function reportBug(qry){
    var error = $(qry).attr("error");
    var traceback = $(qry).attr("traceback");
    var d = moment().format('YYYY-MM-DD');
    var url = "https://docs.google.com/forms/d/e/1FAIpQLSfJYFbIh8cZFZy1i-49eRAubNLFrwNswDQrlkML5-VC6LO8Bw/viewform?entry.1440668453="+d+"&entry.89810113=&entry.1188222071="+error+"&entry.811591391="+traceback+"&entry.1617325770="+credentials.link + "&entry.614988761=" + credentials.username;
    window.open(url, "_system");
}
function newPushNotification(message,txt,num,time){
    var now = new Date();
    var sound = cordova.platformId == 'android' ? 'file://sound.mp3' : 'file://sound.wav';
    if(time == "afternoon"){
        var in_the_evening = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 17, 0);
        console.log(in_the_evening)
        cordova.plugins.notification.local.schedule({
            title: message,
            id: 0,
            at: in_the_evening,
            led: "FF0000",
            icon: "res://notification_info.png",
            sound:sound,
            smallIcon: "res://notification_info.png",
        });
        if(num == 3){
            Materialize.toast("Scheduled notif for 16:00", 3000);
            showNotifs();
        }
    }else{
        var in_the_morning = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1, 8, 0)
        console.log(in_the_morning);
        cordova.plugins.notification.local.schedule({
            title: message,
            id: 1,
            at: in_the_morning,
            led: "FF0000",
            sound:sound,
            icon: "res://notification_info.png",
            smallIcon: "res://notification_info.png",
        });
        if(num == 3){
            Materialize.toast("Scheduled notif for 8:00", 3000);
            showNotifs();
        }
    }

}
///fdgdfgsdfgdsfg