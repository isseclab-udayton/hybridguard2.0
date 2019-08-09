$('#info').live("pageshow", function () {
    getInfo();
});

function getInfo() {
    $.mobile.showPageLoadingMsg();
    $.ajax({
        type: 'GET',
        url: GLOBAL.hsr_url + 'getInfo',
        data: '',
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            var infoData = jQuery.parseJSON(data);
            $('#infoText').html(infoData.text);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log('Error: ' + textStatus + ' - ' + errorThrown);
        },
        complete: function () {
            $.mobile.hidePageLoadingMsg();
        }
    });
}