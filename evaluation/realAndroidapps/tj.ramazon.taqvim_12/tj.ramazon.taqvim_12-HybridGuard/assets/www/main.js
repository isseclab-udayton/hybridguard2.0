/**
 * Cordova v4.3.0
 * http://www.apache.org/licenses/LICENSE-2.0
 */

var beep = function() {
    navigator.notification.beep(2);
};

var vibrate = function() {
    navigator.vibrate(1000);
};

/**
 * INTERESTING PART STARTS HERE!!
 */


var geocoder;
var locationTimer;
var fastingInterval;
var tzOffset = 'auto';
var dst = 'auto';
prayTimes.setMethod('Jafari');
prayTimes.tune({'maghrib': -10, 'dhuhr': 38, 'asr': 30});
prayTimes.adjust({'asr': 'Hanafi'});

function init() {
	document.addEventListener("deviceready", onDeviceReady, false);
	geocoder = new google.maps.Geocoder();
	resolvePosition();
	$('#location').on('tap',function(){
		localStorage.clear();
		clearTimeout(locationTimer);
		clearInterval(fastingInterval);
		resolvePosition();	    
	});
}

/**
 * RAMADAN MOBILE Code Procedure
 * Below list of functions are main part of the app
 */
function onDeviceReady() {
	console.log("Cordova is ready! Yay!");
	document.addEventListener("backbutton", onBackKeyDown, false);
}

/* Declaration of variables  */
var lang, getCity, getSound, getVibra;	// Settings
localStorage.setItem("sound", "1");		// Sound 'On' default
localStorage.setItem("vibra", "0");		// Vibration 'Off' default

// formatted date dd-mm-yyyy
var currDate = new Date();
var _position = localStorage.getItem("position")
var getPosition = JSON.parse(_position);

var digits = [ '&\#1633;','&\#1634;','&\#1635;','&\#1636;', '&\#1637;',
               '&\#1638;','&\#1639;','&\#1640;','&\#1641;','&\#1633;&\#1632;',
               '&\#1633;&\#1633;','&\#1633;&\#1634;','&\#1633;&\#1635;',
               '&\#1633;&\#1636;','&\#1633;&\#1637;','&\#1633;&\#1638;',
               '&\#1633;&\#1639;','&\#1633;&\#1640;','&\#1633;&\#1641;',
               '&\#1634;&\#1632;','&\#1634;&\#1633;','&\#1634;&\#1634;',
               '&\#1634;&\#1635;','&\#1634;&\#1636;','&\#1634;&\#1637;',
               '&\#1634;&\#1638;','&\#1634;&\#1639;','&\#1634;&\#1640;',
               '&\#1634;&\#1641;','&\#1635;&\#1632;','&\#1635;&\#1633;',
               '&\#1635;&\#1634;','&\#1635;&\#1635;' ];

var ayatulkursi = '<b>Оят-Ул-Курси</b><br/>Аллоҳу ло илоҳа иллоҳу ал ҳайюл қайюм, ло таъузуҳу синатув вало навм. ' +
                  'Лаҳу мо фис самовоти вамо фил арз. Манзаллазӣ яшфаъу ъиндаҳу илло биизниҳ, ' +
                  'яъламу мо байна айдиҳим ва мо халфаҳум ва ло юҳитуна бишайъим мин ъилмиҳи илло ' +
                  'бимошоъ. Васиъа курсийюҳус самовоти вал арз ва ло яхудуҳу хифзиҳумо ва ҳувал ъалиюл аъзим.';

function underConstruct() {
	if(lang = 'tj') {
		navigator.notification.alert("Дар тавсирҳои оянда дастрас хоҳад шуд.", function(){}, "Маълумот");
	} else {
		navigator.notification.alert("Будет доступно в будущих версиях.", function(){}, "Инфо");
	}
}

