function playAudio(src){
	
	//nur beim ersten Start der ANwendung wird die Audiodatei abgespielt
	if(getAudioPlay()){
		
		//Audio wurde abgespiel
		setAudioPlay();
    
        // Create Media object from src
        my_media = new Media(src, onSuccessAudio, onErrorAudio);
    
        // Play audio
        my_media.play();
    }
    
    
}

// onSuccess Callback
function onSuccessAudio() {
    printOnConsole("onSuccessAudio","playAudio():Audio Success");
}

// onError Callback
function onErrorAudio(error) {
    printOnConsole("onErrorAudio",'code: '+ error.code  + ' message: ' + error.message);
}
