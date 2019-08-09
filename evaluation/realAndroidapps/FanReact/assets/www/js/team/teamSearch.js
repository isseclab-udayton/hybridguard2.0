var teamsearchNameSpace = {
    currentPage: null, // to use teamsearchNameSpace.currentPage = someNumber;
    teamState: null, 
    teamSport:null,
    teamLevel: null,
    teamCity: null,
    teamConference: null,
    teamSportIcon:null,

    // to use teamsearchNameSpace.getAllSportFeed();
    getAllSportFeed: function () {
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamSport';
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildAllSportList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },

    buildAllSportList: function (data) {
        var output = '<table class="feed sports">';


        $.each(data.Data, function (i, sport) {

            var teamSport = sport.teamSport;
            var Icon = domainNameSpace.name + sport.teamSportIcon;
            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + Icon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamSport=\'' + teamSport + '\'; teamsearchNameSpace.teamSportIcon=\'' + Icon + '\'; teamsearchNameSpace.getLevelFeed();" >' + teamSport + '</a>';
            output += '</h2></td></tr>';
        });
        
        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        $("#teamSearchViewHeading").html("Team Search");

        teamsearchNameSpace.currentPage = 'sport';
        teamsearchNameSpace.backToPrevious();
    },

    getLevelFeed: function () {
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamLevel&teamSport=' + teamsearchNameSpace.teamSport;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            try {
                var teamLevel = data.Data[1].teamLevel; 
            } catch (err) {
                var teamLevel = data.Data[0].teamLevel;
            }
            if (data.ErrorCode === 0 && teamLevel != "" ) {
                teamsearchNameSpace.buildLevelList(data);
            }
            else if (data.ErrorCode === 0 && teamLevel == "" ) {
                teamsearchNameSpace.getOtherTeamFeed();
            }
        }).fail(function () {
            console.log("fail");
        });
    },

    // to use gamecenterNameSpace.buildList();
    buildLevelList: function (data) {
        var output = '<table class="feed sports">';
       
        $.each(data.Data, function (i, sport) {

     
            var teamLevel = sport.teamLevel;
            var Icon = domainNameSpace.name + "";
            var sportsIcon = "";

            if (teamLevel == "") {
                teamLevel = "Other";
            }

            if (data.Data[i].hasOwnProperty('teamSportIcon') && icon != undefined) {
                sportsIcon = Icon;
            }
            else {
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }
 
            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + sportsIcon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamLevel=\'' + teamLevel + '\'; teamsearchNameSpace.determineLevel()"  >' + teamLevel + '</a>';
            output += '</h2></td></tr>';
        });

        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        //$("#teamSearchViewHeading").html("Team Search - " + teamsearchNameSpace.teamSport);

        teamsearchNameSpace.currentPage = 'level';
        teamsearchNameSpace.backToPrevious();
    },

    // determine level to give list of choices to pick or list of teams to follow 
    determineLevel: function ( ) {
        if (teamsearchNameSpace.teamLevel == 'Professional') {
            //teamsearchNameSpace.getProfessionalTeamFeed();
            var teamSport = teamsearchNameSpace.teamSport;
            if (teamSport == 'Soccer') {

                teamsearchNameSpace.getLeagueFeed();

            } else {

                teamsearchNameSpace.getProfessionalTeamFeed();

            }
        }
        if (teamsearchNameSpace.teamLevel == 'High School') {
            teamsearchNameSpace.getHighSchoolStateFeed();
        }
        if (teamsearchNameSpace.teamLevel == 'Middle School') {
            teamsearchNameSpace.getHighSchoolStateFeed();
        }
        if (teamsearchNameSpace.teamLevel == 'College') {
            teamsearchNameSpace.getConferenceFeed();
        }
        if (teamsearchNameSpace.teamLevel == 'Other') {
            teamsearchNameSpace.getOtherTeamFeedOfError();
        }
    },

    getLeagueFeed: function () {

        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamLeague&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({

            type: "GET",
            url: chosenUrl,

        }).success(function (data) {

            if (data.ErrorCode === 0) {

                teamsearchNameSpace.buildLeagueList(data);

            }

        }).fail(function () {

            console.log("fail");

        });

    },

    buildLeagueList: function (data) {

        var output = '<table class="feed sports">';

        $.each(data.Data, function (i, element) {

            var teamLeague = element.teamLeague;
            var Icon = domainNameSpace.name + "";

            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamSportIcon') && Icon != undefined) {

                sportsIcon = Icon;

            }
            else {

                sportsIcon = teamsearchNameSpace.teamSportIcon;

            }

            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + sportsIcon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamLeague=\'' + teamLeague + '\'; teamsearchNameSpace.getLeagueTeamFeed()"  >' + teamLeague + '</a>';
            output += '</h2></td></tr>';

        });

        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'league';
        teamsearchNameSpace.backToPrevious();

    },

    getLeagueTeamFeed: function () {

        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var teamLeague = teamsearchNameSpace.teamLeague;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&teamLeague=' + teamLeague + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({

            type: "GET",
            url: chosenUrl,

        }).success(function (data) {

            if (data.ErrorCode === 0) {

                teamsearchNameSpace.buildLeagueTeamList(data);

            }

        }).fail(function () {

            console.log("fail");

        });

    },


    buildLeagueTeamList: function (data) {

        var teamList = '<table class="feed sports">';

        $.each(data.Data, function (i, team) {


            var teamId = team.teamId;
            var profileHandle = team.teamName;
            var profilePhoto = domainNameSpace.name + team.teamIcon;
            var isFollowing = "button";

            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamIcon') && profilePhoto != undefined) {

                sportsIcon = profilePhoto;

            }
            else {

                sportsIcon = teamsearchNameSpace.teamSportIcon;

            }
            if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

            teamList += '<tr><td class="logo">';
            teamList += '<div onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="img round" style="background-image: url(' + sportsIcon + ');"></div>';
            teamList += '</td><td class="text"><h2>';
            teamList += '<a class="ui-link" ';
            teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
            teamList += '>' + profileHandle + '</a></h2>'; teamList += '</td><td class="follow">';
            teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';


        });

        teamList += "</table>";

        $("#teamSearchFeed").html(teamList);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'leagueTeams';
        teamsearchNameSpace.backToPrevious();

    },

    getConferenceFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamConference&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildConferenceList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },

    buildConferenceList: function (data) {
        var output = '<table class="feed sports">';

        $.each(data.Data, function (i, conference) {

            var teamConference = conference.teamConference;
            var Icon = domainNameSpace.name + "";

            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamSportIcon') && Icon != undefined) {
                sportsIcon = Icon;
            }
            else {
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }

            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + sportsIcon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamConference=\'' + teamConference + '\'; teamsearchNameSpace.getConferenceTeamFeed()"  >' + teamConference + '</a>';
            output += '</h2></td></tr>';
        });

        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'conference';
        teamsearchNameSpace.backToPrevious();
    },

    getConferenceTeamFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var teamConference = teamsearchNameSpace.teamConference;       
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&teamConference=' + teamConference + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildConferenceTeamList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },


    buildConferenceTeamList: function (data) {
        var teamList = '<table class="feed sports">';

        $.each(data.Data, function (i, team) {

            var teamId = team.teamId;
            var profileHandle = team.teamName;
            var profilePhoto = domainNameSpace.name + team.teamIcon;
            var isFollowing = "button";

            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamIcon') && profilePhoto != undefined) {
                sportsIcon = profilePhoto;
            }
            else {
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }
            if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

            teamList += '<tr><td class="logo">';
            teamList += '<div onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="img round" style="background-image: url(' + sportsIcon + ');"></div>';
            teamList += '</td><td class="text"><h2>';
            teamList += '<a class="ui-link" ';
            teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
            teamList += '>' + profileHandle + '</a></h2>';            teamList += '</td><td class="follow">';
            teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

        });

        teamList += "</table>";

        $("#teamSearchFeed").html(teamList);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'conferenceTeams';
        teamsearchNameSpace.backToPrevious();
    },

    getHighSchoolStateFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamState&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildHighSchoolStateList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },


    buildHighSchoolStateList: function (data) {
        var output = '<table class="feed sports">';

        $.each(data.Data, function (i, state) {

            var teamState = state.teamState;
            var Icon = domainNameSpace.name + "";
            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamSportIcon') && icon != undefined) {
                sportsIcon = Icon;
            }
            else {
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }

            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + sportsIcon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamState=\'' + teamState + '\'; teamsearchNameSpace.getHighSchoolCityFeed()"  >' + teamState + '</a>';
            output += '</h2></td></tr>';
        });

        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'state';
        teamsearchNameSpace.backToPrevious();
    },

    getHighSchoolCityFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var teamState = teamsearchNameSpace.teamState;
      
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetTeamCity&teamState=' + teamState + '&teamLevel=' + teamLevel + '&teamSport=' + teamSport;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {               
                teamsearchNameSpace.buildHighSchoolCityList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },


    buildHighSchoolCityList: function (data) {
        var output = '<table class="feed sports">';

        $.each(data.Data, function (i, city) {

            var teamCity = city.teamCity;
            var Icon = domainNameSpace.name + "";

            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamSportIcon') && icon != undefined) {
                sportsIcon = Icon;
            }
            else {
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }

            output += '<tr><td class="logo">';
            output += '<div class="img round" style="background-image: url(\'' + sportsIcon + '\');"></div>';
            output += '</td><td class="text"><h2>';
            output += '<a onclick=" teamsearchNameSpace.teamCity=\'' + teamCity + '\'; teamsearchNameSpace.getHighSchoolTeamFeed()"  >' + teamCity + '</a>';
            output += '</h2></td></tr>';
        });

        output += '</table>';

        $("#teamSearchFeed").html(output);
        $("#teamSearchFeed").trigger('create');

        teamsearchNameSpace.currentPage = 'city';
        teamsearchNameSpace.backToPrevious();
    },

    getHighSchoolTeamFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var teamCity = teamsearchNameSpace.teamCity;
        var teamState = teamsearchNameSpace.teamState;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&profileId=' + profileId + '&teamCity=' + teamCity +'&teamState=' + teamState;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildHighSchoolTeamList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },

    buildHighSchoolTeamList: function (data) {
        var teamList = '<table class="feed sports">';
        //teamList = '<ul class="feed sports" data-role="listview"  data-filter="true" data-inset="true"   >';

        $.each(data.Data, function (i, team) {

            var teamId = team.teamId;
            var profileHandle = team.teamName;
            var profilePhoto = domainNameSpace.name + team.teamIcon;
           // alert(team.teamIcon);
            var sportsIcon = "";
            if (data.Data[i].hasOwnProperty('teamSportIcon') && profilePhoto != undefined) {
                sportsIcon = profilePhoto;               
            }
            else {               
                sportsIcon = teamsearchNameSpace.teamSportIcon;
            }

            var isFollowing = "button";
            if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

            teamList += '<tr><td class="logo">';
            teamList += '<div onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="img round" style="background-image: url(' + sportsIcon + ');"></div>';
            teamList += '</td><td class="text"><h2>';
            teamList += '<a class="ui-link" ';
            teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
            teamList += '>' + profileHandle + '</a></h2>';            teamList += '</td><td class="follow">';
            teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

        });

        teamList += "</table>";

        $("#teamSearchFeed").html(teamList);
        $("#teamSearchFeed").trigger('create');


        // $("#teamSearchViewHeading").html("Team Search - Professional Teams");

        teamsearchNameSpace.currentPage = 'cityTeams';
        teamsearchNameSpace.backToPrevious();
    },

    getProfessionalTeamFeed: function () {
        var teamSport = teamsearchNameSpace.teamSport;
        var teamLevel = teamsearchNameSpace.teamLevel;
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&teamLevel=' + teamLevel + '&profileId=' + profileId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                teamsearchNameSpace.buildProfessionalTeamList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },

    buildProfessionalTeamList: function (data) {
        var teamList = '<table class="feed sports">';
        //teamList = '<ul class="feed sports" data-role="listview"  data-filter="true" data-inset="true"   >';

        $.each(data.Data, function (i, team) {

            var teamId = team.teamId;
            var profileHandle = team.teamName;
            var profilePhoto = domainNameSpace.name + team.teamIcon;
            var isFollowing = "button";
            if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

            teamList += '<tr><td class="logo">';
            teamList += '<div onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + ';" class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
            teamList += '</td><td class="text"><h2>';
            teamList += '<a class="ui-link" ';
            teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
            teamList += '>' + profileHandle + '</a></h2>';
            teamList += '</td><td class="follow">';
            teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

        });

        teamList += "</table>";

        $("#teamSearchFeed").html(teamList);
        $("#teamSearchFeed").trigger('create');


        // $("#teamSearchViewHeading").html("Team Search - Professional Teams");

        teamsearchNameSpace.currentPage = 'professionalTeams';
        teamsearchNameSpace.backToPrevious();
    },

    backToPrevious: function () {

        var page = teamsearchNameSpace.currentPage;
        var onclickEvent = 'onclick=""';
        var title = 'All Sports';
        
        switch( page ) {
            case 'sport':
                //onclickEvent = 'href="#" data-rel="back"';
                onclickEvent = '';
                title = 'All Sports';
                break;
            case 'level':
                onclickEvent = 'onclick=" teamsearchNameSpace.getAllSportFeed(); "';
                title = 'Change Sport';
                break;
            case 'professionalTeams':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLevelFeed(); "';
                title = 'Change Level';
                break;
            case 'state':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLevelFeed(); "';
                title = 'Change Level';
                break;
            case 'city':
                onclickEvent = 'onclick=" teamsearchNameSpace.getHighSchoolStateFeed(); "';
                title = 'Change State';
                break;
            case 'cityTeams':
                onclickEvent = 'onclick=" teamsearchNameSpace.getHighSchoolCityFeed(); "';
                title = 'Change City';
                break;
            case 'conference':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLevelFeed(); "';
                title = 'Change Level';
                break;
            case 'conferenceTeams':
                onclickEvent = 'onclick=" teamsearchNameSpace.getConferenceFeed(); "';
                title = 'Change Conference';
                break;
            case 'league':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLevelFeed(); "';
                title = 'Change Level';
                break;
            case 'leagueTeams':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLeagueFeed(); "';
                title = 'Change League';
                break;
            case 'other':
                onclickEvent = 'onclick=" teamsearchNameSpace.getLevelFeed(); "';
                title = 'Change Level';
                break;
            default:
                console.log("error going back - teamSearch.js");
                break;
        }

        var titleOfPage = ' <div class="addMoreTeams"><a ' + onclickEvent + '>' + title + '</a><div>';
        $('#titleOfPage').html(titleOfPage);

        var backToPrevious = '<a ' + onclickEvent + ' >Team Search</a>';
        $('#teamSearchViewHeading').html(backToPrevious);
        
        // scroll to top
        $('body,html').stop().animate({
            scrollTop: 0
        }, 800);
        
    }
}

