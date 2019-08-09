var postNameSpace = postNameSpace || {};

postNameSpace.globalImage = "" ; 

postNameSpace.track = {} ;
postNameSpace.goBackTo = "";
postNameSpace.returnPostId = "" ; 

// for uploading video in background
postNameSpace.tagName = "";
postNameSpace.tagId = "" ;
postNameSpace.imageLink =  "";
postNameSpace.videoLink =  "";
postNameSpace.videoThumbnail =  "";
postNameSpace.teamid = "";
postNameSpace.TeamIDTrack = "";
postNameSpace.postTitle = "";
postNameSpace.postDesc = "";
postNameSpace.postId = "";
postNameSpace.commentId = "";
postNameSpace.scheduleId = "";
postNameSpace.uploading = false;
postNameSpace.fileSize = 0;
postNameSpace.rotateImage = '';
postNameSpace.uploader = null;
postNameSpace.teamdropdownClicked = false;
postNameSpace.videoCaptureTriggered = false;

postNameSpace.submit = null ; // define on page; 
postNameSpace.initializeVariableOnPage = null ; // define on page; 

postNameSpace.helper = {};
postNameSpace.helper.clean = function( object ){

    
    var dataToSend = {};
    dataToSend.teamId = object.teamid;
    dataToSend.profileId = object.loggedUserID ;
    dataToSend.postTitle = object.postTitle;
    dataToSend.commentId = object.commentId;
    dataToSend.postDescription = object.postDesc;
    dataToSend.imageUrl =  ( object.videoThumbnail || '' ) + ( object.imageLink || '' )  ;  ;    
    dataToSend.videoUrl = object.videoLink;
    dataToSend.scheduleId = object.scheduleId ;
    
    dataToSend.commentDescription = object.postDesc;
    dataToSend.commentImageLink =  ( object.videoThumbnail || '' ) + ( object.imageLink || '' )  ;   ;    
    dataToSend.commentVideoLink = object.videoLink;
    dataToSend.postId = object.postId;
    
    for (var key in dataToSend) {
        dataToSend[key] = dataToSend[key] == undefined || dataToSend[key] == 'undefined' ? '' : dataToSend[key] ;
    }
    return dataToSend ;

}


postNameSpace.helper.clean = function( object ){

    
    for (var key in object) {
        object[key] = object[key] == undefined || object[key] == 'undefined' ? '' : object[key] ;
    }
    return object ;

}

postNameSpace.submitPost = function ( objectToSend , onSuccess , onFail ) {

    onFail == undefined ? console.log( 'onFail is undefined') : null ;
    var onLocalFailure = function( data ){
        objectToSend.ErrorMessage = data ;
        onFail( objectToSend ) ; 
    }
        
    var feedName = objectToSend.detail.feedName ;

    var originalData = objectToSend.detail ;
    var dataToSend = {};
    dataToSend.teamId = originalData.teamid;
    dataToSend.profileId = originalData.loggedUserID || originalData.profileId ;
    dataToSend.postTitle = originalData.postTitle;
    dataToSend.postDescription = originalData.postDesc;
    dataToSend.imageUrl =  ( originalData.videoThumbnail || '' ) + ( originalData.imageLink || '' )  ;  ;    
    dataToSend.videoUrl = originalData.videoLink;
    dataToSend.scheduleId = originalData.scheduleId ;
    
    dataToSend.commentDescription = originalData.postDesc;
    dataToSend.commentImageLink =  ( originalData.videoThumbnail || '' ) + ( originalData.imageLink || '' )  ;   ;    
    dataToSend.commentVideoLink = originalData.videoLink;
    dataToSend.postId = originalData.postId;
    dataToSend.commentId = originalData.commentId;
    
    var dataToSend = postNameSpace.helper.clean( dataToSend  ) ;
    
    var onLocalSuccess  = function( data ){ 
        if ( data.ErrorCode === 0) {
            objectToSend.SuccessResult = data ;
            onSuccess( objectToSend);

        } else {
            objectToSend.technicalError = data ;
            onLocalFailure( data  );
        }	
    }
    
    $.ajax({ url : window[feedName].URL , data : dataToSend , success : onLocalSuccess , error : onLocalFailure }); 
}

