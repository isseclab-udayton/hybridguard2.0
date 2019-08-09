
//global variables
date = new Date();

//---------------Feature News Page --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function getFeatureNews() {

    // turns off caching for all ajax calls
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_newsJson.aspx?callback=?&nocache=' + date.getTime();

    // clear existing json out of cache
    $.ajaxSetup({ cache: false });

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        beforeSend: function onBeforeSend(xhr, settings) {
            xhr.setRequestHeader('cache-control', 'max-age=0, no-cache, no-store, must-revalidate, proxy-revalidate');
        },

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection." }).appendTo("#featureNewsList");
            uploadError = true;
        },

        success: function showData(data) {
            var items = [];

            // output to screen
            var output = '<ul data-role="listview" data-filter="false" data-inset="true" data-theme="c">';

            for (var i = 0; i < 3; i++) {

                var id = data.news.items[i].id;
                var title = data.news.items[i].title;
                var date_posted = data.news.items[i].date_posted;

                output += '<li>';
                output += '<a href="#newsDetailItem" onclick="showNewsItemSSM(' + id + ')">';
                output += '<h2>' + title + '</h2>';
                output += '<p>' + date_posted + '</p>';
                output += '</a>';
                output += '</li>';

            }; // each

            output += '</ul>';
            $('#featureNewsList').html(output);

            // turn ajax caching back on
            $.ajaxSetup({ cache: true });
        }
    }); // ajax

}; // getFeatureNews()


//---------------News Page --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function getNews() {

    //force iOS to clear cache by adding junk parameter
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_newsJson.aspx?callback=?&nocache=' + date.getTime();

    // turns off caching for all ajax calls
    $.ajaxSetup({ cache: false });

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        beforeSend: function onBeforeSend(xhr, settings) {
            xhr.setRequestHeader('cache-control', 'max-age=0, no-cache, no-store, must-revalidate, proxy-revalidate');
        }, // beforeSend

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection."}).appendTo("#newsList");
            uploadError = true;
        }, // error

        success: function showData(data) {
            var items = [];

            // output to screen
            var output='<ul data-role="listview" data-filter="true" data-inset="true" data-theme="c">';
            	
            $.each(data.news.items, function(key, val) {
            		  
            output += '<li>';
            output += '<a href="#newsDetailItem" onclick="showNewsItemSSM(' + val.id + ')">';
            output += '<h2>' + val.title + '</h2>';
            output += '<p>' + val.date_posted + '</p>';
            output += '</a>';
            output += '</li>';
            		
            }); // each
            	  
            output += '</ul>';
            $('#newsList').html(output);

            // turn ajax caching back on
            $.ajaxSetup({ cache: true });
        } // success

    }); // ajax

}; // getNews()

function showNewsItemSSM(id) {  // news dynamitic page build function

    var selectedID = id;

    //no need to turn off ajax caching, since coming from a list page
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_newsJson.aspx?callback=?';

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection." }).appendTo("#jaxNewsItem");
            uploadError = true;
        }, // error

        success: function showData(data) {
            var items = [];
            for (var i=0; i<data.news.items.length; i++) {
                var arrayID = data.news.items[i].id;

                if (arrayID == selectedID) {
                    var output = '';
                    output += '<div data-inset="true" class="ui-body ui-body-f ui-corner-all">';
                    output += '<h2 class="summaryNewsTxt" >' + data.news.items[i].title + '</h2>';
                    output += '</div>';
                    output += '<div data-inset="true" class="ui-body ui-body-f ui-corner-all">';
                    output += '<p>' + data.news.items[i].date_posted + '</p>';
                    output += '<p>' + data.news.items[i].summary + '</p>';
                    output += '<p>' + data.news.items[i].body + '</p>';
                    output += '<p>' + data.news.items[i].moreNfo + '</p>';
                    output += '</div>';
                    $('#jaxNewsItem').html(output);
                };

            }; //for
        } // success

    }); // ajax

}; //showNewsItemSSM