/* Statusbar Notifications */
function timeCompare(position) {
	var currentDate = new Date();
	var times = prayTimes.getTimes(currentDate, [position.coords.latitude, position.coords.longitude], tzOffset, dst);
	// convert current time to String
	var currTime = ('0' + currentDate.getHours()).slice(-2) + ':' +('0' + currentDate.getMinutes()).slice(-2);
	// notification procedure
	console.log("time: ", currTime, " suhur: ", times['fajr']);
	if (currTime == times['fajr']) {
		// Sahari Message
		//window.plugins.statusBarNotification.notify("Вақти саҳарӣ расид", "Хӯрдани таомро ба охир расонед ва дуои саҳариро хонед!");
		cordova.plugins.notification.local.schedule({
			id: 1,
			title: "Вақти саҳарӣ расид",
			text: "Хӯрдани таомро ба охир расонед ва дуои саҳариро хонед!",
			sound: "file://al_huda.mp3",
			icon: "file://img/hands.png"
		});
		if (getVibra == '1') vibrate();
		if (getSound == '1') beep();
	}
	console.log("time: ", currTime, " iftor: ", times['sunset']);
	if (currTime == times['sunset']) {
		// Iftor Message
		//window.plugins.statusBarNotification.notify("Вақти ифтор расид", "Дуои ифторро хонед ва ба хӯрдани таом шурӯъ кунед!");
		cordova.plugins.notification.local.schedule({
			id: 2,
			title: "Вақти ифтор расид",
			text: "Дуои ифторро хонед ва ба хӯрдани таом шурӯъ кунед!",
			sound: "file://al_huda.mp3",
			icon: "file://img/hands.png"
		});
		if (getVibra == '1') vibrate();
		if (getSound == '1') beep();
	}
}

/* Taqvim: MenuButton procedure */
function taqvimList() {
	getCity = '02';
	$.getJSON('allData.json', function(data) {
		if (data != '' || data != undefined) {
			
			var addTohtml = '';
			for (var i = 0; i < data.length; i++) {
				addTohtml += '<tr>';
				addTohtml += '<td>' +data[i].date_g+ '<br />' +data[i].date_i+ '</td>';
				
				switch(getCity) {
				case '01':	addTohtml += '<td>' +data[i].sahar_1+ '</td>';
							addTohtml += '<td>' +data[i].iftor_1+ '</td>';
					break;
				case '02':	addTohtml += '<td>' +data[i].sahar_2+ '</td>';
							addTohtml += '<td>' +data[i].iftor_2+ '</td>';
					break;
				case '03':	addTohtml += '<td>' +data[i].sahar_3+ '</td>';
							addTohtml += '<td>' +data[i].iftor_3+ '</td>';
					break;
				case '04':	addTohtml += '<td>' +data[i].sahar_4+ '</td>';
							addTohtml += '<td>' +data[i].iftor_4+ '</td>';
					break;
				}
				addTohtml += '</tr>';
			}
			$('#jsonTbl').html(addTohtml);
			
		} else {navigator.notification.alert("Database is undefined or empty!", function(){}, "Error");}
	});
}

/* Tasbih procedure */
function runTasbih(option){
	$('#ayatalkursi').html(ayatulkursi);
	var i = 0;
	var round = 1;
	if(option == "reset") {
		$('#ayatalkursi').html(ayatulkursi);
		$('#counter').empty();
	}
	
	var resolveRound = function() {
		if (round == 1){
			$('#ayatalkursi').html('Субҳоналлоҳ');
			$('#counter').html(digits[i]);
		} else if(round == 2){
			$('#ayatalkursi').html('Алҳамдулиллоҳ');
			$('#counter').html(digits[i]);
		} else if(round == 3){
			$('#ayatalkursi').html('Аллоҳу Акбар');
			$('#counter').html(digits[i]);
		} else {
			$('#ayatalkursi').html('Зикр ба охир расид!');
			$('#counter').html("");
		}
		if(i == 32){
	    	i = -1;
	    	round++;
	    }		
	}
	
	$('#ayatalkursi').on('tap',function(){
	    resolveRound();
	    i++;
	});
	//
	$('#counter').on('tap',function(){
	    resolveRound();
	    i++;
	});
	// 
	$('#counter').on('swiperight',function(){
		if(i > 0){
			i--;
		}
	    resolveRound();
	});
}

/* Save changes of Preferences */
function savePrefs() {
	var form = $("#prefsForm");
	var setS = $("#sound", form).val();
	var setV = $("#vibration", form).val();
	// delete previous values
	localStorage.removeItem("sound");
	localStorage.removeItem("vibra");
	// set new values
	localStorage.setItem("sound", ""+setS+"");
	localStorage.setItem("vibra", ""+setV+"");
}

getSound = localStorage.getItem("sound");
getVibra = localStorage.getItem("vibra");

/* Load Preferences */
function loadPrefs() {
	var form = $("#settingsForm");
	if(getSound != undefined && getVibra != undefined) {
		console.log("Settings values are loaded!");
		
		if(getSound == '1') {
			document.getElementById('sound').options[1].selected = true;
		}
		if(getVibra == '1') {
			document.getElementById('vibration').options[1].selected = true;
		}
		
	} else {console.log("Setting's values are 'undefined'!");}
}

/* App link to the GooglePlay */
function rateTheApp() {
    if(device.platform == 'Android') {
        window.open('https://play.google.com/store/apps/details?id=tj.ramazon.taqvim', '_system');
    } else {
        // window.open('https://itunes.apple.com/at/app/mramadan/id000000000?l=en&mt=8', '_system');
    }
}

