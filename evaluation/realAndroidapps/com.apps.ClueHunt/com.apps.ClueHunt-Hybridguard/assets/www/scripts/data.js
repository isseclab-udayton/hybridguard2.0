var db;
var g_objRiddleJSON;

openDB = function() {
    
    if (window.sqlitePlugin !== undefined) {
        db = window.sqlitePlugin.openDatabase("ClueHunter");
    } else {
        // For debugin in simulator fallback to native SQL Lite
        db = window.openDatabase("ClueHunter", "1.0", "ClueHunter", 200000);
    }
}

initDB = function() {  
    
    var fnVersionTest = function (tx, rs) {
        var intCount = rs.rows.length, intVersion = 1;
               
        if (intCount === 0) {
            console.log('inserting config settings');
            tx.executeSql("INSERT INTO config (Version) VALUES (?)", [1], onDBSuccess, onDBError);
        }
        else {
            intVersion = rs.rows.item(0).Version;           
        }
        
        if (intVersion === 1)
        {
            var strJSON = '[{"Clue":"I am where you lay just before dreams take you away.","CodeNum":"123","Display":"","Image":"img/Example1.png","Index":1},{"Clue":"I have many keys but they open no locks.","CodeNum":"456","Display":"","Image":"img/Example2.png","Index":2}]';
            InsertCourse('Demo Course', 'This course demonstrates how running a simple course works.', strJSON, onDBSuccess);
            //Update version to 2
            intVersion = 2
            tx.executeSql("UPDATE config SET Version = ?", [intVersion], onDBSuccess, onDBError);
            tx.executeSql("CREATE TABLE IF NOT EXISTS timings(ID INTEGER PRIMARY KEY ASC, CourseID INT, Name TEXT, FinishTime TEXT, SortOrder INT)", []);
        }
        
        console.log('Version = ' + intVersion);
	}    
   
	db.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS config(ID INTEGER PRIMARY KEY ASC, Version INTEGER)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS course(ID INTEGER PRIMARY KEY ASC, Name TEXT, Description TEXT, DateCreated DATETIME, CourseJSON TEXT)", []);
        //tx.executeSql("CREATE TABLE IF NOT EXISTS checkpoints(ID INTEGER PRIMARY KEY ASC, CourseID INTEGER, Clue TEXT, ImgFile TEXT, Display TEXT, Latitude REAL, Longitude REAL, Altitude REAL, CodeName TEXT)", []);
        //tx.executeSql("CREATE TABLE IF NOT EXISTS riddle(ID INTEGER PRIMARY KEY ASC, Riddle TEXT, Answer TEXT)", []);
        tx.executeSql("SELECT * FROM config", [], fnVersionTest, onDBError);        
	});
}

InsertCourse = function(strCourseName, strDescription, strCourseJSON, fnReturn) {

	db.transaction(function(tx) {
		var addedOn = new Date();
        //console.log('strCourseName = ' + strCourseName + ', desc = ' + strDescription + ', addedon = ' + addedOn + ', json = ' + strCourseJSON);
		tx.executeSql("INSERT INTO course(Name, Description, DateCreated, CourseJSON) VALUES (?,?,?,?)",
			  [strCourseName, strDescription, addedOn, strCourseJSON],
			  fnReturn,
			  onDBError);
	});
}
      
function onDBError(tx, e) {
	console.log("Error: " + e.message);
} 
      
function onDBSuccess(tx, r) {

}

function CreateRiddleJSON() {
    
    g_objRiddleJSON = [ 
    	{
        	Answer:"Basement",
            Riddle:"In the space that’s underground your next clue can be found"
    	}, {
        	Answer:"Bathroom",
            Riddle:"For the next clue, think number one, think number two."
    	}, {
        	Answer:"Bathtub",
            Riddle:"In this small pool little yellow ducks rule!"
    	}, {
        	Answer:"Bed 1",
            Riddle:"I have four feet but not a shoe, a head but not a thought for you."
    	}, {
        	Answer:"Bed 2",
            Riddle:"I am where you lay just before dreams take you away."
    	}, {
        	Answer:"Bedroom",
            Riddle:"When it gets late and you turn out the light, this is the place you'll be found each night."
    	}, {
        	Answer:"Book",
            Riddle:"Stiff is my spine and my body is pale. But I'm always ready to tell a tale. What am I?"
    	}, {
        	Answer:"Clock 1",
            Riddle:"I have hands but no arms and a face but no eyes."
    	}, {
        	Answer:"Clock 2",
            Riddle:"I will be counting the seconds until you find me."
    	}, {
        	Answer:"Closet",
            Riddle:"Don't get hung up on this clue, leave that to the coats and jackets."
    	}, {
        	Answer:"Computer Room",
            Riddle:"In the room that holds the only type of mouse allowed in the house."
    	}, {
        	Answer:"Couch/Lounge",
            Riddle:"I am soft in every bit, and a spot where you like to sit. What am I?"
    	}, {
        	Answer:"Dryer",
            Riddle:"Most things when they run, they perspire, but as I run, I get drier and drier."
    	}, {
        	Answer:"Fridge",
            Riddle:"What gets colder when it runs?"
    	}, {
        	Answer:"Front Door",
            Riddle:"People knock on me to say hello but lock me up after their visitors go."
    	}, {
        	Answer:"Kitchen",
            Riddle:"If you are in a hungry mood, go here first and find some food."
    	}, {
        	Answer:"Mailbox",
            Riddle:"What is filled six days a week, but if you don't own it, you can't take a peek?"
    	}, {
        	Answer:"Microwave",
            Riddle:"I have a sound that goes beep, and while the time I do keep, my main function is to heat."
    	}, {
        	Answer:"Mirror 1",
            Riddle:"What turns everything around but does not move?"
    	}, {
        	Answer:"Mirror 2",
            Riddle:"I'm made of glass, this much is true, but when you look, you won't see through. Reflect on this, and you'll find a clue!"
    	}, {
        	Answer:"Oven",
            Riddle:"Turn up the heat, I'm baking hot!"
    	}, {
        	Answer:"Pantry",
            Riddle:"In the place where there are stacks of cans and tasty snacks."
    	}, {
        	Answer:"Phone",
            Riddle:"What has a ring but no finger?"
    	}, {
        	Answer:"Piano",
            Riddle:"I have many keys but they open no locks."
    	}, {
        	Answer:"Pillow",
            Riddle:"What loses its head in the morning and gets it back at night?"
    	}, {
        	Answer:"Shower",
            Riddle:"Some take me in the morning, others take me in the evening. But one thing you should know, that when I am taken, I do not go."
    	}, {
        	Answer:"Stairs",
            Riddle:"What goes up and down but never moves?"
    	}, {
        	Answer:"TV",
            Riddle:"You like to watch me at every chance and I put you into a kind of trance."
    	}, {
        	Answer:"Washing Machine",
            Riddle:"I have a big mouth and am quite loud. I'm not into gossip, but I get involved in everyone's dirty business. What am I?"
    	}, {
        	Answer:"Window",
            Riddle:"Looking through me can be quite a paneful experience."
    	}
    ];    
}

