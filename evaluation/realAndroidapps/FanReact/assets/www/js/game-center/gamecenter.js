var gamecenterNameSpace = {
    scheduleId: null, // to use gamecenterNameSpace.scheduleId = someNumber;
    postId: null,
    teamsInfo: { teamId1: null, teamName1: null, teamIcon1: null, teamId2: null, teamName2: null, teamIcon2: null, scheduleDateAndTime: null },
	
    getGamecenterFeed: function () {

		var profileId = loginNameSpace.loggedUserID;
        //var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllPostsGC&scheduleId=' + gamecenterNameSpace.scheduleId;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllPostsGCv2&scheduleId=' + gamecenterNameSpace.scheduleId + '&profileId=' + profileId;
        
        //console.log(chosenUrl);

        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                $("#gameCenterFeed").empty();
                $("#gameCenterTrending").empty();
                gamecenterNameSpace.buildList(data);
            }
            else {
                // modify
                $("#gameCenterFeed").empty();
                $("#gameCenterTrending").empty();
                $("#gameCenterFeed").html('<br><center>Be the first to post :)</center>');
            }
        }).fail(function () {
            console.log("fail trigger getGamecenterFeed in gamecenter.js");
        });
    },

    // to use gamecenterNameSpace.buildList();
    buildList: function (data) {
        var gameDiv = "";

        $.each(data.Data, function (i, game) {

            var postId = game.postId;
            var profileId = game.profileId;
            var postTitle = game.postTitle;
            var postDescription = game.postDescription;
            var postVideoLink = game.postVideoLink;
            var postImageLink = game.postImageLink;
            var postCreateDate = game.postCreateDate;
            var postUpvoteDownvoteCount = game.postUpvoteDownvoteCount;
            var postFlagMessage = game.postFlagMessage;
            var profileHandle = game.profileHandle;
            var profilePhoto = game.profilePhoto;
            var fanreactCommentsCount = game.fanreactCommentsCount;

            postDescription = customNamespace.replaceImg(postDescription,1);
            //postDescription = commentNameSpace.linkify(postDescription);

            //gameDiv += '<div class="entry" ><div class="avatar"><div class="img round" style="background-image: url(' + profilePhoto + ');" ></div>';
            //gameDiv += '<p class="username"><a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';">' + profileHandle + '</a></p>';
			
			//gameDiv += '<p class="message" onclick="';
            //gameDiv += '  location.hash=\'../comments/commentsView.html\';';
            //gameDiv += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\');';
            //gameDiv += '  commentNameSpace.postId=' + postId + '"';
			//gameDiv += '>' + postDescription + '</p>';

			//gameDiv += '</div>';
            //gameDiv += '<img src="' + postImageLink + '" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" />';
            
            //replace empty avatar
            if ( profilePhoto == '')
            {
                profilePhoto = '../../images/default-avatar.png';
            }
            
            
            var classForimgDiv = '';
            if (postImageLink !== '') { classForimgDiv += 'postMediaOfFeedList' };
            if (postVideoLink !== '') { classForimgDiv += ' videoCamera' };


            //if ( votes < 0 ) { votes = 0 ; }
            gameDiv += '<div class="entry" ><div class="avatar"><div class="img round" style="background-image: url(' + profilePhoto + ');" ></div>';
            gameDiv += '<p class="username"><a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';">' + profileHandle + '</a></p>';
            gameDiv += '<p class="message title" onclick="';
            gameDiv += '  location.hash=\'../comments/commentsView.html\';';
            gameDiv += '  commentNameSpace.postId=' + postId + ';'
            gameDiv += '">' + postTitle + '</p>';
            gameDiv += '<p class="message desc" onclick="';
            gameDiv += '  location.hash=\'../comments/commentsView.html\';';
            gameDiv += '  commentNameSpace.postId=' + postId + ';'
            gameDiv += '">' + postDescription + '</p>';
            gameDiv += '</div>';

            //reactionsDiv += '<img src="' + postImageLink + '" onerror="$(this).hide();" onclick="location.hash=\'../comments/commentsView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" />';

            gameDiv += '<div class="' + classForimgDiv + '" style="background-image: url(' + postImageLink + ');" ';
            gameDiv += 'onclick="';
            gameDiv += '  location.hash=\'../comments/commentsView.html\';';
            gameDiv += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\'); ';
            gameDiv += '  commentNameSpace.postId=' + postId + ';commentNameSpace.postToFlag='+ postId + ';';
            gameDiv += '">';
            gameDiv += '<span></span>';
            gameDiv += '</div>';
            
            gameDiv += '<div class="subject" ';
            gameDiv += 'onclick="';
            gameDiv += '  location.hash=\'../comments/commentsView.html\';';
            gameDiv += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\'); ';
            gameDiv += '  commentNameSpace.postId=' + postId + ';';
            gameDiv += '">';
            
            gameDiv += '<p class="views">';
            gameDiv += '<i class="fa fa-clock-o"></i> Posted: ' + postCreateDate + '<br>';
            gameDiv += '<i class="fa fa-comment-o"></i> ' + fanreactCommentsCount + ' Comments';
            gameDiv += '<span style="float:right;" >';
            gameDiv += '<i class="fa fa-eye"></i> ' + postFlagMessage + ' Views ';
            gameDiv += '</span>';
            gameDiv += '</p></div>';

            gameDiv += '<div class="postOptions" cellpadding="0" cellspacing="0"';
            gameDiv += 'style="';
            gameDiv += '  width: 100%; margin: 0 -.7em; margin-top: .6em;';
            gameDiv += '">';
            
            gameDiv += '<p class="comment">';
            
            gameDiv += '<a onclick="';
            gameDiv += '  postNameSpace.track = \'comment\' ;';
            gameDiv += '  commentNameSpace.postId=' + postId + ';';
            gameDiv += '  location.hash=\'../post/postView.html\';';
            gameDiv += '" data-transition="none">';
            
            //<a onclick="location.hash=\'../post/postToPublicView.html\'; $(\'#postToPublicViewPostId\').val(\'' + postId + '\');  commentNameSpace.postId=' + postId + '" data-transition="none">
            gameDiv += '<i class="fa fa-comment-o"></i> Post Comment</a></p>';
            gameDiv += '<ul class="thumbs"><li class="up"><a href="#">';
            gameDiv += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + postId + ' , 1 )" class="fa fa-thumbs-o-up"></i></a></li>';
            gameDiv += '<input type="hidden" id="currentVoteOfpostId' + postId + '" value="' + postUpvoteDownvoteCount + '">';
            gameDiv += '<li id="voteOfpostId' + postId + '" class="number">' + postUpvoteDownvoteCount + '</li>';
            gameDiv += '<li class="down"><a href="#">';
            gameDiv += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + postId + ' , -1 )" class="fa fa-thumbs-o-down"></i></a></li></ul>';
            gameDiv += '</div></div>';

            votingNameSpace.checkIfVoteIsUpOrDownAndChangeColor(postId)
        });

		var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].postId;
		var getMorePostInAdvance = '<div class="getMore"  onclick="gamecenterNameSpace.postId = ' + lastIdOfCurrentFeed + ' ; gamecenterNameSpace.moreGamecenterFeed( $(this).attr(\'class\') )"></div>';
		gameDiv += getMorePostInAdvance;

        $("#gameCenterFeed").append(gameDiv);
        //$("#gameCenterFeed").trigger('create');
    },

    moreGamecenterFeed: function (thisDivclass) {
        
        
		if (thisDivclass.search('getMore') == -1) {
			return false;
		}
		$('.getMore').removeClass('getMore');

		var scheduleId = gamecenterNameSpace.scheduleId ;
		var postId = gamecenterNameSpace.postId - 1;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetAllPostsGC&scheduleId=' + scheduleId + '&postId=' + postId;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                gamecenterNameSpace.buildList(data);
            }
        }).fail(function () {
            console.log("fail");
        });
    },

	// to use gamecenterNameSpace.getGamecenterEventFeed();
	getGamecenterEventFeed: function () {

		$("#dropdownMenu").empty();
		var profileId = loginNameSpace.loggedUserID;
		var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGameCenter&profileid=' + profileId;
		console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl,
		}).success(function (data) {
			if (data.ErrorCode === 0) {
				gamecenterNameSpace.buildListForEvents(data);
			}
		}).fail(function () {
			console.log("fail");
		});
	},

	buildListForEvents: function(data) {
		var eventList = "<ul>";
		var evenTeam = { teamName: null, teamId: null, teamIcon: null } ;
		$.each(data.Data, function (i, game) {
			var scheduleId = game.scheduleId;
			var scheduleDateAndTime = game.scheduleDateAndTime;
			var teamName = game.teamName;
			var teamId = game.teamId;
			var teamIcon = game.teamIcon;

			if (  i % 2 == 0 ) {
					evenTeam.teamName = teamName;
					evenTeam.teamId = teamId;
					evenTeam.teamIcon = teamIcon;
			}
			else if (Math.abs(i) % 2 == 1 ) {

				eventList += '<li >';
				eventList += '<a data-rel="back" onclick="gamecenterNameSpace.scheduleId = ' + scheduleId + ' ;';
				eventList += ' gamecenterNameSpace.getGamecenterFeed();';
				eventList += ' gamecenterNameSpace.displayTeamsInfo(' + evenTeam.teamId + ',\'' + evenTeam.teamName + '\',\'' + evenTeam.teamIcon + '\',' + teamId + ',\'' + teamName + '\',\'' + teamIcon + '\',\'' + scheduleDateAndTime + '\');';
				eventList += ' ">' + evenTeam.teamName ;
				eventList += '<br> &nbsp &nbsp vs ' + teamName + ' <br> &nbsp &nbsp &nbsp on ' + scheduleDateAndTime + ' </a>';
				eventList += '</li>';
			}
		});
        eventList += '</ul>';
		$('#dropdownMenu').html(eventList);
	},

	displayTeamsInfo: function (teamId1, teamName1, teamIcon1, teamId2, teamName2, teamIcon2, scheduleDateAndTime) {

        // redefine global variable to this TeamsInfo
        gamecenterNameSpace.teamsInfo.teamId1 = teamId1;
        gamecenterNameSpace.teamsInfo.teamName1 = teamName1;
        
        gamecenterNameSpace.teamsInfo.teamIcon1 = teamIcon1.replace(domainNameSpace.name, "");

        gamecenterNameSpace.teamsInfo.teamId2 = teamId2;
        gamecenterNameSpace.teamsInfo.teamName2 = teamName2;
        gamecenterNameSpace.teamsInfo.teamIcon2 = teamIcon2;
        gamecenterNameSpace.teamsInfo.scheduleDateAndTime = scheduleDateAndTime;

        
	    teamIcon1 = domainNameSpace.name +  gamecenterNameSpace.teamsInfo.teamIcon1;

	    $("#thisTeamImage").css("background-image", "url('" + teamIcon1 + "')");

        // on team icon click, assign teamId to the page and refresh page
	    //$("#thisTeamImage").click(function (event) {
	       // event.preventDefault();
	        //teampageNameSpace.teamId = teamId1;
			//location.hash="../team/teampage.html";
	    //});

	    $("#teamName").html(teamName1);

	    teamIcon2 = domainNameSpace.name +   teamIcon2;

        $("#anotherTeamImage").css("background-image", "url('" + teamIcon2 + "')");
        //$("#anotherTeamImage").click(function (event) {
            //event.preventDefault();
            //teampageNameSpace.teamId = teamId2 ;
			//location.hash="../team/teampage.html";
        //});

        var twoTeams = teamName1 + '<br /> <span>vs.</span><br /> ' + teamName2 + '<br/><br/>' + scheduleDateAndTime;
        
        console.log(twoTeams);
        $(".teamNameVsInfo").html(twoTeams);

	},

    ///////////////////////////////// begin get trending feed //////////////////////////////////////

    getTrend: function () {
        // modify
        var scheduleId =  this.scheduleId;
		var profileId = loginNameSpace.loggedUserID; 
        // modify
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedGetAllPostsGCTrendingV2&scheduleId=" + scheduleId + '&profileId=' + profileId;
        console.log(chosenUrl);
		var thisnamespace = this;
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                // modify
                $("#gameCenterFeed").empty();
                // modify
                $("#gameCenterTrending").empty();
                thisnamespace.buildTrendList(data);
                thisnamespace.deleteTrendSQLite();
                thisnamespace.insertTrendIntoSQLite(data);
            }
        }).fail(function () {
			console.log('connection error');
			thisnamespace.getTrendFromSqlLiteAndDisplay();
        });
    },

    // modify this whole function for design
    buildTrendList: function (data) {

        var content = '';

        $.each(data.Data, function (i, feed) {

            var postId = feed.postId;
            var profileId = feed.profileId;
            var teamId = feed.teamId;
            var scheduleId = feed.scheduleId;

            var postTitle = feed.postTitle;
            var postDescription = feed.postDescription;
            
            postTitle = customNamespace.subString(postTitle, 0, 20);
            postDescription = customNamespace.subString(postDescription, 0, 15);

            var postImageLink = feed.postImageLink;
            var postVideoLink = feed.postVideoLink;
            var classForimgDiv = '';
            
            if ( postImageLink == '')
            {
                postImageLink = '../../images/default-avatar.png';
                classForimgDiv += 'replaceWithDefault ' ;
            }
            if (postImageLink !== '') { classForimgDiv += 'postMediaOfFeedListForTrending' };
            if (postVideoLink !== '') { classForimgDiv += ' videoCamera' };

            var postCreateDate = feed.postCreateDate;
            postCreateDate = customNamespace.convertDate(postCreateDate);
            var postUpvoteDownvoteCount = feed.postUpvoteDownvoteCount;
            var postFacebookShare = feed.postFacebookShare;
            var postTwitterShare = feed.postTwitterShare;
            var postFlagMessage = feed.postFlagMessage;
            var profileHandle = feed.profileHandle;
            var profilePhoto = feed.profilePhoto;

            //if ( votes < 0 ) { votes = 0 ; }
            content += '<table class="feed trending"><tr><td class="rating"><ul class="thumbs"><li class="up"><a href="#">';
            content += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + postId + ' , 1 )" class="fa fa-thumbs-o-up"></i></a></li>';
            content += '<input type="hidden" id="currentVoteOfpostId' + postId + '" value="' + postUpvoteDownvoteCount + '">';
            content += '<li id="voteOfpostId' + postId + '" class="number">' + postUpvoteDownvoteCount + '</li><li class="down"><a href="#">';
            content += '<i onclick="votingNameSpace.checkIfThisPostVoteInSqlLiteAndAction(' + postId + ' , -1 )" class="fa fa-thumbs-o-down"></i></a></li></ul></td>';
            content += '<td class="media">';
            content += '<div class="' + classForimgDiv + '" style="background-image: url(' + postImageLink + ');" ';
            content += 'onclick="';
            content += '  location.hash=\'../comments/commentsView.html\';';
            content += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\'); ';
            content += '  commentNameSpace.postId=' + postId + ';';
            content += '">';
            content += '<span></span>';
            content += '</div>';

            content += '<td class="text">';

            content += '<h2 class="title" onclick="';
            content += '  location.hash=\'../comments/commentsView.html\';';
            content += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\');';
            content += '  commentNameSpace.postId=' + postId + '"';
            content += '>' + postTitle + '</h2>';

            content += '<h2 onclick="';
            content += '  location.hash=\'../comments/commentsView.html\';';
            content += '  $(\'#postToPublicViewPostId\').val(\'' + postId + '\');';
            content += '  commentNameSpace.postId=' + postId + '"';
            content += '>' + postDescription + '</h2>';

            content += '<p';
            content += '>' + profileHandle + '<br /> ' + postCreateDate + ' - ' + postFlagMessage + ' views</p></a>';
            content += '</td></tr>';
            content += '</table>';


            votingNameSpace.checkIfVoteIsUpOrDownAndChangeColor(postId);
        });


		var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].postId;
		var getMorePostInAdvance = '<div class="getMore"  onclick="gamecenterNameSpace.postId = ' + lastIdOfCurrentFeed + ' ; gamecenterNameSpace.moreTrend( $(this).attr(\'class\') )"></div>';
		content += getMorePostInAdvance;


        $("#gameCenterTrending").append(content);
    },

    moreTrend: function (thisDivclass) {

        if (thisDivclass.search('getMore') == -1) {
            return false;
        }
        $('.getMore').removeClass('getMore');

        return false;
        
        var teamId = this.teamId;
        var postId = this.postId;
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedGetAllPostsTeamTrending&teamId=" + teamId + "&postId=" + postId;
        console.log(chosenUrl);

		var thisnamespace = this;
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function (data) {
            if (data.ErrorCode === 0) {
                thisnamespace.buildTrendList(data);
            }
        }).fail(function () {
            console.log("Fail");
        });
    },

    getTrendFromSqlLiteAndDisplay: function () {
        var db = sqliteNameSpace.db;
		var thisNameSpace = this;
        db.transaction(function (tx) {
            tx.executeSql("SELECT * FROM gameCenter", [], function (tx, results) {
                var length = results.rows.length;
                if (length == 1) {
                    $("#gameCenterFeed").empty();
                    $("#gameCenterTrending").empty();
                    var dataAsString = results.rows.item(0).trend;
                    var data = JSON.parse(unescape(dataAsString));
                    thisNameSpace.buildFeedList(data);
                }
            }, sqliteNameSpace.errorCB);
        });
    },

    /*Inserts the Profile Feed into the SQLite Database*/
    insertTrendIntoSQLite: function (data) {
        var stringifiedData = escape(JSON.stringify(eval(data)));
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO gameCenter(trend,added_on) VALUES (?,?)",
                          [stringifiedData, addedOn], sqliteNameSpace.onSuccess, console.log("insert error"));
        });
    },

    /*Deletes from SQLite*/
    deleteTrendSQLite: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            tx.executeSql("DELETE FROM gameCenter WHERE trend IS NOT NULL", [], function (tx, results) {
                console.log("deleted!");
            }, console.log("delete error"));
        });
    },

    ////////////////////////////// finish get trending feed //////////////////////////////////

}
    


    
gamecenterNameSpace.getGamecenterFeed = function () {


    var onFail = function(){
        $("#gameCenterTrending").empty();
        $("#gameCenterFeed").html('<br><center>Be the first to post :)</center>');
    }
    
    window.GetGameCenterPosts.Variables.scheduleId = gamecenterNameSpace.scheduleId ;
    window.GetGameCenterPosts.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetGameCenterPosts.DataUpdatedEvent = function( ){ 
        if (window.GetGameCenterPosts.JsonObject.ErrorCode === 0) {
            $("#gameCenterFeed").empty();
            $("#gameCenterTrending").empty();
            gamecenterNameSpace.buildList( window.GetGameCenterPosts.JsonObject );
        } else {
            onFail()
        }	
    }
	window.GetGameCenterPosts.Execute( window.FeedManager ) ;
}

