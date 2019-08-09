var reactionsNameSpace = {};

reactionsNameSpace.postId = null;
reactionsNameSpace.var = {};
reactionsNameSpace.var.content = '';
reactionsNameSpace.var.reactionFeed = null;
reactionsNameSpace.var.modify = function(name,value) {
    reactionsNameSpace.var[name] = value;
};

reactionsNameSpace.getReactionsFeed = function () {
    
    window.GetReactionPosts.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetReactionPosts.DataUpdatedEvent = function(){ 
        if ( window.GetReactionPosts.JsonObject.ErrorCode == 0) {
            $("#reaction-view-reactionFeed-display").empty();
            reactionsNameSpace.buildReactionsList(  window.GetReactionPosts.JsonObject );
        }
    }
    window.GetReactionPosts.Execute( window.FeedManager ) ;

};


reactionsNameSpace.moreFeed = function (thisDivclass) {
    if (thisDivclass.search('reactionsView-getMore') == -1) {
        return false;
    }
    $('.reactionsView-getMore').removeClass('reactionsView-getMore');
    
    window.GetReactionPostsSQL.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetReactionPostsSQL.Variables.skip = reactionsNameSpace.skip;
    window.GetReactionPostsSQL.DataUpdatedEvent = function(){ 
        if (window.GetReactionPostsSQL.JsonObject.ErrorCode === 0) {
            
        	reactionsNameSpace.buildReactionsList(  window.GetReactionPostsSQL.JsonObject  );
        }
    }
    window.GetReactionPostsSQL.Execute( window.FeedManager ) ;

};

reactionsNameSpace.buildReactionsList = function (data) {

    $.each(data.Data, function ( index , element ) {
        
        element.loggedUserID = loginNameSpace.loggedUserID;
        
		element.profilePhoto = customNamespace.image.resizeAsThumbnail( element.profilePhoto );
        //replace empty avatar
        element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;

        element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );

        element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
		element.formatedPostDescription = customNamespace.string.shortenUrl( element.postDescription ) ;

        data.Data[ index ] = element ;
    });

    var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].RowNumber;
    var getMorePostInAdvance = '<div class="reactionsView-getMore"  onclick="reactionsNameSpace.skip = ' + lastIdOfCurrentFeed + ' ; reactionsNameSpace.moreFeed( $(this).attr(\'class\') )"></div>';
     

    var html = customNamespace.display.html( data ,  'reaction-view-reactionFeed-template'  ) ;
            
    html += getMorePostInAdvance ;
        
    $("#reaction-view-reactionFeed-display").append( html );
    
    ContentActive.imgCache.cacheAllAtOnce();
    
};

///////////////////////////////////// begin function to team page or gameCenter ///////////////////////////


reactionsNameSpace.onClickEventToTeamOrGameCenter = function (teamId, scheduleId) {

    if (scheduleId == '') {
        returnString = 'onclick = "location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + ';  "';
    }
    else if (scheduleId != '') {
        returnString = 'onclick = "reactionsNameSpace.onClickEventToGameCenter(' + scheduleId + ');"';
    }

    return returnString;
}


reactionsNameSpace.onClickEventToGameCenter = function (scheduleId) {

    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetEventBySchedule&scheduleId=' + scheduleId;
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function (data) {
        if (data.ErrorCode === 0) {

            var team1 = data.Data[0];
            var team2 = data.Data[1];
            gamecenterNameSpace.scheduleId = scheduleId;

            gamecenterNameSpace.teamsInfo.teamId1 = team1.teamId;
            gamecenterNameSpace.teamsInfo.teamName1 = team1.teamName;
            gamecenterNameSpace.teamsInfo.teamIcon1 = team1.teamIcon;

            gamecenterNameSpace.teamsInfo.teamId2 = team2.teamId;
            gamecenterNameSpace.teamsInfo.teamName2 = team2.teamName;
            gamecenterNameSpace.teamsInfo.teamIcon2 = team2.teamIcon;
            gamecenterNameSpace.teamsInfo.scheduleDateAndTime = team1.scheduleDateAndTime;

            location.hash = '../game-center/gameCenterView.html';

        }
    }).fail(function () {
        console.log("fail");
    });
}

//////////////////////////////////// end function to team page or gameCenter ///////////////////////////


//////////////////////////////// begin toCommentView /////////////////////////////////////////

