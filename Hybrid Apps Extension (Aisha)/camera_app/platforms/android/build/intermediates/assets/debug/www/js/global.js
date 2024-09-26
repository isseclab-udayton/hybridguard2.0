document.addEventListener("deviceready", onDeviceReady13, false);
function onDeviceReady13() 
{
	document.getElementById("preflang").addEventListener("click", getPrefLang);
	document.getElementById("getlocale").addEventListener("click", getLocale);
	document.getElementById("getDate").addEventListener("click", getDate);
	document.getElementById("daySave").addEventListener("click", daySave);
	function getPrefLang() 
	{
		navigator.globalization.getPreferredLanguage(prefLangSucc, prefLangFail);
	}
	function prefLangSucc(language)
	{
		console.log('language: ' + language.value + '\n');
		alert('language: ' + language.value + '\n');
	}
	function prefLangFail()
	{
		console.log('Error getting language\n');
		alert('Error getting language\n');
	}
	function getLocale()
	{
		navigator.globalization.getLocaleName(
    		function (locale) {console.log('locale: ' + locale.value + '\n'); alert('locale: ' + locale.value + '\n');},
    		function () {console.log('Error getting locale\n'); alert('Error getting locale\n');}
		);
	}
	function getDate()
	{
		navigator.globalization.dateToString(
    		new Date(),
    		function (date) {console.log('date: ' + date.value + '\n'); alert('date: ' + date.value + '\n'); },
    		function () {console.log('Error getting dateString\n'); alert('Error getting dateString\n'); },
    		{ formatLength: 'short', selector: 'date and time' }
		);
	}
	function daySave()
	{
		navigator.globalization.isDayLightSavingsTime(
    		new Date(),
    		function (date) {console.logalert('dst: ' + date.dst + '\n'); alert('dst: ' + date.dst + '\n');},
    		function () {console.log('Error getting names\n'); alert('Error getting names\n');}
		);
	}
}