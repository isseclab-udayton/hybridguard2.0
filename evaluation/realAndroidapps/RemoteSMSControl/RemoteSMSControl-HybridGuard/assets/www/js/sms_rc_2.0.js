////////////////////////////////
//   sms_rc_pro_1.0 JavaScript    //
//                            //
//   copyright Eric Vogels    //
////////////////////////////////

//	AndroidManifest add-ons
//
//	In androidmanifest. Single instance
//      android:launchMode="singleTop"   

////////////////////////////////////////////////////////////////////////////////////////

//var show_banner="hideBanner";
var show_banner="showBanner";

var s_t_t = null;
var b_t = null;

var show_tasks_TimeOut = 5000.0;

var ScrollPos = 60.0;

var picturesize
var boxsize
var pincode

var device1 
var color1 
var phone1 = "x"
var device1task1 
var d1t1cr 
var message1_1 
var device1task2 
var d1t2cr 
var message1_2 
var device1task3 
var d1t3cr 
var message1_3 
var device1task4 
var d1t4cr 
var message1_4 
var device1task5 
var d1t5cr 
var message1_5 
var device1task6 
var message1_6 
	
var device2 
var color2 
var phone2 
var device2task1 
var d2t1cr 
var message2_1 
var device2task2 
var d2t2cr 
var message2_2 
var device2task3 
var d2t3cr 
var message2_3 
var device2task4 
var d2t4cr 
var message2_4 
var device2task5 
var d2t5cr 
var message2_5 
var device2task6 
var message2_6 
	
var device3 
var color3 
var phone3 
var device3task1 
var d3t1cr 
var message3_1 
var device3task2 
var d3t2cr 
var message3_2 
var device3task3 
var d3t3cr 
var message3_3 
var device3task4 
var d3t4cr 
var message3_4 
var device3task5 
var d3t5cr 
var message3_5 
var device3task6 
var message3_6 
	
var device4 
var color4 
var phone4 
var device4task1 
var d4t1cr 
var message4_1 
var device4task2 
var d4t2cr 
var message4_2 
var device4task3 
var d4t3cr 
var message4_3 
var device4task4 
var d4t4cr 
var message4_4 
var device4task5 
var d4t5cr 
var message4_5 
var device4task6 
var message4_6 
	
var device5 
var color5 
var phone5 
var device5task1 
var d5t1cr 
var message5_1 
var device5task2 
var d5t2cr 
var message5_2 
var device5task3 
var d5t3cr 
var message5_3 
var device5task4 
var d5t4cr 
var message5_4 
var device5task5 
var d5t5cr 
var message5_5 
var device5task6 
var message5_6 
	
var device6 
var color6 
var phone6 
var device6task1 
var d6t1cr 
var message6_1 
var device6task2
var d6t2cr 
var message6_2 
var device6task3
var d6t3cr 
var message6_3 
var device6task4
var d6t4cr 
var message6_4 
var device6task5
var d6t5cr 
var message6_5
var device6task6
var message6_6

var device7 
var color7 
var phone7 
var device7task1 
var d7t1cr 
var message7_1 
var device7task2
var d7t2cr 
var message7_2 
var device7task3
var d7t3cr 
var message7_3 
var device7task4
var d7t4cr 
var message7_4 
var device7task5
var d7t5cr 
var message7_5
var device7task6
var message7_6

var device8 
var color8 
var phone8 
var device8task1 
var d8t1cr 
var message8_1 
var device8task2
var d8t2cr 
var message8_2 
var device8task3
var d8t3cr 
var message8_3 
var device8task4
var d8t4cr 
var message8_4 
var device8task5
var d8t5cr 
var message8_5
var device8task6
var message8_6

var device9 
var color9 
var phone9 
var device9task1 
var d9t1cr 
var message9_1 
var device9task2
var d9t2cr 
var message9_2 
var device9task3
var d9t3cr 
var message9_3 
var device9task4
var d9t4cr 
var message9_4 
var device9task5
var d9t5cr 
var message9_5
var device9task6
var message9_6

var device10 
var color10 
var phone10 
var device10task1 
var d10t1cr 
var message10_1 
var device10task2 
var d10t2cr 
var message10_2 
var device10task3 
var d10t3cr 
var message10_3 
var device10task4 
var d10t4cr 
var message10_4 
var device10task5 
var d10t5cr 
var message10_5 
var device10task6 
var message10_6 

$.fn.blink = function(options) {    
    var settings = $.extend( {'speed' : 800}, options);     
    var elem = $(this);
    setInterval(function() {
        if (!elem.is(':visible')) {
            elem.show();
        } else {
            elem.hide();
        }    
    }, settings.speed);     
}   


 $(window).scroll(function(){
       $("#divMenuYN")
      .stop()
      .animate({"marginTop": ($(window).scrollTop() + 0) + "px"}, "fast" );
	});

function fInit(){

    if(navigator.userAgent.toLowerCase().match(/android|iphone|ipad/)) {
        document.addEventListener("deviceready", onDeviceReady, false);
    }else{
        // This is not a phone
        if(navigator.userAgent.toLowerCase().match(/mozilla/)) {
            document.getElementById("OuterTable").width=300;
            onDeviceReady();
        }
    }
	  
}

function onDeviceReady() {

    if(navigator.userAgent.toLowerCase().match(/iphone|ipad/)) {
		document.getElementById("divAdPlaceholder").style.display = ''
	}
    if (userAgent.match(/iphone|ipad/)) {
        callSwitcher(hide_banner);
    }

	document.addEventListener("menubutton", onMenuKeyDown, false);
	document.addEventListener("backbutton", onBackKeyDown, false); 
	
    if(navigator.userAgent.toLowerCase().match(/android|iphone|ipad/)) {
        if(navigator.userAgent.toLowerCase().match(/android/)){
            try{
                smsplugin.startReception(function(e){
                    var msgArray = e.split(">");
                                         
                    try{
                        fCloseSmsBoxes();
                                         
                                         var SmsFromDevice=fDeviceFromSmsNr(msgArray[0]);
                                         if (SmsFromDevice>0) {
                                         fShowSms(SmsFromDevice,"Response: <br>" + msgArray[1]);
                                         fClearShowTaskTimeout();
                                         
                                         s_t_t = setTimeout("fHideTasks()",show_tasks_TimeOut); // hide tasks after x seconds
                                         
                                         }
                                         
                                         }catch(msg){console.log(msg);}
                                         
                                         }, function(ee){console.log(ee);})
            }catch(eee){console.log(eee);}
        }
		fReadSettings();
	}else{
		// This is not a phone
	  	if(navigator.userAgent.toLowerCase().match(/mozilla/)) {
			var xml = '<?xml version="1.0" encoding="UTF-8"?><device1>Sample. Use setup.</device1><color1>#0099cc</color1><phone1>1234567</phone1><device1task1>Task description</device1task1><message1_1>Test command</message1_1>';
			fPrepareGui(xml);
	  	}
	  }

}

function onMenuKeyDown() {    // Start Setup
	if (document.getElementById("helparea").style.display == 'none') {
		fSetupOpen();
	} else {
		fCloseHelp();	
	}
}

function onBackKeyDown() {    // Backup (or end)
	if (document.getElementById("helparea").style.display == 'none') {
		if (document.getElementById("divSetupDeviceButtons").style.display == '') {
			fSetupCancel();
		} else {
			navigator.app.exitApp();
			return false;
		}
	} else {
		fCloseHelp();	
	}
}

function fShowHelp(){
	document.getElementById("apparea").style.display = 'none';
	document.body.style.backgroundColor="white"
	document.getElementById("helparea").style.display = '';
}

function fCloseHelp(){
	document.getElementById("helparea").style.display = 'none';
	document.body.style.backgroundColor="#616161"
	document.getElementById("apparea").style.display = '';
}


function callSwitcher(action)	{ 		 
	Switcher.switchAd( nativePluginResultHandler, nativePluginErrorHandler, action );
}     
	
function nativePluginResultHandler (result)  { 
}

function nativePluginErrorHandler (error)  { 
} 

function fCloseSmsBoxes(){

	document.getElementById("divDev1ReturnSMS").style.display = 'none';
	document.getElementById("divDev2ReturnSMS").style.display = 'none';
	document.getElementById("divDev3ReturnSMS").style.display = 'none';
	document.getElementById("divDev4ReturnSMS").style.display = 'none';
	document.getElementById("divDev5ReturnSMS").style.display = 'none';
	document.getElementById("divDev6ReturnSMS").style.display = 'none';
	document.getElementById("divDev7ReturnSMS").style.display = 'none';
	document.getElementById("divDev8ReturnSMS").style.display = 'none';
	document.getElementById("divDev9ReturnSMS").style.display = 'none';
	document.getElementById("divDev10ReturnSMS").style.display = 'none';

}

function fDeviceFromSmsNr(Sms){
	if (phone1) {
		if (fCompareNumbers(Sms,phone1)) {
			return 1;
		}
	}
	if (phone2) {
		if (fCompareNumbers(Sms,phone2)) {
			return 2;
		}
	}
	if (phone3) {
		if (fCompareNumbers(Sms,phone3)) {
			return 3;
		}
	}
	if (phone4) {
		if (fCompareNumbers(Sms,phone4)) {
			return 4;
		}
	}
	if (phone5) {
		if (fCompareNumbers(Sms,phone5)) {
			return 5;
		}
	}
	if (phone6) {
		if (fCompareNumbers(Sms,phone6)) {
			return 6;
		}
	}
	if (phone7) {
		if (fCompareNumbers(Sms,phone7)) {
			return 7;
		}
	}
	if (phone8) {
		if (fCompareNumbers(Sms,phone8)) {
			return 8;
		}
	}
	if (phone9) {
		if (fCompareNumbers(Sms,phone9)) {
			return 9;
		}
	}
	if (phone10) {
		if (fCompareNumbers(Sms,phone10)) {
			return 10;
		}
	}
	return 0; // no device	
}

function fTaskFromDevice(Device,Message){
	if (Device==1) {
		if (Message==message1_1){
			return device1task1;
		}
		if (Message==message1_2){
			return device1task2;
		}
		if (Message==message1_3){
			return device1task3;
		}
		if (Message==message1_4){
			return device1task4;
		}
		if (Message==message1_5){
			return device1task5;
		}
		if (Message==message1_6){
			return device1task6;
		}
	}
	if (Device==2) {
		if (Message==message2_1){
			return device2task1;
		}
		if (Message==message2_2){
			return device2task2;
		}
		if (Message==message2_3){
			return device2task3;
		}
		if (Message==message2_4){
			return device2task4;
		}
		if (Message==message2_5){
			return device2task5;
		}
		if (Message==message2_6){
			return device2task6;
		}
	}
	if (Device==3) {
		if (Message==message3_1){
			return device3task1;
		}
		if (Message==message3_2){
			return device3task2;
		}
		if (Message==message3_3){
			return device3task3;
		}
		if (Message==message3_4){
			return device3task4;
		}
		if (Message==message3_5){
			return device3task5;
		}
		if (Message==message3_6){
			return device3task6;
		}
	}
	if (Device==4) {
		if (Message==message4_1){
			return device4task1;
		}
		if (Message==message4_2){
			return device4task2;
		}
		if (Message==message4_3){
			return device4task3;
		}
		if (Message==message4_4){
			return device4task4;
		}
		if (Message==message4_5){
			return device4task5;
		}
		if (Message==message4_6){
			return device4task6;
		}
	}
	if (Device==5) {
		if (Message==message5_1){
			return device5task1;
		}
		if (Message==message5_2){
			return device5task2;
		}
		if (Message==message5_3){
			return device5task3;
		}
		if (Message==message5_4){
			return device5task4;
		}
		if (Message==message5_5){
			return device5task5;
		}
		if (Message==message5_6){
			return device5task6;
		}
	}
	if (Device==6) {
		if (Message==message6_1){
			return device6task1;
		}
		if (Message==message6_2){
			return device6task2;
		}
		if (Message==message6_3){
			return device6task3;
		}
		if (Message==message6_4){
			return device6task4;
		}
		if (Message==message6_5){
			return device6task5;
		}
		if (Message==message6_6){
			return device6task6;
		}
	}
	if (Device==7) {
		if (Message==message7_1){
			return device7task1;
		}
		if (Message==message7_2){
			return device7task2;
		}
		if (Message==message7_3){
			return device7task3;
		}
		if (Message==message7_4){
			return device7task4;
		}
		if (Message==message7_5){
			return device7task5;
		}
		if (Message==message7_6){
			return device7task6;
		}
	}
	if (Device==8) {
		if (Message==message8_1){
			return device8task1;
		}
		if (Message==message8_2){
			return device8task2;
		}
		if (Message==message8_3){
			return device8task3;
		}
		if (Message==message8_4){
			return device8task4;
		}
		if (Message==message8_5){
			return device8task5;
		}
		if (Message==message8_6){
			return device8task6;
		}
	}
	if (Device==9) {
		if (Message==message9_1){
			return device9task1;
		}
		if (Message==message9_2){
			return device9task2;
		}
		if (Message==message9_3){
			return device9task3;
		}
		if (Message==message9_4){
			return device9task4;
		}
		if (Message==message9_5){
			return device9task5;
		}
		if (Message==message9_6){
			return device9task6;
		}
	}
	if (Device==10) {
		if (Message==message10_1){
			return device10task1;
		}
		if (Message==message10_2){
			return device10task2;
		}
		if (Message==message10_3){
			return device10task3;
		}
		if (Message==message10_4){
			return device10task4;
		}
		if (Message==message10_5){
			return device10task5;
		}
		if (Message==message10_6){
			return device10task6;
		}
	}
	return 0;
}
					
