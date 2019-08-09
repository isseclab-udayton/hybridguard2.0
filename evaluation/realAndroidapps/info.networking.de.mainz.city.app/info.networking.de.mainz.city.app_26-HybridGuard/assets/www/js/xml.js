/************************ KONSTANTEN SUCHE ********************/
//XML URL
var XML_URL_SEARCH_CONFIG = "http://icon008.info-mainz.de/firmen/app/branchen.php?version=";
var XML_URL_LISTE = "http://icon008.info-mainz.de/firmen/app/firmen_liste.php";
var XML_URL_DETAIL = "http://icon008.info-mainz.de/firmen/app/firmen_detail.php?idx=";

//Suche Branche
var XML_URL_ELEMENT_BRANCHE = "branche=";
var XML_URL_ELEMENT_POSITION = "position=";
var XML_URL_ELEMENT_STADTGEBIET = "stadtgebiet=";

//Suche Sucgbegriff
var XML_URL_ELEMENT_SUCHBEGRIFF = "keyword=";
var XML_URL_ELEMENT_FIRMENNAME = "firmenname=";

//Element der XML SearchConfig
var XML_SC_BRANCHEN = "branchen";
var XML_SC_ATTRIBUTE_VERSION = "version";
var XML_SC_SHOPS = "shops";
var XML_SC_GASTRO = "gastro";
var XML_SC_BRANCHE = "branche";
var XML_SC_KATEGORIEN = "kategorien";
var XML_SC_KATEGORIE = "kategorie";
var XML_SC_NAME = "name";
var XML_SC_VERSION = "version";

//Attribute der XML Liste f�r Shop, Gastro, Events, Blitzer
var XML_LISTE_ATTRIBUTE_COUNT = "count";
var XML_LISTE_ATTRIBUTE_POSITION = "position";

//Elemente der XML Liste
var XML_LISTE_FIRMEN = "firmen";
var XML_LISTE_FIRMA = "firma";
var XML_LISTE_IDX = "idx";
var XML_LISTE_NAME = "name";
var XML_LISTE_STRASSE = "strasse";
var XML_LISTE_ORT = "ort";
var XML_LISTE_LOGO = "logo";
var XML_LISTE_LAT = "latitude";
var XML_LISTE_LONG = "longitude";

//Elemente der XML Detials
var XML_DETAIL_FIRMA = "firma";
var XML_DETAIL_GEBIET = "gebiet";
var XML_DETAIL_NAME = "name";
var XML_DETAIL_STRASSE = "strasse";
var XML_DETAIL_PLZ = "plz";
var XML_DETAIL_ORT = "ort";
var XML_DETAIL_STADTGEBIET = "stadtgebiet";
var XML_DETAIL_TELEFON = "telefon";
var XML_DETAIL_FAX = "telefax";
var XML_DETAIL_EMAIL = "email";
var XML_DETAIL_WEB = "homepage";
var XML_DETAIL_FACEBOOK = "facebook";
var XML_DETAIL_BESCHREIBUNG = "beschreibung";
var XML_DETAIL_OEFFUNGSZEITEN = "oeffnungszeiten";
var XML_DETAIL_ZUSATZ = "zusatz";
var XML_DETAIL_IMAGE_1 = "image_1";
var XML_DETAIL_IMAGE_2 = "image_2";
var XML_DETAIL_IMAGE_3 = "image_3";
var XML_DETAIL_IMAGE_4 = "image_4";
var XML_DETAIL_MARKEN = "marken";
var XML_DETAIL_PDF = "pdf";
var XML_DETAIL_PDF_TITLE = "pdf_titel";
var XML_DETAIL_VIDEO = "video";
var XML_DETAIL_VIDEO_TITLE = "video_titel";

//Unterscheidung welche Funktion nach den erfolgreichen ajaxaufruf aufgerufen wird
//GET-Request
var GET_SEARCH = 0;
var GET_DETAIL = 1;
var GET_EVENTS_DETAILS = 2;
var GET_RADAR_LISTE = 3;
var GET_NEWS_LISTE = 4;
var GET_NEWS_DETAILS = 5;
var GET_TRAFFIC_LIST = 6;
var GET_WEATHER = 7;

//POST-Request
var POST_LISTE_SECTOR = 0;
var POST_LISTE_KEYWORD = 1;
var POST_GASTRO_SECTOR = 2;
var POST_GASTRO_KEYWORD = 3;
var POST_INSIDER_GASTRO_LISTE = 4;
var POST_INSIDER_SHOP_LISTE = 5;
var POST_INSIDER_DETAIL = 6;
var POST_GASTRO_TIPPS = 7;


//liste Item Suche
var positionList = 0;
var brancheList = '';
var kategorieList = '';
var gebietList = '';
var postId = 0;
var ITEM_COUNT = 20;


/************************ KONSTANTEN EVENTS ********************/
var XML_URL_EVENTS = "http://icon008.info-mainz.de/firmen/app/VA-Today.php";
var PIC_URL = "http://icon008.info-mainz.de/firmen/app/showImage.php?img=http://195.145.244.209/dbimg/";
var PIC_URL_GROSS = "http://195.145.244.209/dbimg/";
var XML_URL_EVENTS_DETAILS = "http://icon008.info-mainz.de/firmen/app/VA-Details.php?id=";
var XML_URL_EVENTS_TERMIN_ID = "&termin=";

//ELemente der XML EVENTS Liste
var XML_EVENTS_VERANSTALTUNGEN = "veranstaltungen";
var XML_EVENTS_VERANSTALTUNG = "veranstaltung";
var XML_EVENTS_NAME = "name";
var XML_EVENTS_ID = "id";
var XML_EVENTS_STADT = "stadt";
var XML_EVENTS_BILD = "bild";
var XML_EVENTS_ORT = "veranstaltungsort";
var XML_EVENTS_TERMIN = "termin";
var XML_EVENTS_TERMIN_ID = "id";

//Elemente der XML EVENTS Details
var XML_EVENTS_DETAIL_MAINDATA = "maindata";
var XML_EVENTS_DETAIL_NAME = "name";
var XML_EVENTS_DETAIL_BES = "beschreibung";
var XML_EVENTS_DETAIL_BILD = "bild";
var XML_EVENTS_DETAIL_LINK = "externer_link";
var XML_EVENTS_DETAIL_TERMIN = "termin";
var XML_EVENTS_START_DATE = "start_date";
var XML_EVENTS_END_DATE = "end_date";
var XML_EVENTS_START_TIME = "start_time";
var XML_EVENTS_END_TIME = "end_time";

var XML_EVENTS_DETAIL_VERANSTALTUNGSORT ="veranstaltungsort";
var XML_EVENTS_DETAIL_STRASSE = "strasse";
var XML_EVENTS_DETAIL_ORT = "ort";
var XML_EVENTS_DETAIL_PLZ = "plz";
var XML_EVENTS_DETAIL_TEl = "tel";
var XML_EVENTS_DETAIL_FAX = "fax";
var XML_EVENTS_DETAIL_STOP = "haltestelle";

var XML_EVENTS_DETAIL_VERANSTALTER = "veranstalter";
var XML_EVENTS_DETAIL_EMAIL = "email";

var categorieEvents;

/************************ KONSTANTEN Blitzer ***************/
var XML_URL_RADAR = "http://icon008.info-mainz.de/firmen/app/blitzer_liste.php";

//ELemente der XML Blitzer Liste
var XML_RADAR_BLITZERLISTE = "blitzerliste";
var XML_RADAR_BLITZER = "blitzer";
var XML_RADAR_BLITZER_ID = "blitzer_id";
var XML_RADAR_BLITZER_FAHRZEUG = "blitzer_messfahrzeug";
var XML_RADAR_BLITZER_STRASSE = "blitzer_strasse";
var XML_RADAR_BLITZER_ORT = "blitzer_ort";
var XML_RADAR_BLITZER_STADTTEIL = "blitzer_stadtteil";
var XML_RADAR_BLITZER_POSITION = "blitzer_position";
var XML_RADAR_BLITZER_RICHTUNG = "blitzer_richtung";
var XML_RADAR_BLITZER_UPADATE = "blitzer_updated";
var XML_RADAR_BLITZER_REPORT = "blitzer_gemeldet_von";
/************************ KONSTANTEN Parken **************/



/************************ KONSTANTEN News ****************/
var XML_URL_NEWS = "http://icon008.info-mainz.de/firmen/app/news_liste.php";
var XML_URL_NEWS_DETAIL = "http://icon008.info-mainz.de/firmen/app/news_detail.php";

//Elemente der XML News Liste
var XML_NEWS_NEWSLISTE = "newsliste";
var XML_NEWS_NEWS = "news";
var XML_NEWS_ID = "news_id";
var XML_NEWS_ORT = "news_ort";
var XML_NEWS_TITEL = "news_titel";
var XML_NEWS_SUBTITEL = "news_subtitel";
var XML_NEWS_EILMELDUNG = "news_eilmeldung";
var XML_NEWS_DATUM = "news_datum";
var XML_NEWS_UHRZEIT = "news_uhrzeit";

//ELement der XML News Detail
var XML_NEWS_ARTIKEL = "news_artikel";

var newsPositionList = 0;
var NEWS_COUNT = 10;

/****************** VERKEHR  ******************/
var XML_URL_TRAFFIC = "http://icon008.info-mainz.de/firmen/app/verkehr_liste.php";

var XML_TRAFFIC_VERKEHR_LISTE = "verkehrliste";
var XML_TRAFFIC_VERKEHR = "verkehr";
var XML_TRAFFIC_VERKEHR_STRASSE = "verkehr_strasse";
var XML_TRAFFIC_VERKEHR_RICHTUNG = "verkehr_richtung";
var XML_TRAFFIC_VERKEHR_MELDUNG = "verkehr_meldung";
var XML_TRAFFIC_VERKEHR_GEMELDET = "verkehr_gemeldet_von";
var XML_TRAFFIC_VERKEHR_UPDATED = "verkehr_updated";

/*********************** WETTER ********************/
var XML_URL_WEATHER = "http://icon008.info-mainz.de/firmen/app/wetter.php";
var XML_WEATHER_WETTER_LIST = "wetterliste";
var XML_WEATHER_WETTER = "wetter";
var XML_WEATHER_MELDUNG = "wetter_meldung";
var XML_WEATHER_AKTUELL = "wetter_akt_temp";
var XML_WEATHER_MIN = "wetter_min_temp";
var XML_WEATHER_MAX = "wetter_max_temp";
var XML_WEATHER_SYMBOL = "wetter_symbol";

