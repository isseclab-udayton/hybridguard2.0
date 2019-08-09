var votingNameSpace = {
    isStarted: false, //used to know if the update process must be started
    postID: null,
    voteCount: null,

    /*Checks if this postId vote count is in SQLite or not*/
    checkIfThisPostVoteInSqlLiteAndAction: function (postID, voteCount) {
        votingNameSpace.postID = postID;
        votingNameSpace.voteCount = voteCount;
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            tx.executeSql("SELECT * FROM votings where postId = " + postID, [], function (tx, results) {
                var length = results.rows.length;
                if (length == 0) {
                    var minus1is0 = 1;
                    if (votingNameSpace.voteCount == -1) { minus1is0 = 0; }
                    votingNameSpace.insertIntoSqlLite(votingNameSpace.postID, minus1is0);
                    votingNameSpace.updateServer(votingNameSpace.postID, voteCount);
                } else if (length == 1) {
                    votingNameSpace.checkifThisVoteIsUpOrDownAndAction(votingNameSpace.postID, votingNameSpace.voteCount);
                }

            }, sqliteNameSpace.errorCB);
        });
    },

    /*Inserts the Vote into the SQLite Database*/
    insertIntoSqlLite: function (postID, voteCount) {
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO votings( postId, voteCount , added_on) VALUES (?,?,?)",
                          [postID, voteCount, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },


    checkifThisVoteIsUpOrDownAndAction: function (postID, vote) {
        var query;
        if (vote == 1) { query = 'SELECT * FROM votings WHERE postId = ' + postID + ' and  voteCount = 0 '; }
        if (vote == -1) { query = 'SELECT * FROM votings WHERE postId = ' + postID + ' and  voteCount = 1 '; }
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            tx.executeSql(query, [], function (tx, results) {
                var length = results.rows.length;
                if (length == 1) {
                    vote = vote * 2 ;
                    votingNameSpace.updateServer(votingNameSpace.postID, vote);
                }

            }, sqliteNameSpace.errorCB);
        });
    },

    updateServer: function (postID, voteCount) {
        
        var profileId = loginNameSpace.loggedUserID;
        
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedVote&postId=" + postID + "&vote=" + voteCount + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            if(data.ErrorCode == 0) {
                
                votingNameSpace.updateSqlLite(votingNameSpace.postID, voteCount);
            }
            
            else if (data.ErrorCode != 0) {
                
                console.log( data );
            }
            //if (data.indexOf("Updated!") > -1 && voteCount == 1) {
            //   votingNameSpace.updateSqlLite(votingNameSpace.postID, 0, 1);
            //}
            //if (data.indexOf("Updated!") > -1 && voteCount == -1) {
            //    votingNameSpace.updateSqlLite(votingNameSpace.postID, 1, 0);
            //}
        }).fail(function () {
            console.log("Fail");
        });
    },

    updateSqlLite: function (postID, voteCount) {
        var fromVoteCount;
        var toVoteCount = voteCount;
        if (toVoteCount == 2 || toVoteCount == -2 ) {
            toVoteCount = toVoteCount / 2;
            //voteCount = voteCount / 2;
        }
        if (toVoteCount == 1) {
            fromVoteCount = 0;
            toVoteCount = 1;
        }
        if (toVoteCount == -1) {
            fromVoteCount = 1;
            toVoteCount = 0;
        }
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            var addedOn = new Date();
            tx.executeSql('UPDATE votings SET voteCount = ' + toVoteCount + ' where postId = ' + postID + ' AND voteCount = ' + fromVoteCount,
                           //[], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
                          [], votingNameSpace.displayVote(postID, voteCount), sqliteNameSpace.onError);
        });
    },

    displayVote: function (postID, voteCount) {
        //var currentVotes = $('#currentVoteOfpostId' + postID).val();
        var currentVotes = $('#voteOfpostId' + postID).html();
        if ( currentVotes == undefined || currentVotes == '' ){
            currentVotes = $('.voteOfpostId' + postID).html();
        }
        var updatedVotes = Number(currentVotes) + voteCount;
        //if ( updatedVotes < 0 ) { updatedVotes = 0 ; }
        $('#voteOfpostId' + postID).html(updatedVotes);
        $('.voteOfpostId' + postID).html(updatedVotes);
        votingNameSpace.checkIfVoteIsUpOrDownAndChangeColor(postID);
    },

    checkIfVoteIsUpOrDownAndChangeColor: function (postID) {
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            tx.executeSql("SELECT * FROM votings where postId = " + postID, [], function (tx, results) {


                var length = results.rows.length;
                if (length == 0) {
                    //$('#voteOfpostId' + postID).css('color', 'yellow');
                    return false;
                }

                var voteCount = results.rows.item(0).voteCount;
                if (length == 1 & voteCount == 1  ) {
                    $('#voteOfpostId' + postID).css('color','green');
                    $('.voteOfpostId' + postID).css('color','green');
                }
                else if (length == 1 & voteCount == 0) {
                    $('#voteOfpostId' + postID).css('color', 'red');
                    $('.voteOfpostId' + postID).css('color', 'red');
                }

            }, sqliteNameSpace.errorCB);
        });
    }

};