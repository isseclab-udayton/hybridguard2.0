ViewController.Diagnostics = new Class({
    Extends: ViewController.MainViewController,
    options: {
        celoldal: 176,
        backbutton: null
    },
    answers_list: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/diagnostics.html');
        this.screenName = "diagnosztika";
        this.answers_list = this.view.getChildComponent('answers-list');
        this.answers_list.addEvent('select', this.bound('onListSelect'));
        if (device.platform == "iOS" && this.options.backbutton == true) {
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
    	if (device.platform == "iOS" && this.options.celoldal == 18) {
        	navBar.hideLeftButton();
        }
        this.getSlide(this.options.celoldal);
        this.parent();
    },
    getSlide: function(id) {
		var self = this;
        db.transaction(function(tx) {
            var sqlQuery = "SELECT cim, szoveg, kep FROM es_diak WHERE id = "+id+" LIMIT 1";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                      
                    $(".situation-view .helyzetek-cim").html(results.rows.item(0).cim);
                    $(".situation-view .situation-content").html(results.rows.item(0).szoveg);
                    $(".situation-view .situation-image").html('<img src="'+results.rows.item(0).kep.replace('png','jpg')+'" />');
                }, self.errorCB);
        }, self.errorCB);
        this.getAnswers(id);
    },
    getAnswers: function(id) {
        var self = this;
        self.answers_list.removeAllItems();
        db.transaction(function(tx) {
            var sqlQuery = "SELECT szoveg, celoldal, linkstilus FROM es_diak_valaszok WHERE dia_id = "+id+" order by sorrend asc";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                    
                    var len = results.rows.length;
                    for (var i = 0; i < len; i++) {
                        var listItem = new Moobile.ListItem([], {
                            styleName: "custom", 
                            className: "answer-list-item button-"+results.rows.item(i).linkstilus
                        }, results.rows.item(i).celoldal);
                        listItem.setLabel(results.rows.item(i).szoveg);                        
                        self.answers_list.addItem(listItem);
                    }
                }, self.errorCB);
        }, self.errorCB);
    },    
    onListSelect: function(item) {
    	switch(parseInt(item.getName())) {
        case -3: viewstack.pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
            break;
        default: viewstack.pushViewController(new ViewController.Diagnostics({celoldal: item.getName(), backbutton: true}), new Moobile.ViewTransition.None);
    	} 
        
    },
    destroy: function() {
        this.parent();
    }
});