/******************* INSIDER *****************/
var XML_URL_INSIDER_SHOP = "https://icon008.info-mainz.de/firmen/app/insider_liste.php";
var XML_URL_INSIDER_DETAIL = "https://icon008.info-mainz.de/firmen/app/insider_detail.php?idx=";

//Liste
//nutze die gleichen ELemente wie die Liste
var XML_INSIDER_LISTE_HEADLINE = "tip_a_schlagzeile";
var XML_INSIDER_LISTE_HAS_TIP = "has_tip_a";
var XML_INSIDER_LISTE_DETAIL = "tip_a_detail";

//entscheidet ob die Seite "searchListPage" angezeigt wird oder ob die Liste auf der Seite "searchListPage" refresht wird
var showSearchListPage;
//entscheidet ob die Seite "eventsListPage" angezeigt wird oder ob die Liste auf der Seite "eventsListPage" refresht wird
var showEventsListPage;
//entscheidet ob die Seite "trafficListPage" angezeigt wird oder ob die Liste auf der Seite "trafficListPage" refresht wird
var showTrafficListPage;
//entscheidet ob die Seite "specialListPage" angezeigt wird oder ob die Liste auf der Seite "specialListPage" refresht wird
var showSpecialListPage;
//entscheidet ob die Seite "radarListPage" angezeigt wird oder ob die Liste auf der Seite "radarListPage" refresht wird
var showRadarListPage;
//entscheidet ob die Seite "insiderListPage" angezeigt wird oder ob die Liste auf der Seite "insiderListPage" refresht wird
var showInsiderListPage;

/******************** TANKEN ***************/
function fuelList(){
    
    
    if(conection.internet()){
        
        //var band_id = $('#selectMarke').val();
        var fuel_id = $('#selectSpritsorte').val();
        var radius = $('#searchRadius').val();
        //var plz = $('#inputPLZ').val();
        
        /* if(plz.length > 0){
         navi.showExternalPage('http://mehr-tanken.de/list?brand_id=0&fuel_id='+fuel_id+'&radius='+radius+'&lat=0&lon=0&plz='+ plz+'&city=&suche=Suche&result=mobile');
         }
         else{*/
        navi.showExternalPage('http://mehr-tanken.de/list?searchText=Mainz&brand=0&fuel='+fuel_id+'&range='+radius+'&suche=');
        
        //}
        //

    
    }else{
        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);

    
    }
    

}




//ID auf welchen Seite vom SubMen� zur�ckgesprungen wird. WIchtig f�r den Slider
var backId;
var RESTAURANT = "restaurant";
var FRUESTUECK = "frühstück";
/************************ SUCHE ********************/
/**
 * Einstellung f�r die Suche bei Shop und Gastro
 */
function searchConfig(){
	
    printOnConsole("searchConfig","searchConfig");
    
    //Auslesen der Versionsnummer aus dem lokalen Speicher
	var version = getVersionBranche();
    if(version > 0){
        detectAndroidVersion(XML_URL_SEARCH_CONFIG + version,GET_SEARCH);
    }
    else{
        detectAndroidVersion('xml/new.xml',GET_SEARCH);
    }
}

//Suchanfrage f�r Breiche
function searchSector(sector, back, value){
    
    //alert("asdad");
    
    brancheList = '';
    kategorieList = '';
    gebietList = '';
    
    postId = setPostId(sector);
    
    if(postId > -1){
        
        showSearchListPage = true;
        
        backId = back;
        
        brancheList = value;
        
        printOnConsole("searchData","back: " + back + " PostId: " + postId + " BrancheList: " + brancheList);
        
        postXML(XML_URL_LISTE, false, postId, brancheList, kategorieList, positionList, gebietList);
        
        //searchData(element,'', postId);
    }
    
}

//Suchanfrage f�r alle Bereiche die kein SubMen� haben
/*function searchSectorWithoutSub(branche,sector,back){
    
    postId = setPostId(sector);

    if(postId > -1){
        
        showSearchListPage = true;
        
        kategorieList = '';
        gebietList = 'all';
        brancheList = branche;
        
        positionList = 0;
        
        //notl�sung -> f�r keine SubMen�s
        backId = back;

        postXML(XML_URL_LISTE, false, postId, brancheList, kategorieList, positionList, gebietList);
    }
}*/

//Unterscheidet welche PostId genommen werden soll
function setPostId(sector){
    
    switch(sector){
        case 'shop':
            return POST_LISTE_SECTOR;
            break;
        case 'gastro':
            return POST_GASTRO_SECTOR;
            break;
        case 'gastroKeyword':
            return POST_GASTRO_KEYWORD;
        case 'shopKeyword':
            return POST_LISTE_KEYWORD;
        default:
            return -1;
            break;
    }

}

//ermittelt die Daten des per id festgelegten SubMue
/*function searchData(id, categorie, gastoOrShop){

    showSearchListPage = true;
    
    brancheList = '';
    kategorieList = '';
    gebietList = '';
	
    printOnConsole("searchData","searchData");
    
    positionList = 0;
    
    var str = $(id).serialize();
    
    if(str.length > 0){
        
        var index = "checkboxCat=".length;
        
        str = decodeURIComponent(str)
        
        str = str.substr(index, str.length);
        
        str = str.replace(/\+/g, " ");
        //alert(str);
        brancheList = str.replace(/\&checkboxCat=/g, "_");
        
        //alert(brancheList);
        
        postXML(XML_URL_LISTE, false, gastoOrShop, brancheList, kategorieList, positionList, gebietList);
        
        
    }else{
        ui.showDialog("Achtung","Sie muessen mindesten eine Element auswaehlen",false);
    }


}*/

//Suchanfrage f�r Suchbegriffe
function searchKeyword(sector, inputId_1, inputId_2, select, back){
    
    showSearchListPage = true;

    printOnConsole("searchKeywordXML","searchKeywordXML");

    positionList = 0;
    gebietList = 'all';
    postId = setPostId(sector);
    backId = back;
    
	//Abfrage Branche
	brancheList = $(inputId_1).val();
    kategorieList = $(inputId_2).val();
    gebietList = $(select).val();
    
    if(gebietList == 'all'){
        
        //eins von beiden muss mindestens ausgew�hlt worden sein
        if(brancheList.length == 0 && kategorieList.length == 0){
            
            ui.showDialog("Fehler Suche", "Bitte waehlen Sie einen Namen oder einen Suchbegriff aus.", false);
            
        }else{
            
            printOnConsole("searchKeywordXML","************************* "+ gebietList );
            //alert(brancheList + ' ' + kategorieList);
            postXML(XML_URL_LISTE, false, postId, brancheList, kategorieList, positionList, gebietList);
            
        }
    }
    else{
        postXML(XML_URL_LISTE, false, postId, brancheList, kategorieList, positionList, gebietList);
    }
   
    
}

//Suchanfrage f�r GastroTipps
function searchGastroTipps(kind,back){

    postId = POST_GASTRO_TIPPS;
    showSearchListPage = true;
    positionList = 0;
    brancheList=  "gastro";
    backId = back;
    kategorieList = kind;
    postXML(XML_URL_LISTE,false,postId,brancheList,kategorieList,positionList,gebietList);
    
}

//n�chsten Elemente f�r die Liste
function nextSearchList(){

	positionList = positionList + ITEM_COUNT;
    
    printOnConsole("nextXML","Pos: "+positionList);
	
    postXML(XML_URL_LISTE,false,postId,brancheList,kategorieList,positionList,gebietList);
}

//vorrigen Elemente der Liste
function prevSearchList(){
	
	positionList = positionList - ITEM_COUNT;
	
	postXML(XML_URL_LISTE,false, postId, brancheList, kategorieList, positionList, gebietList);
}

/**
 * Erstellt die URL
 * @param sector - branche/CompanyName -> String
 * @param cat - Katorie/keyword -> String
 * @param pos - Position -> String
 * @param area - Gebiet -> String
 * @param kind -> Art der URL f�r Branche oder Suchbergriff -> String: sector,keyword 
 */
function buildURL(sector,cat,pos,area,kind){
	
    if(kind === 'sector'){
        var tmp = '';
        //URL zusammen bauen
    
        printOnConsole("buildURL","Branche: "+sector);
        printOnConsole("buildURL","Kategorie: "+cat);
        printOnConsole("buildURL","Gebiet: "+area);
    
    
        if(cat == 'all' || cat.length == 0){
            tmp = XML_URL_ELEMENT_BRANCHE + sector;
        }
        else{
            tmp = XML_URL_ELEMENT_BRANCHE + cat;
        }
	
        if(area.length == 0){
            area = 'all';
        }
    
        printOnConsole("buildURL","URL: "+XML_URL_LISTE + tmp + '&' + XML_URL_ELEMENT_STADTGEBIET + area + '&' + XML_URL_ELEMENT_POSITION + pos);
	
        return  XML_URL_LISTE + tmp + '&' + XML_URL_ELEMENT_STADTGEBIET + area + '&' + XML_URL_ELEMENT_POSITION + pos;
    }
    else if(kind === 'keyword' ){
    
       
        printOnConsole("buildURL","URL: "+XML_URL_LISTE + XML_URL_ELEMENT_FIRMENNAME + sector +'&' + XML_URL_ELEMENT_SUCHBEGRIFF + cat + '&' + XML_URL_ELEMENT_POSITION + pos);
        return  XML_URL_LISTE + XML_URL_ELEMENT_FIRMENNAME + sector +'&' + XML_URL_ELEMENT_SUCHBEGRIFF + cat + '&' + XML_URL_ELEMENT_POSITION + pos;
    
    
    }
    
    return '';
	
}

//Anfrage Detailansicht
function searchDetail(id){
	
	detectAndroidVersion(XML_URL_DETAIL+id,GET_DETAIL);
}

