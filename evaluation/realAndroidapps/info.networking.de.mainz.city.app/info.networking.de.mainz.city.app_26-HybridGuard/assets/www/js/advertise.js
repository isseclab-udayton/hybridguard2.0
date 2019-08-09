var advertise ={
    DEFAULT_BANNER: "bilder/werbung/iAd_Default.png",
    AD_URL: "http://icon008.info-mainz.de/firmen/app/banner/",
    firstTime: false,
    setAdMain: function(){
        this.buildAd('#mainPageAd','0.php','0.png');

        firstTime = true;
    },
    buildAd: function(id,php,pic){
        
    	if(conection.internet()){
            
        	printOnConsole("Advertise","advertise: "+id);

            $(id).html(this.createLink(this.AD_URL+php, this.AD_URL+pic));
            
            /*
             $('<img class="adBanner" src="' + this.AD_URL+pic +  '" />"').load(function(response, status, xhr) {
                                        
                                        if (status == "error") {
                                                var msg = "Sorry but there was an error: ";
                                                alert(msg + xhr.status + " " + xhr.statusText);
                                        }else{
                                                //alert("asdad");
                                                $(id +' img').detach();
                                                $(this).appendTo(id);
                                        }
            });
                                                                          
            */
            printOnConsole("Advertise","advertise2");
            
        }
        else{
            printOnConsole("Advertise","advertise DEFAULT 1");
            
            $(id).html(this.createLink('',this.DEFAULT_BANNER));
            
            printOnConsole("Advertise","advertise DEFAULT 2");
            
        }

    },
    createLink: function(php,pic){
        
        
        printOnConsole("Advertise", + php +  "  "  + pic);
        
        return "<a  onClick=\"navi.showExternalPage('" + php +"')\"><img class=\"adBanner\" src=\" " + pic + " \" /></a>";
    },
    setAdPages: function(index){
        switch(index){
            case 0:
                this.setAdSehenswert();
                break;
            case 1:
                this.setAdShop();
                break;
            case 2:
                this.setAdGastro();
                break;
            case 3:
                this.setAdVerkehr();
                break;
            case 4:
                this.setAdSpecial();
                break;
            case 5:
                this.setAdEvent();
                break;
        }
    },
    setAdSubPages: function(index){
        
        switch(index){
            case 0: //blitzer
                this.setAdRadarSubPage();
                break;
            case 1: //stau
                this.setAdTrafficSubPage();
                break;
            case 2: //parken
                this.setAdParkingSubPage();
                break;
            case 3: //Shop Suche
                this.setAdShopSearch();
                break;
            case 4: //Gastro Suche
                this.setAdGastroSearch();
                break;
            case 5: //shops
                this.setAdShopsSubPage();
                break;
            case 6: //gastro
                this.setAdGastroSubPage();
                break;
            case 7: //Gastro Tipp
                this.setAdGastroTipp();
                break;
        }

        
    },
    setAdShopList: function(){
        this.buildAd('#shopGastroListAd','21.php','21.png');
    },
    setAdInsider: function(){
        this.buildAd('#shopGastroListAd','23.php','23.png');
    },
    setAdShopsSubPage: function(){
         this.buildAd('#naviPageAd','24.php','24.png');
    },
    setAdShopSearch: function(){
         this.buildAd('#naviPageAd','25.php','25.png');
    },
    setAdGastroList: function(){
        this.buildAd('#shopGastroListAd','41.php','41.png');
    },
    setAdShopDetail: function(){
        
        this.buildAd('#adDetailPage','22.php','22.png');
    },
    setAdGastroDetail: function(){
        
        this.buildAd('#adDetailPage','42.php','42.png');
    },
    setAdShop: function(){
        this.buildAd('#naviPageAd','2.php','2.png');
    },
    setAdGastro: function(){
        this.buildAd('#naviPageAd','4.php', '4.png');
    },
    setAdGastroTipp: function(){
        this.buildAd('#naviPageAd','7.php', '7.png');
    },
    setAdGastroTippRestaurantList: function(){
        this.buildAd('#shopGastroListAd','71.php', '71.png');
    },
    setAdGastroTippFruestueckList: function(){
        this.buildAd('#shopGastroListAd','73.php', '73.png');
    },
    setAdGastroTippRestaurantDetail: function(){
         this.buildAd('#adDetailPage','72.php', '72.png');
    },
    setAdGastroTippFruestueckDetail: function(){
        this.buildAd('#adDetailPage','74.php', '74.png');
    },
    setAdGastroSearch: function(){
        this.buildAd('#naviPageAd','45.php','45.png');
    },
    setAdGastroSubPage: function(){
        this.buildAd('#naviPageAd','44.php','44.png');
    },
    setAdVerkehr: function(){
        this.buildAd('#naviPageAd','3.php','3.png');
    },
    setAdRadarList: function(){
        this.buildAd('#radarListPageAd','31.php', '31.png');
    },
    setAdRadarReport: function(){
        this.buildAd('#radarReportAd', '32.php', '32.png');
    },
    setAdParkingList: function(){
        this.buildAd('#parkingListAd', '33.php', '33.png');
    },
    setAdTrafficSubPage: function(){
        this.buildAd('#naviPageAd','39.php', '39.png');
    },
    setAdRadarSubPage: function(){
        this.buildAd('#naviPageAd','38.php', '38.png');
    },
    setAdParkingSubPage: function(){
        this.buildAd('#naviPageAd','37.php', '37.png');
    },
    setAdTankenSubPage: function(){
        this.buildAd('#tankenAd','391.php', '391.png');
    },
    setAdMVGSubPage: function(){
        this.buildAd('#naviPageAd','392.php', '392.png');
    },
    setAdTrafficList: function(){
        this.buildAd('#trafficListPageAd','35.php', '35.png');
    },
    setAdTrafficReport: function(){
        this.buildAd('#trafficReportListPageAd', '36.php', '36.png');
    },
    setAdEvent: function(){
        this.buildAd('#naviPageAd', '6.php', '6.png');
    },
    setAdEventList: function(){
        this.buildAd('#eventsListPageAd', '61.php', '61.png');
    },
    setAdEventDetail: function(){
        this.buildAd('#eventsDetailPageAd', '62.php', '62.png');
    },
    setAdSpecial: function(){
         this.buildAd('#naviPageAd', '5.php', '5.png');
    },
    setAdNewsList: function(){
        this.buildAd('#specialListPageAd', '5.php', '5.png');
    },
    setAdNewsDetail: function(){
        this.buildAd('#specialDetailPageAd', '51.php','51.png');
    },
    setAdWeather: function(){
        this.buildAd('#weatherPageAd', '51.php','51.png');
    },
    setAdSehenswert: function(){
        this.buildAd('#naviPageAd', '1.php', '1.png');
    },
    setAdKrichen: function(){
        this.buildAd('#kirchenAd','11.php','11.png');
    },
    setAdMuseen: function(){
        this.buildAd('#museenAd', '12.php', '12.png');
    },
    setAdRoemischMainz: function(){
        this.buildAd('#roemischesMainzAd','13.php','13.png');
    },
    setAdAltstadt: function(){
        this.buildAd('#altstadtAd','14.php', '14.png');
    },
    setAdDetailSights: function(index){
        
        var pic = '';
        var php = '';
        
        switch(index){
            case 0:
                //Kirche
                pic = '11.png';
                php = '11.php';
                break;
            case 1:
                //Museen
                pic = '12.png';
                php = '12.php';
                break;
            case 2:
                //Römisch Mainz
                pic = '13.png';
                php = '13.php';
                break;
            case 3:
                //Altstadt
                pic = '14.png';
                php = '14.php';
                break;
            default:
                //Stadtführung
                pic = '15.png';
                php = '15.php';
                break;
                
        }
        
        this.buildAd('#detaiSightsAd', php, pic);
    },
    setAdOnMap: function(id){
        var pic = '';
        var php = '';
        
        if(id == 'shop'){
            //Shop
            pic = '22.png';
            php = '22.php';
        }
        else if(id == 'gastro'){
            //Gastro
            pic = '42.png';
            php = '42.php';
        }
        else if(id == 'parkhausListe'){
            //parkausliste
            pic = '33.png';
            php = '33.php';
        }
        else if(id == 'parkhaeuser'){
            //parkhäuser Map
            pic = '34.png';
            php = '34.php';
        }
        else{
            pic = '';
            php = '';
        }
        
        this.buildAd('#mapPageAd',  php, pic);
    },
}