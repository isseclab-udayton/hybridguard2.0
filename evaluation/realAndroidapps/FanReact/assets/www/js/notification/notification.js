(function (global) {
    app = global.app = global.app || {};

    document.addEventListener('deviceready', function () {

        if (window.plugin) {

            // set some global defaults for all local notifications
            window.plugin.notification.local.setDefaults({
                autoCancel : true // removes the notification from notification centre when clicked
            });
    
            // triggered when a notification was clicked outside the app (background)
            window.plugin.notification.local.onclick = function (id, state, json) {
                var message = 'ID: ' + id + (json == '' ? '' : '\nData: ' + json);
                console.log("onclick notification : "+state);
                // alert("Inside onclick" +state);
                notificationNameSpace.IsEnableNotification = true;
             //   if(state == 'background')
             //   {
                    if (postNameSpace.returnPostId != 0 ) {
                        commentNameSpace.postId = postNameSpace.returnPostId ;
                        postNameSpace.returnPostId = 0 ;
                    }
                    //location.hash = "../../views/notifications/notificationsView.html"; 
                   location.hash = notificationNameSpace.locationHash; 
                
            //    }
            };

            // triggered when a notification is executed while using the app (foreground)
            // on Android this may be triggered even when the app started by clicking a notification
            window.plugin.notification.local.ontrigger = function (id, state, json) {
                var message = 'ID: ' + id + (json == '' ? '' : '\nData: ' + json);
            
                /*if(state == 'foreground' || state == 'background')
                {
                    notificationNameSpace.prevPushNotificationId  = notificationNameSpace.pushNotificationId;

                }*/
     
           };
    
        };
    });
})(window);