////////////////////////////// begin get team for sport that have no level ////////////////////

teamsearchNameSpace.getOtherTeamFeed = function () {
    var teamSport = teamsearchNameSpace.teamSport;
    var profileId = loginNameSpace.loggedUserID;
    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&profileId=' + profileId;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function (data) {
        if (data.ErrorCode === 0) {
            teamsearchNameSpace.buildOtherTeamList(data);
        }
    }).fail(function () {
        console.log("fail");
    });
}


teamsearchNameSpace.buildOtherTeamList = function (data) {
    var teamList = '<table class="feed sports">';

    $.each(data.Data, function (i, team) {

        var teamId = team.teamId;
        var profileHandle = team.teamName;
        var profilePhoto = domainNameSpace.name + team.teamIcon;
        var isFollowing = "button";
        if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

        teamList += '<tr><td class="logo">';
        teamList += '<div onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
        teamList += '</td><td class="text"><h2>';
        teamList += '<a class="ui-link" ';
        teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
        teamList += '>' + profileHandle + '</a></h2>';
        teamList += '</td><td class="follow">';
        teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

    });

    teamList += "</table>";

    $("#teamSearchFeed").html(teamList);
    $("#teamSearchFeed").trigger('create');


    // $("#teamSearchViewHeading").html("Team Search - Professional Teams");

    teamsearchNameSpace.currentPage = 'level';
    teamsearchNameSpace.backToPrevious();
}

