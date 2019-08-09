var everlive = new Everlive({
    apiKey: appSettings.everlive.apiKey,
    scheme: appSettings.everlive.scheme
});

var loginNameSpace = {
    
    loggedUserID: "",
    profileHandle: null,
    /* Authenticate using Facebook credentials */
    loginWithFacebook: function(firstTime) {
 
        var facebookConfig = {
            name: 'Facebook',
            loginMethodName: 'loginWithFacebook',
            endpoint: 'https://www.facebook.com/dialog/oauth',
            response_type: 'token',
            client_id: appSettings.facebook.appId,
            redirect_uri: appSettings.facebook.redirectUri,
            access_type: 'online',
            scope: 'email',
            display: 'touch'
        };
        var facebook = new IdentityProvider(facebookConfig);

        facebook.getAccessToken(function(token) {
            everlive.Users.loginWithFacebook(token)
                .then(function (data) {
                    var provider = "Facebook";
                    loginNameSpace.getCurrentUser(data.result.access_token, firstTime, provider);
                })
                .then(null, function (err) {
                    if (err.code == 214) {
                    } else { 
                    }
                });
        });
    },

    /* Authenticate using Google credentials */
    loginWithGoogle: function (firstTime) {

            var googleConfig = {
                name: 'Google',
                loginMethodName: 'loginWithGoogle',
                endpoint: 'https://accounts.google.com/o/oauth2/auth',
                response_type: 'token',
                client_id: appSettings.google.clientId,
                redirect_uri: appSettings.google.redirectUri,
                scope: 'https://www.googleapis.com/auth/userinfo.profile',
                access_type: 'online',
                display: 'touch'
            };
            var google = new IdentityProvider(googleConfig);

            google.getAccessToken(function(token) {
                everlive.Users.loginWithGoogle(token)
                .then(function (data) {
                    var provider = "Google";
                    loginNameSpace.getCurrentUser(data.result.access_token, firstTime, provider);
                })
                .then(null, function (err) {
                    if (err.code == 214) {
                        
                    } else {
                        
                    }
                });
            });
        },
    
    /* Authenticate using FanReact credentials */
    loginWithFanReact: function () {
        
        var user = {
            umbracoID: "",
            socialID: "",
            provider: "Native",
            email: $("#usernameLogin").val(),
            password: $("#passwordLogin").val()
        };
        
        user.password = String(registerNameSpace.encrypt(user.password));
       user.password = encodeURIComponent(user.password) 
        console.log(user.password);
                
        if ((user.email !== "") && (user.password !== "")) {
            
            //console.log(String(registerNameSpace.encrypt('It works')));
            loginNameSpace.sendLoginInformation(user, true);
			//loginNameSpace.insertLoggedUserIntoSQLite(user);
        } else {
            alert("Please Insert Username And Password");
        }
        
    },
    
    /*Sends the user information to Umbraco*/
    sendLoginInformation: function (user, firstTime) {
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedLoginV1&email=" + user.email + "&password=" + user.password + "";
        console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl,
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                var Data = data.Data[0];
                var user = {
                    umbracoID: Data.profileId,
                    socialID: "",
                    provider: "Native",
                    email: Data.profileEmail,
                    password: Data.profilePassword
                };

                var callbackFunction = function () {

                    loginNameSpace.loggedUserID = data.Data[0].Id;
                    //loginNameSpace.setProfileID(data.Data[0].Id, user.email);
                    loginNameSpace.loggedUserID = data.Data[0].profileId;
                    loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH                   
                
                    //if (firstTime) {
                        //loginNameSpace.insertLoggedUserIntoSQLite(user);
                    //customNamespace.page.goTo( 'views/dashboard/reactionsView.html' );
                    //teampageNameSpace.teamId = 264;
                    //customNamespace.page.goTo( 'views/team/teampage.html' );
                    //location.hash = "views/dashboard/reactionsView.html";
                    //}
                    //else {
                    //    location.hash = "views/dashboard/reactionsView.html";
                    //}
                    customNamespace.page.goTo( "views/dashboard/reactionsView.html" );
                    
                    pushNamespace.enablePushNewUser();
                };

                loginNameSpace.insertLoggedUserIntoSQLite(user, callbackFunction);
            }
            else {
                $("#popupDialogLoginFailed").popup("open");
            }

        }).fail(function() {
            alert("Log In process has failed");
            console.log("Log In process has failed");
        });
        
    },
    
    /*Sends the social user information to Umbraco*/
    sendSocialLoginInformation: function (socialID, firstTime) {
        var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedLoginSocial&socialid=" + socialID;
        console.log(chosenUrl);
        
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function(data) {
            if (data.ErrorCode === 0) {
                //loginNameSpace.loggedUserID = data.Data[0].Id;
                loginNameSpace.loggedUserID = data.Data[0].profileId;
                //loginNameSpace.setProfileIDForSocial(data.Data[0].Id, socialID);
                loginNameSpace.setProfileIDForSocial(data.Data[0].profileId, socialID);
                loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH
                
                
                if (firstTime) {
                    location.hash = "../dashboard/reactionsView.html";
                    //customNamespace.appOverride();
                }
                else {
                    //teampageNameSpace.teamId = 334088;
                    //customNamespace.page.goTo( 'views/team/teampage.html' );
            		customNamespace.page.goTo( "views/dashboard/reactionsView.html" );
                }
                //navigator.splashscreen.hide();
                //pushNamespace.enablePushNotifications();
            }

        }).fail(function() {
            console.log("Log In process has failed");
        });
    },
    
    /*Gets the current user*/
    getCurrentUser: function (token, firstTime, provider) {
        $('#loadingSpinner').show();
        $.ajax({
            type: "GET",
            url: 'https://api.everlive.com/v1/3dpDiIYZMGxn97as/Users/me',
            headers: {"Authorization" : "bearer " + token},
            success: function(data) {
                var user = loginNameSpace.buildUserInformation(data.Result);
                registerNameSpace.sendSocialRegisterInformation(user, firstTime);
                
                if (firstTime) {
                    var socialUser = {
                        umbracoID: "",
                        socialID: user.socialID,
                        provider: provider,
                        email: "",
                        password: ""
                	};
                	loginNameSpace.insertLoggedUserIntoSQLite(socialUser);
                }
            },
            error: function(error) {
                console.log(JSON.stringify(error));
            }
        });
            
    },
    
    /*Builds the user information from the access token*/
    buildUserInformation: function (result) {
        var socialID = "";
        var handle = "";
        var email = "";
        
        if (result.Id !== undefined) {
            socialID = result.Id;
        }
        
        if (result.DisplayName !== undefined) {
            handle = result.DisplayName;
        }
        
        if (result.Email !== undefined) {
            email = result.Email;
        }

        var user = {
            umbracoID: 0,
            socialID: socialID,
            handle: handle,
            email: email
        };
        
        return user;
    },
    
    /*Inserts the logged user into the SQLite Database*/
    insertLoggedUserIntoSQLite: function (user, OnSucess) { 
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            var addedOn = new Date();
            //tx.executeSql("INSERT INTO loggedUser(umbracoID, socialID, provider, email, password, added_on) VALUES (?,?,?,?,?,?)",
            //              [user.umbracoID, user.socialID, user.provider, user.email, user.password, addedOn], sqliteNameSpace.onSuccess, sqliteNameSpace.onError);
            tx.executeSql("INSERT INTO loggedUser( umbracoID, provider, email, password, added_on) VALUES (?,?,?,?,?)",
                          [user.umbracoID, user.provider, user.email, user.password, addedOn],
                          function () { if ( OnSucess != undefined ) { OnSucess(); } }
                          , sqliteNameSpace.onError);
        });
    },
    
    /*Asks if the user is logged when the app starts*/
    isUserLogged: function () {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) { 
            tx.executeSql("SELECT * FROM loggedUser", [], function(tx, results) { 
                var length = results.rows.length;
                if (length > 0) {
                    if (results.rows.item(0).provider === "Facebook") {
                        loginNameSpace.socialLoginWhenHadSocialId();
                        //loginNameSpace.loginWithFacebook(false);
                    }
                    else if (results.rows.item(0).provider === "Google") {
                        loginNameSpace.socialLoginWhenHadSocialId();
                        //loginNameSpace.loginWithGoogle(false);
                    }
                    else if (results.rows.item(0).provider === "Native") {
                        //var user = {
                            //umbracoID: Data.profileId,
                            //email: results.rows.item(0).email,
                            //password: results.rows.item(0).password
                        //};
                        //loginNameSpace.sendLoginInformation(user);
                        var umbracoID = results.rows.item(0).umbracoID;
                        loginNameSpace.sendLoginInformationWhenHadProfileId(umbracoID);
                    }
                } else {
                    location.hash = "views/welcome/welcomeView.html";
                    navigator.splashscreen.hide();
                }
            }, sqliteNameSpace.errorCB);
        });
    },
    
    /*Inserts the profileID into the LoggedUser Table SQLite - Social*/
    setProfileIDForSocial: function (umbracoID, socialID) {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("UPDATE loggedUser SET umbracoID='" + umbracoID + "' WHERE socialID='" + socialID + "'", [], loginNameSpace.onSuccessUpdateProfID, loginNameSpace.onErrorUpdateProfID);
        });
    },
    
    /*Inserts the profileID into the LoggedUser Table SQLite*/
    setProfileID: function (umbracoID, email) {
        var db = sqliteNameSpace.db;
        db.transaction(function(tx) {
            tx.executeSql("UPDATE loggedUser SET umbracoID='" + umbracoID + "' WHERE email='" + email + "'", [], loginNameSpace.onSuccessUpdateProfID, loginNameSpace.onErrorUpdateProfID);
        });
    },
    
    onSuccessUpdateProfID: function () {
        console.log("The row was updated successfully");
        //override
    },
    
    onErrorUpdateProfID: function () {
        console.log("The row wasn't updated successfully");
    },

};

