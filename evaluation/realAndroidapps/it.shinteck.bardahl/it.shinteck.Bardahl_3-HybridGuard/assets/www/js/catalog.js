/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * Define action on catalog view buttons
 * @param settore
 *  A string contain te id of catalog sector
 *    - AU: Auto
 *    - MO: Moto
 * @return void
 */

function catalogButtonAction(settore){
    prepareHomepageChange();
    try{
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        db.transaction(function(tx){
            tx.executeSql("SELECT * FROM settori WHERE aid = '"+ settore +"';", []
                , function(tx, results){
                    var len = results.rows.length;
                    if(len == 0){
                        if(!checkConnection()){
                            errorAndReturnHome("Nessuna connessione");
                            return;
                        }
                        catalogSoapRequest(settore);
                    }else {
                        //goToCatalog(settore);
                        catalogDoQuery(settore);
                    }
                }, errorCB);
        });
    }
    catch(e){
        debugAlert(e.toString());
        errorAndReturnHome("Impossibile scaricare il catalogo");
    }
}


/**
 * Asynchronous request to soap web service action:getCatalog 
 * @param settore
 * @return void
 */
function catalogSoapRequest(settore){
    if(settore != null){
        showLoading("Catalogo in download");
        var wsUrl = "http://intranet.bardahl.it/MaroilWebServices/BardahlCatalog";
        //var wsUrl = "http://192.168.0.2:8080/MaroilWebServices/BardahlCatalog";
        var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.maroil.it/"> \
   <soapenv:Header/> \
   <soapenv:Body> \
      <ser:getCatalog> \
         <settore>' + settore + '</settore> \
      </ser:getCatalog> \
   </soapenv:Body> \
</soapenv:Envelope>';
    
        $.ajax({
            type: "POST",
            url: wsUrl,
            contentType: "text/xml",
            dataType: "xml",
            data: soapRequest,
            success: function(data, status, req) {
                catalogSoapRequestSuccess(data, status, req, settore);
            },
            error: catalogSoapRequestError
        });
    }
    else {
        debugAlert('Parametri non validi');
        errorAndReturnHome("Impossibile scaricare il catalogo");
    }
}

/**
 * Eleborate data on success after soap request to getCatalog action
 * @param data
 * @param status
 *  the status of the request
 * @param req
 *  the request contain the response XML data
 * @param settore
 * @return void
 */
