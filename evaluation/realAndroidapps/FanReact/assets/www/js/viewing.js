var viewingNameSpace = {
    postId: null,

    /*Checks if this postId vote count is in SQLite or not*/
    checkIfThisPostViewedInSqlLiteAndAction: function (postID) {
        viewingNameSpace.postId = postID ;
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            tx.executeSql("SELECT * FROM viewings where postId = " + postID, [], function (tx, results) {
                var length = results.rows.length;
                if (length == 0) {
                    viewingNameSpace.insertIntoSqlLite(postID);
                }
            }, sqliteNameSpace.errorCB);
        });
    },

    /*Inserts the Vote into the SQLite Database*/
    insertIntoSqlLite: function (postID) {
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO viewings( postId, viewCount , added_on) VALUES (?,?,?)",
                          [postID, 1, addedOn], viewingNameSpace.updateServer, sqliteNameSpace.onError);
        });
    },

    /*Inserts the Vote into the SQLite Database*/
    updateServer: function () {
        var postID = viewingNameSpace.postId;
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedPostView&postId=" + postID ;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl 
        }).success(function (data) {
            //console.log('viewingNameSpace.updateServer()' + data);
        }).fail(function() {
            console.log("Fail");
        });
    }
};