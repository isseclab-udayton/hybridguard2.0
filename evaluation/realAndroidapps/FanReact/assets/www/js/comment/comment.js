var commentNameSpace = {

    isStarted: false,
    postId: null,
    postToFlag:null,
    commentIdToDelete: null,
    
    // post info
    postTitle: null,
    postDescription: null,
    postDescription: null,
    postVideoLink: null,
    postImageLink: null,
    tagName: null,
    getting:false,

    flagMessage: function (postId, profileId, reason) {
        var chosenUrl = domainNameSpace.name + "?alttemplate=JsonFeedReportPost&postId=" + postId + "&profileId=" +profileId + "&reason=" +reason;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
           location.hash = "../dashboard/reactionsView.html";
        }).fail(function () {
            console.log("Fail");
        });
    }
                                            
                                               
};

//////////////////////////////////////// begin edit functions /////////////////////////////////////

commentNameSpace.deletePost = function(clickedButton){
    
    var warning = $(clickedButton).text();
    if ( $(clickedButton).html().search('Yes, delete this') == -1 ){
        $(clickedButton).find( "span" ).css( 'background-color', 'red' );
        $(clickedButton).find( ".ui-btn-text" ).text('Yes, delete this');
        return false;
    } 

    $(clickedButton).html('<i class="fa fa-spinner fa-spin" style="opacity:.3; "></i>');
    
    if( $(clickedButton).hasClass( 'Id-done') == true ){ return false ; }
    $(clickedButton).addClass( 'Id-done');
    
    var postId = commentNameSpace.postId ;
    
    var chosenUrl = domainNameSpace.name + "?alttemplate=JsonFeedDeletePost&postId=" + postId ;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {
       location.hash = "../dashboard/reactionsView.html";
    }).fail(function () {
        console.log("Fail");
    });
}

commentNameSpace.editPost = function(  ){
    
    // spinner
    $('#loadingSpinner').show();
    
    var postId = commentNameSpace.postId ;
    var chosenUrl = domainNameSpace.name + "?alttemplate=JsonFeedGetPost&postid=" + postId;
    //console.log(chosenUrl);
    
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {
        
        $('#topostView').trigger('click') ;
        
        // spinner
        $('#loadingSpinner').hide();
        
        var Data = data.Data[0] ;
        
        postNameSpace.queue.var.object.loggedUserID = Data.profileId ;
        postNameSpace.queue.var.object.postId = Data.postId ;
        postNameSpace.queue.var.object.postDesc = Data.postDescription ;
        postNameSpace.queue.var.object.postTitle = Data.postTitle ;
        postNameSpace.queue.var.object.submitType = 3
        postNameSpace.queue.var.object.submitTypeDesc = 'Edit Post' ;
        postNameSpace.queue.var.object.team = {};
        postNameSpace.queue.var.object.team.teamName = Data.PostedIn ;
        postNameSpace.queue.var.object.team.teamId = null ;
        postNameSpace.queue.var.object.videoLink = Data.postVideoLink ;
        postNameSpace.queue.var.object.imageLink  = Data.postImageLink ;
        
        customNamespace.page.goTo('views/post/postView.html');
        
       
    }).fail(function () {
        console.log("Fail");
    });
}

commentNameSpace.deleteComment = function( data , onSuccess , onFail ){
    var commentId = commentNameSpace.commentIdToDelete ;
    
    var chosenUrl = domainNameSpace.name + "?alttemplate=JsonFeedDeleteComment&commentId=" + commentId ;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {
       $('#comment-view-commentId' + commentId ).hide();
    }).fail(function () {
        console.log("Fail");
    });
}

//////////////////////////////// end edit functions //////////////////////////////////////

//////////////////////////////// begin custom linkify /////////////////////////////////////////