function fShowSms(devnum,message){
		
    	document.getElementById("divDev" + devnum + "ReturnSMS").style.display = '';
		document.getElementById("butDevice" + devnum + "ReturnSMS").innerHTML = "<font face='arial' style='font-size:20px'><b>" + message + "</b></font>";

}

function fCompareNumbers(sms, phone) {   

	var smsSanitized   = sms.replace (/[^\d]/g, "") 
                                 .replace (/^.*(\d{12})$/, "$1");   
	var phoneSanitized   = phone.replace (/[^\d]/g, "") 
                                 .replace (/^.*(\d{12})$/, "$1");   

	while (phoneSanitized.substr(0,1) == '0' && phoneSanitized.length>1) { phoneSanitized = phoneSanitized.substr(1,9999); }

	return smsSanitized.indexOf(phoneSanitized) != -1;
	
	} 

function fReadSettings(){
	window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, gotFS, fail); 
}

function gotFS(fileSystem) {
	fileSystem.root.getFile("sms_rc.xml",  {create: true, exclusive: false}, gotFileEntry, fail);
}    


function gotFileEntry(fileEntry) {        
	fileEntry.file(gotFile, fail);    
}    

function gotFile(file){        
	readAsText(file);    
}

function readAsText(file) {        
	var reader = new FileReader();        
	reader.onloadend = function(evt) { 
		if (evt.target.result== ""){
			var xml = '<?xml version="1.0" encoding="UTF-8"?><device1>Sample. Use setup.</device1><color1>#0099cc</color1><phone1>1234567</phone1><device1task1>Task description</device1task1><message1_1>Test command</message1_1>';
			fWriteSettings(xml);
		} else {
	           	fPrepareGui(evt.target.result);
	        };
	};
	reader.readAsText(file);    
}

function fail(evt) {
        alert(evt.target.error.code);
}


function alertDismissed() {
    // do something
}


function fWriteSettings(xml){
	window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function(FS) { 
		FS.root.getFile("sms_rc.xml", {"create":true, "exclusive":false},  
        		function(fileEntry) { 
            			fileEntry.createWriter( 
                 		function(writer) { 
                     			writer.write(xml); 
	             			writer.abort();
					navigator.notification.alert(
    						'Your changes have been saved!',  // message
    						alertDismissed,         // callback
    						'SMS_RC',            // title
    						'Done'                  // buttonName
					);
 
	             			location.href='index.html';
        	         	}, fail); 
       	 		}, fail); 
		}, fail); 
  	}

function fChangeColors(){
	fSetColorDevices(document.getElementById("formSetup").color1.value,
		document.getElementById("formSetup").color2.value,
		document.getElementById("formSetup").color3.value,
		document.getElementById("formSetup").color4.value,
		document.getElementById("formSetup").color5.value,
		document.getElementById("formSetup").color6.value,
		document.getElementById("formSetup").color7.value,
		document.getElementById("formSetup").color8.value,
		document.getElementById("formSetup").color9.value,
		document.getElementById("formSetup").color10.value);
}

function checkform(form){

	// TODO - check inputs
	return true ;

}