postNameSpace.submitPostFromInlineDefineFunction = function ( objectToSend , onSuccess , onFail  ) {
    
    onFail == undefined ? console.log( 'onFail is undefined') : null ;
    var onLocalFailure = function( data ){
        objectToSend.ErrorMessage = data.responseText ;
        onFail( objectToSend ) ; 
    }
        
    var feedName = objectToSend.detail.feedName ;

    var dataToSend = postNameSpace.helper.clean( objectToSend.detail  ) ;
    
    var onLocalSuccess  = function( data ){ 
        if ( data.ErrorCode === 0) {
            objectToSend.SuccessResult = data ;
            onSuccess( objectToSend);

        } else {
            onLocalFailure( objectToSend  );
        }	
    }
    
    $.ajax({ url : window[feedName].URL , data : dataToSend , success : onLocalSuccess , error : onLocalFailure }); 

}


////////////////////////////////// begin get file size /////////////////////////////////////////////

postNameSpace.checkFileSize = function( fileUrl, callback ) {
	
    // more info at https://github.com/cfjedimaster/Cordova-Examples/blob/master/getfiledata/www/js/app.js
    
    var fail = function(e) {
        console.log("FileSystem Error");
        console.dir(e);
    };
    
    var gotFile = function(fileEntry) {

        fileEntry.file(function(file) {
            var s = "";
            s += "<b>name:</b> " + file.name + "<br/>";
            s += "<b>localURL:</b> " + file.localURL + "<br/>";
            s += "<b>type:</b> " + file.type + "<br/>";
            s += "<b>lastModifiedDate:</b> " + (new Date(file.lastModifiedDate)) + "<br/>";
            s += "<b>size:</b> " + file.size + "<br/>";
            
            
            callback(file)            
        });
    };
    
	//This alias is a read-only pointer to the app itself
	window.resolveLocalFileSystemURL( fileUrl , gotFile, fail);
}

postNameSpace.queue = {};
postNameSpace.queue.var = {};
postNameSpace.queue.var.object = {};
postNameSpace.queue.var.temp = {};
postNameSpace.queue.var.tempDataHolder = {};
postNameSpace.queue.var.status = {};
postNameSpace.queue.var.running = false ;
postNameSpace.queue.var.uploadTimeCount = 0;
postNameSpace.queue.var.previousConnectionType = 0;
postNameSpace.queue.var.previousUploadingNumber = null ;
postNameSpace.queue.add = function ( object ) {
        
    var model_name = 'SavePostQueue' ;
    window[model_name].JsonObject.Data.push( { ErrorCode : 3 , status : 'waiting to be uploaded' , detail : object } ) ;
    window.FeedManager.CacheFeed( window[model_name] );   
        
    // after adding object to queue, renew object and display change on page
    postNameSpace.post.clearForm( object );
    
}
postNameSpace.queue.simpleAdd = function ( object ) {
    window.SavePostQueue.JsonObject.Data.push( { ErrorCode : 3 , status : 'waiting to be uploaded' , detail : object } ) ;
    window.FeedManager.CacheFeed( window.SavePostQueue );   
}