///////////////////////////////////// begin forget password feature /////////////////////////////////////////////////


loginNameSpace.forgotPassword = loginNameSpace.forgotPassword || {};

loginNameSpace.forgotPassword.check = function(){
    var profileEmail = $('#forgotPasswordEmail').val();
    var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedForgotPassword&profileEmail=" + profileEmail;
    console.log(chosenUrl);
    var thisNamespace = loginNameSpace.forgotPassword;
    $.ajax({
        type: "GET",
        url: chosenUrl 
    }).success(function (data) {
        var status = data.Data[0].status ;
        
        if ( status == 0 ) {
            alert("Email not found.")
        } else if ( status == 1 ) {
            alert("Email sent.")
        }
        
    }).fail(function() {
        alert('Connection Error.')
        console.log("Fail");
    });
}

///////////////////////////////////// end forget password feature /////////////////////////////////////////////////

//////////////////////////////////// begin login when had socialID ////////////////////////


loginNameSpace.socialLoginWhenHadSocialId = function () {

    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {
        tx.executeSql("SELECT * FROM socialLogin", [], function (tx, results) {
            var length = results.rows.length;
            if (length > 0) {

                var data = results.rows.item(0);
                console.log(data.socialID);
                var socialID = data.socialID;
                var user = {
                    socialID: socialID,
                    handle: '',
                    email: ''
                };
                registerNameSpace.sendSocialRegisterInformation(user,false);
            }
        }, sqliteNameSpace.errorCB);
    });

}