////////////////////////////// end get team for sport that have no level ////////////////////

////////////////////////////// begin get team for sport that have no level by error ////////////////////

teamsearchNameSpace.getOtherTeamFeedOfError = function () {
    var teamSport = teamsearchNameSpace.teamSport;
    var profileId = loginNameSpace.loggedUserID;
    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedTeamListSQL&teamSport=' + teamSport + '&profileId=' + profileId;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function (data) {
        if (data.ErrorCode === 0) {
            teamsearchNameSpace.buildOtherTeamListOfError(data);
        }
    }).fail(function () {
        console.log("fail");
    });
}


teamsearchNameSpace.buildOtherTeamListOfError = function (data) {
    var teamList = '<table class="feed sports">';

    $.each(data.Data, function (i, team) {

        var teamLevel = team.teamLevel;
        var teamId = team.teamId;
        var profileHandle = team.teamName;
        var profilePhoto = domainNameSpace.name + team.teamIcon;
        var isFollowing = "button";
        if (team.isFollowing == "") { isFollowing = 'button active ui-link' }
        if (teamLevel != "") { return };
        teamList += '<tr><td class="logo">';
        teamList += '<div onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
        teamList += '</td><td class="text"><h2>';
        teamList += '<a class="ui-link" ';
        teamList += '  onclick="location.hash=\'../team/teampage.html\'; teampageNameSpace.teamId = ' + teamId + '; "';
        teamList += '>' + profileHandle + '</a></h2>';        teamList += '</td><td class="follow">';
        teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

    });

    teamList += "</table>";

    $("#teamSearchFeed").html(teamList);
    $("#teamSearchFeed").trigger('create');


    // $("#teamSearchViewHeading").html("Team Search - Professional Teams");

    teamsearchNameSpace.currentPage = 'other';
    teamsearchNameSpace.backToPrevious();
}

////////////////////////////// end get team for sport that have no level by error ////////////////////