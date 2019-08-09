$(function() {		
	if( !DESKTOP_NAVIGATOR)
    	document.addEventListener("deviceready", onDeviceReady, false);    
    else
    {    	
    	window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
    }
	
	

	/**********************************************
	 * 
	 *   LOAD PRESENCIA
	 * 
	 ***********************************************/
	function loadPresenciaList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
                   
    	if (DEBUG) console.log("Get presencia list");	
    	// Clear previous content
    	 $('.message').remove(); // borro el missatge d'error
    	$("#emotiva_presencia_list li").remove(); // borro lo anterior
    			               		 
	  
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas		
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'emotiva',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_presencia" }
        }, 				    		
            function(data) {  
	    	if (DEBUG) console.log("respuesta de get presencia list recibida");		           
                var emptyData = true;

                $.each(data, function (){
                    emptyData = false;  
                    icon="out";
                    if(this.tipus=="entrada")
                    	icon="in";
                    
                    var htmlitem='<li class="item_list"><img class="ui-li-icon"  border="0" src="img/'+icon+'.png" />'+this.hora+':'+this.minuts+'</li>';
                    $("#emotiva_presencia_list").append(htmlitem);
                });                   

                $("#emotiva_presencia_list").listview("refresh");	
                	

                //Possem el missatge de no hi ha events si cal 
                if(emptyData)
                {
                    var htmlitem='<div class="message">No hi ha entrades de pres&egrave;ncia registrades</div>';
                    $("#emotiva_presencia_list").parent().parent().append(htmlitem);
                }
                $('#loading').hide();            		
            },
              'json' ).error(function(a) { 
            	  $('#loading').hide();
            	  if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
                 	 doAlert($._('error_no_connection'));
                  else
                 	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
            	  // vuelvo a la home
 	        	 $.mobile.changePage('#home');
            	 });			
	}	
	/**********************************************
	 * 
	 *   LOAD WIFI
	 * 
	 ***********************************************/
	function loadWifi(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
                   
    	if (DEBUG) console.log("Get info wifi");	
    	// Clear previous content
    	 $('.message').remove(); // borro el missatge d'error
    	$("#login_wifi").html(); // borro lo anterior
    	$("#password_wifi").html(); // borro lo anterior
    			               		 
	  
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas		
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'emotiva',
            data   : {"call":"get_wifi" }
        }, 				    		
            function(data) {  
	    		if (DEBUG) console.log("respuesta de get wifi recibida");		           
                var emptyData = true;
            
                $("#login_wifi").html(data.login);
                $("#password_wifi").html(data.password);
            
                $('#loading').hide();            		
            },
              'json' ).error(function(a) { 
            	  $('#loading').hide();
            	  if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
                 	 doAlert($._('error_no_connection'));
                  else
                 	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
            	  // vuelvo a la home
 	        	 $.mobile.changePage('#home');
            	 });			
	}	
	/**********************************************
	 * 
	 *   LOAD AULES
	 * 
	 ***********************************************/
	function loadAulesList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
                   
    	if (DEBUG) console.log("Get aules  list");	
    	// Clear previous content
    	 $('.message').remove(); // borro el missatge d'error
    	$("#emotiva_aules_list li").remove(); // borro lo anterior
    			               		 
	  
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas	
    	var edifici='TTC';
        if($("#emotiva_aules #ubicacio_TR12:checked").length>0)
         	edifici='TR12';
        if (DEBUG) console.log("EDIFICI LLISTAT="+edifici);		
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'emotiva',
            data   : {"data":$('#emotiva_aules_data').val(),"ubicacio":edifici,"call":"get_list_aules" }
        }, 				    		
            function(data) {  
	    	if (DEBUG) console.log("respuesta de get aules list recibida");		           
                var emptyData = true;
                var plantaAnterior="XX";

                $.each(data, function (){
                    emptyData = false;                        
                    if(plantaAnterior!=this.planta)
                    {
                    	plantaAnterior=this.planta;
                    	var htmlitem='<li data-role="list-divider" class="my_list_divider"  ><span>Planta '+this.planta+'</span></li>';
                    	 $("#emotiva_aules_list").append(htmlitem);
                    }
                    var htmlitem='<li class="item_list">Aula: '+this.nom_aula+' - '+this.hora+'<br>'+this.nom_activitat+'</li>';
                   
                    $("#emotiva_aules_list").append(htmlitem);
                });                   

                $("#emotiva_aules_list").listview("refresh");	
                	

                //Possem el missatge de no hi ha events si cal 
                if(emptyData)
                {
                    var htmlitem='<div class="message">No hi ha reserves</div>';
                    $("#emotiva_aules_list").parent().parent().append(htmlitem);
                }
                $('#loading').hide();            		
            },
              'json' ).error(function(a) { 
            	  $('#loading').hide();
            	  if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
                 	 doAlert($._('error_no_connection'));
                  else
                 	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
            	  // vuelvo a la home
 	        	 $.mobile.changePage('#home');
            	 });			
	}
	/**********************************************
	 * 
	 *   LOAD DATES
	 * 
	 ***********************************************/
	function loadDatesList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
                   
    	if (DEBUG) console.log("Get dates  list");	
    	// Clear previous content
    	 $('.message').remove(); // borro el missatge d'error
    	$("#emotiva_aules_data option").remove(); // borro lo anterior
    			               		 
	  
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas	
    	var edifici='TTC';
        if($("#emotiva_aules #ubicacio_TR12:checked").length>0)
         	edifici='TR12';
        if (DEBUG) console.log("EDIFICI DATES="+edifici);		  
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'emotiva',
            data   : {"ubicacio":edifici,"mostrar_dates_anteriors":"1","call":"get_dates_aules" }
        }, 				    		
            function(data) {  
	    	if (DEBUG) console.log("respuesta de get dates aules recibida");		           
                var emptyData = true;
                var d=new Date();
                var dia=("0"+d.getDate()).slice(-2); // esto es para ponerle un 0 delante
                var mes=("0"+(d.getMonth()+1)).slice(-2);
                var any=d.getFullYear();
                var hoy=dia+"-"+mes+"-"+any;
                if (DEBUG) console.log("hoy="+hoy);	
                $.each(data, function (){
                    emptyData = false;  
                    var selected="";
                    if(this==hoy )
                    	selected=" selected ";
                    var htmlitem='<option value="'+this+'" '+selected+'>'+this+'</option>';
                    if (DEBUG) console.log("a–ado option "+htmlitem);	
                    $("#emotiva_aules_data").append(htmlitem);
                });                   

                $("#emotiva_aules_data").selectmenu("refresh");	
                	

                //Possem el missatge de no hi ha events si cal 
                if(emptyData)
                {
                    var htmlitem='<div class="message">No hi ha reserves</div>';
                    $("#emotiva_aules_data").parent().parent().append(htmlitem);
                }
                $('#loading').hide();            		
            },
              'json' ).error(function(a) { 
            	  $('#loading').hide();
            	  if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
                 	 doAlert($._('error_no_connection'));
                  else
                 	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
            	  // vuelvo a la home
 	        	 $.mobile.changePage('#home');
            	 });			
	}
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/	
    function onDeviceReady() {   
    	/* SI ESTOY EN ALGUNA PçGINA DE EMOTIVA Y HAGO LOGOUT ME VOY A LA HOME*/
       $('.emotiva_page').on('pagebeforeshow',function(e) {
    	   if (DEBUG) console.log("beforeshow pagina emotiva");	
    	   if(localStorage.getItem('id_usuari')==null)
			{
				  if (DEBUG) console.log("Reenvio a la home--> no validado");		
				$.mobile.changePage('#home',{transition:'none'});
			}  
       });
       
	   $('#emotiva_presencia').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE Pï¿½GINA 
			if (DEBUG) console.log(this.id+" "+e.type);		
			loadPresenciaList(e); // Load validation list						   	   							   		    	          	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });
	   
	   $('#emotiva_wifi').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE Pï¿½GINA 
			if (DEBUG) console.log(this.id+" "+e.type);					
			loadWifi(e); // Load Wifi						   	   							   		    	          	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });  
	   
	   $('#emotiva_aules').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE Pï¿½GINA 
			if (DEBUG) console.log(this.id+" "+e.type);	
			if(DEBUG) console.log("ubicacio usuari="+localStorage.getItem('intranet_ubicacio'));
			if($("#emotiva_aules .emotiva_ubicacio:checked").length==0)
			{
				if(localStorage.getItem('intranet_ubicacio')==2)// TR12
					$("#emotiva_aules #ubicacio_TR12").attr("checked",true).checkboxradio("refresh");
				else
					$("#emotiva_aules #ubicacio_TTC").attr("checked",true).checkboxradio("refresh");
			}
			loadDatesList(e);
			loadAulesList(e); // Load aules list						   	   							   		    	          	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });  
	   
	   
	   $('#emotiva_aules').on('change','.emotiva_ubicacio', function(event) { // si pongo tap no funciona				
			 if (DEBUG) console.log("RELOAD aula list canvi ubicacio");
			 loadDatesList(event);
			 loadAulesList(event);
			//event.stopPropagation();
		});
	   $('#emotiva_aules').on('change','#emotiva_aules_data', function(event) { // si pongo tap no funciona				
			 if (DEBUG) console.log("RELOAD aula list canvi data");
			 loadAulesList(event);
			//event.stopPropagation();
		});
	   
       
    }
});		