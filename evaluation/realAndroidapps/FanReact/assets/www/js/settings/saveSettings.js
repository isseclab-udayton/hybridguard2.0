var settingsNameSpace = {
    aboutTitle: 'some title',
    conditionTitle: 'some title',
    privacyTitle: 'some title',
    about: 'some policy',
    condition: 'some condition',
    privacy: 'some privacy',
    
	/*Gets the Settings Feed from SQLite*/
	checkIfSettingsIsInSQLite: function () {
		var db = sqliteNameSpace.db;
		db.transaction(function (tx) {
			tx.executeSql("SELECT * FROM settings", [], function (tx, results) {
				var length = results.rows.length;
				if (length == 0) { settingsNameSpace.insertSettingsIntoSQLite(); }
			}, sqliteNameSpace.errorCB);
		});
	},

	/*Gets the Settings Feed from SQLite*/
	getSettingsFromSQLite: function () {
		var db = sqliteNameSpace.db;
		db.transaction(function (tx) {
			tx.executeSql("SELECT * FROM settings", [], function (tx, results) {
				var length = results.rows.length;
				settingsNameSpace.applySettings(length, results, false);
			}, sqliteNameSpace.errorCB);
		});
	},

	/*apply the Settings */
	applySettings: function (length, results, beginning) {
		for (var i = 0; i < length; i++) {
            //alert(results.rows.item(i).syncFacebook)
			//$('#syncFacebook').val( results.rows.item(i).syncFacebook );
            $("#syncFacebook").val(results.rows.item(i).syncFacebook ).slider('refresh');
            $("#syncTwitter").val(results.rows.item(i).syncTwitter ).slider('refresh');
            $("#syncGoogle").val(results.rows.item(i).syncGoogle ).slider('refresh');
            $("#appNotification").val(results.rows.item(i).appNotification ).slider('refresh');
            //alert(' apply seting ' + $('#syncFacebook').val());
		}
	},

    /*Inserts the Settings into the SQLite Database*/
    insertSettingsIntoSQLite: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO settings( syncTwitter , syncGoogle , syncFacebook , appNotification, added_on) VALUES (?,?,?,?,?)",
                          [ false, false, false, false, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },

	/*Update the Settings into the SQLite Database*/
	saveSettingsIntoSQLite: function (fieldName, fieldValue) {
		var db = sqliteNameSpace.db;
		db.transaction(function (tx) {
			var addedOn = new Date();
			//alert( fieldName +  " = '" + fieldValue )
			tx.executeSql("UPDATE settings SET " + fieldName +  " = '" + fieldValue + "' where ID = 1",
                          [], settingsNameSpace.getSettingsFromSQLite() /*alert("saved setting: " + fieldName + " " + fieldValue)*/ , sqliteNameSpace.onError);
				});
	}
};

function showAppReferrence( field ){
    var content;
    if (field == 'About') {content = settingsNameSpace.about; field = settingsNameSpace.aboutTitle;}
    if (field == 'Condition') {content = settingsNameSpace.condition; field = settingsNameSpace.conditionTitle;}
    if (field == 'Privacy') {content = settingsNameSpace.privacy; field = settingsNameSpace.privacyTitle;}
    $('#appPreference').popup('open');
    $('#appPreference h3').html(field);
    $('#appPreference textarea').html(content);
}

function deleteFeedManager() {
    var db = window.openDatabase("FanReactFeeds.db", "1.0", "Cordova", 200000);
    db.transaction(function (tx) {
    	tx.executeSql("delete From FeedManager", [], function () {
    	}, sqliteNameSpace.errorCB);
    });
    alert('Sweet! You are ready for more reactions now!');
}

function dumpFeedManager() {
    var db = window.openDatabase("FanReactFeeds.db", "1.0", "Cordova", 200000);
    db.transaction(function (tx) {
    	tx.executeSql("select * From FeedManager", [], function (tx, results) {
    		var len = results.rows.length;
            console.log('FeedManager row count is: '+len);
             for (var i = 0; i < len; i++) {
                 console.log("Row = " + i + " Name = " + results.rows.item(i).feedName + " Data =  " + JSON.stringify(results.rows.item(i).jsonData));
             }
    	}, sqliteNameSpace.errorCB);
    });
}

function getAppPreferrence( callback ) {
    var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedAppPreferences';
    $.ajax({
        type: "GET",
        url: chosenUrl
    }).success(function (data) {

        settingsNameSpace.conditionTitle = data.Data[0].title;
        settingsNameSpace.privacyTitle = data.Data[1].title;
        settingsNameSpace.aboutTitle = data.Data[2].title;
        
        settingsNameSpace.condition = data.Data[0].bodyText;
        settingsNameSpace.privacy = data.Data[1].bodyText;
        settingsNameSpace.about = data.Data[2].bodyText;
    
        try {
            callback();
        } catch (err ) { console.log(err.message)}
        
    }).fail(function () {
        customNamespace.console("fail get JsonFeedAppPreferences in saveSettings.js");
    });
}

