/* BEGIN GLOBAL VARIABLES */
var googleapi_key = 'ABQIAAAAcZG1CzC0UA7-XVIMneC0kxQXyAQoI-4kVN7pU7g-ZDmUmlBxMhQN6C2qfZNVE-8sb8wQhFJHGjeW2g';
var moviefeed = 'http://flixalerts.com/webservices/movies.cfc?callback=?';
var moviedetails = {};
var movieresults = {};
var subscribedmovies;
var subscribedmovietitles;
var currentScreen = 'home';
var familyfilter = "";
var deviceInfo = {};
var localZip = '';
var cache = {};
cache.movies = {};
/* END GLOBAL VARIABLES */

var clearId = setInterval(function(){ cache.movies = {}; }, 1000 * 60 * 10); // clear cache every 10 minutes

/* BEGIN CORDOVA HANDLERS */
var CordovaReady = false;

document.addEventListener("deviceready",onDeviceReady,false);

function onDeviceReady()
{
	CordovaReady = true;
	document.addEventListener("backbutton", backKeyDown, true);
	document.addEventListener("menubutton", menuKeyDown, false);
	loadDeviceInfo();
	checkNetworkConnection();
	checkNotifications();
	showHome();
}

function backKeyDown()
{
	goBack();
}

function menuKeyDown()
{
	// show a menu?
}

function loadDeviceInfo()
{
	deviceInfo['name'] = device.name;
	deviceInfo['cordova'] = device.cordova;
	deviceInfo['platform'] = device.platform;
	deviceInfo['uuid'] = device.uuid;
	deviceInfo['version'] = device.version;
}

function isDataEnabled()
{
	return true; // testing

	if (CordovaReady == false)
		return false;

	if (navigator.network.connection.type == Connection.NONE)
		return false;
	else
		return true;
}
/* END CORDOVA HANDLERS */

/* BEGIN GUI CONTROLS */
$(document).ready(function()
{
	$.ajaxSetup({async:false});

	$('.refresh').click(function(){
		checkNotifications();
	});

	$('#notifications').click(function(){
		$('#notifications').hide();
		$('#notifications').html('');
	});

	$('#intheaters_button').click(function(){
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		$('#movies').show();
		setTabSelected('intheaters_button');
		loadMovies('T');
	});

	$('#upcoming_button').click(function(){
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		$('#movies').show();
		setTabSelected('upcoming_button');
		loadMovies('U');
	});

	$('#opening_button').click(function(){
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		$('#movies').show();
		setTabSelected('opening_button');
		loadMovies('O');
	});

	$('#newreleases_button').click(function(){
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		$('#movies').show();
		setTabSelected('newreleases_button');
		loadMovies('D');
	});

	$('#mysubscriptions_button').click(function(){
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		$('#movies').show();
		setTabSelected('mysubscriptions_button');
		loadMovies('M');
	});

	$('.moviedetails').live('click', function(){
		if(!$(this).hasClass('static'))
		{
			var elem = $(this).attr('id');
			movieid = elem.replace('movie-', '');
			showMovieDetails(movieid);
		}
	});

	$('#find_button').click(function(){
		findMovie();
	});

	$('#subscribe_button').click(function(){
		subscribeMovie($('#movie_id').text(), $('#movie_title').text());
	});

	$('#unsubscribe_button').click(function(){
		unsubscribeMovie($('#movie_id').text());
	});

	$('#lpsubscribe_button').click(function(){
		subscribeMovie($('#lpmovieid').text(), $('#lpmovietitle_text').text());
		$('#longpressmenu').hide();
	});

	$('#lpunsubscribe_button').click(function(){
		unsubscribeMovie($('#lpmovieid').text());
		$('#longpressmenu').hide();
	});

	$('.goback').click(function(){
		goBack();
	});

	$('#closelpmenu_button').click(function(){
		$('#longpressmenu').hide();
	});

	$('#settings_button').click(function(){
		showSettings();
	});

	$('#register_button').click(function(){
		registerDevice();
	});

	$('#verify_button').click(function(){
		loadAccountSettings();
	});

	$('#savesettings_button').click(function(){
		saveAccountSettings();
	});

	$('#info_button').click(function(){
		showInfo();
	});

	$('#theaters_button').click(function(){
		showTheaters();
	});

	$('#trailer_button').click(function(){
		loadTrailer($('#movie_title').text());
	});

	$('#lptrailer_button').click(function(){
		$('#longpressmenu').hide();
		loadTrailer($('#lpmovietitle_text').text());
	});

	$('#buy_button').click(function(){
		if($('#buy_button').text() == 'Buy Movie')
			buyHandler('movie', $('#movie_title').text());
		else
			buyHandler('tickets', $('#movie_title').text());
	});

	$('#lpbuy_button').click(function(){
		$('#longpressmenu').hide();
		if(getTabSelected() == 'newreleases_button')
			buyHandler('movie', $('#lpmovietitle_text').text());
		else
			buyHandler('tickets', $('#lpmovietitle_text').text());
	});

	$('a').each(function(i, item){
		$(this).attr('target', '_blank');
	});

	checkFamilyFilter();

	showHome();
});

