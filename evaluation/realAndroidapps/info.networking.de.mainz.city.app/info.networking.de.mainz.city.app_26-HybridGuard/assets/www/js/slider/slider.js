var slider = {
    pages: new Array(),
    subPages: new Array(),
    index: 0,
    MIN_CATEGORIE: 0,
    MAX_CATEGORIE: 5,
    indexSubMenu: -1,
    ID_RADAR: 'blitzer',
    ID_TRAFFIC: 'stau',
    ID_PARKING: 'parken',
    ID_SEARCH_SHOP: 'sucheShop',
    ID_SEARCH_GASTRO: 'sucheGastro',
    ID_MODE: 'mode',
    ID_LEBENSMITTEL: 'lebensmittel',
    ID_KUNST: 'kunst',
    ID_SCHOENHEIT: 'schoenheit',
    ID_VERKEHR: 'verkehr',
    ID_HANDWERK: 'handwerk',
    ID_COMPUTER: 'computer',
    ID_MULTIMEDIA: 'multimedia',
    ID_BAU: 'bau',
    ID_EINRICHTUNG: 'einrichtung',
    ID_ARZT: 'arzt',
    ID_BILDUNG: 'bildung',
    ID_GELD: 'geld',
    ID_SHOP_SONSTIGES: 'sonstiges',
    ID_RESTAURANT: 'restaurant',
    ID_CAFE: 'cafe',
    ID_BIER: 'bier',
    ID_BAR: 'bar',
    ID_KIOSK: 'kiosk',
    ID_HOTEL: 'hotel',
    ID_GASTRO_TIPPS: 'gastroTipps',
    //Erstellt den Slider auf der naviPage
    initNaviSlider: function(){
        //310
        //210
        //160
        $('#navigation').boutique({
                              container_width:	window.innerWidth * 0.86,
                              front_img_width:	window.innerWidth * 0.7,
                              front_img_height:	window.innerHeight * 0.33,
                              frames: 3,
                              starter: 1,
                              speed:	 600,
                              behind_opacity: 0.6,
                              autoplay:	 false,
                              autoplay_interval:	4000,
                              freescroll:	 false,
                              text_front_only: false,
                              move_on_hover:	 false
        });
    
    
        //this.pages = $("#categoriePages .catPage").children();
        this.pages = $("#categoriePages .catPage");
        this.subPages = $("#categoriePages .catSubPage");
        
    },
    goToFrame:function(frameIndex){
    
        if(frameIndex > 0){
            this.index = frameIndex - 1;
        }else{
            this.index = 0;
        }
    
    
        $(this.pages[this.index]).show();
    
        //index begint hier mit 1
        navigation_goto(frameIndex);
    
    },
    hideLastFrame: function(){
        this.hideFrame(this.index);
    },
    hideFrame: function(index){
    
        $(this.pages[index]).hide();
    
    },
    showFrame: function(index){
        $(this.pages[index]).show();
    },
    getIndex: function(){
        return this.index;
    },
    setIndex: function(index){
        this.index = index;
    },
    swipeNaviSlider: function(){
    //#navigation
        $('.sliderNavigation').swipe({
                               
                               swipe:function(event, direction, distance, duration, fingerCount) {
                               
            
                                if(direction == 'left')
                                {
                               
                                    slider.nextCategorie();
                               
                                }
                                else if(direction == 'right')
                                {
                                    slider.prevCategorie();
                               
                                }
                            }
        });
    },
    nextCategorie: function(){
        
        if(this.indexSubMenu > -1){
            
            this.hideSubMenu();
        }
        
        var index = this.getIndex();
        
        this.hideFrame(index);
        
        var MIN = this.MIN_CATEGORIE;
        var MAX = this.MAX_CATEGORIE;
        
        if(index < MAX){
            //index = this.index + 1;
            var i = index + 1;
            this.setIndex(i);
            this.showFrame(i);
            
        }else{
            
            //index = MIN;
            this.setIndex(MIN);
            this.showFrame(MIN);
            
        }
        
        advertise.setAdPages(this.getIndex());
        
        navigation_next();
        
    },
    prevCategorie: function(){
        
        if(this.indexSubMenu > -1){
            
            this.hideSubMenu();
        }
        
        var index = slider.getIndex();
        
        slider.hideFrame(index);
        
        var MIN = this.MIN_CATEGORIE;
        var MAX = this.MAX_CATEGORIE;
        
        if(index > MIN){
            
            //index = index - 1
            this.setIndex(index - 1);
            this.showFrame(index - 1);
            
        }else{
            
            //index = MAX;
            this.setIndex(MAX)
            this.showFrame(MAX);
            
        }
        
        advertise.setAdPages(this.getIndex());
        navigation_previous();
    },
    //Einbelenden des SubMenü
    showSubMenu: function(id){
        
        var arr;
        
        switch(id){
        
            case this.ID_RADAR:
                this.indexSubMenu = 0;
                break;
            case this.ID_TRAFFIC:
                this.indexSubMenu = 1;
                break;
            case this.ID_PARKING:
                this.indexSubMenu = 2;
                break;
            case 'tanken':
                ui.showDialog("Achtung","Die Markttransparenzstelle für Kraftstoffe des Bundes-Kartellamtes wird in Kürze die Benzinpreise der 3 Sorten Super, E10 und Diesel in Echtzeit bereitstellen. Mainz & more wird an dieser Stelle die regionalen Benzinpreis aktuell anzeigen.");
                this.indexSubMenu =  - 1;
                break;
            case 'mvg':
                ui.showDialog("In Entwicklung","Öffentliche Verkehrsmittel folgt in nächster Zeit");
                this.indexSubMenu =  - 1;
                break;
            case this.ID_SEARCH_SHOP:
                this.indexSubMenu = 3;
                break;
            case this.ID_SEARCH_GASTRO:
                this.indexSubMenu = 4;
                break;
            case this.ID_MODE:
                this.indexSubMenu = 5;
                arr = new Array('Bekleidung &amp; Mode','Kinderbekleidung','Lederwaren','Mode &amp; Designer','Schmuckwaren und Uhren','Schuhhandel','Baby, Kind &amp; Spielen','Accessoires','Wäsche / Strümpfe','Hüte / Handschuhe','Sport &amp; Outdoor','Geschenke');
            
                break;
            case this.ID_LEBENSMITTEL:
                this.indexSubMenu = 5;
                arr = new Array('Feinkost','Lebensmittel / Märkte','Obst- und Gemüsehandel','Tabakwaren','Weine &amp; Spirituosen','Getränke-Vertrieb','Bäckereien','Metzgereien','Fleisch &amp; Fisch','Süsswaren','Kaffee / Tee','Bio-Natur','Sonstige Lebens- &amp; Genussmittel');
                
                break;
            case this.ID_KUNST:
                this.indexSubMenu = 5;
                arr = new Array('Ateliers','Filmproduktionen','Galerien','Kinos','Spielhallen und -kasinos','Theater / Bühnen','Sonst. Kunst &amp; Unterhaltung','Rundfunk- und Fernsehanstalten','Verlage / Musikverlage','Videoverleih','Buchhandel','Tanzen','Zeitungen &amp; Zeitschriften');
                
                break;
            case this.ID_SCHOENHEIT:
                this.indexSubMenu = 5;
                arr = new Array('Augenoptik & Brillen','Drogerien / Parfumerien','Kosmetik / Nagelstudio','Reformhäuser','Sport & Fitness','Apotheken','Fußpflege','Massagen','Sanitätshäuser','Sonst. Schönheit & Gesundheit','Hörgeräte Akustiker','Friseure');
                
                break;
            case this.ID_VERKEHR:
                this.indexSubMenu = 5;
                arr = new Array('Autohandel','Autozubehör','Autoreparatur-Werkstätten','Sonst. Verkehr und Reisen','Schifffahrt und Reedereien','Tankstellen','Transporte / Taxi','Fahrschulen','Reisebüros','Bike & Rad');
                
                
                break;
            case this.ID_HANDWERK:
                this.indexSubMenu = 5;
                arr = new Array('Schlüsseldienst','Schneidereien','Sonst. Handwerk &amp; Industrie','Dachdeckereien','Elektroinstallationen','Elektrotechnik / Fernsehen','Heizung-Lüftung-Sanitär','Maler und Lackierer','Schlossereien / Metallbau','Schreinereien','Schuhmachereien','Chem. Erzeugnisse und Präparate','Maschinenbau','Weingüter');
                
                break;
            case this.ID_COMPUTER:
                this.indexSubMenu = 5;
                arr = new Array('Computer','Datenverarbeitung EDV Beratung','Elektronik','Software','Telekommunikation','Fernsehgeräte','Fotohandlungen','Radio-Fernseh-Video','Sonstige Elektronik');
                
                break;
            case this.ID_MULTIMEDIA:
                this.indexSubMenu = 5;
                arr =  new Array('Fotoateliers','Journalisten','Designer','Mobile Computing','Internet-Services','Werbung','Sonst. Multimedia / Marketing');
               
                break;
            case this.ID_BAU:
                this.indexSubMenu = 5;
                arr = new Array('Architekten','Baubetreuung und Finanzierung','Baugeschäfte und -unternehmen','Baugesellschaften','Baustoffe / Baumärkte','Boden &amp; Fliesen','Gartenbaubetriebe','Hausverwaltung','Immobilien','Ingenieurbüros','Innenarchitekten','Glas- und Gebäudereinigung','Sonstige Bau / Wohnen','Raumausstattungen');
                break;
            case this.ID_EINRICHTUNG:
                this.indexSubMenu = 5;
                arr = new Array('Antiquitäten', 'Büroeinrichtungen &amp; Bedarf','Bilder &amp; Rahmen','Blumengeschäfte und -bindereien','Gardinen und Dekoration','Geschenkartikel','Küchen &amp; Kochen','Möbel','Raumausstattung','Teppiche und Teppichböden','Glas, Ton, Porzellan','Haushaltsgeräte','Sonstige Einrichtung');
                break;
            case this.ID_ARZT:
                this.indexSubMenu = 5;
                arr = new Array('Ärzte für Allgemeinmedizin','Ärzte für Augenheilkunde','Ärzte für Chirurgie','Ärzte für Frauenheilkunde und Geburtsh.','Ärzte für Hals-Nasen-Ohrenheilkunde','Ärzte für Haut- und Geschlechtskrankh.','Ärzte für Innere Medizin','Ärzte für Kinderheilkunde','Ärzte für Neurologie','Ärzte für Orthopädie','Ärzte für Psychiatrie','Ärzte sonstige Fachrichtung','Heilpraktiker','Krankenhäuser und Kliniken','Krankenkassen','Krankenpflege','Praktische Ärzte','Tierärzte','Zahnärzte','Ärzte für Urologie','Sonstige Ärzte');
                break;
            case this.ID_BILDUNG:
                this.indexSubMenu = 5;
                arr = new Array('Behörden / Verbände', 'Forschungsinstitute', 'Umweltschutz','Bildungseinrichtungen','Musikschulen und -unterricht','Schulen','Sprachschulen','Weiterbildung','Sonst. Bildung / Behörden');
                break;
            case this.ID_GELD:
                this.indexSubMenu = 5;
                arr = new Array('Beratungsbüros','Finanzwesen / Versicherungen','Rechtsanwälte &amp; Notare','Sachverständige','Steuerberater &amp; Buchhalter','Unternehmensberatung','Vermögensverwaltung','Wirtschaftsprüfer &amp; Wirtsch.Prüf.Ges.','Banken / Sparkassen','Bausparkassen','Finanzierungen','Versicherungen','Sonst. Geld &amp; Beratung');
                break;
            case this.ID_SHOP_SONSTIGES:
                this.indexSubMenu = 5;
                arr = new Array('Druckereien','Schreibbüros','Fotokopier-Betriebe','Kaufhäuser','Lotto-Toto','Zeitungen und Zeitschriften','Zoologische Handlungen','Chemische Reinigungen','Dienstleistungen','Entsorgung','Handelsgesellschaften','Handelsvertreter','Hausmeisterservice','Import und Export','Kurierdienst','Laboratorien','Mess- und Regeltechnik','Obstbau','Recycling','Schilder und Plakate','Sicherheitstechnik','Spielautomaten','Stempel und Schilder','Übersetzungen','Vermessungswesen und -büros','Verpackungen','Vertriebsgesellschaften','Verwaltungsgesellschaften','Wach- und Sicherheitsunternehmen','Wäschereien','Zahntechnische Laboratorien','Zeitarbeit','Bestattungsinstitute');
                break;
            case this.ID_RESTAURANT:
                this.indexSubMenu = 6;
                arr = new Array('Pizzerien','Italienisch','Asiatisch','Griechisch','Mexikanisch / Kubanisch','Türkisch / Arabisch','Indisch / Pakistanisch','Steakhäuser','Regionale Küche','Gourmet','Spanisch / Portugiesisch','Japanisch','Süd Amerika','Sonstige Restaurants');
                break;
            case this.ID_CAFE:
                this.indexSubMenu = 6;
                arr = new Array('Cafes und Konditoreien','Eiskonditoreien','Bistro/Café');
                break;
            case this.ID_BIER:
                this.indexSubMenu = 6;
                arr = new Array('Weinlokale','Straußwirtschaften','Biergärten / Terrassen','Kneipen');
                break;
            case this.ID_BAR:
                this.indexSubMenu = 6;
                arr = new Array('Discos','Bars','Clubs');
                break;
            case this.ID_KIOSK:
                this.indexSubMenu = 6;
                arr = new Array('Kioske','Schnellimbiss');
                break;
            case this.ID_GASTRO_TIPPS:
                this.indexSubMenu = 7;
                break;
            default:
                this.indexSubMenu =  - 1;
                break;
           
        }
        
        if(this.indexSubMenu > - 1){
            
            //SubMenü für Shops wird mit Daten gefüllt
            if(this.indexSubMenu == 5){
                ui.showLoadingScreen();
                var list = $('#listeSubShops');
                list.html(this.getListItem(arr,'shop',id));
                //$('#formShop').trigger('create');
                list.listview('refresh');
                
                //$('.sendButtonSubMenu').attr('onclick',"searchSector('#formShop','shop','"+ id +"')");
                
                ui.hideLoadingScreen();
                
            }
            
            //SubMenü für Gastro wird mit Daten gefüllt
            if(this.indexSubMenu == 6){
                ui.showLoadingScreen();
                var list = $('#listeSubGastro');
                list.html(this.getListItem(arr,'gastro',id));
                //$('#formGastro').trigger('create');
                list.listview('refresh');
                
                //$('.sendButtonSubMenu').attr('onclick',"searchSector('#formGastro','gastro','"+ id +"')");
                
                ui.hideLoadingScreen();
                
                
            }
            
            this.setNaviToCategorie();

            //hide frame von Pages
            this.hideLastFrame();
            
            //Werbung für die SubMenüs
            advertise.setAdSubPages(this.indexSubMenu);
            
            //anzeige Submenü
            $(this.subPages[this.indexSubMenu]).show();
        }
        
    },
    getListItem: function(arr, sector, id){
        
        var item = '';
        for(var index = 0; index < arr.length; index++){
            
          /* 
           item = item + '<li><a href="#" class="listLink" ><label class="listFirstLabel" data-corners="false" ><fieldset data-role="controlgroup" ><input type="checkbox" name="checkboxCat" value="'+ arr[index]+'" data-theme="c"/><label for="checkboxCat" class="listSecondLabel">'+ arr[index]+'</label></fieldset></label></a></li>';
           */
            
            item = item + "<li><a onclick=\"searchSector('" + sector + "','" + id + "','" + arr[index] + "')\">" + arr[index] + "</li>";
        }
        
        return item;
    },
    //das Aktuelle SubMenü wird ausgeblendet
    hideSubMenu: function(){
        
        $(this.subPages[this.indexSubMenu]).hide();
        
        this.indexSubMenu = -1;
        
        //Der Backbutton zeigt wieder auf die MainPage
        this.setNaviToMain();

    },
    //Zurücknavigation von SubMenu zur HauptCategorie
    goBackToCategorie: function(){
        
        //Ausblenden des SubMenüs
        this.hideSubMenu();
        
        //Anzeiged es letzten Frames der Hauptnavigation (Categorie)
        this.showFrame(this.index);
        
        //Werbung für die jeweilige Hauptseite setzen
        advertise.setAdPages(this.index);
        
    },
    //Zurücknavigation von Detail zum SubMenu
    goBackToSubMenu: function(id){
        
        navi.changeToPage('#naviPage');
        //index begint hier mit 1
        this.goToFrame(this.index+1);
        this.showSubMenu(id);
        
        
    },
    //Zurücknavigation von Detailseite auf NaviPage
    goBackToNaviPage: function(){
        
        this.showFrame(this.index);
        
        advertise.setAdPages(this.index);
        
    },
    //die Headernavigation(backbutton) wird auf die MainPage gesetzt
    setNaviToMain: function(){
        
        //Navigations Button zur MainPage (3 Streifen)
        $('#headerBack img').attr("src","bilder/kopf/Button_Menue.png");
        var headerBack = $('#headerBack');
        
        headerBack.attr("onclick","navi.changeToPage('#mainPage')");
    },
    //die Headernavigation(backbutton) wird auf die CatPage gesetzt
    setNaviToCategorie: function(){
        
        //Navigations Button zur CatPage (Pfeil)
        $('#headerBack img').attr("src","bilder/kopf/Button_Back.png");
        var headerBack = $('#headerBack');
        
        headerBack.removeAttr("data-rel");
        headerBack.attr("onclick","slider.goBackToCategorie()");
    },
    //erstellt den Slider auf der DetailPage
    initDetailSlider: function(){
        
        printOnConsole("Detyail","11111");
        
        var detailPic = $('#detailPic');
        
        var count = detailPic.children('img').length;
        
        if(count > 0){
            
            detailPic.theatre({
                              selector: 'img',
                              effect: 'fade',
                              paging: '.pagingDetail',
                              autoplay: 'false'
            });
            
            $('.pagingDetail').show();
            
            printOnConsole("Detyail","22222");
            
            this.stopDetailSlider();
            
            printOnConsole("Detyail","33333");
        
        }else{
            //alert("keine Bilder");
            //Wenn keine Bilder vorhanden sind wird der Punkt nicht angezeigt
            $('.pagingDetail').hide();
        }
        
    },
    swipeDetailSlider: function(){
        
        $('#detailPic').swipe({
                              
                              swipe:function(event, direction, distance, duration, fingerCount) {
                              
                                if(direction == 'left')
                                {
                                    $('#detailPic').theatre('next');
                                }
                                else if(direction == 'right')
                                {
                                    $('#detailPic').theatre('prev');
                                }
                                else if(direction == 'down')
                                {
                              
                                    $.mobile.silentScroll(200);
                                }
                                else if(direction == 'top')
                                {
                                    $.mobile.silentScroll(0);
                                }
                              
                              
                              }
        });
    },
    stopDetailSlider: function(){
        
        $('#detailPic').theatre('stop');
    }
}

