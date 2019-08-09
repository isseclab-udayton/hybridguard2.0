ViewController.Test = new Class({
    Extends: ViewController.MainViewController,
    options: {
        holjar: 0,
        sorszam: 1,
        answers: [],
        current_answer: null,
        first: true
    },
    loadView: function() {
        this.view = Moobile.View.at('templates/test.html');
        this.screenName = "tesztoldal";
        
        this.nextButton = this.view.getChildComponent('next-question');
	this.nextButton.addEvent('tap', this.bound('getQuestion'));
	this.nextButton.setLabel(Localization.trans("FIRSTAID_RES_0023"));
        
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        this.parent();
    },
    viewWillEnter: function() {
        $("#tesztlogoszoveg").html($("#tesztlogoszoveg").html()+Localization.trans("FIRSTAID_RES_0027"));
        var self = this;
        $( "body .test-view" ).off( "click", ".radio-answer");
        $( "body .test-view" ).on( "click", ".radio-answer", function() {
            self.options.current_answer = $( this ).val();
            
            $("div.next-question").addClass("next-question-active");
        });
        this.getQuestion();
        this.parent();
    },
    getQuestion: function() {
        var self = this;
        if (self.options.first || self.options.current_answer != null) {        
            if (self.options.current_answer != null) {
                self.checkRight(self.options.current_answer);
            }
            $("div.next-question").removeClass("next-question-active");
            db.transaction(function(tx) {
                var sqlQuery = "SELECT id, question FROM es_test_quest ORDER BY id asc limit "+self.options.holjar+", 1";
                logDisplay(sqlQuery);
                tx.executeSql(sqlQuery, [],
                    function(tx, results) { 
                        var len = results.rows.length;
                        if (len > 0) {                            
                            $("p.question").html(self.options.sorszam+". "+results.rows.item(0).question);
                            self.loadAnswers(results.rows.item(0).id);
                            self.options.holjar++;
                            self.options.sorszam++;
                        } else {
                            self.getCorrectAnswers();
                            
                        }
                    }, self.errorCB);
            }, self.errorCB);
            self.options.current_answer = null;
            self.options.first = false;
        } else {
            self.showMessage(Localization.trans("FIRSTAID_RES_0028"), Localization.trans("FIRSTAID_RES_0029"));
        }
    },
    checkRight: function(id) {
        var self = this;
        db.transaction(function(tx) {
        var sqlQuery = "SELECT id, right, question FROM es_test_answer WHERE id = "+id;
                //alert(sqlQuery);
                tx.executeSql(sqlQuery, [],
                    function(tx, results) { 
                        var len = results.rows.length;
                        if (len > 0) {                        
                            //alert(results.rows.item(0).right);
                            if (results.rows.item(0).right != 1) {
                               // alert("rossz "+self.options.holjar);
                                self.options.answers[self.options.holjar] = id;                
                                //alert(self.options.answers);
                            }
                            
                        }
                    }, self.errorCB);
            }, self.errorCB);
    },
    getCorrectAnswers: function() { 
        var self = this;
        
        var incorrect = 0;
        //alert(self.options.answers);
        $("p.question").html(Localization.trans("FIRSTAID_RES_0024"));
        $("div.answers").html('');
        self.options.answers.forEach(function(entry, key) {
            
            if (entry != "") {                
             //   alert(entry+"-"+key);
            incorrect++;
            db.transaction(function(tx) {
                var sqlQuery = "SELECT es_test_answer.id, answer, right, es_test_quest.question, es_test_answer.question as qid FROM es_test_answer inner join es_test_quest on es_test_answer.question = es_test_quest.id WHERE es_test_answer.id = "+entry+" LIMIT 1";
                //alert("SQL----: "+sqlQuery);
                logDisplay(sqlQuery);
                tx.executeSql(sqlQuery, [],
                    function(tx, results) { 
                        var len = results.rows.length;
                        if (len > 0) {                            
                            $("div.answers").append("<b>"+key+". "+results.rows.item(0).question+'</b><br><br>Az Ön válasza:<br>'+results.rows.item(0).answer+"<br><br><p class='correct-"+entry+"'></p>");                            
                            db.transaction(function(tx) {
                                var sqlQuery = "SELECT answer FROM es_test_answer WHERE es_test_answer.question = "+results.rows.item(0).qid+" AND right = 1 LIMIT 1";
                                //alert("SQL----: "+sqlQuery);
                                logDisplay(sqlQuery);
                                tx.executeSql(sqlQuery, [],
                                    function(tx, results) { 
                                        var len = results.rows.length;
                                        if (len > 0) {                            
                                            $(".correct-"+entry).html('Helyes válasz:<br>'+results.rows.item(0).answer+"<br>");                            
                                        }
                                    }, self.errorCB);
                            }, self.errorCB);
                        }
                    }, self.errorCB);
            }, self.errorCB);
            }
        });
        $("p.question").append('<p class="user-percent">'+Localization.trans("FIRSTAID_RES_0025")+" "+(((incorrect/(self.options.sorszam-1))-1)*-1)*100+Localization.trans("FIRSTAID_RES_0026")+'</p>');
        //alert(incorrect+"/"+(self.options.sorszam-1)+" - "+(((incorrect/(self.options.sorszam-1))-1)*-1)*100+"%");
    },
    loadAnswers: function(id) {
		var self = this;
        $("div.answers").html("");
        db.transaction(function(tx) {
            var sqlQuery = "SELECT id, answer, right FROM es_test_answer WHERE question = "+id+" ORDER BY id asc";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                    
                    var len = results.rows.length;
                    for (var i = 0; i < len; i++) {
                        logDisplay("válasz: "+i);
                        $("div.answers").append('<div class="answer-container"><input class="radio-answer" id="option_'+results.rows.item(i).id+'" type="radio" name="field" value="'+results.rows.item(i).id+'"><label for="option_'+results.rows.item(i).id+'">'+results.rows.item(i).answer+'</label></div>');
                    }
                    
                }, self.errorCB);
        }, self.errorCB);
    },
    destroy: function() {
        this.parent();
    }
});