function settingViewSubmitFeedBack() {
    
    var feedbackdesc = $('#submitFeedBackPopup textarea').val();
    $.ajax({
        type: "GET",
        url: domainNameSpace.name + '/?alttemplate=JsonFeedSubmitFeedback&feedbackType=feedback&feedbackName=Feedback',
        data:
            { 
                feedbackProfileid: loginNameSpace.loggedUserID ,
                feedbackEmail: 'someone@somewhere.com',
                feedbackHandle: 'somepeople',
                feedbackDescription: feedbackdesc
            },
    }).success(function (data) {
        console.log(data);   
        alert("Thank you for your feedback.")
    }).fail(function () {
        customNamespace.console("error submitting feed back - saveSetting.js");
    });
}

///////////////////////////////// begin js for updateProfile //////////////////////////////////////////////////////////////

settingsNameSpace.updateProfile = settingsNameSpace.updateProfile || {};

settingsNameSpace.updateProfile.profileEmail = null;
settingsNameSpace.updateProfile.profileHandle = null;
settingsNameSpace.updateProfile.profileDescription = null;

settingsNameSpace.updateProfile.getInfo = function(){
    var profileId = loginNameSpace.loggedUserID ;
    var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedGetProfile&profileId=" + profileId;
    var thisNamespace = settingsNameSpace.updateProfile;
    $.ajax({
        type: "GET",
        url: chosenUrl 
    }).success(function (data) {
        var profile = data.Data[0] ;
        var profilePhoto = profile.profilePhoto ;
        var profileHandle = profile.profileHandle ;
        var profileStatus = profile.profileStatus ;
        var profileEmail = profile.profileEmail ;
        var profilePassword = profile.profilePassword ;
        $('#profileHandle').val(profileHandle);
        


        $('#emailheading').show();
        if( profileEmail != 'null' ) 
        {
            $('#email').val(profileEmail);
            $('#emailheading').hide();
        }
        
        $('#newPassword1').val('') ;
        $('#newPassword2').val('') ;
        
        thisNamespace.profileEmail = profileEmail ;
        thisNamespace.profileHandle = profileHandle ;
        thisNamespace.profilePassword = profilePassword;
        
        if( profilePassword == '' || profilePassword == 'null' ) {
            $('#currentPasswordField').hide();
            $('#newPasswordHeading').html('Add New Password ( <i>required*</i> )');
        }
        
    }).fail(function() {
        customNamespace.console("Failed get JsonFeedGetProfile in saveSettings.js");
    });
}


settingsNameSpace.updateProfile.update = function(){
    var profileId = loginNameSpace.loggedUserID;
    var thisNamespace = settingsNameSpace.updateProfile;
    
    var currentPassword = $('#currentPassword').val();
    var profilepassword = $('#newPassword2').val();    
    if ( $('#newPassword1').val() != $('#newPassword2').val() ) {
        alert("Password doesn't match. Please try again.");
        return false;
    }
    
    if ( currentPassword != this.profilePassword ) {
        alert("Current Password is incorrect. Please try again.");
        return false;
    }
    
     if ( $('#newPassword1').val() == "" &&  $('#newPassword2').val()  == "") {        
         profilepassword = currentPassword;
    }
    
    // if email is empty, alert 
     var profileemail = $('#email').val();
     if (profileemail == "")
     {
         alert("Please input email address and try again.");
         return false;
     }
    
    var profileHandle = $('#profileHandle').val();
    if(this.profileHandle != profileHandle && this.profileemail == profileemail) {
        profileemail = "";
        currentPassword = "";
        profilepassword = "";
    }
    if ( customNamespace.filterTextAsRequired( profileHandle ) == false )
    {
        alert("Username should contain only letters, and no more than 2 underscores");
        console.log("Username should contain only Alphabet and at max 2 underscore");
        $("#usernameRegister").focus();
        return false;
    }

    // check badwords in profileHandle
    var filtered = customNamespace.filterBadWord(profileHandle).replace( /\*/g, '1xjfgg' ) ; 
    if ( filtered.search('1xjfgg') != -1 )
    {
        alert("This is an inappropriate username. Please try again. " );
        return false;
    }
    
    // if there user have no current password, ask for new password input
    if (thisNamespace.profilePassword == '' && profilepassword == '')
    {
        alert("Please input a new password and try again. ")
        return false;
    }
    
    var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedUpdateProfileNew";
    chosenUrl += '&profileId=' + profileId ; 
    chosenUrl += '&profileemail=' + profileemail ; 
    chosenUrl += '&profilepassword=' + profilepassword ; 
    chosenUrl += '&currentPassword=' + currentPassword ; 
    chosenUrl += '&profileHandle=' + profileHandle ; 
    //console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function (data) {

        var data = data.Data[0];
        var status = data.errorCode ;
        
        if (status == 0) {

            alert("Your profile has been updated.");
            //console.log("Your profile has been updated.");

            // if first time user, go back to following
            if (registerNameSpace.UserExists == 'False')
            {
                $('#commonFooterToFollowing').trigger('click');
                return false;
            }

            settingsNameSpace.updateProfile.getInfo();

        }                
        else if ( status == 1 ) {
            alert(data.msg);
            console.log(data.msg);
        }
        else {
            customNamespace.console("Unknown error in updating profile - saveSettings.js.");
        }
        
    }).fail(function() {
        customNamespace.console("Fail updateProfile in saveSettings.js");
    });
}
///////////////////////////////// finish js for updateProfile //////////////////////////////////////////////////////////////
