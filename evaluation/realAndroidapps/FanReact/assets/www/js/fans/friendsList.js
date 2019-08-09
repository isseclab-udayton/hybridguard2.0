var friendsListNameSpace = {
    
    myFansTotal: 0,
    fanFeed: null,
    
    /*Checks if My Fans List in SQLite is empty*/
    isMyFansSQLiteEmpty: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM myFans", [], function(tx, results) {
                var length = results.rows.length;
                if (length === 0) {
                    friendsListNameSpace.getMyFans(loginNameSpace.loggedUserID, true);
                } 
                else {
                    friendsListNameSpace.getMyFansFromSQLite();
                    friendsListNameSpace.getMyFans(loginNameSpace.loggedUserID, false);
                    
                }
            }, sqliteNameSpace.errorCB);
        });
    },
        
    /*Gets my fans list*/
    getMyFans: function (loggedUserId, firstTime) {
        friendsListNameSpace.deleteMyFansSQLite();
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFansFollowedListing&profileID=' + loggedUserId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
               friendsListNameSpace.fanFeed = data;
               friendsListNameSpace.buildFriendsList(data);
            }
            else if (data.ErrorCode === 1) {
            }

        }).fail(function(data) {
            console.log(data);
            friendsListNameSpace.buildFriendsList(friendsListNameSpace.fanFeed);   
        });
    },
    
    /*Gets MyFans List from SQLite*/
    getMyFansFromSQLite: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM myFans", [], function(tx, results) {
                var length = results.rows.length;
                if (length > 0) {
                    friendsListNameSpace.buildFriendsList(length, results);
                }
            }, sqliteNameSpace.errorCB);
        });
    },
    
    /*Builds the friends list*/
    buildFriendsList: function (data) {
        
        var count = 0;
        
        var Data = data.Data;
        $.each( Data, function( index, element){            
            friendsListNameSpace.sortAlphabetically(element);
        });
                        
        friendsListNameSpace.myFansTotal = Data.length;
        
        //var title = $("#myFansTitle").text();
        var title = "My Fans ";
        $("#myFansTitle").text(title + " (" + friendsListNameSpace.myFansTotal + ")");
        $("#myFansTotal").text(friendsListNameSpace.myFansTotal);
         console.log("profileHandle my fans count-----------------------------"+count);
           
    },
    
    /*Sorts alphabetically the fansOf list*/
    sortAlphabetically: function (fan) {    
        var friend = '';
        var photo = customNamespace.image.resizeAsThumbnail( fan.profilePhoto );
        var profileId = fan.profileId;
        var formattedfan=fan.profileHandle;
        
        
        //replace empty avatar
        if ( photo == '')
        {
            photo = '../../images/default-avatar.png';
        }
        
        if(formattedfan.length>15){formattedfan= fan.profileHandle.substring(0,14)+"...";}
        
        friend += '<tr onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" ';
        friend += 'class="friend"><td class="image"><div class="img round" style="background-image: url(' + photo + ');"></div></td><td class="text"><h2>';
        friend += '<a >'+ formattedfan+'</a></h2>';
        //friend += '<a href="#popupDelete" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-transition="pop" class="deleteUser"></a>';
        friend += '</td></tr>';
        
        switch (fan.profileHandle.charAt(0).toUpperCase()  ) {
            case 'A':
                $("#aContainerMyFans").show();
                $("#aContainerMyFans").append(friend);
                break;
            case 'B':
                $("#bContainerMyFans").show();
                $("#bContainerMyFans").append(friend);
                break;
            case 'C':
                $("#cContainerMyFans").show();
                $("#cContainerMyFans").append(friend);
                break;
            case 'D':
                $("#dContainerMyFans").show();
                $("#dContainerMyFans").append(friend);
                break;
            case 'E':
                $("#eContainerMyFans").show();
                $("#eContainerMyFans").append(friend);
                break;
            case 'F':
                $("#fContainerMyFans").show();
                $("#fContainerMyFans").append(friend);
                break;
            case 'G':
                $("#gContainerMyFans").show();
                $("#gContainerMyFans").append(friend);
                break;
            case 'H':
                $("#hContainerMyFans").show();
                $("#hContainerMyFans").append(friend);
                break;
            case 'I':
                $("#iContainerMyFans").show();
                $("#iContainerMyFans").append(friend);
                break;
            case 'J':
                $("#jContainerMyFans").show();
                $("#jContainerMyFans").append(friend);
                break;
            case 'K':
                $("#kContainerMyFans").show();
                $("#kContainerMyFans").append(friend);
                break;
            case 'L':
                $("#lContainerMyFans").show();
                $("#lContainerMyFans").append(friend);
                break;
            case 'M':
                $("#mContainerMyFans").show();
                $("#mContainerMyFans").append(friend);
                break;
            case 'N':
                $("#nContainerMyFans").show();
                $("#nContainerMyFans").append(friend);
                break;
            case 'O':
                $("#oContainerMyFans").show();
                $("#oContainerMyFans").append(friend);
                break;
            case 'P':
                $("#pContainerMyFans").show();
                $("#pContainerMyFans").append(friend);
                break;
            case 'Q':
                $("#qContainerMyFans").show();
                $("#qContainerMyFans").append(friend);
                break;
            case 'R':
                $("#rContainerMyFans").show();
                $("#rContainerMyFans").append(friend);
                break;
            case 'S':
                $("#sContainerMyFans").show();
                $("#sContainerMyFans").append(friend);
                break;
            case 'T':
                $("#tContainerMyFans").show();
                $("#tContainerMyFans").append(friend);
                break;
            case 'U':
                $("#uContainerMyFans").show();
                $("#uContainerMyFans").append(friend);
                break;
            case 'V':
                $("#vContainerMyFans").show();
                $("#vContainerMyFans").append(friend);
                break;
            case 'W':
                $("#wContainerMyFans").show();
                $("#wContainerMyFans").append(friend);
                break;
            case 'X':
                $("#xContainerMyFans").show();
                $("#xContainerMyFans").append(friend);
                break;
            case 'Y':
                $("#yContainerMyFans").show();
                $("#yContainerMyFans").append(friend);
                break;
            case 'Z':
                $("#zContainerMyFans").show();
                $("#zContainerMyFans").append(friend);
                break;
        }
    },
    
    /*Inserts MyFans List into the SQLite Database*/
    insertMyFansIntoSQLite: function (myFan) {
        return false;
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO myFans(umbracoID, handle, profilePhoto, added_on) VALUES (?,?,?,?)",
                          [myFan.umbracoID, myFan.handle, myFan.profilePhoto, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },
    
    /*Deletes MyFans List from SQLite*/
    deleteMyFansSQLite: function () {
        return false;
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM myFans", [], function(tx, results) {
                console.log("My Fans deleted!");
            }, sqliteNameSpace.errorCB);
        });
    },
    
    getMyFansCount: function () {
        var profileID = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFansFollowedListing&profileID=' + profileID;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function(data) {
            $(".countFansForCommonFooter").html(data.Count);
        })
    },
};

