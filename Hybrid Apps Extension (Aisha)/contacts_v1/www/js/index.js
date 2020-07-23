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
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
    //  alert("myData1");
     
      document.getElementById("showcontacts").addEventListener("click", createContact);
	function createContact()
	{
		var myContact1 = navigator.contacts.create({"displayName": "Green  "});
    var myContact2 = navigator.contacts.create({"displayName": "Red  "});
    var myContact3 = navigator.contacts.create({"displayName": "Stephan   "});
    var myContact4 = navigator.contacts.create({"displayName": "Thomas"});
    var disp=myContact1.displayName+myContact2.displayName+myContact3.displayName+myContact4.displayName;

    alert(JSON.stringify(disp));



}
  function error()
{
  alert("cannot find contacts");

}

        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');
      //  alert("myData2");
        console.log('Received Event: ' + id);
    }
};

app.initialize();