function fPrepareGui(xml){

	var doc = document.createElement("div");
	doc.innerHTML = xml;

	try {picturesize = doc.getElementsByTagName("picturesize")[0].childNodes[0].nodeValue} catch(err){picturesize = "0"} ;
	try {boxsize = doc.getElementsByTagName("boxsize")[0].childNodes[0].nodeValue} catch(err){boxsize = "0"} ;

	try {device1 = doc.getElementsByTagName("device1")[0].childNodes[0].nodeValue} catch(err){device1 = ""} ;
	try {color1 = doc.getElementsByTagName("color1")[0].childNodes[0].nodeValue} catch(err){color1 = "#0099cc"} ;
	try {phone1 = doc.getElementsByTagName("phone1")[0].childNodes[0].nodeValue} catch(err){phone1 = ""} ;
	try {device1task1 = doc.getElementsByTagName("device1task1")[0].childNodes[0].nodeValue} catch(err){device1task1 = ""} ;
	try {d1t1cr = doc.getElementsByTagName("d1t1cr")[0].childNodes[0].nodeValue} catch(err){d1t1cr = "1"} ;
	try {message1_1 = doc.getElementsByTagName("message1_1")[0].childNodes[0].nodeValue} catch(err){message1_1 = ""} ;
	try {device1task2 = doc.getElementsByTagName("device1task2")[0].childNodes[0].nodeValue} catch(err){device1task2 = ""} ;
	try {d1t2cr = doc.getElementsByTagName("d1t2cr")[0].childNodes[0].nodeValue} catch(err){d1t2cr = "1"} ;
	try {message1_2 = doc.getElementsByTagName("message1_2")[0].childNodes[0].nodeValue} catch(err){message1_2 = ""} ;
	try {device1task3 = doc.getElementsByTagName("device1task3")[0].childNodes[0].nodeValue} catch(err){device1task3 = ""} ;
	try {d1t3cr = doc.getElementsByTagName("d1t3cr")[0].childNodes[0].nodeValue} catch(err){d1t3cr = "1"} ;
	try {message1_3 = doc.getElementsByTagName("message1_3")[0].childNodes[0].nodeValue} catch(err){message1_3 = ""} ;
	try {device1task4 = doc.getElementsByTagName("device1task4")[0].childNodes[0].nodeValue} catch(err){device1task4 = ""} ;
	try {d1t4cr = doc.getElementsByTagName("d1t4cr")[0].childNodes[0].nodeValue} catch(err){d1t4cr = "1"} ;
	try {message1_4 = doc.getElementsByTagName("message1_4")[0].childNodes[0].nodeValue} catch(err){message1_4 = ""} ;
	try {device1task5 = doc.getElementsByTagName("device1task5")[0].childNodes[0].nodeValue} catch(err){device1task5 = ""} ;
	try {d1t5cr = doc.getElementsByTagName("d1t5cr")[0].childNodes[0].nodeValue} catch(err){d1t5cr = "1"} ;
	try {message1_5 = doc.getElementsByTagName("message1_5")[0].childNodes[0].nodeValue} catch(err){message1_5 = ""} ;
	try {device1task6 = doc.getElementsByTagName("device1task6")[0].childNodes[0].nodeValue} catch(err){device1task6 = ""} ;
	try {message1_6 = doc.getElementsByTagName("message1_6")[0].childNodes[0].nodeValue} catch(err){message1_6 = ""} ;
	
	try {device2 = doc.getElementsByTagName("device2")[0].childNodes[0].nodeValue} catch(err){device2 = ""} ;
	try {color2 = doc.getElementsByTagName("color2")[0].childNodes[0].nodeValue} catch(err){color2 = "#00cc66"} ;
	try {phone2 = doc.getElementsByTagName("phone2")[0].childNodes[0].nodeValue} catch(err){phone2 = ""} ;
	try {device2task1 = doc.getElementsByTagName("device2task1")[0].childNodes[0].nodeValue} catch(err){device2task1 = ""} ;
	try {d2t1cr = doc.getElementsByTagName("d2t1cr")[0].childNodes[0].nodeValue} catch(err){d2t1cr = "1"} ;
	try {message2_1 = doc.getElementsByTagName("message2_1")[0].childNodes[0].nodeValue} catch(err){message2_1 = ""} ;
	try {device2task2 = doc.getElementsByTagName("device2task2")[0].childNodes[0].nodeValue} catch(err){device2task2 = ""} ;
	try {d2t2cr = doc.getElementsByTagName("d2t2cr")[0].childNodes[0].nodeValue} catch(err){d2t2cr = "1"} ;
	try {message2_2 = doc.getElementsByTagName("message2_2")[0].childNodes[0].nodeValue} catch(err){message2_2 = ""} ;
	try {device2task3 = doc.getElementsByTagName("device2task3")[0].childNodes[0].nodeValue} catch(err){device2task3 = ""} ;
	try {d2t3cr = doc.getElementsByTagName("d2t3cr")[0].childNodes[0].nodeValue} catch(err){d2t3cr = "1"} ;
	try {message2_3 = doc.getElementsByTagName("message2_3")[0].childNodes[0].nodeValue} catch(err){message2_3 = ""} ;
	try {device2task4 = doc.getElementsByTagName("device2task4")[0].childNodes[0].nodeValue} catch(err){device2task4 = ""} ;
	try {d2t4cr = doc.getElementsByTagName("d2t4cr")[0].childNodes[0].nodeValue} catch(err){d2t4cr = "1"} ;
	try {message2_4 = doc.getElementsByTagName("message2_4")[0].childNodes[0].nodeValue} catch(err){message2_4 = ""} ;
	try {device2task5 = doc.getElementsByTagName("device2task5")[0].childNodes[0].nodeValue} catch(err){device2task5 = ""} ;
	try {d2t5cr = doc.getElementsByTagName("d2t5cr")[0].childNodes[0].nodeValue} catch(err){d2t5cr = "1"} ;
	try {message2_5 = doc.getElementsByTagName("message2_5")[0].childNodes[0].nodeValue} catch(err){message2_5 = ""} ;
	try {device2task6 = doc.getElementsByTagName("device2task6")[0].childNodes[0].nodeValue} catch(err){device2task6 = ""} ;
	try {message2_6 = doc.getElementsByTagName("message2_6")[0].childNodes[0].nodeValue} catch(err){message2_6 = ""} ;
	
	try {device3 = doc.getElementsByTagName("device3")[0].childNodes[0].nodeValue} catch(err){device3 = ""} ;
	try {color3 = doc.getElementsByTagName("color3")[0].childNodes[0].nodeValue} catch(err){color3 = "#ff9933"} ;
	try {phone3 = doc.getElementsByTagName("phone3")[0].childNodes[0].nodeValue} catch(err){phone3 = ""} ;
	try {device3task1 = doc.getElementsByTagName("device3task1")[0].childNodes[0].nodeValue} catch(err){device3task1 = ""} ;
	try {d3t1cr = doc.getElementsByTagName("d3t1cr")[0].childNodes[0].nodeValue} catch(err){d3t1cr = "1"} ;
	try {message3_1 = doc.getElementsByTagName("message3_1")[0].childNodes[0].nodeValue} catch(err){message3_1 = ""} ;
	try {device3task2 = doc.getElementsByTagName("device3task2")[0].childNodes[0].nodeValue} catch(err){device3task2 = ""} ;
	try {d3t2cr = doc.getElementsByTagName("d3t2cr")[0].childNodes[0].nodeValue} catch(err){d3t2cr = "1"} ;
	try {message3_2 = doc.getElementsByTagName("message3_2")[0].childNodes[0].nodeValue} catch(err){message3_2 = ""} ;
	try {device3task3 = doc.getElementsByTagName("device3task3")[0].childNodes[0].nodeValue} catch(err){device3task3 = ""} ;
	try {d3t3cr = doc.getElementsByTagName("d3t3cr")[0].childNodes[0].nodeValue} catch(err){d3t3cr = "1"} ;
	try {message3_3 = doc.getElementsByTagName("message3_3")[0].childNodes[0].nodeValue} catch(err){message3_3 = ""} ;
	try {device3task4 = doc.getElementsByTagName("device3task4")[0].childNodes[0].nodeValue} catch(err){device3task4 = ""} ;
	try {d3t4cr = doc.getElementsByTagName("d3t4cr")[0].childNodes[0].nodeValue} catch(err){d3t4cr = "1"} ;
	try {message3_4 = doc.getElementsByTagName("message3_4")[0].childNodes[0].nodeValue} catch(err){message3_4 = ""} ;
	try {device3task5 = doc.getElementsByTagName("device3task5")[0].childNodes[0].nodeValue} catch(err){device3task5 = ""} ;
	try {d3t5cr = doc.getElementsByTagName("d3t5cr")[0].childNodes[0].nodeValue} catch(err){d3t5cr = "1"} ;
	try {message3_5 = doc.getElementsByTagName("message3_5")[0].childNodes[0].nodeValue} catch(err){message3_5 = ""} ;
	try {device3task6 = doc.getElementsByTagName("device3task6")[0].childNodes[0].nodeValue} catch(err){device3task6 = ""} ;
	try {message3_6 = doc.getElementsByTagName("message3_6")[0].childNodes[0].nodeValue} catch(err){message3_6 = ""} ;
	
	try {device4 = doc.getElementsByTagName("device4")[0].childNodes[0].nodeValue} catch(err){device4 = ""} ;
	try {color4 = doc.getElementsByTagName("color4")[0].childNodes[0].nodeValue} catch(err){color4 = "#0000cc"} ;
	try {phone4 = doc.getElementsByTagName("phone4")[0].childNodes[0].nodeValue} catch(err){phone4 = ""} ;
	try {device4task1 = doc.getElementsByTagName("device4task1")[0].childNodes[0].nodeValue} catch(err){device4task1 = ""} ;
	try {d4t1cr = doc.getElementsByTagName("d4t1cr")[0].childNodes[0].nodeValue} catch(err){d4t1cr = "1"} ;
	try {message4_1 = doc.getElementsByTagName("message4_1")[0].childNodes[0].nodeValue} catch(err){message4_1 = ""} ;
	try {device4task2 = doc.getElementsByTagName("device4task2")[0].childNodes[0].nodeValue} catch(err){device4task2 = ""} ;
	try {d4t2cr = doc.getElementsByTagName("d4t2cr")[0].childNodes[0].nodeValue} catch(err){d4t2cr = "1"} ;
	try {message4_2 = doc.getElementsByTagName("message4_2")[0].childNodes[0].nodeValue} catch(err){message4_2 = ""} ;
	try {device4task3 = doc.getElementsByTagName("device4task3")[0].childNodes[0].nodeValue} catch(err){device4task3 = ""} ;
	try {d4t3cr = doc.getElementsByTagName("d4t3cr")[0].childNodes[0].nodeValue} catch(err){d4t3cr = "1"} ;
	try {message4_3 = doc.getElementsByTagName("message4_3")[0].childNodes[0].nodeValue} catch(err){message4_3 = ""} ;
	try {device4task4 = doc.getElementsByTagName("device4task4")[0].childNodes[0].nodeValue} catch(err){device4task4 = ""} ;
	try {d4t4cr = doc.getElementsByTagName("d4t4cr")[0].childNodes[0].nodeValue} catch(err){d4t4cr = "1"} ;
	try {message4_4 = doc.getElementsByTagName("message4_4")[0].childNodes[0].nodeValue} catch(err){message4_4 = ""} ;
	try {device4task5 = doc.getElementsByTagName("device4task5")[0].childNodes[0].nodeValue} catch(err){device4task5 = ""} ;
	try {d4t5cr = doc.getElementsByTagName("d4t5cr")[0].childNodes[0].nodeValue} catch(err){d4t5cr = "1"} ;
	try {message4_5 = doc.getElementsByTagName("message4_5")[0].childNodes[0].nodeValue} catch(err){message4_5 = ""} ;
	try {device4task6 = doc.getElementsByTagName("device4task6")[0].childNodes[0].nodeValue} catch(err){device4task6 = ""} ;
	try {message4_6 = doc.getElementsByTagName("message4_6")[0].childNodes[0].nodeValue} catch(err){message4_6 = ""} ;
	
	try {device5 = doc.getElementsByTagName("device5")[0].childNodes[0].nodeValue} catch(err){device5 = ""} ;
	try {color5 = doc.getElementsByTagName("color5")[0].childNodes[0].nodeValue} catch(err){color5 = "#009900"} ;
	try {phone5 = doc.getElementsByTagName("phone5")[0].childNodes[0].nodeValue} catch(err){phone5 = ""} ;
	try {device5task1 = doc.getElementsByTagName("device5task1")[0].childNodes[0].nodeValue} catch(err){device5task1 = ""} ;
	try {d5t1cr = doc.getElementsByTagName("d5t1cr")[0].childNodes[0].nodeValue} catch(err){d5t1cr = "1"} ;
	try {message5_1 = doc.getElementsByTagName("message5_1")[0].childNodes[0].nodeValue} catch(err){message5_1 = ""} ;
	try {device5task2 = doc.getElementsByTagName("device5task2")[0].childNodes[0].nodeValue} catch(err){device5task2 = ""} ;
	try {d5t2cr = doc.getElementsByTagName("d5t2cr")[0].childNodes[0].nodeValue} catch(err){d5t2cr = "1"} ;
	try {message5_2 = doc.getElementsByTagName("message5_2")[0].childNodes[0].nodeValue} catch(err){message5_2 = ""} ;
	try {device5task3 = doc.getElementsByTagName("device5task3")[0].childNodes[0].nodeValue} catch(err){device5task3 = ""} ;
	try {d5t3cr = doc.getElementsByTagName("d5t3cr")[0].childNodes[0].nodeValue} catch(err){d5t3cr = "1"} ;
	try {message5_3 = doc.getElementsByTagName("message5_3")[0].childNodes[0].nodeValue} catch(err){message5_3 = ""} ;
	try {device5task4 = doc.getElementsByTagName("device5task4")[0].childNodes[0].nodeValue} catch(err){device5task4 = ""} ;
	try {d5t4cr = doc.getElementsByTagName("d5t4cr")[0].childNodes[0].nodeValue} catch(err){d5t4cr = "1"} ;
	try {message5_4 = doc.getElementsByTagName("message5_4")[0].childNodes[0].nodeValue} catch(err){message5_4 = ""} ;
	try {device5task5 = doc.getElementsByTagName("device5task5")[0].childNodes[0].nodeValue} catch(err){device5task5 = ""} ;
	try {d5t5cr = doc.getElementsByTagName("d5t5cr")[0].childNodes[0].nodeValue} catch(err){d5t5cr = "1"} ;
	try {message5_5 = doc.getElementsByTagName("message5_5")[0].childNodes[0].nodeValue} catch(err){message5_5 = ""} ;
	try {device5task6 = doc.getElementsByTagName("device5task6")[0].childNodes[0].nodeValue} catch(err){device5task6 = ""} ;
	try {message5_6 = doc.getElementsByTagName("message5_6")[0].childNodes[0].nodeValue} catch(err){message5_6 = ""} ;
	
	try {device6 = doc.getElementsByTagName("device6")[0].childNodes[0].nodeValue} catch(err){device6 = ""} ;
	try {color6 = doc.getElementsByTagName("color6")[0].childNodes[0].nodeValue} catch(err){color6 = "#009900"} ;
	try {phone6 = doc.getElementsByTagName("phone6")[0].childNodes[0].nodeValue} catch(err){phone6 = ""} ;
	try {device6task1 = doc.getElementsByTagName("device6task1")[0].childNodes[0].nodeValue} catch(err){device6task1 = ""} ;
	try {d6t1cr = doc.getElementsByTagName("d6t1cr")[0].childNodes[0].nodeValue} catch(err){d6t1cr = "1"} ;
	try {message6_1 = doc.getElementsByTagName("message6_1")[0].childNodes[0].nodeValue} catch(err){message6_1 = ""} ;
	try {device6task2 = doc.getElementsByTagName("device6task2")[0].childNodes[0].nodeValue} catch(err){device6task2 = ""} ;
	try {d6t2cr = doc.getElementsByTagName("d6t2cr")[0].childNodes[0].nodeValue} catch(err){d6t2cr = "1"} ;
	try {message6_2 = doc.getElementsByTagName("message6_2")[0].childNodes[0].nodeValue} catch(err){message6_2 = ""} ;
	try {device6task3 = doc.getElementsByTagName("device6task3")[0].childNodes[0].nodeValue} catch(err){device6task3 = ""} ;
	try {d6t3cr = doc.getElementsByTagName("d6t3cr")[0].childNodes[0].nodeValue} catch(err){d6t3cr = "1"} ;
	try {message6_3 = doc.getElementsByTagName("message6_3")[0].childNodes[0].nodeValue} catch(err){message6_3 = ""} ;
	try {device6task4 = doc.getElementsByTagName("device6task4")[0].childNodes[0].nodeValue} catch(err){device6task4 = ""} ;
	try {d6t4cr = doc.getElementsByTagName("d6t4cr")[0].childNodes[0].nodeValue} catch(err){d6t4cr = "1"} ;
	try {message6_4 = doc.getElementsByTagName("message6_4")[0].childNodes[0].nodeValue} catch(err){message6_4 = ""} ;
	try {device6task5 = doc.getElementsByTagName("device6task5")[0].childNodes[0].nodeValue} catch(err){device6task5 = ""} ;
	try {d6t5cr = doc.getElementsByTagName("d6t5cr")[0].childNodes[0].nodeValue} catch(err){d6t5cr = "1"} ;
	try {message6_5 = doc.getElementsByTagName("message6_5")[0].childNodes[0].nodeValue} catch(err){message6_5 = ""} ;
	try {device6task6 = doc.getElementsByTagName("device6task6")[0].childNodes[0].nodeValue} catch(err){device6task6 = ""} ;
	try {message6_6 = doc.getElementsByTagName("message6_6")[0].childNodes[0].nodeValue} catch(err){message6_6 = ""} ;

	try {device7 = doc.getElementsByTagName("device7")[0].childNodes[0].nodeValue} catch(err){device7 = ""} ;
	try {color7 = doc.getElementsByTagName("color7")[0].childNodes[0].nodeValue} catch(err){color7 = "#ccccff"} ;
	try {phone7 = doc.getElementsByTagName("phone7")[0].childNodes[0].nodeValue} catch(err){phone7 = ""} ;
	try {device7task1 = doc.getElementsByTagName("device7task1")[0].childNodes[0].nodeValue} catch(err){device7task1 = ""} ;
	try {d7t1cr = doc.getElementsByTagName("d7t1cr")[0].childNodes[0].nodeValue} catch(err){d7t1cr = "1"} ;
	try {message7_1 = doc.getElementsByTagName("message7_1")[0].childNodes[0].nodeValue} catch(err){message7_1 = ""} ;
	try {device7task2 = doc.getElementsByTagName("device7task2")[0].childNodes[0].nodeValue} catch(err){device7task2 = ""} ;
	try {d7t2cr = doc.getElementsByTagName("d7t2cr")[0].childNodes[0].nodeValue} catch(err){d7t2cr = "1"} ;
	try {message7_2 = doc.getElementsByTagName("message7_2")[0].childNodes[0].nodeValue} catch(err){message7_2 = ""} ;
	try {device7task3 = doc.getElementsByTagName("device7task3")[0].childNodes[0].nodeValue} catch(err){device7task3 = ""} ;
	try {d7t3cr = doc.getElementsByTagName("d7t3cr")[0].childNodes[0].nodeValue} catch(err){d7t3cr = "1"} ;
	try {message7_3 = doc.getElementsByTagName("message7_3")[0].childNodes[0].nodeValue} catch(err){message7_3 = ""} ;
	try {device7task4 = doc.getElementsByTagName("device7task4")[0].childNodes[0].nodeValue} catch(err){device7task4 = ""} ;
	try {d7t4cr = doc.getElementsByTagName("d7t4cr")[0].childNodes[0].nodeValue} catch(err){d7t4cr = "1"} ;
	try {message7_4 = doc.getElementsByTagName("message7_4")[0].childNodes[0].nodeValue} catch(err){message7_4 = ""} ;
	try {device7task5 = doc.getElementsByTagName("device7task5")[0].childNodes[0].nodeValue} catch(err){device7task5 = ""} ;
	try {d7t5cr = doc.getElementsByTagName("d7t5cr")[0].childNodes[0].nodeValue} catch(err){d7t5cr = "1"} ;
	try {message7_5 = doc.getElementsByTagName("message7_5")[0].childNodes[0].nodeValue} catch(err){message7_5 = ""} ;
	try {device7task6 = doc.getElementsByTagName("device7task6")[0].childNodes[0].nodeValue} catch(err){device7task6 = ""} ;
	try {message7_6 = doc.getElementsByTagName("message7_6")[0].childNodes[0].nodeValue} catch(err){message7_6 = ""} ;
	
	try {device8 = doc.getElementsByTagName("device8")[0].childNodes[0].nodeValue} catch(err){device8 = ""} ;
	try {color8 = doc.getElementsByTagName("color8")[0].childNodes[0].nodeValue} catch(err){color8 = "#669999"} ;
	try {phone8 = doc.getElementsByTagName("phone8")[0].childNodes[0].nodeValue} catch(err){phone8 = ""} ;
	try {device8task1 = doc.getElementsByTagName("device8task1")[0].childNodes[0].nodeValue} catch(err){device8task1 = ""} ;
	try {d8t1cr = doc.getElementsByTagName("d8t1cr")[0].childNodes[0].nodeValue} catch(err){d8t1cr = "1"} ;
	try {message8_1 = doc.getElementsByTagName("message8_1")[0].childNodes[0].nodeValue} catch(err){message8_1 = ""} ;
	try {device8task2 = doc.getElementsByTagName("device8task2")[0].childNodes[0].nodeValue} catch(err){device8task2 = ""} ;
	try {d8t2cr = doc.getElementsByTagName("d8t2cr")[0].childNodes[0].nodeValue} catch(err){d8t2cr = "1"} ;
	try {message8_2 = doc.getElementsByTagName("message8_2")[0].childNodes[0].nodeValue} catch(err){message8_2 = ""} ;
	try {device8task3 = doc.getElementsByTagName("device8task3")[0].childNodes[0].nodeValue} catch(err){device8task3 = ""} ;
	try {d8t3cr = doc.getElementsByTagName("d8t3cr")[0].childNodes[0].nodeValue} catch(err){d8t3cr = "1"} ;
	try {message8_3 = doc.getElementsByTagName("message8_3")[0].childNodes[0].nodeValue} catch(err){message8_3 = ""} ;
	try {device8task4 = doc.getElementsByTagName("device8task4")[0].childNodes[0].nodeValue} catch(err){device8task4 = ""} ;
	try {d8t4cr = doc.getElementsByTagName("d8t4cr")[0].childNodes[0].nodeValue} catch(err){d1t8cr = "1"} ;
	try {message8_4 = doc.getElementsByTagName("message8_4")[0].childNodes[0].nodeValue} catch(err){message8_4 = ""} ;
	try {device8task5 = doc.getElementsByTagName("device8task5")[0].childNodes[0].nodeValue} catch(err){device8task5 = ""} ;
	try {d8t5cr = doc.getElementsByTagName("d8t5cr")[0].childNodes[0].nodeValue} catch(err){d8t5cr = "1"} ;
	try {message8_5 = doc.getElementsByTagName("message8_5")[0].childNodes[0].nodeValue} catch(err){message8_5 = ""} ;
	try {device8task6 = doc.getElementsByTagName("device8task6")[0].childNodes[0].nodeValue} catch(err){device8task6 = ""} ;
	try {message8_6 = doc.getElementsByTagName("message8_6")[0].childNodes[0].nodeValue} catch(err){message8_6 = ""} ;
	
	try {device9 = doc.getElementsByTagName("device9")[0].childNodes[0].nodeValue} catch(err){device9 = ""} ;
	try {color9 = doc.getElementsByTagName("color9")[0].childNodes[0].nodeValue} catch(err){color9 = "#cc99cc"} ;
	try {phone9 = doc.getElementsByTagName("phone9")[0].childNodes[0].nodeValue} catch(err){phone9 = ""} ;
	try {device9task1 = doc.getElementsByTagName("device9task1")[0].childNodes[0].nodeValue} catch(err){device9task1 = ""} ;
	try {d9t1cr = doc.getElementsByTagName("d9t1cr")[0].childNodes[0].nodeValue} catch(err){d9t1cr = "1"} ;
	try {message9_1 = doc.getElementsByTagName("message9_1")[0].childNodes[0].nodeValue} catch(err){message9_1 = ""} ;
	try {device9task2 = doc.getElementsByTagName("device9task2")[0].childNodes[0].nodeValue} catch(err){device9task2 = ""} ;
	try {d9t2cr = doc.getElementsByTagName("d9t2cr")[0].childNodes[0].nodeValue} catch(err){d9t2cr = "1"} ;
	try {message9_2 = doc.getElementsByTagName("message9_2")[0].childNodes[0].nodeValue} catch(err){message9_2 = ""} ;
	try {device9task3 = doc.getElementsByTagName("device9task3")[0].childNodes[0].nodeValue} catch(err){device9task3 = ""} ;
	try {d9t3cr = doc.getElementsByTagName("d9t3cr")[0].childNodes[0].nodeValue} catch(err){d9t3cr = "1"} ;
	try {message9_3 = doc.getElementsByTagName("message9_3")[0].childNodes[0].nodeValue} catch(err){message9_3 = ""} ;
	try {device9task4 = doc.getElementsByTagName("device9task4")[0].childNodes[0].nodeValue} catch(err){device9task4 = ""} ;
	try {d9t4cr = doc.getElementsByTagName("d9t4cr")[0].childNodes[0].nodeValue} catch(err){d9t4cr = "1"} ;
	try {message9_4 = doc.getElementsByTagName("message9_4")[0].childNodes[0].nodeValue} catch(err){message9_4 = ""} ;
	try {device9task5 = doc.getElementsByTagName("device9task5")[0].childNodes[0].nodeValue} catch(err){device9task5 = ""} ;
	try {d9t5cr = doc.getElementsByTagName("d9t5cr")[0].childNodes[0].nodeValue} catch(err){d9t5cr = "1"} ;
	try {message9_5 = doc.getElementsByTagName("message9_5")[0].childNodes[0].nodeValue} catch(err){message9_5 = ""} ;
	try {device9task6 = doc.getElementsByTagName("device9task6")[0].childNodes[0].nodeValue} catch(err){device9task6 = ""} ;
	try {message9_6 = doc.getElementsByTagName("message9_6")[0].childNodes[0].nodeValue} catch(err){message9_6 = ""} ;
	
	try {device10 = doc.getElementsByTagName("device10")[0].childNodes[0].nodeValue} catch(err){device10 = ""} ;
	try {color10 = doc.getElementsByTagName("color10")[0].childNodes[0].nodeValue} catch(err){color10 = "#cc9966"} ;
	try {phone10 = doc.getElementsByTagName("phone10")[0].childNodes[0].nodeValue} catch(err){phone10 = ""} ;
	try {device10task1 = doc.getElementsByTagName("device10task1")[0].childNodes[0].nodeValue} catch(err){device10task1 = ""} ;
	try {d10t1cr = doc.getElementsByTagName("d10t1cr")[0].childNodes[0].nodeValue} catch(err){d10t1cr = "1"} ;
	try {message10_1 = doc.getElementsByTagName("message10_1")[0].childNodes[0].nodeValue} catch(err){message10_1 = ""} ;
	try {device10task2 = doc.getElementsByTagName("device10task2")[0].childNodes[0].nodeValue} catch(err){device10task2 = ""} ;
	try {d10t2cr = doc.getElementsByTagName("d10t2cr")[0].childNodes[0].nodeValue} catch(err){d10t2cr = "1"} ;
	try {message10_2 = doc.getElementsByTagName("message10_2")[0].childNodes[0].nodeValue} catch(err){message10_2 = ""} ;
	try {device10task3 = doc.getElementsByTagName("device10task3")[0].childNodes[0].nodeValue} catch(err){device10task3 = ""} ;
	try {d10t3cr = doc.getElementsByTagName("d10t3cr")[0].childNodes[0].nodeValue} catch(err){d10t3cr = "1"} ;
	try {message10_3 = doc.getElementsByTagName("message10_3")[0].childNodes[0].nodeValue} catch(err){message10_3 = ""} ;
	try {device10task4 = doc.getElementsByTagName("device10task4")[0].childNodes[0].nodeValue} catch(err){device10task4 = ""} ;
	try {d10t4cr = doc.getElementsByTagName("d10t4cr")[0].childNodes[0].nodeValue} catch(err){d10t4cr = "1"} ;
	try {message10_4 = doc.getElementsByTagName("message10_4")[0].childNodes[0].nodeValue} catch(err){message10_4 = ""} ;
	try {device10task5 = doc.getElementsByTagName("device10task5")[0].childNodes[0].nodeValue} catch(err){device10task5 = ""} ;
	try {d10t5cr = doc.getElementsByTagName("d10t5cr")[0].childNodes[0].nodeValue} catch(err){d10t5cr = "1"} ;
	try {message10_5 = doc.getElementsByTagName("message10_5")[0].childNodes[0].nodeValue} catch(err){message10_5 = ""} ;
	try {device10task6 = doc.getElementsByTagName("device10task6")[0].childNodes[0].nodeValue} catch(err){device10task6 = ""} ;
	try {message10_6 = doc.getElementsByTagName("message10_6")[0].childNodes[0].nodeValue} catch(err){message10_6 = ""} ;

	fFixSizes(picturesize,boxsize);
	
	if (d1t1cr=="0") {
		document.getElementById("d1t1cr").innerHTML = "";  // no CR between buttons
		document.getElementById("butDevice1Task1").style.width = ""; // remove absolut size 
		document.getElementById("butDevice1Task2").style.width = ""; // remove absolut size 
	} 
	if (d1t2cr=="0") {
		document.getElementById("d1t2cr").innerHTML = ""; 
		document.getElementById("butDevice1Task2").style.width = "";
		document.getElementById("butDevice1Task3").style.width = "";
	} 
	if (d1t3cr=="0") { 
		document.getElementById("d1t3cr").innerHTML = ""; 
		document.getElementById("butDevice1Task3").style.width = "";
		document.getElementById("butDevice1Task4").style.width = "";
	} 
	if (d1t4cr=="0") { 
		document.getElementById("d1t4cr").innerHTML = ""; 
		document.getElementById("butDevice1Task4").style.width = "";
		document.getElementById("butDevice1Task5").style.width = "";
	} 
	if (d1t5cr=="0") { 
		document.getElementById("d1t5cr").innerHTML = ""; 
		document.getElementById("butDevice1Task5").style.width = "";
		document.getElementById("butDevice1Task6").style.width = "";
	}
	 
	if (d2t1cr=="0") { 
		document.getElementById("d2t1cr").innerHTML = ""; 
		document.getElementById("butDevice2Task1").style.width = "";
		document.getElementById("butDevice2Task2").style.width = "";
	}
	if (d2t2cr=="0") { 
		document.getElementById("d2t2cr").innerHTML = ""; 
		document.getElementById("butDevice2Task2").style.width = "";
		document.getElementById("butDevice2Task3").style.width = "";
	} 
	if (d2t3cr=="0") { 
		document.getElementById("d2t3cr").innerHTML = ""; 
		document.getElementById("butDevice2Task3").style.width = "";
		document.getElementById("butDevice2Task4").style.width = "";
	} 
	if (d2t4cr=="0") { 
		document.getElementById("d2t4cr").innerHTML = ""; 
		document.getElementById("butDevice2Task4").style.width = "";
		document.getElementById("butDevice2Task5").style.width = "";
	} 
	if (d2t5cr=="0") { 
		document.getElementById("d2t5cr").innerHTML = ""; 
		document.getElementById("butDevice2Task5").style.width = "";
		document.getElementById("butDevice2Task6").style.width = "";
	} 

	if (d3t1cr=="0") { 
		document.getElementById("d3t1cr").innerHTML = ""; 
		document.getElementById("butDevice3Task1").style.width = "";
		document.getElementById("butDevice3Task2").style.width = "";
	}
	if (d3t2cr=="0") { 
		document.getElementById("d3t2cr").innerHTML = ""; 
		document.getElementById("butDevice3Task2").style.width = "";
		document.getElementById("butDevice3Task3").style.width = "";
	} 
	if (d3t3cr=="0") { 
		document.getElementById("d3t3cr").innerHTML = ""; 
		document.getElementById("butDevice3Task3").style.width = "";
		document.getElementById("butDevice3Task4").style.width = "";
	} 
	if (d3t4cr=="0") { 
		document.getElementById("d3t4cr").innerHTML = ""; 
		document.getElementById("butDevice3Task4").style.width = "";
		document.getElementById("butDevice3Task5").style.width = "";
	} 
	if (d3t5cr=="0") { 
		document.getElementById("d3t5cr").innerHTML = ""; 
		document.getElementById("butDevice3Task5").style.width = "";
		document.getElementById("butDevice3Task6").style.width = "";
	} 

	if (d4t1cr=="0") { 
		document.getElementById("d4t1cr").innerHTML = ""; 
		document.getElementById("butDevice4Task1").style.width = "";
		document.getElementById("butDevice4Task2").style.width = "";
	}
	if (d4t2cr=="0") { 
		document.getElementById("d4t2cr").innerHTML = ""; 
		document.getElementById("butDevice4Task2").style.width = "";
		document.getElementById("butDevice4Task3").style.width = "";
	} 
	if (d4t3cr=="0") { 
		document.getElementById("d4t3cr").innerHTML = ""; 
		document.getElementById("butDevice4Task3").style.width = "";
		document.getElementById("butDevice4Task4").style.width = "";
	} 
	if (d4t4cr=="0") { 
		document.getElementById("d4t4cr").innerHTML = ""; 
		document.getElementById("butDevice4Task4").style.width = "";
		document.getElementById("butDevice4Task5").style.width = "";
	} 
	if (d4t5cr=="0") { 
		document.getElementById("d4t5cr").innerHTML = ""; 
		document.getElementById("butDevice4Task5").style.width = "";
		document.getElementById("butDevice4Task6").style.width = "";
	} 

	if (d5t1cr=="0") { 
		document.getElementById("d5t1cr").innerHTML = ""; 
		document.getElementById("butDevice5Task1").style.width = "";
		document.getElementById("butDevice5Task2").style.width = "";
	}
	if (d5t2cr=="0") { 
		document.getElementById("d5t2cr").innerHTML = ""; 
		document.getElementById("butDevice5Task2").style.width = "";
		document.getElementById("butDevice5Task3").style.width = "";
	} 
	if (d5t3cr=="0") { 
		document.getElementById("d5t3cr").innerHTML = ""; 
		document.getElementById("butDevice5Task3").style.width = "";
		document.getElementById("butDevice5Task4").style.width = "";
	} 
	if (d5t4cr=="0") { 
		document.getElementById("d5t4cr").innerHTML = ""; 
		document.getElementById("butDevice5Task4").style.width = "";
		document.getElementById("butDevice5Task5").style.width = "";
	} 
	if (d5t5cr=="0") { 
		document.getElementById("d5t5cr").innerHTML = ""; 
		document.getElementById("butDevice5Task5").style.width = "";
		document.getElementById("butDevice5Task6").style.width = "";
	} 

	if (d6t1cr=="0") { 
		document.getElementById("d6t1cr").innerHTML = ""; 
		document.getElementById("butDevice6Task1").style.width = "";
		document.getElementById("butDevice6Task2").style.width = "";
	}
	if (d6t2cr=="0") { 
		document.getElementById("d6t2cr").innerHTML = ""; 
		document.getElementById("butDevice6Task2").style.width = "";
		document.getElementById("butDevice6Task3").style.width = "";
	} 
	if (d6t3cr=="0") { 
		document.getElementById("d6t3cr").innerHTML = ""; 
		document.getElementById("butDevice6Task3").style.width = "";
		document.getElementById("butDevice6Task4").style.width = "";
	} 
	if (d6t4cr=="0") { 
		document.getElementById("d6t4cr").innerHTML = ""; 
		document.getElementById("butDevice6Task4").style.width = "";
		document.getElementById("butDevice6Task5").style.width = "";
	} 
	if (d6t5cr=="0") { 
		document.getElementById("d6t5cr").innerHTML = ""; 
		document.getElementById("butDevice6Task5").style.width = "";
		document.getElementById("butDevice6Task6").style.width = "";
	} 

	if (d7t1cr=="0") {
		document.getElementById("d7t1cr").innerHTML = "";  // no CR between buttons
		document.getElementById("butDevice7Task1").style.width = ""; // remove absolut size 
		document.getElementById("butDevice7Task2").style.width = ""; // remove absolut size 
	} 
	if (d7t2cr=="0") {
		document.getElementById("d7t2cr").innerHTML = ""; 
		document.getElementById("butDevice7Task2").style.width = "";
		document.getElementById("butDevice7Task3").style.width = "";
	} 
	if (d7t3cr=="0") { 
		document.getElementById("d7t3cr").innerHTML = ""; 
		document.getElementById("butDevice7Task3").style.width = "";
		document.getElementById("butDevice7Task4").style.width = "";
	} 
	if (d7t4cr=="0") { 
		document.getElementById("d7t4cr").innerHTML = ""; 
		document.getElementById("butDevice7Task4").style.width = "";
		document.getElementById("butDevice7Task5").style.width = "";
	} 
	if (d7t5cr=="0") { 
		document.getElementById("d7t5cr").innerHTML = ""; 
		document.getElementById("butDevice7Task5").style.width = "";
		document.getElementById("butDevice7Task6").style.width = "";
	}
	 
	if (d8t1cr=="0") {
		document.getElementById("d8t1cr").innerHTML = "";  // no CR between buttons
		document.getElementById("butDevice8Task1").style.width = ""; // remove absolut size 
		document.getElementById("butDevice8Task2").style.width = ""; // remove absolut size 
	} 
	if (d8t2cr=="0") {
		document.getElementById("d8t2cr").innerHTML = ""; 
		document.getElementById("butDevice8Task2").style.width = "";
		document.getElementById("butDevice8Task3").style.width = "";
	} 
	if (d8t3cr=="0") { 
		document.getElementById("d8t3cr").innerHTML = ""; 
		document.getElementById("butDevice8Task3").style.width = "";
		document.getElementById("butDevice8Task4").style.width = "";
	} 
	if (d8t4cr=="0") { 
		document.getElementById("d8t4cr").innerHTML = ""; 
		document.getElementById("butDevice8Task4").style.width = "";
		document.getElementById("butDevice8Task5").style.width = "";
	} 
	if (d8t5cr=="0") { 
		document.getElementById("d8t5cr").innerHTML = ""; 
		document.getElementById("butDevice8Task5").style.width = "";
		document.getElementById("butDevice8Task6").style.width = "";
	}
	 
	if (d9t1cr=="0") {
		document.getElementById("d9t1cr").innerHTML = "";  // no CR between buttons
		document.getElementById("butDevice9Task1").style.width = ""; // remove absolut size 
		document.getElementById("butDevice9Task2").style.width = ""; // remove absolut size 
	} 
	if (d9t2cr=="0") {
		document.getElementById("d9t2cr").innerHTML = ""; 
		document.getElementById("butDevice9Task2").style.width = "";
		document.getElementById("butDevice9Task3").style.width = "";
	} 
	if (d9t3cr=="0") { 
		document.getElementById("d9t3cr").innerHTML = ""; 
		document.getElementById("butDevice9Task3").style.width = "";
		document.getElementById("butDevice9Task4").style.width = "";
	} 
	if (d9t4cr=="0") { 
		document.getElementById("d9t4cr").innerHTML = ""; 
		document.getElementById("butDevice9Task4").style.width = "";
		document.getElementById("butDevice9Task5").style.width = "";
	} 
	if (d9t5cr=="0") { 
		document.getElementById("d9t5cr").innerHTML = ""; 
		document.getElementById("butDevice9Task5").style.width = "";
		document.getElementById("butDevice9Task6").style.width = "";
	}
	 
	if (d10t1cr=="0") {
		document.getElementById("d10t1cr").innerHTML = "";  // no CR between buttons
		document.getElementById("butDevice10Task1").style.width = ""; // remove absolut size 
		document.getElementById("butDevice10Task2").style.width = ""; // remove absolut size 
	} 
	if (d10t2cr=="0") {
		document.getElementById("d10t2cr").innerHTML = ""; 
		document.getElementById("butDevice10Task2").style.width = "";
		document.getElementById("butDevice10Task3").style.width = "";
	} 
	if (d10t3cr=="0") { 
		document.getElementById("d10t3cr").innerHTML = ""; 
		document.getElementById("butDevice10Task3").style.width = "";
		document.getElementById("butDevice10Task4").style.width = "";
	} 
	if (d10t4cr=="0") { 
		document.getElementById("d10t4cr").innerHTML = ""; 
		document.getElementById("butDevice10Task4").style.width = "";
		document.getElementById("butDevice10Task5").style.width = "";
	} 
	if (d10t5cr=="0") { 
		document.getElementById("d10t5cr").innerHTML = ""; 
		document.getElementById("butDevice10Task5").style.width = "";
		document.getElementById("butDevice10Task6").style.width = "";
	}
	 
		
	var devicebutton = '';
	var taskbutton = '';

	//////////////////////////// SET COLORS  ///////////////////////////
	fSetColorDevices(color1, color2, color3, color4, color5, color6, color7, color8, color9, color10);
	
	///////////////////////////// DEVICE 1 /////////////////////////////
	fFixDevice(device1, phone1, device1task1, message1_1, device1task2, message1_2, device1task3, message1_3, device1task4, message1_4, device1task5, message1_5, device1task6, message1_6, 1);	
		
	///////////////////////////// DEVICE 2 /////////////////////////////
	fFixDevice(device2, phone2, device2task1, message2_1, device2task2, message2_2, device2task3, message2_3, device2task4, message2_4, device2task5, message2_5, device2task6, message2_6, 2);

	///////////////////////////// DEVICE 3 ////////////////////////////
	fFixDevice(device3, phone3, device3task1, message3_1, device3task2, message3_2, device3task3, message3_3, device3task4, message3_4, device3task5, message3_5, device3task6, message3_6, 3);

	///////////////////////////// DEVICE 4 ////////////////////////////
	fFixDevice(device4, phone4, device4task1, message4_1, device4task2, message4_2, device4task3, message4_3, device4task4, message4_4, device4task5, message4_5, device4task6, message4_6, 4);

	///////////////////////////// DEVICE 5 ////////////////////////////
	fFixDevice(device5, phone5, device5task1, message5_1, device5task2, message5_2, device5task3, message5_3, device5task4, message5_4, device5task5, message5_5, device5task6, message5_6, 5);

	///////////////////////////// DEVICE 6 ////////////////////////////
	fFixDevice(device6, phone6, device6task1, message6_1, device6task2, message6_2, device6task3, message6_3, device6task4, message6_4, device6task5, message6_5, device6task6, message6_6, 6);

	///////////////////////////// DEVICE 7 /////////////////////////////
	fFixDevice(device7, phone7, device7task1, message7_1, device7task2, message7_2, device7task3, message7_3, device7task4, message7_4, device7task5, message7_5, device7task6, message7_6, 7);	

	///////////////////////////// DEVICE 8 /////////////////////////////
	fFixDevice(device8, phone8, device8task1, message8_1, device8task2, message8_2, device8task3, message8_3, device8task4, message8_4, device8task5, message8_5, device8task6, message8_6, 8);	

	///////////////////////////// DEVICE 9 /////////////////////////////
	fFixDevice(device9, phone9, device9task1, message9_1, device9task2, message9_2, device9task3, message9_3, device9task4, message9_4, device9task5, message9_5, device9task6, message9_6, 9);	

	///////////////////////////// DEVICE 10 /////////////////////////////
	fFixDevice(device10, phone10, device10task1, message10_1, device10task2, message10_2, device10task3, message10_3, device10task4, message10_4, device10task5, message10_5, device10task6, message10_6, 10);	

}


