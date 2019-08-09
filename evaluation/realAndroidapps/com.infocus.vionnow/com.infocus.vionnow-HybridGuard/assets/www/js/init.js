/* ------------------------ Inits  ----------------------- */ 
	
	/********** Schalter *******/
	var firebug = 0;
	var android = 1;
	var tablet = 0;
	
	
	
	/********** Inits *******/
    var num_items = 6;
    var db = "";
    var newMenu = null;
    var pager_start_up = 0;
    var pager_end_up = 0;
    var grid_blocks = 3;
    var max_dot_count = 12;
    var continue_barcode = 0;
    
    /********* OS-abhÃ¤ngige scripte  ***************/
    function addJavascript(jsname,pos) {
    	var th = document.getElementsByTagName(pos)[0];
    	var s = document.createElement('script');
    	s.setAttribute('type','text/javascript');
    	s.setAttribute('src',jsname);
    	th.appendChild(s);
    }

// Clear Button for input fields
$('.search-wrapper').find('input').focus(function(){
        $(this).parent().append('<a class="clear-button" onclick="$(this).parent().find(\'input\').val(\'\');">x</a>');
});

    
 	// Wait for PhoneGap to load
    //
    $(document).ready(function(){
    	if(firebug == 1){
    		getBannerImgs();
	    	setPagerEndUp();
	    	pager_start_new = 0;
	    	pager_start_up = 0;
	    	pager_start_news = 0;
	    	genre_dlg("start_movies");
	    	showStartNew();
	    	showStartUp();
	    	storage_cat_dlg();
	    	
	    	//startWatch(); // shake event
	    	$.mobile.changePage.defaults.allowSamePageTransition = true;

    	}
    	else{
    		document.addEventListener("deviceready", onDeviceReady, false);
    	}	
    	
	});
    
    
    
    $(document).live('pagebeforeshow', function(event, data) {
    	
    	$('#search-overlay-start').hide();
    	$('#search-overlay-new').hide();
    	$('#search-overlay-search').hide();
    	$('#search-overlay-genre').hide();
    	$('#search-overlay-storage').hide();
    	
    	if(data.prevPage.attr('id') != "storage_edit"){
    		sessionStorage.setItem("referrer", data.prevPage.attr('id'));
    	}
    	if($.mobile.activePage.attr('id') != "movie_detail" && $.mobile.activePage.attr('id') != "storage_edit"){
    		sessionStorage.setItem("referrer_movie_detail", $.mobile.activePage.attr('id'));
    	}
    });
    
    
    // PhoneGap is ready
    //
    function onDeviceReady() {
    	if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
  		  //alert('Kein internet :(');
  		  openPopupInfo('Kein Internet!', 'Bitte mit Internetverbindung neu starten');
	  	}
	  	//else{
	  		try {
	  		    if (!window.openDatabase) {
	  		        alert('Databases are not supported in this browser.');
	  		    } else {
	  		        var shortName = 'Database';
	  		        var version = '';
	  		        var displayName = 'vionnow';
	  		        var maxSize = 10000000; //  bytes
	  		        db = openDatabase(shortName, version, displayName, maxSize);
	  		        db.transaction(populateDB, errorCB, successCB);
	  		    }
	  		} catch(e) {
	  	 
	  		    if (e == 2) {
	  		        // Version number mismatch.
	  		        //console.log("Invalid database version.");
	  		    } else {
	  		        //console.log("Unknown error "+e+".");
	  		    }
	  		}    
	    	//db = window.openDatabase("Database", "1.0", "vionnow", 200000);
	    	
	    	
	    	/********** js load ***********/
	    	if(android == 1){
                $.mobile.defaultPageTransition = "none";
	    		addJavascript('js/android/video.js','head');
	    		addJavascript('js/android/barcodescanner.js','head'); 
	    		addJavascript('js/android/webintent.js','head'); 
	    		addJavascript('js/android/send_email.js','head');
	    		addJavascript('js/android/childbrowser.js','head');
	    		$("#btn-imprint-more").attr('onclick', 'showExternalWebPage("http://vionnow.de/videotheken-app")');
	    		$("#btn-imprint-more").attr('href', '#');
	    		$("#btn-imprint-store").attr('onclick', 'showExternalWebPage("http://vionnow.de/info/fur-videotheken/")');
	    		$("#btn-imprint-store").attr('href', '#');
	    		
	    		//document.addEventListener("backbutton", handleBackButton, false);
	    	}
	    	else{
                $.mobile.defaultPageTransition = "none";
	    		addJavascript('js/ios/barcodescanner.js','head'); 
	    		addJavascript('js/ios/EmailComposer.js','head');
                addJavascript('js/ios/CDVVideo.js','head');
                addJavascript('js/ios/video.js','head');
	    	}
	    	document.addEventListener( "touchmove", function(event){ onStart(event); }, false );
	    	addJavascript('js/emails.js','head'); 
	    	//ImgCache.options.debug = true;
	    	//ImgCache.init();
	    	
	    	setPagerEndUp();
	    	pager_start_new = 0;
	    	pager_start_up = 0;
	    	pager_start_news = 0;
	    	genre_dlg("start_movies");
	    	showStartNew();
	    	showStartUp();
	    	storage_cat_dlg();
	    	//startWatch(); // shake event
	    	getUserId(); // store user_id to session if exists
	    	$.mobile.changePage.defaults.allowSamePageTransition = true;
	    	window.requestFileSystem  = window.requestFileSystem || window.webkitRequestFileSystem;
	        window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, gotFS, fail);
	        sessionStorage.setItem("cloud_message", "");
	        setTimeout("getBannerImgs();",1000);
	        if(window.innerWidth >= 768){
	        	tablet = 1;
	        }
	        
	  	//}
    }
     
    function setSession_MovieID(value){
    	sessionStorage.setItem("movie_id", value);
    }
    
    function setSession_NewsID(value){
    	sessionStorage.setItem("news_id", value);
    }
    
    function openPopupInfo(header, text){
	    $('#popinfo_'+$.mobile.activePage.attr("id")).popup({ history: false });
	    $('#popinfo_'+$.mobile.activePage.attr("id")).find("h3").html(header);
	    $('#popinfo_'+$.mobile.activePage.attr("id")).find("p").html(text);
	    $('#popinfo_'+$.mobile.activePage.attr("id")).popup("open");
    }
    
    function closePopupInfo(){
    	$('#popinfo_'+$.mobile.activePage.attr("id")).popup("close");
    	sessionStorage.setItem("cloud_message", "");
    }
    
    function openPopupConfirm(header, text, yes_click, yes_text){
	    $('#popconfirm_'+$.mobile.activePage.attr("id")).popup({ history: false });
	    $('#popconfirm_'+$.mobile.activePage.attr("id")).find("h3").html(header);
	    $('#popconfirm_'+$.mobile.activePage.attr("id")).find("p").html(text);
	    $('#btn_confirm_'+$.mobile.activePage.attr("id")).attr('onclick', yes_click);
	    $('#btn_confirm_'+$.mobile.activePage.attr("id") +' .ui-btn-text').text(yes_text);
	    $('#popconfirm_'+$.mobile.activePage.attr("id")).popup("open");
    }
    
    function closePopupConfirm(){
    	$('#popconfirm_'+$.mobile.activePage.attr("id")).popup("close");
    }

    
    function onStart ( touchEvent ) {
    	
    	if($.mobile.activePage.attr('id') == 'storage_list' || 
    	$.mobile.activePage.attr('id') == 'new_movies' || 
    	$.mobile.activePage.attr('id') == 'upcoming_movies' || 
    	$.mobile.activePage.attr('id') == 'genre_movies' || 
    	$.mobile.activePage.attr('id') == 'search_movies'){ 
		    touchEvent.preventDefault();
		    //alert("Hallooooooooo");
    	}    
    }
    
    function startWatch() {
        
        var previousReading = {
            x: null,
            y: null,
            z: null
        }
         
        navigator.accelerometer.watchAcceleration(function (reading) {
          var changes = {},
          bound = 4;
          if (previousReading.x !== null) {
              changes.x = Math.abs(previousReading.x, reading.x);
              changes.y = Math.abs(previousReading.y, reading.y);
              changes.z = Math.abs(previousReading.z, reading.z);
          }
           
          if (changes.x > bound && changes.y > bound && changes.z > bound) {
            shaken();
          }
           
          previousReading = {
          x: reading.x,
          y: reading.y,
          z: reading.z
          }
           
          }, onError, { frequency: 700 });
    }
     
    function shaken(){
    	showRandMovie();
    }
     
    // Error
    function onError() {
        alert('onError!');
    }
    // filesystem
    function fail() {
        //console.log("failed to get filesystem");
    }

    function gotFS(fileSystem) {
        //console.log("got filesystem");

            // save the file system for later access
        //console.log(fileSystem.root.fullPath);
        window.rootFS = fileSystem.root;
    }
    
    function handleBackButton() {
    	//console.log("Back Button Pressed!");
    	if($.mobile.activePage.attr('id') == 'start'){
    		navigator.app.exitApp();
    	}
    	else if($.mobile.activePage.attr('id') == 'storage_list'){
    		$.mobile.changePage('#start');
    	}
    	else{
    		$.mobile.changePage('#'+sessionStorage.getItem("referrer"));
    	}
    }

    
    
    

    
   
    