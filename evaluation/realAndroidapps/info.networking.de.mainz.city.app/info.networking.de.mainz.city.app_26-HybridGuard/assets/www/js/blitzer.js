var DB_NAME = "blitzerDatabase";
var DB_VERSION = "1.0";
var DB_DISPLAY_NAME = "BlitzerDatenbankMainzandMore";
var DB_SIZE = 512000;
    
var TABLE_NAME = "blitzermeldungen";
var COLUMN_ID = "id";
var COLUMN_MOBILE = "mobile";
var COLUMN_STREET = "street";
var COLUMN_TOWN = "town";
var COLUMN_DISTRICT = "district";

var blitzer = {

resultArray: [],
mobileCounter: 0,
streetCounter: 0,
townCounter: 0,
districtCounter: 0,
mobilesArray: [],
streetsArray: [],
townsArray: [],
districtsArray: [],

// FUNKTION ZUM PARSEN DER LOKALEN XML
xmlParser: function(){
    $.ajax({
           url: "xml/blitzer.xml",
           dataType: "xml",
           success: function(results){
               blitzer.resultArray = results;
               $(blitzer.resultArray).find("mobile").each(function() { blitzer.mobileCounter++; });
               $(blitzer.resultArray).find("street").each(function() { blitzer.streetCounter++; });
               $(blitzer.resultArray).find("town").each(function() { blitzer.townCounter++; });
               $(blitzer.resultArray).find("district").each(function() { blitzer.districtCounter++; });
               blitzer.arrayMaker();
           }
    });
},
    
// FUNKTION ZUM ERSTELLEN DER ARRAYS AUS DEN GEPARSTEN DATEN
arrayMaker: function(){
    $(blitzer.resultArray).find("mobile").each(function(i) { blitzer.mobilesArray[i] = $(this).text(); });
    $(blitzer.resultArray).find("street").each(function(i) { blitzer.streetsArray[i] = $(this).text(); });
    $(blitzer.resultArray).find("town").each(function(i) { blitzer.townsArray[i] = $(this).text(); });
    $(blitzer.resultArray).find("district").each(function(i) { blitzer.districtsArray[i] = $(this).text(); });
    blitzer.openBlitzerDatabase();
},
    
openBlitzerDatabase: function(){
    var sdb = window.openDatabase(DB_NAME, DB_VERSION, DB_DISPLAY_NAME, DB_SIZE);
    sdb.transaction(blitzer.createDatabase, blitzer.errorOnOpening, blitzer.successOpening);
},
    
createDatabase: function(tx){
    tx.executeSql('DROP TABLE IF EXISTS ' + TABLE_NAME);
    tx.executeSql('CREATE TABLE IF NOT EXISTS ' + TABLE_NAME + ' (' + COLUMN_ID + ' INTEGER PRIMARY KEY AUTOINCREMENT, ' + COLUMN_MOBILE + ' TEXT, ' + COLUMN_STREET + ' TEXT, ' + COLUMN_TOWN + ' TEXT, ' + COLUMN_DISTRICT + ' TEXT)');
    for(var i = 0; i < blitzer.streetCounter; i++){
        tx.executeSql('INSERT INTO ' + TABLE_NAME + ' ( ' + COLUMN_MOBILE + ', ' + COLUMN_STREET + ', ' + COLUMN_TOWN + ', ' + COLUMN_DISTRICT + ' ) VALUES ( "' + blitzer.mobilesArray[i] + '", "' + blitzer.streetsArray[i] + '", "' + blitzer.townsArray[i] + '", "' + blitzer.districtsArray[i] + '" )');
    }
    tx.executeSql('SELECT * FROM ' + TABLE_NAME, [], blitzer.queryTable, blitzer.errorOnQuery);
},
    
queryTable: function(tx, results){
    for(var i = 0; i < blitzer.mobileCounter; i++){
        $("#radarMobileList").append('<li class="mobiles" onclick="toMobile(\'' + results.rows.item(i).mobile + '\')"><a href="">' + results.rows.item(i).mobile + '</a></li>');
    }
    for(var i = 0; i < blitzer.streetCounter; i++){
        $("#streetList").append('<li class="streets" onclick="toStreet(\'' + results.rows.item(i).street + '\')"><a href="">' + results.rows.item(i).street + '</a></li>');
    }
    for(var i = 0; i < blitzer.townCounter; i++){
        $("#townList").append('<li class="towns" onclick="toTown(\'' + results.rows.item(i).town + '\')"><a href="">' + results.rows.item(i).town + '</a></li>');
    }
    for(var i = 0; i < blitzer.districtCounter; i++){
        $("#districtList").append('<li class="districts" onclick="toDistrict(\'' + results.rows.item(i).district + '\')"><a href="">' + results.rows.item(i).district + '</a></li>');
    }
},

errorOnQuery: function(qE){
    console.log("Could not execute the query: " + qE);
},
    
errorOnOpening: function(e){
    console.log("Could not open the database: " + e);
},
    
successOpening: function(){
    console.log("Finished opening the database!");
}
};