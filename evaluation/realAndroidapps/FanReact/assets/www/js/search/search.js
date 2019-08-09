var searchNameSpace = {
	otherProfileId: null,
	moreFromProfileId: null,
	searchPopUpInputText: "",
	moreFromTeamId: null,
	instantSearch: "on",
    isDelete: false,

	/*Gets the search Feed*/
	getPeopleFeed: function (loggedUserId) {

		var profileId = loggedUserId;
		var profileHandle = searchNameSpace.searchPopUpInputText;
		var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllUsersV1&profileId=' + profileId + '&profileHandle=' + profileHandle; //+ '&moreFromProfileId=' + moreFromProfileId;

		//console.log(chosenUrl);

		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {

			$("#peopleSearchList").html("No search result for : " + searchNameSpace.searchPopUpInputText);
			if (data.ErrorCode === 0) {
				$("#peopleSearchList").empty();
				searchNameSpace.buildPeopleSearchList(data);
			}
		}).fail(function () {
			console.log("Fail");
		});
	},

	/*Builds the Search List*/
	buildPeopleSearchList: function (data) {
		var peopleList = '<table class="feed sports">';
        var profId = loginNameSpace.loggedUserID;



		$.each(data.Data, function (i, people) {
            
			var profileId = people.profileId;
			var profileHandle = people.profileHandle;
            var profileFullName = people.profileFullName;
			var profilePhoto = people.profilePhoto;
            
            if (profId != profileId){
            
            // replace empty fullname
            if(profileFullName == '' || profileFullName == undefined){profileFullName = 'FanReact User'}
            
            //replace empty avatar
            if ( profilePhoto == '')
            {
                profilePhoto = '../../images/default-avatar.png';
            }
			else if (profilePhoto.search('http://') == -1 && profilePhoto.search('https://') == -1 ) { 
				profilePhoto = domainNameSpace.name + people.profilePhoto;
			}
            
            profileHandle = customNamespace.subString(profileHandle, 0, 16);
            profileFullName = customNamespace.subString(profileFullName, 0, 16);

			var isFollowing = "button";
			if (people.isFollowing == "") { isFollowing = 'button active ui-link' }

    			peopleList += '<tr><td  onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" class="logo">';
    			peopleList += '<div class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
    			peopleList += '</td><td class="text" width="200"><h2>';
    			peopleList += '<a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" class="ui-link"><font size="2"><b>' + profileHandle + '</b></font>';
                peopleList += '<br><font size="2">'+profileFullName+'</font>';
                peopleList += '</a></h2>';
    			peopleList += '</td><td class="follow">';
    			peopleList += '<a id="followFan' + profileId + '" onclick="searchNameSpace.followPeople(' + profileId + ')" class="' + isFollowing + '">ollow</a></td></tr>';
            }

		});

		peopleList += "</table>";

		var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].profileHandle;
		var getMorePostInAdvance = '<div class="getMore"  onclick="searchNameSpace.moreFromProfileId = \'' + lastIdOfCurrentFeed + '\' ; searchNameSpace.morePeopleFeed( $(this).attr(\'class\') )"></div>';
		peopleList += getMorePostInAdvance;

		$("#peopleSearchList").append(peopleList);
		$("#peopleSearchList").trigger('create');
	},

	/*Gets the search Feed*/
	morePeopleFeed: function (thisDivclass) {

		if (thisDivclass.search('getMore') == -1) {
			return false;
		}
		$('.getMore').removeClass('getMore');

		var profileId = loginNameSpace.loggedUserID;
		var profileHandle = searchNameSpace.searchPopUpInputText;
		var startAfter = searchNameSpace.moreFromProfileId;
		var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllUsersV1&profileId=' + profileId + '&profileHandle=' + profileHandle + '&startAfter=' + startAfter;

		//console.log(chosenUrl);

		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			if (data.ErrorCode === 0) {
				searchNameSpace.buildPeopleSearchList(data);
			}
		}).fail(function () {
			console.log("Fail");
		});
	},


	followPeople: function (otherProfileId, thisProfileId) {
		var thisProfileId = loginNameSpace.loggedUserID;
		searchNameSpace.otherProfileId = otherProfileId;
		var linkText = $('#followFan' + searchNameSpace.otherProfileId);
		var chosenUrl;
		if (linkText.hasClass("active") == true) {
			chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowProfile&profileId=' + otherProfileId + '&followerProfileId=' + thisProfileId;
		}
		if (linkText.hasClass("active") == false) {
			chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedUnfollowProfile&profileid=' + otherProfileId + '&followerProfileId=' + thisProfileId;
		}
		console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			console.log('data is:' + data);

			if (data.indexOf("Follow") > -1) {
				$('#followFan' + searchNameSpace.otherProfileId).removeClass('active ui-link');
			}

			if (data.indexOf("Unfollow") > -1) {
				$('#followFan' + searchNameSpace.otherProfileId).addClass('active ui-link');
			}

            if(searchNameSpace.isDelete === true || searchNameSpace.isDelete == true)
            {                
                var count = (fansOfNameSpace.fansOfTotal - 1)
                fansOfNameSpace.refreshHeader(count);               
            }            
           
		}).fail(function () {
			console.log("Fail");
		});
	},

	/*Gets the search Feed*/
	getTeamFeed: function (loggedUserId) {

		var profileId = loggedUserId;
		var teamName = searchNameSpace.searchPopUpInputText;

        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllTeamsV1&profileId=' + profileId + '&teamName=' + teamName;// + '&teamId=' + teamId;
		//console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			$("#teamSearchList").html("<center> No search result for : " + searchNameSpace.searchPopUpInputText + "</center>");

			if (data.ErrorCode === 0) {
			    $("#teamSearchList").empty();
			    searchNameSpace.buildTeamSearchList(data);
			} else { // if errorcode is undefined
			    console.log(data);
			}
		}).fail(function () {

            console.log("Fail");
		});
	},

	/*Builds the Search List*/
	buildTeamSearchList: function (data) {
        var id = 'buildTeamSearchList' + moment().format('HHMMSS');
        var teamList = '<table class="feed sports '+ id +'" style="display:none;">';


		$.each(data.Data, function (i, team) {

			var teamId = team.teamId;
			var profileHandle = team.teamName;
			var profilePhoto = domainNameSpace.name + team.teamIcon;

			var isFollowing = "button";
			if (team.isFollowing == "") { isFollowing = 'button active ui-link' }

			teamList += '<tr><td onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="logo">';
			teamList += '<div class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
			teamList += '</td><td class="text"><h2>';
			teamList += '<a onclick=\'location.hash="../team/teampage.html"; teampageNameSpace.teamId = ' + teamId + '; \' class="ui-link">' + profileHandle + '</a></h2>';
			teamList += '</td><td class="follow">';
			teamList += '<a id="followTeam' + teamId + '" onclick="searchNameSpace.followTeam(' + teamId + ')" class="' + isFollowing + '">ollow</a></td></tr>';
            
		});

		teamList += "</table>";

		var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].teamName;
		var getMoreInAdvance = '<div class="getMore"  onclick="searchNameSpace.moreFromTeamId = \'' + escape(lastIdOfCurrentFeed) + '\' ; searchNameSpace.moreTeamFeed( $(this).attr(\'class\') )"></div>';
		teamList += getMoreInAdvance;

		$("#teamSearchList").append(teamList);
		$("#teamSearchList").trigger('create');
        $('.'+id).show();
	},


	/*Gets the search Feed*/
	moreTeamFeed: function (thisDivclass) {
	    try{
	        if (thisDivclass.search('getMore') == -1) {
	            return false;
	        }
	        $('.getMore').removeClass('getMore');

	        var profileId = loginNameSpace.loggedUserID;
	        var teamName = searchNameSpace.searchPopUpInputText;
	        var startAfter = unescape(searchNameSpace.moreFromTeamId);
	        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllTeamsV1&profileId=' + profileId + '&teamName=' + teamName + '&startAfter=' + startAfter;
	        //console.log(chosenUrl);
	        $.ajax({
	            type: "GET",
	            url: chosenUrl
	        }).success(function (data) {
	            if (data.ErrorCode === 0) {
	                searchNameSpace.buildTeamSearchList(data);
	            } else {
	                console.log(data);
	            }
	        }).fail(function () {
	            console.log("Fail");
	        });
	    } catch (err) { console.log(err.message); }
	},
    
	forceTeam: function (otherProfileId) {
		var thisProfileId = loginNameSpace.loggedUserID;
		var chosenUrl = chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowTeam&profileId=' + thisProfileId + '&teamid=' + otherProfileId;
        console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			console.log(data);

		}).fail(function () {
			console.log("Fail");
		});
	},    


	followTeam: function (otherProfileId) {
		var thisProfileId = loginNameSpace.loggedUserID;
		searchNameSpace.otherProfileId = otherProfileId;
		var linkText = $('#followTeam' + searchNameSpace.otherProfileId);
		var chosenUrl;
		if (linkText.hasClass("active") == true) {
			chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowTeam&profileId=' + thisProfileId + '&teamid=' + otherProfileId;
		}
		if (linkText.hasClass("active") == false) {
			chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedUnfollowTeam&profileId=' + thisProfileId + '&teamid=' + otherProfileId;
		}
		//console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			console.log(data);

			if (data.indexOf("Follow") > -1) {
				$('#followTeam' + searchNameSpace.otherProfileId).removeClass('active ui-link');
			}

			if (data.indexOf("Unfollow") > -1) {
				$('#followTeam' + searchNameSpace.otherProfileId).addClass('active ui-link');
			}
		}).fail(function () {
			console.log("Fail");
		});
	}


};