reactionsNameSpace.toCommentView = function (postId) {

    var onclickEvent = "";
    onclickEvent += 'onclick="';
    onclickEvent += '  location.hash=\'../comments/commentsView.html\';';
    onclickEvent += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\'); ';
    onclickEvent += '  commentNameSpace.postId=' + postId + ';';
    onclickEvent += '"';

    return onclickEvent;

}

//////////////////////////////// end toCommentView //////////////////////////////////////


reactionsNameSpace.rating = function (postId) {

    try{
        //window.AppRate.preferences.storeAppURL.ios = '947998588';
        //window.AppRate.preferences.storeAppURL.android = 'market://details?id=com.fanreact.app';
        //window.AppRate.preferences.storeAppURL.blackberry = 'appworld://content/[App Id]/';
        //window.AppRate.preferences.storeAppURL.windows8 = 'ms-windows-store:Review?name=<the Package Family Name of the application>';

        var customLocale = {};
        customLocale.title = "Rate FanReact";
        customLocale.message = "If you enjoy using FanReact, would you mind taking a moment to rate it? It won’t take more than a minute. Thanks for your support!";
        customLocale.cancelButtonLabel = "No, Thanks";
        customLocale.laterButtonLabel = "Remind Me Later";
        customLocale.rateButtonLabel = "Rate It Now";

        window.AppRate.preferences.openStoreInApp = true;
        window.AppRate.preferences.storeAppURL.ios = '947998588';
        window.AppRate.preferences.storeAppURL.android = 'market://details?id=com.fanreact.app';
        window.AppRate.preferences.customLocale = customLocale;
        window.AppRate.preferences.displayAppName = 'FanReact';
        window.AppRate.preferences.usesUntilPrompt = 5;
        window.AppRate.preferences.promptAgainForEachNewVersion = true;
        window.AppRate.promptForRating();
                        
    } catch(err){customNamespace.console(err.message)}
}

reactionsNameSpace.checkIfUserIsInHouston = function () {

    var houstonLocation = {};
    houstonLocation.latitude = 29.7766591 ;
    houstonLocation.longitude = -95.5139013 ;
    var distanceForStillBeingInHouston =  50 ;
    
    var onInHouston = function(){
    }

    var onSuccess = function( position ) { 
		geolocationNamespace.var.position = position ;
    	var userPosition =  geolocationNamespace.var.position.coords ;
        var distance = window.ContentActive.map.distance( houstonLocation.latitude , houstonLocation.longitude , userPosition.latitude , userPosition.longitude  ); 
        if( distance < distanceForStillBeingInHouston ){
            onInHouston();
        }
    }
    var onFail = function( position ) { 
        console.log('Failed to initialize geolocation from geolocationNamespace');
    }
    var option = geolocationNamespace.var.option ;		

    $(document).ready(function(){
        window.navigator.geolocation.getCurrentPosition(onSuccess,onFail, option ) 
    });

}


reactionsNameSpace.cacheFeed = function () {

    window.GetTeamBySearchTerm.Variables = { profileId : loginNameSpace.loggedUserID , limit :100  } ;
    window.GetTeamBySearchTerm.Execute( window.FeedManager );

    window.GetTrendingPostSql.Variables.profileId = loginNameSpace.loggedUserID  ;
    window.GetTrendingPostSql.Execute( window.FeedManager ) ;

    window.GetFanListThisUserFollowing.Variables.profileID = loginNameSpace.loggedUserID;
    window.GetFanListThisUserFollowing.Execute( window.FeedManager ) ;

    window.GetFanListFollowingThisUser.Variables.profileID = loginNameSpace.loggedUserID;
    window.GetFanListFollowingThisUser.Execute( window.FeedManager ) ;
    
    // declare action on network none
    window.ContentActive.FeedSystem.var.onConnectionNone = function(){
        $('#index-header-networkNoneNotification').fadeIn();
        customNamespace.sizing();
    };
    window.ContentActive.FeedSystem.var.onConnectionNotNone = function(){
        $('#index-header-networkNoneNotification').hide();
        customNamespace.sizing();
    };
    window.GetNotificationForNetworkNone.DataUpdatedEvent = function( ){
        window.ContentActive.FeedSystem.var.onConnectionNone = function(){
            var data = window.GetNotificationForNetworkNone.JsonObject.Data[0].html ;
            $('#index-header-networkNoneNotification').find('.Id-html').html( data );
            $('#index-header-networkNoneNotification').fadeIn();
            customNamespace.sizing();
        };
        }
    window.GetNotificationForNetworkNone.Execute( window.FeedManager )

}