commentNameSpace.linkify = function (input) {

    var targetName = input;
    //$(".postDescription").linkify({ target: '', });
    //$('.postDescription').children().each(function () {
    $(targetName).linkify({ target: '', });
    $(targetName).children().each(function () {
    
        //return false;
        var link = $(this).attr('href');
        var html = $(this).html().split('/');
        var filtered = "";
        $.each(html, function (index, value) {
            if (index == 0) {
                value = value.replace("https:", "");
                value = value.replace("http:", "");
            }
            value = value.replace("www.",'');

            filtered += value;
            if (index == 2) { return false; }

        });
        $(this).html(filtered);
        //$(this).html($(this).html());

        //$(this).attr('onclick',"window.open('"+link+"' '', '_system');");
        var s = input.toUpperCase();
        $(this).attr('onclick', "window.open('" + link + "', '_blank', 'location=yes')");
        $(this).attr("href", "#");
        
    });

    $(targetName).html( commentNameSpace.tag.filterPossibleTagAsLink( { text : $(targetName).html() } ) );

}

//////////////////////////////// end custom linkify //////////////////////////////////////

commentNameSpace.var = {};
commentNameSpace.var.comment = {};
commentNameSpace.var.comment.displayed = [];
commentNameSpace.var.comment.firstGet = null;
commentNameSpace.var.comment.modify = function(name,value){
    commentNameSpace.var.comment[name] = value;
};

commentNameSpace.postDetail = {};
commentNameSpace.postDetail.getAndDisplay = function(){
    
    window.GetPostDetail.Variables.postid = commentNameSpace.postId ;
    window.GetPostDetail.Variables.profileId  = loginNameSpace.loggedUserID ;
    window.GetPostDetail.DataUpdatedEvent = function(){ 
        if (window.GetPostDetail.JsonObject.ErrorCode === 0) {
        	commentNameSpace.postDetail.display(window.GetPostDetail.JsonObject);
        }
    }
    window.GetPostDetail.DataUpdatedEventOnFail = function(){ 
        $.each( window.GetReactionPosts.JsonObject.Data , function( index, element ){
           if( element.postId == commentNameSpace.postId  ){
        		commentNameSpace.postDetail.display( { Data : [ element ] } );
           }
        });
    }
    window.GetPostDetail.Execute( window.FeedManager ) ;
}

commentNameSpace.postDetail.display = function( data ){

    
    var element =  $.extend( true , [] , data.Data[0] ) ; 
    
    //replace empty avatar
    element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;
    element.formattedPostCreateDate = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
    element.formattedPostTitle = commentNameSpace.tag.filterPossibleTagAsLink( { text : element.postTitle } );
    element.formattedPostDescription = element.postDescription ;
    element.loggedUserID = loginNameSpace.loggedUserID ;
    element.editable = loginNameSpace.loggedUserID == element.profileId && navigator.connection.type != 'none' ? true : false ;

    //console.log( element );
    customNamespace.display.html( element ,  'comment-view-postDetailHead-template'  ,  'comment-view-postDetailHead-display' ) ;
    customNamespace.display.html( element ,  'comment-view-postDetailBody-template'  ,  'comment-view-postDetailBody-display'  ) ;
    customNamespace.display.html( element ,  'comment-view-postDetailCommentPart-template' ,  'comment-view-postDetailCommentPart-display'  ) ;
    customNamespace.display.html( element ,  'comment-view-videoHolder-template' ,  'comment-view-videoHolder-display'  ) ;

    commentNameSpace.linkify('#comment-view-postDetailHead-description');
    
    
    ContentActive.imgCache.cacheAllAtOnce();
}


commentNameSpace.comment = {};
commentNameSpace.comment.var = {};
commentNameSpace.comment.var.lastIdOfCurrentFeed = 0 ;
commentNameSpace.comment.getAndDisplay = function( data, onSuccess, onFail ){
    
    window.GetComments.Variables.postId = commentNameSpace.postId ;
    window.GetComments.Variables.profileId = loginNameSpace.loggedUserID ;
    window.GetComments.Variables.skip = 0 ;
    window.GetComments.DataUpdatedEvent = function(){ 
        if (window.GetComments.JsonObject.ErrorCode === 0) {
    		if( window.GetComments.JsonObject.Data[0] != undefined ){ $('#comment-view-postCommentFeed-display').fadeIn(); }
    		$('#comment-view-postCommentFeed-display').empty();
        	commentNameSpace.comment.display(window.GetComments.JsonObject );
        }
    }
    window.GetComments.Execute( window.FeedManager ) ;
}