function buyHandler(type, movietitle)
{
	if(type == 'movie')
		$('#buy_offsite').attr('href', 'http://www.amazon.com/exec/obidos/external-search?tag=nibysi-20&mode=movies-tv&keyword=' + encodeURIComponent(movietitle));
	else
		$('#buy_offsite').attr('href', 'http://www.jdoqocy.com/interactive?amid=&mid=&ccode=&searchby=keyword&a=&srce=&dte=0&wss=CJAFFILIATE&q=' + encodeURIComponent(movietitle) + '&aid=10735876&pid=5473365&url=http%3A%2F%2Fwww.fandango.com%2FGlobalSearch.aspx%3F');
	fakeClick('buy_offsite');
}

function renderSettings()
{
	if(checkAccount() == true)
	{
		$('#settings_form').hide();
		$('#account_form').hide();
		$('#verify_form').show();
	}
	else
	{
		$('#account_form').hide();
		$('#verify_form').hide();
		$('#settings_form').show();
	}
}

function showMovieDetails(movieid)
{
	$('#movies').hide();
	currentScreen = 'movie';
	$('#movie_title').text(moviedetails[movieid]['title']);
	$('#movie_releasedate').text(moviedetails[movieid]['release_date']);
	$('#movie_dvdreleasedate').text(moviedetails[movieid]['dvd_release_date']);
	$('#movie_content').text(moviedetails[movieid]['synopsis']);
	$('#movie_cast').html(moviedetails[movieid]['cast']);
	$('#movie_ranking').text(moviedetails[movieid]['ranking']);
	$('#movie_rating').text(moviedetails[movieid]['mpaa_rating']);
	$('#movie_runtime').text(moviedetails[movieid]['runtime']);
	$('#movie_guid').text(moviedetails[movieid]['guid']);
	$('#movie_id').text(moviedetails[movieid]['id']);
	$('#movie_img').attr('src', moviedetails[movieid]['thumbnail']);
	$('#movie_img').show();
	if(getTabSelected() == 'newreleases_button')
	{
		$('#movie_dvdreleasedate_span').show();
		$('#buy_button').text('Buy Movie');
	}
	else
	{
		$('#movie_dvdreleasedate_span').hide();
		$('#buy_button').text('Buy Tickets');
	}
	//checkSubscribedToMovie(moviedetails[movieid]['id']);
	$('#movie').show();
	scrollToTop();
}
/* END GUI CONTROLS */

