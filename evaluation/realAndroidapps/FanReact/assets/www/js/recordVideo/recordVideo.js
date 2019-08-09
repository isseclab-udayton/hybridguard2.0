var recordVideoNameSpace = recordVideoNameSpace || {};

recordVideoNameSpace.VideoName = "";
recordVideoNameSpace.FullPath = "";

AWS.config.update({accessKeyId: 'AKIAI7XI6PMABTZQO47A', secretAccessKey: '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'});
AWS.config.region = 'us-west-2';

recordVideoNameSpace.elasticTranscoder = new AWS.ElasticTranscoder();

recordVideoNameSpace.CaptureVideo = function ()
{

    var that = this;
    navigator.device.capture.captureVideo(function () {
        that.CaptureSuccess.apply(that, arguments);
    }, function () {
        recordVideoNameSpace.CaptureError.apply(that, arguments);
    }, { 
        limit: 1,
        //duration: 30,
      });
}

recordVideoNameSpace.CaptureSuccess = function(capturedFiles) 
{
    
    for (var i=0;i < capturedFiles.length;i+=1)
    { 
        var videoSize = capturedFiles[i].size ;
        //if( videoSize > 70000000 ){
        //    alert("Sorry, video size is larger than 70 MB. This video is currently not supported.")
        //    return false;
        //}
        
        var VideoName = capturedFiles[i].name;
        var FullPath = capturedFiles[i].fullPath;
        window.LibraryHelper.saveVideoToLibrary(null, null, FullPath , 'Fanreact');

        recordVideoNameSpace.helper.var.stack[ recordVideoNameSpace.helper.var.currentUid  ].callback( capturedFiles[i] ) ;
        
        //////////////THIS IS WHERE YOU UPLOAD//////////////////
        
        //that.CreateTranscodeJob('NAME_OF_FILE');
        //OUTPUT WILL ALWAYS BE: https://s3-us-west-2.amazonaws.com/fanreact-rtmp-video-stream/NAME_OF_FILE.mp4
        //OUTPUT THUMBNAIL WILL ALWAYS BE: https://s3-us-west-2.amazonaws.com/fanreact-video-thumbnails/NAME_OF_FILE-00001.jpg
        //this.UploadVideo("TaiTest", alert("yes"), alert('no'));
        /////////////////////////////////////////////////////////
    
    }
    
}



recordVideoNameSpace.UploadVideo = function( outputObject, successFunction, failFunction , onProgress )
{    

    var videoName = outputObject.videoName ;
    var extension = videoName.substring( videoName.lastIndexOf('.') + 1, videoName.length);
    extension = extension.length > 5 ? 'mp4' : extension ;
    var mimeType = 'video/mp4';

    //this is to preserve the extensionof the file being uploaded (mov, or mp4) so we can point to it with the transcoder
    recordVideoNameSpace.S3UploadedFilename = videoName + '.' + extension;
    
    if(extension.toLowerCase() == 'mov')
    {
        mimeType = 'video/quicktime';
    }
    
    if(videoName == undefined)
    {
        alert('video name can\'t not be undefined' );
    }
    
    
    recordVideoNameSpace.UploadAndTranscodeSuccess = successFunction;
    recordVideoNameSpace.UploadOrTranscodeFail = failFunction;

    function UploadSuccess()
    {
        //Our transcoder always outputs mp4
        recordVideoNameSpace.CreateTranscodeJob('uploads/' + recordVideoNameSpace.S3UploadedFilename, videoName + '.mp4');
    }
    
    function UploadFail( data )
    {
        if(recordVideoNameSpace.UploadOrTranscodeFail != undefined)
        {
            recordVideoNameSpace.UploadOrTranscodeFail( data );
        }
    }
    
   // alert(recordVideoNameSpace.VideoName + " and " + recordVideoNameSpace.FullPath )
   // alert(recordVideoNameSpace.S3UploadedFilename + ' ' + mimeType);
    
    var s3Uploader = new ContentActive.AWSHelper.S3Uploader('https://fanreactrawvideos.s3.amazonaws.com/', 'eyJleHBpcmF0aW9uIjoiMjAyMC0xMi0zMVQxMjowMDowMC4wMDBaIiwiY29uZGl0aW9ucyI6W3siYnVja2V0IjoiZmFucmVhY3RyYXd2aWRlb3MifSxbInN0YXJ0cy13aXRoIiwiJGtleSIsInVwbG9hZHMvIl0seyJhY2wiOiJwdWJsaWMtcmVhZCJ9LFsic3RhcnRzLXdpdGgiLCIkQ29udGVudC1UeXBlIiwiIl0sWyJjb250ZW50LWxlbmd0aC1yYW5nZSIsMCw1MjQyODgwMDBdXX0=', '11kl5cpholWbZbMVd5oWvwhtjAM=', 'AKIAITHQUI7AUOG7PZJA'); 
    return s3Uploader.Upload( outputObject.FullPath, recordVideoNameSpace.S3UploadedFilename, mimeType, UploadSuccess, UploadFail, onProgress );
}
    
recordVideoNameSpace.CaptureError = function (error)
{
}

recordVideoNameSpace.CreateTranscodeJob = function (filename, outputFilename)
{
    if(outputFilename == undefined)
    {
        outputFilename = filename;
    }
    var params = {
        Input: {
            Key: filename
        },
        PipelineId: '1410286179469-gjem8g',
        Output: {
            Key: outputFilename,
            PresetId: '1412188897407-zk63e4',
            ThumbnailPattern: outputFilename + '-{count}'
        }
    }
    
    this.elasticTranscoder.createJob(params, function(err,data)
    {
        if (err)
        {
            //alert(err.stack);
            if(recordVideoNameSpace.UploadOrTranscodeFail != undefined)
            {
                recordVideoNameSpace.UploadOrTranscodeFail();
            }
        }
        else 
        {
            if(recordVideoNameSpace.UploadAndTranscodeSuccess)
            {
                recordVideoNameSpace.UploadAndTranscodeSuccess();
            }
        } 
    })
}


recordVideoNameSpace.helper = {};
recordVideoNameSpace.helper.var = {};
recordVideoNameSpace.helper.var.stack = {} ;
recordVideoNameSpace.helper.var.currentUid = null;
recordVideoNameSpace.helper.capture = function( uid, callback){
    
	recordVideoNameSpace.helper.var.currentUid = uid;
    recordVideoNameSpace.helper.var.stack[ uid ] = { callback :  callback } ;
    
    recordVideoNameSpace.CaptureVideo();
}