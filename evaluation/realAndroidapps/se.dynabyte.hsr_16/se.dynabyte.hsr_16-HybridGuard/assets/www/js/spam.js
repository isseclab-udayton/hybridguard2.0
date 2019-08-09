function reportAsSpam() {
    $.mobile.showPageLoadingMsg();
    var id = parseInt($('#reportId').val());
    var request = {};
    request.reportId = id;
    GLOBAL.ajaxCall = $.ajax({
        type: 'POST',
        url: GLOBAL.hsr_url + 'reportSpam',
        dataType: 'json',
        contentType: 'text/json',
        cache: false,
        data: JSON.stringify(request),
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            displayServerMessage(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            displayMessage(ERROR, "Rapportering misslyckades")
        },
        complete: function () {
            $.mobile.hidePageLoadingMsg();
        }
    });
}