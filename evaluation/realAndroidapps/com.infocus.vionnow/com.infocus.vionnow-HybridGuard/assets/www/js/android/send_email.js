


function sendEmail(subject, body, file, type) { 
		  var to = "";
          var extras = {};
          extras[WebIntent.EXTRA_SUBJECT] = subject;
          extras[WebIntent.EXTRA_TEXT] = body;
          extras[WebIntent.EXTRA_STREAM] = file;
          window.plugins.webintent.startActivity({
              url: to,
              action: WebIntent.ACTION_SEND,
              type: type, 
              extras: extras 
            }, 
            function() {
                //alert("Versenden der Email angewiesen");
                openPopupInfo('Information', 'Versenden der Email angewiesen');
            }, 
            function() {
              //alert('Failed to send email via Android Intent');
              openPopupInfo('Fehler', 'Versenden der Email konnte nicht angewiesen werden');
            }
          ); 
}
