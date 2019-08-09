$('#showReport').live('pageinit', function (event) {
    if (!isAndroid()) {
        $('#shareFBAndroid').hide();
    }
});

function shareReport() {
    if (isAndroid()) {
        androidShareReport();
    } else {
        $.mobile.changePage($("#iosShareButtons"), {transition: 'none'});
    }
}

function isAndroid() {
    if (device.platform == 'Android') {
        return true;
    }
    return false;
}

function getIdAndDisplayReportToShare() {
    var reportId = parseInt($('#reportId').val());
    getReportAndChangePage(reportId);
}