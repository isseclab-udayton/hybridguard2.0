ViewController.Search = new Class({
    Extends: ViewController.MainViewController,
    search_defib_button: null,
    search_hospital_button: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/search.html');
        this.screenName = "keresok";
        this.search_hospital_button = this.view.getChildComponent('search-hospital-button');
	this.search_hospital_button.addEvent('tap', this.bound('searchHospital'));
        this.search_hospital_button.setLabel(Localization.trans("FIRSTAID_RES_0034"));
        this.search_defib_button = this.view.getChildComponent('search-defib-button');
	this.search_defib_button.addEvent('tap', this.bound('searchDefib'));
        this.search_defib_button.setLabel(Localization.trans("FIRSTAID_RES_0034"));
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
    searchHospital: function() {
        viewstack.pushViewController(new ViewController.SearchHospital(), new Moobile.ViewTransition.None);
    },
    searchDefib: function() {
        viewstack.pushViewController(new ViewController.SearchDefib(), new Moobile.ViewTransition.None);
    },
    destroy: function() {
        this.parent();
    }
});





