//* CÓDIGO QR *//

			var indice = 0;
			var artista;
			var obra;

			function escanear(){
				window.plugins.barcodeScanner.scan( function(result) {
		         	indice = result.text;
		         	successEscaner();
		         	}, function(error) {
		        		alert("No se pudo completar el escaneo: " + error);
		            }
		    	);
			}

//* BASE DE DATOS *//

			var db = window.openDatabase("guiaartistico_DB","1.0","UNA BD", 200000);
			document.addEventListener("deviceready", onDeviceReady, false);

			function onDeviceReady() {
				db.transaction(populateDB, errorCB, successCB);
			}

			function populateDB(tx) {
				tx.executeSql('CREATE TABLE IF NOT EXISTS ficha (id TEXT PRIMARY KEY NOT NULL, titulo TEXT NOT NULL, fecha TEXT NOT NULL, corriente TEXT NOT NULL, autor TEXT NOT NULL, nacionalidad TEXT NOT NULL, www TEXT NOT NULL )');
       	        tx.executeSql('REPLACE INTO ficha VALUES ("1", "Mona Lisa", "1503", "Clasicismo", "Leonardo Da Vinci", "Italiana", "http://es.wikipedia.org/wiki/Leonardo_da_Vinci")');
				tx.executeSql('REPLACE INTO ficha VALUES ("2", "Mujer con una flor", "1932", "Cubismo", "Pablo Picasso", "Espanola", "http://es.wikipedia.org/wiki/Pablo_Picasso")');
       	     	tx.executeSql('REPLACE INTO ficha VALUES ("3", "La noche estrellada", "1889", "Impresionismo", "Vincent Van Gogh", "Holandesa", "http://es.wikipedia.org/wiki/Vincent_van_Gogh")');
       	     	tx.executeSql('REPLACE INTO ficha VALUES ("4", "La libertad guiando al pueblo", "1830", "Romanticismo", "Eugene Delacroix", "Francesa", "http://es.wikipedia.org/wiki/Eugene_Delacroix")');
       	     	tx.executeSql('REPLACE INTO ficha VALUES ("5", "La tentacion de San Antonio", "1946", "Surrealismo", "Salvador Dali", "Espanola", "http://es.wikipedia.org/wiki/Salvador_Dali")');
			}

			function successCB(){

			}

			function errorCB(err){
       			alert('Error al ejecutar el query: ' + err.message);
       		}


			function successEscaner(){
				db.transaction(queryDB, errorCB);
       		}

			function queryDB(tx){
				tx.executeSql('SELECT * FROM ficha where id = "' + indice + '"', [], querySuccess, errorCB);
       		}

       		function querySuccess(tx,result){
       			$('#info').empty();
                $.each(result.rows,function(index){
                        var row = result.rows.item(index);
                        obra = row['titulo'];
                        artista = row['autor'];
                        $('#info').append('<b>T&iacute;tulo:</b> ' + row['titulo'] + '<br /> <b>Fecha:</b> ' + row['fecha'] + '<br /> <b>Corriente:</b> ' + row['corriente'] + '<br /> <b>Autor: </b>' + row['autor'] + ' (<a href="' + row['www'] + '">Bio</a>)<br /> <b>Nacionalidad:</b> ' + row['nacionalidad'] + '<br />');
                });

                var chica = document.getElementById('chica');
				chica.style.display ='block';
				chica.src="img/Foto_0"+indice+".jpg";
        	}

       		function share(subject,text) {
       		 var share = cordova.require("cordova/plugin/share");
       		 var msj = text + '"' + obra + '" de ' + artista;
       		 share.show({subject: subject, text: msj},
       		  function() {
       		   //console.log("PhoneGap Plugin: Share: callback success");
       		  },
       		  function() {
       		   console.log("PhoneGap Plugin: Share: callback error");
       		  }
       		 );
       		}