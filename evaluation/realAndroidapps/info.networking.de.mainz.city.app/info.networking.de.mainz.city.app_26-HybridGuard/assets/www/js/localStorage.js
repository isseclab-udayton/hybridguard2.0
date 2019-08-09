var VERSION = 'versionsNumber';
var AUDIO = 'audio';

/**
 * Speichert die Versionsnummer der Branchen XML im lokalen Speicher der Anwendung
 */
function setVersionBranche(versionNumber){
    window.localStorage.setItem(VERSION, versionNumber);

}

/**
 * Liest die Versionsnummer aus und gibt sie als String zurück
 */
function getVersionBranche(){
    
    var value = window.localStorage.getItem(VERSION);
    //keine Version gespeichert
    if(value == null){
        return '0';
    }
    else{
        return value;
    }
}


function getAudioPlay(){
	
	var value = window.localStorage.getItem(AUDIO);
    //keine Version gespeichert
    if(value == null){
        return true;
    }
    else{
        return false;
    }
}

function setAudioPlay(){
    window.localStorage.setItem(AUDIO, 1);
	
}