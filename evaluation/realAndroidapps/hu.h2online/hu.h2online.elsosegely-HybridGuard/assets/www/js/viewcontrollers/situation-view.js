ViewController.SituationView = new Class({
    Extends: ViewController.MainViewController,
    answers_list: null,
    options: {
	celoldal: null,
	helyzet_nev: ""
    },
    loadView: function() {
        this.view = Moobile.View.at('templates/situation-view.html');
        this.screenName = "helyzetek/"+this.options.helyzet_nev;
        if (device.platform == "iOS") {
        	navBar.showLeftButton();
        }        
        this.answers_list = this.view.getChildComponent('answers-list');
        this.answers_list.addEvent('select', this.bound('onListSelect'));
        
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        
        this.parent();
    },
    viewWillEnter: function() {
    	
        this.answers_list.clearSelectedItem();
        this.getTargetPage(this.options.celoldal);
        this.parent();
    },
    getTargetPage: function(id) {
		var self=this;
        db.transaction(function(tx) {
            var sqlQuery = "SELECT cim, szoveg, kep, hangfile FROM es_diak WHERE id = "+id+" LIMIT 1";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                      
                    $(".situation-view .helyzetek-cim").html(results.rows.item(0).cim);
                    $(".situation-view .situation-content").html(results.rows.item(0).szoveg);
                    $(".situation-view .situation-image").html('<img src="'+results.rows.item(0).kep.replace('png','jpg')+'" />');
                    if (results.rows.item(0).hangfile){
                    	
                    	snd = new Media("/www/"+results.rows.item(i).hangfile,
                    	        // success callback
                    	        function () {
                    	            alert("playAudio():Audio Success");
                    	        },
                    	        // error callback
                    	        function (err) {
                    	            alert("playAudio():Audio Error: " + err);
                    	        }
                    	    );
                    	//snd.play();
                    	
                    	}else{
                    	//stopSound();
                    	}
                    //alert(results.rows.item(0).kep);
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
    	var self = this;
        logDisplay("selected: " + item.getName());
        switch(parseInt(item.getName())) {			
            case -1: viewstack.pushViewController(new ViewController.SearchDefib(), new Moobile.ViewTransition.None);
                break;
            case -2: viewstack.pushViewController(new ViewController.Emergency(), new Moobile.ViewTransition.None);
                break;
            case -3: viewstack.pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
                break;
            case -4: viewstack.pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
                break;
            case -5: viewstack.pushViewController(new ViewController.Revivification(), new Moobile.ViewTransition.None);
                break;
            default: viewstack.pushViewController(new ViewController.SituationView({celoldal: item.getName(), helyzet_nev: self.options.helyzet_nev}), new Moobile.ViewTransition.None);
				break;
        } 
        
    },
    destroy: function() {
    	 
        this.parent();
    }
});