//--------------  -Feature Events Page  ---------------------------------------------------------------------------------------------------------------------------------------------------------------
function getFeatureEvents() {

    //force iOS to clear cache by adding junk parameter
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?&nocache=' + date.getTime();

    // turns off caching for all ajax calls
    $.ajaxSetup({ cache: false });

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        beforeSend: function onBeforeSend(xhr, settings) {
            xhr.setRequestHeader('cache-control', 'max-age=0, no-cache, no-store, must-revalidate, proxy-revalidate');
        }, // beforeSend

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection." }).appendTo("#featureEventsList");
            uploadError = true;
        }, // error

        success: function showData(data) {
            var items = [];

            // output to screen
            var output = '<ul data-role="listview" data-filter="false" data-inset="true" data-theme="a">';

            for (var i = 0; i < 3; i++) {

                var eventID = data.events.items[i].eventID;
                var EventName = data.events.items[i].EventName;
                var EventTeaser = data.events.items[i].EventTeaser;
                var EventDate = data.events.items[i].EventDate;
                var EventLocation = data.events.items[i].EventLocation;
                var EventPrice = data.events.items[i].EventPrice;

                output += '<li>';
                output += '<a href="#eventItemDetails" onclick="showEventSSM(' + eventID + ')">';
                output += '<h2>' + EventName + '</h2>';
                output += (EventTeaser) ?   // use feature image if no image use default, designer note: images must be square cropped
        		'<img src="' + EventTeaser + '" alt="' + EventName + '" />' :
        		'<img src="images/jaxHappeningsLogo.png" alt=City of Jacksonville" />';
                output += '<p>' + EventDate + '</p>';
                output += '<p>' + EventLocation + '</p>';
                output += '<p>' + EventPrice + '</p>';
                output += '</a>';
                output += '</li>';

            }; // each

            output += '</ul>';
            $('#featureEventsList').html(output);

            // turn ajax caching back on
            $.ajaxSetup({ cache: true });
        } // success

    }); // ajax

}; // getFeatureEvents()

//---------------Events Page ----------------------------------------------------------------------------------------------------------------------------------------------------------------
function getEvents() {

    //force iOS to clear cache by adding junk parameter
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?&nocache=' + date.getTime();

    // turns off caching for all ajax calls
    $.ajaxSetup({ cache: false });

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        beforeSend: function onBeforeSend(xhr, settings) {
            xhr.setRequestHeader('cache-control', 'max-age=0, no-cache, no-store, must-revalidate, proxy-revalidate');
        }, // beforeSend

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection." }).appendTo("#eventsList");
            uploadError = true;
        }, // error

        success: function showData(data) {
            var items = [];

            // output to screen
            var output = '<ul data-role="listview" data-filter="true" data-inset="true" data-theme="a">';

            $.each(data.events.items, function (key, val) {

                output += '<li>';
                output += '<a href="#eventItemDetails" onclick="showEventSSM(' + val.eventID + ')">';
                output += '<h2>' + val.EventName + '</h2>';
                output += (val.EventTeaser) ?   // use feature image if no image use default, designer note: images must be square cropped
            	'<img src="' + val.EventTeaser + '" alt="' + val.EventName + '" />' :
            	'<img src="images/jaxHappeningsLogo.png" alt=City of Jacksonville" />';
                output += '<p>' + val.EventDate + '</p>';
                output += '<p>' + val.EventLocation + '</p>';
                output += '<p>' + val.EventPrice + '</p>';
                output += '</a>';
                output += '</li>';

            }); // each

            output += '</ul>';
            $('#eventsList').html(output);

            // turn ajax caching back on
            $.ajaxSetup({ cache: true });
        } // success

    }); // ajax

}; // getEvents()


