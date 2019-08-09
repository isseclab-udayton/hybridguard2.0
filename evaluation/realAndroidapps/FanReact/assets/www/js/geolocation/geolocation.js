var geolocationNamespace = geolocationNamespace || {} ;
geolocationNamespace.var = {};

geolocationNamespace.var.position = null ;
geolocationNamespace.var.error = null ;
geolocationNamespace.var.skip = false ;
geolocationNamespace.var.option = {maximumAge:15000, timeout:15000, enableHighAccuracy:true}  ;

geolocationNamespace.initialize = function(){
    
    var onSuccess = function( position ) { 
        geolocationNamespace.var.position = position ; 
    }
    var onFail = function( position ) { 
        console.log('Failed to initialize geolocation from geolocationNamespace');
    }
    var option = geolocationNamespace.var.option ;		
    window.navigator.geolocation.getCurrentPosition(onSuccess,onFail, option )  
   
}

geolocationNamespace.onInterval = function(){
    
    if( geolocationNamespace.var.skip == false ){
   	 	geolocationNamespace.initialize();
    }
}


geolocationNamespace.keepGettingLocationUntilSuccess = function(){
    
    geolocationNamespace.initialize();
    setInterval(function(){ 
        if(  geolocationNamespace.var.position == null ){
        	geolocationNamespace.onInterval(); 
        }
    }, 30000);
}

$(document).ready(function(){
	//geolocationNamespace.keepGettingLocationUntilSuccess();
});

