var leagueNameSpace = {
    
    viewTitle: "",
    division: "",
    levels: "",
    
    /*Gets the levels*/
    getLevels: function (sport) {  
        leagueNameSpace.viewTitle = sport;
        leagueNameSpace.getDivisionsBySport(sport, 'Level');
    },
    
    /*Gets the levels by sport*/
    getDivisionsBySport: function (sport, division) {
        
        leagueNameSpace.viewTitle = sport;
        
        $.ajax({
            type: "GET",
            url: 'http://fanreact.dev.contentactive.com/?alttemplate=JsonFeedListLookup&listName=Data&parentName=' + sport + '&dataType=' + division,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                if (division === 'Level') {
                    location.hash = "../league/levelView.html";
                    leagueNameSpace.buildLevelsList(data.Data);
                }
                
            }
            
        }).fail(function() {
            console.log("fail");
        });
    },
    
    /*Builds the levels list*/
    buildLevelsList: function (data) {
        var level = '';
        $.each(data, function (i, lev) {
            level += '<tr><td class="text" style="padding-left: 3%;" onclick="leagueNameSpace.callByConferenceOrLeague(\''+ leagueNameSpace.viewTitle + '\')"><h2><a>'+ lev.NodeName +'</a></h2></td></tr>';
        });
        leagueNameSpace.levels = level;
    },
    
    
    /*Gets the conferences or leagues of a sport*/
    callByConferenceOrLeague: function (sport) {
        leagueNameSpace.getByConferenceOrLeague(sport, 'Conference');
        leagueNameSpace.getByConferenceOrLeague(sport, 'League');
    },
    
    /*Gets the conferences or leagues of a sport*/
    getByConferenceOrLeague: function (sport, type) {
        
        $.ajax({
            type: "GET",
            url: 'http://fanreact.dev.contentactive.com/?alttemplate=JsonFeedListLookup&listName=Data&parentName=' + 'BaseballProfessional' + '&dataType=' + type,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                leagueNameSpace.buildByConferenceOrLeague(data.Data);
            }
            
        }).fail(function() {
            console.log("fail");
        });
    },
    
    /*Builds the conferences or leagues list*/
    buildByConferenceOrLeague: function (data) {
        var leagueOrConference = '';
        $.each(data, function (i, loc) {
            leagueOrConference += '<div class="feedWrapper"><h2 class="header"></h2></div>';
        });
    }
    
    /*buildDivisions: function (data) {
        var division = '';
        
        $.each(data, function (i, div) {
            division += '<div class="feedWrapper"><h2 class="header">'+ div.NodeName +'</h2></div>';
        });
        leagueNameSpace.division = division;
        
    }*/
    
    
    /*Builds the teams list related to a league*/
    /*buildTeamsListRelatedToLeague: function (data, division) {
        
        var team = '';
        team += '<tr><td class="logo"><div class="img round" style="background-image: url(../../images/logo-nfl-bills.gif);"></div></td>';
        team += '<td class="text"><h2><a href="#">Buffalo Bills</a></h2></td><td class="follow"><a href="#" class="button active">ollow</a></td></tr>';
        
        if (division === appSettings.teams_divisions.east) {
            $("#teamsEast").append(team);
        }
        else if (division === appSettings.teams_divisions.north) {
            $("#teamsNorth").append(team);
        }
        else if (division === appSettings.teams_divisions.south) {
            $("#teamsSouth").append(team);
        }
        else if (division === appSettings.teams_divisions.west) {
            $("#teamsWest").append(team);
        }

    }*/
};