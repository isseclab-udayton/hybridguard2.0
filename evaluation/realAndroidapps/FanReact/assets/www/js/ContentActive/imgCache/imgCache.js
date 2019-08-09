ContentActive.imgCache = {};
ContentActive.imgCache.var = {};
ContentActive.imgCache.var.running = false ;
ContentActive.imgCache.getBase64FromImageUrl = function( url, onSuccess , onFail ) {

    console.log( url );
    var img = new Image();
    img.setAttribute('crossOrigin', 'anonymous');

    img.onload = function() {

        var canvas = document.createElement("canvas");
        canvas.width = this.width;
        canvas.height = this.height;

        var ctx = canvas.getContext("2d");
        ctx.drawImage(this, 0, 0);

        var dataURL = canvas.toDataURL("image/png");

        onSuccess(dataURL)
        //return dataURL;

        //alert(dataURL.replace(/^data:image\/(png|jpg);base64,/, ""));

    };
        
    img.onerror = function(){ onFail() }
    
    img.src = url;    
}


ContentActive.imgCache.getFileFromUrl = function( url, onSuccess , onFail ) {

    var fileTransfer = new FileTransfer();
    var uri = encodeURI(url);

    fileTransfer.download(
        uri,
        filePath,
        function(entry) {
            console.log("download complete: " + entry.fullPath);
        },
        function(error) {
            console.log("download error source " + error.source);
            console.log("download error target " + error.target);
            console.log("upload error code" + error.code);
        },
        false,
        {
            headers: {
                "Authorization": "Basic dGVzdHVzZXJuYW1lOnRlc3RwYXNzd29yZA=="
            }
        }
    );
    
}