////////////////////////////////////////////////////////////////////////

function fFixSizes(ps,bs){
	if (ps=="0") {
		document.getElementById("rc_pict").src="pict/rc.png"
	} else {
		document.getElementById("rc_pict").src="pict/rc_small.png"
	}
	
	if (bs=="0") {
	} else {
		var all_buttons = document.getElementsByTagName("button"); 
	
		for(var i = 0; i < all_buttons.length; i++) {
			if(all_buttons[i].id.indexOf('Device') >= 0 && all_buttons[i].id.indexOf('SMS') == -1 ) {
				if (all_buttons[i].innerHTML == ''){
					all_buttons[i].style.height = '40px';
				} else {
					all_buttons[i].style.height = '';
				}
			}
		} 
		document.getElementById("butSetup").style.height = '40px';
	}	
}

function fFixDevice(device, phone, devicetask1, message1, devicetask2, message2, devicetask3, message3, devicetask4, message4, devicetask5, message5, devicetask6, message6, devnum){
	///////////////////////////// DEVICE device ///////////////////////
	if (device=="") {
		document.getElementById("divDevice" + devnum).innerHTML = '';
	} else {
		devicebutton = document.getElementById("divDevice" + devnum).innerHTML;
		devicebutton = devicebutton.replace("Device " + devnum, device); 
		
		document.getElementById("divDevice" + devnum).innerHTML = devicebutton;

		if (devicetask1=="") {
			document.getElementById("butDevice" + devnum + "Task1").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 1", devicetask1); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_1", message1); 

			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton
		}
		if (devicetask2=="") {
			document.getElementById("butDevice" + devnum + "Task2").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 2", devicetask2); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_2", message2); 
	
			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton

		}
		if (devicetask3=="") {
			document.getElementById("butDevice" + devnum + "Task3").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 3", devicetask3); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_3", message3); 
	
			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton

		}
		if (devicetask4=="") {
			document.getElementById("butDevice" + devnum + "Task4").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 4", devicetask4); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_4", message4); 
	
			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton

		}
		if (devicetask5=="") {
			document.getElementById("butDevice" + devnum + "Task5").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 5", devicetask5); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_5", message5); 
	
			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton

		}
		if (devicetask6=="") {
			document.getElementById("butDevice" + devnum + "Task6").style.display = 'none';
		} else {
			taskbutton = document.getElementById("divDevice" + devnum + "Tasks").innerHTML;
			taskbutton = taskbutton.replace("Device " + devnum + " Task 6", devicetask6); 
			taskbutton = taskbutton.replace("phone" + devnum, phone); 
			taskbutton = taskbutton.replace("message" + devnum + "_6", message6); 
	
			document.getElementById("divDevice" + devnum + "Tasks").innerHTML = taskbutton

		}
	}

}

