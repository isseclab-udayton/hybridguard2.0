
/**
 * Newsletter init
 * bind the form submit to ajax function
 * @return void
 */
function newsLetterInit(){
    $("#subscribeform").ajaxForm({
        success : function (response) {
            var $strHtml = $(response); //converto la risposta in html
            var risposta = $strHtml.find('li').eq(0).text().replace(/(^\s+|\s+$)/g, ''); //prendo il primo tag li e trimmo
            if(risposta == null || risposta == ''){
                risposta = "Si è verificato un errore imprevisto";
            }
            navigator.notification.alert(risposta, null, "Risultato dell'iscrizione" , 'Ok');
        },
        error: function (response) {
            navigator.notification.alert("Non è stato possibile inoltrare l'iscrizione al server", null, 'Invio non riuscito' , 'Ok');
        }
    });
}

/**
 * Display a form error
 * @return void
 */
function checkError(message){
    navigator.notification.alert(message, null, 'Campo non valido' , 'Ok');
}

/**
 * Check form and submit it
 * @return void
 */
function checkForm(){
    //Name validation
    var validation = $("#db_nome").val().replace(/(^\s+|\s+$)/g, '');
    if(!validation || validation == ''){
        checkError("Inserisci un nome");
        return;
    }
    
    //Surname validation
    validation = $("#db_cognome").val().replace(/(^\s+|\s+$)/g, '');
    if(!validation || validation == ''){
        checkError("Inserisci un cognome");
        return;
    }
    
    //Email validation
    validation = $("#db_email").val().replace(/(^\s+|\s+$)/g, '');
    if(!validation || validation == ''){
        checkError("Inserisci un'email");
        return;
    }
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if(reg.test($("#db_email").val()) == false) {
      checkError("Inserisci un'email valida");
      return;
   }
    
    //Group validation
    if(($("#radioAuto").attr("checked")!= true && $("#radioAuto").attr("checked") != 'checked') && ($("#radioMoto").attr("checked")!= true && $("#radioMoto").attr("checked") != 'checked') && ($("#radioIndustria").attr("checked")!= true && $("#radioIndustria").attr("checked") != 'checked')){
        checkError("Seleziona un gruppo");
        return;
    }
    
    //Agree validation
    if($("#consenso").attr("checked")!= true && $("#consenso").attr("checked") != 'checked'){
        checkError("Devi autorizzare il trattamento dei dati");
        return;
    }
    $("#subscribeform").submit();
}