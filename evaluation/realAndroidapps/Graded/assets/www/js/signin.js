var iframeError;
var app = {
    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        if (cordova.platformId == 'ios'|| window.navigator.vendor == "Apple Computer, Inc.") {
            StatusBar.show();
        }
        StatusBar.backgroundColorByHexString("7b1fa2");
        FastClick.attach(document.body);
        if (navigator.notification) { // Override default HTML alert with native dialog
            window.alert = function (message) {
                navigator.notification.alert(
                    message,    // message
                    null,       // callback
                    "Graded", // title
                    'OK'        // buttonName
                );
            };
            window.confirm = function (message) {
                navigator.notification.confirm(message,function(index){
                    console.log(index);
                   if(index == 1){
                       checking(true);
                   }

                });
            };
        }
        StatusBar.overlaysWebView();
    }

};

app.initialize();


$(document).ready(function(){
    console.log(localStorage);
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('#signup').submit(function(event){
        areUSure();
        event.preventDefault();
    });
});
$('#start').click(function(){
    $('#start').hide();
    $('#signin').show();
});
$('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false, // Does not change width of dropdown to that of the activator
        hover: false, // Activate on hover
        gutter: 0, // Spacing from edge
        belowOrigin: false, // Displays dropdown below the button
        alignment: 'left' // Displays dropdown with edge aligned to the left of button
    }
);
function district(a){
    $('.dropdown-button').text(a);
    if(a == 'Other'){
        $('#urlBox').show(0);
        $('#loginItems').hide(500);
    }else{
        $('#urlBox').hide(500);
        $('#loginItems').show(500);
    }
}
function handleOpenURL(url) {
    var appName = url.replace("graded://login/", "");
    window.location = "auth.html#" + appName;
}
function areUSure(){
    if($('#district').text() == 'Other'){
        var url = $('#url').val();
        $('iframe').remove();

        $('#iframe').append('<iframe height="300px" width="100%"id="frame" src="'+url+'" frameborder="0" onerror="nono()"></iframe>');
        iframeError = setTimeout(nono, 5000);
        $('#modal1').openModal();
        $('#frame').load(function(){
            clearTimeout(iframeError);
            $('.progress').addClass('hide');
            $('#cont').removeClass('hide');
        })
    }else{
        checking(false);
    }
}
function setUrl(){
    if($("#url").val() != "") {
        $('.progress').show();
        $("#otherDistrict").show();
        $('.scroll-wrapper').empty().append('<iframe width="100%" height="400px" src="' + $("#url").val() + '" frameborder="0" onload="iframeLoaded()"></iframe>');
    }else{
        Materialize.toast("Please enter a URL", 2000);
    }

}
function nono(){
    Materialize.toast('Couldn\'t load URL', 4000);
}
function iframeLoaded(){
    $('.progress').hide();
    $("iframe").contents().find('.sg-container').css("margin-left","5px");
    $("iframe").contents().find('.sg-banner-text').text("Home Access Center to Graded");
    $("iframe").contents().find('.sg-button').attr("aria-disabled","true").attr("disabled","true").find("span").text("Click the login button below on the actual app");
    $("iframe").contents().find('a').attr("href","#");
    $("#OtherloginBtn").show();
    $(window).scrollBottom(50);
}
function notFilled(){
    Materialize.toast('Please fully fill out the input', 4000);
}
function checking(a){
    var district_url;
    var username;
    var password;
    var dbID = '';
    console.log($('#district').text());
    if ($('#district').text() == 'Other') {
        district_url = $('#url').val()
    } else {
        district_url = 'https://hac.friscoisd.org/HomeAccess'
    }
    console.log(district_url);
    if(!(a)) {
        username = $('#username').val();
        password = $('#password').val();
    }else{
        username = $("iframe").contents().find('#LogOnDetails_UserName').val();
        password = $("iframe").contents().find('#LogOnDetails_Password').val();
        dbID = $("iframe").contents().find('#Database').attr("value");
        $("iframe").remove();
        $("#otherDistrict").hide();
    }
    load(district_url,username,password,dbID);

}
function reportBug(error, traceback){
    var d = moment().format('YYYY-MM-DD');
    var url = "https://docs.google.com/forms/d/e/1FAIpQLSfJYFbIh8cZFZy1i-49eRAubNLFrwNswDQrlkML5-VC6LO8Bw/viewform?entry.1440668453="+d+"&entry.89810113=&entry.1188222071="+error+"&entry.811591391="+traceback+"&entry.1617325770="+credentials.link + "&entry.614988761=" + credentials.username;
    window.open(url, "_system");
}
function load(district_url,username,password,dbID){
        $('.progress').removeClass('hide');
        $('#cont').addClass('hide');
        $('#submit').hide();
        $('#loading').show();
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/doesexist",
            data: {username: username, password: password, url: district_url, dbID: dbID},
            success: function (data) {
                if (data['success']) {
                    var newperson = {
                        'username': username,
                        'password': password,
                        'link': data["url"],
                        'profile': data['profile'],
                        'dbID': data["dbID"]
                    };
                    localStorage.setItem('1', JSON.stringify(newperson));
                    var user_list = localStorage.getItem("user_list");
                    localStorage.setItem("recentURL", JSON.stringify({"url":data["url"],"dbID":data["dbID"]}));
                    console.log(user_list);
                    if(user_list == null){
                        localStorage.setItem("user_list", JSON.stringify([newperson]));
                        localStorage.setItem("activeUser","0");
                    }else{
                        user_list = JSON.parse(user_list);
                        console.log(user_list);
                        user_list.push(newperson);
                        localStorage.setItem("user_list", JSON.stringify(user_list));
                        localStorage.setItem("activeUser",(user_list.length - 1).toString());
                    }

                    localStorage.setItem('version', '1.0');
                    var newLogin = {
                        "district": district_url,
                        "school": data['profile']['school'].toString()
                    };
                    if(window.FirebasePlugin){
                        window.FirebasePlugin.logEvent("sign_in", {username: username, district_url: data["link"], school: data['profile']['school'].toString()});
                    }
                    localStorage.setItem("primaryColor","purple");
                    window.location = 'index.html';
                } else {
                    Materialize.toast(data["error"], 4000);
                }
                $('#submit').show();
                $('#loading').hide();
            },
            error: function (error) {
                var $toastContent;
                var er = error['responseText'].replace(/["']/g, "");
                if (error['status'] == '0') {
                    var $toastContent = $('<span>404 Are you offline? <button class="btn-flat orange-text" onclick="reportBug(\'404\',\'N/A\');">Report Bug</button></span> ')
                } else {
                    var $toastContent = $('<span>' + error['status'] + ' Uh Oh! Something stupid occured! <button class="btn-flat orange-text" onclick="reportBug(\''+error.getResponseHeader('Error')+'\',\''+error.getResponseHeader('Traceback-ID')+'\');">Report Bug</button></span> ')
                }
                Materialize.toast($toastContent, 4000);
                $('.progress').addClass('hide');
                $('#cont').removeClass('hide');
                $('#submit').text('LOGIN').show();
                $('#loading').hide();
                console.log(error);
            },
            dataType: "JSON"
        });
}
$.fn.scrollBottom = function(scroll){
    if(typeof scroll === 'number'){
        window.scrollTo(0,$(document).height() - $(window).height() - scroll);
        return $(document).height() - $(window).height() - scroll;
    } else {
        return $(document).height() - $(window).height() - $(window).scrollTop();
    }
}