postNameSpace.queue.upload = function( data, onSuccess , onFail ){
            //console.log( data );

	var localSuccess = function( localData , onSuccess , onFail  ){
        //console.log( localData );

        // submit post
        localData.detail.feedName = localData.detail.submitType == 1 ? 'SubmitPost' : localData.detail.feedName ;
        // post to game center
        localData.detail.feedName = localData.detail.submitType == 2 ? 'SubmitPostToGameCenter' : localData.detail.feedName ;
        // edit post
        localData.detail.feedName = localData.detail.submitType == 3 ? 'UpdatePost' : localData.detail.feedName ;
        // post to team 
        localData.detail.feedName = localData.detail.submitType == 4 ? 'SubmitPost' : localData.detail.feedName ;
        // comment
        localData.detail.feedName = localData.detail.submitType == 5 ? 'SubmitComment' : localData.detail.feedName ;
        // voting
        localData.detail.feedName = localData.detail.submitType == 6 ? 'InsertOrUpdateVote' : localData.detail.feedName ;
        // submit post from inline defined detail
        localData.detail.feedName = localData.detail.submitType == 7 ? 'SubmitPost' : localData.detail.feedName ;
        
        postNameSpace.submitPost( localData , postNameSpace.queue.executeUploadOnSuccess, postNameSpace.queue.executeUploadOnFail  );       
    }
        
    if( data.detail.inputVideoUrl != undefined &&  data.detail.inputVideoUrl != '' ){
        postNameSpace.queue.customUpload.video( data , localSuccess )
	} else if ( data.detail.inputImageUrl != undefined &&  data.detail.inputImageUrl != '' ){
        postNameSpace.queue.customUpload.image( data , localSuccess )
    } else {
    	localSuccess( data ) ;
    }
        
} 



postNameSpace.queue.executeUploadOnSuccess = function( data ){
    if( data.index == undefined ){ console.log( 'data.index is undefined ' ); return false ;}
    var model_name = 'SavePostQueue' ;
    window[model_name].JsonObject.Data[ data.index ].status = 'uploaded';
    window[model_name].JsonObject.Data[ data.index ].ErrorCode = 0 ;
    window[model_name].JsonObject.Data[ data.index ].SuccessResult = data.SuccessResult ;
    if( data.detail.onSuccess != undefined ){ data.detail.onSuccess() }
    window.FeedManager.CacheFeed( window[model_name] );   
};

postNameSpace.queue.executeUploadOnFail = function( data ){
    if( data.index == undefined ){ console.log('data.index is undefined '); return false ;}
    var model_name = 'SavePostQueue' ;
    window[model_name].JsonObject.Data[ data.index ].status = 'upload failed';
    window[model_name].JsonObject.Data[ data.index ].ErrorCode = data.technicalError == undefined ? 4 : 2 ;
    window[model_name].JsonObject.Data[ data.index ].ErrorMessage = data.ErrorMessage ;
        
    if( data.detail.onFail != undefined ){ data.detail.onFail() }
    window.FeedManager.CacheFeed( window[model_name] );   

};

postNameSpace.queue.executeUpload = function ( object ) {
    
    
    var reinitializeQueue = function(){
        window.SavePostQueue.JsonObject.Data = window.SavePostQueue.JsonObject.Data || []  ;
        $.each( window.SavePostQueue.JsonObject.Data , function( index , element ){
            if( element.ErrorCode == 1 && element.ErrorCode == 4 ){
            	window.SavePostQueue.JsonObject.Data[index].ErrorCode = 3 ;
            	window.SavePostQueue.JsonObject.Data[index].ErrorMessage = 'reset for upload' ;
            }
        });
    }
    reinitializeQueue();
    
    var stopUpload = function(){
        //var isUploading = false ; 
        //$.each( window.SavePostQueue.JsonObject.Data , function( index , element ){
        //    if( element.ErrorCode == 1 ){
        //        isUploading = true ;
        //        return false ;
        //    }
        //});
        //return isUploading ;
    }
    
     var executeUpload = function(){
         
        $.each( window.SavePostQueue.JsonObject.Data , function( index , element ){
            if( stopUpload() == true ){ return false; }
            var errorCode = element.ErrorCode ;
            if( element.ErrorCode == 3 ){
                window.SavePostQueue.JsonObject.Data[ index ].status = 'uploading' ;
                window.SavePostQueue.JsonObject.Data[ index ].index = index ;
                window.SavePostQueue.JsonObject.Data[ index ].attempt = ( window.SavePostQueue.JsonObject.Data[ index ].attempt || 0 ) + 1 ;
                window.SavePostQueue.JsonObject.Data[ index ].ErrorCode = 1 ;
                postNameSpace.queue.upload( window.SavePostQueue.JsonObject.Data[ index ] )
            	return false ;
            }
        });       
    } 
    
    var checkConnectionAndReinitialize = function()
	{
        var previousConnection = postNameSpace.queue.var.previousConnectionType ;
        var currentConnection  = ( navigator.connection || {} ).type;
        
        
        postNameSpace.queue.var.previousConnectionType = currentConnection ;
        
        postNameSpace.queue.displayQueueInfo();
        if( previousConnection == 'none' && currentConnection != 'none' )
        {
            clearInterval( postNameSpace.queue.executeUploadInterval );
    		reinitializeQueue();
            postNameSpace.queue.executeUploadInterval = setInterval( function(){ executeUpload() }, 500);
		}        
	}
    postNameSpace.queue.executeUploadInterval = setInterval( function(){ executeUpload() }, 500);

    setInterval( function(){ checkConnectionAndReinitialize() }, 1000);
}