////////////////////////////////////////////////////////////////////////

function fOpenDevice(device){

	fCloseSmsBoxes();
	fHideDevicesExceptOne(device);

	if (document.getElementById("divDevice" + device + "Tasks").style.display == ''){
		fHideTasks();
	}else{
		document.getElementById("divDevice" + device + "Tasks").style.display = '';
		s_t_t = setTimeout("fHideTasks()",show_tasks_TimeOut); // hide tasks after x seconds
		scrollTo(0,device * ScrollPos);
	}
}

function fStartBlink(device,task){

	b_t = setInterval(function(){fBlink(device,task)}, 400); // 2 x 200 ms per blink

}

function fBlink(device,task){

	$('#sd' + device + 't' + task)
	    .fadeOut(200) 
	    .fadeIn(200)
	;

}

function fStopBlink(){
	if (b_t != null) {
		clearInterval(b_t);
	}
}

function fOpenTask(device, task, sPhone, sMessage){

	fCloseSmsBoxes();
	fClearShowTaskTimeout();

	fStopBlink();
	fStartBlink(device,task);
    
    if(navigator.userAgent.toLowerCase().match(/android/)) {
        document.getElementById("Device" + device + "Task" + task + "YesNoTable").width=document.getElementById("OuterTable").clientWidth;
        document.getElementById("divDevice" + device + "Task" + task + "YesNo").style.display = '';
        document.getElementById("butDevice" + device + "Task" + task + "Yes").onclick = function (){fSendSms(sPhone,sMessage);};
    }

    if(navigator.userAgent.toLowerCase().match(/iphone|ipad/)){
         fSendSms(sPhone,sMessage);
    }
    
	s_t_t = setTimeout("fHideTasks()",show_tasks_TimeOut); // hide tasks after x seconds

}

function fOpenCloseInfoPro(){
	if(document.getElementById("divInfoProBody").style.display == ''){
		document.getElementById("DivOpenClose").innerHTML = "Information about Pro-version";
		document.getElementById("divInfoProBody").style.display = 'none';
	}else{
		document.getElementById("DivOpenClose").innerHTML = "Close information";
		document.getElementById("divInfoProBody").style.display = '';
	}	
}

////////////////////////////////////////////////////////////////////////

function fHideDevicesExceptOne(device){
	
	fClearShowTaskTimeout();

	var all_divs = document.getElementsByTagName("div"); 
	for(var i = 0; i < all_divs.length; i++) {
		if(all_divs[i].id.indexOf('Device') >= 0 
		&& all_divs[i].id.indexOf('Device' + device) == -1 
		&& all_divs[i].id.indexOf('Task') == -1 
		&& all_divs[i].id.indexOf('Setup') == -1) {
			all_divs[i].style.display = 'none';
		}
	} 
	
	document.getElementById("divSetup").style.display = 'none';
	document.getElementById("divMenuYN").style.display = 'none';

}


function fShowDevices(){
	
	fClearShowTaskTimeout();

	var all_divs = document.getElementsByTagName("div"); 
	
	for(var i = 0; i < all_divs.length; i++) {
		if(all_divs[i].id.indexOf('Device') >= 0 && all_divs[i].id.indexOf('Task') == -1  && all_divs[i].id.indexOf('Setup') == -1 ) {
			all_divs[i].style.display = '';
		}
	} 
	document.getElementById("divSetup").style.display = '';
	
	scrollTo(0,0);

}

function fSetColorDevices(color1, color2, color3, color4, color5, color6, color7, color8, color9, color10){

	var all_divs = document.getElementsByTagName("button"); 
	for(var i = 0; i < all_divs.length; i++) {
		if(all_divs[i].id.indexOf('butDevice1') >= 0) {
			all_divs[i].style.backgroundColor = color1;
		}
		if(all_divs[i].id.indexOf('butDevice2') >= 0) {
			all_divs[i].style.backgroundColor = color2;
		}
		if(all_divs[i].id.indexOf('butDevice3') >= 0) {
			all_divs[i].style.backgroundColor = color3;
		}
		if(all_divs[i].id.indexOf('butDevice4') >= 0) {
			all_divs[i].style.backgroundColor = color4;
		}
		if(all_divs[i].id.indexOf('butDevice5') >= 0) {
			all_divs[i].style.backgroundColor = color5;
		}
		if(all_divs[i].id.indexOf('butDevice6') >= 0) {
			all_divs[i].style.backgroundColor = color6;
		}
		if(all_divs[i].id.indexOf('butDevice7') >= 0) {
			all_divs[i].style.backgroundColor = color7;
		}
		if(all_divs[i].id.indexOf('butDevice8') >= 0) {
			all_divs[i].style.backgroundColor = color8;
		}
		if(all_divs[i].id.indexOf('butDevice9') >= 0) {
			all_divs[i].style.backgroundColor = color9;
		}
		if(all_divs[i].id.indexOf('butDevice10') >= 0) {
			all_divs[i].style.backgroundColor = color10;
		}
	} 

	document.getElementById("divSetupDevice1").style.backgroundColor = color1;
	document.getElementById("divSetupDevice2").style.backgroundColor = color2;
	document.getElementById("divSetupDevice3").style.backgroundColor = color3;
	document.getElementById("divSetupDevice4").style.backgroundColor = color4;
	document.getElementById("divSetupDevice5").style.backgroundColor = color5;
	document.getElementById("divSetupDevice6").style.backgroundColor = color6;
	document.getElementById("divSetupDevice7").style.backgroundColor = color7;
	document.getElementById("divSetupDevice8").style.backgroundColor = color8;
	document.getElementById("divSetupDevice9").style.backgroundColor = color9;
	document.getElementById("divSetupDevice10").style.backgroundColor = color10;
	 
}


