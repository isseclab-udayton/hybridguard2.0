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
	 *   AFEGIR AL CALENDARIO DE IOS
	 * 
	 ***********************************************/
	function afegirAlCalendari(title, location, notes, startDate, endDate,secondMessage)             
 	{
 		 if (DEBUG) console.log("Inicio calendar plugin");	
 		 var startDateConv = new Date(startDate.substr(0,4), (startDate.substr(5,2)-1), startDate.substr(8,2), startDate.substr(11,2), startDate.substr(14,2),0,0);
 		 
 		if(startDate.substr(11,2)=='00' && endDate.substr(11,2)=='00') // si es un evento de dia entero sumo uno al fin
		{			
			diaFin=parseInt(endDate.substr(8,2))+1;
			if (DEBUG) console.log("Evento de dia completo o mas de un dia nuevo dia fin="+diaFin);
		}	 
 		else
 			diaFin=endDate.substr(8,2);
 		 var endDateConv = new Date(endDate.substr(0,4), (endDate.substr(5,2)-1), diaFin, endDate.substr(11,2), endDate.substr(14,2),0,0);
 		 
 		 
         var addmessage="";
         if(secondMessage!="")
        	 addmessage="\n"+secondMessage;
         if (DEBUG) console.log("title"+title+" startDate"+startDateConv+" end Date"+endDateConv);        
           
         var errCall = function(theerror) {
         	 if (DEBUG) console.log("Error occurred - " + theerror);
         	 if (navigator.userAgent.indexOf("Android") != -1) // ANDROID	 
         	 { 
         		 //	 doAlert($._('event_ko')+addmessage); // no hago alert porque el sistema no sabe si es success o error          		 
         	 }
         	 else// IOS LE DICE QUE MIRE LO DE LA PRIVACIDAD
         		 doAlert($._('event_no_perms')+addmessage);
         }
         var succCall = function(themessage) {
         	 if (DEBUG) console.log("Success - " + themessage);
             doAlert($._('event_ok')+addmessage);
         }
         if (DEBUG) console.log("ANTES LLAMADA A CREATE EVENT CALENDARI");	
         
         /* EJEMPLO LLAMADA
          var startDate = new Date("January 30, 2014 13:00:00");
         var endDate = new Date("January 30, 2014 14:30:00");
         var title = "My nice event";
         var location = "Home";
         var notes = "Some notes about this event.";
         var success = function(message) { alert("Success: " + JSON.stringify(message)); };
         var error = function(message) { alert("Error: " + message); };
         window.plugins.calendar.createEvent(title,location,notes,startDate,endDate,success,error);*/
         
         window.plugins.calendar.createEvent(title,location,notes,startDateConv,endDateConv,succCall,errCall);             
         if (DEBUG) console.log("LLAMADA A CREATE EVENT CALENDARI");      
 	}
	/**********************************************
	 * 
	 *   VALIDAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function validaFormVullAssistir()
	{
		if ( localStorage.getItem('id_curs_actual')=='' ) return false;

		var empty_fields=false;
		var numeric_error=false;

		//Si estoy logeado se envía directamente la sol. info sin validar ningun dato más 
		if( $("#party_id_assistir").val()!=null && $("#party_id_assistir").val()!="" ) return true;

		
		$('.required:visible').each(function() {
		    if($(this).attr("value")=="")
			{
			    $(this).addClass("errorbg");
			    empty_fields=true;
			}
			else
			{
			    $(this).removeClass("errorbg");
			}
		});	
		if($("#pais_assistir").prop("selectedIndex")==0)
	    {
		    $("#pais_assistir").parent().addClass("errorbg");
		       empty_fields=true;
	    }			   
	    else
	    {
	        $("#pais_assistir").parent().removeClass("errorbg");
	    }   
		if($("#tipus_document_assistir").prop("selectedIndex")==0)
	    {
		    $("#tipus_document_assistir").parent().addClass("errorbg");
		       empty_fields=true;
	    }			   
	    else
	    {
	        $("#tipus_document_assistir").parent().removeClass("errorbg");
	    }   
		if(empty_fields)
		{
			doAlert( $._( 'error_omplir_camps' ) );
			$('.errorbg')[0].focus();
			return false;
		}
		$('.number:visible').each(function() {
			if(isNaN( $(this).attr("value") ))
			{
			   $(this).addClass("errorbg");
			   numeric_error=true;
			}
			else
			{
			   $(this).removeClass("errorbg");
			}
		});	
		if(numeric_error)
		{
			doAlert( $._( 'error_numeric' ) );
			$('.errorbg')[0].focus();
			return false;
		}
		if($('#tipus_document_assistir').val()=="NIE")
		{
			if(!isValidNie($('#dni_assistir').val()))
			{			
				$('#dni_assistir').addClass("errorbg");	
				doAlert( $._( 'error_nie' ) );					
				$('#dni_assistir').focus();
				return false;
			}
			else
			{
				$('#dni_assistir').removeClass("errorbg");
			}
		} 	
		else if($('#tipus_document_assistir').val()=="NIF")
		{
			if(!isValidNif($('#dni_assistir').val()))
			{					
				$('#dni_assistir').addClass("errorbg");
				doAlert( $._( 'error_nif' ) );				
				$('#dni_assistir').focus();
				return false;
			}
			else
			{
				$('#dni_assistir').removeClass("errorbg");
			}
			
		}
		if($("#postal:visible").length>0)
		{
			 if ( !( 
						( $("#postal_assistir").val().match(/^[0-9]{5}$/)?true:false ) && 
						parseInt($("#postal_assistir").val(),10)<53000 
						&& parseInt($("#postal_assistir").val(),10)>1000 
						&& parseInt($("#postal_assistir").val(),10)%1000 
					) )
			 {
				 $("postal").addClass("errorbg");
				 doAlert( $._( 'error_postal_invalido' ) );
				 $("#postal_assistir").focus();	
				 return false;
			}
			else
			{
				$("#postal_assistir").removeClass("errorbg");
			}	
		}
		if($("#pais_assistir").val()=="ES")
		{
			if(!(/^[9876][0-9]{8}$/.test($('#phone_assistir').attr("value")))	)		
			{
				$('#phone_assistir').addClass("errorbg");				
				doAlert( $._( 'error_telefono_invalido' ) );
				$('#phone_assistir').focus();				
				return false;
			}
			else
			{
				$('#phone_assistir').removeClass("errorbg");
			}
		}
		if($("#email_assistir").attr("value")!="" && !(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test($("#email_assistir").attr("value")) ))
		{
			$("#email_assistir").addClass("errorbg");
			doAlert( $._( 'error_email_invalido' ) );
			$("#email_assistir").focus();				
			return false;
		}
		else
		{
			$("#email_assistir").removeClass("errorbg");
		}
		
		return true;
	}
	/**********************************************
	 * 
	 *   ENVIAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function sendFormVullAssistir(event)
	{
	    if (DEBUG) console.log("Post vull assistir");
	   

	    if(!validaFormVullAssistir())
	    	return false;
	   
	    var idioma_app=$._.getLocale();
	    if(idioma_app=='en')
	    	idioma_post='ing';
	    else if( idioma_app=='ca')
	    	idioma_post='cat';
	    else
	    	idioma_post='esp';
	   $.post(URLEVENTSSCHOOL, 
        {                
            "id":localStorage.getItem('id_event_actual'),  
        			  "nom":$("#nom_assistir").val(), 
        			  "cognoms":$("#cognoms_assistir").val(), 
        			  "dni":$("#dni_assistir").val(), 
        			  "tipus_document":$("#tipus_document_assistir").val(), 
        			  "pais":$("#pais_assistir").val(), 
        			  "postal":$("#postal_assistir").val(), 
        			  "prefix":$("#prefix_assistir").val(), 
        			  "telefon":$("#phone_assistir").val(), 
        			  "email":$("#email_assistir").val(), 
        			  "idioma":idioma_post,
        			  "origen":"APP_SCHOOL",// no cambiar!!!
        			  "nick":$("#nick_assistir").val(),
        			  "name":$("#name_assistir").val(),        			 
        			  "party_id":$("#party_id_assistir").val(),
        			  "party_name":$("#party_name_assistir").val()        		
        }, 
        function(data) {        	
        	if(data=='OK' || data=='ok')
        	{        		        	
        		if( $("#party_id_assistir").val()=='' )
        			emptyFormValuesVullAssistir();
        		// afegeixo al calendari si es iosCalendary y l'ha afegit
        		if(localStorage.getItem('UtilitzarCalendari')=='SI' && $("#afegir_calendari_assistir").val()==1)
                {        		  	 	        	
    		      	if (DEBUG) console.log("afegeixo calendari vull assistir title"+localStorage.getItem("title_calendar")+" startDate"+ localStorage.getItem("startDate_calendar")+" end Date"+localStorage.getItem("endDate_calendar"));                	
    		      	//cal.createEvent(localStorage.getItem("title_calendar"), localStorage.getItem("location_calendar"), localStorage.getItem("notes_calendar"),  localStorage.getItem("startDate_calendar"), localStorage.getItem("endDate_calendar"),localStorage.getItem('idioma'),APPNAME,$._('form_enviado'));
                	 afegirAlCalendari(localStorage.getItem("title_calendar"), localStorage.getItem("location_calendar"), localStorage.getItem("notes_calendar"),  localStorage.getItem("startDate_calendar"), localStorage.getItem("endDate_calendar"),$._('form_enviado'));                  	
                }
        		else
        			doAlert($._('form_enviado'));
        		$('.ui-dialog').dialog('close');
        	}
        	else
        		doAlert($._('sol_info_error'));        	        	
        	
        },
        'json' ).error(function(a) {  
        	if(a.status==0) // Si detecta que no hay conexi�n activa 
           	 doAlert($._('error_no_connection'));
            else
            {
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
            }
        });			        
	}
	
	
	/**********************************************
	 * 
	 *   BORRAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function emptyFormValuesVullAssistir()
	{
		$("#nom_assistir").val(''); 
		$("#cognoms_assistir").val(''); 
		$("#dni_assistir").val('');
		$("#tipus_document_assistir").prop("selectedIndex","0");
		$("#tipus_document_assistir").selectmenu('refresh');
		$("#pais_assistir").prop("selectedIndex","0");
		$("#pais_assistir").selectmenu('refresh');
		$("#postal_assistir").val('');
		$("#div_postal_code:visible").slideUp();
		$("#prefix_assistir").val(''); 
		$("#phone_assistir").val(''); 
		$("#email_assistir").val(''); 
		$("#nick_assistir").val('');
		$("#party_id_assistir").val('');
		$("#party_name_assistir").val('');
	}
	
	/**********************************************
	 * 
	 *   LOAD EVENT LIST
	 * 
	 ***********************************************/
	function loadEventList(e){
		$('#loading').show();
        timestamp_actual= new Date().getTime();		          
        interval_reload_events=timestamp_actual-localStorage.getItem('last_reload_agenda');
        if (DEBUG) console.log("interval reload="+interval_reload_events+">"+MAX_INTERVAL_RELOAD_EVENTS);
        if(interval_reload_events>MAX_INTERVAL_RELOAD_EVENTS) 
        {	            
        	if (DEBUG) console.log("Get event list");	
	    	// Clear previous content
            $('.message').remove(); // borro el missatge
        	$('#eventcontent .item_list').remove(); // borro el listado                        
                     
	    	if (DEBUG) console.log("Reload event list");		    		               		 
		    $.get(URLAPISCHOOL+"getLlistatEventAPP/tipus/TOTS/idioma/"+$._.getLocale()+"/",{}, 
                function(data) {  
		    	if (DEBUG) console.log("respuesta de get event list recibida");		
                    localStorage.setItem('last_reload_agenda',timestamp_actual);                    
                    var emptyData = true;

                    $.each(data, function (){
                        emptyData = false;                        
                        var d=new Date(this.dia_inici.substr(0,4),(this.dia_inici.substr(5,2)-1),this.dia_inici.substr(8,2));
                        var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                        var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
                        var str_data=day_two_chrs+"/"+ month_two_chrs +"/"+d.getFullYear();
                        
                        if(this.data_permanent!='' && this.data_permanent!='0000-00-00' && this.data_permanent!=this.dia_inici)
                        {
                        	var d=new Date(this.data_permanent.substr(0,4),(this.data_permanent.substr(5,2)-1),this.data_permanent.substr(8,2));
                            var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
                            var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
                            var str_data=str_data+" "+$._('al_lower')+" "+day_two_chrs+"/"+ month_two_chrs +"/"+d.getFullYear();
                        }
                        
                        var htmlitem='<li class="item_list"><a href="#eventdetail" class="eventitemlink" id="'+this.id_event+'"><span class="list_info_small">'+str_data+"</span><br>"+this.titol_curt+'</a></li>';
                        //$('#events').after(htmlitem);
                        if(this.tipus==2)// sesinfo
                        {
                        	 $("#eventcontent #divider_SI").show();
                        	 $("#eventcontent #divider_SI").after(htmlitem);
                        }
                        else if(this.tipus==9)// Open talent
                        {
                        	 $("#eventcontent #divider_OT").show();
                        	 $("#eventcontent #divider_OT").after(htmlitem);
                        }
                        else //Altres
                        {
                        	 $("#eventcontent #divider_Altres").show();
                        	 $("#eventcontent #divider_Altres").after(htmlitem);
                        }
                        //$("#eventcontent").append(htmlitem);
                        
                    });                   

                    $("#eventcontent").listview("refresh");	
                    	

                    //Possem el missatge de no hi ha events si cal 
                    if(emptyData)
                    {
                        var htmlitem='<div class="message">' + $._('empty_events') + '</div>';
                        $("#eventcontent").parent().parent().append(htmlitem);
                    }
                    $('#loading').hide();            		
                },
                  'json' ).error(function(a) { 
                	  $('#loading').hide();
                	  if(a.status==0) /* Si detecta que no hay conexi�n activa */
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
	 *   LOAD EVENT DETAIL
	 * 
	 ***********************************************/
	function loadEvent(id)
	{		
		if (DEBUG) console.log("Get event");	
		$('#eventdetail .item_info').html(''); // borro el item individual 						
   		$.get(URLAPISCHOOL+"getEventApp/id_event/"+id+"/idioma/"+$._.getLocale()+"/",{}, 
         function(data) {     
   		 if (DEBUG) console.log("Retorno Get");   		 	
   			localStorage.setItem('id_event_actual',id);// guardo el item actual   						
   			localStorage.setItem('preinscripcio',data.preinscripcio);   			
   			   			   			
			$('#eventdetail #title').html(data.titol);	 				
			
            var d = new Date(data.dia_inici.substr(0,4), (data.dia_inici.substr(5,2)-1), data.dia_inici.substr(8,2));
            var day_two_chrs   = ( "0" + d.getDate() ).slice(-2);                         
            var month_two_chrs = ( "0" + (d.getMonth()+1) ).slice(-2);
			var str_data       = day_two_chrs + "/" + month_two_chrs + "/" + d.getFullYear();
			
			var startDate = d.getFullYear()+"-"+month_two_chrs+"-"+day_two_chrs+" "+data.hora_inici;
			 if(data.data_permanent!='' && data.data_permanent!='0000-00-00' && data.data_permanent!=data.dia_inici)
             {
             	var df=new Date(data.data_permanent.substr(0,4),(data.data_permanent.substr(5,2)-1),data.data_permanent.substr(8,2));
                 var day_two_chrs   = ( "0" + df.getDate() ).slice(-2);                         
                 var month_two_chrs = ( "0" + (df.getMonth()+1) ).slice(-2);
                 var str_data=str_data+" "+$._('al_lower')+" "+day_two_chrs+"/"+ month_two_chrs +"/"+df.getFullYear();
                 var endDate   = df.getFullYear()+"-"+month_two_chrs+"-"+day_two_chrs+" "+data.hora_fi;
             }
			 else
			 {
				 var endDate   = d.getFullYear()+"-"+month_two_chrs+"-"+day_two_chrs+" "+data.hora_fi;
			 }
			
            $('#eventdetail #date').html(str_data);
			$('#eventdetail #time').html(data.hora);
			if(data.hora=='')
				$('#eventdetail #time').parent().hide();
			else
				$('#eventdetail #time').parent().show();
			//$('#eventdetail #location').html(data.lloc_realitzacio.replace("<a ","<a target=\"_blank\""));
			$('#eventdetail #location').html(addLinksTargetBlank(data.lloc_realitzacio_plain));
			if(data.lloc_realitzacio_plain=='')
				$('#eventdetail #location').parent().hide();
			else
				$('#eventdetail #location').parent().show();
			$('#eventdetail #description').html(addLinksTargetBlank(data.capcelera));		 
			if(localStorage.getItem('UtilitzarCalendari')=='SI')
            {
               $('#eventdetail #content_add_calendar').show();              
              var title= data.titol;
	 		  var location =data.lloc_realitzacio_plain;
	 		  var notes = "";
	 		  localStorage.setItem("title_calendar",title);
	 		  localStorage.setItem("location_calendar",location);
	 		  localStorage.setItem("notes_calendar",notes);
	 		  localStorage.setItem("startDate_calendar",startDate);
	 		  localStorage.setItem("endDate_calendar",endDate);
               
              if (DEBUG) console.log("Anyado evento click calendarr");
               $('#eventdetail #button_add_calendar').on("click",function(event) { // one es para que se ejecute solo una vez y después hace unbind  // lo he quitado para poder darle dos veces           	   
                    if (DEBUG) console.log("Add Calendar Clicked ");                                    
                    afegirAlCalendari(title, location, notes, startDate, endDate,"");      
				});
			}
			/// SHARE BUTTONS
			var titol_share=data.titol;
			var text_share=shortString(data.titol,localStorage.getItem('max_length_text_share'))+" "+data.short_url;
			$('#eventdetail #button_share_android').attr("share_title",titol_share);
			$('#eventdetail #button_share_android').attr("share_text",text_share);
			$('#eventdetail #button_share_ios').attr("share_title",titol_share);
			$('#eventdetail #button_share_ios').attr("share_text",text_share);
			
			 if (DEBUG) console.log("Evento llenado");
			$('#loading').hide();
			 if (DEBUG) console.log("loading  hide");
			 			
			 if(localStorage.getItem('preinscripcio')==1)
  			 {
				 // como est� lo de compartir el footer siempre estar�, solo escondo y muestro el bot�n
  		   		/*$('#footer_event_detail').show();
  		   		$('#footer_event_detail').height('auto');*/
				 $('#footer_event_detail #button_vullassistir').css('display', 'inline-block');		 
  			 }
  		   	 else
  		   	 {
  		   		 $('#footer_event_detail #button_vullassistir').hide();
  		   		/*$('#footer_event_detail').hide();
  		   		$('#footer_event_detail').height(0);*/
  		   	 }	   		 
			 $('#footer_event_detail').show();
			 
			 
			 $('#eventdetail .ui-content').fadeIn("fast", function () {
				$('#eventdetail .ui-content').iscrollview("resizeWrapper");
				$('#eventdetail .ui-content').iscrollview("refresh");  	  				 
	  		    if (DEBUG) console.log("refresh scrollview");							
	  	      });
    		 if (DEBUG) console.log("Evento fade in");
    		if (DEBUG) console.log("Event show");
         },
         'json' ).error(function(a) { 
        	 $('#loading').hide();
             if(a.status==0) /* Si detecta que no hay conexi�n activa */
            	 doAlert($._('error_no_connection'));
             else
            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
             // vuelvo al listado de eventos 
        	 $.mobile.changePage('#event');
            });		      		
	}	
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/	
    function onDeviceReady() {      
	   $('#event').on('pageinit', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
		   /**********************************************    	 
	    	 *   LISTA EVENTOS
	    	 ***********************************************/		
		   $('#eventcontent').on("click", ".eventitemlink",function(event) {							
				 //var id = event.target.id;
			     var id = event.currentTarget.id;			   
				 localStorage.setItem('id_event_click',id);	    		
				 event.stopPropagation();
			});	  	 
	   }).on('pageshow', function(e) {	  // SI SE CAMBIA POR BEFORESHOW HACE FLICKEO AL CAMBIAR DE P�GINA 
			if (DEBUG) console.log(this.id+" "+e.type);					
			loadEventList(e); // Load event list						   	   							   		    	      
	    	$('#eventdetail .ui-content').hide(); // escondo el contenido del evento 	    	
	   }).on('pagehide', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);	   		   			  
		 //  $('#loading').hide();             
	   });
	   /**********************************************    	 
	    *  EVENTO
   	   ***********************************************/
	   $('#eventdetail').on('pageshow', function(e) {
		   if (DEBUG) console.log(this.id+" "+e.type);
		   if (DEBUG) console.log("Load event id="+localStorage.getItem('id_event_click'));		 
	  		 if(localStorage.getItem('id_event_click')!=localStorage.getItem('id_event_actual'))
	  		 {	
	  			 $('#loading').show();
	  			 $('#eventdetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);
	  			 loadEvent(localStorage.getItem('id_event_click')); // Load event detail	 	    			  
	  		 }	
	  		 else
	  	   	 {	    			  	  			 
	  			 if(localStorage.getItem('preinscripcio')==1)
	  			 {
	  				 // como est� lo de compartir el footer siempre estar�, solo escondo y muestro el bot�n
	  				$('#footer_event_detail #button_vullassistir').css('display', 'inline-block');
	  		   		/*$('#footer_event_detail').show();
	  		   		$('#footer_event_detail').height('auto');*/
	  			 }
	  		   	 else
	  		   	 {
	  		   		 $('#footer_event_detail #button_vullassistir').hide();
	  		   		/*$('#footer_event_detail').hide();
	  		   		$('#footer_event_detail').height(0);*/
	  		   	 }
	  			$('#footer_event_detail').show();
	  			$('#eventdetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
	  			  $('#eventdetail .ui-content').fadeIn("fast", function () {
	  				$('#eventdetail .ui-content').iscrollview("resizeWrapper");  
	  				$('#eventdetail .ui-content').iscrollview("refresh");
	  				if (DEBUG) console.log("refresh scrollview");
	  			  });	 
	  	   		  if (DEBUG) console.log("Event cached");	
	  	   	 }	
	   }).on('pagebeforeshow', function(e) { // Si el evento que voy a cargar es diferente lo escondo
		   if(localStorage.getItem('id_event_click')!=localStorage.getItem('id_event_actual'))
		   {
			   $('#eventdetail .ui-content').hide();
			   if (DEBUG) console.log("EVENT DIFERENT AMAGO ACTUAL");	
		   }		 
	   }).on('pagehide', function(e) {
           if (DEBUG) console.log(this.id+" "+e.type);
           $('#footer_event_detail').hide();
           $('#footer_event_detail #button_vullassistir').hide();
           $('#eventdetail #button_add_calendar').off("click");// Unbind click event
           //$('#loading').hide();
       });
        
        
        /**********************************************    	 
    	 *   FORMULARIO VULL ASSISTIR
    	 ***********************************************/     	
     	$('#vullassistir').on("pageinit", function(e) {
     		if (DEBUG) console.log(this.id+" "+e.type);
     		
            //Selector de pais, cambio prefijo y mostrar/ocultar codigo postal
            $("#pais_assistir").change(function() {
    			 if($("#pais_assistir").prop("selectedIndex")!=0)		 
    				$("#prefix_assistir").val( "00"+paisprefix[$("#pais_assistir").val()] );
    			else
    				$("#prefix_assistir").val("");
    			
    			if($("#pais_assistir").val()=="ES")
    			{
    				$("#div_postal_code_assistir").slideDown();
    				$("#postal_assistir").addClass("required");
    				$("#postal_assistir").val("");
    			}
    			else
    			{
    				$("#postal_assistir").val('');
    				$("#div_postal_code_assistir").slideUp();
    				$("#postal_assistir").removeClass("required");
    			}
    		});
            $("#pais_assistir").append('<option>' + $._( 'country' ) + '</option>');
			
			$("#pais_assistir").append('<option value="ES">' + $._( 'spain' ) + '</option>');			
			
			// ESTO VIENE DE LOS FICHEROS DATA/PAISNOM.IDIOMA.JSON 
			jQuery.each( $.paisnom[$._.getLocale()].strings, 
				function(i, val){
					$("#pais_assistir").append('<option value="' + i + '">' + val + '</option>');
				});
			
			$("#pais_assistir").selectmenu('refresh');

			//Enviamos formulario
			$("#sendvullassistir").click( function(event) {
				if (DEBUG) console.log("envio formulario");	 
				sendFormVullAssistir();
			});                		
    		
    		//Link proteccio dades
    		$("#proteccio_link_assistir").click(function(){
    			$("#proteccio_dades_assistir").slideToggle("normal");
    		});
    		
    		
    		
     	}).on('pagebeforeshow', function(e) {
     		
     		if(localStorage.getItem('UtilitzarCalendari')=='SI')
            {
               $('#afegir_calendari_vull_assistir').show(); 
               // como lo a�ado despu�s de la inicializaci�n no se carga bien el color del NO, pone por defecto que est� activo. lo quito
               $('#vullassistir .ui-slider-label-a').removeClass('ui-btn-active');
            }
     		
	    	if (DEBUG) console.log(this.id+" "+e.type);	  		    		    
	    	
	    	$("#proteccio_dades_assistir").hide();
	    	
	    	// si est� marcado el si a�ado la clase boton activo porque sino al entrer y volver a entrar no sale en azul
	    	if($('#afegir_calendari_assistir').val()==1)  
	    	{
	    		// a�ado al segunto elemento la clase ui-btn-active
	    		$($('.ui-slider-label')[1]).addClass('ui-btn-active');
	    	}
	    	
			//Miramos si tenemos o no el party_id
			if(localStorage.getItem('id_usuari')=='' || localStorage.getItem('id_usuari')==null)
			{
				$("#not_empty_party_id_assistir").hide();
				$("#empty_party_id_assistir").show();
				
				$("#party_id_assistir").val('');
				$("#party_name_assistir").val('');
				$("#nom_party_id_assistir").val('');
			}
			else
			{
				$("#not_empty_party_id_assistir").show();
				$("#empty_party_id_assistir").hide();

				$("#party_id_assistir").val( localStorage.getItem('id_usuari') );
				$("#party_name_assistir").val( localStorage.getItem('nom_usuari') + ' ' + localStorage.getItem('cognom_usuari') );
				$("#nom_party_id_assistir").val( localStorage.getItem('nom_usuari') );
				$("#nom_party_id_assistir").attr('readonly', true); //Si estamos logados no se puede cambiar el nombre
			}
			//DATOS AVISO LEGAL PROTECCION DE DATOS
    		if (DEBUG) console.log(URLAPISCHOOL+"getAvisLegal/id_event/"+localStorage.getItem('id_event_actual')+"/idioma/"+$._.getLocale()+"/");
    		$.get(URLAPISCHOOL+"getAvisLegal/id_event/"+localStorage.getItem('id_event_actual')+"/idioma/"+$._.getLocale()+"/",{}, 
		         function(data) {     
		   		 if (DEBUG) console.log("Retorno Get data="+data.avis_legal);  
		   						   			   			
					$('#proteccio_dades_assistir .text_politica').html(data.avis_legal);				
		           
		         },
		         'json' ).error(function(a) { 
		        	 $('#loading').hide();
		             if(a.status==0) /* Si detecta que no hay conexi�n activa */
		            	 doAlert($._('error_no_connection'));
		             else
		            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
		             // vuelvo al listado de eventos 
		        	// $.mobile.changePage('#event');
		    });	
	    		    																			    	
	    });
       
    }
});		