$( document ).ready( function(){ postNameSpace.queue.executeUpload() });


postNameSpace.queue.customUpload = {}

postNameSpace.queue.customUpload.video = function ( object, onSuccess , onFail ) {
    
    postNameSpace.uploading = true ;
    
    var dt = new Date();
    var time = dt.getYear() + "_" + dt.getMonth() + "_"  +  dt.getDay() + "_"  + dt.getHours() + "_"  + dt.getMinutes() + "_"  + dt.getSeconds();
    var videoName = object.detail.loggedUserID + "_" + time;
    var videoData = { videoName : videoName , FullPath : object.detail.inputVideoUrl } ;
    
    var localSucess = function(){
        
        var videoLInk = domainNameSpace.s3AmazonVideoLink + videoName + '.mp4' ; 
        var videoThumbnail = domainNameSpace.s3AmazonVideoThumbnail + videoName + '.mp4-00001.jpg' ; 

        object.detail.videoLink =  videoLInk;
        object.detail.videoThumbnail = videoThumbnail ;
        
        setTimeout( function(){ 
            postNameSpace.uploading = false;
            onSuccess( object );
        }, 10000);
    }
    
    var localFail = function( data ){
                
        postNameSpace.uploading = false;
        
        object.ErrorMessage = data.code == 4 ? 'Video Uploader Time Out!' : 'Video Uploader Failed!' ;
        postNameSpace.queue.executeUploadOnFail( object );
    }
    
    var onProgress = function(progressEvent) {
		if (progressEvent.lengthComputable) {
			var perc = Math.floor(progressEvent.loaded / progressEvent.total * 100);
            object.progress = perc ;
		} 
	};

        
    var uploader = recordVideoNameSpace.UploadVideo(videoData, localSucess, localFail , onProgress );
	postNameSpace.uploader.track(uploader);
    
    setTimeout( function(){ uploader.abort(); }, 300*1*1000);    
}


postNameSpace.queue.customUpload.image = function ( object, onSuccess , onFail ) {
    
    var dt = new Date();
    var time = dt.getYear() + "_" + dt.getMonth() + "_"  +  dt.getDay() + "_"  + dt.getHours() + "_"  + dt.getMinutes() + "_"  + dt.getSeconds();
    var name = object.detail.loggedUserID + '_' + time;
        
    //Make this Unique Filename
    var imageName = object.detail.inputImageUrl ;
    var extension = imageName.substring( imageName.lastIndexOf('.') + 1, imageName.length);
    extension = extension.length > 10 ? 'jpg' : extension ;
    var mimeType = 'image/' + extension;
        
    imageName = name + "." + extension ;
        
    var localSucess = function(){
        object.detail.imageLink =  'https://fanreactrawvideos.s3.amazonaws.com/uploads/' + imageName ;
        onSuccess( object );
    }
    
    var localFail = function(e){
                        
        object.ErrorMessage = 'Image Uploader Failed!' ;
        if( object.detail.submitType != undefined ){
           postNameSpace.queue.executeUploadOnFail( object ); 
        } 
        else if( object.detail.submitType == undefined ){
           onFail( object ); 
        } 
    }    
        
    //retrieve the image https://fanreactimages.s3.amazonaws.com/uploads/your filename.jpg
    var s3Uploader = new ContentActive.AWSHelper.S3Uploader('https://fanreactrawvideos.s3.amazonaws.com/', 'eyJleHBpcmF0aW9uIjoiMjAyMC0xMi0zMVQxMjowMDowMC4wMDBaIiwiY29uZGl0aW9ucyI6W3siYnVja2V0IjoiZmFucmVhY3RyYXd2aWRlb3MifSxbInN0YXJ0cy13aXRoIiwiJGtleSIsInVwbG9hZHMvIl0seyJhY2wiOiJwdWJsaWMtcmVhZCJ9LFsic3RhcnRzLXdpdGgiLCIkQ29udGVudC1UeXBlIiwiIl0sWyJjb250ZW50LWxlbmd0aC1yYW5nZSIsMCw1MjQyODgwMDBdXX0=', '11kl5cpholWbZbMVd5oWvwhtjAM=', 'AKIAITHQUI7AUOG7PZJA'); 

    return s3Uploader.Upload( object.detail.inputImageUrl , imageName, mimeType, localSucess, localFail);
                                                             

     
}



