//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
// Datenbank der Blitzer /////////////////////////////////////////
// Daten werden aus der xml/blitzer.xml Datei gezogen ////////////

var DB_NAME = "DBBlitzerMainz";
var DB_VERSION = "1.0";
var DB_DISPLAY_NAME = "BlitzerDatenbank";
var DB_SIZE = 512000;


var blitzerXML = {
		
		blitzerObjects: [],
		blitzerArray: [],
		count: 0,
		
		getBlitzerFromXML: function(){
			$.ajax({
				url: "xml/blitzer.xml",
				dataType: "xml",
				success: function(results){
					blitzerXML.blitzerObjects = results;
					$(blitzerXML.blitzerObjects).find("blitzer").each(function(){
						blitzerXML.count++;
					});
					$(blitzerXML.blitzerObjects).find("bezeichnung").each(function(i){
						blitzerXML.blitzerArray[i] = $(this).text();
					});
          			blitzerDB.openBlitzerDB();
				}
			});
		}
};

var blitzerDB = {
		
		blitzer: window.openDatabase(DB_NAME, DB_VERSION, DB_DISPLAY_NAME, DB_SIZE),
	
		openBlitzerDB: function(){
			blitzerDB.blitzer.transaction(blitzerDB.createTable, blitzerDB.failed, blitzerDB.success); //===============================
		},                                                                                                                            //
                                                                                                                                      //
		proofIfExists: function(tx){                                                                                                  //
			tx.executeSql('SELECT blitzertyp FROM blitzer', [], blitzerDB.insertIntoDialog, blitzerDB.failed);                        //
		},                                                                                                                            //
                                                                                                                                      //
		alreadyExists: function(tx, results){                                                                                         //
			console.log("Database already exists. Database not created / updated!");                                                  //
//			tx.executeSql("SELECT * FROM blitzer", [], blitzerDB.insertIntoDialog, blitzerDB.failed);                                 //
			blitzerDB.insertIntoDialog(tx, results);                                                                                  //
		},                                                                                                                            //
                                                                                                                                      //
		createTable: function(tx){//       <============================================================================================
            tx.executeSql('DROP TABLE IF EXISTS blitzer');
			tx.executeSql('CREATE TABLE IF NOT EXISTS blitzer (id INTEGER PRIMARY KEY AUTOINCREMENT, blitzertyp TEXT)');
			for(var i = 0; i < blitzerXML.count; i++){
				tx.executeSql('INSERT INTO blitzer ( blitzertyp ) VALUES ( "' + blitzerXML.blitzerArray[i] + '" )');
			}
			tx.executeSql('SELECT * FROM blitzer', [], blitzerDB.insertIntoDialog, blitzerDB.failed);
		},
		
		insertIntoDialog: function(tx, results){
			for(var j = 0; j < results.rows.length; j++){
                $("#radarMobileList").append('<li class="types" onclick="toMobile(\'' + results.rows.item(j).blitzertyp + '\')"><a href="">' + results.rows.item(j).blitzertyp + '</a></li>');
            }
		},
		
		success: function(){
			console.log("Successfully opened database");
		},
		
		failed: function(err){
			console.log("Could not read: " + err);
		}
		
};