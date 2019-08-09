var ContentActive = ContentActive || {};
ContentActive.AWSHelper = ContentActive.AWSHelper || {};

ContentActive.AWSHelper.S3Uploader = function(s3url, policy64, userSignature, key)
{
    this.S3URI = encodeURI(s3url);
    this.PolicyBase64 = policy64;
    this.Signature = userSignature;
    this.AwsKey = key;
    this.Acl = "public-read";
}

ContentActive.AWSHelper.S3Uploader.prototype.Upload = function(imageURI, fileName, customMimeType, successFunction, failFunction , onProgress )
{
    
    if ( navigator.connection.type == 'none') {
        console.log('in offline mod -> force stop the uploader to resume when connection is back.')
        return false;
    };
    
        var deferred = $.Deferred(),
            ft = new FileTransfer(),
            options = new FileUploadOptions();
        var mimeType = "image/jpeg";
        if(customMimeType != undefined)
        {
            mimeType = customMimeType;
        }

        options.fileKey = "file";
        options.fileName = fileName;
        options.mimeType = mimeType;
        options.chunkedMode = false;
        options.params = {
            "key": "uploads/" + fileName,
            "AWSAccessKeyId": this.AwsKey,
            "acl": this.Acl,
            "policy": this.PolicyBase64,
            "signature": this.Signature,
            "Content-Type": mimeType
        };

    	if( onProgress != undefined )
            ft.onprogress = onProgress ;
    
        ft.upload(imageURI, this.S3URI,
            function (e) {
                if(successFunction != undefined)
                {
                    successFunction(e);
                }
                deferred.resolve(e);
            },
            function (e) {
                if(failFunction != undefined)
                {
                    failFunction(e);
                }
                deferred.reject(e);
            }, options);

        deferred.promise();
        return ft;
        //return 'ft';
}