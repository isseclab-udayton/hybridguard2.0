var marina = {};
marina.views = {};

marina.startup = function() {
	function deviceReady() {
    marina.util.startSpinner();
    console.log('device ready, show main view');
    marina.views.main().show();
	}
	document.addEventListener("deviceready", deviceReady, false);
};

$(function() {
  console.log('in $()');
  marina.startup();
});

