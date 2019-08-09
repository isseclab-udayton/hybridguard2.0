var fansOfNameSpace = {
    
    unfollowThisId: null,
    defaultfansOfList: null,
    fansOfTotal: 0,
    fanFeed:null,
    
    /*Checks if Fans Of List in SQLite is empty*/
    isFansOfSQLiteEmpty: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM fansOf", [], function(tx, results) {
                var length = results.rows.length;
                if (length === 0) {
                    fansOfNameSpace.getFansOf(loginNameSpace.loggedUserID, true);
                } 
                else {
                    //fansOfNameSpace.getFansOfFromSQLite();
                    //fansOfNameSpace.getFansOf(loginNameSpace.loggedUserID, false);
                    fansOfNameSpace.getFansOf(loginNameSpace.loggedUserID, true);
                    
                }
            }, sqliteNameSpace.errorCB);
        });
    },
    
    
    /*Gets the fans of list*/
    getFansOf: function (loggedUserId, firstTime) {
        fansOfNameSpace.deleteMyFansSQLite();
        $.ajax({
            type: "GET",            
            url: domainNameSpace.name + "/?alttemplate=JsonFeedFansFollowingListing&profileID=" + loggedUserId,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                fansOfNameSpace.fanFeed = data;
                fansOfNameSpace.buildFansOfList(data);
            }
            else if (data.ErrorCode === 1) {
                $("#fansOfTotal").text("0 Fans");
            }

        }).fail(function() {
            console.log("Fail");
            fansOfNameSpace.buildFansOfList(fansOfNameSpace.fanFeed); 
        });
    },
    
    /*Gets FansOf List from SQLite*/
    getFansOfFromSQLite: function () {
        
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM fansOf ORDER BY handle", [], function(tx, results) {
                var length = results.rows.length;
                if (length > 0) {
                    fansOfNameSpace.buildFansOfList(length, results);
                }
            }, sqliteNameSpace.errorCB);
         });
    },
        
    refreshHeader: function(count)
    {
         var title = $("#fansOfTitle").text();
         title = 'Fan Of';
         $("#fansOfTitle").text(title + " (" + count + ")"); 
    },
    
    /*Builds the fansOf list*/
    buildFansOfList: function (data) {
               
        var count = 0; 
       
        var Data = data.Data;
        $.each( Data, function( index, element){            
            fansOfNameSpace.sortAlphabetically(element);
        });
        
        fansOfNameSpace.fansOfTotal = Data.length;
        var title = $("#fansOfTitle").text();
        title = 'Fan Of';
        $("#fansOfTitle").text(title + " (" + fansOfNameSpace.fansOfTotal + ")");
       
    },
    
    
    /*Sorts alphabetically the fansOf list*/
    sortAlphabetically: function (fan) {    
        var fanOf = '';
        var photo = customNamespace.image.resizeAsThumbnail( fan.profilePhoto );
        
        var profileId = fan.profileId;
        
         
        //replace empty avatar
        if ( photo == '')
        {
            photo = '../../images/default-avatar.png';
        }
        
        
        fanOf += '<tr class="friend"><td class="image">';
        fanOf += '<div onclick="';
        fanOf += '  profileNameSpace.profileID = ' + profileId + ' ;';
        fanOf += '  location.hash=\'../profile/profileByIdView.html\';';
        fanOf += '"class="round" style="background-image: url('+ photo +');"></div></td>';
        fanOf += '<td class="text"><h2><a>';
        fanOf += '<span onclick="';
        fanOf += '  profileNameSpace.profileID = ' + profileId + ' ;';
        fanOf += '  location.hash=\'../profile/profileByIdView.html\';';
        fanOf += '">' + fan.profileHandle + '</span>';
        fanOf += '</a></h2>';

        if (fansNameSpace.otherProfile == loginNameSpace.loggedUserID) {
            fanOf += '<a onclick="fansOfNameSpace.unfollowThisId=' + profileId + ';" href="#popupDelete" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-transition="pop" class="deleteUser"></a>';
        }
        fanOf += '</td></tr>';
        
        switch (   fan.profileHandle.charAt(0).toUpperCase()  ) {
            case 'A':
                $("#aContainer").show();
                $("#aContainer").append(fanOf);
                break;
            case 'B':
                $("#bContainer").show();
                $("#bContainer").append(fanOf);
                break;
            case 'C':
                $("#cContainer").show();
                $("#cContainer").append(fanOf);
                break;
            case 'D':
                $("#dContainer").show();
                $("#dContainer").append(fanOf);
                break;
            case 'E':
                $("#eContainer").show();
                $("#eContainer").append(fanOf);
                break;
            case 'F':
                $("#fContainer").show();
                $("#fContainer").append(fanOf);
                break;
            case 'G':
                $("#gContainer").show();
                $("#gContainer").append(fanOf);
                break;
            case 'H':
                $("#hContainer").show();
                $("#hContainer").append(fanOf);
                break;
            case 'I':
                $("#iContainer").show();
                $("#iContainer").append(fanOf);
                break;
            case 'J':
                $("#jContainer").show();
                $("#jContainer").append(fanOf);
                break;
            case 'K':
                $("#kContainer").show();
                $("#kContainer").append(fanOf);
                break;
            case 'L':
                $("#lContainer").show();
                $("#lContainer").append(fanOf);
                break;
            case 'M':
                $("#mContainer").show();
                $("#mContainer").append(fanOf);
                break;
            case 'N':
                $("#nContainer").show();
                $("#nContainer").append(fanOf);
                break;
            case 'O':
                $("#oContainer").show();
                $("#oContainer").append(fanOf);
                break;
            case 'P':
                $("#pContainer").show();
                $("#pContainer").append(fanOf);
                break;
            case 'Q':
                $("#qContainer").show();
                $("#qContainer").append(fanOf);
                break;
            case 'R':
                $("#rContainer").show();
                $("#rContainer").append(fanOf);
                break;
            case 'S':
                $("#sContainer").show();
                $("#sContainer").append(fanOf);
                break;
            case 'T':
                $("#tContainer").show();
                $("#tContainer").append(fanOf);
                break;
            case 'U':
                $("#uContainer").show();
                $("#uContainer").append(fanOf);
                break;
            case 'V':
                $("#vContainer").show();
                $("#vContainer").append(fanOf);
                break;
            case 'W':
                $("#wContainer").show();
                $("#wContainer").append(fanOf);
                break;
            case 'X':
                $("#xContainer").show();
                $("#xContainer").append(fanOf);
                break;
            case 'Y':
                $("#yContainer").show();
                $("#yContainer").append(fanOf);
                break;
            case 'Z':
                $("#zContainer").show();
                $("#zContainer").append(fanOf);
                break;
            default:
                $("#otherContainer").show();
                $("#otherContainer").append(fanOf);
                break;
        }
    },
    
    /*Inserts FansOf List into the SQLite Database*/
    insertFansOfIntoSQLite: function (fanOf) {
        return false;
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO fansOf(umbracoID, handle, profilePhoto, added_on) VALUES (?,?,?,?)",
                          [fanOf.umbracoID, fanOf.handle, fanOf.profilePhoto, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },
    
    /*Deletes FansOf List from SQLite*/
    deleteMyFansSQLite: function () {
        return false;
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM fansOf", [], function(tx, results) {
            }, sqliteNameSpace.errorCB);
        });
    }

};

