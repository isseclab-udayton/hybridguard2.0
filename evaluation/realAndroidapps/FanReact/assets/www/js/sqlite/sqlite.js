document.addEventListener("deviceready", init, false);
//document.addEventListener("touchstart", function() {}, false);

/* ---- SQLite Namespace ---- */
var sqliteNameSpace = {};
sqliteNameSpace.db = null;
    
/*Opens the SQLite Database*/
sqliteNameSpace.openDb = function() {
    
    if (window.navigator.simulator === true) {
        sqliteNameSpace.db = window.openDatabase("FanReactDB.db", "1.0", "Cordova", 200000);
        var db = sqliteNameSpace.db;
        sqliteNameSpace.createTable();
        db.transaction(function(tx) {
            tx.executeSql('SELECT * FROM user', [], sqliteNameSpace.querySuccess, sqliteNameSpace.errorCB);
        });
        loginNameSpace.isUserLogged();

    } else {
        //window.sqlitePlugin.deleteDatabase("FanReactDB.db", function () {alert("Database deleted!")}, function () {alert("Database not deleted!")});
        sqliteNameSpace.db = window.sqlitePlugin.openDatabase({name: "FanReactDB.db"});
        sqliteNameSpace.createTable();
        loginNameSpace.isUserLogged();
    }
}

/*Creates the tables*/      
sqliteNameSpace.createTable = function() {
    var db = sqliteNameSpace.db;
    db.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS user(ID INTEGER PRIMARY KEY ASC, umbracoID INT, handle TEXT, email TEXT, password TEXT, account_type TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS reactionsFeed(ID INTEGER PRIMARY KEY ASC, umbracoID INT, postId INT, profilePhoto TEXT, handle TEXT, description TEXT, postPhoto TEXT, postDate DATETIME, votes INT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS profileFeed(ID INTEGER PRIMARY KEY ASC, postId INT, profilePhoto TEXT, profilehandle TEXT, postTitle TEXT, description TEXT, postPhoto TEXT, postDate DATETIME, votes INT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS trendingFeed(ID INTEGER PRIMARY KEY ASC, postCreateDateTime DATETIME, postId INT, profileId INT, teamId INT, postTitle TEXT, postDescription TEXT, postVideoLink TEXT, postImageLink TEXT, postCreateDate DATETIME, postUpvoteDownvoteCount INT, postFlagMessage INT, fanreactCommentsCount INT, profileHandle TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS commentFeed(ID INTEGER PRIMARY KEY ASC, commentId INT, profileId INT, postId INT, profileHandle TEXT, profilePhoto TEXT, commentVideoLink TEXT, commentImageLink TEXT, commentDescription TEXT, commentCreateDate DATETIME, added_on DATETIME)", []);       
        tx.executeSql("CREATE TABLE IF NOT EXISTS myFans(ID INTEGER PRIMARY KEY ASC, umbracoID INT, handle TEXT, profilePhoto TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS fansOf(ID INTEGER PRIMARY KEY ASC, umbracoID INT, handle TEXT, profilePhoto TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS socialLogin(ID INTEGER PRIMARY KEY ASC, umbracoID INT, socialID INT, handle TEXT, email TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS loggedUser(ID INTEGER PRIMARY KEY ASC, umbracoID INT, socialID TEXT, provider TEXT, email TEXT, password TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS settings(ID INTEGER PRIMARY KEY ASC, syncTwitter BOOLEAN, syncGoogle BOOLEAN, syncFacebook BOOLEAN, appNotification BOOLEAN, condition TEXT, privacy TEXT, about TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS myTeams(ID INTEGER PRIMARY KEY ASC, teamId INT, teamName TEXT, teamIcon TEXT, GameCenter INT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS votings(ID INTEGER PRIMARY KEY ASC, postId INT, voteCount INT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS viewings(ID INTEGER PRIMARY KEY ASC, postId INT, viewCount INT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS allSports(ID INTEGER PRIMARY KEY ASC, teamSport TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS teamFeed(ID INTEGER PRIMARY KEY ASC, postId INT, profileId INT, teamId INT, scheduleId INT, postTitle TEXT, postDescription TEXT, postVideoLink TEXT, postImageLink TEXT, postCreateDate DATETIME, postUpvoteDownvoteCount INT, postFlagMessage INT, profileHandle TEXT, added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS gameCenter(ID INTEGER PRIMARY KEY ASC, feed TEXT, trend TEXT, list TEXT added_on DATETIME)", []);
        tx.executeSql("CREATE TABLE IF NOT EXISTS phoneNotifications(ID INTEGER PRIMARY KEY ASC, enableNotification BOOLEAN, enableVibration BOOLEAN, added_on DATETIME)", []);
    });
};
      
/*If there's an error in a sql execution, this function shows the error message*/      
sqliteNameSpace.onError = function(tx, e) {
    console.log("Error: " + e.message);
} 

/*Shows a success message if a sql execution is correct*/      
sqliteNameSpace.onSuccess = function(tx, r) {
	//try{
    //console.log("Success: " + r.insertId);
	//}catch(err){console.log(err.message)}
};
 
sqliteNameSpace.querySuccess = function(tx, results) {
    //var len = results.rows.length;
    //console.log("User table: " + len + " rows found.");
    //for (var i = 0; i < len; i++) {
    //    console.log("Row = " + i + " ID = " + results.rows.item(i).umbracoID + " Email =  " + results.rows.item(i).email);
    //}
};

sqliteNameSpace.errorCB = function(err) {
    console.log("Error processing SQL: " + err.code);
};


/*Init the Database*/     
function init() {
    sqliteNameSpace.openDb();
}
      