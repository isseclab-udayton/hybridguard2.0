
var resetApp = {};

resetApp.resetapp = function () {
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {
       
        var success = function (length, name) {

            if (length == 2 ) {
                
                var afterDisablePush = function(){
                    
                    
                    loginNameSpace.profileHandle = null ;
                    registerNameSpace.profileId = '' ;
                    registerNameSpace.UserExists = null;
                    registerNameSpace.profileFullName = '';
                    registerNameSpace.profileEmail = '';
                    customNamespace.page.goTo( 'views/welcome/welcomeView.html' );
                    sqliteNameSpace.createTable();
                }
                pushNamespace.disablePushNotifications();
                afterDisablePush();
            }
        }

        var error = function()
        {

            location.href = "welcome.html";
            console.log("Problem deleting table");
        }

        getTableNames = function (tx, results) {
            var length = results.rows.length;

            while (length > 1) {
                name = results.rows.item(length - 1).name;
                tx.executeSql("Drop TABLE " + name + "", [], success(length, name), error);
                length--;
            }
        }
        tx.executeSql(" SELECT name FROM sqlite_master WHERE type='table' ORDER BY name", [], getTableNames, sqliteNameSpace.errorCB);
      
    });
};


resetApp.getAllUserData = function () {
    console.log("clicked");
    var name;
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
       
            var success = function () {
                console.log("Table displayed");
            }

            var error = function()
            {
                console.log("Problem displaying table");
            }

            getData = function (tx, results) {
                var length = results.rows.length;

                for (var i = 0; i < length; i++)
                {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class=""><ol><li class=""><b>Provider:</b>' + results.rows.item(i).provider + '</li>';
                tableDisplay += ' <li class=""><b>Email: </b>' + results.rows.item(i).email + '</li>';
                tableDisplay += '<li class=""><b>Password: </b>' + results.rows.item(i).password + '</li>';
                    tableDisplay += '<li class=""><b>Added_on: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayDataId").append(tableDisplay);
                }
                
                console.log(tableDisplay);
            }
            tx.executeSql(" SELECT * FROM loggedUser", [], getData, success);
            
        });
};

resetApp.getTrendingFeed = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>UmbracoID: </b>' + results.rows.item(i).umbracoID + '</li>';
                tableDisplay += ' <li class=""><b>Handle: </b>' + results.rows.item(i).handle + '</li>';
                tableDisplay += '<li class=""><b>Description: </b>' + results.rows.item(i).description + '</li>';
                tableDisplay += '<li class=""><b>PostPhoto: </b>' + results.rows.item(i).postPhoto + '</li>';
                tableDisplay += '<li class=""><b>PostDate: </b>' + results.rows.item(i).postDate + '</li>';
                tableDisplay += '<li class=""><b>Votes: </b>' + results.rows.item(i).votes + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayTrendingFeedId").append(tableDisplay);
            }
           
            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM trendingFeed", [], getData, success);

    });  
};

resetApp.getReactionsFeed = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>UmbracoID: </b>' + results.rows.item(i).umbracoID + '</li>';
                tableDisplay += ' <li class=""><b>profilePhoto: </b>' + results.rows.item(i).profilePhoto + '</li>';
                tableDisplay += ' <li class=""><b>Handle: </b>' + results.rows.item(i).handle + '</li>';
                tableDisplay += '<li class=""><b>Description: </b>' + results.rows.item(i).description + '</li>';
                tableDisplay += '<li class=""><b>PostPhoto: </b>' + results.rows.item(i).postPhoto + '</li>';
                tableDisplay += '<li class=""><b> PostDate: </b>' + results.rows.item(i).postDate + '</li>';
                tableDisplay += '<li class=""><b> Votes: </b>' + results.rows.item(i).votes + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayReactionsFeedId").append(tableDisplay);
            }

            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM reactionsFeed", [], getData, success);

    });
};

resetApp.getMyFans = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>UmbracoID: </b>' + results.rows.item(i).umbracoID + '</li>';
                tableDisplay += ' <li class=""><b> Handle: </b>' + results.rows.item(i).handle + '</li>';
                tableDisplay += ' <li class=""><b>profilePhoto: </b>' + results.rows.item(i).profilePhoto + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayMyFansId").append(tableDisplay);
            }

            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM myFans", [], getData, success);

    });
};

resetApp.getFansOf = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>UmbracoID: </b>' + results.rows.item(i).umbracoID + '</li>';
                tableDisplay += ' <li class=""><b>Handle: </b>' + results.rows.item(i).handle + '</li>';
                tableDisplay += ' <li class=""><b>profilePhoto: </b>' + results.rows.item(i).profilePhoto + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayFansOfId").append(tableDisplay);
            }

            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM fansOf", [], getData, success);

    });
};

resetApp.getProfileFeed = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>UmbracoID: </b>' + results.rows.item(i).umbracoID + '</li>';
                tableDisplay += ' <li class=""><b> profilePhoto: </b>' + results.rows.item(i).profilePhoto + '</li>';
                tableDisplay += ' <li class=""><b>Handle: </b>' + results.rows.item(i).handle + '</li>';
                tableDisplay += ' <li class=""><b>Description: </b>:' + results.rows.item(i).description + '</li>';
                tableDisplay += ' <li class=""><b>Post Photo : </b>' + results.rows.item(i).postPhoto + '</li>';
                tableDisplay += ' <li class=""><b>Post Date : </b>' + results.rows.item(i).postDate + '</li>';
                tableDisplay += ' <li class=""><b>Votes : </b>' + results.rows.item(i).votes + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displayProfileFeedDataId").append(tableDisplay);
            }

            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM profileFeed", [], getData, success);

    });
};

resetApp.getSettingsData = function () {
    console.log("clicked");
    var name;
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {

        var success = function () {
            console.log("Table displayed");
        }

        var error = function () {
            console.log("Problem displaying table");
        }

        getData = function (tx, results) {
            var length = results.rows.length;

            for (var i = 0; i < length; i++) {
                var tableDisplay = '';
                tableDisplay += '<table style="width:300px" class="">';
                tableDisplay += '<ol><li class=""><b>syncTGwitter: </b>' + results.rows.item(i).syncTwitter + '</li>';
                tableDisplay += ' <li class=""><b> syncGoogle: </b>' + results.rows.item(i).syncGoogle + '</li>';
                tableDisplay += ' <li class=""><b>syncFB: </b>' + results.rows.item(i).syncFacebook + '</li>';
                tableDisplay += ' <li class=""><b>appNotification: </b>:' + results.rows.item(i).appNotification + '</li>';
                tableDisplay += ' <li class=""><b>Condition : </b>' + results.rows.item(i).condition + '</li>';
                tableDisplay += ' <li class=""><b>Privacy : </b>' + results.rows.item(i).privacy + '</li>';
                tableDisplay += ' <li class=""><b>About : </b>' + results.rows.item(i).about + '</li>';
                tableDisplay += '<li class=""><b>Addedon: </b>' + results.rows.item(i).added_on + '</li>';
                tableDisplay += '</ol></table>';
                $("#displaySettingDataId").append(tableDisplay);
            }

            console.log(tableDisplay);
        }
        tx.executeSql(" SELECT * FROM settings", [], getData, success);

    });
};