/* On backButton click App exit */
function onBackKeyDown() {
	if($.mobile.activePage.is('#mainPage')) {
		navigator.app.exitApp();		// App exit when the current page is initialPage
	} else {
		navigator.app.backHistory();	// Go back in history in any other case
	}
}

/* PrayTime Handler */
function getSehrTime(position){
	var times = prayTimes.getTimes(currDate, [position.coords.latitude, position.coords.longitude], tzOffset, dst);
	$('#sahari').text(times["fajr"]);
}

function getIftarTime(position){
	var times = prayTimes.getTimes(currDate, [position.coords.latitude, position.coords.longitude], tzOffset, dst);
	$('#iftor').text(times["maghrib"]);
}/* End prayTime Handler */

function formatDate(localization, date, format) {
	var _date = "";

	if(localization == 'tj') {
		var months = ['Январ','Феврал','Март','Апрел','Май','Июн','Июл','Август','Сентябр','Октябр','Ноябр','Декабр'];
		var day = date.getDate();
		var month = date.getMonth();
		var year = date.getFullYear();
		_date = ('0' + day).slice(-2) + ' ' + months[month]  + ' ' + year;
	}

	return _date;
}

/* Taqvim: MenuButton procedure */
function fastingTable(position) {
	var dateIterator = new Date();
	dateIterator.setFullYear(2016,5,6); //TODO create the table of starting date for Ramadan month accroding to year
	var week = ['Якшанбе','Душанбе','Сешанбе','Чоршанбе','Панҷшанбе','Ҷумъа','Шанбе'];

	var addTohtml = '';
	for(var i = 0; i < 30; i++){
		addTohtml += '<tr>';
		var times = prayTimes.getTimes(dateIterator, [position.coords.latitude, position.coords.longitude], tzOffset, dst);
		var weekDay = dateIterator.getDay();

		addTohtml += '<td>' + formatDate('tj', dateIterator) + '<br/>' + (week[weekDay] + ', ' + (i+1) + '. 9 1436') + '</td>';
		addTohtml += '<td>' + times['fajr'] + '</td>';
		addTohtml += '<td>' + times['maghrib'] + '</td>';
		addTohtml += '</tr>';
		dateIterator.setDate( dateIterator.getDate() + 1 );
	}
	$('#jsonTbl').html(addTohtml);
} /* End Taqvim: MenuButton procedure */

/* Payer TimeTable */
function prayerTimeTable(position){
	var list = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
	var times = prayTimes.getTimes(currDate, [position.coords.latitude, position.coords.longitude], tzOffset, dst);
	for(var i in list)	{
		$('#'+list[i].toLowerCase()).text(times[list[i].toLowerCase()]);
	}
}/* End Payer TimeTable */

/* Position Handler */
function resolvePosition() {
	if(!!getPosition) {
		var position = getPosition;
		resetTimers(position);
	} else {
		navigator.geolocation.getCurrentPosition(
			function(position) {
				var position = {
					coords: {
						latitude: position.coords.latitude,
						longitude: position.coords.longitude
					}
				};
				resetTimers(position);
				localStorage.setItem("position", JSON.stringify(position));
			},
			function(){
				alert('Error getting location');
			}
		);
	}
}/* End Position Handler */

/* Reset timers */
function resetTimers(position) {
	timeCompare(position);
	fastingTable(position);
	prayerTimeTable(position);
	getIftarTime(position);
	getSehrTime(position);
	fastingInterval = setInterval(function(){timeCompare(position)},60000);
	locationTimer = setTimeout(function(){localStorage.clear()},21600000);
	codeLatLng(position.coords.latitude, position.coords.longitude)
	//codeLatLng(40.2825600, 69.6221600) //Худжанд
}/* End Reste timers */

function codeLatLng(lat, lng) {

	var latlng = new google.maps.LatLng(lat, lng);
	geocoder.geocode({'latLng': latlng}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			console.log(results)
			if (results[1]) {
				//formatted address
				//alert(results[0].formatted_address)
				$('#location').html(results[0].formatted_address);
				//find country name
				for (var i=0; i<results[0].address_components.length; i++) {
					for (var b=0;b<results[0].address_components[i].types.length;b++) {

						//there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
						if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
							//this is the object you are looking for
							city= results[0].address_components[i];
							break;
						}
					}
				}
				//city data
				//alert(city.short_name + " " + city.long_name)


			} else {
				//alert("No results found");
			}
		} else {
			//alert("Geocoder failed due to: " + status);
		}
	});
}


