
var baseLang = "en";
var VersionLocalizedText = "Version";
var facingDirectionLocalizedText = "FACING"
var degrees90LocalizedText = "90&deg; (Directly Overhead)";
var degrees0LocalizedText = "0&deg; (Horizon)";
var btnGetLatLonLocalizedText = "SHOW VIEW";
var btnUseCurrentLocationLocalizedText = "USE MY CURRENT LOCATION";
var lblLocationNotSetLocalizedText = "Where on earth do you want to view the Space Station?";
var lblZipLocalizedText = "ZIP or City";
var storedLocationsLocalizedText = "Your Locations:";
var clearLocationsLocalizedText = "(REMOVE ALL)";
var lblNewLocationLocalizedText = "CHANGE LOCATION";
var appearsLabelLocalizedText = "APPEARS";
var maxLabelLocalizedText = "MAX";
var endsLabelLocalizedText = "VANISHES";
var lblLocationLocalizedText = "Location:";
var lblPassesInNext24HrsLocalizedText = "ALL PASSES";

//Messages:
var doYouReallyWantToRemoveLocalizedText = "Do you really want to delete all stored display locations?";
var noVisiblePasses = "No visible passes in the next 24 hrs for this location.";
var geocodeZeroResults = "The geocode was successful but returned no results. This may occur if a non-existent or invalid ZIP or address was entered. Try again. (maybe some non-alphanumeric characters are causing a problem)";
var geocodeInvalidRequest = "We could not determine your location. The error returned usually means either no ZIP was entered, or the zip or address was not valid.";
var geocodeOverQueryLimit = "We are over our quota of calls to the Google location service. Try again later.";
var geocodeRequestDenied = "Our attempt to determine your location was denied for some reason.";
var geocodeGeneric = "An error occurred, but the location finder did not tell us what is wrong. Make sure you are connected to the internet: ";
var uhaapiGeneric = "Awww SNAP! Our telescope lens needs polishing! We'll be back up in a few minutes. \n\nSorry 'bout that, we hope you didn't miss a viewing opportunity: ";
var uhaapiNoSatellite = "Trouble retrieving pass info for that location: \nThe error code indicates a specific address or zip code may be required. \n\nSorry for the additional keystrokes.";

var specialMessageLocalizedText = "There are very few viewing opportunities in the Northern hemisphere through mid-March"
var noteLocalizedText = "NOTE: ";

if (navigator.userLanguage)//IE specific
    baseLang = navigator.userLanguage.substring(0, 2).toLowerCase();
else
    baseLang = navigator.language.substring(0, 2).toLowerCase();