function catalogSoapRequestSuccess(data, status, req, settore) {
    //ho scaricato il catalogo del settore indicato, inserisco i dati in db sqlite
    try{
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        var xml = $(req.responseXML);
        var settori = $(xml).find("settore");
        var cSettori = settori.children();
    
        var queries = new Array();
        if(cSettori.length > 1){
            //il primo figlio è atitle del settore
            queries.push('INSERT INTO settori (aid, atitle) VALUES ("' + settore + '", "' + cSettori[0].textContent + '"); ');
            for(var i = 1; i < $(cSettori).length; i++){
                //prendo i children di gruppi che rappresentano le info gruppo e i sottogruppi
                var jSections = $(cSettori[i]).children();
                var gruppoArray;   
                var gruppoStart = true; //quando comincia un nuovo gruppo
                jSections.each(
                    function( intSectionIndex ){
                        //primo livello, i gruppi
                        var jSection = $(this);
                        var nodeValue = (jSection[ 0 ]) ? $.trim(jSection[ 0 ].nodeName) : "";
                        if(nodeValue != 'subgruppo'){
                            if(gruppoStart == true){
                                gruppoArray = new Array();
                                gruppoStart = false;
                            }
                            gruppoArray[nodeValue] = jSection[ 0 ].textContent;
                        }
                        //controllare lo index se > 2 allora ho finito l'intestazione e posso passare al resto
                        else {
                            // salvo il gruppo
                            if(gruppoStart == false){
                                queries.push("\nINSERT INTO gruppi (aid, asettoreId, atitle, aordine) VALUES ('" + gruppoArray['aid'] + "', '"+settore+"', '"+gruppoArray['atitle']+"', '"+gruppoArray['aordine']+"'); ");
                                gruppoStart = true;
                            }
                            //
                            var subgruppoArray;
                            var subgruppoStart = true;
                            jSection.children().each(
                                function( intPartIndex ){
                                    var jPart = $( this );
                                    var nodeValue = (jPart[ 0 ]) ? $.trim(jPart[ 0 ].nodeName) : "";
                                    if(nodeValue != 'prodotto'){
                                        if(subgruppoStart == true){
                                            subgruppoArray = new Array();
                                            subgruppoStart = false;
                                        }
                                        subgruppoArray[nodeValue] = jPart[ 0 ].textContent;
                                    }
                                    else {
                                        // salvo il subgruppo
                                        if(subgruppoStart == false){
                                            queries.push("\nINSERT INTO subgruppi (aid, asettoreId, agruppoId, atitle, aordine) VALUES ('" + subgruppoArray['aid'] + "', '"+settore+ "', '" + gruppoArray['aid'] + "', '"+subgruppoArray['atitle']+"', '"+subgruppoArray['aordine']+"'); ");
                                            subgruppoStart = true;
                                        }
              
                                        //terzo livello, i prodotti
                                        var prodottoArray = new Array();
                                        jPart.children().each(
                                            function( intProdIndex ){
                                                var jProd = $( this );
                                                var nodeValue = (jProd[ 0 ]) ? $.trim(jProd[ 0 ].nodeName) : "";
                                                prodottoArray[nodeValue] = jProd[ 0 ].textContent;
                                            }
                                            );//prodotti each end
                                        queries.push("INSERT INTO prodotti (aid, asettoreId, agruppoId, asubgruppoId, atitle, adesc, adescSint, aplus, acaratteristiche, ascheda, aBigImage, aSmallImage) \
                          VALUES ('" + prodottoArray['aid'] + "', '" + settore + "','" + gruppoArray['aid'] + "','" + subgruppoArray['aid'] + "','"+prodottoArray['atitle']+"','"+prodottoArray['adesc']+"',\
                          '"+prodottoArray['adescSint']+"','"+prodottoArray['aplus']+"','"+prodottoArray['acaratteristiche']+"','"+prodottoArray['ascheda']+"',\
                          '"+prodottoArray['aBigImage']+"','"+prodottoArray['aSmallImage']+"')")
                                    }
                                }
                                );//subgruppi each end
                        }
                    }
                    //fine each jSections
                    );
            }
            db.transaction(function(tx) {
                for(var i = 0; i < queries.length; i++){
                    tx.executeSql(queries[i]);
                }
            }, errorCB, function(){
                catalogDoQuery(settore);
            });
        }
        else {
            //risposta xml vuota o non corretta
            errorAndReturnHome("Catalogo vuoto");
        }
    }
    catch (e){
        debugAlert(e.toString());
        errorAndReturnHome("Impossibile scaricare il catalogo");
    }
}

/**
 *Ajax catalogSoapRequest Error
 */
function catalogSoapRequestError(data, status, req) {
    debugAlert(status);
    errorAndReturnHome("Impossibile scaricare il catalogo");
}


/**
 * move to page after catalog drawing action
 * @return void
 */
function goToCatalog(){
    hideLoading();
    $.mobile.changePage('#catalog',{
        transition: pageTransition
    });
}


/**
 * CATALOG INITIALIZATION
 */
function catalogInit(){
//nothing to do
}

/**
 * CATALOG INITIALIZATION
 * @GET: settore catalogo [AU, MO]
 */