////////////////////////////////// begin get fan of of other profile //////////////////////////////


/*Gets my fans list*/
friendsListNameSpace.getMyFansByOtherProfile = function () {
    
    var profileID = fansNameSpace.otherProfile;
    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFansFollowedListing&profileID=' + profileID;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function(data) {
        if (data.ErrorCode === 0) {
            friendsListNameSpace.buildFriendsListByOtherProfile(data);
                
        }
        else if (data.ErrorCode === 1) {
        }

    }).fail(function() {
        console.log("Fail");
    });
}
        
/*Builds the friends list*/
friendsListNameSpace.buildFriendsListByOtherProfile = function (data) {
        
    var count = 0;  

    $.each(data.Data, function (i, otherFan) {
        var fan = {
            profileId: otherFan.profileId,
            profilePhoto: otherFan.profilePhoto,
            profileHandle: otherFan.profileHandle
        };
        friendsListNameSpace.sortAlphabetically(fan);
        count = i + 1;
    });
                
    friendsListNameSpace.myFansTotal = count;
        
    //var title = $("#myFansTitle").text();
    var title = "My Fans ";
    $("#myFansTitle").text(title + " (" + count + ")");
    $("#myFansTotal").text(count);
           
}
    

////////////////////////////////// end get fan of of other profile //////////////////////////////


/*Builds the friends list*/
friendsListNameSpace.checkFollow = function ( customData , onSuccess , onFail ) {
    
    window.GetFanListThisUserFollowing.Variables.profileID = loginNameSpace.loggedUserID;
    var IdToCheck =  customData.profileId ;
    window.GetFanListThisUserFollowing.DataUpdatedEvent = function(){ 
        var data = window.GetFanListThisUserFollowing.JsonObject.Data ;
        var found = false ; 
        $.each( data , function( index , element ){
            if( IdToCheck == element.profileId ){
        		found = true;
                return false;
            }
        });
        found == true ? onSuccess( data ) : onFail( data );
    }
    window.GetFanListThisUserFollowing.Execute( window.FeedManager ) ;
}

/*Builds the friends list*/

friendsListNameSpace.callFeed = function ( customData , onSuccess , onFail ) {

    customData = customData == undefined ? {} : customData ;
    window.GetFanListFollowingThisUser.Variables.profileID = customData.profileId || loginNameSpace.loggedUserID ;
    window.GetFanListFollowingThisUser.DataUpdatedEvent = function( data ){ 
        if (window.GetFanListFollowingThisUser.JsonObject.ErrorCode === 0) {
        	try{ onSuccess( window.GetFanListFollowingThisUser.JsonObject  ) } catch(err){};

        } else {
            customData.responseOnFail = data ;
            try{ onFail( customData  ); } catch(err){};
        }	
    }
    window.GetFanListFollowingThisUser.DataUpdatedEventOnFail = function( data ){
        customData.responseOnFail = data ;
        try{ onFail( customData  );} catch(err){};
    }
    window.GetFanListFollowingThisUser.Execute( window.FeedManager ) ;
}


    