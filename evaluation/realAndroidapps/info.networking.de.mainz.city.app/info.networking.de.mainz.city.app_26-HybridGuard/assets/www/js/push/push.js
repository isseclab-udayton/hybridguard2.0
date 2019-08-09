//-------- FUNKTIONEN -------------//
var pushNotification = null;
var deviceID = "";
var url_to_push = "http://195.145.244.220/mainzandmore_phone_testpush/";
var DEVICETOKEN_URL_IOS = "push_device.php";
var PUSH_DIALOG_TITLE = "Mainz&more";
//Android
var DEVICETOKEN_URL_ANDROID = "push_device_android.php";
var SENDER_ID = "673580924962";

//Registriert das Gerät für den Empfang von Push Benachrichtigungen
function pushRegister()
{
    pushNotification = window.plugins.pushNotification;
    
    if(device.platform == 'Android') {
        pushNotification.register(successHandlerAndroid, errorHandlerAndroid, { "senderID":SENDER_ID, "ecb":"onNotificationGCM" });		// required!
    }
    else {
        pushNotification.register(tokenHandler, errorHandler,{"badge":"true","sound":"true","alert":"true","ecb":"onNotificationAPN"});	// required!
    }
    
}

/************************ ANDROID ******************/
function successHandlerAndroid (result) {
    printOnConsole("successHandlerAndroid",'success: '+ result);
}

function errorHandlerAndroid(error) {
    
    printOnConsole("errorHandler",'error: '+ result);
}

//Verarbeitet die GCM-Notifications
function onNotificationGCM(e) {
    
    switch( e.event )
    {
        case 'registered':
            
            if ( e.regid.length > 0 )
            {
                deviceID = "" + e.regid;
                
                $("#devID").text(deviceID.substr(0, 10));
                
                $("#deviceIDString").text("ID: " + deviceID.substr(0, 10));
                
                //versenden des Token
                $.ajax({			
                		url: url_to_push + DEVICETOKEN_URL_ANDROID, 
                		data: { token: deviceID, device_id: ""+device.uuid },
                		type: "POST",
                		success: function( data ) {
                			//alert("successfully registered with: " + data);
                		},
                		error: function(err) {
                			//alert("could not register device!" + err);
                		}
                });
            }
            break;
            
        case 'message':
            // if this flag is set, this notification happened while we were in the foreground.
            // you might want to play a sound to get the user's attention, throw up a dialog, etc.
            if (e.foreground)
            {
                
                //if the notification contains a soundname, play it.
                var my_media = new Media("file:///android_asset/www/js/push/audio/beep.wav");
                my_media.play();
            }
            else
            {
                // otherwise we were launched because the user touched a notification in the notification tray.
                if (e.coldstart)
                    printOnConsole("onNotificationGCM",'---- COLDSTART NOTIFICATION ----');
                else
                    printOnConsole("onNotificationGCMr",'------ BACKGROUND NOTIFICATION----');
            }
            
            ui.showDialog(PUSH_DIALOG_TITLE, e.payload.message);
            
            break;
            
        case 'error':
            deviceID = e.msg;
            break;
            
        default:
            printOnConsole("onNotificationGCM",'EVENT -> Unknown, an event was received and we do not know what it is');
            break;
    }
}



/************************* IOS ********************/

//Verarbeitet die APNS-Notifications
function onNotificationAPN(e) {
    
    if (e.alert)
    {
//        navigator.notification.alert(e.alert);
    }
    
    if (e.sound)
    {
        var snd = new Media(e.sound);
        snd.play();
    }
    
    if (e.badge)
    {
        pushNotification.setApplicationIconBadgeNumber(successHandler, e.badge);
    }
}

function successHandler(result) {
    
    printOnConsole("successHandler",'success: '+ result);
}


//erfolgreiche IOS Registration
function tokenHandler(result) {
    
    deviceID = result;
    
    $("#devID").text(deviceID.substr(0, 10));
    
    $("#deviceIDString").text("ID: " + deviceID.substr(0, 10));
    
    //versenden des Token
    $.post( url_to_push + DEVICETOKEN_URL_IOS, { token: deviceID, device: 'smartphone' },function( data ) {});
    
}

//Fehler bei der IOS Registration
function errorHandler(error)
{
    deviceID = error;
}

// Der Eventhandler für die Checkbox passt hier am Ehesten hin
//$("#blitzerNotificationsActive").change(function()
//                                        {
//                                            if ($(this).prop("checked") == true)
//                                            {
//                                                window.localStorage.setItem("pushAllowed", "true");
//                                            }
//                                            else
//                                            {
//                                                window.localStorage.setItem("pushAllowed", "false");
//                                            }
//                                        });