commentNameSpace.comment.getMore = function( data, onSuccess, onFail ){
    
    if( commentNameSpace.comment.var.lastIdOfCurrentFeed == 0 ){ return false; }
    window.GetComments.Variables.postId = commentNameSpace.postId ;
    window.GetComments.Variables.profileId = loginNameSpace.loggedUserID ;
    window.GetComments.Variables.skip = commentNameSpace.comment.var.lastIdOfCurrentFeed ;
    commentNameSpace.comment.var.lastIdOfCurrentFeed = 0 ;
    window.GetComments.DataUpdatedEvent = function(){ 
        if (window.GetComments.JsonObject.ErrorCode === 0) {
        	commentNameSpace.comment.display(window.GetComments.JsonObject );
        }
    }
    window.GetComments.Execute( window.FeedManager ) ;
}

commentNameSpace.comment.display = function( data ,  onSuccess, onFail ){
        
    $.each( data.Data , function( index , element ){
		
        element.profilePhoto = element.profilePhoto == '' ? '../../images/default-avatar.png' : element.profilePhoto ;
        element.formattedCommentDescription = customNamespace.commentImg( element.commentDescription ) ;
        element.formatedCommentCreateDate = customNamespace.format.dateAsDuration( element.commentCreateDate ) ;
        
		data.Data[ index ] = element ;
    }); 

    commentNameSpace.getting = false;
    
    if ((data.Data.length - 1)>0){
        //This throws an uncaught exception if the array position is below zero KLM
        commentNameSpace.comment.var.lastIdOfCurrentFeed = data.Data[ data.Data.length - 1 ].RowNumber;
    }
	    
    //console.log( data )
    var html = customNamespace.display.html( data ,  'comment-view-postCommentFeed-template'  ) ;
    $("#comment-view-postCommentFeed-display").append( html );
    

    $.each( data.Data , function( index , element ){

        if ( element.formattedCommentDescription.toUpperCase().indexOf("<IMG") <= -1){
            commentNameSpace.linkify('#comment-view-commentDescriptionSpan' + element.commentId );
        }

        if ( element.profileId == loginNameSpace.loggedUserID  ) {

            $('#comment-view-commentId' + element.commentId ).unbind('taphold' )
            $('#comment-view-commentId' + element.commentId ).bind('taphold', function(){

                var id = $(this).attr('id').replace('comment-view-commentId','' ) ;
                commentNameSpace.commentIdToDelete = id ;
                console.log(id);
                $('#comment-view-editCommentPopup').popup('open') ;
            });
        }
    }); 


}


commentNameSpace.tag = {};
commentNameSpace.tag.goTo = function( data ,  onSuccess, onFail ){
        
    
    window.GetProfileByName.Variables = data ;
    window.GetProfileByName.DataUpdatedEvent = function(){ 
        if (window.GetProfileByName.JsonObject.Count == 1 ) {
        	onSuccess( window.GetProfileByName.JsonObject );
        }
    }

    window.GetProfileByName.Execute( window.FeedManager ) ;
}

commentNameSpace.tag.filterPossibleTagAsLink = function( data ,  onSuccess, onFail ){
        
	var keywordList = [];
    // { text : 'string' } // data
	$.each( data.text.split('@') , function( index, element ){
        var end = element.search(' ') == -1 ? element.length :  element.search(' ') ;
        var keyword = element.substring( 0 , end );
        var re = /^[a-zA-Z0-9_]+$/; 
        keyword  != '' && re.test( keyword ) == true ? keywordList.push( keyword ) : null ;
   });

    $.each( keywordList , function( index, element ){
    	var linkified = customNamespace.display.html( { text : element } , 'reaction-view-profileHandleTag-template' );
    	data.text = data.text.replace( '@' + element , linkified  );
    });

    return data.text ;
}