var notificationNameSpace = {
    notificationId: null,
    notificationMessage: "",
    notificationPostMessage: "",
    notificationPostMessageProfile:"",
    notificationForFollowingID: 1,
    notificationForPostID: 2,
    notificationSound: null,
    isEnableVibration: false, 
    IsEnableNotification: false,
    isAppRunning: false,
    runNotification: false,
    gotUnreadFeedCount: false,
    locationHash: "",
    pushNotificationId: 0,
    prevPushNotificationId: 0,
    unreadNotificationCount:0,
    notificationFeed:0,
    
    getNotificationFeed: function (top) {
        
        $('.notificationCountFromFeed').hide();
        $('.menuNotifications').hide();       

        var profileId = loginNameSpace.loggedUserID;
        var top = top;
        var OnSuccess = function( data ){
            if (data.ErrorCode === 0) {
                notificationNameSpace.notificationFeed = data;
                notificationNameSpace.buildNotificationList(data);
            }
        }
        
        window.GetNotification.Variables.profileId = profileId;
        window.GetNotification.Variables.top = top;
        window.GetNotification.Execute( window.FeedManager ) ;
        window.GetNotification.DataUpdatedEvent = function(){ 
            OnSuccess(window.GetNotification.JsonObject);
        }
    },

    buildNotificationList: function (data) {
        var output = '<table cellpadding="0" cellspacing="0">';
        $.each(data.Data, function (i, notice) {

            var notificationId = notice.notificationId;
            var profileId = notice.profileId;
            var postId = notice.postId;
            var profileHandle = notice.profileHandle;
            var profilePhoto = notice.profilePhoto;
            var postImageLink = notice.postImageLink;
            var postDescription = notice.postDescription;
            var postCreateDate = notice.postCreateDate;
            var notificationId = notice.notificationId;
            var type = notice.type;
            var followButton = '';
            var status = notice.status;
            var status1 = '';
            
            var checkEmpty = function( variable, defaultUrl ) {
                if ( variable == "" || variable == 0) 
                { variable = defaultUrl}
                return variable;
            }
            
            var checkHttp = function( variable, defaultUrl ) {
                if ( variable.search('http://') == -1 && variable.search('https://') == -1 && variable != defaultUrl) 
                { variable = domainNameSpace.name + variable}
                return variable;
            }
            
            profilePhoto = checkEmpty(profilePhoto, '../../images/default-avatar.png' );
            profilePhoto = checkHttp(profilePhoto, '../../images/default-avatar.png' );
            postImageLink = checkEmpty(postImageLink, '../../images/default-avatar.png' );
            postImageLink = checkHttp(postImageLink, '../../images/default-avatar.png' );
            
            if (status.search("Unread") != -1 ){
                status1='notificationRead';
            }else{
                status1='';
            }
            if (type == "following") {
                notificationNameSpace.notificationMessage = profileHandle + " is now following you";
                
                followButton = '<a id="followFan' + profileId + '" onclick="searchNameSpace.followPeople(' + profileId + ')" class="button">ollow</a>';

                output += '<tr class="noticeForFollowFan' + profileId + ' ' + status1 +'"><td colspan="2" class="username">' + profileHandle + '</td></tr>';
                output += '<tr class="noticeForFollowFan' + profileId + ' ' + status1 +'"><td>';
                output += '<div class="img round" style="background-image: url(' + profilePhoto + ');"></div></td><td>';
                output += '<p><a onclick="profileNameSpace.toProfileByIdView(' + profileId + ') ; ">@' + profileHandle + '</a> is now following you</p><p>'+ postCreateDate +'</p>';
                output += '<a onclick="notificationNameSpace.notificationId=' + notificationId + '; notificationNameSpace.followPeople(' + profileId + ')" class="button green">Follow</a>';
                output += '<a onclick="notificationNameSpace.removeNotificationForFanFollow(' + notificationId + ',' + profileId + '); " class="button red">Ignore</a>';
                output += '</div></td></tr>';
            }
            else if (type == "bothFollowing") {
                followButton = '<a id="followFan' + profileId + '" onclick="searchNameSpace.followPeople(' + profileId + ')" class="button">ollow</a>';

                output += '<tr class="noticeForFollowFan' + profileId + ' ' + status1 +'"><td colspan="2" class="username">' + profileHandle + '</td></tr>';
                output += '<tr class="noticeForFollowFan' + profileId + ' ' + status1 +'"><td>';
                output += '<div class="img round" style="background-image: url(' + profilePhoto + ');"></div></td><td>';
                output += '<p><a  onclick="profileNameSpace.toProfileByIdView(' + profileId + ') ; ">@' + profileHandle + '</a> is now following you</p><p>'+ postCreateDate +'</p>';
                output += '<a onclick="notificationNameSpace.removeNotificationForFanFollow(' + notificationId + ',' + profileId + '); " class="button red">Ignore</a>';
                output += '</div></td></tr>';
            }
            else if (type == "Post") {
                notificationNameSpace.notificationPostMessage = postDescription;
                notificationNameSpace.notificationPostMessageProfile = profileHandle + " posted this";
                output += '<tr class="' + status1 +'">';
                output += '<td colspan="2" class="username" onclick="';
                output += '  profileNameSpace.profileID = ' + profileId + ' ;';
                output += '  location.hash=\'../profile/profileByIdView.html\';';
                output += '">';
                output += profileHandle;
                output += '</td></tr><tr class="' + status1 +'"><td>';
                output += '<div style="background-image: url(' + postImageLink + ');" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="img standard" ></div></td><td>';
                output += '<p>';
                output += '<a onclick="';
                output += '  profileNameSpace.profileID = ' + profileId + ' ;';
                output += '  location.hash=\'../profile/profileByIdView.html\';';
                output += '">' + profileHandle + '</a> ';
                output +=  ' has tagged you in a post. </p><p>' + postCreateDate +'</p>';
                output += '<a onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="button green">View More</a></td></tr>';
            }
            else if (type == "Commented") {
                notificationNameSpace.notificationPostMessage = postDescription;
                notificationNameSpace.notificationPostMessageProfile = profileHandle + " posted this";
                output += '<tr class="' + status1 +'"><td colspan="2" class="username" >';
                output += loginNameSpace.profileHandle ;
                output += '</td></tr><tr class="' + status1 +'"><td>';
                output += '<div style="background-image: url(' + postImageLink + ');" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="img standard" ></div></td><td>';
                output += '<p><a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" >' + profileHandle + '</a>';
                output += ' has commented on your post</p><p>' + postCreateDate +'</p>';
                output += '<a onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="button green">View More</a></td></tr>';
            }
            else if (type == "CommentTag") {
                notificationNameSpace.notificationPostMessage = postDescription;
                notificationNameSpace.notificationPostMessageProfile = profileHandle + " posted this";
                output += '<tr class="' + status1 +'"><td colspan="2" class="username" >';
                output += '</td></tr><tr class="' + status1 +'"><td>';
                output += '<div style="background-image: url(' + postImageLink + ');" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="img standard" ></div></td><td>';
                output += '<p><a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" >' + profileHandle + '</a>';
                output += ' has tagged you in a comment</p><p>' + postCreateDate +'</p>';
                output += '<a onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" class="button green">View More</a></td></tr>';
            }
            
            else if (type == "teamNotification") {
                notificationNameSpace.notificationPostMessage = postDescription;
                notificationNameSpace.notificationPostMessageProfile = profileHandle + " posted this";
                output += '<tr class="' + status1 +'"><td colspan="2" class="username" >';
                output += '</td></tr><tr class="' + status1 +'"><td>';
                output += '<div style="background-image: url(' + profilePhoto + ');" onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = '+profileId+';" class="img standard" ></div></td><td>';
                output += '<p><a  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = '+profileId+';" >' + profileHandle + '</a>';
                output += ' - ' + postDescription + '</p><p>' + postCreateDate +'</p>';
                output += '<a onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = '+profileId+';" class="button green">View More</a></td></tr>';
            }
        });

        output += '</table>';

        $("#notificationFeed").html(output);
        var extraAction = function(){ 
            $('#notificationsView-currentmidPage').val('-30'); 
            $('#notificationFeed-duplicate').empty();

        }
        scrollNamespace.page.shortner.initialize(extraAction);
    },

    followPeople: function (otherProfileId) {
        var thisProfileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowProfile&profileId=' + otherProfileId + '&followerProfileId=' + thisProfileId;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            console.log(data);
            if (data.indexOf("Follow") > -1) {
                var notificationId = notificationNameSpace.notificationId;
                notificationNameSpace.removeNotificationForFanFollow(notificationId, otherProfileId);
            }
        }).fail(function () {
            console.log("Fail");
        });
    },

    removeNotificationForFanFollow: function (notificationId, profileIDofRemoved) {

        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedDeleteNotification&notificationId=' + notificationId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            console.log(data);
            if (data.indexOf("Notification Deleted Successfully") > -1) {
                $('.noticeForFollowFan' + profileIDofRemoved).hide();
            }
        }).fail(function () {
            console.log("Fail");
        });
    },

    getNotificationCount: function () {
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetNotificationCountV1&profileId=' + profileId;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            if (data.ErrorCode != 0) { return false; }
            var count = data.Data[0].notificationCount;
            $('.notificationCountFromFeed').html(count);
            $('.menuNotifications').html(count);
        
            if(count==0){$(".notificationCountFromFeed").hide(); $(".menuNotifications").hide();}
            if(count>0){$(".notificationCountFromFeed").show(); $(".menuNotifications").show();}
        }).fail(function () {
            console.log("Fail");
        });
    },

    
     getUnReadNotificationForLocalNotification: function () {
         return false;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetNotificationOS&profileId=' + profileId;
        var profileHandle = "";
        var postDescription = "";
        var type = ""; 
        var status = "";
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {      
             $.each(data.Data, function (i, notice) {
              type = data.Data[0].type; 
              status = data.Data[0].status;
              profileHandle = data.Data[0].profileHandle;
              postDescription =data.Data[0].postDescription;
               
            });
            
            if(data.Count > 0)
            {
                if(data.Count > 1)
                    {
                         notificationNameSpace.unreadNotificationCount = data.Count + " notifications";
                    }
                else
                    {
                         notificationNameSpace.unreadNotificationCount = data.Count + " notification";
                    }
                
                notificationNameSpace.pushNotificationId = data.Data[0].notificationId;
                    if (type == "Post")
                    {
                        notificationNameSpace.notificationPostMessage = profileHandle + " " +"has tagged you in a post"; 
                    }
                    else if(type == "following" || type == "bothFollowing")
                    {
                        notificationNameSpace.notificationPostMessage = profileHandle + " " +postDescription; 
                    }
                    else if(type == "CommentTag")
                    {
                        notificationNameSpace.notificationPostMessage = profileHandle + " " +"has tagged you in a comment";
                    }
                    else if(type == "Commented")
                    {
                         notificationNameSpace.notificationPostMessage = profileHandle + " " +"has commented on your post";                         
                    }
                
                // define destination for onclick event of notifications
                notificationNameSpace.locationHash = "../../views/notifications/notificationsView.html"; 
            
                if(notificationNameSpace.pushNotificationId == notificationNameSpace.prevPushNotificationId || 
                	notificationNameSpace.pushNotificationId === notificationNameSpace.prevPushNotificationId)
                {
                     //notificationNameSpace.runNotification = false;
                }
                else
                {
                   //notificationNameSpace.runNotification = true;
                   //notificationNameSpace.cancelNotification();
                }
                
            }
            else
            {
                //console.log("Feed called but no unread messages" );
                notificationNameSpace.runNotification = false;
            }
           
        }).fail(function () {
            console.log("Fail");
        });
    },


    showMessageWithSoundEveryMinute: function (){ 
        
       notificationNameSpace.prevPushNotificationId  = notificationNameSpace.pushNotificationId;

       if(notificationNameSpace.isEnableVibration == true)
       { 
           this.notify({
                     id : notificationNameSpace.pushNotificationId,
                  title : notificationNameSpace.unreadNotificationCount,
                message : notificationNameSpace.notificationPostMessage,
                  badge : notificationNameSpace.unreadNotificationCount,
                   sound:  notificationNameSpace.notificationSound,
                    date : this.getNowPlus10Seconds()
            });
            }
         else
       {
            this.notify({
                         id : notificationNameSpace.pushNotificationId,
                      title : notificationNameSpace.unreadNotificationCount,
                    message : notificationNameSpace.notificationPostMessage,
                      badge : notificationNameSpace.unreadNotificationCount,
                       date : this.getNowPlus10Seconds()
                });
        }
    },

    cancelAll: function() {
            if (!this.checkSimulator()) {
                window.plugin.notification.local.cancelAll(function() {alert('ok, all cancelled')});
            }
        },
    
    cancelNotification: function() {
            if (!this.checkSimulator()) {
                 window.plugin.notification.local.cancel(notificationNameSpace.prevPushNotificationId, function () {
                 // The notification has been canceled
            });              
                notificationNameSpace.enableNotification();
            }
        
        },

    notify:function (payload) {
            if (!this.checkSimulator()) {
                window.plugin.notification.local.add(payload, function(){alert('ok, scheduled')});
            }
        },
    
    getNowPlus10Seconds: function() {
            return new Date(new Date().getTime() + 2*1000);
        },

    checkSimulator: function () {
            if (window.navigator.simulator === true) {
                return true;
            } else if (window.plugin === undefined) {
                return true;
            } else {
                return false;
            }
        },
    
     enableNotification: function()
    {
        console.log("Inside enableNotification:" +notificationNameSpace.IsEnableNotification);
       if(notificationNameSpace.IsEnableNotification === 'true' || notificationNameSpace.IsEnableNotification == true)
        {
            if(notificationNameSpace.runNotification === 'true' || notificationNameSpace.runNotification == true)
            {
               console.log("showMessageWithSoundEveryMinute called");
               notificationNameSpace.showMessageWithSoundEveryMinute(); 
            }

        }
        else
        { 
         console.log("In enableNotification :" +notificationNameSpace.IsEnableNotification);
         notificationNameSpace.cancelAll();
        }
    },
    
     enableVibration: function()
    {
    }
}

notificationNameSpace.display = {};
notificationNameSpace.display.initialize = function(){

    var pageId = '';
    try{
        var pageId = $.mobile.activePage.attr('id'); 
    } catch(err){ 
        customNamespace.console(err.message)
    }
    if( pageId == 'notificationsView'){
        notificationNameSpace.getNotificationFeed(15);  
    }
}
