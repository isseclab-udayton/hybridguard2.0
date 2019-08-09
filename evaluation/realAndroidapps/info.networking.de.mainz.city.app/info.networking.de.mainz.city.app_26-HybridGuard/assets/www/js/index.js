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
    
    appGroupIdentifier: "group.de.info.networking.mainz.and.more",
    
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
        document.addEventListener('resume', this.onResume, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function()
    {
        FastClick.attach(document.body);

        //setzt die Werbung auf der Hauptseite
        advertise.setAdMain();

        //audio abspielen
        if( plattform.isAndroidDevice() )
        {
        	playAudio('file:///android_asset/www/audio/APP.mp3');
        }
        else
        {
        	playAudio('audio/APP.mp3');
        }
        
        StatusBar.show();
    	
        //initialisiere das applewatch object auf jeden fall bevor die blitzer komplett
        //geparst wurden, um fehler zu vermeiden, da über das applewatch object die
        //blitzer an die watch verschickt werden
//        applewatch.init(function()
//                        {
//                            console.log("successfully initialized apple watch plugin");
//                        
//                            applewatch.registerNotifications(app.watchRegisterSuccess, app.watchRegisterFailure);
//
//                            applewatch.sendMessage("switchToNextInterface", "didStartApp");
//                        
//                            applewatch.addListener("watchRequest", function(message)
//                                                   {
//                                                       blitzerListe();
//                                                   }, function()
//                                                   {
//                                                   
//                                                   });
//                        
//                            applewatch.addListener("iphoneAppStatusRequest", function(message)
//                                                   {
//                                                       if (message == "awake")
//                                                       {
//                                                           applewatch.sendMessage("switchToNextInterface", "didStartApp");
//                                                       }
//                                                   }, function()
//                                                   {
//                                                   
//                                                   });
//                        },
//                        function()
//                        {
//                            console.log("failed to initialize apple watch plugin");
//                        },
//                        app.appGroupIdentifier);
        
        //ERSTELLE DIE KOMPLETTE DATENBANK
        blitzer.xmlParser();
        
        pushRegister();

        //WORKAROUND DES HEADER-FOOTER-BUMP BUGS
        $(document).on('blur', 'input, textarea', function() {
            setTimeout(function() {
                window.scrollTo(document.body.scrollLeft, document.body.scrollTop);
            }, 0);
        });
        
        //DYNAMISCHE BILDSCHIRMANPASSUNG FÜR ANDROID
       /*$(".rightArrow").css("left", (window.innerWidth - 25) + "px");
        $(".sliderNavigation").css("padding-left", (window.innerWidth / 14.4) + "px");
        
        $(".kachel").css("height", (window.innerHeight / 4.22) + "px");
        $(".kachel").css("width", (window.innerWidth / 2.37) + "px");
        
        $("#karte").css('width', window.innerWidth + 'px');
        $("#karte").css('height', (window.innerHeight * 0.8) + 'px');*/
    },
    
    onResume: function()
    {
//        blitzerListe();
//        applewatch.sendMessage("switchToNextInterface", "didStartApp");
    }
    
};