////////////////////////////////// begin get fan of of other profile //////////////////////////////

fansOfNameSpace.getFansOfFromByProfile = function () {

    var profileID = fansNameSpace.otherProfile;
    var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedFansFollowingListing&profileID=" + profileID;
    //console.log(chosenUrl);
    $.ajax({
        type: "GET",            
        url: chosenUrl,
    }).success(function (data) {
        if (data.ErrorCode === 0) {
            fansOfNameSpace.buildFansOfByOtherProfile( data);

        }
        else if (data.ErrorCode === 1) {
            $("#fansOfTotal").text("Fan Of None");
        }

    }).fail(function() {
        console.log("Fail");
    });
}
    
fansOfNameSpace.buildFansOfByOtherProfile = function ( data) {
               
    var count = 0; 
        
    $.each(data.Data, function (i, otherFan) {
        var fan = {
            profileId: otherFan.profileId,
            profilePhoto: otherFan.profilePhoto,
            profileHandle: otherFan.profileHandle
        };
        fansOfNameSpace.sortAlphabetically(fan);
        count = i + 1;
    });
        
    fansOfNameSpace.fansOfTotal = count;
    var title = $("#fansOfTitle").text();
    title = 'Fan Of';
    $("#fansOfTitle").text(title + " (" + count + ")");
       
}


////////////////////////////////// end get fan of of other profile //////////////////////////////


/*Builds the friends list*/
fansOfNameSpace.callFeed = function ( customData , onSuccess , onFail ) {

    customData = customData == undefined ? {} : customData ;
    window.GetFanListThisUserFollowing.Variables.profileID = customData.profileId || loginNameSpace.loggedUserID ;
    window.GetFanListThisUserFollowing.DataUpdatedEvent = function( data ){ 
        if (window.GetFanListThisUserFollowing.JsonObject.ErrorCode === 0) {
            try{ onSuccess( window.GetFanListThisUserFollowing.JsonObject  ) } catch(err){};
        } else {
            customData.responseOnFail = data ;
            try{ onFail( customData  ); } catch(err){};
        }	
    }
    window.GetFanListThisUserFollowing.DataUpdatedEventOnFail = function( data ){
        customData.responseOnFail = data ;
        try{ onFail( customData  );} catch(err){};
    }
    window.GetFanListThisUserFollowing.Execute( window.FeedManager ) ;
}