/* BEGIN APP HANDLERS */
function fakeClick(obj)
{
	var evt = document.createEvent('MouseEvents'); 
	evt.initMouseEvent('click', true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
	var allowDefault = document.getElementById(obj).dispatchEvent(evt);
}

function loadMovies(feed)
{
	if(checkNetworkConnection())
		getMovies(feed);
}

function checkNetworkConnection()
{
	if(!isDataEnabled())
	{
		showNotification('FlixAlert requires an active data connection!');
		return false;
	}
	else
	{
		return true;
	}
}

function isSubscribed(movieid)
{
	var moviesArr = subscribedmovies.split(',');
	var moviesIndex = $.inArray(movieid, moviesArr);
	if(moviesIndex > -1)
		return true;
	else
		return false;
}

function isTitleSubscribed(movietitle)
{
	var moviesArr = subscribedmovietitles.split(',');
	var moviesIndex = $.inArray(movietitle, moviesArr);
	if(moviesIndex > -1)
		return true;
	else
		return false;
}

function addSubscribedMovie(movieid)
{
	var moviesArr = subscribedmovies.split(',');
	moviesArr.push(movieid);
	subscribedmovies = moviesArr.join();
}

function removeSubscribedMovie(movieid)
{
	var moviesArr = subscribedmovies.split(',');
	var moviesIndex = $.inArray(movieid, moviesArr);
	if(moviesIndex > -1)
	{
		moviesArr.splice(moviesIndex, 1);
		subscribedmovies = moviesArr.join();
	}
}

function hideScreens()
{
	$('#settings').hide();
	$('#theaters').hide();
	$('#movie').hide();
	$('#movies').hide();
	$('#subscriptions').hide();
	$('#info').hide();
}

function getTabSelected()
{
	return $('td.currenttab').attr('id');
}

function setTabSelected(tab)
{
	$('#intheaters_button').removeClass('currenttab');
	$('#upcoming_button').removeClass('currenttab');
	$('#opening_button').removeClass('currenttab');
	$('#newreleases_button').removeClass('currenttab');
	$('#mysubscriptions_button').removeClass('currenttab');
	$('#'+tab).addClass('currenttab');
}

function showHome()
{
	$('#movies_list').html('loading movies list...<br />');
	$('#home').hide();
	currentScreen = 'movies';
	scrollToTop();
	$('#movies').show();
	setTabSelected('intheaters_button');
	loadMovies('T');
}

function showSettings()
{
	hideScreens();
	currentScreen = 'settings';
	scrollToTop();
	renderSettings();
	setTabSelected();
	$('#settings').show();
}

function showInfo()
{
	hideScreens();
	currentScreen = 'info';
	scrollToTop();
	setTabSelected();
	$('#info').show();
}

function showTheaters()
{
	hideScreens();
	currentScreen = 'theaters';
	scrollToTop();
	setTabSelected();
	$('#theaters').show();
	showClosestTheaterShowings();
}

function swipeLeft()
{
	if(currentScreen == 'movies')
	{
		switch(getTabSelected())
		{
			case 'upcoming_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				currentScreen = 'movies';
				setTabSelected('intheaters_button');
				loadMovies('T');
			break;
			case 'opening_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('upcoming_button');
				loadMovies('U');
			break;
			case 'newreleases_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('opening_button');
				loadMovies('O');
			break;
			case 'mysubscriptions_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('newreleases_button');
				loadMovies('D');
			break;
		}
	}
}

function swipeRight()
{
	if(currentScreen == 'movies')
	{
		switch(getTabSelected())
		{
			case 'intheaters_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('upcoming_button');
				loadMovies('U');
			break;
			case 'upcoming_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				currentScreen = 'movies';
				setTabSelected('opening_button');
				loadMovies('O');
			break;
			case 'opening_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('newreleases_button');
				loadMovies('D');
			break;
			case 'newreleases_button':
				$('#movies_list').html('loading movies list...<br />');
				hideScreens();
				scrollToTop();
				$('#movies').show();
				setTabSelected('mysubscriptions_button');
				loadMovies('M');
			break;
		}
	}
}

function goBack()
{
	if($('#longpressmenu').is(':visible'))
	{
		$('#longpressmenu').hide();
		return;
	}
	hideScreens();
	if(currentScreen != 'home')
		$('#'+currentScreen).hide();
	scrollToTop();
	switch(currentScreen)
	{
		case 'movie':
			currentScreen = 'movies';
			$('#movies').show();
			$('#movie_img').hide();
		break;
		case 'movies':
			if(getTabSelected() == 'intheaters_button')
				navigator.app.exitApp();
			else
				showHome();
		break;
		case 'settings':
			showHome();
		break;
		case 'info':
			showHome();
		break;
		case 'theaters':
			showHome();
			$('#theaters_list').html('<br />getting local theaters, please wait a few seconds...<br />');
		break;
		case 'subscriptions':
			showHome();
			$('#subscriptions_list').html('<br />getting my subscriptions...<br />');
		break;
		default:
			navigator.app.exitApp();
		break;
	}
}

function showNotification(msg)
{
	$('#notifications').html(msg);
	if(currentScreen == 'home')
		$('#notifications').show();
	else
		$('#notifications').show().delay(5000).fadeOut('slow');
}

function showLongPressMenu(movieid)
{
	var lpmovie = {};
	lpmovie.id = moviedetails[movieid]['id'];
	lpmovie.title = moviedetails[movieid]['title'];

	$('#lpmovieid').html(lpmovie.id);
	$('#lpmovietitle_text').html(lpmovie.title);

	if(getTabSelected() == "newreleases_button")
		$('#lpbuy_button').html("Buy Movie");
	else
		$('#lpbuy_button').html("Buy Tickets");

	if(isSubscribed(lpmovie.id))
	{
		$('#lpsubscribe_button').hide();
		$('#lpunsubscribe_button').show();
	}
	else
	{
		$('#lpunsubscribe_button').hide();
		$('#lpsubscribe_button').show();
	}

	$('#longpressmenu').show();
}

function clearNotifications()
{
	$('#notifications').html('');
	$('#notifications').hide();
}

function scrollToTop()
{
	$('#movie').scrollTop(0);
	$('#container').scrollTop(0);
	$('#movies').scrollTop(0);
	$('body').scrollTop(0);
	//$('#container div').scrollTop(0);
}
/* END APP HANDLERS */

/* BEGIN BACKEND CALLS */
function checkAccount()
{
	if(!checkNetworkConnection())
		return false;

	var registered = false;
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
		{Method: 'IsDeviceRegistered' , DeviceUUID: devuuid},
		function(txt) {
			registered = txt;
		}
	);

	return registered;
}

