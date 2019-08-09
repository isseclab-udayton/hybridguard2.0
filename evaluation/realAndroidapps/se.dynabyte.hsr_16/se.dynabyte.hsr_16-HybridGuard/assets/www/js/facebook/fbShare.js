function shareReportToMyFBWall() {
    FB.getLoginStatus(function (response) {
        if (response.status == 'connected') {
            postReportToFBWall();
        } else {
            FB.login(
                function (response) {
                    if (response.status == 'connected') {
                        postReportToFBWall();
                    } else {
                        localStorage.removeItem('cdv_fb_session');
                        FB.Auth.setAuthResponse(null, 'notConnected');
                        alert('Det gick inte att logga in på Facebook, försök igen senare');
                    }
                }, { scope: "email" }
            );
        }
    });
}

function postReportToFBWall() {
    var rapportId = $('#reportId').val();
    var url = GLOBAL.hsr_url_public + rapportId;
    var caption = $('#reportReportType').text();
    var reportCreateDate = $('#reportCreateDate').text();
    var reportAddress = $('#reportAddress').text();
    var reportComment = $('#reportComment').text();
    var description = "" + reportCreateDate + " rapporterades på " + reportAddress;
    var picture = $('#reportImage').attr('src');
    var params = {
        method: 'feed',
        name: 'Rapport till Håll Sverige Rent',
        link: url,
        picture: picture,
        caption: caption,
        description: description
    };
    FB.ui(params);
}