function showEventSSM(eventID) {

    var selectedEventID = eventID;

    //no need to turn off ajax caching, since coming from a list page
    var jsonURL = 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?';

    // ajax - get data - use POST to deal with iOS caching
    $.ajax({
        type: 'POST',
        url: jsonURL,
        processData: false,
        timeout: 60000,
        dataType: 'json',

        error: function onError(XMLHttpRequest, textStatus, errorThrown) {
            $("<span />", { style: "color:white;", text: "Please check your data connection." }).appendTo("#jaxEventItem");
            uploadError = true;
        }, // error

        success: function showData(data) {
            var items = [];

            for (var i = 0; i < data.events.items.length; i++) {
                var arrayEventID = data.events.items[i].eventID;
                if (arrayEventID == selectedEventID) {

                    var eventID = data.events.items[i].eventID;
                    var EventName = data.events.items[i].EventName;
                    var EventTeaser = data.events.items[i].EventTeaser;
                    var EventDate = data.events.items[i].EventDate;
                    var EventLocation = data.events.items[i].EventLocation;
                    var EventPrice = data.events.items[i].EventPrice;
                    var EventMultiCategory = data.events.items[i].EventMultiCategory;
                    var EventStreetAddress = data.events.items[i].EventStreetAddress;
                    var EventBuyTicketsLink = data.events.items[i].EventBuyTicketsLink;
                    var EventSummary = data.events.items[i].EventSummary;
                    var EventDetails = data.events.items[i].EventDetails;
                    var EventMoreNfo = data.events.items[i].EventMoreNfo;

                    var output = '';
                    output += '<div data-inset="true" class="ui-body ui-body-e ui-corner-all">';
                    output += '<img src="' + EventTeaser + '" alt="' + EventName + '" class="eventSummaryImg" />';
                    output += '<div class="eventSummaryTxt">';
                    output += '<h1>' + EventName + '</h1>';
                    output += '<p>' + EventDate + '</p>';
                    output += '<p>' + EventLocation + '</p>';
                    output += '<p>' + EventStreetAddress + '</p>';
                    output += '<p>' + EventPrice + '</p>';
                    output += '</div>';

                    output += '<div class="txtCategory">';
                    output += '<p>' + EventMultiCategory + '</p>';
                    output += '</div>';

                    output += '<div class="eventLocation_BuyTxt">';
                    if (EventStreetAddress != "") {
                        output += '<a href="#gmap" class="eventSummaryMapLink" onclick="showEventMapSSM(' + eventID + ')">';
                        output += '<p>' + 'Map' + '</p>';
                        output += '</a>';
                    };
                    if (EventBuyTicketsLink != "") {
                        output += '<a onclick=\'launchBrowser("' + EventBuyTicketsLink + '")\'>';
                        output += '<p class="eventSummaryBuyLink">' + 'Buy Tickets' + '</p>';
                        output += '</a>';
                    };
                    output += '<br class="clearfloat" />';
                    output += '</div>';
                    output += '</div>';
                    output += '</div>';
                    output += '<div data-inset="true" class="ui-body ui-body-e ui-corner-all a:link a:visited a:hover a:focus a:active">';
                    output += '<p>' + EventSummary + '</p>';
                    output += '<p>' + EventDetails + '</p>';
                    output += '<p>' + EventMoreNfo + '</p>';
                    output += '</div>';
                    $('#jaxEventItem').html(output);

                }; // </if>
            }; // </for>
        } // success

    }); // ajax

    //gmapOnPageshowExists, kill it
    if (gmapOnPageshowExists == 1) {
        $('#gmap').off();
        gmapOnPageshowExists = 0;
    }; //gmapOnPageshowExists

    //if previousMapExists, destroy it, then reset it
    if (previousMapExists == 1) {
        eventLocationMap.setmap('destroy');
        previousMapExists = 0;

    }; // if (previousMapExists == 1)

}; // </showEventSSM>


//---------------Map Page ----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
setmap jquery plugin for google maps
setmap intro:  http://codecanyon.net/item/setmap-jquery-plugin-for-google-maps/743337
google maps javascritp api:  https://developers.google.com/maps/documentation/javascript/
jquery-ui-map - google map v3 plugin for jquery and jquery mobile:  http://code.google.com/p/jquery-ui-map/wiki/Examples
*/

//global variables for setmap
previousMapExists = 0;
gmapOnPageshowExists = 0;

