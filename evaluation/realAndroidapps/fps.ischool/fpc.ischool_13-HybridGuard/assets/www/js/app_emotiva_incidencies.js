$(function() {		
	if( !DESKTOP_NAVIGATOR)
    	document.addEventListener("deviceready", onDeviceReady, false);    
    else
    {    	
    	window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
    }
	function uploadFromCamera()
	{
		if (DEBUG) console.log("tomo foto de camara");
			 
			 navigator.camera.getPicture(uploadPhoto,
	    function(message) { console.log("error al tomar foto de camara"); },
	    { 
	     allowEdit:false, 	
	   	 quality: 50, 
	   	 correctOrientation:true,
	   	 destinationType: navigator.camera.DestinationType.FILE_URI 
	   	 }
	    );
	}	
	function uploadFromGallery()
	{
		if (DEBUG) console.log("tomo foto de galeria");
			 
			 navigator.camera.getPicture(uploadPhoto,
	    function(message) { console.log("error al tomar foto de galeria"); },
	    { 
	     allowEdit:false, 	
	   	 quality: 50, 
	   	 correctOrientation:true,
	   	 destinationType: navigator.camera.DestinationType.FILE_URI 
	   	 ,sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY 
	   	 ,mediaType: navigator.camera.MediaType.ALLMEDIA
	   	 }
	    );
	}	
	function uploadPhoto(imageURI) {
		if (DEBUG) console.log("scroll top al subir imagen");
		$.mobile.silentScroll();// scroll top
		if (DEBUG) console.log("despues scroll top al subir imagen");
		$('#loading').show();
		 if (DEBUG) console.log("voy a subir foto con upload Photo uri="+imageURI);
        var options = new FileUploadOptions();
        options.fileKey="file";
       /* var fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
        var extension=fileName.split(".").pop();
        if(extension.toUpperCase()!="JPG" && extension.toUpperCase()!="JPEG")
        	fileName=fileName+".jpg";// en android no le a–ade la extensi—n
        */
        // pongo el nombre a mano
        options.fileName="fotoApp_"+localStorage.getItem('login')+".jpg";
        options.mimeType="text/plain";

        var params ={};
        if(DEBUG) console.log("pagina actual="+$(".ui-page-active").attr("id"))
        if($(".ui-page-active").attr("id")=="emotiva_validacionsdetail")
        {
        	params.id_incidencia=localStorage.getItem('id_validacio_actual');
        	if (DEBUG) console.log("Subo foto desde validaciones con id "+params.id_incidencia);
        }	
        else
        {
        	params.id_incidencia=localStorage.getItem('id_eticket_actual');
        	if (DEBUG) console.log("Subo foto desde etickets con id "+params.id_incidencia);
        }
        params.id_usuari=localStorage.getItem('id_usuari');
        options.params = params;

        var ft = new FileTransfer();
        ft.upload(imageURI, encodeURI(URLUPLOADFILE), win, fail, options);
    }

    function win(r) {
    	$('#loading').hide();
    	if (DEBUG) console.log("Code = " + r.responseCode);
    	if (DEBUG) console.log("Response = " + r.response);
    	if (DEBUG) console.log("Sent = " + r.bytesSent);
    	if($(".ui-page-active").attr("id")=="emotiva_validacionsdetail")
    	{
    		loadValidacio(localStorage.getItem('id_validacio_actual')); // Load event detail
    		localStorage.setItem('last_reload_emotiva_validacions',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
    	
    	}	
    	else
    	{
    		loadEticket(localStorage.getItem('id_eticket_actual')); // Load event detail
        	localStorage.setItem('last_reload_emotiva_etickets',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
    	}
    	doAlert("eTicket actualitzat correctament");
    }

    function fail(error) {
    	$('#loading').hide();
    	doAlert("Error: Code = " + error.code);
    	if (DEBUG) console.log("upload error source " + error.source);
    	if (DEBUG) console.log("upload error target " + error.target);
    }
   
    /**********************************************
	 * 
	 *   RESETEAMOS LOS DATOS DEL FORMULARIO DE NUEVO ETICKET
	 * 
	 ***********************************************/
    function resetDadesNouEticket()
    {
    	$("#emotiva_noueticket .block_form").hide();
    	$("#emotiva_noueticket .block_tipus").hide();
    	$('#emotiva_noueticket #departament option').not(".placeholder").remove();
    	$('#emotiva_noueticket #tipus option').not(".placeholder").remove();
    	
    	$('#emotiva_noueticket .emotiva_categoria').prop('checked', false).checkboxradio('refresh');
    	$('#emotiva_noueticket .emotiva_categoria').first().prop('checked',true).checkboxradio('refresh');
    	
    	$('#emotiva_noueticket .emotiva_prioritat').prop('checked', false).checkboxradio('refresh');
    	$('#emotiva_noueticket .emotiva_prioritat').first().prop('checked',true).checkboxradio('refresh');
    	
    	$('#emotiva_noueticket .emotiva_categoria').prop('checked', false).checkboxradio('refresh');
    	$('#emotiva_noueticket .emotiva_categoria').first().prop('checked',true).checkboxradio('refresh');
    	
    	$("#emotiva_noueticket #titol").val("" );
    	$("#emotiva_noueticket #text").val("" );
    	
    }
    /**********************************************
	 * 
	 *   INICIALIZO TIPOS
	 * 
	 ***********************************************/
    function loadTipusEticket(id_departament,ubicacio)
    {
    	if(id_departament==-1)
    	{
    		$("#emotiva_noueticket .block_form").hide();
        	$("#emotiva_noueticket .block_tipus").hide();
        	$('#loading').hide();
    		return;
    	}	
    	if (DEBUG) console.log("Obtengo tipus de departament"+ id_departament+ " i ubicacio "+ubicacio);	
    	$("#emotiva_noueticket .block_form").hide();
    	$('#emotiva_noueticket #tipus option').not(".placeholder").remove();// primero los borro
    	
		var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
		 $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_tipus_etickets","id_departament":id_departament,"ubicacio":ubicacio }
        }, 	
         function(data) {     
   		 if (DEBUG) console.log("Retorno Post get tipus eticket");   		  						   			
            
            $.each(data.llistat_tipus, function (){
            	var htmlitem='<option value="'+this.id+'" class="option_tipus departament'+this.id_departament+'">'+this.nom+'</option>';
            	$("#emotiva_noueticket #tipus").append(htmlitem);
            });
          
            $('#emotiva_noueticket #tipus').selectmenu('refresh' ); 
            $("#emotiva_noueticket .block_tipus").show();
            $('#loading').hide();
         },
         'json' ).error(function(a) { 
        	 $('#loading').hide();
             if(a.status==0) // Si detecta que no hay conexiï¿½n activa 
            	 doAlert($._('error_no_connection'));
             else
            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
             // vuelvo al listado  
        	 $.mobile.changePage('#emotiva_etickets');
            });	
    }
    /**********************************************
	 * 
	 *   INICIALIZAMOS LOS DATOS DEL FORMULARIO DE NUEVO ETICKET
	 * 
	 ***********************************************/
    function loadDadesNouEticket(ubicacio)
    {
    	if (DEBUG) console.log("Get dades nou eticket ");	
    	resetDadesNouEticket();
		
    	
		var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
		 $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_departaments_etickets","ubicacio":ubicacio }
        }, 	
         function(data) {     
   		 if (DEBUG) console.log("Retorno Post get departaments eticket");   		  						   			
   			   			   			
            $.each(data.llistat_departaments, function (){
            	var htmlitem='<option value="'+this.id+'">'+this.nom+'</option>';
            	$("#emotiva_noueticket #departament").append(htmlitem);
            });
            $('#emotiva_noueticket #departament').selectmenu('refresh', true ); 
            $('#loading').hide();
         },
         'json' ).error(function(a) { 
        	 $('#loading').hide();
             if(a.status==0) // Si detecta que no hay conexiï¿½n activa 
            	 doAlert($._('error_no_connection'));
             else
            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
             // vuelvo al listado  
        	 $.mobile.changePage('#emotiva_etickets');
            });	
    }
    
    /**********************************************
	 * 
	 *  ENVIAMOS DATOS DE NUEVO ETICKET
	 * 
	 ***********************************************/
	function sendFormNouEticket()
	{
		
	    if (DEBUG) console.log("Post nou eticket");	    	  	 
	    var text;
	    if($("#emotiva_noueticket #titol").val()=='')
	    {
	    	doAlert("Has d'indicar el t’tol del eTicket");
	    }
	    if($("#emotiva_noueticket #text").val()=='')
	    {
	    	doAlert("Has d'indicar el text del eTicket");
	    }
	    
	    //Cambiamos nl2br
    	text = $("#emotiva_noueticket #text").val();	    		    
    	while (text.toString().indexOf( "\n" ) != -1)
    		text = text.toString().replace( "\n", "<br>");
    	
    	text = '<p>' + text + '</p>';
	  
	   
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),
	    			  "call":"nou_eticket",
	    			  "titol":$("#emotiva_noueticket #titol").val(),
	    			  "tipus": $("#emotiva_noueticket #tipus").val(),
	    			  "prioritat":$("#emotiva_noueticket .emotiva_prioritat:checked").val(),
	    			  "categoria":$("#emotiva_noueticket .emotiva_categoria:checked").val(),
	    			  "text":text
	    		     }
        },	   
        function(data) {     
        	if(data)
        	{        
        		 if (DEBUG) console.log("Eticket Creat amb id "+data.id_incidencia);	 
        		doAlert("eTicket creat correctament");
        		localStorage.setItem('id_eticket_click',data.id_incidencia);
        		localStorage.setItem('last_reload_emotiva_etickets',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
        		$.mobile.changePage('#emotiva_eticketsdetail');
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}
	/**********************************************
	 * 
	 *   ENVIAMOS LOS DATOS DEL FORMULARIO DE ETICKET YA CREADO
	 * 
	 ***********************************************/
	function sendFormEticket()
	{
		
	    if (DEBUG) console.log("Post etickets");	    	  	 
	    var missatge;
	    	   
	    
	    //Cambiamos nl2br en EL MENSAJEsi es necesario
	    if($("#emotiva_eticketsdetail #nou_missatge").val()!='')
	    {
	    	missatge = $("#emotiva_eticketsdetail #nou_missatge").val();	    		    
	    	while (missatge.toString().indexOf( "\n" ) != -1)
	    		missatge = missatge.toString().replace( "\n", "<br>");
	    	
	    	missatge = '<p>' + missatge + '</p>';
	    }
	    else
	    	missatge = '';
	   
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),
	    			  "call":"set_incidencia_eticket",
	    			  "id_incidencia":localStorage.getItem('id_eticket_actual'),
	    			  "missatge":missatge
	    		     }
        },	   
        function(data) {     
        	if(data)
        	{        		
        		loadEticket(localStorage.getItem('id_eticket_actual')); // Load event detail
        		localStorage.setItem('last_reload_emotiva_etickets',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
        		doAlert("eTicket actualitzat correctament");
        		
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}
	/**********************************************
	 * 
	 *   REOBRIR ETICKET
	 * 
	 ***********************************************/
	function reobrirEticket()
	{
		
	    if (DEBUG) console.log("Reobrir etickets");	    	  	 
	    
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),
	    			  "call":"reobre_eticket",
	    			  "id_incidencia":localStorage.getItem('id_eticket_actual')
	    		     }
        },	   
        function(data) {     
        	if(data)
        	{        		
        		loadEticket(localStorage.getItem('id_eticket_actual')); // Load event detail
        		localStorage.setItem('last_reload_emotiva_etickets',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
        		doAlert("eTicket actualitzat correctament");
        		
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}
	/**********************************************
	 * 
	 *   ENVIAMOS LOS DATOS DEL FORMULARIO DE VALIDACION
	 * 
	 ***********************************************/
	function sendForm(copia_validadors)
	{
		
	    if (DEBUG) console.log("Post validacio copia validadors="+copia_validadors);	    	  	 
	    var missatge;
	    	   
	    
	    //Cambiamos nl2br en el mensaje si es necesario
	    if($("#emotiva_validacionsdetail #nou_missatge").val()!='')
	    {
	    	missatge = $("#emotiva_validacionsdetail #nou_missatge").val();	    		    
	    	while (missatge.toString().indexOf( "\n" ) != -1)
	    		missatge = missatge.toString().replace( "\n", "<br>");
	    	
	    	missatge = '<p>' + missatge + '</p>';
	    }
	    else
	    	missatge = '';
	   
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),
	    			  "call":"set_incidencia",
	    			  "id_incidencia":localStorage.getItem('id_validacio_actual'),
	    			  "hores":$("#emotiva_validacionsdetail #hores").val(),
	    			  "minuts":$("#emotiva_validacionsdetail #minuts").val(),
	    			  "estat":$("#emotiva_validacionsdetail #estat").val(),
	    			  "tipus":$("#emotiva_validacionsdetail #tipus").val(),
	    			  "missatge":missatge,
	    			  "copia_validadors":copia_validadors
	    		     }
        },	   
        function(data) {     
        	if(data)
        	{        		
        		loadValidacio(localStorage.getItem('id_validacio_actual')); // Load event detail
        		localStorage.setItem('last_reload_emotiva_validacions',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
        		doAlert("eTicket actualitzat correctament");
        		
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}
	/**********************************************
	 * 
	 *   Set / unset validadors
	 * 
	 ***********************************************/
	function changeValidadors(action)
	{
		
	    if (DEBUG) console.log("change validadors accio="+action);	    	  	 
	    if(action=="set")
	    	call="set_propietari";
	    else
	    	call="unset_propietari"
	   
    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
	    $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),
	    			  "call":call,
	    			  "id_incidencia":localStorage.getItem('id_validacio_actual')
	    		     }
        },	   
        function(data) {     
        	if(data || data==0)
        	{        		
        		loadValidacio(localStorage.getItem('id_validacio_actual')); // Load event detail
        		localStorage.setItem('last_reload_emotiva_validacions',0); // FUERZO QUE AL VOLVER RECARGE EL LISTADO DE NUEVO, YA QUE PUEDO HABER FINALIZADO EL TICKET
        		//doAlert("eTicket actualitzat correctament");
        		
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexiï¿½n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}
	/**********************************************
	 * 
	 *   LOAD ETICKET LIST
	 * 
	 ***********************************************/
	function loadEticketList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
        interval_reload_emotiva_etickets=timestamp_actual-localStorage.getItem('last_reload_emotiva_etickets');
        if (DEBUG) console.log("interval reload="+interval_reload_emotiva_etickets+">"+MAX_INTERVAL_RELOAD_ETICKETS);
        if(interval_reload_emotiva_etickets>MAX_INTERVAL_RELOAD_ETICKETS)        
        {	            
        	if (DEBUG) console.log("Get etickets list");	
        	// Clear previous content
            $('.message').remove(); // borro el missatge
        	$('#emotiva_eticketscontent .item_list').remove(); // borro el listado                           
                     
	    	if (DEBUG) console.log("Reload etickets list");		    		               		 
		  
	    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas		
		    $.post(URLAPICAMPUS+"?v="+aleatorio, 
            {    
                service : 'incidencia_validacions',
                data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_etickets_list" }
            }, 				    		
                function(data) {  
		    	if (DEBUG) console.log("respuesta de get etickets list recibida");		
                    localStorage.setItem('last_reload_emotiva_etickets',timestamp_actual);                    
                    var emptyData = true;

                    $.each(data, function (){
                        emptyData = false;                        
                        var d=new Date(this.data.substr(0,4),(this.data.substr(5,2)-1),this.data.substr(8,2));
                        var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                        var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
                        var str_data=day_two_chrs+"/"+ month_two_chrs +"/"+d.getFullYear()+" "+this.data.substr(11,5);
                        var urgent_css="";
                        var urgent_icon="";
                        var css_propietari="sense_propietari";// utilizo el mismo css que el de sin propietario           
                        	
                        if(this.prioritat==3)
                        {
                        	urgent_css=" urgent_list ";
                        	urgent_icon='<span class="ui-icon ui-icon-alert ui-icon-shadow " style="left:10px !important;">&nbsp;</span>';
                        }
                        
                        var htmlitem='<li class="item_list '+css_propietari+urgent_css+'">'+urgent_icon+'<a href="#emotiva_eticketsdetail" class="eticketitemlink" id="'+this.id+'"><span class="list_info_small">#'+this.id+" "+str_data+" ("+this.nom_estat+")</span><br>"+this.titol+'</a></li>';
                        $("#emotiva_eticketscontent").append(htmlitem);
                    });                   

                    $("#emotiva_eticketscontent").listview("refresh");	
                    	

                    //Possem el missatge de no hi ha events si cal 
                    if(emptyData)
                    {
                        var htmlitem='<div class="message">No hi ha eTickets</div>';
                        $("#emotiva_eticketscontent").parent().parent().append(htmlitem);
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
        else
   		{
        	$('#loading').hide();
   			if (DEBUG) console.log("Event list cached");	
   		}
	}	
	/**********************************************
	 * 
	 *   LOAD ETICKET DETAIL
	 * 
	 ***********************************************/
	function loadEticket(id)
	{		
		if (DEBUG) console.log("Get eticket "+ id);	
		$('#emotiva_eticketsdetail .item_info').html(''); // borro el item individual
		$("#emotiva_eticketsdetail #nou_missatge").val("" ); // vacio el text area
		var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
		 $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_incidencia","id_incidencia":id }
        }, 	
         function(data) {     
   		 if (DEBUG) console.log("Retorno Post eTicket");   		 	
   			localStorage.setItem('id_eticket_actual',id);// guardo el item actual   						   			
   			   			   			
			$('#emotiva_eticketsdetail #title').html(data.titol);	 				
			$('#emotiva_eticketsdetail #id').html(data.id);			 			 
            var d = new Date(data.data.substr(0,4), (data.data.substr(5,2)-1), data.data.substr(8,2));
            var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
            var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
			var str_data       = day_two_chrs + "/" + month_two_chrs + "/" + d.getFullYear()+" "+data.data.substr(11,5);											
            $('#emotiva_eticketsdetail #data').html(str_data);
            var telefons="";
            if(data.telefon_propietari_fix!="")
            		telefons=telefons+data.telefon_propietari_fix;
            if(data.telefon_propietari_movil!="")
            {
            	 if(data.telefon_propietari_fix!="")
            		 telefons=telefons + " / "
            	telefons=telefons+data.telefon_propietari_fix;
            }
            $('#emotiva_eticketsdetail #usuari').html(data.nom_propietari+" "+telefons);
            $('#emotiva_eticketsdetail #tipus').html(data.tipus);
            $('#emotiva_eticketsdetail #estat .nom_estat').html(data.nom_estat);
            if (DEBUG) console.log("Pot reobrir="+data.pot_reobrir);   
            if(data.pot_reobrir==1)
            	 $('#emotiva_eticketsdetail  #reobrir_button').parent().show();
            else
            	 $('#emotiva_eticketsdetail  #reobrir_button').parent().hide();
            var algun_validador=false;
            $("#emotiva_eticketsdetail #validadors").html();// primero lo borro
            $.each(data.propietaris, function (){
            	algun_validador=true;
            	var htmlitem=this.nom+'</br>';
            	$("#emotiva_eticketsdetail #validadors").append(htmlitem);
            });
            if(!algun_validador)
            	$("#emotiva_eticketsdetail #validadors").append("No assignats");
            
            var algun_file=false;
            $.each(data.files, function (){
            	algun_file=true;
            	var htmlitem='<li class="file_list"><a target="_blank" href="'+this.link+'">'+this.nom+'</a> ('+this.data+') '+this.tamany+'</li>';
            	$("#emotiva_eticketsdetail #files").append(htmlitem);
            });
            /*if(algun_file)
            	$("#emotiva_eticketsdetail #files_contanier").show();
            else
            	$("#emotiva_eticketsdetail #files_contanier").hide();*/
            	            
            
            $('#emotiva_eticketsdetail #description').html(addLinksTargetBlank(data.text));	
                      
            $.each(data.mensajes, function (){      
            	
            	d = new Date(this.data.substr(0,4), (this.data.substr(5,2)-1), this.data.substr(8,2));
            	day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
     			str_data       = day_two_chrs + "/" + month_two_chrs + "/" + d.getFullYear()+" "+this.data.substr(11,5);	
            	
            	var htmlitem='<p><strong>('+str_data+') '+this.nom_propietari+' ha dit:</strong></p><div>'+this.text+'</div>';
            	$("#emotiva_eticketsdetail #missatges").append(htmlitem);
            });
            if(data.estat==3 || data.estat==4) // si es cancelat o realitzat
            {
            	$("#emotiva_eticketsdetail #nou_missatge").hide();
            	$("#emotiva_eticketsdetail #nou_missatge_title").hide();
            	$("#emotiva_eticketsdetail .botons_enviar_etickets_incidencia").hide();
            	$("#emotiva_eticketsdetail .add_file").hide();
            }
            else
            {
            	$("#emotiva_eticketsdetail #nou_missatge").show();
            	$("#emotiva_eticketsdetail #nou_missatge_title").show();
            	$("#emotiva_eticketsdetail .botons_enviar_etickets_incidencia").show();
            	$("#emotiva_eticketsdetail .add_file").show();
            }
            
			 if (DEBUG) console.log("Eticket llenado");
			$('#loading').hide();
			 if (DEBUG) console.log("loading  hide");
			 			
			
			 
			 $('#emotiva_eticketsdetail .ui-content').fadeIn("fast", function () {
				//$('#emotiva_validacionsdetail .ui-content').iscrollview("resizeWrapper");
				//$('#emotiva_validacionsdetail .ui-content').iscrollview("refresh");  	  				 
	  		    //if (DEBUG) console.log("refresh scrollview");							
	  	      });
    		 if (DEBUG) console.log("Eticket fade in");
    		if (DEBUG) console.log("eTicket show");
         },
         'json' ).error(function(a) { 
        	 $('#loading').hide();
             if(a.status==0) // Si detecta que no hay conexiï¿½n activa 
            	 doAlert($._('error_no_connection'));
             else
            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
             // vuelvo al listado  
        	 $.mobile.changePage('#emotiva_etickets');
            });		      		
	}	
	/**********************************************
	 * 
	 *   LOAD VALIDATION LIST
	 * 
	 ***********************************************/
	function loadValidationList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
        interval_reload_emotiva_validacions=timestamp_actual-localStorage.getItem('last_reload_emotiva_validacions');
        if (DEBUG) console.log("interval reload="+interval_reload_emotiva_validacions+">"+MAX_INTERVAL_RELOAD_VALIDACIONS);
        if(interval_reload_emotiva_validacions>MAX_INTERVAL_RELOAD_VALIDACIONS)        
        {	            
        	if (DEBUG) console.log("Get validation list");	
        	// Clear previous content
            $('.message').remove(); // borro el missatge
        	$('#emotiva_validacionscontent .item_list').remove(); // borro el listado                           
                     
	    	if (DEBUG) console.log("Reload validation list");		    		               		 
		  
	    	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas		
		    $.post(URLAPICAMPUS+"?v="+aleatorio, 
            {    
                service : 'incidencia_validacions',
                data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_validation_list" }
            }, 				    		
                function(data) {  
		    	if (DEBUG) console.log("respuesta de get validation list recibida");		
                    localStorage.setItem('last_reload_emotiva_validacions',timestamp_actual);                    
                    var emptyData = true;

                    $.each(data, function (){
                        emptyData = false;                        
                        var d=new Date(this.data.substr(0,4),(this.data.substr(5,2)-1),this.data.substr(8,2));
                        var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                        var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
                        var str_data=day_two_chrs+"/"+ month_two_chrs +"/"+d.getFullYear()+" "+this.data.substr(11,5);
                        var urgent_css="";
                        var urgent_icon="";
                        var css_propietari="sense_propietari";
                        if(this.soc_propietari==1)	
                        	css_propietari=" soc_propietari ";
                        else if(this.te_propietari==1)	
                        	css_propietari=" te_propietari ";
                        	
                        if(this.prioritat==3)
                        {
                        	urgent_css=" urgent_list ";
                        	urgent_icon='<span class="ui-icon ui-icon-alert ui-icon-shadow " style="left:10px !important;">&nbsp;</span>';
                        }
                        
                        var htmlitem='<li class="item_list '+css_propietari+urgent_css+'">'+urgent_icon+'<a href="#emotiva_validacionsdetail" class="validacioitemlink" id="'+this.id+'"><span class="list_info_small">#'+this.id+" "+str_data+" ("+this.login_propietari+")</span><br>"+this.titol+'</a></li>';
                        $("#emotiva_validacionscontent").append(htmlitem);
                    });                   

                    $("#emotiva_validacionscontent").listview("refresh");	
                    	

                    //Possem el missatge de no hi ha events si cal 
                    if(emptyData)
                    {
                        var htmlitem='<div class="message">No hi ha eTickets</div>';
                        $("#emotiva_validacionscontent").parent().parent().append(htmlitem);
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
        else
   		{
        	$('#loading').hide();
   			if (DEBUG) console.log("Event list cached");	
   		}
	}	
	
	/**********************************************
	 * 
	 *   LOAD VALIDACIO DETAIL
	 * 
	 ***********************************************/
	function loadValidacio(id)
	{		
		if (DEBUG) console.log("Get validacio "+ id);	
		$('#emotiva_validacionsdetail .item_info').html(''); // borro el item individual
		$("#emotiva_validacionsdetail #nou_missatge").val("" ); // vacio el text area
		var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cachï¿½ de llamadas
		 $.post(URLAPICAMPUS+"?v="+aleatorio, 
        {    
            service : 'incidencia_validacions',
            data   : {"id_usuari":localStorage.getItem('id_usuari'),"call":"get_incidencia","id_incidencia":id }
        }, 	
         function(data) {     
   		 if (DEBUG) console.log("Retorno Post Validacio");   		 	
   			localStorage.setItem('id_validacio_actual',id);// guardo el item actual   						   			
   			   			   			
			$('#emotiva_validacionsdetail #title').html(data.titol);	 				
			$('#emotiva_validacionsdetail #id').html(data.id);			 			 
            var d = new Date(data.data.substr(0,4), (data.data.substr(5,2)-1), data.data.substr(8,2));
            var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
            var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
			var str_data       = day_two_chrs + "/" + month_two_chrs + "/" + d.getFullYear()+" "+data.data.substr(11,5);											
            $('#emotiva_validacionsdetail #data').html(str_data);
            var telefons="";
            if(data.telefon_propietari_fix!="")
            		telefons=telefons+data.telefon_propietari_fix;
            if(data.telefon_propietari_movil!="")
            {
            	 if(data.telefon_propietari_fix!="")
            		 telefons=telefons + " / "
            	telefons=telefons+data.telefon_propietari_fix;
            }
            $('#emotiva_validacionsdetail #usuari').html(data.nom_propietari+" "+telefons);
           // $('#emotiva_validacionsdetail #tipus').html(data.tipus);
            // tipus es un select
            $('#emotiva_validacionsdetail #tipus').html();// primero lo borro
            var htmlitem='';
            var nom_departament_actual="";
            var grup_obert=false;
            $.each(data.llistat_tipus, function (){
            	if(this.nom_departament!=nom_departament_actual)
            	{
            		if(grup_obert)
            			htmlitem+="</optgroup>";
            		nom_departament_actual=this.nom_departament;
            		htmlitem+='<optgroup label="'+this.nom_departament+'">';
            		grup_obert=true;
            	}
            	htmlitem+='<option value="'+this.id+'">'+this.nom+'</option>';
            });
            if(grup_obert)
    			htmlitem+="</optgroup>";
            $('#emotiva_validacionsdetail #tipus').append(htmlitem);
            $('#emotiva_validacionsdetail #tipus').val(data.tipus_id);
            $('#emotiva_validacionsdetail #tipus').selectmenu('refresh');
            

            $('#emotiva_validacionsdetail #estat').val(data.estat);
            $('#emotiva_validacionsdetail #estat').selectmenu('refresh');
            $('#emotiva_validacionsdetail #hores').val(data.hores);
            $('#emotiva_validacionsdetail #minuts').val(data.minuts);
            var algun_validador=false;
            var soc_propietari=false;
            $("#emotiva_validacionsdetail #validadors").html();// primero lo borro
            $.each(data.propietaris, function (){
            	algun_validador=true;
            	var htmlitem=this.nom+'</br>';
            	$("#emotiva_validacionsdetail #validadors").append(htmlitem);
            	if(localStorage.getItem('id_usuari')==this.id_usuari)
            		soc_propietari=true;
            });
            if(!algun_validador)
            	$("#emotiva_validacionsdetail #validadors").append("No assignats");
            if(soc_propietari)
            	var htmlitem='<img  border="0" id="unset_validador" src="img/menos.png" >';
            else
            	var htmlitem='<img  border="0" id="set_validador" src="img/mas.png" >';
            $("#emotiva_validacionsdetail #validadors_add").html(htmlitem);
            
            var algun_file=false;
            $.each(data.files, function (){
            	algun_file=true;
            	var htmlitem='<li class="file_list"><a target="_blank" href="'+this.link+'">'+this.nom+'</a> ('+this.data+') '+this.tamany+'</li>';
            	$("#emotiva_validacionsdetail #files").append(htmlitem);
            });
           /* if(algun_file)
            	$("#emotiva_validacionsdetail #files_contanier").show();
            else
            	$("#emotiva_validacionsdetail #files_contanier").hide();*/
            	            
            
            $('#emotiva_validacionsdetail #description').html(addLinksTargetBlank(data.text));	
                      
            $.each(data.mensajes, function (){      
            	
            	d = new Date(this.data.substr(0,4), (this.data.substr(5,2)-1), this.data.substr(8,2));
            	day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
     			str_data       = day_two_chrs + "/" + month_two_chrs + "/" + d.getFullYear()+" "+this.data.substr(11,5);	
            	
            	var htmlitem='<p><strong>('+str_data+') '+this.nom_propietari+' ha dit:</strong></p><div>'+this.text+'</div>';
            	$("#emotiva_validacionsdetail #missatges").append(htmlitem);
            });
            if(data.estat==3 || data.estat==4) // si es cancelat o realitzat
            {
            	$("#emotiva_validacionsdetail #nou_missatge").hide();
            	$("#emotiva_validacionsdetail #nou_missatge_title").hide();
            	$("#emotiva_validacionsdetail #hores").attr('disabled','disabled');
            	$("#emotiva_validacionsdetail #minuts").attr('disabled','disabled');
            	$("#emotiva_validacionsdetail .botons_enviar_validacio_incidencia").hide();
            	
            }
            else
            {
            	$("#emotiva_validacionsdetail #nou_missatge").show();
            	$("#emotiva_validacionsdetail #nou_missatge_title").show();
            	$("#emotiva_validacionsdetail #hores").removeAttr('disabled');
            	$("#emotiva_validacionsdetail #minuts").removeAttr('disabled');
            	$("#emotiva_validacionsdetail .botons_enviar_validacio_incidencia").show();
            }
            
			 if (DEBUG) console.log("Validacion llenado");
			$('#loading').hide();
			 if (DEBUG) console.log("loading  hide");
			 			
			
			 
			 $('#emotiva_validacionsdetail .ui-content').fadeIn("fast", function () {
				//$('#emotiva_validacionsdetail .ui-content').iscrollview("resizeWrapper");
				//$('#emotiva_validacionsdetail .ui-content').iscrollview("refresh");  	  				 
	  		    //if (DEBUG) console.log("refresh scrollview");							
	  	      });
    		 if (DEBUG) console.log("Validacio fade in");
    		if (DEBUG) console.log("Validacio show");
         },
         'json' ).error(function(a) { 
        	 $('#loading').hide();
             if(a.status==0) // Si detecta que no hay conexiï¿½n activa 
            	 doAlert($._('error_no_connection'));
             else
            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
             // vuelvo al listado de eventos 
        	 $.mobile.changePage('#emotiva_validacions');
            });		      		
	}	
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/	
    function onDeviceReady() {  
    	/**********************************************    	 
    	 *   LISTA ETICKETS
    	 ***********************************************/			
	   $('#emotiva_etickets').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
		   $('#emotiva_eticketscontent').on("click", ".eticketitemlink",function(event) {				   	
				 var id = event.currentTarget.id;	// he cambiado target por este porque a veces falla				
				// if (DEBUG) console.log(event);	   	
				 localStorage.setItem('id_eticket_click',id);	    		
				 event.stopPropagation();
			});	  	 
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE Pï¿½GINA 
			if (DEBUG) console.log(this.id+" "+e.type);					
			loadEticketList(e); // Load eticket list						   	   							   		    	      
	    	$('#eticketdetail .ui-content').hide(); // escondo el contenido del evento 	    	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });
    	/**********************************************    	 
    	 *   LISTA VALIDACIONES
    	 ***********************************************/			
	   $('#emotiva_validacions').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
		   $('#emotiva_validacionscontent').on("click", ".validacioitemlink",function(event) {				   	
				 var id = event.currentTarget.id;	// he cambiado target por este porque a veces falla				
				// if (DEBUG) console.log(event);	   	
				 localStorage.setItem('id_validacio_click',id);	    		
				 event.stopPropagation();
			});	  	 
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE Pï¿½GINA 
			if (DEBUG) console.log(this.id+" "+e.type);					
			loadValidationList(e); // Load validation list						   	   							   		    	      
	    	$('#validationdetail .ui-content').hide(); // escondo el contenido del evento 	    	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });
	   /**********************************************    	 
	    *  ETICKET DETAIL
   	   ***********************************************/
	   
	   $('#emotiva_eticketsdetail').on('pageinit', function(e) { 
	 //Enviamos formulario
			$('#emotiva_eticketsdetail .send_button').click( function(event) {
				sendFormEticket();
			});
			$('#emotiva_eticketsdetail #reobrir_button').click( function(event) {
				reobrirEticket();
			});
			$('#emotiva_eticketsdetail #upload_gallery').click( function(event) {
				uploadFromGallery();
			});
			$('#emotiva_eticketsdetail #upload_camera').click( function(event) {
				uploadFromCamera();
			});
			
			
			
	   }).on('pageshow', function(e) { 	   
		   if (DEBUG) console.log(this.id+" "+e.type);
		   if (DEBUG) console.log("Load ticket id="+localStorage.getItem('id_eticket_click'));		   	
	  		 //if(localStorage.getItem('id_validacio_click')!=localStorage.getItem('id_validacio_actual'))
		   	 if(true)// fuerzo a que al clicar en la incidencia, siempre se carge el ticket, por si alguien la carga en emotiva a la vez
	  		 {	
	  			 $('#loading').show();
	  			 loadEticket(localStorage.getItem('id_eticket_click')); // Load event detail
	  			 
	  		 }	
	  		 else
	  	   	 {	    			  	  			 	  				  			
	  			  $('#emotiva_eticketsdetail .ui-content').fadeIn("fast", function () {
	  				
	  			  });	 
	  	   		  if (DEBUG) console.log("Eticket cached");	
	  	   	 }	
		   	
		   
	   }).on('pagebeforeshow', function(e) { // Si la validación que voy a cargar es diferente lo escondo
		  // if(localStorage.getItem('id_validacio_click')!=localStorage.getItem('id_validacio_actual'))
		   if(true)// fuerzo a que al clicar en la incidencia, siempre se carge la validación, por si alguien la carga en emotiva a la vez
		   {
			   $('#emotiva_eticketsdetail .ui-content').hide();
			   if (DEBUG) console.log("ETICKET DIFERENT AMAGO ACTUAL");	
		   }
	   }).on('pagehide', function(e) {
           if (DEBUG) console.log(this.id+" "+e.type);         
           //$('#loading').hide();
       });
	   /**********************************************    	 
	    *  VALIDACIO DETAIL
   	   ***********************************************/
	   
	   $('#emotiva_validacionsdetail').on('pageinit', function(e) { 
	 //Enviamos formulario
			$('#emotiva_validacionsdetail .send_button').click( function(event) {
				sendForm(0);
			});
			$('#emotiva_validacionsdetail .send_validadors_button').click( function(event) {
				sendForm(1);
			}); 
			$('#emotiva_validacionsdetail').on('click','#set_validador', function(event) {
		   		if (DEBUG) console.log("set validador clicked");
				changeValidadors('set');
			});
			$('#emotiva_validacionsdetail').on('click','#unset_validador', function(event) {
				changeValidadors('unset');
				if (DEBUG) console.log("unset validador clicked");
			});
			$('#emotiva_validacionsdetail #upload_gallery').click( function(event) {
				uploadFromGallery();
			});
			$('#emotiva_validacionsdetail #upload_camera').click( function(event) {
				uploadFromCamera();
			});
			
			
	   }).on('pageshow', function(e) { 	   
		   if (DEBUG) console.log(this.id+" "+e.type);
		   if (DEBUG) console.log("Load ticket id="+localStorage.getItem('id_validacio_click'));		   	
	  		 //if(localStorage.getItem('id_validacio_click')!=localStorage.getItem('id_validacio_actual'))
		   	 if(true)// fuerzo a que al clicar en la incidencia, siempre se carge la validación, por si alguien la carga en emotiva a la vez
	  		 {	
	  			 $('#loading').show();
	  			 //$('#emotiva_validacionsdetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);
	  			 loadValidacio(localStorage.getItem('id_validacio_click')); // Load event detail	 	    			  
	  		 }	
	  		 else
	  	   	 {	    			  	  			 	  				  			
	  			//$('#emotiva_validacionsdetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
	  			  $('#emotiva_validacionsdetail .ui-content').fadeIn("fast", function () {
	  				//$('#emotiva_validacionsdetail .ui-content').iscrollview("resizeWrapper");  
	  				//$('#emotiva_validacionsdetail .ui-content').iscrollview("refresh");
	  				//if (DEBUG) console.log("refresh scrollview");
	  			  });	 
	  	   		  if (DEBUG) console.log("Validacio cached");	
	  	   	 }	
		   	
		   
	   }).on('pagebeforeshow', function(e) { // Si la validación que voy a cargar es diferente lo escondo
		  // if(localStorage.getItem('id_validacio_click')!=localStorage.getItem('id_validacio_actual'))
		   if(true)// fuerzo a que al clicar en la incidencia, siempre se carge la validación, por si alguien la carga en emotiva a la vez
		   {
			   $('#emotiva_validacionsdetail .ui-content').hide();
			   if (DEBUG) console.log("VALIDACIO DIFERENT AMAGO ACTUAL");	
		   }
	   }).on('pagehide', function(e) {
           if (DEBUG) console.log(this.id+" "+e.type);         
           //$('#loading').hide();
       });
	   
	   /**********************************************    	 
	    *  NOU ETICKET
   	   ***********************************************/
	   $('#emotiva_noueticket').on('pageinit', function(e) { 
		 //Enviamos formulario
				$('#emotiva_noueticket .send_button').click( function(event) {
					sendFormNouEticket();
				});
				
				$('#emotiva_noueticket').on('change','.emotiva_ubicacio', function(event) { // si pongo tap no funciona				
					 if (DEBUG) console.log("RELOAD canvi ubicacio");
					 $('#loading').show();
					 var ubicacio=$('#emotiva_noueticket .emotiva_ubicacio:checked').val();
					 loadDadesNouEticket(ubicacio);
					//event.stopPropagation();
				});
				$('#emotiva_noueticket').on('change','#departament', function(event) { 		
					 if (DEBUG) console.log("canvi departament");
					 $('#loading').show();
					 var id_departament=$('#emotiva_noueticket #departament').val();
					 var ubicacio=$('#emotiva_noueticket .emotiva_ubicacio:checked').val();
					 loadTipusEticket(id_departament,ubicacio);
					//event.stopPropagation();
				});
				$('#emotiva_noueticket').on('change','#tipus', function(event) { 		
					 if (DEBUG) console.log("canvi tipus");
					 var tipus=$('#emotiva_noueticket #tipus').val();
					 if(tipus==-1)
						 $("#emotiva_noueticket .block_form").hide();
					 else
						 $("#emotiva_noueticket .block_form").show();
					//event.stopPropagation();
				});
				
				
		   }).on('pageshow', function(e) { 	   
			   if (DEBUG) console.log(this.id+" "+e.type);
			   if (DEBUG) console.log("Load ticket id="+localStorage.getItem('id_validacio_click'));		   	
		  		
		  	   $('#loading').show();
		  	   loadDadesNouEticket("");	 	    			  	
			   
		   }).on('pagebeforeshow', function(e) { 
			   resetDadesNouEticket("");
		   }).on('pagehide', function(e) {
	           if (DEBUG) console.log(this.id+" "+e.type);         
	           //$('#loading').hide();
	       });
	  
       
	   // DETECTO QUE CLICO EN TEXTBOX Y HAGO SCROLL
	  /* $('#nou_missatge').on('click', function() {
		   alert("scroll a "+$('#emotiva_validacionsdetail .ui-content').iscrollview("maxScrollY"));
		   $('#emotiva_validacionsdetail .ui-content').iscrollview("scrollTo", 0, $('#emotiva_validacionsdetail .ui-content').iscrollview("maxScrollY"), 0, false);// pongo el scroll abajo		   
		});*/
	   
	   
       
    }
});		