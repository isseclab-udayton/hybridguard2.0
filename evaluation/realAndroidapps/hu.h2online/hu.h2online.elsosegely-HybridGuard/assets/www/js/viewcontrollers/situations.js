ViewController.Situations = new Class({
    Extends: ViewController.MainViewController,
    list: null,
    dont_know_list: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/situations.html');
        this.screenName = "helyzetek";
        if (device.platform == "iOS") {
        	navBar.hideLeftButton();
        }
        this.list = this.view.getChildComponent('situations-list');
        this.list.addEvent('select', this.bound('onListSelect'));
        this.dont_know_list = this.view.getChildComponent('dont-know-list');
        this.dont_know_list.addEvent('select', this.bound('onListSelectDontKnow'));
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        var listItem = new Moobile.ListItem([], {
            styleName: "custom", 
            className: "dont-know-list-item button-piros"
        }, "diagnosztika");
        listItem.setLabel(Localization.trans("FIRSTAID_RES_0006"));
        this.dont_know_list.addItem(listItem);
        this.parent();
    },
    viewWillEnter: function() {
    	if (device.platform == "iOS") {
        	navBar.hideLeftButton();
        } 
        /* set list elements */
        this.list.clearSelectedItem();
        this.loadSituations();
        this.parent();
    },
    loadSituations: function() {
        var self = this;
        self.list.removeAllItems();
        db.transaction(function(tx) {
            var sqlQuery = "SELECT id, szoveg, app_image, celoldal FROM es_helyzetek ORDER BY sorrend";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                    
                    var len = results.rows.length;
                    for (var i = 0; i < len; i++) {
                        var listItem = new Moobile.ListItem([], {
                            styleName: "custom", 
                            className: "situation-list-item"
                        }, results.rows.item(i).celoldal);
                        listItem.setLabel(results.rows.item(i).szoveg.replace('- ',''));
                        listItem.setImage(results.rows.item(i).app_image);
                        self.list.addItem(listItem);
                    }
						
                }, self.errorCB);
        }, self.errorCB);
    },
    onListSelect: function(item) {
    	
        logDisplay("selected: " + item.getName());
        
        viewstack.pushViewController(new ViewController.SituationView({
            celoldal: item.getName(), helyzet_nev: removeAccent(item.getLabel().getText())
            }), new Moobile.ViewTransition.None);
    },
    onListSelectDontKnow: function() {
        viewstack.pushViewController(new ViewController.Diagnostics(), new Moobile.ViewTransition.None);
    },
    destroy: function() {
        this.parent();
    }
});





