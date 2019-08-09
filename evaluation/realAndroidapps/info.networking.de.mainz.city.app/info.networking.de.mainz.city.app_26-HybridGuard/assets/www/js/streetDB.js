////////////////////////////////////////
// Datenbank der Stra§ennamen
var DB_NAME = "DBStrassenMainz";
var DB_VERSION = "1.0";
var DB_DISPLAY_NAME = "Strassen Mainz and More";
var DB_SIZE = 512000;   //Grš§e in Byte => 512000 byte = 500 kb

var TABLE_NAME = "blitzermeldungen";
var TABLE_COLUMN_VER = "version";
var TABLE_COLUMN_MOBILE = "mobile";
var TABLE_COLUMN_STREET = "street";
var TABLE_COLUMN_TOWN = "town";
var TABLE_COLUMN_DIST = "district";


////////////////////////////////////////////////////
// Einlesen in die Datenbank Ÿber XML
var xml = {

version: 0,
streets: [],
count: 0,
mobileArray: [],
streetArray: [],
townArray: [],
distArray: [],
    
parseXML: function(){
    $.ajax({
           url: "xml/blitzer.xml",
           dataType: "xml",
           success: function(results){
           xml.streets = results;
//               if(db.checkedVersion){
                   $(xml.streets).find("street").each(function(){
                                                    xml.count++;
                                                    });
/*                   $(results).find("streetNames").each(function(){
                                                       xml.version = parseFloat($(this).attr("version"));
                                               });*/
                   xml.makeArray();
//               }
           }
           });
},
    
makeArray: function(){
    $(xml.streets).find("mobile").each(function(i){
                                        xml.streetArray[i] = $(this).text();
                                        });
    $(xml.streets).find("street").each(function(i){
                                        xml.streetArray[i] = $(this).text();
                                        });
    $(xml.streets).find("town").each(function(i){
                                    xml.townArray[i] = $(this).text();
                                    });
    $(xml.streets).find("district").each(function(i){
                                         xml.distArray[i] = $(this).text();
                                         });
    openDB();
}
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Erstellen und šffnen der lokalen Datenbank

var sdb = window.openDatabase(DB_NAME,DB_VERSION,DB_DISPLAY_NAME,DB_SIZE);
var dbVersion = 0;

function openDB(){ //DATENBANK WIRD AN DIESER STELLE GE…FFNET; WEITER ZUR ERSTELLUNG
    sdb.transaction(createDB,errorCB,successCB);
}

function createDB(tx){ //FALLS DIE TABELLE NOCH NICHT EXISTIERT WIRD SIE HIER ERSTELLT; WEITER ZUM VERSIONS-CHECK
    tx.executeSql('DROP TABLE IF EXISTS ' + TABLE_NAME);
    tx.executeSql('CREATE TABLE IF NOT EXISTS '+TABLE_NAME+' (id INTEGER PRIMARY KEY  AUTOINCREMENT, '+TABLE_COLUMN_MOBILE+' TEXT, '+TABLE_COLUMN_VER+' REAL, '+TABLE_COLUMN_STREET+' TEXT, '+TABLE_COLUMN_TOWN+' TEXT, '+TABLE_COLUMN_DIST+' TEXT)');
//    checkDBVersion(tx); FUNKTION DIE EINGEBUNDEN WIRD SOBALD DIE VERSIONSABFRAGE UNTERST†TZT WIRD
    
    var addString;
    for(var i=0;i<xml.count;i++){
        addString = "INSERT INTO " + TABLE_NAME;
        addString = addString + " ( ";
        addString = addString + "id, " + TABLE_COLUMN_VER + ",, " + TABLE_COLUMN_MOBILE + ", " + TABLE_COLUMN_STREET + ", " + TABLE_COLUMN_TOWN + ", " + TABLE_COLUMN_PLZ + ", " + TABLE_COLUMN_DIST + " ) ";
        addString = addString + "VALUES ( " + i + ","+xml.version+",'"+xml.mobileArray[i]+"','"+xml.streetArray[i]+"','"+xml.townArray[i]+"','"+xml.distArray[i]+"'";
        addString = addString + " )";
        tx.executeSql(addString);
    }
    
    tx.executeSql('SELECT * FROM '+TABLE_NAME, [], querySuccess, errorCB);
}

function checkDBVersion(tx){ //HIER WIRD AUS DER TABELLE
    tx.executeSql('SELECT '+TABLE_COLUMN_VER+' FROM '+TABLE_NAME, [], versionQuery, errorVersionQuery);
}

function versionQuery(tx, results){ //PR†FE OB DIE SPALTE "VERSION" WERTE HAT; PR†FE ANSCHLIESSEND OB XML-VERSION AKTUELLER IST ALS DB-VERSION
    if(results.rows.length != 0){
        for(var i=0;i<results.rows.length;i++){
            dbVersion = parseFloat(results.rows.item(i).version);
        }
        if(xml.version > dbVersion){
            updateTable(tx);
        }
        else{
            queryDB(tx);
        }
    }
    else{
        fillTable(tx);
    }
}

function errorVersionQuery(tx, err){
    console.log("Error with version query: "+err.code+": "+err.message);
}

function fillTable(tx){
    /*var addString;
    for(var i=0;i<xml.count;i++){
        addString = "INSERT INTO " + TABLE_NAME;
        addString = addString + " ( ";
        addString = addString + "id, " + TABLE_COLUMN_VER + ",, " + TABLE_COLUMN_MOBILE + ", " + TABLE_COLUMN_STREET + ", " + TABLE_COLUMN_TOWN + ", " + TABLE_COLUMN_PLZ + ", " + TABLE_COLUMN_DIST + " ) ";
        addString = addString + "VALUES ( " + i + ","+xml.version+",'"+xml.mobileArray[i]+"','"+xml.streetArray[i]+"','"+xml.townArray[i]+"','"+xml.distArray[i]+"'";
        addString = addString + " )";
        tx.executeSql(addString);
    }
    queryDB(tx);*/
}

function updateTable(tx){
    var updateString;
    for(var i=0;i<xml.count;i++){
        updateString = "UPDATE "+TABLE_NAME+" ";
        updateString = updateString + "SET "+TABLE_COLUMN_VER+"="+xml.version+", ";
        updateString = updateString + TABLE_COLUMN_MOBILE+"='"+xml.mobileArray[i]+"',
        updateString = updateString + TABLE_COLUMN_STREET+"='"+xml.streetArray[i]+"', ";
        updateString = updateString + TABLE_COLUMN_TOWN+"='"+xml.townArray[i]+"', ";
        updateString = updateString + TABLE_COLUMN_DIST+"='"+xml.distArray[i]+"' ";
        updateString = updateString + "WHERE id="+i;
        tx.executeSql(updateString);
    }
    //queryDB(tx);
}

function querySuccess(tx, results){
    for(var i=0;i<results.rows.length;i++){
        $("#radarMobileList").append('<li class="mobiles" onClick="toMobile(\''+results.rows.item(i).mobile+'\')"><a href="">'+results.rows.item(i).mobile+'</a></li>');
    }
    for(var i=0;i<results.rows.length;i++){
        $("#streetList").append('<li class="streets" onClick="toStreet(\''+results.rows.item(i).street+'\')"><a href="">'+results.rows.item(i).street+'</a></li>');
    }
    for(var i=0;i<results.rows.length;i++){
            $("#townList").append('<li class="towns" onClick="toTown(\''+results.rows.item(i).town+'\')"><a href="">'+results.rows.item(i).town+'</a></li>');
    }
    for(var i=0;i<results.rows.length;i++){
        $("#districtList").append('<li class="districts" onClick="toDistrict(\''+results.rows.item(i).district+'\')<a href="">'+results.rows.item(i).district'</a></li>');
    }
}

function requestDB(){
    sdb.transaction(queryDB, errorCB, successCB);
}

function errorCB(err){
    console.log("There was an error: "+err.code+": "+err.message+" / "+err);
}

function successCB(){
    console.log("All processes of the database were successful");
}

function queryDB(tx){
    tx.executeSql('SELECT * FROM '+TABLE_NAME, [], querySuccess, errorCB);
}