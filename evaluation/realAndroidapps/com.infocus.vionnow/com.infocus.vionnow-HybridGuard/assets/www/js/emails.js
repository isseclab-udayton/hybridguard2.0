// allgemein
function gotFS(fileSystem) {
    //console.log(fileSystem.root.fullPath);
    window.rootFS = fileSystem.root;
}

function downloadPdf(user_id){
	$.mobile.showPageLoadingMsg();
	var fileTransfer = new FileTransfer();
	var uri = encodeURI('http://vionnow.de/pdf/'+user_id+'.pdf');
	var filePath = window.rootFS.fullPath +'/vionnow.pdf';

	fileTransfer.download(
	    uri,
	    filePath,
	    function(entry) {
	        //console.log("download complete: " + entry.fullPath);
	        sendEmail('vionnow Sammlung', 'der Anhang enthält die Liste meiner vionnow Sammlung.', 'file:///sdcard/vionnow.pdf', 'application/pdf');
	        $.mobile.hidePageLoadingMsg(); 
	    },
	    function(error) {
	        //console.log("download error source " + error.source);
	        //console.log("download error target " + error.target);
	        //console.log("upload error code" + error.code);
	        $.mobile.hidePageLoadingMsg(); 
	    }
	);

}

// csv
function sendCsvEmail(){
	window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, gotFSCsv, fail);
	
}

function gotFSCsv(fileSystem) {
    fileSystem.root.getFile("vionnow.csv", {create: true}, gotFileEntry, fail); 
    //console.log(fileSystem.root.fullPath);
    window.rootFS = fileSystem.root;
}

function gotFileEntry(fileEntry) {
    fileEntry.createWriter(gotFileWriter, fail);
}

function gotFileWriter(writer) {
    
    db.transaction(
			function(tx) {
		        tx.executeSql('SELECT * FROM movie_storage LEFT JOIN storage_reason ON (movie_storage.storage_reason=storage_reason.id) WHERE deleted != 1',
		        [],
		        function (tx, results) {
		        	var storage_data="";
		        	storage_data +="Titel; Kommentar; Ort; Bewertung; Kategorie\n";
		        	len = results.rows.length;
		        	for (var i=0; i<len; i++){
		        			storage_data += results.rows.item(i).title+';';
		        			storage_data += results.rows.item(i).comment+';';
		        			storage_data += results.rows.item(i).place+';';
		        			storage_data += results.rows.item(i).voting+';';
		        			storage_data += results.rows.item(i).name+'\n';
		        	}
		        	writer.write(storage_data); 
		        	writer.onwrite = function(evt) {
		                //console.log("write success");
		        		//alert("Es öffnet sich in Kürze eine Auswahl");
		        		openPopupInfo('Information', 'Es öffnet sich in Kürze eine Auswahl');
		                sendEmail('vionnow Sammlung', 'der Anhang enthält die Liste meiner vionnow Sammlung.', window.rootFS.fullPath +'/vionnow.csv', 'text/comma-separated-values');
		            };
		        	
		        }, errorCB
			    );
		 });	
}

function fail(error) {
    //console.log(error.code);
}


