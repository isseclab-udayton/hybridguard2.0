var teampageNameSpace = {

    teamId: null,
    postId: null,
    toEventpage: { teamName: null, teamIcon: null },                  
    feedForSingleTeam: null,
    

    
    getFeed: function () {
        
            
        var onFail = function(){
            $("#teamTrending").empty();
            $("#teamPosts").html('<br><center>Be the first to post :)</center>');
        }
        window.GetPostForATeam.Variables.teamId = teampageNameSpace.teamId ;
        window.GetPostForATeam.Variables.profileId = loginNameSpace.loggedUserID ;
        window.GetPostForATeam.DataUpdatedEvent = function( ){ 
            if (window.GetPostForATeam.JsonObject.ErrorCode === 0) {
            	$("#team-page-teamPosts-display").empty();
                $("#teamTrending").empty();
                $('body,html').stop().animate({ scrollTop: 0 }, 800);
                teampageNameSpace.buildFeedList( window.GetPostForATeam.JsonObject );
            } else {
                onFail()
            }	
        }
        window.GetPostForATeam.Execute( window.FeedManager ) ;
    },


    
    buildFeedList: function (data) {
                
        data = $.extend(true, {}, data ) ;

        $.each(data.Data, function (index , element ) {

            element.postDescription = customNamespace.replaceImg( element.postDescription , 1 );
            element.UserProfileId = element.UserProfileId || loginNameSpace.loggedUserID;
            element.profilePhoto = customNamespace.image.resizeAsThumbnail( element.profilePhoto );
            element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;
            element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );
            element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
            element.formatedPostDescription = element.postDescription ;
            data.Data[ index ] = element ;
        });
        
        

        
        var lastID = data.Data[data.Data.length - 1].RowNumber;
        var getMoreInAdvance = '<div class="getMore"  onclick="teampageNameSpace.lastID = \'' + lastID + '\' ; teampageNameSpace.moreFeed( $(this).attr(\'class\') )"></div>';
        
        //console.log( data );
        var html = customNamespace.display.html( data ,  'reaction-view-reactionFeed-template'  ) ;

        html += getMoreInAdvance ;
        
        $("#team-page-teamPosts-display").append(html);
    },

    
    
    moreFeed: function (thisDivclass) {
      
        if (thisDivclass.search('getMore') == -1) {
            return false;
        }
        $('.getMore').removeClass('getMore');

        window.GetPostForATeamMore.Variables.teamId = teampageNameSpace.teamId ;
        window.GetPostForATeamMore.Variables.profileId = loginNameSpace.loggedUserID ;
        window.GetPostForATeamMore.Variables.Skip = teampageNameSpace.lastID ;
        
        window.GetPostForATeamMore.DataUpdatedEvent = function( ){ 
            if (window.GetPostForATeamMore.JsonObject.ErrorCode === 0) {
                teampageNameSpace.buildFeedList(window.GetPostForATeamMore.JsonObject);
            } else {
                console.log( 'fail' );
            }	
        }
        window.GetPostForATeamMore.Execute( window.FeedManager ) ;
        
    },

    ///////////////////////////////// begin get trending feed //////////////////////////////////////

    getTrend: function () {
        
        
        window.GetTeamPostTrending.Variables.teamId = teampageNameSpace.teamId ;
        window.GetTeamPostTrending.Variables.profileId = loginNameSpace.loggedUserID ;
        
    	window.GetTeamPostTrending.DataUpdatedEvent = function( ){ 

            if (window.GetTeamPostTrending.JsonObject.ErrorCode === 0) {
                $("#teamPosts").empty();
                $("#teamTrending").empty();
                teampageNameSpace.buildTrendList(window.GetTeamPostTrending.JsonObject);
            } 
        }
        window.GetTeamPostTrending.Execute( window.FeedManager ) ; 
        
        
    },

    
    buildTrendList: function (data) {

        if( data.Data.Length == 0 ){ return false ; }
        
        data = $.extend(true, {}, data ) ;

        $.each(data.Data, function (index , element ) {

            element.postDescription = customNamespace.replaceImg( element.postDescription , 1 );
            element.UserProfileId = element.UserProfileId || loginNameSpace.loggedUserID;
            element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );
            element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
            element.formatedPostDescription = element.postDescription ;
            element.postFlagMessagePlural = element.postFlagMessage > 1 ? true : false ;
            element.fanreactCommentsCountPlural = element.fanreactCommentsCount > 1 ? true : false ;
            data.Data[ index ] = element ;
        });

        var lastID = data.Data[data.Data.length - 1].RowNumber;
        var getMoreInAdvance = '<div class="getMore"  onclick="teampageNameSpace.postId = \'' + lastID + '\' ; teampageNameSpace.moreTrend( $(this).attr(\'class\') )"></div>';

        //console.log( data );
        var html = customNamespace.display.html( data ,  'reaction-view-trendingFeed-template'  ) ;

        html += getMoreInAdvance ;

        $("#teamTrending").append(html);
        
    },

    moreTrend: function (thisDivclass) {

        
        if (thisDivclass.search('getMore') == -1) {
            return false;
        }
        $('.getMore').removeClass('getMore');


        window.GetTeamPostTrendingMore.Variables.teamId = teampageNameSpace.teamId ;
        window.GetTeamPostTrendingMore.Variables.profileId = loginNameSpace.loggedUserID ;
        window.GetTeamPostTrendingMore.Variables.skip = teampageNameSpace.postId ;
        
    	window.GetTeamPostTrendingMore.DataUpdatedEvent = function( ){ 

            if (window.GetTeamPostTrendingMore.JsonObject.ErrorCode === 0) {
                teampageNameSpace.buildTrendList(window.GetTeamPostTrendingMore.JsonObject);
            } 
        }
        window.GetTeamPostTrendingMore.Execute( window.FeedManager ) ; 
        
    },

    ////////////////////////////// finish get trending feed //////////////////////////////////

    getThisTeam: function () {
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedGetTeamSQLV1&teamid=" + teampageNameSpace.teamId;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                var team = data.Data[0];

                teampageNameSpace.feedForSingleTeam = data;
                
                var teamId = team.teamId;
                var teamName = team.teamName;
                var teamIcon = domainNameSpace.name + team.teamIcon;
                var AllowEnterPage = team.AllowEnterPage;
                var alertText = team.alertMessage;
                var followers = team.followers;
                var MaxNumberRequired = team.MaxNumberRequired;
                $(".thisTeamImage").css("background-image", "url('" + teamIcon + "')");
                // for sponsor team game center 
                $('.id-team-page-sponsor-game-center-home-icon').attr('src' , teamIcon ) ;
                
                
                teampageNameSpace.toEventpage.teamName = teamName ;
                teampageNameSpace.toEventpage.teamIcon = teamIcon; 
                
                team.teamIcon = domainNameSpace.name + team.teamIcon;
                team.followerIsMoreThanOne = team.followers > 1 ? true : false ;
                
                //console.log( team );
                customNamespace.display.html( team , 'team-page-teamImage-template' , 'team-page-teamImage-display' );
                customNamespace.display.html( team , 'team-page-sponsor-teamFollower-template' , 'team-page-sponsor-teamFollower-display' );
                teampageNameSpace.checkUserFollowTeam( { teamId : team.teamId } , 
                                                        function(  data ){ 
                                                            team.isFollowingByThisUser = true ;
                                                            customNamespace.display.html(  team  , 'team-page-teamFollowButton-template' , 'team-page-teamFollowButton-display' );
                                                            customNamespace.display.html(  team  , 'team-page-sponsor-teamFollowButton-template' , 'team-page-sponsor-teamFollowButton-display' );
                										}, 
                                                        function( data ){
                                                            team.isFollowingByThisUser = false ;
                                                            customNamespace.display.html(  team  , 'team-page-teamFollowButton-template' , 'team-page-teamFollowButton-display' );
                                                            customNamespace.display.html(  team  , 'team-page-sponsor-teamFollowButton-template' , 'team-page-sponsor-teamFollowButton-display' );
                										}
                                                      ) 

                           
                // refresh right icon and event relate element
                $(".anotherTeamImage").css("background-image", '');
                $(".chatBox").hide();
                $("#teamSchedule").hide();
                
                $(".teamName").html(teamName);

                var titleOfpage = teamName;
                
                $(".dropdown").html(titleOfpage);
                customNamespace.header.shrinkTitle({ Id : '.dropdown' , size: -80 });
                
                
                $('.id-team-page-fanNumber').html( customNamespace.format.nFormatter( followers ) );
                
                if( AllowEnterPage == 0 )
                {
                    $(".addMoreTeams").hide();               
                    $("#NotAllowEnterPage").hide();                  
                    $("#NotAllowEnterPage").fadeIn();        
                    $("#NotAllowEnterPageMsg").html(alertText);        
                    $("#NotAllowEnterPageNumber").html( MaxNumberRequired - followers );           
                    $("#GrabMoreFriend").show();       
                    $("#teamPosts").hide();   
                    
                    
                    customNamespace.commonPopupTakePhoto = function() {
                        alert( 'Tell Your Friends \n\n More Fans Are Needed To Open This Board: ' + (MaxNumberRequired - followers) );
                        $('#commonCapturePopup').popup('close')
                    }
                    
                    customNamespace.commonPopupTakeVideo = function() {
                        alert( 'Tell Your Friends \n\n More Fans Are Fans Needed To Open This Board: ' + (MaxNumberRequired - followers) );
                        $('#commonCapturePopup').popup('close')
                    }
                } else {
                    
                    $("#NotAllowEnterPage").hide();
                    $("#teamPosts").fadeIn();
                    
                    customNamespace.commonPopupTakePhoto = function() {
                        $('#topostView').trigger('click') ;
                        postNameSpace.track = 'team' ;
                        cameraApp._capturePhoto();
                    }
                    
                    customNamespace.commonPopupTakeVideo = function() {
                        $('#topostView').trigger('click') ;
                        postNameSpace.track = 'team' ;
                        recordVideoNameSpace.CaptureVideo();
                    }
                }

                teampageNameSpace.getAnotherTeam(teamId, teamName, teamIcon);
            }
        }).fail(function () {
            console.log("Fail");
        });
    },

    getAnotherTeam: function (thisTeamId, thisTeamName, thisTeamIcon) {
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedGameCenterTeams&teamId=" + thisTeamId;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                var team = data.Data[0];

                var teamId = team.teamId;
                var teamName = team.teamName;
                var teamIcon = domainNameSpace.name + team.teamIcon;

                $(".anotherTeamImage").css("background-image", "url('" + teamIcon + "')");

                var twoTeams = thisTeamName + '<br /> <span>vs.</span><br /> ' + teamName;
                $(".teamName").html(twoTeams);
                $("#teamSchedule").show();
                
                $(".chatBox").show();
                
                // get team for sponsor page
                $('.id-team-page-sponsor-game-center-away-icon').attr('src', teamIcon )
            }
        }).fail(function () {
            console.log("Fail");
        });
    },

    // ------------------------ get List of Teams for Drop Down -----------------------------


    /*Gets the teams related to an user*/
    getTeamsForDropDown: function () {
        
        window.GetTeamFollowing.Variables.profileId = loginNameSpace.loggedUserID;
        window.GetTeamFollowing.DataUpdatedEvent = function(){ 
            
            var html = customNamespace.display.html( window.GetTeamFollowing.JsonObject  , 'team-page-dropdownMenu-teamList-template' , 'dropdownMenu' );

        }
        window.GetTeamFollowing.Execute( window.FeedManager ) ;
        
    },

}