function checkNotifications()
{
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
			{Method: 'CheckNotifications' , DeviceUUID: devuuid},
			function(txt) {
				var response = '';
				var data = JSON.parse($(txt).find('string').text());
				var colMap = new Object();
				for(var i = 0; i < data.COLUMNS.length; i++) {
					colMap[data.COLUMNS[i]] = i;
				}
				for(var i = 0; i < data.DATA.length; i++) {
					response += data.DATA[i][colMap['NOTIFICATIONMESSAGE']] + '<br />';
				}
				if(response != '')
					showNotification(response);
			}
	);
	$.ajaxSetup({async:false});
}

function checkSubscribedToMovie(movieid)
{
	$('#subscribe_button').show();
	$('#subscribed_row').hide();

	if(isSubscribed(movieid))
	{
		$('#subscribe_button').hide();
		$('#subscribed_row').show();
		return true;
	}

	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	var subscribed = $.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
			{Method: 'CheckSubscribedToMovie' , DeviceUUID: devuuid , MovieID: movieid},
			function(txt) {
				if(txt == true)
				{
					$('#subscribe_button').hide();
					$('#subscribed_row').show();
				}
				return txt;
			}
	).responseText;
	
	return subscribed;
}

function subscribeMovie(movieid, movietitle)
{
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
			{Method: 'ScheduleMovie' , DeviceUUID: devuuid , MovieID: movieid , MovieTitle: movietitle},
			function(data) { /* do something */ },
			'json'
	);
	$.ajaxSetup({async:false});
	$('#subscribe_button').hide();
	$('#subscribed_row').show();
	addSubscribedMovie(movieid);
	$('#subscribed_'+movieid).removeClass('noshow');
}