ContentActive.imgCache.cacheImages = function(  ) {
        
    console.log('ContentActive.imgCache.var.running : ' + ContentActive.imgCache.var.running );

    if( ContentActive.imgCache.var.running == true ){ console.log('still caching'); return false; }
    console.log('start caching');
    ContentActive.imgCache.var.running = true;

    var elementArray = [];
    
    var checkForDuplicateSrcAndAdd = function( src, ObjectIndex , ObjectElement ){
        var error = { ErrorCode : 0 };
        $.each( elementArray , function( index, element ){
            if( element.src == src || src == undefined || src == '' ){ 
                error.ErrorCode = 1 ; 
                return false ;
            }
        });
        
        if( error.ErrorCode != 1 ){
        	elementArray.push({ src : src , index: ObjectIndex , element : ObjectElement })
        }

        return error ;
    }
    
    $.each( $('div') , function( index, element ){
        var src = $(element).css('background-image');
        src = src != undefined ? ( src + '--').replace(')--','').replace('url(','') : '' ;
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('a') , function( index, element ){
        var src = $(element).css('background-image');
        src = src != undefined ? ( src + '--').replace(')--','').replace('url(','') : '' ;
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('img') , function( index, element ){
        var src = $(element).attr('src');
        checkForDuplicateSrcAndAdd( src , index , element ) ;    
    });
    
    
    
    var cache = function(){
        
        var count = 0 ;
        
        var model_name = "SaveImageAsCache" ;
        var onSuccess = null ;
        var onAlways = function( ){
            console.log('tried cache Image ' + count + ' of ' + ( elementArray.length - 1 ) );
            if( count >= elementArray.length - 1 ){
            	window.FeedManager.CacheFeed( window[model_name] );
    			ContentActive.imgCache.var.running = false;
                //console.log('caching done ');
   	 			//console.log('ContentActive.imgCache.var.running : ' + ContentActive.imgCache.var.running );
            }
            else if( count < elementArray.length - 1 ){
                count += 1 ;
                //console.log( elementArray[count].src.trim().substr(0,3));
                if( count > 1000){ return false ;}
                if( 
                    window.SaveImageAsCache.JsonObject.Data[ elementArray[count].src ] == undefined 
                    && elementArray[count].src.trim().substr(0,4) == 'http'
                  ){
                    ContentActive.imgCache.getBase64FromImageUrl( elementArray[count].src , onSuccess, onAlways );
                } else { 
                    //console.log( 'image already cached '); 
            		onAlways();
                }
            }
        }
        onSuccess = function( dataUrl ){
            var src = elementArray[count].src ;
            //console.log(src);
            var data = {};
            data.dataUrl = dataUrl ;
            data.id = src ;
            data.time = Date.now();
            if( window[model_name].JsonObject.Data == undefined ) { window[model_name].JsonObject.Data = {}; };
            window[model_name].JsonObject.Data[src] = data;
            
            onAlways();
        }
        ContentActive.imgCache.getBase64FromImageUrl( elementArray[count].src , onSuccess , onAlways );
    }
    cache();    
}

ContentActive.imgCache.populateImages = function() {

    //var imgList = typeof holder == 'string' ? $(holder).find('img') : holder.find('img') ;
    
    $.each( $('div') , function( index, element ){
        var backgroundImage = $(element).css('background-image') == undefined ? '' : $(element).css('background-image') ;
        backgroundImage = backgroundImage.replace("url('" , "").replace("')" , "") ;
        backgroundImage = backgroundImage.replace("url(" , "").replace(")" , "") ;
        
        if( window.SaveImageAsCache.JsonObject.Data[ backgroundImage ] != undefined ){
            var src = window.SaveImageAsCache.JsonObject.Data[ backgroundImage ].dataUrl ;
            $(element).css('background-image', 'url(' + src + ')' );
        } 
    });
    
}

ContentActive.imgCache.cleanImgCache = function(){
    
    var model_name = "SaveImageAsCache" ;
    window[model_name].JsonObject.Data = {} ;
    window.FeedManager.CacheFeed( window[model_name] );            
}

ContentActive.imgCache.memorySizeOf = function(obj) {
    var bytes = 0;

    var sizeOf = function(obj) {
        if(obj !== null && obj !== undefined) {
            switch(typeof obj) {
            case 'number':
                bytes += 8;
                break;
            case 'string':
                bytes += obj.length * 2;
                break;
            case 'boolean':
                bytes += 4;
                break;
            case 'object':
                var objClass = Object.prototype.toString.call(obj).slice(8, -1);
                if(objClass === 'Object' || objClass === 'Array') {
                    for(var key in obj) {
                        if(!obj.hasOwnProperty(key)) continue;
                        sizeOf(obj[key]);
                    }
                } else bytes += obj.toString().length * 2;
                break;
            }
        }
        return bytes;
    };

    var formatByteSize = function(bytes) {
        if(bytes < 1024) return bytes + " bytes";
        else if(bytes < 1048576) return(bytes / 1024).toFixed(3) + " KiB";
        else if(bytes < 1073741824) return(bytes / 1048576).toFixed(3) + " MiB";
        else return(bytes / 1073741824).toFixed(3) + " GiB";
    };

    return formatByteSize(sizeOf(obj));
};

ContentActive.imgCache.cacheWithFileSystem = function(){
    
    try{
    var uri = encodeURI("https://fanreactrawvideos.s3.amazonaws.com/uploads/244_115_7_6_17_20_0.jpg");
    window.requestFileSystem(LocalFileSystem.TEMPORARY, 0,
        function (fileSystem) {
            var fileTransfer = new FileTransfer();
            var filename = fileSystem.root.toURL() + uri.substr(uri.lastIndexOf("/") + 1);
            fileTransfer.download(uri, filename,
                function(entry) { // download success
                    var path = entry.toURL(); //**THIS IS WHAT I NEED**
                    window.open(path, "_system");
                },
                function(error) {} // irrelevant download error
            );
        },
        function(error) {} // irrelevant request fileSystem error
    );
    } catch(err){ customNamespace.console(err.message )}
}


ContentActive.imgCache.download = function( data , onSuccess , onFail ){
    var assetURL = data.assetUrl || data.src ;

    var store = cordova.file.cacheDirectory  ;
    
    var fileName = assetURL.split('/')[ assetURL.split('/').length-1 ] ;
    
    var saveAsUrl = store + fileName ;

    var fileTransfer = new FileTransfer();

    fileTransfer.download( assetURL , saveAsUrl , 
        function(entry) {
        	data.saveAsUrl = saveAsUrl ;
            onSuccess( data )
        }, 
        function(err) {
        	data.err = err ;
            onFail( data )
        });
}

ContentActive.imgCache.cleanSrc = function( src ){
    if( src == undefined ){ return src };
	src = src.replace("url('",'').replace('url(','').replace("')",'').replace(")",'').trim() ;
    //if( src.trim().substr(0,4) == 'http' ) { console.log(src) }
    return src ;
}

ContentActive.imgCache.populateAllAtOnce = function( data , onSuccess , onFail ){
    
    var getSrc = function( src , onSuccess , onFail ){
        src = ContentActive.imgCache.cleanSrc( src ) ;   
        if( window.SaveImageAsCache.JsonObject.Data[ src ] != undefined){
        	src = window.SaveImageAsCache.JsonObject.Data[ src ].saveAsUrl != undefined ? window.SaveImageAsCache.JsonObject.Data[ src ].saveAsUrl : src ;
        }
        return src ;
    }
    $.each( $('div') , function( index, element ){
        var src = $(element).css('background-image');        
		src = getSrc( src ); 
        $(element).css('background-image' , "url('"+src+"')");
    });
    
    $.each( $('a') , function( index, element ){
        var src = $(element).css('background-image');
		src = getSrc( src );
        $(element).css('background-image' , "url('"+src+"')");
    });
    
    $.each( $('img') , function( index, element ){
        var src = $(element).attr('src');
		src = getSrc( src );
        $(element).attr('src' , src );
    });
    
}



ContentActive.imgCache.cacheAllAtOnce = function(  ){
    
    if( navigator.simulator == true ) return;
    
    if ( navigator.connection.type == 'none') {
    	ContentActive.imgCache.populateAllAtOnce();
        return false;
    };
    
    var elementArray = [];
    
    var checkForDuplicateSrcAndAdd = function( src, ObjectIndex , ObjectElement ){
        src = ContentActive.imgCache.cleanSrc( src ) ;    
        var error = { ErrorCode : 0 };
        $.each( elementArray , function( index, element ){
            if( element.src == src || src == undefined || src == '' ){ 
                error.ErrorCode = 1 ; 
                return false ;
            }
        });
        
        if( error.ErrorCode != 1 ){
        	elementArray.push({ src : src , index: ObjectIndex , element : ObjectElement })
        }

        return error ;
    }
    
    $.each( $('div') , function( index, element ){
        var src = $(element).css('background-image'); 
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('a') , function( index, element ){
        var src = $(element).css('background-image');
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('img') , function( index, element ){
        var src = $(element).attr('src');
        checkForDuplicateSrcAndAdd( src , index , element ) ;    
    });
    
    
    
    var cache = function(){

        if( window.SaveImageAsCache.JsonObject.Data == undefined ) { window.SaveImageAsCache.JsonObject.Data = {}; };
        var onFail = function( customData ){
            window.SaveImageAsCache.JsonObject.Data[ customData.src ] = { err : customData.err , id :  customData.src  , time : Date.now() };
            window.FeedManager.CacheFeed( window.SaveImageAsCache );
        }
        var onSuccess = function( customData ){
            window.SaveImageAsCache.JsonObject.Data[ customData.src ] = { saveAsUrl : customData.saveAsUrl , id :  customData.src  , time : Date.now() };
            window.FeedManager.CacheFeed( window.SaveImageAsCache );
        }
                	
        $.each( elementArray , function( index , element ){

            if( 
            	window.SaveImageAsCache.JsonObject.Data[ element.src ] == undefined 
            	&& element.src.trim().substr(0,4) == 'http'
            ){
            	ContentActive.imgCache.download( element , onSuccess , onFail );
            }
        });
    }
    cache();    
}



ContentActive.imgCache.execute = function( data , onSuccess , onAlways , onFail ){
    
        
    //console.log('ContentActive.imgCache.var.running : ' + ContentActive.imgCache.var.running );
    
    if( ContentActive.imgCache.var.running == true ){
        //console.log('still caching'); 
        return false;
    }
    //console.log('start caching');
    ContentActive.imgCache.var.running = true;
    
    var elementArray = [];
    
    var checkForDuplicateSrcAndAdd = function( src, ObjectIndex , ObjectElement ){
        var error = { ErrorCode : 0 };
        $.each( elementArray , function( index, element ){
            if( element.src == src || src == undefined || src == '' ){ 
                error.ErrorCode = 1 ; 
                return false ;
            }
        });
        
        if( error.ErrorCode != 1 ){
        	elementArray.push({ src : src , index: ObjectIndex , element : ObjectElement })
        }

        return error ;
    }
    
    $.each( $('div') , function( index, element ){
        var src = $(element).css('background-image');
        src = src != undefined ? ( src + '--').replace(')--','').replace('url(','') : '' ;
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('a') , function( index, element ){
        var src = $(element).css('background-image');
        src = src != undefined ? ( src + '--').replace(')--','').replace('url(','') : '' ;
        checkForDuplicateSrcAndAdd( src , index , element ) ;
    });
    
    $.each( $('img') , function( index, element ){
        var src = $(element).attr('src');
        checkForDuplicateSrcAndAdd( src , index , element ) ;    
    });
    
    
    
    var cache = function(){
        
        var count = 0 ;
        
        var model_name = "SaveImageAsCache" ;
        if( window[model_name].JsonObject.Data == undefined ) { window[model_name].JsonObject.Data = {}; };
        var onSuccess = null ;
        var onAlways = function( customData ){
            //console.log('tried cache Image ' + count + ' of ' + ( elementArray.length - 1 ) );
            if( count >= elementArray.length - 1 ){
            	window.FeedManager.CacheFeed( window[model_name] );
    			//ContentActive.imgCache.var.running = false;
                //console.log('caching done ')
   	 			//console.log('ContentActive.imgCache.var.running : ' + ContentActive.imgCache.var.running )
            }
            else if( count < elementArray.length - 1 ){
                count += 1 ;
                //console.log( elementArray[count].src.trim().substr(0,3));
                if( count > 1000){ return false ;}
                if( 
                    window.SaveImageAsCache.JsonObject.Data[ elementArray[count].src ] == undefined 
                    && elementArray[count].src.trim().substr(0,4) == 'http'
                  ){
                    ContentActive.imgCache.download( { assetUrl : elementArray[count].src }, onSuccess, onAlways );
                } else { 
                    //console.log( 'image already cached or failed to download'); 
            		onAlways();
                }
            }
        }
        onSuccess = function( customData ){
            var src = elementArray[count].src ;
            //console.log(src);
            var data = { detail : customData , id : src , time : Date.now() };
            window[model_name].JsonObject.Data[src] = data;
            
            onAlways();
        }
        ContentActive.imgCache.download( { assetUrl : elementArray[count].src } , onSuccess , onAlways );
    }
    cache();    
}

