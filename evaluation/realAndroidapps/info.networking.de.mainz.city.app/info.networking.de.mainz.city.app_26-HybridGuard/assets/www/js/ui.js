var ui = {
    back: false,
    // Ladeanmitation Anzeigen
    showLoadingScreen: function(){
        var msg = ""
        $.mobile.showPageLoadingMsg("b", msg);
    },
    // Ladeanmitation nicht mehr anzeigen
    hideLoadingScreen: function(){
        $.mobile.hidePageLoadingMsg();
    },
    showDialog: function(title, text, back){
        this.back = back;
        navigator.notification.alert(text,                 // message
                                     this.alertDismissed,       // callback
                                     title,                // title
                                     "OK"                  // buttonName
                                     );

    },
    alertDismissed: function(){
        
        if(this.back){
            navi.goBack();
        }
        
    },
    impressumsDialog: function(version) {
        
        navigator.notification.confirm(
                                       "Sie nutzen die App Mainz & More in der Version "+ version, // message
                                       this.impressumCallback,            // callback to invoke with index of button pressed
                                       'App Version',           // title
                                       'Schließen,Impressum'         // buttonLabels
                                       );

    },
    impressumCallback: function(buttonIndex){
        
        if(buttonIndex == 2){
            navi.showExternalPage('http://195.145.244.220/mainzundmore/impressum.php');
        }
    }
}