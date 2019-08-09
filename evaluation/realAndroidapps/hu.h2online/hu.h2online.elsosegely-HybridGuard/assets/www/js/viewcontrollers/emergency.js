ViewController.Emergency = new Class({
    Extends: ViewController.MainViewController,
    call_button: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/emergency.html');
        this.screenName = "mentohivas";
        this.call_button = this.view.getChildComponent('call-button');
	this.call_button.addEvent('tap', this.bound('callEmergency'));
        this.call_button.setLabel(Localization.trans("FIRSTAID_RES_0012"));
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        this.parent();
    },
    viewWillEnter: function() {
        
        this.parent();
    },
    callEmergency: function() {
        window.plugins.CallNumber.callNumber(function() { /* success */ }, function() { /* error */ }, telszam);
    },
    destroy: function() {
        this.parent();
    }
});





