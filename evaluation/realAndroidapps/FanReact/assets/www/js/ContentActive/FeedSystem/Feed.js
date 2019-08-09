var ContentActive = ContentActive || {};
ContentActive.FeedSystem = ContentActive.FeedSystem || {};
ContentActive.FeedSystem.var = {};
ContentActive.FeedSystem.var.onConnectionNone = function(){} ;
ContentActive.FeedSystem.var.onConnectionNotNone = function(){} ;

ContentActive.FeedSystem.Feed = function (name, url, updateDelay, dataUpdatedEvent, cached, post) {
    this.Name = name;
    this.URL = url;
    this.DataUpdatedEvent = dataUpdatedEvent;
    this.UpdateDelay = updateDelay;
    this.LastUpdateTime = -1;

    this.ErrorCode = 0;
    this.JsonObject = new Object();
    this.Variables = new Object();
    this.NeedSynchronousUpdate = false;

    if (cached != undefined) {
        this.Cached = cached;
    }
    else {
        this.Cached = true;
    }

    if (post != undefined) {
        this.Post = post;
    }
    else {
        this.Post = true;
    }
}

ContentActive.FeedSystem.Feed.prototype.ExecuteSynchronous = function () {
    this.NeedSynchronousUpdate = true;
}

ContentActive.FeedSystem.Feed.prototype.Execute = function (feedManager, post) {
    var referenceObject = this;

    var onFail = function ( data  ) {
        ContentActive.FeedSystem.var.onConnectionNone();
        if (referenceObject.DataUpdatedEventOnFail != undefined) {
            referenceObject.DataUpdatedEventOnFail( data );
        } else if ( referenceObject.DataUpdatedEvent != undefined ) {
            referenceObject.DataUpdatedEvent( data );
        }
    }
    
    //if (window.navigator.simulator === true && navigator.connection.type == 'none') {
    //    onFail();
    //    return false;
    //};

    var type = this.Post == true ? "POST" : "GET" ;
    $.ajax({
            type: type,
            url: this.URL,
        	data : this.Variables 
    }).success(function (data , status ) {
         
        ContentActive.FeedSystem.var.onConnectionNotNone();
        referenceObject.JsonObject = data;
        typeof referenceObject.DataUpdatedEvent != undefined && typeof referenceObject.DataUpdatedEvent == "function" ? referenceObject.DataUpdatedEvent( data ) : null ;

        referenceObject.LastUpdateTime = Date.now();

        referenceObject.Cached && feedManager != undefined ? feedManager.CacheFeed(referenceObject) : null ;
        
    }).fail( onFail );

}
