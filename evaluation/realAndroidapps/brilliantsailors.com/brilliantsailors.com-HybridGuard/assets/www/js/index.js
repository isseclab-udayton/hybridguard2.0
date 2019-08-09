/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {

     
	
		//
		// check network start
		  var networkState = navigator.network.connection.type;
            var states = {};
            states[Connection.UNKNOWN]  = 'Unknown connection';
            states[Connection.ETHERNET] = 'Ethernet connection';
            states[Connection.WIFI]     = 'WiFi connection';
            states[Connection.CELL_2G]  = 'Cell 2G connection';
            states[Connection.CELL_3G]  = 'Cell 3G connection';
            states[Connection.CELL_4G]  = 'Cell 4G connection';
            states[Connection.NONE]     = 'No network connection';
			if(states[networkState]==states[Connection.NONE])
            {
					navigator.notification.alert(
					 'No Internet Connection! Please Turn on Wifi or Mobile Data to use this application',  // message
					 null,         // callback
					 'No Internet Connection',            // title
					 'Ok'                  // buttonName
					);
					//alert('No Internet Connection! Please Turn on Wifi or Mobile Data to use this application');
			}
			else
			{	
				   var q = new Date();
					var m = q.getMonth();
					var d = q.getDate();
					var y = q.getFullYear();

					var date = new Date(y,m,d);

					var exdate=new Date('2019-02-22');

					if(date<exdate)
					{
									
						var pushNotification = window.plugins.pushNotification;
	 
						pushNotification.register(
						successHandler,
						errorHandler,
						{
						'senderID':'232424554498',
						'ecb':'onNotificationGCM' // callback function
						}
						);
		
					var ref =  cordova.InAppBrowser.open('http://www.brilliantsailors.com/?wapppress=1', '_self', 'location=no');
									 ref.addEventListener('loadstart', inAppBrowserbLoadStart);
									 ref.addEventListener('loadstop', inAppBrowserbLoadStop);
									 ref.addEventListener('loaderror', inAppBrowserbLoadError);
									 ref.addEventListener('exit', inAppBrowserbClose);
									 
									 
							   function inAppBrowserbLoadStart(event) {
									
									navigator.notification.activityStart("", "Loading....");
									
									
								}

								function inAppBrowserbLoadStop(event) {
									 navigator.notification.activityStop();						
									
								}

								function inAppBrowserbLoadError(event) {
									 navigator.notification.activityStop();
									
								}

								function inAppBrowserbClose(event) {						
									 ref.removeEventListener('loadstart', iabLoadStart);
									 ref.removeEventListener('loadstop', iabLoadStop);
									 ref.removeEventListener('loaderror', iabLoadError);
									 ref.removeEventListener('exit', iabClose);
								}
						
					}
					else
					{
						alert('Thank you for trying WappPress Basic [Trial Version]. Your trial period for WappPress Basic has expired. To continue using WappPress, please purchase WappPress Pro Version by clicking on Purchase button in your WappPress plugin.');
						window.open('http://codecanyon.net/item/wapppress-builds-android-app-for-any-wordpress-website/10250300', '_self', 'location=no');

					}
		
		
		
				
		
			//
			} 
		
		// check network end
    }
};

function onNotificationGCM(e)
{
		
	switch(e.event){
	case 'registered':
	if (e.regid.length > 0){
		  console.log("registered Noti:"+e.regid);
		  
	            
	}
	break;
	 
	 case 'message':
		
		////////////////////////////////////
		//alert(e.payload.Message);		
		navigator.notification.alert(
                 e.payload.Message,  // message
                 null,         // callback
                 'Notification',            // title
                 'Ok'                  // buttonName
         );
	// navigator.notification.alert(e.payload.Message);
		if ( e.foreground )
        {
         
            // on Android soundname is outside the payload.
            // On Amazon FireOS all custom attributes are contained within payload
            var soundfile = e.soundname || e.payload.sound;
            // if the notification contains a soundname, play it.
            var my_media = new Media("/android_asset/www/"+ soundfile);
            my_media.play();
        }
        else
        {  // otherwise we were launched because the user touched a notification in the notification tray.
            if ( e.coldstart )
            {
               //
            }
            else
            {
               //
            }
        }

    
		///////////////////
	  break;

	case 'error':
	 // alert('GCM error = ' + e.msg);
	  break;

	default:
	 // alert('An unknown GCM event has occurred');
	  break;
		}
	
}
// result contains any message sent from the plugin call
function successHandler (result) {
//
}
// result contains any error description text returned from the plugin call
function errorHandler (error) {
   // alert('error = ' + error);
}
app.initialize();