function unsubscribeMovie(movieid)
{
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
			{Method: 'UnscheduleMovie' , DeviceUUID: devuuid , MovieID: movieid},
			function(data) { /* do something */ },
			'json'
	);
	$.ajaxSetup({async:false});
	$('#subscribed_row').hide();
	$('#subscribe_button').show();
	removeSubscribedMovie(movieid);
	$('#subscribed_'+movieid).addClass('noshow');
}

function setSubscribedMovies()
{
	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
		{Method: 'GetSubscribedMovies' , DeviceUUID: devuuid , MatchType: 'I'},
		function(txt) { subscribedmovies = txt; }
	);
}

function setSubscribedMovieTitles()
{
	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
		{Method: 'GetSubscribedMovies' , DeviceUUID: devuuid , MatchType: 'T'},
		function(txt) { subscribedmovietitles = txt; }
	);
}

function showSubscribedMovies()
{
	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.post('http://flixalerts.com/webservices/subscriptions.cfc?callback=?',
		{Method: 'GetSubscribedMovies' , DeviceUUID: devuuid , MatchType: 'B'},
		function(data) { 
			var colMap = new Object();
			for(var i = 0; i < data.COLUMNS.length; i++) {
				colMap[data.COLUMNS[i]] = i;
			}
			$('#subscriptions_list').html('');
			$.each(data.DATA, function(i,item) {
				$('#subscriptions_list').append('<div class="moviedetails centered static">'+item[colMap['MOVIETITLE']]+'</div>');
			});
		}
	);
}

function formatDate(datestr)
{
	var date = new Date(datestr);
	var d  = date.getDate();
	var day = (d < 10) ? '0' + d : d;
	var m = date.getMonth() + 1;
	var month = (m < 10) ? '0' + m : m;
	var yy = date.getYear();
	var year = (yy < 1000) ? yy + 1900 : yy;
	var parsedDate = month + "/" + day + "/" + year;
	return parsedDate;
}