function catalogDoQuery(settore){
    if(settore != null){
        //Log
        catalogLogForSettore(settore);
        //perform query
        //by the sector parameter build the list into content on page #catalog
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        db.transaction(function(tx){
            tx.executeSql(" SELECT COUNT(*) AS nprodotti, sg.atitle, sg.aid, sg.aordine, sg.agruppoId, g.atitle AS agruppoTitle, g.asettoreId, s.atitle AS asettoreName \
                      FROM subgruppi AS sg \
                      LEFT JOIN gruppi AS g \
                      LEFT JOIN settori AS s \
                      LEFT JOIN prodotti AS p \
                      WHERE g.aid = sg.agruppoId \
                      AND g.asettoreId = '"+ settore +"' \
                      AND g.asettoreId = s.aid\
                      AND g.asettoreId = sg.asettoreID \
                      AND p.asettoreId = sg.asettoreId \
                      AND p.agruppoId = sg.agruppoId \
                      AND p.asubgruppoId = sg.aid \
                      GROUP BY sg.aid \
                      ORDER BY g.aordine, sg.aordine, sg.atitle; ", []
                , catalogDraw, errorCB);
        });//AND p.asubgruppoId = sg.aid \
     
    }else {
        errorAndReturnHome("Settore non valido");
    }
}

/**
 * Catalog draw page
 * @param tx
 * @param results
 */
function catalogDraw(tx, results) {
    var catalogList = $("#catalogList");
    //Svuoto i contenuti
    catalogList.empty();
    
    
    try{
        //Set title
        $("#catalogTitle").text(results.rows.item(0).asettoreName);
    
        var gruppo = "";
        var len = results.rows.length;
        for (var i=0; i<len; i++){
            //list divider
            if(gruppo != results.rows.item(i).agruppoTitle){
                gruppo = results.rows.item(i).agruppoTitle;
                var listDivider = $('<li>').attr('data-role', 'list-divider').html(results.rows.item(i).agruppoTitle);
                catalogList.append(listDivider);
            }

            //list content
            
            var tag_a = $('<a>').attr('data-transition', pageTransition).attr({
                //href: "products.html?sector=" + results.rows.item(i).asettoreId +"&group=" + results.rows.item(i).agruppoId + "&subgroup=" + results.rows.item(i).aid + "&groupName=" + results.rows.item(i).atitle + "",
                onClick : "productsDoQuery(\"" + results.rows.item(i).asettoreId + "\",\"" + results.rows.item(i).agruppoId + "\",\"" + results.rows.item(i).aid + "\",\"" + results.rows.item(i).atitle + "\"); return false;"
            });
            var tag_h = $('<h3>').attr("class", "ui-li-heading catalog-text").html(results.rows.item(i).atitle);
            var tag_count = $('<span>').attr("class", "ui-li-count").html(results.rows.item(i).nprodotti);
                
            var tag_img = $('<img>').attr({
                "src"   : 'img/catalog-thumb.png',
                "class" : "ui-li-thumb catalog-thumb"
            });
            
            tag_a.append(tag_h).append(tag_count).append(tag_img);
            var tag_li = $('<li>').html(tag_a);
            
            catalogList.append(tag_li);    
        }//for statement end
        catalogList.listview("refresh");
    }catch(e) {
        errorAndReturnHome(e.toString());
    }
    //Show generated page
    goToCatalog();
}


/**
 * PRODUCTS LIST INITIALIZATION
 */
function productsInit() {
//Nothing to do
}

/**
 * move to page products after drawing
 * @return void
 */
function goToProducts() {
    hideLoading();
    $.mobile.changePage('#products',{
        transition: pageTransition
    });
}


/**
 * PRODUCTS LIST INITIALIZATION
 * @param settore
 * @param gruppo
 * @param subgruppo
 * @param titolo
 */