teampageNameSpace.displayTeamFanOfTheMonth = function(){
        
    var model_name = 'GetTeamFanOfTheMonth';
    window.GetTeamFanOfTheMonth.Variables.teamId = teampageNameSpace.teamId  ;
    window[model_name].DataUpdatedEvent = function () {
        var fanOfTheMonth = window[model_name].JsonObject.Data[0] ;
        if( fanOfTheMonth == undefined ){ $('#team-page-reactorOftheMonthHolder').slideUp(); return false;}
        $('#team-page-reactorOftheMonthHolder').fadeIn();
        friendsListNameSpace.checkFollow( { profileId : fanOfTheMonth.profileId } ,
                                          function( data ){
                                            fanOfTheMonth.isFollowingByThisUser = true ;
                                            customNamespace.display.html( fanOfTheMonth  , 'team-page-reactorOfTheMonth-template' , 'team-page-reactorOfTheMonth-display' );
                                          },
                                          function( data ){
                                            fanOfTheMonth.isFollowingByThisUser = false ;
                                            customNamespace.display.html( fanOfTheMonth , 'team-page-reactorOfTheMonth-template' , 'team-page-reactorOfTheMonth-display' );
                                          }

                                        )
            fanOfTheMonth.hideFollowButton = fanOfTheMonth.profileId == loginNameSpace.loggedUserID ? '' : 'show' ;
    };
    window[model_name].Execute( window.FeedManager );
}

