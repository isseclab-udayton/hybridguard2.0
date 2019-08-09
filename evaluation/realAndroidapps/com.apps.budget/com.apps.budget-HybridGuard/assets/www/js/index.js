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
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        //app.receivedEvent('deviceready');
        navigator.splashscreen.hide();
  		document.addEventListener("backbutton", app.onBackButton, false);
    },
	onBackButton: function(e) {
	    try{
	        /*var activePage = $.mobile.activePage.attr('id');
	
	        if(activePage == 'Options'){
	            closeOptions();
	        } else if(activePage == 'Popup'){
	            closePopup();
	        } else if(activePage == 'HomePage'){*/
	
	        e.preventDefault();
	        navigator.notification.confirm(
	            "Are you sure you want to exit the Budget Tracker?",
	            app.checkButtonSelection,
	            'Please Confirm',
	            'Cancel,Exit');
	        /*} else {
	             navigator.app.backHistory();
	        }*/
	    } catch(e){ setError('Exception: '+e,3); alert("Error exiting!");}
	},
	checkButtonSelection: function(iValue){
	  if (iValue == 2){
	    navigator.app.exitApp();
	    return;
	  } else {
	    return;
	  }
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