//Parser f�r die Listen XML genutzt von Shop und Gastro
var adressArray;
function listeXMLParser(xml){
    
    printOnConsole("listeXMLParser","listeXMLParser");
    
    adressArray = [];
    //Banner
    var source = '';
    //Insider
    var tipp = '';
    
    
    if(postId == POST_LISTE_SECTOR || postId == POST_LISTE_KEYWORD){
        //Banner Shop
        
        advertise.setAdShopList();
    }
    else if(postId == POST_GASTRO_SECTOR || postId == POST_GASTRO_KEYWORD){
        
        //werbung Gastro
        advertise.setAdGastroList();
    }
    else if(postId == POST_GASTRO_TIPPS){
        
        if(kategorieList == RESTAURANT){
            
            advertise.setAdGastroTippRestaurantList();
        }else{
            advertise.setAdGastroTippFruestueckList();
        }
    }
    
    //Back Button 
    //alert(backId);
    if(backId == 'noSubMenu'){
        $('#shopGastroBack').attr("onclick","navi.changeToPage('#naviPage')");
    }
    else{
        $('#shopGastroBack').attr("onclick","slider.goBackToSubMenu('" + backId + "')");
    }

    xmlDoc = $.parseXML(xml);
		
    
	$(xmlDoc).find(XML_LISTE_FIRMEN).each(function()
	{
		var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
		
        if(count > 0){
             
            //printOnConsole("listeXMLParser","XML: "+xmlDoc);

                                          
            //printOnConsole("listeXMLParser","Count: "+count);
		
            positionList = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_POSITION));
		
            //printOnConsole("listeXMLParser","positionList "+positionList);
                                          
            var listItem = '';
                                          
            //Bei der Such mittels Suchbegriff oder Name soll das erste List Element
            //ein eintrag auf die Karte enthalten.
            //klickt der User auf diese eintrage wird er auf die Karte weiter geleitet
            if(postId == POST_LISTE_KEYWORD || postId == POST_GASTRO_KEYWORD){
                                          
                listItem = '<li><a onClick="listMapXML()"><div class="listPic" ><img src="bilder/suche/Icon_ShowMap.png" /></div><div class="listWithPic"><h3 class="listTitle">Suchergebnisse</h3><div class="listText">auf der Karte anzeigen</div></div></a></li>';
            }
                                          
		
            $(this).find(XML_LISTE_FIRMA).each(function()
            {
                //Firmen Liste
                var id = $(this).find(XML_LISTE_IDX).text();
                var name = $(this).find(XML_LISTE_NAME).text();
                var street = $(this).find(XML_LISTE_STRASSE).text();
                var town = $(this).find(XML_LISTE_ORT).text();
                var picture = $(this).find(XML_LISTE_LOGO).text();
                var lat = $(this).find(XML_LISTE_LAT).text();
                var long = $(this).find(XML_LISTE_LONG).text();
                
                                               
                //printOnConsole("listeXMLParser","Tipp: "+tipp);
                
                //Insider liste
                tipp = $(this).find(XML_INSIDER_LISTE_HAS_TIP).text();
                var headline = $(this).find(XML_INSIDER_LISTE_HEADLINE).text();
                                               
                
                //printOnConsole("listeXMLParser","Tipp: "+tipp);
                
                //Daten f�r die Karte
                var marker_buffer = new Object();
                                                                                                              
                if(picture.length == 0){
                                               
                    marker_buffer['click'] = false;
                    marker_buffer['id'] = '';
                    //ohne bild
                    listItem = listItem + '<li data-icon="false"><a href=""><div>';
                                               
                                            
                }
                else{
                    
                    marker_buffer['click'] = true;
                    marker_buffer['id'] = id;
                    
                    //tipp nicht vorhanden
                    if(tipp == 'Y'){
                        //markierung insider
                        listItem = listItem + '<li  class="listInsiderImage">';
                                               
                    }else{
                       
                        //ohne Insider
                        listItem = listItem + '<li>';
                    }
                                               
                    listItem = listItem + '<a onClick="searchDetail(\'' + id + '\')"><div class="listPic" ><img src="' + picture + '" /></div><div class="listWithPic">';
                }
                                               
                                    
                marker_buffer['lat'] = lat;
                marker_buffer['long'] = long;
                //printOnConsole("listeXMLParser","lat und long"+lat + ' '+ long );
                
                 listItem = listItem + '<h3 class="listTitle">' + name + '</h3><div class="listText">' + street + '</div>';
                                               
                if(tipp == 'Y'){
                    
                    listItem = listItem +  '<div class="listText" style="color: red">Insider-Tipp:</div><div class="listText" style="white-space:normal;">' + headline + '</div>';
                
                }else{
                    listItem = listItem + '<div class="listText">' + town + '</div>';
                }
                                               
                listItem = listItem + '</div></a></li>';
                
                //Speichern der Daten f�r die anzeige der Daten auf der Karte
                adressArray.push(marker_buffer);
                               
            });
         
            $("#shopGastroList").html(listItem);
        
            //Navigation
            var naviButton = '';
       
            printOnConsole("listeXMLParser","positionList : "+listItem);
        
            //Zur�ck Button
            if(positionList > 0){
                                          
                $("#leftNavi").html('<a onClick="prevSearchList()" data-role="button" class="leftButton" data-inline="true">Zur&uuml;ck</a>');
            }else{
                $("#leftNavi").html('');
            }
                                          
            //Weiter Button
            var tmp = positionList + ITEM_COUNT;
        
            if(tmp < count){
                                          
                $("#rightNavi").html('<a onClick="nextSearchList()" class="rightButton" data-role="button" data-inline="true">Weiter</a>');
            }
            else{
                $("#rightNavi").html('');
            }
                                          
            $("#shopGastroListNavi").trigger("create");
            $.mobile.silentScroll(0);
                                          
                        
            ui.hideLoadingScreen();
            
            printOnConsole("listeXMLParser","firstTime: "+firstTime);
            
            //entweder wird die Page angezeigt oder die Listview refresht
            if(showSearchListPage){
                showSearchListPage = false;
                //wechsel auf die Ergebnisseite
                
                $.mobile.changePage("#shopGastroListPage");
            }else{
                //alert("asdasd");
                //funktion steht in index.html
                refreshList('#shopGastroList');
                
            }
                                          
        }else{
            
            ui.hideLoadingScreen();
            ui.showDialog("Keine Treffer","Ihre Suche ergab leider keine Treffer.",false);
        }                                    
   });
}

function listMapXML(){
    
    if(postId == POST_LISTE_SECTOR || postId == POST_LISTE_KEYWORD){
        showPositionsOnMap(adressArray,'shop');
    }
    else{
        showPositionsOnMap(adressArray,'gastro');
    }
}

//Hilfsvariablen f�r die Darstellung der Position auf der Karte
var nameDetail = '';
var streetDetail = '';
var zipcodeDetail = '';
var placeDetail = '';
function detailsXMLParser(xml){
    
    if(postId == POST_LISTE_SECTOR || postId == POST_LISTE_KEYWORD){
        //Banner Shop
        
        advertise.setAdShopDetail();
    }
    else if(postId == POST_GASTRO_SECTOR || postId == POST_GASTRO_KEYWORD){
        
        //werbung Gastro
       advertise.setAdGastroDetail();
    }
    else if(postId == POST_GASTRO_TIPPS){
        
        if(kategorieList == RESTAURANT){
            
            advertise.setAdGastroTippRestaurantDetail();
            
        }else{
            advertise.setAdGastroTippFruestueckDetail();
        }
    }
    
    
    
    printOnConsole("detailsXMLParser","Parser");
	
	xmlDoc = $.parseXML( xml );
	
	$(xmlDoc).find(XML_DETAIL_FIRMA).each(function()
	{
		var area = $(this).find(XML_DETAIL_GEBIET).text();
        nameDetail = $(this).find(XML_DETAIL_NAME).text();
        streetDetail = $(this).find(XML_DETAIL_STRASSE).text();  
        zipcodeDetail = $(this).find(XML_DETAIL_PLZ ).text();
        placeDetail = $(this).find(XML_DETAIL_ORT).text();
        var cityZone = $(this).find(XML_DETAIL_STADTGEBIET).text();
        var phone = $(this).find(XML_DETAIL_TELEFON).text();
        var fax = $(this).find(XML_DETAIL_FAX).text();
        var email = $(this).find(XML_DETAIL_EMAIL).text();
        var web = $(this).find(XML_DETAIL_WEB).text();
        var facebook = $(this).find(XML_DETAIL_FACEBOOK).text();
        var description = $(this).find(XML_DETAIL_BESCHREIBUNG).text();
        var businessHours = $(this).find(XML_DETAIL_OEFFUNGSZEITEN).text();
        var addition = $(this).find(XML_DETAIL_ZUSATZ).text();
        var image_1 = $(this).find(XML_DETAIL_IMAGE_1).text();
        var image_2 = $(this).find(XML_DETAIL_IMAGE_2).text();
        var image_3 = $(this).find(XML_DETAIL_IMAGE_3).text();
        var image_4 = $(this).find(XML_DETAIL_IMAGE_4).text();
        var pdfTitle = $(this).find(XML_DETAIL_PDF_TITLE).text();
        var pdf = $(this).find(XML_DETAIL_PDF).text();
        var trademark = $(this).find(XML_DETAIL_MARKEN).text();
                                          
        var video = $(this).find(XML_DETAIL_VIDEO).text();
        var videoTitle = $(this).find(XML_DETAIL_VIDEO_TITLE).text();

        
        var tipp_Headline = $(this).find(XML_INSIDER_LISTE_HEADLINE).text();
        var tipp_Detail = $(this).find(XML_INSIDER_LISTE_DETAIL).text();
        
        printOnConsole("detailsXMLParser","Parser1");
      
        //Titel und Beschreibung
        $("#detailText").html('<h1>'+ nameDetail +'</h1>'+ addition +'<br/>' + description);
        
        //if Gastro Bewertung
                                          
        if(tipp_Headline.length > 0 || tipp_Detail.length > 0){
            
            //Insider Tipps
            $("#detailsTipp").html('<img style="float: left;" src="bilder/insider/Tipp_left.png"  /><h1 style="color: red; font-size: 19px; padding-top: 10px;">Unser Insider Tipp</h1><div class="detailTitle" style="margin-top: 7px;">' + tipp_Headline + '</div><div class="detailText">' + tipp_Detail+ '</div>');
        
        }else{
            
            $("#detailsTipp").html('');
        }
        
            
        //Video
        if(video.length > 0){
            //var youtube = 'http://www.youtube.com/embed/yEMiChRhC_I';
            var youtube = 'http://www.youtube.com/embed/';
            
            $("#detailVideo").html('<div class="detailTitle videoTitle" >'+videoTitle+'</div><embed  src="' + youtube + video + '?version=3&loop=1&playlist=' + video +'" width="300" height="199"></embed><br/><br/>');
                                    
        }else{
            $("#detailVideo").html('');
        }
                                                                                    
        //Facebookbutton
        $("#detailFacebook").html('<a onClick="navi.showExternalPage(\'' + facebook + '\')"><img src="bilder/menu/detail/Button_facebook.png" /></a>');
      
        //Webbutton
        $("#detailWeb").html('<a onClick="navi.showExternalPage(\'' + web + '\')"><img src="bilder/menu/detail/Button_ShowMap.png" /></a>');
        
        //Emailbutton
        $("#detailEmail").html('<a href="mailto:' + email + '"><img src="bilder/menu/detail/Button_Mail.png" /></a>');
    	
        //Telefonbutton
        $("#detailPhone").html('<a href="tel:' + phone + '"><img src="bilder/menu/detail/Button_Call.png" /></a>');
        
        //PDF button
        if(pdf.length > 0) {
           $("#detailPdf").html('<div class="detailPDFTitle">'+pdfTitle+'</div><a onClick="navi.showExternalPage(\'' + pdf + '\')"><img src="bilder/menu/detail/Button_PDF.png" /></a><br/>');
        }
        else{
            $("#detailPdf").html('');
        }
        
        //�ffnungszeiten
        $("#detailBusinessHours").html('<h1>&Ouml;ffnungszeiten</h1>' + businessHours );
                             
        //Adresse
        $("#detailAddress").html('<h1>Anschrift</h1>' + nameDetail + '<br/>' + streetDetail + '<br/>' + zipcodeDetail + ' ' + placeDetail + '<br/>Stadtgebiet: '+ cityZone +'<br/>Telefon: ' + phone);
       
        
        var pictureDetail = '';
        if(image_1.length > 0){
            pictureDetail = pictureDetail + '<img class="sliderPictureDetails" src="'+ image_1 +'"/>';
                                         
        }
        
        if(image_2.length > 0){
            pictureDetail = pictureDetail + '<img class="sliderPictureDetails" src="'+ image_2 +'"/>';
                                         
        }
    
        if(image_3.length > 0){
            pictureDetail = pictureDetail + '<img class="sliderPictureDetails" src="'+ image_3 +'"/>';
                                         
        }
                                    
        if(image_4.length > 0){
            pictureDetail = pictureDetail + '<img class="sliderPictureDetails" src="'+ image_4 +'"/>';
                                        
        }
        printOnConsole("Bilder: ",pictureDetail);
  
                                          
        if(pictureDetail.length > 0){
            
            //Bilder anzeigen
            $("#detailPic").html(pictureDetail);
            //Formatierung der Bilder
            $("#detailPic").addClass("sliderDetail");
            
            $("#detailPicDots").addClass("pagingMyExample paging2");
            
        }
        else{
            //falls die Bilder einer anderen Detailansicht noch da sind
            $("#detailPic").html('');
            $("#detailPic").removeClass("sliderDetail");
            
            //keine Punkte mehr anzeigen
            $("#detailPicDots").removeClass("pagingMyExample paging2");
            //das der Titel angezeigt wird
            $("#testText").css("margin-top","40px");
        }
                                          
        printOnConsole("detailsXMLParser","Parser323"); 
        
	});
	
     ui.hideLoadingScreen();
   
    printOnConsole("detailsXMLParser","Parser3");
	$.mobile.changePage("#detailPage");
	
}

