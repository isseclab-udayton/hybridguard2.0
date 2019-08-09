var registerNameSpace = {
    
    UserExists: null, // registerNameSpace.UserExists
    profileFullName: '',
    profileEmail: '',
    profileId: '',

    /*Gets the new user information*/
    getRegisterInformation: function () {
        
        var fullName = $("#fullnameRegister").val();
        var userName = $("#usernameRegister").val();
        var email = $("#emailRegister").val();
        var password = $("#passwordRegister").val();
        
        if ( customNamespace.filterTextAsRequired( userName ) == false )
        {
            alert("Your username should contain letters only, no spaces, and a max of 2 underscores.");
            console.log("Your username should contain letters only, no spaces, and a max of 2 underscores.");
            $("#usernameRegister").focus();
            return false;
        }
                
        if ((userName !== "") && (email !== "") && (password !== "")) {
            var user = {
                umbracoID: 0,
                fullname: fullName,
                username: userName,
                email: email,
                password: password,
                accountType: appSettings.register_account_types.native
            };
            registerNameSpace.sendRegisterInformation(user);
        } else if (userName == "") {
          alert('Please Insert Username')  
        }else if (email == "") {
          alert('Please Insert Email')  
        }else if (password == "") {
          alert('Please Insert Password')  
        }
  
    },
    
    /*Sends the new user information to Umbraco*/
    sendRegisterInformation: function (user) {
        //var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedRegisterSQLNEW";
        var chosenUrl = RegisterNewUser.URL ;
        chosenUrl += "&profileHandle=" + user.username;
        chosenUrl += "&profileEmail=" + user.email;
        chosenUrl += "&profilePassword=" + user.password;
        chosenUrl += "&profileFullName=" + user.fullname;
        chosenUrl += "&accountType=" + user.accountType;
        chosenUrl += "&profileId=" + registerNameSpace.profileId;
		console.log(chosenUrl);
        //alert(chosenUrl)
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function(data) {
            //if (data.ErrorCode === appSettings.register_error_codes.success) {
              if (data.ErrorCode == 0) {
                if (user.accountType === 0) {
                    
                    //if ( data.Data[0].errorCode == 1) { // bad handle
                      //  alert("Inappropriate Username. Please try again.")
                        //return false;
                    //}
                    
                    //if ( data.Data[0].errorCode == 0) { // duplicate email
                        //alert("Email already exist. Please try again.")
                        //return false;
                    //}
                    
                    //if ( data.Data[0].errorCode == 0) { // errorCode = 0 is success
                    //    // do nothing
                    //}
                    //else if ( data.Data[0].errorCode == 1) { // always 1 error with msg from server
                    //    alert(data.Data[0].msg)
                    //    return false;
                    //} 
                    
                    if ( data.Data[0].errorCode == 0) { // errorCode = 0 is success
                        // do nothing
                    }
                    else if ( data.Data[0].errorCode == 1) { // always 1 error with msg from server
                        alert(data.Data[0].msg)
                        return false;
                    }                     
          
                    loginNameSpace.loggedUserID = data.Data[0].Id; 
                    $("#popupDialogRegister").popup("open");
                    
                    var loggedUser = {
                        //umbracoID: data.Data[0].Id,
                        umbracoID: data.Data[0].profileId,
						socialID: "",
                        provider: "Native",
                        email: user.email,
                        password: user.password
                    };
                    loginNameSpace.insertLoggedUserIntoSQLite(loggedUser);
                }

                loginNameSpace.loggedUserID = data.Data[0].profileId;
                user.umbracoID = data.Data[0].profileId;
                loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH
                registerNameSpace.insertUserIntoSQLite(user);
                //customNamespace.appOverride();
            }
            //else if (data.ErrorCode === appSettings.register_error_codes.sameEmail) {
                //alert("Email already exists, ErrorCode: " + data.ErrorCode);
            //}
            //else if (data.ErrorCode === appSettings.register_error_codes.failed) {
            
            else if (data.ErrorCode != 0) {
                alert("Registration Failed!");
                console.log("Registration Failed, ErrorCode: " + ( data.ErrorCode || data ) );
            }
            
        }).fail(function() {
            console.log("fail to register in register.js");
        });
    },
    
    /*Sends the new user information to Umbraco (social networks)*/
    sendSocialRegisterInformation: function (user, firstTime) {
        
        var OnSuccess = function( data ){
            if (data.ErrorCode === appSettings.register_error_codes.success) {
                
                loginNameSpace.loggedUserID = data.Data[0].profileId;
                user.umbracoID = data.Data[0].profileId;
                loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH

                registerNameSpace.profileFullName = data.Data[0].profileFullName;
                registerNameSpace.profileEmail = data.Data[0].profileEmail;
                registerNameSpace.profileHandle = data.Data[0].profileHandle;
                registerNameSpace.profileId = data.Data[0].profileId;

                //registerNameSpace.UserExists = data.Data[0].UserExists;
                registerNameSpace.resetAndinsertSocialUserIntoSQLite(user);
                loginNameSpace.setProfileIDForSocial(user.profileId, user.socialID);

                registerNameSpace.checkSocialLoginTableInSqlLiteAndRedirect();

            }
            else if (data.ErrorCode === appSettings.register_error_codes.failed) {
                console.log("Registration Failed, ErrorCode: " + data.ErrorCode);
                loginNameSpace.sendSocialLoginInformation(user.socialID, firstTime);
           
            }
        }
        
        window.GetSocialRegisterInfo.Variables.profileFullName = user.handle ;
        window.GetSocialRegisterInfo.Variables.email = user.email ;
        window.GetSocialRegisterInfo.Variables.socialid = user.socialID ;
        window.GetSocialRegisterInfo.DataUpdatedEvent = function(){ 
            OnSuccess(window.GetSocialRegisterInfo.JsonObject);
        }
        window.GetSocialRegisterInfo.Execute( window.FeedManager ) ;

        /*
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedRegisterSocial&profileFullName=" + user.handle + "&email=" + user.email + "&socialid=" + user.socialID;
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function(data) {
            if (data.ErrorCode === appSettings.register_error_codes.success) {
                
                loginNameSpace.loggedUserID = data.Data[0].profileId;
                user.umbracoID = data.Data[0].profileId;
                loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH

                registerNameSpace.profileFullName = data.Data[0].profileFullName;
                registerNameSpace.profileEmail = data.Data[0].profileEmail;
                registerNameSpace.profileHandle = data.Data[0].profileHandle;
                registerNameSpace.profileId = data.Data[0].profileId;

                //registerNameSpace.UserExists = data.Data[0].UserExists;
                registerNameSpace.resetAndinsertSocialUserIntoSQLite(user);
                loginNameSpace.setProfileIDForSocial(user.profileId, user.socialID);

                registerNameSpace.checkSocialLoginTableInSqlLiteAndRedirect();

                navigator.splashscreen.hide();
            }
            else if (data.ErrorCode === appSettings.register_error_codes.failed) {
                console.log("Registration Failed, ErrorCode: " + data.ErrorCode);
                loginNameSpace.sendSocialLoginInformation(user.socialID, firstTime);
           
            }
            
        }).fail(function() {
            console.log("fail");
        });
        */
    },
    
    
    /*Inserts the new user into the SQLite Database*/
    insertUserIntoSQLite: function (user) {
          
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("INSERT INTO user(umbracoID, handle, email, password, account_type, added_on) VALUES (?,?,?,?,?,?)",
                          [user.umbracoID, user.username, user.email, user.password, user.accountType, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },
    
    /*Inserts a social user into the SQLite Database*/
    resetAndinsertSocialUserIntoSQLite: function (user) {
          
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            tx.executeSql("Delete from socialLogin where ID > 2", [], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);

            tx.executeSql("INSERT INTO socialLogin(umbracoID, socialID, handle, email, added_on) VALUES (?,?,?,?,?)",
                          [user.umbracoID, user.socialID, user.handle, user.email, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
        });
    },
    
    showPopup: function () {

        $("#popupDialogRegister").popup("open");
    },

    checkSocialLoginTableInSqlLiteAndRedirect: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function (tx) {
            var addedOn = new Date();
            tx.executeSql("select * from socialLogin", [], function (tx, results) {
                var length = results.rows.length;
                    
                //if (length > 0 & registerNameSpace.UserExists == 'True') {
                  //  $('#linkToReactionsView').trigger('click');
                //}

                //if (length > 0 & registerNameSpace.UserExists == 'False') {
                  //  //$('#commonFooterToFollowing').trigger('click');
                    //$('#linkToaccountPreferencesView').trigger('click');
                //}
                
                if (length > 0 & registerNameSpace.profileHandle != '') {
                    $('#linkToReactionsView').trigger('click');
                }

                if (length > 0 & registerNameSpace.profileHandle == '') {
                    //$('#commonFooterToFollowing').trigger('click');
                    $('#commonFooterToRegister').trigger('click');
                }

                
                
                $('#loadingSpinner').hide();

            }, sqliteNameSpace.onError);
        });
    },
};



registerNameSpace.encrypt = function(value) {
    var key = CryptoJS.enc.Utf8.parse('7061737323313233');
    var iv = CryptoJS.enc.Utf8.parse('7061737323313233');
    var encrypted = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(value), key,
        {
            keySize: 128 / 8,
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });

    return encrypted;

}
