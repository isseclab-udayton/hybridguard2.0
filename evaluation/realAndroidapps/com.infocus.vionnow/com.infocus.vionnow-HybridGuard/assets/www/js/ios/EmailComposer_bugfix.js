function sendEmail(subject, body, file, type) {
    try{
        window.requestFileSystem(
                                 LocalFileSystem.PERSISTENT,
                                 0,
                                 function (fileSystem) {
                                 fileSystem.root.getFile(
                                                         "vionnow.csv",
                                                         { create: false },
                                                         function (fileEntry) {
                                                         fileEntry.file(
                                                                        function (file){
                                                                        console.log("got file");
                                                                        //filereader = FileReader;
                                                                        var args = {
                                                                  			  subject: 'vionnow Sammlung',
                                                                  			  body: 'der Anhang enthält die Liste meiner vionnow Sammlung.',
                                                                  			  attachment: file  
	                                                                  	};
	                                                                  	cordova.exec(null, null, "EmailComposer", "showEmailComposer", [args]);
                                                                        FileReader.readAsText(file);
                                                                        
                                                                        check_file(FileReader, callback_success, callback_fail,0);
                                                                        },
                                                                        callback_fail(e);
                                                         },
                                                         callback_fail(e);
                                 },
                                 callback_fail(e);
    }catch(e){
        console.log("catching a phonegap error "+e);
        callback_fail(e);
    }
}

function check_file(filereader, callback_success, callback_fail, i){
    if (filereader.readyState == FileReader.DONE)
        callback_success(filereader.result);
    else if (i < 100){
        setTimeout(function(){check_file(filereader, callback_success, callback_fail, i+1);}, 50);
    }else{
        callback_fail("Could not read file ");
    }
}

function callback_fail(reason){
    alert(reason);
}
function callback_success(result){
    alert(result);
    var args = {
			  subject: 'vionnow Sammlung',
			  body: 'der Anhang enthält die Liste meiner vionnow Sammlung.',
			  attachment: result  
    	};
    cordova.exec(null, null, "EmailComposer", "showEmailComposer", [args]);
    
}