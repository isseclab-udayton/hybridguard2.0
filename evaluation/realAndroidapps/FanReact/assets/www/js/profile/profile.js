var profileNameSpace = {
    profileID: null,
    date: "2014-08-19 15:30:00",
    isStarted: false, //used to know if the update process must be started
    postId: null,
    var: {},
        
    moreProfileFeed: function (thisDivclass) {

        if (thisDivclass.search('getMore') == -1) {
            return false;
        }
        $('.getMore').removeClass('getMore');
        window.GetAllPostOfAUserMore.Variables.profileId = profileNameSpace.profileID ;
        window.GetAllPostOfAUserMore.Variables.skip = profileNameSpace.postId ;
        window.GetAllPostOfAUserMore.Variables.userId = loginNameSpace.loggedUserID ;
        window.GetAllPostOfAUserMore.DataUpdatedEvent = function(){ 
            if (window.GetAllPostOfAUserMore.JsonObject.ErrorCode === 0) {
                profileNameSpace.buildProfileList( window.GetAllPostOfAUserMore.JsonObject );
            }
        }
        window.GetAllPostOfAUserMore.Execute( window.FeedManager ) ;
        
    },
  


    getProfileFeed: function(){

        $('#profileByIdView-postFeed-display').empty();
        window.GetAllPostOfAUser.Variables.profileId = profileNameSpace.profileID ;
        window.GetAllPostOfAUser.Variables.userId = loginNameSpace.loggedUserID ;
        window.GetAllPostOfAUser.DataUpdatedEvent = function(){ 
            if (window.GetAllPostOfAUser.JsonObject.ErrorCode === 0) {
                profileNameSpace.buildProfileList( window.GetAllPostOfAUser.JsonObject );
            }
        }
        window.GetAllPostOfAUser.Execute( window.FeedManager ) ;
    },   
    
    followPeople: function (otherProfileId, isFollowing) {
		var thisProfileId = loginNameSpace.loggedUserID;
		//searchNameSpace.otherProfileId = otherProfileId;
		//var linkText = $('#profileByIdView-profileInfo-FollowButton' + otherProfileId);
		var chosenUrl;
		if (isFollowing !== true) {
			chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedFollowProfile&profileId=' + otherProfileId + '&followerProfileId=' + thisProfileId;
		}else{
            chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedUnfollowProfile&profileid=' + otherProfileId + '&followerProfileId=' + thisProfileId;
        }
		console.log(chosenUrl);
		$.ajax({
			type: "GET",
			url: chosenUrl
		}).success(function (data) {
			console.log(data);

			if (data.indexOf("Follow") > -1) {
                $( '#profileByIdView-profileInfo-FollowButton' ).html('Unfollow') 
                customNamespace.refreshPage();
			}

			if (data.indexOf("Unfollow") > -1) {
				$( '#profileByIdView-profileInfo-FollowButton'  ).html('Follow');
                customNamespace.refreshPage();
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
    

    buildProfileList: function (data) {
        
        if( data.Data.length == 0 ){ return false ; }
        
        $.each(data.Data, function ( index , element ) {

            element.postDescription = customNamespace.replaceImg( element.postDescription , 1 );

            element.UserProfileId = element.UserProfileId || loginNameSpace.loggedUserID;
            element.loggedUserID = loginNameSpace.loggedUserID;

            //replace empty avatar
            element.profilePhoto = customNamespace.image.resizeAsThumbnail( element.profilePhoto );
            element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;

            element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );

            element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
            element.formatedPostDescription = element.postDescription ;

            data.Data[ index ] = element ;
        });
        
        var lastIdOfCurrentFeed = data.Data[data.Data.length - 1].RowNumber;
        var getMorePostInAdvance = '<div class="getMore"  onclick="profileNameSpace.postId = ' + lastIdOfCurrentFeed + ' ; profileNameSpace.moreProfileFeed( $(this).attr(\'class\') )"></div>';
 
        //console.log( data );
        var html = customNamespace.display.html( data ,  'reaction-view-reactionFeed-template'  ) ;

        html += getMorePostInAdvance ;

        $("#profileByIdView-postFeed-display").append( html );
        
        
    }

};

/////////////////////////////// go to profile page function ////////////////////////////

profileNameSpace.toProfileByIdView = function(id) {
    
    profileNameSpace.profileID = id ;
    
    var page = $.mobile.activePage.is("#profileByIdView");
    
    if( page == false ) {
        customNamespace.page.goTo( 'views/profile/profileByIdView.html' );
    }    
    else if( page == true ) {
        $('#popupMenu').popup('close');
        profileNameSpace.getProfileFeed();
        profileNameSpace.profileDetail.getAndDisplay();
        profileNameSpace.profileStatistic.getAndDisplay();
        profileNameSpace.profileTeam.getAndDisplay();
        profileNameSpace.profileDetail.getHypeRank();
    }
    
}

/////////////////////////////// go to profile page function ////////////////////////



profileNameSpace.profileDetail = profileNameSpace.profileDetail || {};
profileNameSpace.profileDetail.getAndDisplay = function(){
    
    window.GetProfile.Variables.profileId = profileNameSpace.profileID ;
    window.GetProfile.Variables.myprofileid = loginNameSpace.loggedUserID ;
    window.GetProfile.DataUpdatedEvent = function(){ 
        if (window.GetProfile.JsonObject.ErrorCode === 0) {
        	profileNameSpace.profileDetail.display(window.GetProfile.JsonObject);
        }
    }
    window.GetProfile.Execute( window.FeedManager ) ;
}

profileNameSpace.profileDetail.display = function( data ){
    
    data.Data[0].isThisUser = data.Data[0].profileId == loginNameSpace.loggedUserID ? true : false ;
    if( data.Data[0].isThisUser == true ){ $('#profileByIdView-myProfileCustomHeader').show(); }
    data.Data[0].isNotThisUser = !data.Data[0].isThisUser  ;

    // set title
    customNamespace.header.changeTitle( { text : data.Data[0].profileHandle } );

    data.Data[0].customIsFollowing = data.Data[0].isFollowing == 1 ? true : false ;

    customNamespace.display.html( data.Data[0] ,  'profileByIdView-profileInfo-AvatarPhoto-template' , 'profileByIdView-profileInfo-AvatarPhoto-display' ) ;

    customNamespace.display.html( data.Data[0] ,  'profileByIdView-profileInfo-FollowButton-template' , 'profileByIdView-profileInfo-FollowButton-display' ) ;

    $('#profileByIdView-profileInfo-Detail-profileHandle-display').html( data.Data[0].profileHandle  );
    $('#profileByIdView-profileInfo-Detail-profileName-display').html( data.Data[0].profileFullName  );
    $('#profileByIdView-profileInfo-Detail-location-display').html( 'Houston, TX' );
    $('#profileByIdView-profileInfo-Detail-desc-display').html( data.Data[0].profileDescription  );

}

profileNameSpace.profileDetail.getHypeRank = function( data ){
    window.GetProfileHypeRank.Variables.profileId = profileNameSpace.profileID ;
    window.GetProfileHypeRank.Variables.myprofileid = loginNameSpace.loggedUserID ;
    window.GetProfileHypeRank.DataUpdatedEvent = function(){ 
        if (window.GetProfileHypeRank.JsonObject.ErrorCode === 0) {
    		$('#profileByIdView-profileInfo-Detail-hypeRank-display').html( window.GetProfileHypeRank.JsonObject.Data[0].reactions );
        }
    }
    window.GetProfileHypeRank.Execute( window.FeedManager ) ;
}
    
profileNameSpace.profileStatistic = profileNameSpace.profileStatistic || {};
profileNameSpace.profileStatistic.getAndDisplay = function(){
    
    window.GetFanListAUserFollowing.Variables.profileId = profileNameSpace.profileID ;
    window.GetFanListAUserFollowing.DataUpdatedEvent = function(){ 
        if (window.GetFanListAUserFollowing.JsonObject.ErrorCode === 0) {
        	var data = window.GetFanListAUserFollowing.JsonObject ;
    		$('#profileByIdView-profileInfo-Detail-fansOf-display').html( data.Data.length );
        }
    }
    window.GetFanListAUserFollowing.Execute( window.FeedManager ) ;
    
    window.GetFanListFollowingAUser.Variables.profileId = profileNameSpace.profileID ;
    window.GetFanListFollowingAUser.DataUpdatedEvent = function(){ 
        if (window.GetFanListFollowingAUser.JsonObject.ErrorCode === 0) {

        	var data = window.GetFanListFollowingAUser.JsonObject ;
    		$('#profileByIdView-profileInfo-Detail-fans-display').html( data.Data.length  );
        }
    }
    window.GetFanListFollowingAUser.Execute( window.FeedManager ) ;
}


profileNameSpace.profileTeam = profileNameSpace.profileTeam || {};
profileNameSpace.profileTeam.getAndDisplay = function(){
    
    window.GetTeamAUserFollowing.Variables.profileId = profileNameSpace.profileID ;
    window.GetTeamAUserFollowing.DataUpdatedEvent = function(){ 
        if (window.GetTeamAUserFollowing.JsonObject.ErrorCode === 0) {
        	var data = window.GetTeamAUserFollowing.JsonObject ;
            $.each( data.Data , function( index , element){
				element.teamIcon = domainNameSpace.name + element.teamIcon ;
                element.showTeam = index < 6 ? true : false ;
                data.Data[index] = element ;
            });
            //console.log( data );
            data.teamNumberOverMax = data.Count > 5 ? true : false ;
			try{
                customNamespace.display.html( data ,  'profileByIdView-profileInfo-followTeamList-template' , 'profileByIdView-profileInfo-followTeamList-display' ) ;
            } catch(err){}
            			
            try{
            	customNamespace.display.html( data ,  'Profile_Edit-followTeamList-template' , 'Profile_Edit-followTeamList-display' ) ;
            } catch(err){}

        }
    }
    window.GetTeamAUserFollowing.Execute( window.FeedManager ) ;
}


profileNameSpace.edit = {};
profileNameSpace.edit.var = {};
profileNameSpace.edit.var.temp = {};
profileNameSpace.edit.getInfo = function( data, onSuccess , onFail ){
        
    window.GetProfile.Variables.profileId = profileNameSpace.profileID ;
    window.GetProfile.DataUpdatedEvent = function( data ){ 
        if (window.GetProfile.JsonObject.ErrorCode === 0) {
        	onSuccess( $.extend(true, {}, window.GetProfile.JsonObject ) )	
        } else {
        	onFail( data )	
        }
    }
    window.GetProfile.Execute( window.FeedManager ) ;
    
};