switch (baseLang) {
    case "it": //Italian
        doYouReallyWantToRemoveLocalizedText = "Sei sicuro di voler eliminare tutte le località di visualizzazione memorizzati?";
        VersionLocalizedText = "versione";
        facingDirectionLocalizedText = "FRONTE";
        degrees90LocalizedText = "90&deg; (direttamente al di sopra)";
        degrees0LocalizedText = "0&deg; (orizzonte)";
        btnGetLatLonLocalizedText = "MOSTRA VISTA";
        btnUseCurrentLocationLocalizedText = "USA MIA POZIZIONE CORRENTE";
        lblLocationNotSetLocalizedText = "Dove diavolo si desidera visualizzare la Stazione Spaziale?";
        lblZipLocalizedText = "città";
        storedLocationsLocalizedText = "Delle posizioni:";
        clearLocationsLocalizedText = " (RIMUOVERE TUTTI)";
        lblNewLocationLocalizedText = "CAMBIO LOCATION";
        appearsLabelLocalizedText = "APPARE";
        maxLabelLocalizedText = "MASSIMO";
        endsLabelLocalizedText = "SCOMPARE";
        lblLocationLocalizedText = "Posizione:";
        lblPassesInNext24HrsLocalizedText = "TUTTO PASSA";
        //Messages
        noVisiblePasses = "Non ci sono passaggi visibili le prossime 24 ore per questa località.";
        geocodeZeroResults = "Il geocode era successo, ma non ha prodotto risultati. Ciò può verificarsi se un ZIP inesistente o non valido o l'indirizzo è stato inserito. Prova di nuovo. (forse alcuni caratteri non alfanumerici stanno causando un problema)";
        geocodeInvalidRequest = "Non è stato possibile determinare la propria posizione. L'errore restituito di solito significa sia nessuna città è stato inserito o la città non era valido.";
        geocodeOverQueryLimit = "Siamo sopra la nostra quota di chiamate al servizio di localizzazione di Google. Riprovare più tardi.";
        geocodeRequestDenied = "Il nostro tentativo di determinare la posizione è stato negato.";
        geocodeGeneric = "È verificato un errore, ma il cercatore di posizione non ci ha detto ciò che è sbagliato. Assicurarsi di essere connessi a Internet:";
        uhaapiGeneric = "Il tracking dei satelliti sarà di nuovo in azione questo pomeriggio. \n\nSorry, speriamo che non perdeva occasione di visualizzazione:";
        uhaapiNoSatellite = "Stiamo avendo problemi recuperando informazioni pass per quella posizione: \nIl codice di errore indica un indirizzo specifico o il codice postale può essere richiesto. \n\nSorry per le combinazioni di tasti.";
        specialMessageLocalizedText = "Ci sono poche opportunità di visualizzazione nell'emisfero settentrionale fino alla metà di marzo";
        noteLocalizedText = "NOTA: ";
        break;
    case "nl": //Dutch - Netherlands
        doYouReallyWantToRemoveLocalizedText = "Bent u echt willen schrappen alle opgeslagen aanwijsplaat plaatsen?";
        VersionLocalizedText = "versie";
        facingDirectionLocalizedText = "FACING";
        degrees90LocalizedText = "90&deg; (recht boven)";
        degrees0LocalizedText = "0&deg; (horizon)";
        btnGetLatLonLocalizedText = "Weergeven";
        btnUseCurrentLocationLocalizedText = "Gebruik mijn huidige locatie";
        lblLocationNotSetLocalizedText = "Waar ter wereld wilt u het ruimtestation te bekijken?";
        lblZipLocalizedText = "City";
        storedLocationsLocalizedText = "Uw Locaties:";
        clearLocationsLocalizedText = " (VERWIJDER ALLE)";
        lblNewLocationLocalizedText = "LOCATIE WIJZIGEN";
        appearsLabelLocalizedText = "VERSCHIJNT";
        maxLabelLocalizedText = "MAXIMAAL";
        endsLabelLocalizedText = "VERDWIJNT";
        lblLocationLocalizedText = "Woonplaats:";
        lblPassesInNext24HrsLocalizedText = "ALLE WEERGAVEN";
        //Messages
        noVisiblePasses = "Geen zichtbare passen in de komende 24 uur voor deze locatie.";
        geocodeZeroResults = "De Geocode was succesvol, maar heeft geen resultaten opgeleverd. Dit kan gebeuren als een niet-bestaand of ongeldig ZIP of het adres is ingevoerd. proberen weer. (misschien een aantal niet-alfanumerieke tekens veroorzaken een probleem)";
        geocodeInvalidRequest = "We konden niet het bepalen van uw locatie. De fout betekent meestal dat het adres niet geldig was.";
        geocodeOverQueryLimit = "Wij zijn over onze quotum van oproepen naar de Google-locatie dienst. Probeer het later opnieuw.";
        geocodeRequestDenied = "Onze poging om je locatie te bepalen werd geweigerd om een ​​bepaalde reden.";
        geocodeGeneric = "Er is een fout opgetreden, Zorg ervoor dat u verbonden bent met het internet:";
        uhaapiGeneric = "Satelliet-tracking weer terug in actie te zijn vanmiddag. \n \nSorry, hopen we dat u geen bezichtiging kans te missen:";
        uhaapiNoSatellite = "Problemen ophalen van pas info voor die locatie: \nDe error code geeft een specifiek adres of postcode nodig zijn. \n \nSorry voor de extra toetsaanslagen.";
        specialMessageLocalizedText = "Er zijn maar weinig het bekijken van de mogelijkheden op het noordelijk halfrond tot half maart";
        noteLocalizedText = "LET OP: ";
        break;
    case "es": //Spanish
        doYouReallyWantToRemoveLocalizedText = "¿Realmente desea eliminar todas las ubicaciones de visualización almacenada?";
        VersionLocalizedText = "versión";
        facingDirectionLocalizedText = "FRENTE";
        degrees90LocalizedText = "90&deg; (Directamente sobre la cabeza)";
        degrees0LocalizedText = "0&deg; (Horizonte)";
        btnGetLatLonLocalizedText = "Vista desde esta ubicación";
        btnUseCurrentLocationLocalizedText = "Utilizar mi ubicación actual";
        lblLocationNotSetLocalizedText = "Donde en la tierra usted desea ver?";
        lblZipLocalizedText = "Ciudad";
        storedLocationsLocalizedText = "Ubicaciones almacenados";
        clearLocationsLocalizedText = " (ELIMINAR TODOS)";
        lblNewLocationLocalizedText = "CAMBIO DE UBICACIÓN";
        appearsLabelLocalizedText = "APARECE";
        maxLabelLocalizedText = "MAXIMO";
        endsLabelLocalizedText = "DESAPARECER";
        lblLocationLocalizedText = "Ubicación:";
        lblPassesInNext24HrsLocalizedText = "TODOS LOS PUNTOS DE VISTA";
        //Messages
        noVisiblePasses = "No hay oportunidades visibles de visión en las próximas 24 horas para esta ubicación.";
        geocodeZeroResults = "La codificación geográfica fue un éxito, pero no tuvo ningún resultado. Esto puede ocurrir si una postal no existe o es inválida o la dirección se ha introducido. Inténtelo de nuevo. (tal vez algunos caracteres no alfanuméricos están causando un problema)";
        geocodeInvalidRequest = "No se pudo determinar su ubicación. El error suele significar o bien no se ha introducido ZIP, o el código postal o la dirección no era válida.";
        geocodeOverQueryLimit = "Estamos en nuestra cuota de llamadas al servicio de localización de Google. Inténtelo más tarde.";
        geocodeRequestDenied = "Nuestro intento de determinar su ubicación se le negó por alguna razón.";
        geocodeGeneric = "Ha ocurrido un error, pero el buscador de ubicaciones no nos dicen lo que está mal. Asegúrese de que está conectado a Internet:";
        uhaapiGeneric = "El rastreo por satélite estará de vuelta en acción esta tarde. <br> Lo siento mucho, esperamos que no se pierda una oportunidad de ver:";
        uhaapiNoSatellite = "Problemas para recuperar información pasar por ese lugar: \nEl código de error indica una dirección específica o código postal puede ser requerida. \n\nSorry de las pulsaciones de teclas adicionales.";
        specialMessageLocalizedText = "Hay pocas oportunidades de observación en el hemisferio norte hasta mediados de marzo";
        noteLocalizedText = "NOTA: ";
        break;
    case "ru": //Russian
        doYouReallyWantToRemoveLocalizedText = "Вы действительно хотите удалить все сохраненные местах экрана?";
        VersionLocalizedText = "Версия";
        facingDirectionLocalizedText = "ПЕРЕД";
        degrees90LocalizedText = "90&deg; (прямо над головой)";
        degrees0LocalizedText = "0&deg; (горизонт)";
        btnGetLatLonLocalizedText = "Вид с этого места";
        btnUseCurrentLocationLocalizedText = "Использовать мое настоящее место";
        lblLocationNotSetLocalizedText = "Где же ты хочешь, чтобы посмотреть откуда?";
        lblZipLocalizedText = "город";
        storedLocationsLocalizedText = "Хранимые проведения";
        clearLocationsLocalizedText = " (Удалить все)";
        lblNewLocationLocalizedText = "Выбрать страну";
        appearsLabelLocalizedText = "Появляется";
        maxLabelLocalizedText = "наивысший";
        endsLabelLocalizedText = "исчезает";
        lblLocationLocalizedText = "Расположение:";
        lblPassesInNext24HrsLocalizedText = "ВСЕ просмотров";
        //Messages
        noVisiblePasses = "Нет видимых проходит в течение 24 часов для этого месте.";
        geocodeZeroResults = "Геокодирование прошла успешно, но не дал результатов. Это может произойти, если несуществующего или недействительного ZIP или адрес был введен. Попробуйте еще раз. (может быть, некоторые не алфавитно-цифровые символы вызывают проблемы)";
        geocodeInvalidRequest = "Мы не могли определить ваше местоположение.Ошибка обычно означает, адрес не был в силе.";
        geocodeOverQueryLimit = "Мы над нашей квоте звонков на расположение службы Google. Попробуйте еще ​​раз позже.";
        geocodeRequestDenied = "Наша попытка определить ваше местоположение было отказано по некоторым причинам.";
        geocodeGeneric = "Произошла ошибка, но расположение видоискателя не сказал нам, что это неправильно. Убедитесь, что вы подключены к Интернету:";
        uhaapiGeneric = "Спутниковое слежение вернется в действие во второй половине дня. <br> Жаль об этом, мы надеемся, что вы не упустили возможность просмотра:";
        uhaapiNoSatellite = "Проблема получения информации пройти для этого места:\nВ код ошибки указывает на определенный адрес или почтовый индекс может оказаться необходимым.\п\nSorry для дополнительных клавиш.";
        specialMessageLocalizedText = "Есть несколько возможностей просмотра в Северном полушарии до середины марта";
        noteLocalizedText = "Примечание: ";
        break;
}