function parseMovieFeed(movies, feed)
{
	var dateobj;
	var listings = '';
	$.each(movies, function(i,item) {
		moviedetails[i] = {};
		moviedetails[i]['id'] = item.id;
		moviedetails[i]['title'] = item.title;
		if(typeof item.release_dates.theater != 'undefined')
			moviedetails[i]['release_date'] = formatDate(item.release_dates.theater);
		else
			moviedetails[i]['release_date'] = "";
		if(typeof item.release_dates.dvd != 'undefined')
			moviedetails[i]['dvd_release_date'] = formatDate(item.release_dates.dvd);
		else
			moviedetails[i]['dvd_release_date'] = '';
		moviedetails[i]['ranking'] = item.ratings.audience_score;
		moviedetails[i]['mpaa_rating'] = item.mpaa_rating;
		moviedetails[i]['thumbnail'] = item.posters.profile;
		moviedetails[i]['icon'] = item.posters.thumbnail;
		moviedetails[i]['synopsis'] = item.synopsis;
		moviedetails[i]['runtime'] = item.runtime;
		moviedetails[i]['cast'] = '<ul>';
		$.each(item.abridged_cast, function(c, cast) {
			if(typeof cast.characters != "undefined")
				moviedetails[i]['cast'] = moviedetails[i]['cast'] + '<li>' + cast.name + ' as ' + cast.characters.toString().replace(/\,/g,', ') + '</li>';
			else
				moviedetails[i]['cast'] = moviedetails[i]['cast'] + '<li>' + cast.name + ' as ' + cast.characters + '</li>';
		});
		moviedetails[i]['cast'] = moviedetails[i]['cast'] + '</ul>';
		if(familyfilter == 'R' && moviedetails[i]['mpaa_rating'] == 'R')
		{
			// suppress movie due to rating filter
		}
		else
		{
			listings = listings + '<div id="movie-'+i+'" class="moviedetails justified" movieid="'+moviedetails[i]['id']+'">';
			listings = listings + '<table><tr><td><img src="' + moviedetails[i]['icon'] + '" class="icon"/></td>';
			listings = listings + '<td valign="top">';
			listings = listings + '<div class="list_title">' + moviedetails[i]['title'] + '</div>';
			if(feed == "M" || isSubscribed(moviedetails[i]['id']))
				listings = listings + ' <span id="subscribed_' + moviedetails[i]['id'] + '"><img src="img/checkmark.png" /></span>';
			else
				listings = listings + ' <span id="subscribed_' + moviedetails[i]['id'] + '" class="noshow"><img src="img/checkmark.png" /></span>';
			listings = listings + '<br /><span class="details">';
			listings = listings + '<b>' + moviedetails[i]['ranking'] + '%</b> | ';
			listings = listings + '<b>' + moviedetails[i]['mpaa_rating'] + '</b> | ';
			if(typeof item.release_dates.dvd != 'undefined')
				listings = listings + '<b>' + moviedetails[i]['dvd_release_date'] + '</b><br />';
			else
				listings = listings + '<b>' + moviedetails[i]['release_date'] + '</b><br />';
			listings = listings + moviedetails[i]['synopsis'].substring(0, 100) + '...<br />';
			listings = listings + '</span></td>';
			listings = listings + '</tr></table>';
			listings = listings + '</div>';
		}
	});
	$('#movies_list').html(listings);
}

function getMovies(feed, movietitle)
{
	setSubscribedMovies();

	if(feed != "M" && feed != "S" && typeof cache.movies[feed] != 'undefined')
	{
		parseMovieFeed(cache.movies[feed], feed);
		return;
	}

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post(moviefeed,
		{Method: 'GetMovies' , FeedType: feed , DeviceUUID: devuuid , MovieTitle: movietitle},
		function(data)
		{
			var movies = JSON.parse(data).movies;
			parseMovieFeed(movies, feed);
			if(feed != "M" && feed != "S")
				cache.movies[feed] = movies;
		}
	);
	$.ajaxSetup({async:false});
}

function findMovie()
{
	var search_criteria = prompt("Enter a movie title to search for:");
	if(search_criteria.length > 0)
	{
		$('#movies_list').html('loading movies list...<br />');
		hideScreens();
		currentScreen = 'movies';
		scrollToTop();
		setTabSelected();
		$('#movies').show();
		searchForMovie(search_criteria);
	}
}

function searchForMovie(search_criteria)
{
	setSubscribedMovies();
	getMovies('S', encodeURIComponent(search_criteria));
}

function showClosestTheaterShowings(zipcode)
{
	if(typeof zipcode == 'undefined' && localZip.length == 0)
	{
		setZipCode();
		return;
	}
	if(typeof zipcode != 'undefined')
	{
		localZip = zipcode;
	}
	setSubscribedMovieTitles();
	$.post('http://flixalerts.com/webservices/showtimes.cfc?callback=?',
		{Method: 'getClosestTheaterShowings' , ZipCode: localZip},
		function(data)
		{
			var movies = JSON.parse(data);
			$('#theaters_list').html('');
			$.each(movies.responseData.feed.entries, function(i,item) {
				var theaterdata = unescape(item.content);
				theaterdata = theaterdata.replace(/<li>/gi,'<div class="moviedetails centered">');
				theaterdata = theaterdata.replace(/<\/li>/gi,'</div>');
				theaterdata = theaterdata.replace(/<ul>/gi,'');
				theaterdata = theaterdata.replace(/<\/ul>/gi,'');
				theaterdata = theaterdata.replace(/<p>/gi,'');
				theaterdata = theaterdata.replace(/<\/p>/gi,'');
				$('#theaters_list').append('<b>'+item.title+'</b><br />'+theaterdata+'<br /><br />');
			});
			$('#theaters_list div').each(function(){
				if($(this).hasClass('moviedetails'))
				{
					var title = $(this).text();
					if(isTitleSubscribed(title))
						$(this).append(' <img src="img/checkmark.png" />');
				}
			});
		}
	);
	$('#theaters_list a').each(function(i, item){
		$(this).attr('target', '_blank');
	});
}

