ViewController.More = new Class({
    Extends: ViewController.MainViewController,
    list: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/more.html');
        this.screenName = "tovabbiak";
        this.list = this.view.getChildComponent('more-list');
        this.list.addEvent('select', this.bound('onListSelect'));
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        var listItem = null;
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "keresok");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0014"));
        listItem.setImage("images/keresok@2x.png");
        this.list.addItem(listItem);
        if (device.platform == "Android") {
            listItem = new Moobile.ListItem([], {
                styleName: "custom", 
                className: "more-list-item situation-list-item"
            }, "diagnosztika");
            listItem.setLabel(Localization.trans("FIRSTAID_RES_0007"));
            listItem.setImage("images/diagnosztika_tovabbi.png");
            this.list.addItem(listItem);
        }
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "teszt");
        
        //listItem.setLabel(Localization.trans("FIRSTAID_RES_0015"));
        listItem.setLabel(teszt_nev);
        listItem.setImage("images/teszt@2x.png");
        this.list.addItem(listItem);
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "videok");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0016"));
        listItem.setImage("images/es_videok@2x.png");
        this.list.addItem(listItem);
        
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "altalanos");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0017"));
        listItem.setImage("images/altalanos@2x.png");
        this.list.addItem(listItem);
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "irjon");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0018"));
        listItem.setImage("images/sugo-ikon@2x.png");
        this.list.addItem(listItem);
        
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "ertekeles");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0019"));
        listItem.setImage("images/ertekel@2x.png");
        this.list.addItem(listItem);
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "megosztas");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0020"));
        listItem.setImage("images/megosztas@2x.png");
        this.list.addItem(listItem);
        
        listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "more-list-item situation-list-item"
        }, "sugo");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0021"));
        listItem.setImage("images/sugo@2x.png");
        this.list.addItem(listItem);
        
        
        this.parent();
    },
    viewWillEnter: function() {
    	if (device.platform == "iOS") {
        	navBar.hideLeftButton();
        }
    	this.list.clearSelectedItem();
        this.parent();
    },
    onListSelect: function(item) {
        logDisplay("selected: " + item.getName());
        var self = this;
        switch(item.getName()) {
            case "teszt":
                viewstack.pushViewController(new ViewController.Test(), new Moobile.ViewTransition.None);
                break;
            case "diagnosztika":
                viewstack.pushViewController(new ViewController.Diagnostics(), new Moobile.ViewTransition.None);
                break;
            case "keresok":
                viewstack.pushViewController(new ViewController.Search(), new Moobile.ViewTransition.None);
                break;  
            case "videok":
            	self.logScreen("link_kamaszpanasz");
            	window.open('http://www.kamaszpanasz.hu/hirek/pedagogus-segedanyag/4502/elsosegely-video', '_blank');
                break;      
            case "altalanos":
            	self.logScreen("link_webbeteg");
            	window.open('http://www.webbeteg.hu/cikkek/elsosegely/177/veszhelyzet---altalanos-tennivalok', '_blank');
                break;  
            case "irjon":
                viewstack.pushViewController(new ViewController.WriteUs(), new Moobile.ViewTransition.None);
                break;      
            case "ertekeles":
            	self.logScreen("link_market_ertekeles");
            	if (device.platform == "Android") {
            		window.open('https://play.google.com/store/apps/details?id=hu.h2online.elsosegely', '_blank');
            	} else {
            		window.open('https://itunes.apple.com/hu/app/elsosegely-mit-kell-tennem/id552900421?mt=8', '_blank');
            	}            	
                break;
            case "megosztas":
            	self.logScreen("megosztas");
            	window.plugins.socialsharing.share(Localization.trans("FIRSTAID_RES_0052"), Localization.trans("FIRSTAID_RES_0053"));
            	break;
            case "sugo":
                viewstack.pushViewController(new ViewController.Help(), new Moobile.ViewTransition.None);
                break;  	
        }
    },
    destroy: function() {
        this.parent();
    }
});





