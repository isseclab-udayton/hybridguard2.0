var time_interval = 10000;

var inmobi_conf = {
    siteid : "9a00cd4515bb48888c2c89491eca41af",
    slot : "15",
    test : true,
    adtype: "int",
    targetWindow : "_blank"};
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
    console.log('device ready');
    $.getScript("js/inmobi.js", function(){
        showAds();
    });
}

function showAds() {
    var adsElement = document.getElementById('ads');
    _inmobi.getNewAd(adsElement);
    window.setInterval("_inmobi.getNewAd(document.getElementById('ads'))",time_interval);
}
