var reactionsNameSpace = {
    
    date: "2014-08-19 15:30:00",
    isStarted: false, //used to know if the update process must be started
    
    /*Updates the Reactions Feed*/
    callGetReactionsFeed: function (isStarted) {
        
        reactionsNameSpace.getLatestDate();

        if (!reactionsNameSpace.isStarted) {
            setInterval(function() {
                reactionsNameSpace.getLatestDate();
            }, 10000*60*5);
            reactionsNameSpace.isStarted = isStarted;
        }
    },
    
    /*Gets the Reactions Feed from Umbraco*/
    getReactionsFeed: function (loggedUserId, firstTime) {
        reactionsNameSpace.deleteReactionsFeedSQLite();
		var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedPostsFansFollowing&profileID=" + loggedUserId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl ,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                $.each(data.Data, function (i, react) {
                    var reaction = {
                        profileId: react.profileId,
                        postId: react.postId,
                        profilePhoto: react.profilePhoto,
                        handle: react.profileHandle,
                        description: react.postDescription,
                        postPhoto: react.postImageLink,
                        //postDate: react.postCreateDate,
                        postDate: reactionsNameSpace.date,
                        votes: react.postUpvoteDownvoteCount,
                    };
                    reactionsNameSpace.insertReactionsFeedIntoSQLite(reaction); 
                });
                
                if (firstTime) {
                    reactionsNameSpace.getReactionsFeedFromSQLite();
                }
            }
        }).fail(function() {
            console.log("Fail");
        });
    },
    
    /*Gets the Reactions Feed from SQLite*/
    getReactionsFeedFromSQLite: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) { 
            tx.executeSql("SELECT * FROM reactionsFeed ORDER BY postDate DESC", [], function(tx, results) { 
                var length = results.rows.length;
                reactionsNameSpace.buildReactionsList(length, results, false);
            }, sqliteNameSpace.errorCB);
        });
    },
    
    /*Checks if the Reactions Feed in SQLite is empty*/
    isReactionsFeedSQLiteEmpty: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM reactionsFeed", [], function(tx, results) {
                var length = results.rows.length;
                if (length === 0) {
                    reactionsNameSpace.getReactionsFeed(loginNameSpace.loggedUserID, true);
                }
                else {
                    reactionsNameSpace.getReactionsFeedFromSQLite();
                }

            }, sqliteNameSpace.errorCB);
        });
    },
    
    /*Deletes the Reactions Feed from SQLite*/
    deleteReactionsFeedSQLite: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM reactionsFeed", [], function(tx, results) {
                console.log("Reactions Feed deleted!");
            }, sqliteNameSpace.errorCB);
        });
    },
    
    getLatestDate: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) { 
            tx.executeSql("SELECT postDate FROM reactionsFeed ORDER BY postDate DESC LIMIT 1", [], function(tx, results) {

                reactionsNameSpace.deleteReactionsFeedSQLite();
                reactionsNameSpace.getReactionsFeed(loginNameSpace.loggedUserID, false);
                reactionsNameSpace.getNewReactions(results.rows.item(0).postDate);
                console.log(results.rows.item(0).postDate);
            }, sqliteNameSpace.errorCB);
        });
    },
    
    /*Gets the latest reactions*/
    getNewReactions: function (date) {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM reactionsFeed WHERE postDate > '" + date + "'", [], function(tx, results) {
                var len = results.rows.length;
                console.log("length: ------> " + len);
                
                if (len > 0) {
                    $("#newReactions").show();
                    $("#newReactions").click(function () {
                        reactionsNameSpace.buildReactionsList(len, results, true);
                        $("#newReactions").hide();
                    });
                    
                }
            }, sqliteNameSpace.errorCB);
        });
    },

    /*Builds the Reactions List*/
    buildReactionsList: function (length, results, beginning) {
        for (var i = 0; i < length; i++) {
            var reactionsDiv = '';
            //var profilePhoto = 'http://fanreact.dev.contentactive.com' + results.rows.item(i).profilePhoto;
            var profilePhoto = results.rows.item(i).profilePhoto;
            var votes = results.rows.item(i).votes;
            //if ( votes < 0 ) { votes = 0 ; }
            reactionsDiv += '<div class="entry"><div class="avatar"><div class="img round" style="background-image: url(' + profilePhoto + ');" ></div>';
            reactionsDiv += '<p class="username"><a onclick="profileNameSpace.profileID = ' + results.rows.item(i).umbracoID + ' ; location.hash=\'../profile/profileByIdView.html\';">' + results.rows.item(i).handle + '</a></p><p class="message">' + results.rows.item(i).description + '</p></div>';
            reactionsDiv += '<img src="' + results.rows.item(i).postPhoto + '" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + results.rows.item(i).postId + '\');  commentNameSpace.postId=' + results.rows.item(i).postId + '" /><div class="subject"><p class="posted"><i class="fa fa-clock-o"></i> Posted: June 9th, 2014</p></div>';
            reactionsDiv += '<div class="postOptions" cellpadding="0" cellspacing="0"><p class="comment"><a onclick="location.hash=\'../post/postToPublicView.html\'; $(\'#postToPublicViewPostId\').val(\'' + results.rows.item(i).postId + '\');  commentNameSpace.postId=' + results.rows.item(i).postId + '" data-transition="none"><i class="fa fa-comment-o"></i> Post Comment</a></p>';
            reactionsDiv += '<ul class="thumbs"><li class="up"><a href="#">';
            reactionsDiv += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + results.rows.item(i).postId + ' , 1 )" class="fa fa-thumbs-o-up"></i></a></li>';
            reactionsDiv += '<li id="voteOfpostId' + results.rows.item(i).postId + '" class="number">' + votes + '</li>';
            reactionsDiv += '<li class="down"><a href="#">';
            reactionsDiv += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + results.rows.item(i).postId + ' , -1 )" class="fa fa-thumbs-o-down"></i></a></li></ul>';
            reactionsDiv += '</div></div>';
            
            if (beginning) {
                $("#reactionsFeed").prepend(reactionsDiv);
            }
            else {
                $("#reactionsFeed").append(reactionsDiv);
            }

            //$('html, body').stop().animate({ scrollTop: 0 }, 500);
        }    
    },
    
    /*Inserts the Reactions Feed into the SQLite Database*/
    insertReactionsFeedIntoSQLite: function (reaction) {
        console.log(reaction.profileId);
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO reactionsFeed(umbracoID, postId, profilePhoto, handle, description, postPhoto, postDate, votes, added_on) VALUES (?,?,?,?,?,?,?,?,?)",
                          [reaction.profileId, reaction.postId, reaction.profilePhoto, reaction.handle, reaction.description, reaction.postPhoto, reaction.postDate, reaction.votes, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },
    
    /*Formats the date*/
    formatDate: function (d, m, y) {
        if ((isNaN(d)) || (isNaN(m)) || (isNaN(y))) {
            return "";
        }
        
        var month = "";
        switch(m) {
            case 0:
            	month = "January";
            	break;
            case 1:
            	month = "February";
            	break;
            case 2:
            	month = "March";
            	break;
            case 3:
            	month = "April";
            	break;
            case 4:
            	month = "May";
            	break;
            case 5:
            	month = "June";
            	break;
            case 6:
            	month = "July";
            	break;
            case 7:
            	month = "August";
            	break;
            case 8:
            	month = "September";
            	break;
            case 9:
            	month = "October";
            	break;
            case 10:
            	month = "November";
            	break;
            case 11:
            	month = "December";
            	break;
        }
        
        return month + " " + d + ", " + y;
    } 
  
};