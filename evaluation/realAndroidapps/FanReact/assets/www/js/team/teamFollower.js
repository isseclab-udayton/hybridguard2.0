var teamFollowerNamespace = {};

teamFollowerNamespace.var = {};
teamFollowerNamespace.var.teamId = 0;
teamFollowerNamespace.var.feedForFollower = {};

teamFollowerNamespace.var.modify = function(name,value){
    teamFollowerNamespace.var[name] = value ;
};

teamFollowerNamespace.getTeamFeed = function () {

    var profileId = loginNameSpace.loggedUserID;
    var teamId = teamFollowerNamespace.var.teamId;
    //var teamId = 0;
    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFansFollowingATeam&profileId='+profileId+'&teamId='+teamId;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {
        
        if (data.ErrorCode === 0) {
            teamFollowerNamespace.var.modify('feedForFollower',data);
            teamFollowerNamespace.buildfollowerList(data);
        } else { // if errorcode is undefined
            console.log(data);
        }
    }).fail(function () {
        $("#teamSearchList").html("<center> Server Error. Please try again later </center>");
        console.log("Fail");
    });
}

teamFollowerNamespace.buildfollowerList = function (data) {
    var peopleList = '<table class="feed sports">';

    
    var followAllCheck = teamFollowerNamespace.followAll.check(data);
    if(followAllCheck == false){ $('.teamFollower-followAll').fadeIn(); } 
    //console.log(followAllCheck)
    $.each(data.Data, function (i, people) {

        var profileId = people.teamFollower;
        var profileHandle = people.profilehandle;
        var profilePhoto = people.profilePhoto;
        var following = people.followerOfTeamFollower ==  loginNameSpace.loggedUserID ? true : false ;
        var hideMe = '';
        var itsMe = '';

        
        if( profileHandle == null || profileHandle == ''){ return true; }        
        if( profileId == loginNameSpace.loggedUserID ){ hideMe = ' style="display:none;" '; itsMe = ' (Me)';}
                
        //replace empty avatar
        if ( profilePhoto == '')
        {
            profilePhoto = '../../images/default-avatar.png';
        }
        else if (profilePhoto.search('http://') == -1) { 
            profilePhoto = domainNameSpace.name + people.profilePhoto;
        }
        profilePhoto = customNamespace.image.resizeAsThumbnail( profilePhoto );

        var isFollowing = "button";
        if ( following == false ) { isFollowing = 'button active ui-link' }
        
        if (profileHandle.length>=30){
            profileHandle = profileHandle.substring(0,27) + "...";
        }

        peopleList += '<tr><td  onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" class="logo">';
        peopleList += '<div class="img round" style="background-image: url(' + profilePhoto + ');"></div>';
        peopleList += '</td><td class="text"><h2>';
        peopleList += '<a onclick="profileNameSpace.profileID = ' + profileId + ' ; location.hash=\'../profile/profileByIdView.html\';" class="ui-link"><font size="2"><b>' + profileHandle + itsMe + '</font></a></h2>';
        peopleList += '</td><td class="follow">';
        peopleList += '<a '+hideMe+' id="followFan' + profileId + '" onclick="searchNameSpace.followPeople(' + profileId + ')" class="' + isFollowing + '">ollow</a></td></tr>';

    });

    //peopleList += "</ul>";
    peopleList += "</table>";

    //var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].profileHandle;
    //var getMorePostInAdvance = '<div class="getMore"  onclick="searchNameSpace.moreFromProfileId = \'' + lastIdOfCurrentFeed + '\' ; searchNameSpace.morePeopleFeed( $(this).attr(\'class\') )"></div>';
    //peopleList += getMorePostInAdvance;

    $("#teamFollower-list").html(peopleList);
    //$(".teamFollower-list").trigger('create');
}

teamFollowerNamespace.visit = function(teamId){
    if(teamId == undefined){
        teamId = teampageNameSpace.teamId ;
    }
    teamFollowerNamespace.var.modify('teamId',teamId);
    location.hash = '../team/teamFollower.html';
}

teamFollowerNamespace.followAll = function(){
    
    var list = teamFollowerNamespace.var.feedForFollower.Data ;
    var followerList = '';
    $.each(list, function( index, element ){        
        var profileId = element.teamFollower ;
        followerList += profileId + ',';
    });
    followerList += ',|';
    followerList = followerList.replace(',,',',');
    followerList = followerList.replace(',|','');
    
    var followerProfileId = loginNameSpace.loggedUserID;
    var profileId = followerList;
    //var teamId = 0;
    var chosenUrl = domainNameSpace.name + '?alttemplate=JsonFeedFollowAListOfProfile&followerProfileId='+followerProfileId;
    console.log(chosenUrl);
    $.ajax({
        type: "POST",
        url: chosenUrl,
        data: {profileId:profileId}
    }).success(function (data) {  
        
        $('.teamFollower-followAllMsg').slideUp();
        $('.teamFollower-followAllSuccess').slideDown();
        console.log(data);
    }).fail(function ( data ) {
        console.log(data);
    });
    
    $('.teamFollower-followAll').slideUp();
    $('.teamFollower-followAllMsg').slideDown();
}

teamFollowerNamespace.followAll.check = function(data){
    
    if(data == undefined ){ data = teamFollowerNamespace.var.feedForFollower.Data}
    var list = data.Data ;
    var followerList = '';
    var followAllCheck = true;
    $.each(list, function( index, element ){        
        var profileId = element.teamFollower ;
        var profilehandle = element.profilehandle;
        if( profilehandle == null || profilehandle == ''){ return true; }
        if( profileId == loginNameSpace.loggedUserID ){ return true; }
        //console.log(element.followerOfTeamFollower)
        if( element.followerOfTeamFollower == '' ){ 
            followAllCheck = false ;
            return false;              
        } ;
    });
              
    var teamInfo = teampageNameSpace.feedForSingleTeam.Data[0];
    console.log(teamInfo.enableFollowAll);
    if( teamInfo.enableFollowAll == 'disabled' ){ 
        followAllCheck = true ;        
    } ;
    
    return followAllCheck;
}