function showEventMapSSM(eventID) {
    var selectedEventID = eventID;

    //gmapOnPageshowExists - does not exist, so fire it
    if (gmapOnPageshowExists == 0) {

        //gmap on pageshow - when gmap page-id is shown, run getJSON
        $('#gmap').on("pageshow", function () {

            //getJSON
            $.getJSON('http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?', function (data) {

                // previous map does not exist
                if (previousMapExists == 0) {
                    var items = [];

                    for (var i = 0; i < data.events.items.length; i++) {

                        var arrayEventID = data.events.items[i].eventID;

                        if (arrayEventID == selectedEventID) {
                            var EventName = data.events.items[i].EventName;
                            var EventStreetAddress = data.events.items[i].EventStreetAddress;
                            $('#eventMap_eventName').text(EventName);
                            $('#eventMap_setmapAddress').text(EventStreetAddress);

                            // setTimeout so that event name & title refresh before loading map
                            setTimeout(callSetmap(EventStreetAddress), 1);

                            previousMapExists = 1;
                            gmapOnPageshowExists = 1;

                            break;
                        }; // if (arrayEventID == selectedEventID)
                    }; // for
                }; // if (previousMapExists == 0)

            }); // getJSON
        });    // gmap on pageshow

    }; //gmapOnPageshowExists

}; // showEventMapSSM()

function callSetmap(EventStreetAddress) {
    //set default address to jacksonville
    $('#map_canvas').setmap(
    {
        marker:
        {
            position:
            {//default location
                latitude: 30.3319,
                longitude: 81.6558
            }
        }

    }).setmap('setAddress', EventStreetAddress, function (lat, lng, setmapAddress) {
        eventLocationMap = $('#map_canvas');
    }); // setmap
}; // callSetmap


//---------------YouTube Info page---------------------------------------------------------------------------------------------------------------------------------------------
function jaxListVideos(data) {
	
	var output ='';
	for ( var i=0; i<data.feed.entry.length; i++) {

		var title = data.feed.entry[i].title.$t;
		var thumbnail = data.feed.entry[i].media$group.media$thumbnail[0].url;
		var description = data.feed.entry[i].media$group.media$description.$t;
		var id = data.feed.entry[i].id.$t.substring(38);
		
		var blocktype = ((i % 2)===1) ? 'b': 'a';
		
		output += '<div class="ui-block-' + blocktype + '">';

		output += '<a href="#jaxVideoPlayer" data-transition="fade" onclick="playVideo(\'' +  id +'\',\'' + title + '\',\'' + escape(description) + '\')">';
		output += '<h3 class="movietitle">' + title + '</h3>';
		output += '<img src="' + thumbnail + '" alt="' + title + '" />';
		output += "</a>";
		output += "</div>";
	}
	
	$('#jaxVideoList').html(output);
}

function playVideo(id, title, description) {
	var output = '<iframe src="http://www.youtube.com/embed/'+ id +'?wmode=transparent&amp;HD=0&amp;rel=0&amp;showinfo=0&amp;controls=1&amp;autoplay=1" frameborder="0" allowfullscreen></iframe>';
	output += '<h3>' + title + '</h3>';
	output += '<p>' + unescape(description) + '</p>';
	$('#jaxPlayer').html(output);
}


//---------------Flickr connect page---------------------------------------------------------------------------------------------------------------------------------------------
function jsonFlickrFeed(data) {
	var output='';
	
	for (var i = 0; i < data.items.length; i++) {
		var title = data.items[i].title;
		var link = data.items[i].media.m.substring(0, 56);
		var blocktype =
			((i%3)===2) ? 'c':
			((i%3)===1) ? 'b':
			'a';
		output += '<div class="ui-block-' + blocktype + '">';
		output += '<a href="#showphoto" data-transition="fade" onclick="showPhoto(\'' + link +'\',\'' + title + '\')">';
		output += '<img src="' + link + '_q.jpg" alt="' + title + '" />';
		output += '</a>';
		output += '</div>';
	} // go through each photo
	$('#photolist').html(output);
} //jsonFlickrFeed

