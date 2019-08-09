var followingNameSpace = {
    
    league: '',
    teamFeed: null,
    sportFeed: null,
    var : {},    
    
    /*Gets the teams related to an user*/
    getTeams: function (loggedUserId) {
        
        window.GetTeamFollowing.Variables.profileId = loginNameSpace.loggedUserID ;
        window.GetTeamFollowing.DataUpdatedEvent = function(){ 
            var data = window.GetTeamFollowing.JsonObject ;
            followingNameSpace.teamFeed = data ;
            followingNameSpace.buildTeamsList(data);
        }
        window.GetTeamFollowing.Execute( window.FeedManager ) ;
        
    },
        
    buildTeamsList: function (data) {
        
        var data = $.extend(true, {}, data );
        $.each( data.Data , function(index,element){
            element.index = index ;
            element.GameCenter = element.GameCenter == 1 ? true : false ;
            element.teamIcon = domainNameSpace.name + element.teamIcon;
            data.Data[ index ] = element ;
        });
        
        followingNameSpace.var.teamFeed = data ;
           
        customNamespace.display.html( data ,  'followingView-team-template' , 'followingView-team-display' ) ;
    },
    
    /*Sets the clicked league*/
    setClickedLeague: function (league) {
        followingNameSpace.league = league;
    },
    

    /*Gets all the sports*/
    getAllSports: function () {
        
        
        window.GetAllSport.Variables.profileId = loginNameSpace.loggedUserID ;
        window.GetAllSport.DataUpdatedEvent = function(){ 
            var data = $.extend(true, {}, window.GetAllSport.JsonObject )
            //console.log(  data );
            $.each( data.Data , function( index , element ){
                element.teamSportIcon = domainNameSpace.name +  element.teamSportIcon ;
                data.Data[index ] = element ;
            });
            customNamespace.display.html( data  ,  'followingView-sportFeed-template' , 'followingView-sportFeed-display' ) ;
        }
        window.GetAllSport.Execute( window.FeedManager ) ;
        
    },
    
    /*Shows teams related to a sport*/
    showTeams: function (title) {
        leagueNameSpace.viewTitle = title;
        location.hash = "../league/nflView.html";
    },
    
    getEventFromTeamIdAndGoToGameCenter: function (teamId, teamName, teamIcon) {
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetEventbyTeam&teamId=' + teamId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {

                var team = data.Data[0];
                gamecenterNameSpace.scheduleId = team.scheduleId;

                gamecenterNameSpace.teamsInfo.teamId1 = teamId;
                gamecenterNameSpace.teamsInfo.teamName1 = teamName;
                gamecenterNameSpace.teamsInfo.teamIcon1 = teamIcon;

                gamecenterNameSpace.teamsInfo.teamId2 = team.teamId;
                gamecenterNameSpace.teamsInfo.teamName2 = team.teamName;
                gamecenterNameSpace.teamsInfo.teamIcon2 = team.teamIcon;
                gamecenterNameSpace.teamsInfo.scheduleDateAndTime = team.scheduleDateAndTime;

                console.log( gamecenterNameSpace.teamsInfo );
                location.hash = '../game-center/gameCenterView.html';
                
            }
        }).fail(function () {
            console.log("fail");
        });
    },
    
    // usage followingNameSpace.getAllSportFeed();
    getAllSportFeed: function () {
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamSport';
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                followingNameSpace.sportFeed = data;
                followingNameSpace.buildAllSportList(data);
            }
        }).fail(function () {
            console.log("fail");
            followingNameSpace.buildAllSportList(followingNameSpace.sportFeed);
        });
    },

    // to use gamecenterNameSpace.buildList();
    buildAllSportList: function (data) {
        var output = '<table class="feed sports">';


        $.each(data.Data, function (i, sport) {

            var teamSport = sport.teamSport;
            var Icon = domainNameSpace.name + sport.teamSportIcon;
            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + Icon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamSport=\'' + teamSport + '\'; teamsearchNameSpace.teamSportIcon=\'' + Icon + '\'; location.hash=\'../team/teamSearchView.html\'" >' + teamSport + '</a>';
            output += '</h2></td></tr>';
        });

        output += '</table>';

        $("#allSportsList").html(output);
        $("#allSportsList").trigger('create');


    }
};