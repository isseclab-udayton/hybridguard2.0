function getTargetElement(event) {
	return document.elementFromPoint(event.targetTouches[0].clientX, event.targetTouches[0].clientY);
	//return event.target;
}

function noClick(e) {
	if (!e) var e = window.event
	e.cancelBubble = true;
	if (e.stopPropagation) e.stopPropagation();
}

var touchStartTime;
var touchEndTime;
var lpMoved = false;
var touchElem;
var touchTarget;
var startX = 0;
var startY = 0;
var currentX = 0;
var currentY = 0;
var savedClickHandler;

window.addEventListener('touchstart',function(event) {
	//event.preventDefault();
	touchStartTime = new Date().getTime();
	startX = event.targetTouches[0].clientX;
	startY = event.targetTouches[0].clientY;
	lpMoved = false;
	touchElem = getTargetElement(event);
	if(touchElem.nodeType == 3)
		touchElem = touchElem.parentNode;
	savedClickHandler = touchElem.onclick;
	touchTarget = touchElem;
	touchElem.onclick = noClick;
},false);

window.addEventListener('touchmove',function(event) {
	currentX = event.touches[0].clientX;
	currentY = event.touches[0].clientY;
	var dx = Number(startX) - Number(currentX);
	var dy = Number(startY) - Number(currentY);
	if(Math.abs(Number(dx)) >= 10 && Math.abs(Number(dy)) <= 10)
		event.preventDefault();
	lpMoved = true;
	touchTarget = getTargetElement(event);
	if(touchTarget.nodeType == 3)
		touchTarget = touchTarget.parentNode;
},false);

window.addEventListener('touchend',function(event) {
	currentX = event.changedTouches[0].clientX;
	currentY = event.changedTouches[0].clientY;
	var dx = Number(startX) - Number(currentX);
	var dy = Number(startY) - Number(currentY);
	var swiped = false;
	if(Math.abs(Number(dx)) >= 50)
	{
		swiped = true;
		if(Number(dx) > 0)
			swipeRight();
		else
			swipeLeft();
	}
	event.preventDefault();
	touchEndTime = new Date().getTime();
	var touchDiv = $(touchElem).closest('div');
	if(!lpMoved && (touchEndTime-touchStartTime) > 1500)
	{
		event.returnValue = false;
		if($(touchElem).hasClass('moviedetails') || $(touchDiv).hasClass('moviedetails'))
		{
			var movieid = $(touchDiv).attr('id').replace('movie-', '');
			showLongPressMenu(movieid);
		}
	}
	else if (!lpMoved && !swiped)
	{
		touchElem.onclick = savedClickHandler;
		if($(touchElem).hasClass('moviedetails'))
		{
			var elem = $(touchElem).attr('id');
			showMovieDetails(elem.replace('movie-', ''));
		}
		else if($(touchDiv).hasClass('moviedetails'))
		{
			var elem = $(touchDiv).attr('id');
			showMovieDetails(elem.replace('movie-', ''));
		}
		else if($(touchElem).hasClass('refresh'))
			checkNotifications();
		else if($(touchElem).attr('id') == 'find_button')
			findMovie();
		else if($(touchElem).attr('id') == 'subscribe_button')
			subscribeMovie($('#movie_id').text(), $('#movie_title').text());
		else if($(touchElem).attr('id') == 'unsubscribe_button')
			unsubscribeMovie($('#movie_id').text());
		else if($(touchElem).hasClass('goback'))
			goBack();
		else if($(touchElem).attr('id') == 'settings_button')
			showSettings();
		else if($(touchElem).attr('id') == 'info_button')
			showInfo();
		else if($(touchElem).attr('id') == 'theaters_button')
			showTheaters();
		else if($(touchElem).attr('id') == 'register_button')
			registerDevice();
		else if($(touchElem).attr('id') == 'verify_button')
			loadAccountSettings();
		else if($(touchElem).attr('id') == 'savesettings_button')
			saveAccountSettings();
		else if($(touchElem).attr('id') == 'trailer_button')
			loadTrailer($('#movie_title').text());
		else if($(touchElem).attr('id') == 'buy_button')
		{
			if($('#buy_button').text() == 'Buy Movie')
				buyHandler('movie', $('#movie_title').text());
			else
				buyHandler('tickets', $('#movie_title').text());
		}
	}
	else if(touchTarget == touchElem) {
		touchElem.onclick = null;
		//var theEvent = document.createEvent('MouseEvents');
		//theEvent.initEvent('click', true, true);
		//touchElem.dispatchEvent(theEvent);
	}
	touchElem = undefined;
	touchTarget = undefined;
},false);