gamecenterNameSpace.moreFeed = function ( thisDivclass ) {

    if (thisDivclass.search('getMore') == -1) {
        return false;
    }
    $('.getMore').removeClass('getMore');
    
    window.GetGameCenterPostsMore.Variables.scheduleId = gamecenterNameSpace.scheduleId ;
    window.GetGameCenterPostsMore.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetGameCenterPostsMore.Variables.skip = gamecenterNameSpace.postId ;

    window.GetGameCenterPostsMore.DataUpdatedEvent = function( ){ 
        if (window.GetGameCenterPostsMore.JsonObject.ErrorCode === 0) {
            gamecenterNameSpace.buildList( window.GetGameCenterPostsMore.JsonObject );
        } 
    }
	window.GetGameCenterPostsMore.Execute( window.FeedManager ) ;
}


gamecenterNameSpace.buildList = function (data) {
                
    data = $.extend(true, {}, data ) ;

    $.each(data.Data, function (index , element ) {

        element.UserProfileId = element.UserProfileId || loginNameSpace.loggedUserID;
        element.profilePhoto = customNamespace.image.resizeAsThumbnail( element.profilePhoto );
        element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;
        element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );
        element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
        element.formatedPostDescription = element.postDescription ;
        data.Data[ index ] = element ;
    });




    var lastID = data.Data[data.Data.length - 1].RowNumber;
    var getMoreInAdvance = '<div class="getMore"  onclick="gamecenterNameSpace.postId = ' + lastID + ' ; gamecenterNameSpace.moreFeed( $(this).attr(\'class\') )"></div>';

    console.log( data );
    var html = customNamespace.display.html( data ,  'reaction-view-reactionFeed-template'  ) ;

    html += getMoreInAdvance ;

    $("#gameCenterFeed").append(html);
}

    