function fHideTasks(){

	fClearShowTaskTimeout();
	fStopBlink();

	var all_divs = document.getElementsByTagName("div"); 
	
	for(var i = 0; i < all_divs.length; i++) {
		if(all_divs[i].id.indexOf('Device') >= 0 && all_divs[i].id.indexOf('Task') >= 0) {
			all_divs[i].style.display = 'none';
		}
	} 
	
	fShowDevices();
	fCloseSmsBoxes();
}


////////////////////////////////////////////////////////////////////////

function fClearShowTaskTimeout(){

	if (s_t_t != null) {
		clearTimeout(s_t_t);
	}

}



////////////////////////////////////////////////////////////////////////////////////////

function fSendSms(Phone, Message){

	fHideTasks();
	var SmsFromDevice=fDeviceFromSmsNr(Phone);

	var TaskFromDevice=fTaskFromDevice(SmsFromDevice,Message);
        if(navigator.userAgent.toLowerCase().match(/iphone|ipad/)) {
		Message = Message.replace(new RegExp('{CR}', 'g'), '\n');  // replace {CR}
		Message = Message.replace(new RegExp('{cr}', 'g'), '\n');  //      or {cr}
	}

        if(navigator.userAgent.toLowerCase().match(/android/)) {
		Message = Message.replace(new RegExp('{CR}', 'g'), '\r\n');  // replace {CR}
		Message = Message.replace(new RegExp('{cr}', 'g'), '\r\n');  //      or {cr}
		Message = Message.replace(new RegExp('####', 'g'), pincode); // replace #### with pin
	}

	Message = Message.replace(new RegExp('{QUOTES}', 'g'), '\"');// replace {QUOTES}

	
    if(navigator.userAgent.toLowerCase().match(/android|iphone|ipad/)) {
        if(navigator.userAgent.toLowerCase().match(/iphone|ipad/)) {
            window.plugins.smsComposer.showSMSComposer(Phone, Message);
            return true;
        } else {
            smsplugin.send(Phone, Message,"", function(data){fOk(SmsFromDevice,TaskFromDevice);}, function(e){ fError(e);});
            return false;
        }
    } else {
        //Not a phone
        fOk(SmsFromDevice,TaskFromDevice);
    }


}


function fOk(SmsFromDevice,TaskFromDevice){
	
	fCloseSmsBoxes();
	fShowSms(SmsFromDevice,"Command : <i>'" + TaskFromDevice + "'</i><br> sent.");

	fClearShowTaskTimeout();
	s_t_t = setTimeout("fHideTasks()",show_tasks_TimeOut); // hide tasks after x seconds

}


function fError(e){
	alert("Error: " + e);
}

function fSetupOpen(){

	if (document.getElementById("divSetupDeviceButtons").style.display == '') {
		fSetupCancel();
/*
		//document.getElementById("divSetup").style.display = 'none';
		//document.getElementById("divSetupText").innerHTML = 'Setup';
		document.getElementById("divSetupDeviceButtons").style.display = 'none';
		
		fCloseAllDeviceForms();
		fShowDevices();
		fFixSizes(picturesize,boxsize); // resize the boxes in normal mode
*/
	} else {
		fCloseSmsBoxes();	

		fHideTasks();
		fHideDevicesExceptOne(0);

		document.getElementById("divSetup").style.display = '';
		document.getElementById("divSetupText").innerHTML = 'Exit setup';
				
		document.getElementById("divSetupDeviceButtons").style.display = '';

		fFixSizes(1,1); // shrink the boxes in setup mode

		document.getElementById("divDevice1Setup").innerHTML = document.getElementById("divDevice1Setup").innerHTML.replace("Device 1", "<i>" + device1 + "&nbsp;</i>");
		document.getElementById("divDevice2Setup").innerHTML = document.getElementById("divDevice2Setup").innerHTML.replace("Device 2", "<i>" + device2 + "&nbsp;</i>");
		document.getElementById("divDevice3Setup").innerHTML = document.getElementById("divDevice3Setup").innerHTML.replace("Device 3", "<i>" + device3 + "&nbsp;</i>");
		document.getElementById("divDevice4Setup").innerHTML = document.getElementById("divDevice4Setup").innerHTML.replace("Device 4", "<i>" + device4 + "&nbsp;</i>");
		document.getElementById("divDevice5Setup").innerHTML = document.getElementById("divDevice5Setup").innerHTML.replace("Device 5", "<i>" + device5 + "&nbsp;</i>");
		document.getElementById("divDevice6Setup").innerHTML = document.getElementById("divDevice6Setup").innerHTML.replace("Device 6", "<i>" + device6 + "&nbsp;</i>");
		document.getElementById("divDevice7Setup").innerHTML = document.getElementById("divDevice7Setup").innerHTML.replace("Device 7", "<i>" + device7 + "&nbsp;</i>");
		document.getElementById("divDevice8Setup").innerHTML = document.getElementById("divDevice8Setup").innerHTML.replace("Device 8", "<i>" + device8 + "&nbsp;</i>");
		document.getElementById("divDevice9Setup").innerHTML = document.getElementById("divDevice9Setup").innerHTML.replace("Device 9", "<i>" + device9 + "&nbsp;</i>");
		document.getElementById("divDevice10Setup").innerHTML = document.getElementById("divDevice10Setup").innerHTML.replace("Device 10", "<i>" + device10 + "&nbsp;</i>");
		
		document.getElementById("formSetup").color1.value = color1;
		document.getElementById("formSetup").color2.value = color2;
		document.getElementById("formSetup").color3.value = color3;
		document.getElementById("formSetup").color4.value = color4;
		document.getElementById("formSetup").color5.value = color5;
		document.getElementById("formSetup").color6.value = color6;
		document.getElementById("formSetup").color7.value = color7;
		document.getElementById("formSetup").color8.value = color8;
		document.getElementById("formSetup").color9.value = color9;
		document.getElementById("formSetup").color10.value = color10;


		$(document).ready(function(){
			$('.simple_color_custom').simpleColor({
					cellWidth: 9,
					cellHeight: 9,
					border: '1px solid #333333',
					buttonClass: 'button',
					displayColorCode: true
			});
			
			$('input#alert_button').click( function() {
				alert($('input.simple_color_custom')[0].value);
			});
			
		});
		
		$(window).scrollTop(0);
	}
}

function fGotoMarket(){
	if(navigator.userAgent.toLowerCase().match(/android/)) {
		window.open('https://market.android.com/details?id=nu.fdp.sms_rc_pro', '_system');
	}
    if(navigator.userAgent.toLowerCase().match(/iphone|ipad/)) {
		//window.open('https://itunes.apple.com/us/app/sms-remote-control-pro-version/id808945949?ls=1&mt=8', '_system');
		window.open('https://itunes.apple.com/us/app/sms-remote-control-pro-version/id808945949?l=sv&ls=1&mt=8', '_system');
    }
}


