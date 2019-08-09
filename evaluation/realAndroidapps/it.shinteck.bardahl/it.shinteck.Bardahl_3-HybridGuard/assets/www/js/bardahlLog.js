/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 *Get formetted user Info with coords, country, administrative area and mac address
 *@return a valid formatted xml value
 */

function getFormattedUserInfo(){
    var uInfo = "";
    try{
        if(macAddress){
            uInfo += "<mac-addr>" + macAddress + "</mac-addr>";
        }
        if(lastPosition.coords){
            uInfo += "<latitude>" + lastPosition.coords.latitude +"</latitude>";
            uInfo += "<longitude>" + lastPosition.coords.longitude +"</longitude>";
        }
        if(lastPosition.components['country']['short']){
            uInfo += "<country>" + lastPosition.components['country']['short'] +"</country>"

        }
        if(lastPosition.components['administrative_area_level_1']['short']){
            uInfo += "<prov>" + lastPosition.components['administrative_area_level_2']['short'] +"</prov>"
        }
    }
    catch(e){
        //Do nothing
        debugAlert(e.toString());
    }
    return uInfo;
}

/*
 *Send an xml without response
 *@param message
 * * the xml to send
 */
function bardahlLogSend(message){
    debugAlert(message);
    try{
        $.ajax({
            type: "POST",
            url: "http://intranet.bardahl.it/MaroilWebServices/BardahlCatalog",
            contentType: "text/xml",
            dataType: "xml",
            data: message
        });
    }
    catch(ex){
        //Do nothing
        debugAlert(e.toString());
    }
}

/*
 *#####################################
 *          Asinc Log request
 *#####################################
 */

//
function catalogLogForSettore(settore){
    var action = "getCatalogLog";
    var soapMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        + "<S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        + "<S:Header/>"
        + "<S:Body>"
        + "<ns2:" + action + " xmlns:ns2=\"" + "http://services.maroil.it/" + "\">";
    soapMsg += getFormattedUserInfo();
    soapMsg += "<settore>" + settore + "</settore>"
        + "</ns2:" + action + ">"
        + "</S:Body>"
        + "</S:Envelope>";
    bardahlLogSend(soapMsg);
}

//
function catalogGroupLogForGruppo(settore, gruppo, subGruppo) {
    var action = "getCatalogGroupLog";
    var soapMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        + "<S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        + "<S:Header/>"
        + "<S:Body>"
        + "<ns2:" + action + " xmlns:ns2=\"" + "http://services.maroil.it/" + "\">";
    soapMsg += getFormattedUserInfo();
    soapMsg += "<settore>" + settore + "</settore>"
        + "<gruppo>" + gruppo +"</gruppo>"
        + "<subgruppo>" + subGruppo +"</subgruppo>"
        + "</ns2:" + action + ">"
        + "</S:Body>"
        + "</S:Envelope>";
    bardahlLogSend(soapMsg);
}

//
function catalogLogForProdotto(prod_id) {
    var action = "getCatalogProdLog";
    var soapMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        + "<S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        + "<S:Header/>"
        + "<S:Body>"
        + "<ns2:" + action + " xmlns:ns2=\"" + "http://services.maroil.it/" + "\">";
    soapMsg += getFormattedUserInfo();
    soapMsg += "<prodotto>" + prod_id + "</prodotto>"
        + "</ns2:" + action + ">"
        + "</S:Body>"
        + "</S:Envelope>";
    bardahlLogSend(soapMsg);
}

//
function shopListLogWithRadius(raggio) {
    var action = "getShopListLog";
    var soapMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        + "<S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        + "<S:Header/>"
        + "<S:Body>"
        + "<ns2:" + action + " xmlns:ns2=\"" + "http://services.maroil.it/" + "\">";
    soapMsg += getFormattedUserInfo();
    soapMsg += "<raggio>" + raggio + "</raggio>"
        + "</ns2:" + action + ">"
        + "</S:Body>"
        + "</S:Envelope>";
    bardahlLogSend(soapMsg);
}

//
function shopLogWithID(shop_id) {
    var action = "getShopLog";
    var soapMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
        + "<S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        + "<S:Header/>"
        + "<S:Body>"
        + "<ns2:" + action + " xmlns:ns2=\"" + "http://services.maroil.it/" + "\">";
    soapMsg += getFormattedUserInfo();
    soapMsg += "<shop>" + shop_id + "</shop>"
        + "</ns2:" + action + ">"
        + "</S:Body>"
        + "</S:Envelope>";
    bardahlLogSend(soapMsg);
}