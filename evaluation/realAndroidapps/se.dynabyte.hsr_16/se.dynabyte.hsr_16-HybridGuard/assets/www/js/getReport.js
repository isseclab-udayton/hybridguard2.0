function getReportAndChangePage(id) {
    activePage = $.mobile.activePage.attr("id");
    if (activePage == 'messageDialog') {
        displayHeaderButton(false);
    } else {
        displayHeaderButton(true);
    }
    $.mobile.showPageLoadingMsg();
    var request = {};
    request.reportId = id;
    GLOBAL.ajaxCall = $.ajax({
        type: 'POST',
        url: GLOBAL.hsr_url + 'getReport',
        dataType: 'json',
        contentType: 'text/json',
        cache: false,
        data: JSON.stringify(request),
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            getReportToPageSuccess(data, textStatus, jqXHR);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            getReportToPageError(jqXHR, textStatus, errorThrown);
        },
        complete: function () {
            $.mobile.hidePageLoadingMsg();
        }
    });

    var getReportToPageSuccess = function getReportToPageSuccess(data, textStatus, jqXHR) {
        var dataArray = jQuery.parseJSON(data);
        var reportData = dataArray[0];
        var reportType = dataArray[1];
        $('#reportId').val(reportData.id);
        $('#id').text(reportData.id);
        $('#reportImage').attr('src', GLOBAL.image_host + reportData.imagePath);
        $('#reportAddress').text(reportData.street + " " + reportData.streetNbr + ", " + reportData.zipCode + " " + reportData.city);
        $('#reportComment').text(reportData.comment);
        $('#reportStatus').text(reportData.status);
        $('#reportCreateDate').text(reportData.createDate.split(' ')[0]);
        $('#reportReportType').text(reportType.ReportType);

        $.mobile.changePage($("#showReport"), {transition: 'none'});
    }


    var getReportToPageError = function (jqXHR, textStatus, errorThrown) {
        console.log('Error: ' + textStatus + ' - ' + errorThrown);
    }
}

function displayHeaderButton(isDisplayBackBtn) {
    if (isDisplayBackBtn) {
        $('#showReportMenuBtn').hide();
        $('#showReportBackBtn').show();
    } else {
        $('#showReportMenuBtn').show();
        $('#showReportBackBtn').hide();
    }

}