teampageNameSpace.displayTeamTotalReactions = function(){
        
    var model_name = 'GetTeamTotalReaction';
    window[model_name].Variables.teamId = teampageNameSpace.teamId  ;
    window[model_name].DataUpdatedEvent = function () {
    	var totalReaction = window[model_name].JsonObject.Data[0].total ;
        $('#team-page-reactionNumber').html( customNamespace.format.nFormatter( totalReaction ) );
    };
    window[model_name].Execute( window.FeedManager );
}


teampageNameSpace.followTeam = function ( customData , onFollowSuccess , onUnfollowSuccess , onFail ) {
    var thisProfileId = loginNameSpace.loggedUserID;
    var thisButton = customData.thisButton ;
    var teamId = customData.teamId ;
    var chosenUrl;
    if ( $(thisButton).hasClass("active") == true) {
        chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowTeam&profileId=' + thisProfileId + '&teamid=' + teamId;
    }
    if ($(thisButton).hasClass("active") == false) {
        chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedUnfollowTeam&profileId=' + thisProfileId + '&teamid=' + teamId;
    }
    //console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {
        customData.response = data  ;
        
        if (data.indexOf("Follow") > -1) {
            $( customData.thisButton ).removeClass('active');
            onFollowSuccess( customData )
        }
        else if (data.indexOf("Unfollow") > -1) {
            $( customData.thisButton ).addClass('active');
            onUnfollowSuccess( customData )
        }
        else {
     		onFail( customData )
        }
    }).fail(function ( data ) {
        customData.response = data  ;
        onFail( customData )
    });
}


