var trendingNameSpace = {
    
    isStarted: false,
    trendFeed: null,
   
    ///////////////////////////////// begin get trending feed //////////////////////////////////////

    getTrend: function () {
        
		var profileId = loginNameSpace.loggedUserID;

        $("#Trending-View-trendingFeed-display").empty();
        window.GetTrendingPostSql.Variables.profileId = profileId;
        window.GetTrendingPostSql.DataUpdatedEvent = function(){ 
            trendingNameSpace.buildTrendList(window.GetTrendingPostSql.JsonObject);
        }
        
        window.GetTrendingPostSql.Execute( window.FeedManager ) ;
    },

};

trendingNameSpace.moreTrend = function (thisDivclass) {
        
        if (thisDivclass.search('getMore') == -1) {
            return false;
        }
        $('.getMore').removeClass('getMore');


        window.GetTrendingPostSqlMore.Variables.profileId = loginNameSpace.loggedUserID;
        window.GetTrendingPostSqlMore.Variables.skip = trendingNameSpace.lastID ;
        window.GetTrendingPostSqlMore.DataUpdatedEvent = function(){ 
            trendingNameSpace.buildTrendList(window.GetTrendingPostSqlMore.JsonObject);
        }
        
        window.GetTrendingPostSqlMore.Execute( window.FeedManager ) ;
        

};


trendingNameSpace.buildTrendList = function( data ){
                    
    data = $.extend(true, {}, data ) ;

    $.each(data.Data, function (index , element ) {

        element.postDescription = customNamespace.replaceImg( element.postDescription , 1 );
        element.UserProfileId = element.UserProfileId || loginNameSpace.loggedUserID;
        element.postImageLink = customNamespace.image.resizeAsFullWidth( element.postImageLink );
        element.customFormatedTime = customNamespace.format.dateAsDuration( element.postCreateDate ) ;
        element.formatedPostDescription = element.postDescription ;
        element.postFlagMessagePlural = element.postFlagMessage > 1 ? true : false ;
        element.fanreactCommentsCountPlural = element.fanreactCommentsCount > 1 ? true : false ;
        data.Data[ index ] = element ;
    });




    var lastID = data.Data[data.Data.length - 1].RowNumber;
    var getMoreInAdvance = '<div class="getMore"  onclick="trendingNameSpace.lastID = \'' + lastID + '\' ; trendingNameSpace.moreTrend( $(this).attr(\'class\') )"></div>';

    //console.log( data );
    var html = customNamespace.display.html( data ,  'reaction-view-trendingFeed-template'  ) ;

    html += getMoreInAdvance ;

    $("#Trending-View-trendingFeed-display").append(html);
}