function showPhoto(link, title) {
	var output='<a href="#flickr" data-transition="fade">';
	output += '<img src="' + link + '_b.jpg" alt="' + title +'" />';
	output += '</a>';
	$('#jaxPhoto').html(output);
}


//---------------Twitter work in progress for connect page----------------------------------------------------------------------------------------------------------------------
function listTweets(data) {
		var output='<ul data-role="listview" data-filter="false" data-inset="true" class="ui-listview">';
	
	$.each(data, function(key, val) {
		var text = data[key].text;
		var thumbnail = data[key].user.profile_image_url;
		var name = data[key].user.name;  
				
		text=text.replace(/[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&~\?\/.=]+/g, function(i) {      // RegEx URLs

			var url=i.link(i);
			return url;
		});
		
		text=text.replace(/[@]+[A-Za-z0-9-_]+/g, function(i) {       // RegEx @Usernames

			var item = i.replace("@",'');
			var	url = i.link("http://twitter.com/"+ item);
			return url;
		});
		
		text=text.replace(/[#]+[A-Za-z0-9-_]+/g, function(i) {        //RegEx #hashtags

			var item = i.replace("#", '%23');
			var url = i.link("http://search.twitter.com/search?q=" + item);
			return url;
		});
		
		output += '<li>';
//		output += '<img src="' + thumbnail +'" alt="Photo of ' + name + '">';
		output += '<div>' + text + '</div>';
		output += '</li>';		
		
		
	}); //go through each tweet
	output += '</ul>';
	$('#tweetlist').html(output);
}


//--------------- Facebook for connect page ----------------------------------------------------------------------------------------------------------------------
function getFB_events() {

	    $.getJSON('https://graph.facebook.com/95024694261/feed?access_token=108487505894|qwkEHfIxJoQVKQ9NJfmzQwuFeUg&limit=10', function(data) {
        var items = [];
	  
		var output='<ul data-role="listview" data-filter="false" data-inset="true" data-theme="a">';
	  
		$.each(data.data, function(key, val) {
		var picture = data.data[key].picture;
		var message = data.data[key].message;

		output += '<li>';
		output += (picture) ?   // use feature image if no image use default, designer note: images must be square cropped
			'<img src="' + picture + '" />':
			'<img src="images/jaxHappeningsLogo.png" alt=City of Jacksonville" />';
			
		output += (message) ?   // use feature post if no post use default message
			'<div>' + message + '</div>':
			'<div>' + "This post is not available, please check back latter..." + '</div>';
			output += '</li>';		
	}); //go through each post
	output += '</ul>';
	$('#jaxFB_postsList').html(output);
	
	}); //go through each tweet
}


//--------------- childBrowser - browser back button ------------------------------------------------------------------------------------------------------------------
/*
ChildBrowser plugin for PhoneGap - https://github.com/alunny/ChildBrowser
*/
//ssm: closes open childBrowser as well
childBrowserIsOpen = 0;

function launchBrowser(urlFromJson) {
	
    if (childBrowserIsOpen == 1) {
        window.plugins.childBrowser.close();
        childBrowserIsOpen = 0;
    }; //if (childBrowserIsOpen == 1)

    if (childBrowserIsOpen == 0) {
        window.plugins.childBrowser.showWebPage(urlFromJson,
        {
            showLocationBar: true
        }); // childBrowser.showWebPage
        childBrowserIsOpen = 1;
    }; // if (childBrowserIsOpen == 0)
    
}; // launchBrowser


//--------------- Android double blink fix ------------------------------------------------------------------------------------------------------------------
	$(document).bind("mobileinit", function()
	{
		if (navigator.userAgent.indexOf("Android") != -1)
		{
			$.mobile.defaultPageTransition = 'none';
			$.mobile.defaultDialogTransition = 'none';
		}
	});   
	
	
//---------------  News and Events Details  a tag overides  ----------------------------------------------------------------------------------------------------
	$(document).ready(function()
	{
		  $("#newsDetailItem").addClass("a");
		  $("#eventDetailItem").addClass("a");
	});	
	
	

	