//da alle Versuche die NaviBar dynamisch zu erzeugen fehlgeschlagen sind wurde diese Hillfsfunktion eingef�hrt um die Karte mit den Adressdaten aufzurufen
function detailMapXML(){
    
    //Funktion aus Map.js
    //anzeige der Position auf einer Karte
     if(postId == POST_LISTE_SECTOR || postId == POST_LISTE_KEYWORD){
         showPosOnMap(placeDetail,streetDetail,zipcodeDetail, nameDetail + '<br/>' + streetDetail + '<br/>' + zipcodeDetail + ' ' + placeDetail + '<br/>','shop');
     }else{
         showPosOnMap(placeDetail,streetDetail,zipcodeDetail, nameDetail + '<br/>' + streetDetail + '<br/>' + zipcodeDetail + ' ' + placeDetail + '<br/>','gastro');
     }
}

//Parser Suchconfiga
function searchConfigXMLParser(xml){
    
	xmlDoc = $.parseXML(xml);
	
	$(xmlDoc).find(XML_SC_BRANCHEN).each(function()
    {
		
		//Version
        //Speichern der Versionsnummer im lokalen Speicher
        setVersionBranche($(this).attr(XML_SC_ATTRIBUTE_VERSION));
		
		var shop = $(this).children(XML_SC_SHOPS);
	  	var gastro = $(this).children(XML_SC_GASTRO);
        
        printOnConsole("configXMLParser",shop.length);
        
        if(shop.length > 0){
                                         
                printOnConsole("configXMLParser","Parser");
                //L�scht den Inhalt der Tabellen Shop
                deleteShopContent();
                                         
               
                //Shop
                shop.find(XML_SC_BRANCHE).each(function()
                {
                
                                       
                    var shopHK = $(this).children(XML_SC_NAME).text();
			  	    var kategorien = $(this).children(XML_SC_KATEGORIEN);
			    	    		
			  	    //Hauptkategorie - Insert
			  	    populateTableShopHK(shopHK);
			    	    		
			  	    kategorien.find(XML_SC_KATEGORIE).each(function()
			        {
                        $(this).find(XML_SC_NAME).each(function(){
			    	  			
                            //Unterkategorie - Insert
                            populateTableShopUK(shopHK,$(this).text());
			  		     });

                     });

                  });
                                         
        }
                                         
        if(gastro.length > 0){
            
            //L�scht den Inhalt der Tabellen gastro
            deleteGastroContent();
                                        
            //Gastro
            gastro.find(XML_SC_BRANCHE).each(function()
		    {

                var gastroHK = $(this).children(XML_SC_NAME).text();
                var kategorien = $(this).children(XML_SC_KATEGORIEN);
			    		
                //Hauptkategorie - Insert
                populateTableGastroHK(gastroHK);
			    		
                kategorien.find(XML_SC_KATEGORIE).each(function()
                {
                    $(this).find(XML_SC_NAME).each(function(){
			    	
                        //Unterkategorie - Insert
                        populateTableGastroUK(gastroHK,$(this).text());
                    });

                 });
			    	
            });
        }
	
                                         
    });
    
    ui.hideLoadingScreen();
    
}

/************************ INSIDER ********************/
function insiderShopList(){
    
    showInsiderListPage = true;
    
    printOnConsole("POSTXML","POST_GASTRO_KEYWORD");
    
    positionList = 0;
    
    //Kopf Shop -> f�r die Unterscheidung im Parser listeXMLInsider
    postId = POST_LISTE_SECTOR;
    
    printOnConsole("POSTXML","POST_GASTRO_KEYWORD");
    postXML(XML_URL_INSIDER_SHOP, false, POST_INSIDER_SHOP_LISTE, '', '', positionList,'');

}

function insiderGastroList(){
    
    positionList = 0;
    
    //Kopf Gastro -> f�r die Unterscheidung im Parser listeXMLInsider
    postId = POST_GASTRO_SECTOR;
    
    printOnConsole("insiderGastroList","insiderGastroList");
    
    postXML(XML_URL_INSIDER_SHOP, false, POST_INSIDER_GASTRO_LISTE, '', '', positionList,'');
}

function listeXMLInsider(xml){
    
   
    adressArray = [];
    
    //Insider
    var tipp = '';
       
	xmlDoc = $.parseXML(xml);
    
    
	$(xmlDoc).find(XML_LISTE_FIRMEN).each(function()
    {
                                           
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
                                          
        if(count > 0){
                                          
            printOnConsole("listeXMLInsider","Count: " + count);
                                          
            positionList = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_POSITION));
                                          
            printOnConsole("listeXMLInsider","positionList "+positionList);
                                          
            var listItem = '';
                                          
            $(this).find(XML_LISTE_FIRMA).each(function()
            {
                //Firmen Liste
                var id = $(this).find(XML_LISTE_IDX).text();
                var name = $(this).find(XML_LISTE_NAME).text();
                var street = $(this).find(XML_LISTE_STRASSE).text();
                var town = $(this).find(XML_LISTE_ORT).text();
                var picture = $(this).find(XML_LISTE_LOGO).text();
                var lat = $(this).find(XML_LISTE_LAT).text();
                var long = $(this).find(XML_LISTE_LONG).text();
                                               
                printOnConsole("listeXMLInsider","Tipp: "+tipp);
                                                                             
                //Insider liste
                tipp = $(this).find(XML_INSIDER_LISTE_HEADLINE).text();
                                                                             
                printOnConsole("listeXMLInsider","Tipp: "+tipp);
                                                                             
                                                                             
                //Daten f�r die Karte
                var marker_buffer = new Object();
                    
                //kein Bildvorhanden
                if(picture.length == 0){
                                               
                    marker_buffer['click'] = false;
                    marker_buffer['id'] = '';
                    //ohne bild
                    listItem = listItem + '<li data-icon="false"><a href=""><img /><div>';
                                                                             
                }
                else{
                                                                             
                    marker_buffer['click'] = true;
                    marker_buffer['id'] = id;
                                                                             
                   
                    //markierung insider 
                    listItem = listItem + '<li class="listInsiderImage" ><a onClick="searchDetail(\'' + id + '\')"><div class="listPic"><img src="' + picture + '" /></div><div class="listWithPic">';
                }
                                                                             
                                           
                marker_buffer['lat'] = lat;
                marker_buffer['long'] = long;
                            
                printOnConsole("listeXMLInsider" , "lat und long " + lat + ' '+ long);
                
                                               
               
                listItem = listItem + '<h3 class="listTitle">' + name + '</h3><div class="listText">' + street + '</div><div class="listText" style="color: red">Insider-Tipp:</div>';
                                               
                if(tipp.length > 0){
                                               
                    listItem = listItem +  '<div class="listText" style="white-space:normal;">' + tipp + '</div>';
                }
                
                listItem = listItem + '</div></a></li>';
                                            
                //Speichern der Daten f�r die anzeige der Daten auf der Karte
                adressArray.push(marker_buffer);
                                                                             
            });
                                          
            printOnConsole("listeXMLInsider","listItem"+listItem);
            $("#listShopInsider").html(listItem);
            
           /* if( postId == POST_GASTRO_SECTOR){
                                          
                $("#listGastroInsider").html(listItem);
                refreshList('#listGastroInsider');
                                          
                                        
            }else{
                                          
                printOnConsole("if","listItem"+listItem);                            
                $("#listShopInsider").html(listItem);
                refreshList('#listShopInsider');
                
            }*/
            
            /*
            //Navigation
            var naviButton = '';
                                          
            printOnConsole("listeXMLInsider","positionList : "+positionList);
                                          
            //Zur�ck Button
            if(positionList > 0){
                                          
                $("#leftNavi").html('<a onClick="prevInsiderList()" data-role="button" class="leftButton" data-inline="true">Zur&uuml;ck</a>');
            }else{
                $("#leftNavi").html('');
            }
                                          
            //Weiter Button
            var tmp = positionList + ITEM_COUNT;
                                          
            if(tmp < count){
                                          
                $("#rightNavi").html('<a onClick="nextInsiderList()" class="rightButton" data-role="button" data-inline="true">Weiter</a>');
            }
            else{
                $("#rightNavi").html('');
            }
                                          
            $("#listNavi").trigger("create");
            */
            
            $.mobile.silentScroll(0);
            printOnConsole("listeXMLInsider","listItem1");                              
                                          
            ui.hideLoadingScreen();
            printOnConsole("listeXMLInsider","listItem2");
            
                                          
           // if(showInsiderListPage){
                                         
               // showInsiderListPage = false;
                //wechsel auf die Ergebnisseite
                $.mobile.changePage("#insiderListPage"); 
            //}else{
                
          //      refreshList('#listShopInsider'); //index.html
            //}
                                         
    
                                          
        }else{
                                          
            ui.hideLoadingScreen();
            ui.showDialog("Keine Tipps","Zurzeit sind leider keine Tipps vorhanden, versuchen Sie es spaeter noch einmal.",false);
        }
    });
    
    
}