/////////////////////////////////// end login when had socialID //////////////////////////////

/////////////////////////////////// begin login when had profileId ////////////////////////////

/*Sends the user information to Umbraco*/
loginNameSpace.sendLoginInformationWhenHadProfileId = function (profileId) {
    
    var OnSuccess = function( data ){
        
        if (data.ErrorCode == 0) {
            //loginNameSpace.loggedUserID = data.Data[0].Id;
            //loginNameSpace.setProfileID(data.Data[0].Id, user.email);
            loginNameSpace.loggedUserID = data.Data[0].profileId;
            loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH

            
            //teampageNameSpace.teamId = 334088;
            //customNamespace.page.goTo( 'views/team/teampage.html' );
            customNamespace.page.goTo( "views/dashboard/reactionsView.html" );
            //pushNamespace.enablePushNotifications();
            
        }
        else {
            console.log("Auto Native Login Error Code 1. Please Contact Administration For Help");
            //alert(chosenUrl)
        }
    }
    
    window.GetLoginInfoWithProfileId.Variables.profileId = profileId;
    window.GetLoginInfoWithProfileId.DataUpdatedEvent = function(){ 
        OnSuccess(window.GetLoginInfoWithProfileId.JsonObject);
    }
    window.GetLoginInfoWithProfileId.Execute( window.FeedManager ) ;
    
    /*
    var chosenUrl = domainNameSpace.name + "/?alttemplate=JsonFeedLoginSQLnew&profileId=" + profileId;
    console.log(chosenUrl);
    $.ajax({
        type: "GET",
        url: chosenUrl,
    }).success(function (data) {
        if (data.ErrorCode == 0) {
            //loginNameSpace.loggedUserID = data.Data[0].Id;
            //loginNameSpace.setProfileID(data.Data[0].Id, user.email);
            loginNameSpace.loggedUserID = data.Data[0].profileId;
            loginNameSpace.profileHandle = data.Data[0].profileHandle; //SH

            
            location.hash = "views/dashboard/reactionsView.html";
            //pushNamespace.enablePushNotifications(); 
            
        }
        else {
            alert("Auto Native Login Error Code 1. Please Contact Administration For Help");
            //alert(chosenUrl)
        }

    }).fail(function () {
        alert("Auto Native Login has failed. Connection Error");
        console.log("Auto Native Login has failed. Connection Error");
    });
    */

}

/////////////////////////////////// begin login when had profileId ////////////////////////////