function productsDoQuery(settore, gruppo, subgruppo, titolo) {
    showLoading("Caricamento prodotti");

    //setto il titolo
    $("#productsTitle").text(titolo);
  
    if(settore != null && gruppo != null && subgruppo != null){
        //Perform query
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        db.transaction(function(tx){
            tx.executeSql(" SELECT *\
                      FROM prodotti AS p \
                      WHERE p.agruppoId = '" + gruppo + "' \
                      AND p.asettoreId = '" + settore + "' \
                      AND p.asubgruppoId = '" + subgruppo + "' \
                      ORDER BY atitle;", [] , productsDraw, errorCB);
        });
        //Log
        catalogGroupLogForGruppo(settore, gruppo, subgruppo);
    }
    else{
        errorAndReturnHome("Parametri non validi");
    }
}


/**
 * Products draw page
 * @param tx
 * @param results
 */
function productsDraw(tx, results) {

    var catalogList = $("#productsList");
  
    //svuoto i contenuti
    catalogList.empty();
  
    try{
        var gruppo = "";
        var len = results.rows.length;
        for (var i=0; i<len; i++){
            //list divider
            if(gruppo != results.rows.item(i).agruppoTitle){
                gruppo = results.rows.item(i).agruppoTitle;
                var listDivider = $('<li>').attr('data-role', 'list-divider').html(results.rows.item(i).asubgruppoTitle);
                catalogList.append(listDivider);
            }
            //list content
           /* VECCHIO STILE
            var tag_li = $('<li>').attr({
                "data-corners"    : "false",
                "data-shadow"     : "false",
                "data-iconshadow" : "true",
                "data-wrapperels" : "true",
                "data-icon"       : "arrow-r",
                "data-iconpos"    : "right",
                "data-theme"      : "c",
                "class"           : "ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c"
            });
      
            var tag_div_1 = $('<div>').attr({
                "class" : "ui-btn-inner ui-li"
            });
      
            var tag_div_2 = $('<div>').attr({
                "class" : "ui-btn-text"
            });
      
      
            var tag_a = $('<a>').attr('data-transition', pageTransition).attr({
                //href: "productDetail.html?sector=" + results.rows.item(i).asettoreId +"&group=" + results.rows.item(i).agruppoId + "&subgroup=" + results.rows.item(i).asubgruppoId + "&product=" + results.rows.item(i).aid,
                onClick : "productDetailDoQuery(\"" + results.rows.item(i).asettoreId + "\",\"" + results.rows.item(i).agruppoId + "\",\"" + results.rows.item(i).asubgruppoId + "\",\"" + results.rows.item(i).aid + "\"); return false;",
                "class"         : "ui-link-inherit"
            });
      
      
            var tag_img = $('<img>').attr({
                "src"   : results.rows.item(i).aSmallImage,
                "alt"   : results.rows.item(i).atitle,
                "class" : "ui-li-thumb"
            });
      
            var tag_h3 = $('<h3>').attr("class", "ui-li-heading").append(results.rows.item(i).atitle);
        
            var tag_p = $('<p>').attr("class", "ui-li-desc").append(results.rows.item(i).adescSint);
      
            var tag_arrow = $('<span>').attr("class", "ui-icon ui-icon-arrow-r ui-icon-shadow");
      
            //composition
            tag_a.append(tag_img).append(tag_h3).append(tag_p);
            tag_div_2.append(tag_a);
            tag_div_1.append(tag_div_2).append(tag_arrow);
            tag_li.append(tag_div_1);
      */
     
                
            var tag_li = $('<li>').attr({
                "class"           : "ui-li-has-arrow"
            });
            
            var tag_a = $('<a>').attr('data-transition', pageTransition).attr({
                //href: "productDetail.html?sector=" + results.rows.item(i).asettoreId +"&group=" + results.rows.item(i).agruppoId + "&subgroup=" + results.rows.item(i).asubgruppoId + "&product=" + results.rows.item(i).aid,
                onClick : "productDetailDoQuery(\"" + results.rows.item(i).asettoreId + "\",\"" + results.rows.item(i).agruppoId + "\",\"" + results.rows.item(i).asubgruppoId + "\",\"" + results.rows.item(i).aid + "\"); return false;"
            });
            
            var tag_h3 = $('<h3>').attr("class", "ui-li-heading prodotti-text").html(results.rows.item(i).atitle);
        
            var tag_p = $('<p>').attr("class", "ui-li-desc prodotti-text").html(results.rows.item(i).adescSint+'&nbsp;');
      
            var tag_div = $('<div>').attr({
                "class" : "ui-li-thumb prodotti-thumb-div"
            });

            var tag_img = $('<img>').attr({
                "src"   : results.rows.item(i).aSmallImage,
                "alt"   : results.rows.item(i).atitle,
                "class" : "prodotti-thumb",
                "onError" : "this.src='img/xButton.png'"
            });
            
            tag_div.append(tag_img);
            tag_a.append(tag_h3).append(tag_p).append(tag_div);
            tag_li.append(tag_a);
                
                
            catalogList.append(tag_li);
            
            
        }//for statement end
        //refresh elements
        catalogList.listview("refresh");
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
        errorAndReturnHome("Impossibile visualizzare il catalogo");
    }
    //Show generated page
    goToProducts();
}