function insiderDetail(id){

    getXML(XML_URL_INSIDER_DETAIL + "?idx="+id, false, detailsXMLParser);
    
}
           
function nextInsiderList(){
           
   
}           

function prevInsiderList(){
           
           
}

/************************ EVENTS *********************/
//XML mit den Events von Heute
function eventsList(){
    
    showEventsListPage = true;
    positionList = 0;
    categorieEvents = '';
    
    var all = false;

    if($('#checkboxAlle').prop('checked') == true)
    {
        
        categorieEvents = createCategorie(categorieEvents,"");
    }

    if($('#checkboxKultur').prop('checked') == true)
    {
        
        categorieEvents = createCategorie(categorieEvents,"Kultur");
    }
    
    if($("#checkboxFesteMaerkte").prop('checked') == true)
    {   
        categorieEvents = createCategorie(categorieEvents,"Feste & Maerkte");
    }
    
    if($("#checkboxParty").prop('checked') == true)
    {
        categorieEvents = createCategorie(categorieEvents,"Party");
    }
    
    if($("#checkboxBildung").prop('checked') == true)
    {
       categorieEvents = createCategorie(categorieEvents,"Bildung & Wissenschaft");
    }
    
    if($("#checkboxMesse").prop('checked') == true)
    {
        categorieEvents = createCategorie(categorieEvents,"Kongresse & Messen");
    }
    
    if($("#checkboxGesundheit").prop('checked') == true)
    {
         categorieEvents = createCategorie(categorieEvents,"Gesundheit");
    }
    
    if($("#checkboxSonstiges").prop('checked') == true)
    {
        categorieEvents = createCategorie(categorieEvents,"Sonstiges");
    }
    
    printOnConsole("eventsList","categeorieEvents: "+categorieEvents);
   
    postEventsCategorie(XML_URL_EVENTS,false,positionList,categorieEvents);

}

function createCategorie(cat,name){
    
    if(cat.length == 0 ){
        
        return name;
    }
    else{
        return cat + '_' + name;
    }
}

//DetailXMl eines Events
function eventsDetails(id,terminId){
    //printOnConsole("eventsDetails", XML_URL_EVENTS_DETAILS + id + XML_URL_EVENTS_TERMIN_ID + terminId);
    detectAndroidVersion(XML_URL_EVENTS_DETAILS + id + XML_URL_EVENTS_TERMIN_ID + terminId, GET_EVENTS_DETAILS);
}

function nextEventsList(){
    
    positionList = positionList + ITEM_COUNT;
    
    printOnConsole("nextEventsList","Pos: "+positionList);
	
	postEventsCategorie(XML_URL_EVENTS,false,positionList,categorieEvents);
}

function prevEventsList(){
    
    positionList = positionList - ITEM_COUNT;
    
    postEventsCategorie(XML_URL_EVENTS,false,positionList,categorieEvents);

}

//Parser f�r die Eventsliste
function listeXMLEvents(xml){
    
    
    printOnConsole("isteXMLEvents","isteXMLEvents1");
    
	xmlDoc = $.parseXML(xml);
    
    
	$(xmlDoc).find(XML_EVENTS_VERANSTALTUNGEN).each(function()
    {
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
                                                    
        if(count > 0){
                                          
                printOnConsole("listeXMLEvents","Count: "+count);
                                          
                positionList = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_POSITION));
                            
                printOnConsole("listeXMLEvents","positionList "+positionList);
                                          
                var listItem = '';
                                          
                $(this).find(XML_EVENTS_VERANSTALTUNG).each(function()
                {
                                                    
                    var name = $(this).find(XML_EVENTS_NAME).text();
                    var id = $(this).children(XML_EVENTS_ID).text();
                    var town = $(this).find(XML_EVENTS_STADT).text();
                    var picture = $(this).find(XML_EVENTS_BILD).text();
                    var place = $(this).find(XML_EVENTS_ORT).text();
                            
                    printOnConsole("listeXMLEvents","positionList "+id);
                                                    
                                       
                                                            
                    var time = '';
                    var terminID = '';
                                                            
                    $(this).find(XML_EVENTS_TERMIN).each(function(){
                        
                        terminID = $(this).find(XML_EVENTS_TERMIN_ID).text();
                                                         
                        var startDate = $(this).find(XML_EVENTS_START_DATE).text();
                        var endDate = $(this).find(XML_EVENTS_END_DATE).text();
                        var startTime = $(this).find(XML_EVENTS_START_TIME).text();
                        var endTime = $(this).find(XML_EVENTS_END_TIME).text();
                                                         
                        if(startDate == endDate){
                                                         
                            var startDateArray = startDate.split('-');
                            var startArray = startTime.split(':');
                            if(endTime == '00:00:00'){
                                                         
                                time = startDateArray[2] + "." + startDateArray[1] + "." + startDateArray[0] + " , " + startArray[0] + ":" + startArray[1];
                                                                                                 
                            }else{
                                var endArray = endTime.split(':');
                                                         
                                time = startDateArray[2] + "." + startDateArray[1] + "." + startDateArray[0] + " , " + startArray[0] + ":" + startArray[1] + ' - '  + endArray[0] + ":" + endArray[1]
                                                                                                 
                            }
                                                         
                        }else{
                            var startDateArray = startDate.split('-');
                            var endDateArray = endDate.split('-');
                            time = "" +  startDateArray[2] + "." + startDateArray[1] + "." + startDateArray[0] + " - " + endDateArray[2] + "." + endDateArray[1] + "." + endDateArray[0];
                        }
                                                         
                     });
                                                            
                    if(picture.length == 0){
                       listItem = listItem + '<li data-icon="false"><a href=""><img /><div>';
                    }
                    else{
                        listItem = listItem + '<li><a onClick="eventsDetails(\''+ id +'\',\''+ terminID +'\')"><div class="listPic"><img src="'+PIC_URL+picture+'" /></div><div class="listWithPic">';
                    }
                                        
                                                        
                    printOnConsole("listeXMLEvents","positionList "+time);
                                                            
                    listItem = listItem + '<div class="listDate">'+time+'</div><h3 class="listTitle">' + name + '</h3><div class="listText">Wo: ' + place + '</div><div class="listText">Stadt: '+ town +'</div></div></a></li>';
                                                    
                                                                                         
                });
                 
                printOnConsole("listeXMLEvents","listItem : "+listItem);
        
                $("#eventsSearch").html(listItem);
                                          
                //Navigation
                var naviButton = '';
                                          
                //Zur�ck Button
                if(positionList > 0){
                    $("#eventsLeftNavi").html('<a onClick="prevEventsList()" data-role="button" class="prevButton" data-inline="true">Zur&uuml;ck</a>');
                }else{
                    $("#eventsLeftNavi").html('');
                }
                                          
                //Weiter Button
                var tmp = positionList + ITEM_COUNT;
                                          
                if(tmp < count){
                    $("#eventsRightNavi").html('<a onClick="nextEventsList()" class="nextButton" data-role="button" data-inline="true">Weiter</a>');
                }
                else{
                    $("#eventsRightNavi").html('');
                }
                                        
                                        
                $("#eventsListNavi").trigger("create");
                $.mobile.silentScroll(0);
                                                    
                                                    
                                                    
                                
        ui.hideLoadingScreen();
        
        if(showEventsListPage){
            showEventsListPage = false;
            //wechsel auf die Ergebnisseite
            $.mobile.changePage("#eventsListPage");
        }else{
            refreshList('#eventsSearch');
        }
        
    
    }else{
        ui.hideLoadingScreen();
    
        ui.showDialog("Keine Treffer","Fuer Ihre Auswahl sind keine Veranstaltungen vorhanden.",false);
    }
                                                 
   });
}