function setLocalizedText() {
    $(".version").text(VersionLocalizedText);
    $("#facingDirection").text(facingDirectionLocalizedText);
    $("#degrees90").html(degrees90LocalizedText);
    $("#degrees0").html(degrees0LocalizedText);
    $("#btnGetLatLon").attr("value", btnGetLatLonLocalizedText);
    $("#btnUsePhoneLatLon").text(btnUseCurrentLocationLocalizedText);
    $("#lblLocationNotSet").text(lblLocationNotSetLocalizedText);
    $("#lblZip").text(lblZipLocalizedText);
    $("#lblStoredLocations").text(storedLocationsLocalizedText);
    $("#lblClearLocations").text(clearLocationsLocalizedText);
    $("#lblNewLocation").text(lblNewLocationLocalizedText);
    $("#lblAppears").text(appearsLabelLocalizedText);
    $("#lblMax").text(maxLabelLocalizedText);
    $("#lblEnds").text(endsLabelLocalizedText);
    $("#lblLocation").text(lblLocationLocalizedText);
    $("#lblPassesInNext24Hrs").text(lblPassesInNext24HrsLocalizedText);
    //Special Message... uncomment when it needs to be displayed.
    //$("#lblNote").text(noteLocalizedText);
    //$("#lblSpecialMessage").text(specialMessageLocalizedText);

}