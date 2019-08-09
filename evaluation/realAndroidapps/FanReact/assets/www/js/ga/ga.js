var gaNamespace = {};

gaNamespace.var = {};
gaNamespace.var.initialized = false ;
gaNamespace.initialize = function(){
    try{
        
        window.analytics.startTrackerWithId(domainNameSpace.googleAnalyticId);        
        gaNamespace.var.initialized = true;
        
    } catch(err){ customNamespace.console( err.message )}
}


gaNamespace.trackView = function(pageName){
    gaNamespace.initialize();
    try{
        window.analytics.trackView( pageName )
    } catch(err){customNamespace.console( err.message )}
}


gaNamespace.trackException = function( Description , Fatal){
    
    gaNamespace.initialize();
    
    if( Fatal != true ){ Fatal = false ; }
    try{
        window.analytics.trackException( Description, Fatal )
    } catch(err){customNamespace.console( err.message )}
}

gaNamespace.trackEvent = function( Category , Action, Label, Value ){
        
    
    gaNamespace.initialize();
    
    try{
		window.analytics.trackEvent( Category, Action, Label, Value)
    } catch(err){console.log( err.message )}
}