function fOpenSetupDevice(devnum){
	//fOpenCloseInfoPro(); // close the ad
	document.getElementById("DivOpenClose").innerHTML = "Information about Pro-version";
	document.getElementById("divInfoProBody").style.display = 'none';
	
	document.getElementById("MenuYNTable").width=document.getElementById("OuterTable").clientWidth;

	if (devnum==0){
		if (document.getElementById("divSetupDevice0").style.display == '') {
			document.getElementById("divSetupDevice0").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice0").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==1){
		if (document.getElementById("divSetupDevice1").style.display == '') {
			document.getElementById("divSetupDevice1").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice1").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==2){
		if (document.getElementById("divSetupDevice2").style.display == '') {
			document.getElementById("divSetupDevice2").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice2").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==3){
		if (document.getElementById("divSetupDevice3").style.display == '') {
			document.getElementById("divSetupDevice3").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice3").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==4){
		if (document.getElementById("divSetupDevice4").style.display == '') {
			document.getElementById("divSetupDevice4").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice4").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==5){
		if (document.getElementById("divSetupDevice5").style.display == '') {
			document.getElementById("divSetupDevice5").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice5").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==6){
		if (document.getElementById("divSetupDevice6").style.display == '') {
			document.getElementById("divSetupDevice6").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice6").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==7){
		if (document.getElementById("divSetupDevice7").style.display == '') {
			document.getElementById("divSetupDevice7").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice7").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==8){
		if (document.getElementById("divSetupDevice8").style.display == '') {
			document.getElementById("divSetupDevice8").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice8").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==9){
		if (document.getElementById("divSetupDevice9").style.display == '') {
			document.getElementById("divSetupDevice9").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice9").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}
	if (devnum==10){
		if (document.getElementById("divSetupDevice10").style.display == '') {
			document.getElementById("divSetupDevice10").style.display = 'none';
		} else {
			document.getElementById("divSetupDevice10").style.display = '';
			document.getElementById("divMenuYN").style.display = '';
		}
	}

	if ((document.getElementById("divSetupDevice0").style.display == 'none') &&
	    (document.getElementById("divSetupDevice1").style.display == 'none') &&
	    (document.getElementById("divSetupDevice2").style.display == 'none') &&
	    (document.getElementById("divSetupDevice3").style.display == 'none') &&
	    (document.getElementById("divSetupDevice4").style.display == 'none') &&
	    (document.getElementById("divSetupDevice5").style.display == 'none') &&
	    (document.getElementById("divSetupDevice6").style.display == 'none') &&
	    (document.getElementById("divSetupDevice7").style.display == 'none') &&
	    (document.getElementById("divSetupDevice8").style.display == 'none') &&
	    (document.getElementById("divSetupDevice9").style.display == 'none') &&
	    (document.getElementById("divSetupDevice10").style.display == 'none')) {
		document.getElementById("divMenuYN").style.display = 'none';
	}

	if (picturesize=="0"){
		formSetup.picturenormal.checked="1";
	} else {
		formSetup.picturesmall.checked="1";
	}
	if (boxsize=="0"){
		formSetup.boxnormal.checked="1";
	} else {
		formSetup.boxsmall.checked="1";
	}
			
	formSetup.device1.value=device1;
	formSetup.color1.value=color1;
	formSetup.phone1.value=phone1;
	formSetup.device1task1.value=device1task1;
	formSetup.d1t1cr.checked=setboolean(d1t1cr);
	formSetup.message1_1.value=message1_1; 
	formSetup.device1task2.value=device1task2;
	formSetup.d1t2cr.checked=setboolean(d1t2cr);
	formSetup.message1_2.value=message1_2; 
	formSetup.device1task3.value=device1task3;
	formSetup.d1t3cr.checked=setboolean(d1t3cr);
	formSetup.message1_3.value=message1_3; 
	formSetup.device1task4.value=device1task4;
	formSetup.d1t4cr.checked=setboolean(d1t4cr);
	formSetup.message1_4.value=message1_4; 
	formSetup.device1task5.value=device1task5;
	formSetup.d1t5cr.checked=setboolean(d1t5cr);
	formSetup.message1_5.value=message1_5; 
	formSetup.device1task6.value=device1task6;
	formSetup.message1_6.value=message1_6; 

	formSetup.device2.value=device2;
	formSetup.color2.value=color2;
	formSetup.phone2.value=phone2;
	formSetup.device2task1.value=device2task1;
	formSetup.d2t1cr.checked=setboolean(d2t1cr);
	formSetup.message2_1.value=message2_1; 
	formSetup.device2task2.value=device2task2;
	formSetup.d2t2cr.checked=setboolean(d2t2cr);
	formSetup.message2_2.value=message2_2; 
	formSetup.device2task3.value=device2task3;
	formSetup.d2t3cr.checked=setboolean(d2t3cr);
	formSetup.message2_3.value=message2_3; 
	formSetup.device2task4.value=device2task4;
	formSetup.d2t4cr.checked=setboolean(d2t4cr);
	formSetup.message2_4.value=message2_4; 
	formSetup.device2task5.value=device2task5;
	formSetup.d2t5cr.checked=setboolean(d2t5cr);
	formSetup.message2_5.value=message2_5; 
	formSetup.device2task6.value=device2task6;
	formSetup.message2_6.value=message2_6; 

	formSetup.device3.value=device3;
	formSetup.color3.value=color3;
	formSetup.phone3.value=phone3;
	formSetup.device3task1.value=device3task1;
	formSetup.d3t1cr.checked=setboolean(d3t1cr);
	formSetup.message3_1.value=message3_1; 
	formSetup.device3task2.value=device3task2;
	formSetup.d3t2cr.checked=setboolean(d3t2cr);
	formSetup.message3_2.value=message3_2; 
	formSetup.device3task3.value=device3task3;
	formSetup.d3t3cr.checked=setboolean(d3t3cr);
	formSetup.message3_3.value=message3_3; 
	formSetup.device3task4.value=device3task4;
	formSetup.d3t4cr.checked=setboolean(d3t4cr);
	formSetup.message3_4.value=message3_4; 
	formSetup.device3task5.value=device3task5;
	formSetup.d3t5cr.checked=setboolean(d3t5cr);
	formSetup.message3_5.value=message3_5; 
	formSetup.device3task6.value=device3task6;
	formSetup.message3_6.value=message3_6; 

	formSetup.device4.value=device4;
	formSetup.color4.value=color4;
	formSetup.phone4.value=phone4;
	formSetup.device4task1.value=device4task1;
	formSetup.d4t1cr.checked=setboolean(d4t1cr);
	formSetup.message4_1.value=message4_1; 
	formSetup.device4task2.value=device4task2;
	formSetup.d4t2cr.checked=setboolean(d4t2cr);
	formSetup.message4_2.value=message4_2; 
	formSetup.device4task3.value=device4task3;
	formSetup.d4t3cr.checked=setboolean(d4t3cr);
	formSetup.message4_3.value=message4_3; 
	formSetup.device4task4.value=device4task4;
	formSetup.d4t4cr.checked=setboolean(d4t4cr);
	formSetup.message4_4.value=message4_4; 
	formSetup.device4task5.value=device4task5;
	formSetup.d4t5cr.checked=setboolean(d4t5cr);
	formSetup.message4_5.value=message4_5; 
	formSetup.device4task6.value=device4task6;
	formSetup.message4_6.value=message4_6; 

	formSetup.device5.value=device5;
	formSetup.color5.value=color5;
	formSetup.phone5.value=phone5;
	formSetup.device5task1.value=device5task1;
	formSetup.d5t1cr.checked=setboolean(d5t1cr);
	formSetup.message5_1.value=message5_1; 
	formSetup.device5task2.value=device5task2;
	formSetup.d5t2cr.checked=setboolean(d5t2cr);
	formSetup.message5_2.value=message5_2; 
	formSetup.device5task3.value=device5task3;
	formSetup.d5t3cr.checked=setboolean(d5t3cr);
	formSetup.message5_3.value=message5_3; 
	formSetup.device5task4.value=device5task4;
	formSetup.d5t4cr.checked=setboolean(d5t4cr);
	formSetup.message5_4.value=message5_4; 
	formSetup.device5task5.value=device5task5;
	formSetup.d5t5cr.checked=setboolean(d5t5cr);
	formSetup.message5_5.value=message5_5; 
	formSetup.device5task6.value=device5task6;
	formSetup.message5_6.value=message5_6; 

	formSetup.device6.value=device6;
	formSetup.color6.value=color6;
	formSetup.phone6.value=phone6;
	formSetup.device6task1.value=device6task1;
	formSetup.d6t1cr.checked=setboolean(d6t1cr);
	formSetup.message6_1.value=message6_1; 
	formSetup.device6task2.value=device6task2;
	formSetup.d6t2cr.checked=setboolean(d6t2cr);
	formSetup.message6_2.value=message6_2; 
	formSetup.device6task3.value=device6task3;
	formSetup.d6t3cr.checked=setboolean(d6t3cr);
	formSetup.message6_3.value=message6_3; 
	formSetup.device6task4.value=device6task4;
	formSetup.d6t4cr.checked=setboolean(d6t4cr);
	formSetup.message6_4.value=message6_4; 
	formSetup.device6task5.value=device6task5;
	formSetup.d6t5cr.checked=setboolean(d6t5cr);
	formSetup.message6_5.value=message6_5; 
	formSetup.device6task6.value=device6task6;
	formSetup.message6_6.value=message6_6; 

	formSetup.device7.value=device7;
	formSetup.color7.value=color7;
	formSetup.phone7.value=phone7;
	formSetup.device7task1.value=device7task1;
	formSetup.d7t1cr.checked=setboolean(d7t1cr);
	formSetup.message7_1.value=message7_1; 
	formSetup.device7task2.value=device7task2;
	formSetup.d7t2cr.checked=setboolean(d7t2cr);
	formSetup.message7_2.value=message7_2; 
	formSetup.device7task3.value=device7task3;
	formSetup.d7t3cr.checked=setboolean(d7t3cr);
	formSetup.message7_3.value=message7_3; 
	formSetup.device7task4.value=device7task4;
	formSetup.d7t4cr.checked=setboolean(d7t4cr);
	formSetup.message7_4.value=message7_4; 
	formSetup.device7task5.value=device7task5;
	formSetup.d7t5cr.checked=setboolean(d7t5cr);
	formSetup.message7_5.value=message7_5; 
	formSetup.device7task6.value=device7task6;
	formSetup.message7_6.value=message7_6; 

	formSetup.device8.value=device8;
	formSetup.color8.value=color8;
	formSetup.phone8.value=phone8;
	formSetup.device8task1.value=device8task1;
	formSetup.d8t1cr.checked=setboolean(d8t1cr);
	formSetup.message8_1.value=message8_1; 
	formSetup.device8task2.value=device8task2;
	formSetup.d8t2cr.checked=setboolean(d8t2cr);
	formSetup.message8_2.value=message8_2; 
	formSetup.device8task3.value=device8task3;
	formSetup.d8t3cr.checked=setboolean(d8t3cr);
	formSetup.message8_3.value=message8_3; 
	formSetup.device8task4.value=device8task4;
	formSetup.d8t4cr.checked=setboolean(d8t4cr);
	formSetup.message8_4.value=message8_4; 
	formSetup.device8task5.value=device8task5;
	formSetup.d8t5cr.checked=setboolean(d8t5cr);
	formSetup.message8_5.value=message8_5; 
	formSetup.device8task6.value=device8task6;
	formSetup.message8_6.value=message8_6; 

	formSetup.device9.value=device9;
	formSetup.color9.value=color9;
	formSetup.phone9.value=phone9;
	formSetup.device9task1.value=device9task1;
	formSetup.d9t1cr.checked=setboolean(d9t1cr);
	formSetup.message9_1.value=message9_1; 
	formSetup.device9task2.value=device9task2;
	formSetup.d9t2cr.checked=setboolean(d9t2cr);
	formSetup.message9_2.value=message9_2; 
	formSetup.device9task3.value=device9task3;
	formSetup.d9t3cr.checked=setboolean(d9t3cr);
	formSetup.message9_3.value=message9_3; 
	formSetup.device9task4.value=device9task4;
	formSetup.d9t4cr.checked=setboolean(d9t4cr);
	formSetup.message9_4.value=message9_4; 
	formSetup.device9task5.value=device9task5;
	formSetup.d9t5cr.checked=setboolean(d9t5cr);
	formSetup.message9_5.value=message9_5; 
	formSetup.device9task6.value=device9task6;
	formSetup.message9_6.value=message9_6; 

	formSetup.device10.value=device10;
	formSetup.color10.value=color10;
	formSetup.phone10.value=phone10;
	formSetup.device10task1.value=device10task1;
	formSetup.d10t1cr.checked=setboolean(d10t1cr);
	formSetup.message10_1.value=message10_1; 
	formSetup.device10task2.value=device10task2;
	formSetup.d10t2cr.checked=setboolean(d10t2cr);
	formSetup.message10_2.value=message10_2; 
	formSetup.device10task3.value=device10task3;
	formSetup.d10t3cr.checked=setboolean(d10t3cr);
	formSetup.message10_3.value=message10_3; 
	formSetup.device10task4.value=device10task4;
	formSetup.d10t4cr.checked=setboolean(d10t4cr);
	formSetup.message10_4.value=message10_4; 
	formSetup.device10task5.value=device10task5;
	formSetup.d10t5cr.checked=setboolean(d10t5cr);
	formSetup.message10_5.value=message10_5; 
	formSetup.device10task6.value=device10task6;
	formSetup.message10_6.value=message10_6; 

}

function fCloseAllDeviceForms(){
	document.getElementById("divSetupDevice0").style.display = 'none';
	document.getElementById("divSetupDevice1").style.display = 'none';
	document.getElementById("divSetupDevice2").style.display = 'none';
	document.getElementById("divSetupDevice3").style.display = 'none';
	document.getElementById("divSetupDevice4").style.display = 'none';
	document.getElementById("divSetupDevice5").style.display = 'none';
	document.getElementById("divSetupDevice6").style.display = 'none';
	document.getElementById("divSetupDevice7").style.display = 'none';
	document.getElementById("divSetupDevice8").style.display = 'none';
	document.getElementById("divSetupDevice9").style.display = 'none';
	document.getElementById("divSetupDevice10").style.display = 'none';
	document.getElementById("divMenuYN").style.display = 'none';

}

function fSetupClose(){
	document.getElementById("divSetupDeviceButtons").style.display = 'none';
	document.getElementById("divMenuYN").style.display = 'none';
	fCloseAllDeviceForms();
	document.getElementById("divSetupText").innerHTML = 'Setup';
	fShowDevices();
}

function fSetupCancel(){
	location.href='index.html';
}

function fUpdate(){
	var xml = '<?xml version="1.0" encoding="UTF-8"?>'

	if (formSetup.picturenormal.checked=="1") {
		xml += '<picturesize>0</picturesize>'
	} else {
		xml += '<picturesize>1</picturesize>'
	}

	if (formSetup.boxnormal.checked=="1") {
		xml += '<boxsize>0</boxsize>'
	} else {
		xml += '<boxsize>1</boxsize>'
	}
		
	xml += '<device1>' + formSetup.device1.value + '</device1>';
	xml += '<color1>' + formSetup.color1.value + '</color1>';
	xml += '<phone1>' + formSetup.phone1.value + '</phone1>';
	xml += '<device1task1>' + formSetup.device1task1.value + '</device1task1>';
	xml += '<d1t1cr>' + getboolean(formSetup.d1t1cr.checked) + '</d1t1cr>';
	xml += '<message1_1>' + formSetup.message1_1.value + '</message1_1>';
	xml += '<device1task2>' + formSetup.device1task2.value + '</device1task2>';
	xml += '<d1t2cr>' + getboolean(formSetup.d1t2cr.checked) + '</d1t2cr>';
	xml += '<message1_2>' + formSetup.message1_2.value + '</message1_2>';
	xml += '<device1task3>' + formSetup.device1task3.value + '</device1task3>';
	xml += '<d1t3cr>' + getboolean(formSetup.d1t3cr.checked) + '</d1t3cr>';
	xml += '<message1_3>' + formSetup.message1_3.value + '</message1_3>';
	xml += '<device1task4>' + formSetup.device1task4.value + '</device1task4>';
	xml += '<d1t4cr>' + getboolean(formSetup.d1t4cr.checked) + '</d1t4cr>';
	xml += '<message1_4>' + formSetup.message1_4.value + '</message1_4>';
	xml += '<device1task5>' + formSetup.device1task5.value + '</device1task5>';
	xml += '<d1t5cr>' + getboolean(formSetup.d1t5cr.checked) + '</d1t5cr>';
	xml += '<message1_5>' + formSetup.message1_5.value + '</message1_5>';
	xml += '<device1task6>' + formSetup.device1task6.value + '</device1task6>';
	xml += '<message1_6>' + formSetup.message1_6.value + '</message1_6>';

	xml += '<device2>' + formSetup.device2.value + '</device2>';
	xml += '<color2>' + formSetup.color2.value + '</color2>';
	xml += '<phone2>' + formSetup.phone2.value + '</phone2>';
	xml += '<device2task1>' + formSetup.device2task1.value + '</device2task1>';
	xml += '<d2t1cr>' + getboolean(formSetup.d2t1cr.checked) + '</d2t1cr>';
	xml += '<message2_1>' + formSetup.message2_1.value + '</message2_1>';
	xml += '<device2task2>' + formSetup.device2task2.value + '</device2task2>';
	xml += '<d2t2cr>' + getboolean(formSetup.d2t2cr.checked) + '</d2t2cr>';
	xml += '<message2_2>' + formSetup.message2_2.value + '</message2_2>';
	xml += '<device2task3>' + formSetup.device2task3.value + '</device2task3>';
	xml += '<d2t3cr>' + getboolean(formSetup.d2t3cr.checked) + '</d2t3cr>';
	xml += '<message2_3>' + formSetup.message2_3.value + '</message2_3>';
	xml += '<device2task4>' + formSetup.device2task4.value + '</device2task4>';
	xml += '<d2t4cr>' + getboolean(formSetup.d2t4cr.checked) + '</d2t4cr>';
	xml += '<message2_4>' + formSetup.message2_4.value + '</message2_4>';
	xml += '<device2task5>' + formSetup.device2task5.value + '</device2task5>';
	xml += '<d2t5cr>' + getboolean(formSetup.d2t5cr.checked) + '</d2t5cr>';
	xml += '<message2_5>' + formSetup.message2_5.value + '</message2_5>';
	xml += '<device2task6>' + formSetup.device2task6.value + '</device2task6>';
	xml += '<message2_6>' + formSetup.message2_6.value + '</message2_6>';

	xml += '<device3>' + formSetup.device3.value + '</device3>';
	xml += '<color3>' + formSetup.color3.value + '</color3>';
	xml += '<phone3>' + formSetup.phone3.value + '</phone3>';
	xml += '<device3task1>' + formSetup.device3task1.value + '</device3task1>';
	xml += '<d3t1cr>' + getboolean(formSetup.d3t1cr.checked) + '</d3t1cr>';
	xml += '<message3_1>' + formSetup.message3_1.value + '</message3_1>';
	xml += '<device3task2>' + formSetup.device3task2.value + '</device3task2>';
	xml += '<d3t2cr>' + getboolean(formSetup.d3t2cr.checked) + '</d3t2cr>';
	xml += '<message3_2>' + formSetup.message3_2.value + '</message3_2>';
	xml += '<device3task3>' + formSetup.device3task3.value + '</device3task3>';
	xml += '<d3t3cr>' + getboolean(formSetup.d3t3cr.checked) + '</d3t3cr>';
	xml += '<message3_3>' + formSetup.message3_3.value + '</message3_3>';
	xml += '<device3task4>' + formSetup.device3task4.value + '</device3task4>';
	xml += '<d3t4cr>' + getboolean(formSetup.d3t4cr.checked) + '</d3t4cr>';
	xml += '<message3_4>' + formSetup.message3_4.value + '</message3_4>';
	xml += '<device3task5>' + formSetup.device3task5.value + '</device3task5>';
	xml += '<d3t5cr>' + getboolean(formSetup.d3t5cr.checked) + '</d3t5cr>';
	xml += '<message3_5>' + formSetup.message3_5.value + '</message3_5>';
	xml += '<device3task6>' + formSetup.device3task6.value + '</device3task6>';
	xml += '<message3_6>' + formSetup.message3_6.value + '</message3_6>';

	xml += '<device4>' + formSetup.device4.value + '</device4>';
	xml += '<color4>' + formSetup.color4.value + '</color4>';
	xml += '<phone4>' + formSetup.phone4.value + '</phone4>';
	xml += '<device4task1>' + formSetup.device4task1.value + '</device4task1>';
	xml += '<d4t1cr>' + getboolean(formSetup.d4t1cr.checked) + '</d4t1cr>';
	xml += '<message4_1>' + formSetup.message4_1.value + '</message4_1>';
	xml += '<device4task2>' + formSetup.device4task2.value + '</device4task2>';
	xml += '<d4t2cr>' + getboolean(formSetup.d4t2cr.checked) + '</d4t2cr>';
	xml += '<message4_2>' + formSetup.message4_2.value + '</message4_2>';
	xml += '<device4task3>' + formSetup.device4task3.value + '</device4task3>';
	xml += '<d4t3cr>' + getboolean(formSetup.d4t3cr.checked) + '</d4t3cr>';
	xml += '<message4_3>' + formSetup.message4_3.value + '</message4_3>';
	xml += '<device4task4>' + formSetup.device4task4.value + '</device4task4>';
	xml += '<d4t4cr>' + getboolean(formSetup.d4t4cr.checked) + '</d4t4cr>';
	xml += '<message4_4>' + formSetup.message4_4.value + '</message4_4>';
	xml += '<device4task5>' + formSetup.device4task5.value + '</device4task5>';
	xml += '<d4t5cr>' + getboolean(formSetup.d4t5cr.checked) + '</d4t5cr>';
	xml += '<message4_5>' + formSetup.message4_5.value + '</message4_5>';
	xml += '<device4task6>' + formSetup.device4task6.value + '</device4task6>';
	xml += '<message4_6>' + formSetup.message4_6.value + '</message4_6>';

	xml += '<device5>' + formSetup.device5.value + '</device5>';
	xml += '<color5>' + formSetup.color5.value + '</color5>';
	xml += '<phone5>' + formSetup.phone5.value + '</phone5>';
	xml += '<device5task1>' + formSetup.device5task1.value + '</device5task1>';
	xml += '<d5t1cr>' + getboolean(formSetup.d5t1cr.checked) + '</d5t1cr>';
	xml += '<message5_1>' + formSetup.message5_1.value + '</message5_1>';
	xml += '<device5task2>' + formSetup.device5task2.value + '</device5task2>';
	xml += '<d5t2cr>' + getboolean(formSetup.d5t2cr.checked) + '</d5t2cr>';
	xml += '<message5_2>' + formSetup.message5_2.value + '</message5_2>';
	xml += '<device5task3>' + formSetup.device5task3.value + '</device5task3>';
	xml += '<d5t3cr>' + getboolean(formSetup.d5t3cr.checked) + '</d5t3cr>';
	xml += '<message5_3>' + formSetup.message5_3.value + '</message5_3>';
	xml += '<device5task4>' + formSetup.device5task4.value + '</device5task4>';
	xml += '<d5t4cr>' + getboolean(formSetup.d5t4cr.checked) + '</d5t4cr>';
	xml += '<message5_4>' + formSetup.message5_4.value + '</message5_4>';
	xml += '<device5task5>' + formSetup.device5task5.value + '</device5task5>';
	xml += '<d5t5cr>' + getboolean(formSetup.d5t5cr.checked) + '</d5t5cr>';
	xml += '<message5_5>' + formSetup.message5_5.value + '</message5_5>';
	xml += '<device5task6>' + formSetup.device5task6.value + '</device5task6>';
	xml += '<message5_6>' + formSetup.message5_6.value + '</message5_6>';

	xml += '<device6>' + formSetup.device6.value + '</device6>';
	xml += '<color6>' + formSetup.color6.value + '</color6>';
	xml += '<phone6>' + formSetup.phone6.value + '</phone6>';
	xml += '<device6task1>' + formSetup.device6task1.value + '</device6task1>';
	xml += '<d6t1cr>' + getboolean(formSetup.d6t1cr.checked) + '</d6t1cr>';
	xml += '<message6_1>' + formSetup.message6_1.value + '</message6_1>';
	xml += '<device6task2>' + formSetup.device6task2.value + '</device6task2>';
	xml += '<d6t2cr>' + getboolean(formSetup.d6t2cr.checked) + '</d6t2cr>';
	xml += '<message6_2>' + formSetup.message6_2.value + '</message6_2>';
	xml += '<device6task3>' + formSetup.device6task3.value + '</device6task3>';
	xml += '<d6t3cr>' + getboolean(formSetup.d6t3cr.checked) + '</d6t3cr>';
	xml += '<message6_3>' + formSetup.message6_3.value + '</message6_3>';
	xml += '<device6task4>' + formSetup.device6task4.value + '</device6task4>';
	xml += '<d6t4cr>' + getboolean(formSetup.d6t4cr.checked) + '</d6t4cr>';
	xml += '<message6_4>' + formSetup.message6_4.value + '</message6_4>';
	xml += '<device6task5>' + formSetup.device6task5.value + '</device6task5>';
	xml += '<d6t5cr>' + getboolean(formSetup.d6t5cr.checked) + '</d6t5cr>';
	xml += '<message6_5>' + formSetup.message6_5.value + '</message6_5>';
	xml += '<device6task6>' + formSetup.device6task6.value + '</device6task6>';
	xml += '<message6_6>' + formSetup.message6_6.value + '</message6_6>';

	xml += '<device7>' + formSetup.device7.value + '</device7>';
	xml += '<color7>' + formSetup.color7.value + '</color7>';
	xml += '<phone7>' + formSetup.phone7.value + '</phone7>';
	xml += '<device7task1>' + formSetup.device7task1.value + '</device7task1>';
	xml += '<d7t1cr>' + getboolean(formSetup.d7t1cr.checked) + '</d7t1cr>';
	xml += '<message7_1>' + formSetup.message7_1.value + '</message7_1>';
	xml += '<device7task2>' + formSetup.device7task2.value + '</device7task2>';
	xml += '<d7t2cr>' + getboolean(formSetup.d7t2cr.checked) + '</d7t2cr>';
	xml += '<message7_2>' + formSetup.message7_2.value + '</message7_2>';
	xml += '<device7task3>' + formSetup.device7task3.value + '</device7task3>';
	xml += '<d7t3cr>' + getboolean(formSetup.d7t3cr.checked) + '</d7t3cr>';
	xml += '<message7_3>' + formSetup.message7_3.value + '</message7_3>';
	xml += '<device7task4>' + formSetup.device7task4.value + '</device7task4>';
	xml += '<d7t4cr>' + getboolean(formSetup.d7t4cr.checked) + '</d7t4cr>';
	xml += '<message7_4>' + formSetup.message7_4.value + '</message7_4>';
	xml += '<device7task5>' + formSetup.device7task5.value + '</device7task5>';
	xml += '<d7t5cr>' + getboolean(formSetup.d7t5cr.checked) + '</d7t5cr>';
	xml += '<message7_5>' + formSetup.message7_5.value + '</message7_5>';
	xml += '<device7task6>' + formSetup.device7task6.value + '</device7task6>';
	xml += '<message7_6>' + formSetup.message7_6.value + '</message7_6>';

	xml += '<device8>' + formSetup.device8.value + '</device8>';
	xml += '<color8>' + formSetup.color8.value + '</color8>';
	xml += '<phone8>' + formSetup.phone8.value + '</phone8>';
	xml += '<device8task1>' + formSetup.device8task1.value + '</device8task1>';
	xml += '<d8t1cr>' + getboolean(formSetup.d8t1cr.checked) + '</d8t1cr>';
	xml += '<message8_1>' + formSetup.message8_1.value + '</message8_1>';
	xml += '<device8task2>' + formSetup.device8task2.value + '</device8task2>';
	xml += '<d8t2cr>' + getboolean(formSetup.d8t2cr.checked) + '</d8t2cr>';
	xml += '<message8_2>' + formSetup.message8_2.value + '</message8_2>';
	xml += '<device8task3>' + formSetup.device8task3.value + '</device8task3>';
	xml += '<d8t3cr>' + getboolean(formSetup.d8t3cr.checked) + '</d8t3cr>';
	xml += '<message8_3>' + formSetup.message8_3.value + '</message8_3>';
	xml += '<device8task4>' + formSetup.device8task4.value + '</device8task4>';
	xml += '<d8t4cr>' + getboolean(formSetup.d8t4cr.checked) + '</d8t4cr>';
	xml += '<message8_4>' + formSetup.message8_4.value + '</message8_4>';
	xml += '<device8task5>' + formSetup.device8task5.value + '</device8task5>';
	xml += '<d8t5cr>' + getboolean(formSetup.d8t5cr.checked) + '</d8t5cr>';
	xml += '<message8_5>' + formSetup.message8_5.value + '</message8_5>';
	xml += '<device8task6>' + formSetup.device8task6.value + '</device8task6>';
	xml += '<message8_6>' + formSetup.message8_6.value + '</message8_6>';

	xml += '<device9>' + formSetup.device9.value + '</device9>';
	xml += '<color9>' + formSetup.color9.value + '</color9>';
	xml += '<phone9>' + formSetup.phone9.value + '</phone9>';
	xml += '<device9task1>' + formSetup.device9task1.value + '</device9task1>';
	xml += '<d9t1cr>' + getboolean(formSetup.d9t1cr.checked) + '</d9t1cr>';
	xml += '<message9_1>' + formSetup.message9_1.value + '</message9_1>';
	xml += '<device9task2>' + formSetup.device9task2.value + '</device9task2>';
	xml += '<d9t2cr>' + getboolean(formSetup.d9t2cr.checked) + '</d9t2cr>';
	xml += '<message9_2>' + formSetup.message9_2.value + '</message9_2>';
	xml += '<device9task3>' + formSetup.device9task3.value + '</device9task3>';
	xml += '<d9t3cr>' + getboolean(formSetup.d9t3cr.checked) + '</d9t3cr>';
	xml += '<message9_3>' + formSetup.message9_3.value + '</message9_3>';
	xml += '<device9task4>' + formSetup.device9task4.value + '</device9task4>';
	xml += '<d9t4cr>' + getboolean(formSetup.d9t4cr.checked) + '</d9t4cr>';
	xml += '<message9_4>' + formSetup.message9_4.value + '</message9_4>';
	xml += '<device9task5>' + formSetup.device9task5.value + '</device9task5>';
	xml += '<d9t5cr>' + getboolean(formSetup.d9t5cr.checked) + '</d9t5cr>';
	xml += '<message9_5>' + formSetup.message9_5.value + '</message9_5>';
	xml += '<device9task6>' + formSetup.device9task6.value + '</device9task6>';
	xml += '<message9_6>' + formSetup.message9_6.value + '</message9_6>';

	xml += '<device10>' + formSetup.device10.value + '</device10>';
	xml += '<color10>' + formSetup.color10.value + '</color10>';
	xml += '<phone10>' + formSetup.phone10.value + '</phone10>';
	xml += '<device10task1>' + formSetup.device10task1.value + '</device10task1>';
	xml += '<d10t1cr>' + getboolean(formSetup.d10t1cr.checked) + '</d10t1cr>';
	xml += '<message10_1>' + formSetup.message10_1.value + '</message10_1>';
	xml += '<device10task2>' + formSetup.device10task2.value + '</device10task2>';
	xml += '<d10t2cr>' + getboolean(formSetup.d10t2cr.checked) + '</d10t2cr>';
	xml += '<message10_2>' + formSetup.message10_2.value + '</message10_2>';
	xml += '<device10task3>' + formSetup.device10task3.value + '</device10task3>';
	xml += '<d10t3cr>' + getboolean(formSetup.d10t3cr.checked) + '</d10t3cr>';
	xml += '<message10_3>' + formSetup.message10_3.value + '</message10_3>';
	xml += '<device10task4>' + formSetup.device10task4.value + '</device10task4>';
	xml += '<d10t4cr>' + getboolean(formSetup.d10t4cr.checked) + '</d10t4cr>';
	xml += '<message10_4>' + formSetup.message10_4.value + '</message10_4>';
	xml += '<device10task5>' + formSetup.device10task5.value + '</device10task5>';
	xml += '<d10t5cr>' + getboolean(formSetup.d10t5cr.checked) + '</d10t5cr>';
	xml += '<message10_5>' + formSetup.message10_5.value + '</message10_5>';
	xml += '<device10task6>' + formSetup.device10task6.value + '</device10task6>';
	xml += '<message10_6>' + formSetup.message10_6.value + '</message10_6>';

	if(navigator.userAgent.toLowerCase().match(/android/)||navigator.userAgent.toLowerCase().match(/iphone|ipad/)) {

		fWriteSettings(xml);
	}

	fSetupClose();
}

function getboolean(bool){
	if (bool == true){
		return "1";
	} else {
		return "0";
	}
}

function setboolean(bool){
	if (bool == "1"){
		return true;
	} else {
		return false;
	}
}

function fExit(){
	if (document.getElementById("divSetupDeviceButtons").style.display == '') {
		fSetupCancel();
	} else {
		if(navigator.userAgent.toLowerCase().match(/android/)) {
			navigator.app.exitApp();
			return false;
		}else{
			window.close();
			return false;
		}
	}
}