gamecenterNameSpace.getTrend = function () {
    
    window.GetGameCenterTrending.Variables.scheduleId = gamecenterNameSpace.scheduleId ;
    window.GetGameCenterTrending.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetGameCenterTrending.DataUpdatedEvent = function( ){ 
        if (window.GetGameCenterTrending.JsonObject.ErrorCode === 0) {
            $("#gameCenterFeed").empty();
            $("#gameCenterTrending").empty();
            gamecenterNameSpace.buildTrendList( window.GetGameCenterTrending.JsonObject );
        } 	
    }
    
	window.GetGameCenterTrending.Execute( window.FeedManager ) ;
}

gamecenterNameSpace.getTrendMore = function ( thisDivclass ) {

    if (thisDivclass.search('getMore') == -1) {
        return false;
    }
    $('.getMore').removeClass('getMore');
    
    window.GetGameCenterTrendingMore.Variables.scheduleId = gamecenterNameSpace.scheduleId ;
    window.GetGameCenterTrendingMore.Variables.profileId = loginNameSpace.loggedUserID;
    window.GetGameCenterTrendingMore.Variables.skip = gamecenterNameSpace.postId ;

    window.GetGameCenterTrendingMore.DataUpdatedEvent = function( ){ 
        if (window.GetGameCenterTrendingMore.JsonObject.ErrorCode === 0) {
            gamecenterNameSpace.buildTrendList( window.GetGameCenterTrendingMore.JsonObject );
        } 
    }
	window.GetGameCenterTrendingMore.Execute( window.FeedManager ) ;
}


gamecenterNameSpace.buildTrendList = function (data) {
     
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

    var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].RowNumber;
    var getMoreInAdvance = '<div class="getMore"  onclick="gamecenterNameSpace.postId = ' + lastIdOfCurrentFeed + ' ; gamecenterNameSpace.getTrendMore( $(this).attr(\'class\') )"></div>';

    var html = customNamespace.display.html( data ,  'reaction-view-trendingFeed-template'  ) ;

    html += getMoreInAdvance ;

    $("#gameCenterTrending").append(html);
}
