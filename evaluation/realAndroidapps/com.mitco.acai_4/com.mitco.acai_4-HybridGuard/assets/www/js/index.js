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
 
window.appRootDirName = "Download_ACAI_3";

 
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
		 
		 window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, gotFS, fail);
		 //document.addEventListener("resume", onResume, false);
		 localStorage.setItem("idusr", device.uuid);
		 $("#hsede").html( localStorage.getItem("cod_sede"));
		 //window.cache.clear( success, error );
        
		//SET ADMOB PLUGIN ----------------------
		initApp();
		
		
		/*if(localStorage.getItem("sede_pwd") != null) {
					//start admob after login----------
					AdMob.prepareInterstitial({
					adId: admobid.interstitial,
					autoShow: true
					});
					//----------------------------------
		}*/
		localStorage.setItem("countAd", 1);
		//---------------------------------------
		 
		 
		 // SET PUSH NOTIFICATION FUNCTION-------------------------------------------
		 //--------------------------------------------------------------------------
		 var push = PushNotification.init({
            "android": {
                "senderID": "1083463380310"
            },
            "ios": {"alert": "true", "badge": "true", "sound": "true"}, 
            "windows": {} 
        });
        
        push.on('registration', function(data) {
            console.log("registration event");
            //document.getElementById("regId").innerHTML = data.registrationId;
			 // set local IdReg and update database--------------
			 //alert(data.registrationId);
			 localStorage.setItem("idreg", data.registrationId);
			 update_reg(device.uuid,data.registrationId);
			 //------------------------------------------------
			 
            console.log(JSON.stringify(data));
        });

        push.on('notification', function(data) {
        	 console.log("notification event");
            console.log(JSON.stringify(data));
			 //localStorage.setItem("NewPush",true);
			 	myApp.addNotification({
					closeOnClick: true,
        			title: data.title,
        			message: data.message+'<div class="row"><div class="col-50"></div><div class="col-50"><br><a onClick="openMessage('+data.additionalData.id+',\''+data.additionalData.type+'\')" href="#" class="button button-secondary">Visualizza</a></div></div>'
    			});
            
			/*var cards = document.getElementById("cards");
            var card = '<div class="row">' +
		  		  '<div class="col s12 m6">' +
				  '  <div class="card darken-1">' +
				  '    <div class="card-content black-text">' +
				  '      <span class="card-title black-text">' + data.title + '</span>' +
				  '      <p>' + data.message + '</p>' +
				  '    </div>' +
				  '  </div>' +
				  ' </div>' +
				  '</div>';
            cards.innerHTML += card;
            */
            push.finish(function () {
                console.log('finish successfully called');
            });
        });

        push.on('error', function(e) {
            console.log("push error");
        });
		 //---------------------------------------------------------------------------
		 
		
	     // GET LEFT MENU AND HOME-------------------------------------------
		 //-----------------------------------------------------------
		 getLeftMenu();
		 getHome();
		 //-----------------------------------------------------------
		
		 
		app.receivedEvent('deviceready');
		 

    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');
        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};


/*
 function onResume(){  // Handle the resume event
	 if(localStorage.getItem("NewPush")){
		 mainView.router.loadPage("chat.html");
		 localStorage.removeItem("NewPush");
		 }
}
*/


 
function fail() {
	console.log("failed to get filesystem");
}
 
function gotFS(fileSystem) {
	console.log("filesystem got");
	window.fileSystem = fileSystem;
	fileSystem.root.getDirectory(window.appRootDirName, {
		create : true,
		exclusive : false
	}, dirReady, fail);
}
 
function dirReady(entry) {
	window.appRootDir = entry;
	console.log("application dir is ready");
}


           

           
 
 
downloadFile = function(url,filename){

	var fileTransfer = new FileTransfer();
	var url = url;
	var filePath = window.appRootDir.fullPath+filename;
	filePath ='/mnt/sdcard/Download/'+filename;
	//alert(url+" - "+filePath);
	fileTransfer.download(
	    url,
	    filePath,
	    function(entry) {
	        myApp.alert("File scaricato in: "+entry.fullPath,"Download completato");
	    },
	    function(error) {
	        myApp.alert("download error" + error.source,"error");
	    }
	);

}



app.initialize();