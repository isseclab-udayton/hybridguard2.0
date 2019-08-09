var pushNamespace = {};
//Set this to true in order to test push notifications in the emulator. Note, that you will not be able to actually receive 
//push notifications because we will generate fake push tokens. But you will be able to test your other push-related functionality without getting errors.
pushNamespace.emulatorMode = false;
pushNamespace.var = {};
pushNamespace.var.lastFeed = null;
pushNamespace.var.onColdStartYourDefinedFunction = function(){};
pushNamespace.var.pushEnabled = false;

pushNamespace.onDeviceReadyPush = function() {
};

document.addEventListener("deviceready", pushNamespace.onDeviceReadyPush, false);

//Initialize the Telerik BackEnd Services SDK
pushNamespace.el = new Everlive({
    apiKey: domainNameSpace.baasApiKey,
    scheme: domainNameSpace.baasScheme
});

pushNamespace.successText = "SUCCESS!<br /><br />The device has been initialized for push notifications.<br /><br />";

pushNamespace._onDeviceIsRegistered = function() {    
    customNamespace.console('Notification Is Now Registered and will be updated');

    
    pushNamespace.updateRegistration();
    //alert( "Device is registered in Telerik BackEnd Services and can receive push notifications.")
};

pushNamespace._onDeviceIsNotRegistered = function() {
    //alert("Device is not registered in Telerik BackEnd Services.")
    pushNamespace.registerInEverlive();
};

pushNamespace._onDeviceIsNotInitialized = function(callbackfunction) {
    customNamespace.console('Notification Is Now Disabled');
};

pushNamespace._onDeviceRegistrationUpdated = function() {
    customNamespace.console('Notification Is Now Updated');
};

pushNamespace.onAndroidPushReceived = function(args) {
    pushNamespace.onPushReceivedOfAnyPhone(args);
};

pushNamespace.onIosPushReceived = function(args) {
    pushNamespace.onPushReceivedOfAnyPhone(args);
    //alert('iOS notification received: ' + JSON.stringify(args)); 
};

pushNamespace.onPushReceivedOfAnyPhone = function(args){
    
    pushNamespace.var.lastFeed = args;
    pushNamespace.determineActionOnForeAndBack();  // on foreground and background, on coldstart is put in login  
    console.log(args);
    
    //alert('Notification received: ' + JSON.stringify(args)); 
}

pushNamespace.determineActionOnForeAndBack = function(){
    
    
    try{
    var lastFeed = pushNamespace.var.lastFeed ;
    //alert('Notification received: ' + JSON.stringify(lastFeed)); 
    if ( lastFeed == null ) {
        // do nothing
    } else if ( lastFeed != null ) {
        
        var coldStart =  lastFeed.coldstart;
        var foreground = lastFeed.foreground; // coldstart = true then foreground = false
        if ( coldStart == true ) { // case coldstart
            $('#commonFooterToNotificationView').trigger('click');
        }
        else if ( foreground == true ) { // case foreground
            if( notificationNameSpace.IsEnableVibration == true || notificationNameSpace.IsEnableVibration == 'true' ) {
                navigator.notification.vibrate(500);
            }
            navigator.notification.beep(1);
            
            notificationNameSpace.getNotificationCount();
            notificationNameSpace.display.initialize();
            fansNameSpace.getNotificationCount();
            pushNamespace.var.lastFeed = null; // restart the lastFeed
        }    
        else if ( foreground == false ){ // case background
            $('#commonFooterToNotificationView').trigger('click');
            pushNamespace.var.lastFeed = null; // restart the lastFeed
        }
        
    }
    } catch(err){customNamespace.console(err.message)}
}

