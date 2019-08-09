/***************** STAU ******************************/
var TRAFFIC_REPORT_URL = "http://195.145.244.220/antenne-mainz/verkehr/melden.php";

function sendTrafficReport(){
    
    //Daten aus dem Formular
    var trafficStreet = $("#trafficReportForm").find('input[name="trafficStreet"]').val();
    var trafficDirection = $("#trafficReportForm").find('input[name="trafficDirection"]').val();
    var trafficReport = $("#trafficReportForm").find('input[name="trafficReport"]').val();
    var trafficReportBy = $("#trafficReportForm").find('input[name="trafficReportBy"]').val();
    
    if(trafficStreet.length == 0 || trafficReport.length == 0){
        
        ui.showDialog("Bitte kontrollieren Sie Ihre Eingabe","Um einen Stau zu melden muss min. die Straße und eine Meldung angeben werden",false);
    }
    else{
        
        $.ajax({
               type: 'POST',
               url: TRAFFIC_REPORT_URL,
               data: {
                    verkehr_strasse: trafficStreet,
                    verkehr_richtung: trafficDirection,
                    verkehr_meldung: trafficReport,
                    verkehr_gemeldet_von: trafficReportBy,
                    verkehr_published: 'N',
                    verkehr_extern: 'Y'
               },
               success: function(msg){
                    ui.showDialog("Danke für Ihre Meldung","Ihre Stau Meldung ist bei uns eingegangen und wird von einem unser Mitarbeiter bearbeitet",false);
               },
               error: function(xhr, textStatus, error){
                    ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
               }
        });
        
        
    }
}

/***************** BLITZER ***************************/


var RADAR_REPORT_URL = "http://195.145.244.220/antenne-mainz/blitzer/melden.php";

function sendRadarReport(){
 
    //Daten aus dem Formular
    var radarMobile = $("#radarMobileList").prev().find("input").val();
    var radarStreet = $("#streetList").prev().find("input").val();
    var radarTown = $("#townList").prev().find("input").val();
    var radarDistrict = $("#districstList").prev().find("input").val();
    var radarDirection = $("#radarReportForm").find('input[name="radarDirection"]').val();
    var radarDes = $("#radarReportForm").find('textarea[name="radarDescription"]').val();
    var radarReportBy = $("#radarReportForm").find('input[name="radarReportBy"]').val();

    if(radarMobile.length == 0 || radarTown.length == 0 || radarDes.length == 0 ){
    
        ui.showDialog("Bitte kontrollieren Sie Ihre Eingabe","Um einen Bitzer zu melden muss min. das Messfahrzeug, die Straße und Position/ Beschreibung angeben werden",false);
    
    }
    else{
        
        
        $.ajax({
               type: 'POST',
               url: RADAR_REPORT_URL,
               data: {
                    blitzer_messfahrzeug: radarMobile,
                    blitzer_strasse: radarStreet,
                    blitzer_ort: radarTown,
                    blitzer_stadtteil: radarDistrict,
                    blitzer_position: radarDes,
                    blitzer_richtung: radarDirection,
                    blitzer_gemeldet_von: radarReportBy,
                    blitzer_published: 'N',
                    blitzer_extern: 'Y'
               },
               success: function(msg){
                 ui.showDialog("Danke für Ihre Meldung","Ihre Blitzer Meldung ist bei uns eingegangen und wird von einem unser Mitarbeiter bearbeitet",false);
               },
               error: function(xhr, textStatus, error){
                  ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
               }
        });
        
    
    }
}



function sendDialog(title,text){
    
    navigator.notification.alert(text,                 // message
                                 sendDialogDismissed,       // callback
                                 title,                // title
                                 "OK"                  // buttonName
                                 );
    
}

function sendDialogDismissed(){
    // do something
}