//Parser f�r die Detailansicht
function detailsXMLEvents(xml){

	xmlDoc = $.parseXML( xml );
    
    printOnConsole("ddetailsXMLEvents","Parser1");        
	
	$(xmlDoc).find('veranstaltung').each(function()
    {
        printOnConsole("ddetailsXMLEvents","Parser2");
        var maindata = '';
        var time = '';
        var organizer = '';
        var eventPlace = '';
                                          
        $(this).find(XML_EVENTS_DETAIL_MAINDATA).each(function(){
                                           
            var name = $(this).find(XML_EVENTS_DETAIL_NAME).text();
            var town = $(this).find(XML_EVENTS_STADT).text();
            var desc = $(this).find(XML_EVENTS_DETAIL_BES).text();
            var pic =  $(this).find(XML_EVENTS_DETAIL_BILD).text();
            var link = $(this).find(XML_EVENTS_DETAIL_LINK).text();
                                                      
            maindata = '<div class="zentriert"><img class="detailPic" src="' + PIC_URL_GROSS + pic + '"/></div><p>'+ name +'</p><p>'+ desc +'</p><p> Wo: '+ town + '</p><p id="externerLink" class="detailLinkOptik">' + link + '</p>';
            
             
        });
        
        $(this).find(XML_EVENTS_DETAIL_TERMIN).each(function(){
                                                    
            var startDate = $(this).find(XML_EVENTS_START_DATE).text();
            var endDate = $(this).find(XML_EVENTS_END_DATE).text();
            var startTime = $(this).find(XML_EVENTS_START_TIME).text();
            var endTime = $(this).find(XML_EVENTS_END_TIME).text();
                                                                                     
            time = "<h1>Zeiten</h1>";
                                                    
            if(startDate == endDate){
                var startArray = startDate.split('-');
                //2012-12-17
                time = time + "Die Veranstaltung findet am " + startArray[2] + "." + startArray[1] + "." + startArray[0] + " statt.<br/>";
            }else{
                var startArray = startDate.split('-');
                var endArray = endDate.split('-');
                time = time + "Die Veranstalltung geht vom " +  startArray[2] + "." + startArray[1] + "." + startArray[0] + " bis zum " + endArray[2] + "." + endArray[1] + "." + endArray[0] + ".<br/>";
            }
            
            if(startTime == '00:00:00'){
                                                                                     
            }else{
                                                    
                if(endTime == '00:00:00'){
                    var startArray = startTime.split(':');
                    time = time + "Sie beginnt um " + startArray[0] + ":" + startArray[1] + " Uhr.";
                }
                else{
                    var startArray = startTime.split(':');
                    var endArray = endTime.split(':');
                    time = time + "Sie geht von " + startArray[0] + ":" + startArray[1] + " Uhr bis "+ endArray[0] + ":" + endArray[1] + " Uhr.";
                }
            }
                                                                                     
                                                                                     
         });
                                         
                                         
        printOnConsole("ddetailsXMLEvents","Parser3");                                 
        $(this).find(XML_EVENTS_DETAIL_VERANSTALTUNGSORT).each(function(){
                                                               
            var name = $(this).find(XML_EVENTS_DETAIL_NAME).text();
            var street = $(this).find(XML_EVENTS_DETAIL_STRASSE).text();
            var place = $(this).find(XML_EVENTS_DETAIL_ORT).text();
            var zipcode = $(this).find(XML_EVENTS_DETAIL_PLZ).text();
            var phone = $(this).find(XML_EVENTS_DETAIL_TEl).text();
            var fax = $(this).find(XML_EVENTS_DETAIL_FAX).text();
            var desc = $(this).find(XML_EVENTS_DETAIL_BES).text();
            var stop = $(this).find(XML_EVENTS_DETAIL_STOP).text();
                                                               
            eventPlace = '<h1>Veranstaltungsort</h1>' + name + '<br/>' + street + '<br/>' + zipcode + ' ' + place + '<br/>Tele: '+phone + '<br/>Fax: '+fax + '<br/>'+ desc+ '<br/>Haltestelle: '+stop;
                        
        });
                                          
          printOnConsole("ddetailsXMLEvents","Parser4");                                 
        $(this).find(XML_EVENTS_DETAIL_VERANSTALTER).each(function(){
            
            var name = $(this).find(XML_EVENTS_DETAIL_NAME).text();
            var street = $(this).find(XML_EVENTS_DETAIL_STRASSE).text();
            var place = $(this).find(XML_EVENTS_DETAIL_ORT).text();
            var zipcode = $(this).find(XML_EVENTS_DETAIL_PLZ).text();
            var phone = $(this).find(XML_EVENTS_DETAIL_TEl).text();
            var email = $(this).find(XML_EVENTS_DETAIL_EMAIL).text();
            
            organizer = '<h1>Veranstalter</h1>' + name + '<br/>' + street + '<br/>' + zipcode + ' ' + place + '<br/>Tele: '+phone + '<br/>E-Mail: ' + email;
        });
        
        
        printOnConsole("detailsXMLParser","Parser1");
        $("#eventDetailText").html(maindata);
        $("#eventDetailTermin").html(time);
        $("#eventDetailVeranstaltungsort").html(eventPlace);  
        $("#eventDetailVeranstalter").html(organizer);
                                 
                                                 
                                          
        printOnConsole("detailsXMLParser","Parser3");
                                          
    });
                       
	
    ui.hideLoadingScreen();
    
	//wechsel auf die Ergebnisseite
	$.mobile.changePage("#eventsDetailPage");

    
    
}

/******************** Parken *************************/

/******************** Apple Watch Blitzer *************************/
//function provideBlitzerListeForAppleWatch()
//{
//    $.ajax({
//           type: "GET",
//           url: XML_URL_RADAR,
//           dataType: "html",
//           success: function(data)
//           {
//               $(xmlDoc).find(XML_RADAR_BLITZERLISTE).each(function()
//               {
//                   $(this).find(XML_RADAR_BLITZER).each(function()
//                   {
//                        var car = $(this).find(XML_RADAR_BLITZER_FAHRZEUG).text();
//                        var street = $(this).children(XML_RADAR_BLITZER_STRASSE).text();
//                        var place = $(this).find(XML_RADAR_BLITZER_ORT).text();
//                        var district = $(this).find(XML_RADAR_BLITZER_STADTTEIL).text();
//                        var position = $(this).find(XML_RADAR_BLITZER_POSITION).text();
//                        var direction = $(this).find(XML_RADAR_BLITZER_RICHTUNG).text();
//                        var report = $(this).find(XML_RADAR_BLITZER_REPORT).text();
//                        var update = $(this).find(XML_RADAR_BLITZER_UPADATE).text();
//                   });
//               });
//           },
//           error: function()
//           {
//               ui.hideLoadingScreen();
//               ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
//           }
//    });
//}

/********************* Blitzer ***********************/
//function showBlitzerListe()
//{
////    if(showRadarListPage)
////    {
////        showRadarListPage = false;
//        // wechsel auf die Ergebnisseite
//        blitzerListe();
//        $.mobile.changePage("#radarListPage");
////    }
////    else
////    {
//    
////    }
//}

function blitzerListe()
{
    showRadarListPage = true;
    detectAndroidVersion(XML_URL_RADAR,GET_RADAR_LISTE);
}

//Array zum Übertragen der Blitzer an die Watch

function blitzerListeParser(xml)
{
    
    printOnConsole("isteXMLEvents","isteXMLEvents1");
    
	xmlDoc = $.parseXML(xml);
    
	$(xmlDoc).find(XML_RADAR_BLITZERLISTE).each(function()
    {
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
              
        if(count > 0)
        {
            printOnConsole("blitzerListeParser","Count: "+count);
                                                
//            positionList = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_POSITION)); // fehler in dieser zeile
                                            
            printOnConsole("blitzerListeParser","positionList "+positionList);
                                                
            var listItem = '';

            $(this).find(XML_RADAR_BLITZER).each(function()
            {
                var car = $(this).find(XML_RADAR_BLITZER_FAHRZEUG).text();
                var street = $(this).children(XML_RADAR_BLITZER_STRASSE).text();
                var place = $(this).find(XML_RADAR_BLITZER_ORT).text();
                var district = $(this).find(XML_RADAR_BLITZER_STADTTEIL).text();
                var position = $(this).find(XML_RADAR_BLITZER_POSITION).text();
                var direction = $(this).find(XML_RADAR_BLITZER_RICHTUNG).text();
                var report = $(this).find(XML_RADAR_BLITZER_REPORT).text();
                var update = $(this).find(XML_RADAR_BLITZER_UPADATE).text();
                  
                listItem = listItem + '<li class="noMarginNoPadding" data-icon="false">';
                                                
                                            
                var test = '<table style="width: 100%;"><tr><td align="left">';
                if(car.length > 0){
                                                 
                    test = test+ '<h3 class="listTitle">Mobiler Blitzer: '+ car +'</h3>';
                }
                test = test + '</td><td align="right">';
                
                if(update.length > 0){
                    test = test+ '<div class="listDate" >'+ update +'</div>';
                }
                
                listItem = listItem + test + '</td></tr></table>';
                                                 
                var tmp = '';
                if(place.length > 0){
                                                 
                    tmp = tmp + place + ', ';
                }
                 
                if(district.length > 0){
                                                 
                    tmp = tmp + district +', ';
                }
                                                 
                if(street.length > 0){
                                                 
                    tmp = tmp + street + ', ';
                }
                                                 
                if(position.length > 0){
                                                 
                    tmp  = tmp  + position;
                }
                
                    listItem = listItem +'<div class="listText">Standort: --> ' + tmp;
                
                var tmp2 = '';
                if(direction.length > 0){
                                                 
                    tmp2  = tmp2  + ' - Richtung: '+ direction;
                }
                listItem = listItem  + tmp2 + '</div>';
                                                 
                var tmp3 = '';
                if(report.length > 0){
                    tmp3 = tmp3 + 'Gemeldet von: '+ report;
                }
                listItem = listItem + '<div class="listText">' + tmp3 + '</div>';
               
                                                                               
                listItem = listItem + '</li>';
                                                                                            
                                                                                            
            });
                                                
            printOnConsole("listeXMLEvents","listItem : "+listItem);
                                                
            $("#radarSearch").html(listItem);
                                                
            $.mobile.silentScroll(0);
                                                
            ui.hideLoadingScreen();
                                                
            if(showRadarListPage) {
           
                showRadarListPage = false;
                //wechsel auf die Ergebnisseite
                $.mobile.changePage("#radarListPage");
            }else{
                refreshList('#radarSearch');
            }
        }
        else{
                                                
            ui.hideLoadingScreen();
                                                
            var emptyArray = [];
//            applewatch.sendMessage(JSON.stringify(emptyArray), "requestedList")
                                                
//            ui.showDialog("Kein Blitzer","Zurzeit sind keine Blitzermeldungen vorhanden. Wir wuenschen gute Fahrt.", false);
            $("#radarSearch").html("<li style=\"color: red; margin: 10px 0px;\">Zurzeit sind keine Blitzermeldungen vorhanden. Wir wünschen gute Fahrt.</li>");
            if(showRadarListPage) {
                showRadarListPage = false;
                //wechsel auf die Ergebnisseite
                $.mobile.changePage("#radarListPage");
            }else{
                refreshList('#radarSearch');
            }
                                                
        }
    });
}

