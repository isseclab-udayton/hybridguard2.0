// window.plugins.emailComposer
    function sendEmail(subject, body, file, type) { 
        window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, gotFS, fail);
    }

    function gotFS(fileSystem) {
        fileSystem.root.getFile("vionnow.csv", {create: true}, gotFileEntry, fail);
    }

    function gotFileEntry(fileEntry) {
        fileEntry.file(gotFile, fail);
    }

    function gotFile(file){
        readDataUrl(file);
        readAsText(file);
    }

    function readDataUrl(file) {
        var reader = new FileReader();
        reader.onloadend = function(evt) {
            console.log("Read as data URL");
            console.log(evt.target.result);
        };
        reader.readAsDataURL(file);
    }

    function readAsText(file) {
        var reader = new FileReader();
        reader.onloadend = function(evt) {
            console.log("Read as text");
            console.log(evt.target.result);
        };
        reader.readAsText(file);
    }

    function fail(evt) {
        console.log(evt.target.error.code);
    }

function sendEmail(subject, body, file, type) { 
	var reader = new FileReader();
	var fileSource = file;

	reader.onloadend = function(evt) {

	    if(evt.target.result == null) {
	       alert("falsch");
	    } else {
	        alert("ok");
	        var args = {
	  			  subject: subject,
	  			  body: body,
	  			  attachment: reader.readAsDataURL(fileSource)
	  	};
	  	cordova.exec(null, null, "EmailComposer", "showEmailComposer", [args]);
	  	//showEmailComposer(subject, body, "", "", "", 0, file);
	    }         
	};
	
}