function testIdex(){
    alert(slider.getIndex());
}

//Pfeile anzeigen
function move_callback(anchor, instance){
    $('#leftArrow').fadeIn();
    $('#rightArrow').fadeIn();
}
//Pfeile ausblenden
function pre_move_callback(anchor, instance){
    $('#leftArrow').fadeOut();
    $('#rightArrow').fadeOut();
}


/************************ CATEGORIEN **************/
$('#naviPage').live('pageinit', function() {
    slider.initNaviSlider();
});


$('#naviPage').live('pagebeforeshow', function() {
    
    if(navi.comesFromMain()){
        
        navi.setComesFromMain(false);
        
        slider.goToFrame(navi.getIndex());
                    
        slider.swipeNaviSlider();
        //setzt die Werbung auf der NaviPage wenn der User von der Main Seite kommt
        advertise.setAdPages((navi.getIndex()-1));
    }else{
        slider.goBackToNaviPage();
    }
    
                    
});

$('#naviPage').live('pagehide',function(){
                    
        slider.hideLastFrame();
});

/******************** DETAIL ************************/
$('#detailPage').live("pagebeforeshow", function() {
        
        //printOnConsole("Detyail","*****************");
        slider.initDetailSlider();
        //printOnConsole("Detyail","*****************2");
        slider.swipeDetailSlider();
        //printOnConsole("Detyail","*****************3");
                      
});


$('#detailPage').live("pagehide", function() {
                      
        slider.stopDetailSlider();
});