/********************* News **************************/
function newsList(){

    printOnConsole("newsList","newsList");
    showSpecialListPage = true;
    
    //Auslesen der Versionsnummer aus dem lokalen Speicher
	detectAndroidVersion(XML_URL_NEWS, GET_NEWS_LISTE);
    
}

function prevNewsList(){
    
    newsPositionList = newsPositionList - NEWS_COUNT;
    
    detectAndroidVersion(XML_URL_NEWS + '?position=' + newsPositionList, GET_NEWS_LISTE);
}

function nextNewsList(){

    newsPositionList = newsPositionList + NEWS_COUNT;
    
    detectAndroidVersion(XML_URL_NEWS +'?position=' + newsPositionList, GET_NEWS_LISTE);
}

function newsListParser(xml){
    
    printOnConsole("newsListParser","newsListParser");
    
	xmlDoc = $.parseXML(xml);
    
	$(xmlDoc).find(XML_NEWS_NEWSLISTE).each(function()
    {
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
        
        if(count > 0){
                                            
            printOnConsole("newsListParser","Count: "+count);
                                                    
            newsPositionList = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_POSITION));
                                                    
            printOnConsole("newsListParser","positionList " + newsPositionList);
                                                    
            var listItem = '';
                                                    
            $(this).find(XML_NEWS_NEWS).each(function()
            {
            
                var id = $(this).find(XML_NEWS_ID).text();
                var townNews = $(this).find(XML_NEWS_ORT).text();
                var titleNews = $(this).find(XML_NEWS_TITEL).text();
                var subTitleNews = $(this).find(XML_NEWS_SUBTITEL).text();
                var breakingNews = $(this).find(XML_NEWS_EILMELDUNG).text();
                var dateNews = $(this).find(XML_NEWS_DATUM).text();
                var timeNews = $(this).find(XML_NEWS_UHRZEIT).text();
        
                printOnConsole("newsListParser","id "+id);
                
                                         
                /*listItem = listItem + '<li class="noMarginNoPadding" data-icon="false"><a onClick="newsDetails(\'' + id + '\')">' +
                        '<table style="width: 100%;"><tr>'+
                        '<td align="left"><div class="specialListTitle" >'+ titleNews +'</div></td>'+
                        '<td align="right"><div class="specialListTime" >'+ dateNews +'</div></td></tr></table>'+
                        '<div class="specialListSubTitle">' + subTitleNews + '</div>'+
                        '<div class="specialListText">' + townNews + '</div></a></li>'*/
                
                //printOnConsole("newsListParser","breakingNews: " + titleNews.replace(/\"/g,"/\""));
                if(breakingNews === 'Y'){
                                         
                  
                                         
                    listItem = listItem + '<li class="noMarginNoPadding"><a onClick="newsDetails(\'' + id + '\',\'' + titleNews.replace(/\"/g,"") + '\',\'' + subTitleNews.replace(/\"/g,"") + '\',\''+ dateNews + '\',\'' + townNews + '\' )">' +
                                         '<div class="listSpecialTitle">*** Eilmeldung ***</div>'+
                                         '<h3 class="listTitle" >'+ titleNews + '</h3>'+
                                         '<div class="listSubTitle">' + subTitleNews + '</div>'+
                                         '<div class="listText">'+timeNews + ' ' + dateNews + ' ' + townNews + '</div></a></li>';
                }
                else{
                    
                    listItem = listItem + '<li ><a onClick="newsDetails(\'' + id + '\',\''+titleNews.replace(/\"/g,"") +'\',\''+ subTitleNews.replace(/\"/g,"") + '\',\''+ dateNews + '\',\'' + townNews + '\' )">' +
                                      '<h3  class="listTitle" >'+ titleNews +'</h3>'+
                                      '<div class="listSubTitle">' + subTitleNews + '</div>'+
                                      '<div class="listText">'+ dateNews + ' ' + townNews + '</div></a></li>';
                    }
            });
                                                    
            printOnConsole("listeXMLEvents","listItem : "+listItem);
                                            
            $("#specialList").html(listItem);
                                            
            //Navigation
            var naviButton = '';
                                                    
            //Zur�ck Button
            if(newsPositionList > 0){
                                                    
                $("#specialLeftNavi").html('<a onClick="prevNewsList()" data-role="button" class="prevButton" data-inline="true">Zur&uuml;ck</a>');
            }else{
                $("#specialLeftNavi").html('');
            }
                                                    
            //Weiter Button
            var tmp = newsPositionList + NEWS_COUNT;
                                                    
            if(tmp < count){
                                            
                $("#specialRightNavi").html('<a onClick="nextNewsList()" class="nextButton" data-role="button" data-inline="true">Weiter</a>');
            }
            else{
                $("#specialRightNavi").html('');
            }
                                            
                                            
            $("#specialListNavi").trigger("create");
            $.mobile.silentScroll(0);
                                            
            ui.hideLoadingScreen();
            
           
            if(showSpecialListPage){
                showSpecialListPage = false;
                //wechsel auf die Ergebnisseite
                $.mobile.changePage("#specialListPage");
            }else{
                refreshList('#specialList');                                                                                                                        
            }
        }else{
        
            ui.hideLoadingScreen();
                                            
            ui.showDialog("Keine News","Zurzeit sind keine News-Meldungen vorhanden.",false);
        }
                                            
                                                    
    });

}

//da die Daten aus der Liste auch in der Detailsansicht dargestellt werden sollen werden sie in globalen Variablen gespeichert damit m�ssen sie nicht nocht einmal �bertragen werden
var newsDetailsTitle = '';
var newsDetailsSubTitle = '';
var newsDetailsDate = '';
var newsDetailsTown = '';

function newsDetails(id, title, subtitle, date, town){

    newsDetailsTitle = title;
    newsDetailsSubTitle = subtitle;
    newsDetailsDate = date;
    newsDetailsTown = town;
    
    printOnConsole("newsDetails","newsDetails " +title );
    
    //Auslesen der Versionsnummer aus dem lokalen Speicher
	detectAndroidVersion(XML_URL_NEWS_DETAIL + '?id=' + id, GET_NEWS_DETAILS);
    
}

function newsDetailsParser(xml){

    printOnConsole("newsDEtailsParser","newsDEtailsParser");
    
	xmlDoc = $.parseXML(xml);
    
	$(xmlDoc).find(XML_NEWS_NEWSLISTE).each(function()
    {
                                                                                      
        var item = '<div class="detailTitle">'+ newsDetailsTitle +'</div><div class="detailSubTitle">' + newsDetailsSubTitle + '</div><div class="detailDate">' +  newsDetailsDate + ' ' + newsDetailsTown + '</div>';
        
        printOnConsole("newsDetailsParser","Item: "+item);
                                            
        $(this).find(XML_NEWS_NEWS).each(function()
        {
                                                                            
           var article = $(this).find(XML_NEWS_ARTIKEL).text();
                    
                                                                             
           item = item + '<div class="detailText">' + article +'</div>';
                                            
                                         
        });
                                            
        printOnConsole("newsDetailsParser","Item: "+item);                                   
        
        $("#newsDetailText").html(item);
                                            
     });
	
    ui.hideLoadingScreen();
    
	//wechsel auf die Ergebnisseite
	$.mobile.changePage("#specialDetailPage");
                                             
}
                                             
/****************** VERKEHR  ******************/
function trafficList(){
                                            
    showTrafficListPage = true;
    detectAndroidVersion(XML_URL_TRAFFIC,GET_TRAFFIC_LIST);                                         
                                        
}
                                             
function trafficListParser(xml){
                                             
    printOnConsole("trafficListParser","trafficListParser1");
                                             
    xmlDoc = $.parseXML(xml);
                                             
    $(xmlDoc).find(XML_TRAFFIC_VERKEHR_LISTE).each(function()
    {
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
                                                                                            
        if(count > 0)
        {
            printOnConsole("trafficListParser","Count: "+count);
                                                                                            
            var listItem = '';
                                                                                            
            $(this).find(XML_TRAFFIC_VERKEHR).each(function()
            {
                var street = $(this).find(XML_TRAFFIC_VERKEHR_STRASSE).text();
                var direction = $(this).find(XML_TRAFFIC_VERKEHR_RICHTUNG).text();
                var report = $(this).find(XML_TRAFFIC_VERKEHR_MELDUNG).text();
                var reportBy = $(this).find(XML_TRAFFIC_VERKEHR_GEMELDET).text();
                var update = $(this).find(XML_TRAFFIC_VERKEHR_UPDATED).text();
                                                                                                                                   
                listItem = listItem + '<li class="noMarginNoPadding" data-icon="false"><table style="width: 100%;"><tr><td align="left"><h3 class="listTitle" >' + street + '</h3></td><td align="right">';
                                                                                                                                   
                if(update.length > 0){
                    listItem = listItem+ '<div class="listDate" >'+ update +'</div>';
                }
                                                                                                                                   
                listItem = listItem + '</td></tr></table>';
                                                                                                                                   
                if(direction.length > 0){
                    listItem = listItem +'<div class="listText">' + direction + '</div>';
                }
                                                                                                                                   
                                                                                                                                   
                if(report.length > 0){
                    listItem = listItem + '<div class="listText">' + report + '</div>';
                }
                                                                                                                                   
                                                                                                                                   
                if(reportBy.length > 0){
                    listItem = listItem + '<div class="listText">Gemeldet von: '+ reportBy + '</div>';
                }
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
                listItem = listItem + '</li>';
                                                                                                                                   
                                                                                                                                   
            });
                                                                                            
            printOnConsole("trafficListParser","listItem : "+listItem);
                                                                                            
            $("#trafficSearch").html(listItem);
                                                                                            
            $.mobile.silentScroll(0);
                                                                                            
            ui.hideLoadingScreen();
            
            if(showTrafficListPage){
                showTrafficListPage = false;
                //wechsel auf die Ergebnisseite
                $.mobile.changePage("#trafficListPage");
            }else{
                refreshList('#trafficSearch');
            }
            
                                                                                            
        }
        else{
                                                                                            
            ui.showDialog("Kein Stau","Zurzeit sind keine Staumeldungen vorhanden. Wir wunschen gute Fahrt.",false);
                                                                                            
        }
    });                                           
                                             
                                             
}
                                             

