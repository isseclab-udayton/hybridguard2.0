function tweet() {
    window.plugins.twitter.isTwitterAvailable(function (r) {
        if (r == 1) {
            var rapportId = $('#reportId').val();
            var url = GLOBAL.hsr_url_public + rapportId;
            var reportType = $('#reportReportType').text();
            window.plugins.twitter.composeTweet(
                function (s) {
                    console.log("tweet success");
                },
                function (e) {
                    console.log("tweet failure: " + e);
                },
                "Hej, jag vill uppmärksamma på följande rapport ang. " + reportType + ". #hållsverigerent",
                {
                    urlAttach:url
                }
            );
        }
    });


}

function sendEmail() {
    console.log("sending email...");
    var body = mailBody();

    window.plugins.emailComposer.showEmailComposerWithCallback(function (result) {
            console.log(result);
        }, //callback
        "Rapport skickad till Håll Sverige Rent", //subject
        body, //body
        [], //toRecipients
        [], //ccRecipients
        [], //bccRecipients
        true, //isHtml
        []); //attachments

}

function mailBody() {
    var rapportId = $('#reportId').val();
    var reportType = $('#reportReportType').text();
    var body = '<html><body><div>Hej, jag vill uppmärksamma på följande rapport<br/><br/><a href="' + GLOBAL.hsr_url_public + rapportId + '"/>' + reportType + '</a></div></body></html>';
    return body;
}