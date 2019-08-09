var cameraNamespace = {};

cameraNamespace.var = {};
cameraNamespace.var._pictureSource = 2 ;
cameraNamespace.var._destinationType = 1 ;
cameraNamespace.var.CorrectOrientation = true;
cameraNamespace.var.resolution = 50 ;
cameraNamespace.var.modify = function(name,value){
    cameraNamespace.var[name] = value ;
} ;
    
cameraNamespace._capturePhoto = function() {
    var that = cameraNamespace;
    
    navigator.camera.getPicture(function(){
        that._onPhotoURICaptureSuccess.apply(that,arguments);
    },function(){
        that._onFail.apply(that,arguments);
    },{
        quality: that.var.resolution,
        destinationType: that.var._destinationType.FILE_URI,
        correctOrientation: that.var.CorrectOrientation,
        saveToPhotoAlbum: true

    });
    
}

cameraNamespace._getVideoFromLibrary = function() {
    var that = cameraNamespace;

    navigator.camera.getPicture(function(){
        that._onVideoURICaptureSuccess.apply(that,arguments);
    },function(){
        that._onVideoFail.apply(that,arguments);
    },{
        quality: that.var.resolution,
        destinationType: that._destinationType.FILE_URI,           
        sourceType: 2,
        mediaType:1
    });       
}
    
cameraNamespace._onVideoURICaptureSuccess = function (uri){
    cameraNamespace.image.var.stack[ cameraNamespace.image.var.currentUid  ].callback( uri ) ;
}
    
cameraNamespace._onVideoFail = function(){
     customNamespace.console('video not worked')
}
    
cameraNamespace._getPhotoFromLibrary =  function() {
    var that= cameraNamespace;
    that._getPhoto(that._pictureSource.PHOTOLIBRARY   );         
}
    
cameraNamespace._getPhotoFromAlbum = function() {
    
    var that= cameraNamespace;
    that._getPhoto(that._pictureSource.SAVEDPHOTOALBUM)
}
    
    
cameraNamespace._getPhoto = function(source) {
    var that = cameraNamespace;

    // Retrieve image file location from specified source.
    navigator.camera.getPicture(function(){
        that._onPhotoURICaptureSuccess.apply(that,arguments);
    },function(){
        that._onFail.apply(that,arguments);
    },{
        quality: that.var.resolution,
        destinationType: that._destinationType.FILE_URI,
        sourceType: source,
        correctOrientation: true
    });
}
    
        

cameraNamespace._onPhotoURISuccess = function (imageUri) {
    // this is not used
}
    

cameraNamespace._onPhotoURICaptureSuccess= function (uri) {
    
    cameraNamespace.image.var.stack[ cameraNamespace.image.var.currentUid  ].callback( uri ) ;
        
}

cameraNamespace.image = {};
cameraNamespace.image.var = {};
cameraNamespace.image.var.stack = {};
cameraNamespace.image.var.currentUid = null;
cameraNamespace.image.capture = function( data , callback){
    
    cameraNamespace._pictureSource = navigator.camera.PictureSourceType ;
    cameraNamespace._destinationType = navigator.camera.DestinationType ;
    
	cameraNamespace.image.var.currentUid = data.uid;
    cameraNamespace.image.var.stack[ data.uid ] = { callback : callback } ;
    
    data.type == 'capture' || data.type == undefined ? cameraNamespace._capturePhoto() : null ;
    data.type == 'getPhotoFromLibrary' ? cameraNamespace._getPhotoFromLibrary() : null ;
    data.type == 'getVideoFromLibrary' ? cameraNamespace._getVideoFromLibrary() : null ;
}