/********************* WETTER ************************/
function weather(){
  
    detectAndroidVersion(XML_URL_WEATHER,GET_WEATHER);  
  
}
                                             
                                             
function weatherParser(xml){
                                             
     
                                             
    xmlDoc = $.parseXML(xml);
   
    $(xmlDoc).find(XML_WEATHER_WETTER_LIST).each(function()
    {	
        var count = parseInt($(this).attr(XML_LISTE_ATTRIBUTE_COUNT));
        printOnConsole("weatherParser","Count: "+count);
                                                                                          
        if(count > 0)
        {
                printOnConsole("weatherParser","Count: "+count);
                                                                                          
                $(this).find(XML_WEATHER_WETTER).each(function()
                {
                        var report = $(this).find(XML_WEATHER_MELDUNG).text();
                        var current = $(this).find(XML_WEATHER_AKTUELL).text();
                        var min = $(this).find(XML_WEATHER_MIN).text();
                        var max = $(this).find(XML_WEATHER_MAX).text();
                        var pic = $(this).find(XML_WEATHER_SYMBOL).text();
                                                                                                                                
                        var element = '<tr>';
                                                                                                                                
                        if(pic.length > 0){
                            element = element + '<td id="weatherPic" ><img src="' + pic + '" class="weatherPic" /><td>';
                        }
                                                                                                                                
                        if(current.length > 0){
                                                                                                                                
                            element = element + '<td><div id="weatherNowText" class="weatherNowText">Aktuell:</div><div class="weatherNowNumber">' + current + ' Grad</div></td>';
                        }
                                                                                                                                
                        $("#weatherPicAndText").html(element + '</tr>');
                                                                                                                                
                        element = '';
                                                                                                                                
                        if(min.length > 0 || max.length > 0 ){
                                                      
                                                      element = '<div class="weatherToDayTitle">Heute erwartet:</div><div class="weatherToDayMin" >';
                                                      
                                                      if(min.length > 0){
                                                      
                                                      element = element + 'min: '+ min + ' Grad ';
                                                      }
                                                      
                                                      if(max.length > 0){
                                                      
                                                      element = element + 'max: '+ max + ' Grad ';
                                                      }
                                                      
                        }
                                                      
                        $("#weatherToDay").html(element);
                                                                                                                                
                        $("#weatherReport").html(report);
                                                                                                                                
                    });
                                                 
                    ui.hideLoadingScreen();
                                                                                          
                    //wechsel auf die Ergebnisseite
                    $.mobile.changePage("#weatherPage");
                                                                                          
            }
            else{
                                                 
                ui.showDialog("Kein Wetter Infos","Zurzeit sind keine Wettermeldungen vorhanden.",false);
            }
    });
}
                                             
                                             
    /*****************************************************/

/**
 * Ermittelt welche Android Version das Ger�t hat um zu entscheiden ob die XML mit Cache oder ohne geladen wird
 * @param url - Adresse von der die XML geladen werden soll - Datentyp: String
 */
function detectAndroidVersion(url,succesFunc){
	
    getXML(url,false,succesFunc);
}

/**
 * L�dt die XML vom Server
 * @param url - Adresse von der die XML geladen werden soll - Datentyp: String
 * @param useCache - benutzng des Cache des Parsers - Datentyp: Boolean -> true Chache ein, false Chache aus
 * @param succesFunc - welche Funktion nach dem Erfolgeichen Zugriff aufgerufen werden soll - Datentyp: int - 1: Suche, 2: Liste, 3: Detail
 */
function getXML(url,useCache,succesFunc){
	
	printOnConsole("getXMl","getXML: "+url + " "+useCache + " " + succesFunc);
	
    ui.showLoadingScreen("");
                                             
	switch(succesFunc){
		
        case GET_SEARCH://Such Config f�r Shop und Gastro
            $.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: searchConfigXMLParser,
                   error: function(xhr, textStatus,error){
                         ui.hideLoadingScreen();
                   }
                });
			break;
		
        case GET_DETAIL: //Details eines Shops oder Gastro
            
            ui.showLoadingScreen("");
            
			$.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: detailsXMLParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
			break;
        case GET_EVENTS_DETAILS: ////Details einer Veranstaltung
            
            ui.showLoadingScreen("");
            
			$.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: detailsXMLEvents,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            break;
        case GET_RADAR_LISTE:
            
            ui.showLoadingScreen("");
            
			$.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: blitzerListeParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
            /*
            $('#radarSearch').ajaxComplete(function() {
                $('#radarSearch').listview('refresh');
            });
             */

            
            break;
        case GET_NEWS_LISTE:
            
            ui.showLoadingScreen("");
            
			$.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: newsListParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            /*
            $('#specialList').ajaxComplete(function() {
                $('#specialList').listview('refresh');
            });
            */
            break;
        case GET_NEWS_DETAILS:
            
            ui.showLoadingScreen("");
            
			$.ajax({
                   type: "GET",
                   cache: useCache,
                   url: url,
                   dataType: "html",
                   success: newsDetailsParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
            break;
        case GET_TRAFFIC_LIST:
                                             
            ui.showLoadingScreen("");
                                             
            $.ajax({
                    type: "GET",
                    cache: useCache,
                    url: url,
                    dataType: "html",
                    success: trafficListParser,
                    error: function(xhr, textStatus, error){
                            ui.hideLoadingScreen();
                            ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                        }
                                                    
            });
            
            /*
            $('#trafficSearch').ajaxComplete(function() {
                $('#trafficSearch').listview('refresh');
            });
             */
                                    
            break;
        case GET_WEATHER:
            ui.showLoadingScreen("");
                                             
            $.ajax({
                    type: "GET",
                    cache: useCache,
                    url: url,
                    dataType: "html",
                    success: weatherParser,
                    error: function(xhr, textStatus, error){
                            ui.hideLoadingScreen();
                            ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                    }
                   
            });
        break;
                                             
                                            

   
       	}
}

function errorGetXML(){

}

function sectorOrCategoire(sector,categorie){
	
	if(categorie == 'all' || categorie.length == 0){
        return  sector;
	}
	else{
		return categorie;
	}
}

function postXML(url,useCache,whichPost,sector,cat,pos,area){
	 
    printOnConsole("postXML","postXML");
	
    ui.showLoadingScreen('');
	var tmp = '';
	
    switch(whichPost){
	 	case POST_LISTE_SECTOR://Suche nach Branchen
	 		
	 		tmp = sectorOrCategoire(sector,cat);
	 		
            if(area.length == 0){
	 			area = 'all';
	 		}
	 		
            //printOnConsole("POSTXML",": Branche: "+tmp + " Pos: "+pos + " Area: " + area);
                                             
	 		$.ajax({
                   type: 'POST',
                   cache: useCache,
                   url: url,
                   data: { branche:  tmp, position: pos, stadtgebiet: area },
                   dataType: "html",
                   success: listeXMLParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
                                             
            
			break;
	 	case POST_LISTE_KEYWORD:
	 		
            $.ajax({
                   type: 'POST',
                   cache: useCache,
                   url: url,
                   data: { firmenname:  sector, position: pos, keyword: cat, stadtgebiet: area },
                   dataType: "html",
                   success: listeXMLParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
        
            
            break;
	 	case POST_GASTRO_SECTOR:
	 		
	 		tmp = sectorOrCategoire(sector,cat);
           
	 		if(area.length == 0){
	 			area = 'all';
	 		}
                                             
	 		
	 		$.ajax({
                   type: 'POST',
                   cache: useCache,
                   url: url,
                   data: { gastro: 1, branche:  tmp, position: pos, stadtgebiet: area },
                   dataType: "html",
                   success: listeXMLParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
          
            
            break;
        case POST_GASTRO_KEYWORD:
            printOnConsole("POSTXML","URL: " + url);
            printOnConsole("POSTXML",": Firma: " + sector + " Pos: "+pos + "keyword: " + cat + " Area: " + area);
	 		
	 		$.ajax({
                   type: 'POST',
                   cache: useCache,
                   url: url,
                   data: { gastro: 1, firmenname:  sector, position: pos, keyword: cat, stadtgebiet: area },
                   dataType: "html",
                   success: listeXMLParser,
                   error: function(xhr, textStatus, error){
                        ui.hideLoadingScreen();
                        ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                   }
            });
            
         
            
            break;
        case POST_INSIDER_GASTRO_LISTE:
                                             
            $.ajax({
                    type: 'POST',
                    cache: useCache,
                    url: url,
                    data: { gastro: 1,position: pos },
                    dataType: "html",
                    success: listeXMLInsider,
                    error: function(xhr, textStatus, error){
                            ui.hideLoadingScreen();
                            ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                    }
            });
     
                                             
            break;
        case POST_INSIDER_SHOP_LISTE:
                                             
            $.ajax({
                    type: 'POST',
                    cache: useCache,
                    url: url,
                    data: { position: pos },
                    dataType: "html",
                    success: listeXMLInsider,
                    error: function(xhr, textStatus, error){
                            ui.hideLoadingScreen();
                            ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                    }
            });
          
                                             
            break;
      case POST_GASTRO_TIPPS:
            
            printOnConsole("serach","*************************************** cat: "+cat + " position: "+pos + " area: "+area + "***************************************");
            
            $.ajax({
                    type: 'POST',
                    cache: useCache,
                    url: url,
                    data: { gastro: 1, kind: cat, position: pos, stadtgebiet: 'all' },
                    dataType: "html",
                    success: listeXMLParser,
                    error: function(xhr, textStatus, error){
                                    ui.hideLoadingScreen();
                                    ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
                    }
            });
                                
                                       
    }
	
            
}

//EVENTS
/*
 * �bermittelt die Kategorien der Veranstaltungen per Post_Request an den Server
 */
function postEventsCategorie(url,useCache,pos,cat){
    
    printOnConsole("eventsXML","categeorieEvents: "+cat);
    ui.showLoadingScreen('');
        
    $.ajax({
        type: 'POST',
        cache: useCache,
        url: url,
        data: { kategorie:  cat, position: pos },
        dataType: "html",
        success: listeXMLEvents,
        error: function(xhr, textStatus, error){
           
           ui.hideLoadingScreen();
           ui.showDialog("Fehlermeldung","Um diese Funktion nutzen zu koennen, benoetigen Sie eine Netzwerkverbindung.",false);
        }
     });
    
    /*$('#eventsSearch').ajaxComplete(function() {
        $('#eventsSearch').listview('refresh');
    });*/
}