//Initializes the device for push notifications.
pushNamespace.enablePushNewUser = function () {
       
    pushNamespace.var.pushEnabled = true;
    
    //Initialization settings
    var pushSettings = {
        android: {
            senderID: domainNameSpace.androidProjectNumber
        },
        iOS: {
            badge: "true",
            sound: "true",
            alert: "true"
        },
        notificationCallbackAndroid : pushNamespace.onAndroidPushReceived,
        notificationCallbackIOS: pushNamespace.onIosPushReceived
    }
    
    //alert("Initializing push notifications...");
    
    var currentDevice = pushNamespace.el.push.currentDevice(pushNamespace.emulatorMode);
    
    currentDevice.enableNotifications(pushSettings)
        .then(
            function(initResult) {       
                customNamespace.console("pushNamespace.enablePushNewUser  initResult  : " + JSON.stringify( initResult ) );           
                return currentDevice.getRegistration();
            },
            function(err) {
                customNamespace.console("Notification Unable to be Enabled : " + err.message);
            }
        ).then(
            function(registration) {  
                pushNamespace._onDeviceIsRegistered();                      
            },
            function(err) {                        
                if(err.code === 801) {
                    pushNamespace._onDeviceIsNotRegistered();      
                }
                else {        
                    customNamespace.console("pushNamespace.enablePushNewUser ERROR!<br /><br />An error occured while checking device registration status:  " + JSON.stringify( err )  + " <br/><br/>");                
                }
            }
        );
};

//Initializes the device for push notifications.
pushNamespace.enablePushNotifications = function () {
    
    
    if( pushNamespace.var.pushEnabled == true ) {
        return false;
    }
    else if( pushNamespace.var.pushEnabled == false ) {
        pushNamespace.var.pushEnabled = true;
    }
    
    //Initialization settings
    var pushSettings = {
        android: {
            senderID: domainNameSpace.androidProjectNumber
        },
        iOS: {
            badge: "true",
            sound: "true",
            alert: "true"
        },
        notificationCallbackAndroid : pushNamespace.onAndroidPushReceived,
        notificationCallbackIOS: pushNamespace.onIosPushReceived
    }
    
    //alert("Initializing push notifications...");
    
    var currentDevice = pushNamespace.el.push.currentDevice(pushNamespace.emulatorMode);
    
    currentDevice.enableNotifications(pushSettings)
        .then(
            function(initResult) {     
                customNamespace.console("pushNamespace.enablePushNotifications initResult  : " + JSON.stringify( initResult ) );           
                return currentDevice.getRegistration();
            },
            function(err) {
                customNamespace.console("Notification Unable to be Enabled : " + err.message);
            }
        ).then(
            function(registration) {  
                pushNamespace._onDeviceIsRegistered();                      
            },
            function(err) {                        
                if(err.code === 801) {
                    pushNamespace._onDeviceIsNotRegistered();      
                }
                else {                        
                    customNamespace.console("pushNamespace.enablePushNotifications ERROR!<br /><br />An error occured while checking device registration status: " + JSON.stringify( err )  + " <br/><br/>");                
                }
            }
        );
};

pushNamespace.registerInEverlive = function() {
    var currentDevice = pushNamespace.el.push.currentDevice();
    
    if (!currentDevice.pushToken) currentDevice.pushToken = "some token";
        
    pushNamespace.el.push.currentDevice()
        .register({ profileId: loginNameSpace.loggedUserID })
        .then(
            pushNamespace._onDeviceIsRegistered(),
            function(err) {
                customNamespace.console('REGISTER ERROR: ' + JSON.stringify(err));
            }
        );
       
};

pushNamespace.disablePushNotifications = function(callbackfunction) {
    pushNamespace.var.pushEnabled = false;
    pushNamespace.el.push.currentDevice()
        .disableNotifications()
        .then(
            pushNamespace._onDeviceIsNotInitialized(callbackfunction),
            function(err) {
                customNamespace.console('UNREGISTER ERROR: ' + JSON.stringify(err));
            }
        );
};

pushNamespace.updateRegistration = function() {
    pushNamespace.el.push.currentDevice()
        .updateRegistration({ profileId: loginNameSpace.loggedUserID })
        .then(
            pushNamespace._onDeviceRegistrationUpdated,
            function(err) {
                customNamespace.console('UPDATE ERROR: ' + JSON.stringify(err));
            }
        );
};