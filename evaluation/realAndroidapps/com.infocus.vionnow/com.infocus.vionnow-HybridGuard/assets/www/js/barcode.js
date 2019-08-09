function getBarcode(cont_barcode){
	continue_barcode = cont_barcode;
	window.plugins.barcodeScanner.scan( function(result) {
        /*alert("We got a barcode\n" +
                  "Result: " + result.text + "\n" +
                  "Format: " + result.format + "\n" +
                  "Cancelled: " + result.cancelled);*/
        if(result.cancelled){
        	continue_barcode = 0;
        }
        if(result.format == 'EAN_13'){
        	$.ajax({
        		beforeSend: function() { $.mobile.showPageLoadingMsg(); },
        	    complete: function() { $.mobile.hidePageLoadingMsg() },
        		url: 'http://www.vionnow.de/json/eanMovies/search/'+result.text,
        		dataType: 'jsonp',
        		jsonp: 'jsoncallback',
        		timeout: 10000,
        		success: function(data){
        			if(data && data.ID != null ){
        				//alert(data.ID);
        				setSession_MovieID(data.ID);
        				$.mobile.changePage('#movie_detail');
        			}
        			else{
        				//alert("Der Barcode ist nicht bekannt. Bitte versuche es über die Suche");
        				openPopupInfo('Barcode nicht bekannt', 'Bitte versuche es über die Suche');
        			}
        		},
        		error: function(){
        			getBarcode(cont_barcode);
        		}
        	});
        }
	    }, function(error) {
	        //alert("Scanning failed: " + error);
	        openPopupInfo('Fehler!', 'Scanning failed: ' + error);
	    }
	);
}