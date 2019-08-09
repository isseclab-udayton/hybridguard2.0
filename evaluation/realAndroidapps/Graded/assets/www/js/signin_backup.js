var iframeError;
var app = {
    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        StatusBar.show();

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
        }
        StatusBar.overlaysWebView();
    }

};

app.initialize();


$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('form').submit(function(event){
        areUSure();
        event.preventDefault();
    });
});
$('a').click(function(){
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
        $('.card-panel').show(0);
    }else{
        $('.card-panel').hide(500);
    }
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
        checking();
    }
}
function nono(){
    Materialize.toast('Couldn\'t load URL', 4000);
}
function notFilled(){
    Materialize.toast('Please fully fill out the input', 4000);
}
function checking(){
    $('.progress').removeClass('hide');
    $('#cont').addClass('hide');
    $('#submit').text('Loading...').hide();
    $('#loading').show();
    var district_url;
    var username;

    var password;
    if($('#district').text() == 'Other'){
        district_url = $('#url').val()
    }else{
        district_url = 'https://hac.friscoisd.org/HomeAccess'
    }
    username = $('#username').val();
    password = $('#password').val();
    console.log(username, password);
    $.getJSON("http://graded.azurewebsites.net/getuser",{username: username, password: password, url:district_url}, function( data) {
        if(data['status'] == 'success'){
            var newperson = {'username':username,'password':password,'link':district_url, 'profile':data['profile']};
            localStorage.setItem('1', JSON.stringify(newperson));
            localStorage.setItem('fullUser',JSON.stringify(data));
            localStorage.setItem('version', '0.8');
            var newLogin = {
                "district": district_url,
                "school": data['profile']['school'].toString()
            };

            window.location = 'index.html';
        }else{

            Materialize.toast('Invalid Login', 4000);
        }
        $('#submit').text('LOGIN').show();
        $('#loading').hide();
    }).fail(function(error){
        var $toastContent;
        var er = error['responseText'].replace(/["']/g, "");
        var report = 'https://docs.google.com/forms/d/1ff6cfpu0XY4U25juWM2CbD41XPfRnOYH0nFMJK-Fx5U/viewform?entry.1929198102=Login+error&entry.1899132321&entry.1320473414='+er+'&entry.483691185='+district_url+'&entry.1088068918='+username;
        localStorage.setItem('error',username + ', ' + password);
        if(error['status'] == '404'){
            $toastContent = '<span>404 You may be offline</span> <a class=" waves-effect waves-light right btn-flat yellow-text" style="margin-left: 3px; padding-left: 3px; padding-right: 3px" onclick="window.open(\''+report+'\',\'_system\')">Report Bug</a>'
        }else if(error['responseText'] = "('Connection aborted.', gaierror(11001, 'getaddrinfo failed'))"){
            $toastContent = '<span>'+error['status']+' Invalid HAC URL.</span> <button class=" waves-effect waves-light right btn-flat yellow-text" style="margin-left: 3px; padding-left: 3px; padding-right: 3px" onclick="window.open(\''+report+'\',\'_system\')">Report Bug</button>';
            Materialize.toast('Try putting the /HomeAccess at the end',10000);
        }else{
            $toastContent = '<span>'+error['status']+' Uh Oh! Something stupid occured! Report the bug!</span> <button class=" waves-effect waves-light right btn-flat yellow-text" style="margin-left: 3px; padding-left: 3px; padding-right: 3px" onclick="window.open(\''+report+'\',\'_system\')">Report Bug</button>'
        }
        Materialize.toast($toastContent, 10000);


        console.log(error);
        $('#submit').text('LOGIN').show();
        $('#loading').hide();
    });
}