function SaveCourse()
{    
    if ($('#sa_txtName').val().length === 0) 
    {
        MsgBox("Please enter a name for the course.");
        return;
    }
    
    g_strCourseName = $('#sa_txtName').val();
    
    InsertCourse(g_strCourseName, $('#sa_txtDesc').val(), JSON.stringify(g_arrCPs), onDBCourseSaved);    
}

function onDBCourseSaved(tx, r) {
    g_blnSaved = true;
    MsgBox("The course has been saved.");
    //NavigateToPage('#viewSavedCourse', 'slide:right');
       
    NavigateToPage('#:back', 'slide:right');
    if (IsDebug() === false) if (AdMob) AdMob.showInterstitial();
}

function LoadSavedCourseList(e) {         
    if (IsDebug() === false) if (AdMob) AdMob.showBanner(AdMob.AD_POSITION.BOTTOM_CENTER);
	db.transaction(function(tx) {
		tx.executeSql("SELECT * FROM course", [], 
            renderSavedCourseList, 
            onDBError);
	});
}

function renderSavedCourseList(tx, rs) {    
    console.log('rs.rows.length = ' + rs.rows.length);
    
    if (rs.rows.length === 0)
    {
        $('#divSavedCourses1').show();
        $('#divSavedCourses2').hide();
        return;
    }
    
    $('#divSavedCourses1').hide();
    $('#divSavedCourses2').show();
    
	var rowOutput = "";
	var objUL = document.getElementById("ulSavedList");
    
	for (var i = 0; i < rs.rows.length; i++) {
		rowOutput += renderSavedCourseRow(rs.rows.item(i));
	}
  
	objUL.innerHTML = rowOutput;       
}

function renderSavedCourseRow(row) {
    console.log(JSON.stringify(row));
	return "<li>" + "<a data-transition='slide:left' style='height:40px' class='km-listview-link'>" + row.Name + "</a><span class='hidden'>" + row.ID + "</span><a data-role='button' class='delete'>Delete</a></li>";
}

function LoadSavedCourse(intID)
{
    db.transaction(function(tx) {
		tx.executeSql("SELECT * FROM course WHERE ID = ?", [intID], 
            LoadAndPlayCourse, 
            onDBError);
	});
}

function LoadAndPlayCourse(tx, rs) {
    g_intCurrentIndex = 0;
    g_blnSaved = true;
    g_strCourseName = rs.rows.item(0).Name;
    console.log('rs.rows.item(0).CourseJSON = ' + rs.rows.item(0).CourseJSON);
    g_arrCPs = JSON.parse(rs.rows.item(0).CourseJSON);
    NavigateToPage('playcourse.html', 'slide:left');
}

function ClearSaveData(e)
{
    $('#sa_txtName').val('');
    $('#sa_txtDesc').val('');
}

function InitSavedCourseList()
{
    $("#ulSavedList").kendoTouch({
        filter: ">li",
        enableSwipe: true,
        touchstart: sl_touchstart,
        tap: sl_navigate,
        swipe: sl_swipe
    });
}

function sl_navigate(e) {
    $('.delete').hide();
    LoadSavedCourse(parseInt($(e.touch.target).find(".hidden").text()));   
}

function sl_swipe(e) {
    $('.delete').hide();
    var button = kendo.fx($(e.touch.currentTarget).find("[data-role=button]"));
    button.expand().duration(200).play();
}

function sl_touchstart(e) {
    var target, listview, button, intID;
    
    target = $(e.touch.initialTouch);
    listview = $("#ulSavedList").data("kendoMobileListView");
    button = $(e.touch.target).find("[data-role=button]:visible");

    if (target.closest("[data-role=button]")[0]) {
        intID = parseInt($(e.touch.target).find(".hidden").text())
        $(e.touch.target).slideUp();
        
        DeleteSavedCourse(intID);
        //prevent `swipe`
        this.events.cancel();
        e.event.stopPropagation();
    } else if (button[0]) {
        button.hide();
        //prevent `swipe`
        this.events.cancel();
    } else {
        listview.items().find("[data-role=button]:visible").hide();
    }
}

function DeleteSavedCourse(id) {
    console.log('DeleteSavedCourse ' + id);
	db.transaction(function(tx) {
        console.log('yo ' + id);
		tx.executeSql("DELETE FROM [course] WHERE [ID]=?", [id], onDBSuccess, onDBError);
	});
}