postNameSpace.queue.displayQueueInfo = function ( object, onSuccess , onFail ) {

    var readyToUploadNumber = 0 ;
    $.each( window.SavePostQueue.JsonObject.Data , function( index, element ){

        readyToUploadNumber += ( element.ErrorCode == 3 || element.ErrorCode == 1 ) && element.detail.submitType != 99
            					? 1 : 0;

    });
    var readyToUploadNumberPlural = readyToUploadNumber > 1 ? true : false ;
    var html = readyToUploadNumber != 0 ? customNamespace.display.html( { readyToUploadNumber : readyToUploadNumber , readyToUploadNumberPlural : readyToUploadNumberPlural } , 'index-queueInfo-template' ) : '' ;
    postNameSpace.queue.var.previousUploadingNumber != readyToUploadNumber ? $('#index-queueInfo-display').html( html ) : null ;
    postNameSpace.queue.var.previousUploadingNumber = readyToUploadNumber ;
}

postNameSpace.post = {};
postNameSpace.post.create = function( ){

    var id = $.mobile.activePage.attr('id');
    if( id == 'gameCenterView' ){
        postNameSpace.queue.var.object.submitType = 2 ;
        postNameSpace.queue.var.object.submitTypeDesc = 'Post to Game Center' ;
        postNameSpace.queue.var.object.scheduleId = gamecenterNameSpace.scheduleId;        
        postNameSpace.queue.var.object.team = { teamId : '' , teamName : ' ' } ;

    }
    else if( id == 'team-page' ){
        postNameSpace.queue.var.object.submitType = 4 ;
        postNameSpace.queue.var.object.submitTypeDesc = 'Create A New Post For a Team Board' ;
        postNameSpace.queue.var.object.teamid = teampageNameSpace.teamId ;  
        postNameSpace.queue.var.object.team = { teamId : teampageNameSpace.teamId , teamName : teampageNameSpace.feedForSingleTeam.Data[0].teamName } ;

    }
    else {
        postNameSpace.queue.var.object.submitType = 1 ;
        postNameSpace.queue.var.object.submitTypeDesc = 'Create A New Post' ;
    }

}

postNameSpace.post.clearImageAndVideo = function( ){

     // clear all video and image link before assigning new uri
    postNameSpace.queue.var.object.inputImageUrl = '' ;
    postNameSpace.queue.var.object.imageLink = '' ;
    postNameSpace.queue.var.object.inputVideoUrl = '' ;
    postNameSpace.queue.var.object.videoLink = '' ;    
    $('#post-view-attachFile-display').empty();

}

postNameSpace.post.clearForm = function ( data, onSuccess, onFail ) {
       
    data = data == undefined ? postNameSpace.queue.var.object : data ;
    // after adding object to queue, renew object and display change on page
    postNameSpace.queue.var.object = { submitType : data.submitType , submitTypeDesc : data.submitTypeDesc } ;
    $('#post-view-attachFile-display').empty();
    postNameSpace.initializeVariableOnPage();
    
}