/**
 * PRODUCT DETAIL INITIALIZATION
 */
function productDetailInit() {
//Nothing to do
}

function goToProductDetail() {
    hideLoading();
    $.mobile.changePage('#productDetail',{
        transition: pageTransition
    });
}



/**
 * PRODUCT DETAIL INITIALIZATION
 * @param settore
 * @param gruppo
 * @param subgruppo
 * @param prodotto
 */
function productDetailDoQuery(settore, gruppo, subgruppo, prodotto) {
    showLoading("Caricamento prodotto");
    if(settore != null && gruppo != null && subgruppo != null && prodotto != null){
        //Perform query
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        db.transaction(function(tx){
            tx.executeSql("SELECT * FROM prodotti AS p WHERE p.aid = '" + prodotto + "';", [] , productDetailDraw, errorCB);
        });
        
        //Log
        catalogLogForProdotto(prodotto);
    }else {
        hideLoading();
        myAlert("Parametri non validi");
    }
}

/**
 * Product detail draw page
 * @param tx
 * @param results
 */
function productDetailDraw(tx, results) {
    //Imposto il titolo
    try{
        $("#productDetailTitle").text(results.rows.item(0).atitle);
    
        //Svuoto gli elementi
        $("#image-preview").empty();
        $("#caratteristiche").empty();
        $("#plus-prodotto").empty();
    
        //setto i contenuti
        $("#image-preview").html($('<img>').attr({
            "src"   : results.rows.item(0).aBigImage,
            "alt"   : results.rows.item(0).atitle,
            "class" : "prodotto-img",
            "onError" : "this.src='img/xButton@2x.png'"
        }));
        $("#caratteristiche").html(results.rows.item(0).acaratteristiche);
        $("#plus-prodotto").html(results.rows.item(0).aplus);
  
        goToProductDetail();
    }
    catch(e){
        hideLoading();
        debugAlert(e.toString());
        errorAndReturnHome("Impossibile visualizzare il prodotto");
    }
/*
  content.append($('<p>').append(results.rows.item(0).aid));
  content.append($('<p>').append(results.rows.item(0).agruppoId));
  content.append($('<p>').append(results.rows.item(0).asubgruppoId));
  content.append($('<p>').append(results.rows.item(0).atitle));
  content.append($('<p>').append(results.rows.item(0).adesc));
  content.append($('<p>').append(results.rows.item(0).adescSint));
  content.append($('<p>').append(results.rows.item(0).aplus));
  content.append($('<p>').append(results.rows.item(0).acaratteristiche));
  content.append($('<p>').append(results.rows.item(0).ascheda));
  content.append($('<p>').append(results.rows.item(0).aBigImage));
  content.append($('<p>').append(results.rows.item(0).aSmallImage));
  */
}