var phoneNotificationSettingsNameSpace = {};

////////////////////////////// begin check setting to enable or disable push notfication /////////////////////////////////

/*Gets the Settings Feed from SQLite*/
phoneNotificationSettingsNameSpace.checkIfPushSettingsIsInSQLite = function () {
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {
        tx.executeSql("SELECT * FROM phoneNotifications", [], function (tx, results) {
            var length = results.rows.length;
            if (length == 0) { phoneNotificationSettingsNameSpace.insertPushSettingsIntoSQLite(); }
            else if (length > 0){phoneNotificationSettingsNameSpace.getPushSettingsFromSQLite();}
        }, function(){customNamespace.console("Error in getting settings from sqlite in phoneNotificationSettings.js")});
    });
};

    
/*Inserts the Settings into the SQLite Database*/
phoneNotificationSettingsNameSpace.insertPushSettingsIntoSQLite = function () {
    var db = sqliteNameSpace.db;
    db.transaction(function(tx) {
        var addedOn = new Date();
        tx.executeSql("INSERT INTO phoneNotifications( enableNotification , enableVibration,added_on) VALUES (?,?,?)",
                      [ true, true, addedOn], phoneNotificationSettingsNameSpace.getPushSettingsFromSQLite() , function(){console.log("Error on insert---")});
    });
};

/*Gets the Settings Feed from SQLite*/
phoneNotificationSettingsNameSpace.getPushSettingsFromSQLite = function (action) {
    var db = sqliteNameSpace.db;
     
    db.transaction(function (tx) {
        tx.executeSql("SELECT * FROM phoneNotifications", [],
            function (tx, results) {
                                
                //customNamespace.console( 'before ' + notificationNameSpace.IsEnableNotification );
                //customNamespace.console('before ' + notificationNameSpace.IsEnableVibration );
                notificationNameSpace.IsEnableNotification = results.rows.item(0).enableNotification; 
                notificationNameSpace.IsEnableVibration = results.rows.item(0).enableVibration; 
                phoneNotificationSettingsNameSpace.decideAfterGetPushSettingsFromSQLite(action);
                var length = results.rows.length;                    
            }, function(){customNamespace.console("Error in select variable from phonenotification table in phoneNotificationSettings.js")});
    });
};


    
    
phoneNotificationSettingsNameSpace.decideAfterGetPushSettingsFromSQLite = function(action){

    try
    {  
        
        var enable = notificationNameSpace.IsEnableNotification ; 
        var vibrate = notificationNameSpace.IsEnableVibration ; 
        
             
        if ( action == 'undefined' || action == undefined) {
            customNamespace.console('action = undefined with enable ' + enable);
            customNamespace.console('action = undefined with vibrate  ' + vibrate);           
          
            $("#enableNotification").val(enable).slider('refresh');
            $("#enableVibration").val(vibrate).slider('refresh');
        }
        else if ( action == 'enableNotification' ) {
            customNamespace.console('action = enableNotification : ' + enable);
            $("#enableNotification").val(enable).slider('refresh');

        }
        else if ( action == 'enableVibration' ) {
            customNamespace.console('action = enableVibration : ' + vibrate);
            $("#enableVibration").val(vibrate).slider('refresh');            

        }

        if ( enable == 1 ) {
            $("#enableNotification").val('true').slider('refresh');
        }
        if ( vibrate == 1 ) {
            $("#enableVibration").val('true').slider('refresh');  
        }  
        
        if ( (enable == 'true' || enable == true) && action != 'enableVibration') {
            pushNamespace.enablePushNotifications();
        }                    
        else if( (enable == 'false' || enable == false) && action != 'enableVibration') {
            pushNamespace.disablePushNotifications();
        }
        
        
        $('#phoneNotificationsView').trigger('create');
        
    }catch(err){ customNamespace.console("initial setting for push got error: " + err.message);}

};

/*Update the Settings into the SQLite Database*/
phoneNotificationSettingsNameSpace.updatePushSettingsFromSQLite = function (fieldName, fieldValue) {
    //console.log("saveSettingsIntoSQLite");
    var db = sqliteNameSpace.db;
    db.transaction(function (tx) {
        var addedOn = new Date();
        tx.executeSql("UPDATE phoneNotifications SET " + fieldName +  " = '" + fieldValue + "' ",
                      [], phoneNotificationSettingsNameSpace.getPushSettingsFromSQLite(fieldName) ,
                      function(tx, e){
                          customNamespace.console('Error ' + fieldName + ' value ' + fieldValue)
                          customNamespace.console("Error: " + e.message)
                      } );
            });
};
    
////////////////////////////// end check setting to enable or disable push notfication /////////////////////////////////


