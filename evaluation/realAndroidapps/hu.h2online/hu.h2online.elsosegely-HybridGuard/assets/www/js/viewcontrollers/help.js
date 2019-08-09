ViewController.Help = new Class({
    Extends: ViewController.MainViewController,
    loadView: function() {
        this.view = Moobile.View.at('templates/help.html');
        this.screenName = "sugo";
        if (device.platform == "iOS") {
        	navBar.showLeftButton();
        }
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
    destroy: function() {
        this.parent();
    }
});