function getYouTubeID(url)
{
	var youtube_id = "";
	if(url.indexOf("youtube.com") >= 0)
	{
		var startOffset = url.indexOf(".com/v/");
		var endOffset = url.indexOf("&feature");
		youtube_id = url.substring(startOffset + 7, endOffset);
	}
	return youtube_id;
}

function loadTrailer(movietitle)
{
	showNotification('Loading trailer for '+movietitle+'...');
	$.ajaxSetup({async:false});
	$.post('http://flixalerts.com/webservices/trailer.cfc?callback=?',
		{Method: 'FindTrailer' , MovieTitle: movietitle , Provider: 'Y'},
		function(txt) {
			var trailer_url = unescape(txt);
			trailer_url = trailer_url.replace(/\\\//gi, "/");
			var ytid = getYouTubeID(trailer_url);
			if(ytid != "")
				$('#trailer_href').attr('href', 'http://m.youtube.com/watch?v=' + ytid);
			else
				$('#trailer_href').attr('href', 'http://flixalerts.com/trailer.cfm?Trailer=' + encodeURIComponent(trailer_url));
			fakeClick('trailer_href');
		}
	);
}

function registerDevice()
{
	if(!checkNetworkConnection())
		return false;

	var registered = false;
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
		{Method: 'RegisterDevice' , DeviceUUID: devuuid , Email: $('#email').val() , Password: $('#password').val()},
		function(txt) { 
			showNotification(txt);
			renderSettings();
		}
	);
	$.ajaxSetup({async:false});
}

function checkFamilyFilter()
{
	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:true});
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
		{Method: 'CheckFamilyFilter' , DeviceUUID: devuuid},
		function(txt) { familyfilter = txt; }
	);
	$.ajaxSetup({async:false});
}

function loadAccountSettings()
{
	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	$.ajaxSetup({async:false});
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
		{Method: 'LookupAccountSettings' , DeviceUUID: devuuid , Password: $('#verifypassword').val()},
		function(txt) {
			var response = '';
			var data = JSON.parse($(txt).find('string').text());
			if(data == false)
			{
				showNotification('Incorrect account password!');
				return;
			}
			var colMap = new Object();
			for(var i = 0; i < data.COLUMNS.length; i++) {
				colMap[data.COLUMNS[i]] = i;
			}
			$('#accountemail').val(data.DATA[0][colMap['EMAIL']]);
			$('#phonenumber').val(data.DATA[0][colMap['PHONENUMBER']]);
			if(data.DATA[0][colMap['INAPPNOTIFICATION']] == 1)
				$('#inappnotification').attr('checked','checked');
			else
				$('#inappnotification').removeAttr('checked');
			if(data.DATA[0][colMap['EMAILNOTIFICATION']] == 1)
				$('#emailnotification').attr('checked','checked');
			else
				$('#emailnotification').removeAttr('checked');
			if(data.DATA[0][colMap['SMSNOTIFICATION']] == 1)
				$('#smsnotification').attr('checked','checked');
			else
				$('#smsnotification').removeAttr('checked');
			if(data.DATA[0][colMap['RATINGFILTER']] == 'R')
				$('#ratingfilter').attr('checked','checked');
			else
				$('#ratingfilter').removeAttr('checked');
			if(data.DATA[0][colMap['NETFLIXNOTIFICATION']] == 1)
				$('#netflixnotification').attr('checked','checked');
			else
				$('#netflixnotification').removeAttr('checked');
			if(data.DATA[0][colMap['RELEASEDAYNOTIFY']] == 1)
				$('#releasedaynotify').attr('checked','checked');
			else
				$('#releasedaynotify').removeAttr('checked');
			$('#daysbeforereleasenotify').val(Number(data.DATA[0][colMap['DAYSBEFORERELEASENOTIFY']]));
			$('#settings_form').hide();
			$('#verify_form').hide();
			$('#account_form').show();
		}
	);
	$.ajaxSetup({async:false});
}

