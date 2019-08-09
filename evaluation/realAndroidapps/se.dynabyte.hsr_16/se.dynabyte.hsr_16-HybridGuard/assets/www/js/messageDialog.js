var ERROR = "Fel!"
var activePage;

function displayServerMessage(data) {
    activePage = $.mobile.activePage.attr("id");
    var serverMessage = $.parseJSON(data);
    $('#messageType').text(serverMessage.messageType);
    $('#message').text(serverMessage.message);
    if (serverMessage.reportId > 0) {
        $('#reportId').val(serverMessage.reportId);
        displayMessageDialogShare(true);
    } else {
        displayMessageDialogShare(false);
    }
    $.mobile.changePage($("#messageDialog"), {transition: 'none', reverse: false, changeHash: false});
}

function displayMessage(messageType, message) {
    activePage = $.mobile.activePage.attr("id");
    $('#messageType').text(messageType);
    $('#message').text(message);
    displayMessageDialogShare(false);
    $.mobile.changePage($("#messageDialog"), {transition: 'none', reverse: false, changeHash: false});
}

function messageRedirect() {
    var redirectTo = $("#menu");
    if (activePage == 'report') {
        if ($('#messageType').text() == ERROR) {
            redirectTo = $("#report");
        }
    } else if (activePage == 'storedReports') {
        redirectTo = $("#storedReports");
    } else if (activePage == 'showReport') {
        redirectTo = $("#showReport");
    }
    $.mobile.changePage(redirectTo, {transition: 'none', reverse: false, changeHash: false});
}

function displayMessageDialogShare(isDisplay) {
    if (isDisplay) {
        $('#messageDialogShare').show();
    } else {
        $('#messageDialogShare').hide();
    }
}