teampageNameSpace.checkUserFollowTeam = function ( customData , onSuccess , onFail ) {
    
    var teamIdToCheck =  customData.teamId ;
    var data = window.GetTeamFollowing.JsonObject.Data ;
    var found = false;
    $.each( data , function( index , element ){
        if( teamIdToCheck == element.teamId ){
            found = true;
            return false;
        }
    });
    found == true ? onSuccess( data ) : onFail( data );
}


teampageNameSpace.sponsor = {};
teampageNameSpace.sponsor.get = function ( customData , onSuccess , onFail ) {
    
    $('#team-page-customStyle-display').empty()
    $('#team-page-sponsor-info').hide();  
    window.GetSponsor.Variables.id = teampageNameSpace.teamId ;
    window.GetSponsor.DataUpdatedEvent = function(){ 
        if( window.GetSponsor.JsonObject.ErrorCode == 0 ){
            teampageNameSpace.sponsor.display( window.GetSponsor.JsonObject );
        }
    }
    window.GetSponsor.Execute( window.FeedManager ) ;
}
teampageNameSpace.sponsor.display = function ( data ) {
    if( data.Data[0] == undefined ) { return false ; } 
    else { data = data.Data[0] } ;
    for ( var x = 1; x < 6; x++) { 
        if( data['link' + x + 'Name'] == undefined || data['link' + x + 'Name'] == '' || data['link' + x + 'Hide'] == true ){ 
            continue;
        }
        data.button = data.button || [];
    	data.button.push( { name : data['link' + x + 'Name'] , link : data['link' + x + 'Description'] } );
	}
    
    //console.log( data );
                    
    data.color != '' ? customNamespace.display.html( { color : data.color   } ,  'team-page-customStyle-template'  ,  'team-page-customStyle-display' ) : null ;

    customNamespace.display.html( data ,  'team-page-sponsor-custom-style-template'  ,  'team-page-sponsor-custom-style-display' ) ;

    
    
    //$('#team-page-sponsor-info').css('background-image',"url('"+ data.backgroundImage +"')")
    $('#team-page-team-info').hide();
    $('#team-page-sponsor-info').fadeIn();  
    customNamespace.display.html( data , 'team-page-sponsor-customButtonList-template' , 'team-page-sponsor-customButtonList-display' );
}