function saveAccountSettings()
{
	if(!checkNetworkConnection())
		return false;

	if(typeof deviceInfo == 'undefined' || typeof deviceInfo['uuid'] == 'undefined')
		var devuuid = 'unknown';
	else
		var devuuid = deviceInfo['uuid'];
	if($('#inappnotification').is(':checked'))
		var inappnotify = 1;
	else
		var inappnotify = 0;
	if($('#emailnotification').is(':checked'))
		var emailnotify = 1;
	else
		var emailnotify = 0;
	if($('#smsnotification').is(':checked'))
		var smsnotify = 1;
	else
		var smsnotify = 0;
	if($('#ratingfilter').is(':checked'))
		var ratingfilter = 'R';
	else
		var ratingfilter = '';
	if($('#netflixnotification').is(':checked'))
		var netflixnotify = 1;
	else
		var netflixnotify = 0;
	if($('#releasedaynotify').is(':checked'))
		var releasenotify = 1;
	else
		var releasenotify = 0;
	$.ajaxSetup({async:false});
	$.post('http://flixalerts.com/webservices/account.cfc?callback=?',
		{Method: 'SaveAccountSettings',
		DeviceUUID: devuuid,
		Password: $('#verifypassword').val(),
		Email: $('#accountemail').val(),
		PhoneNumber: $('#phonenumber').val(),
		InAppNotification: inappnotify,
		EmailNotification: emailnotify,
		SMSNotification: smsnotify,
		RatingFilter: ratingfilter,
		NetFlixNotification: netflixnotify,
		DaysBeforeReleaseNotify: Number($('#daysbeforereleasenotify').val()),
		ReleaseDayNotify: releasenotify},
		function(txt) { showNotification('Settings saved!'); }
	);
	$.ajaxSetup({async:false});
	cache.movies = {};
	familyfilter = ratingfilter;
}

function setFandangoZipCode()
{
	setZipCode();
	$.get('http://www.dpbolvw.net/interactive?amid=&CCODE=&searchby=&a=&srce=&dte=0&wss=CJAFFILIATE&aid=10416295&pid=5473365&location='+zipcode+'&url='+encodeURIComponent('http://www.fandango.com/redirect.aspx?'));
}

function showZipCodeFailed()
{
	$('#theaters_list').html('<center>Unable to get your current location. Please enter your zip code to continue:<br /><br /><input type="text" id="enteredzip"/><br /><br /><div id="setzipcode_button" class="app_button" onclick="showClosestTheaterShowings($(\'#enteredzip\').val());">Continue</div></center>');
}

function setZipCode()
{
	var options = { maximumAge: 10000, timeout: 10000, enableHighAccuracy: true };

	navigator.geolocation.getCurrentPosition(function (position) {
			var geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			geocoder.geocode({'latLng': latlng}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK)
				{
					if (results[0])
					{
						localZip = results[0].address_components[6].short_name;
						showClosestTheaterShowings(localZip);
					}
					else
						showZipCodeFailed();
				}
				else
					showZipCodeFailed();
			});
		}, 
		showZipCodeFailed,
		options
	);
}
/* END BACKEND CALLS */
