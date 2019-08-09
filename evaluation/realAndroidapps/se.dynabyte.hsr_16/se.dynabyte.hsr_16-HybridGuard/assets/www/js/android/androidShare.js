/**
 *
 * Phonegap share plugin for Android
 * Kevin Schaul 2011
 *
 */

var Share = function () {
};

Share.prototype.show = function (content, success, fail) {
    return cordova.exec(function (args) {
        success(args);
    }, function (args) {
        fail(args);
    }, 'Share', '', [content]);
};

if (!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.share) {
    window.plugins.share = new Share();
}

function androidShareReport() {
    var reportId = $('#reportId').val();
    var url = GLOBAL.hsr_url_public + reportId;
    var reportType = $('#reportReportType').text();

    var share = new Share();
    share.show({
            subject:'Rapport skickad till Håll Sverige Rent',
            text:'Hej, jag vill uppmärksamma på följande rapport ang. ' + reportType + ' - ' + url},
        function () {
        },
        function () {
            console.log('Delning misslyckades')
        }
    );
}