teampageNameSpace.gameCenter = {};
teampageNameSpace.gameCenter.get = function ( customData , onSuccess , onFail ) {
    $('#team-page-enterGameCenter-display').empty();
    $('#team-page-sponsor-enterGameCenter-display').hide();
    window.GetTeamGameCenter.Variables.teamId = teampageNameSpace.teamId ;
    window.GetTeamGameCenter.DataUpdatedEvent = function(){ 
        if( window.GetTeamGameCenter.JsonObject.ErrorCode == 0 ){
            teampageNameSpace.gameCenter.display( window.GetTeamGameCenter.JsonObject );
        }
    }
    window.GetTeamGameCenter.Execute( window.FeedManager ) ;
}
teampageNameSpace.gameCenter.display = function ( data , onSuccess, onFail) {
    customNamespace.display.html( data.Data[0] , 'team-page-enterGameCenter-template' , 'team-page-enterGameCenter-display' );
    //console.log( data );
    console.log( data.Data )
    $('#team-page-sponsor-enterGameCenter-display').show();
    //customNamespace.display.html( data.Data[0] , 'team-page-sponsor-enterGameCenter-template' , 'team-page-sponsor-enterGameCenter-display' );
}

teampageNameSpace.scoreAPI = {};
teampageNameSpace.scoreAPI.getTeam = function () {
    window.GetGameInfoTeamForScore.JsonObject = {};
    window.GetGameInfoTeamForScore.Variables.teamId = teampageNameSpace.teamId;
    window.GetGameInfoTeamForScore.Execute(window.FeedManager);
}

teampageNameSpace.scoreAPI.getScore = function ( onSuccess ) {
    /*
    window.GetScoreApi.JsonObject = {};
    window.GetScoreApi.DataUpdatedEvent = function ( data ) {
        window.GetScoreApi.JsonObject = JSON.parse(data);
        if( onSuccess != undefined ) onSuccess();
    }
    window.GetScoreApi.Execute( window.FeedManager);
    */
}

teampageNameSpace.scoreAPI.loopDisplay = function (pageId) {
    
    /*
    var loop = setInterval(function () {

        if (customNamespace.isViewing == false) return;

        if ($.mobile.activePage.attr('id') != pageId.replace('#','') ) 
            clearInterval(loop);
		
        teampageNameSpace.scoreAPI.getScore( teampageNameSpace.scoreAPI.display );

    }, 1000);
    */
    
}

teampageNameSpace.scoreAPI.reset = function () {

    /*
    var change = function (block, name, value) {
        if (value == undefined) return;
        if (block.find(name).text() != value) block.find(name).text(value);
    }
    var block = $('#team-page-sponsor-enterGameCenter-display');
    change(block, '.id-left-team-score', '' );
    change(block, '.id-right-team-score', '' );
    change(block, '.id-status','N/A' );
    change(block, '.id-time', '' );
    change(block, '.id-match', '');
    */
}

teampageNameSpace.scoreAPI.display = function (data, onSuccess) {

    /*

    if( window.GetGameInfoTeamForScore.JsonObject.Data.length == 0 ) return ;
    //if (window.GetScoreApi.JsonObject.schedule == undefined) return;

    //var games = window.GetScoreApi.JsonObject.schedule.game ;
    var teams = window.GetGameInfoTeamForScore.JsonObject.Data;
    var game = null;

    $.each(games , function (index, element) {
        var home = element.hometeam.teamid ;
        var away = element.awayteam.teamid;
        var left = teams[0].teamApiID;
        var right = teams[1].teamApiID;

        //console.log( home + ' ' + away + ' ' + left + ' ' + right )
        if ((home == left && away == right ) || (home == right && away == left)) {
            game = element;
            return false;
        }
    });

    var getScore = function (game, team) {
        console.log( game );
        if (game.hometeam.teamid == team.teamApiID) return game.homescore;
        if (game.awayteam.teamid == team.teamApiID) return game.awayscore;
    }

    var rankify = function (number) {
        if (number == undefined) return;
        return '1st 2nd 3rd 4th 5th 6h 7th 8th 9th 10th'.split(' ')[number + 1];
    }

    var change = function (block, name, value) {
        var newValue  = String( value ) ;
        if (value == undefined) newValue = '';
        if( typeof value === 'object') newValue = '';
        if ( block.find( name ).text() != newValue) block.find( name ).text(newValue);
    }

    if (game == null) return;

    var block = $('#team-page-sponsor-enterGameCenter-display');
    change(block, '.id-left-team-score', getScore(game, teams[0] ));
    change(block, '.id-right-team-score', getScore(game, teams[1])  );
    change(block, '.id-status', game.gamestatus.status);
    change(block, '.id-time', game.gamestatus.timeremaining);
    change(block, '.id-match', rankify(game.gamestatus.period));

    if (onSuccess != undefined) onSuccess();
    */
}