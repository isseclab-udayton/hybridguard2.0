/*
 * Leer el locale guardado en el movil del usuario.
 */
function ucFirst(string) {
    return string.substring(0, 1).toUpperCase() + string.substring(1).toLowerCase();
}
function readUserLocale()
{
	language_device = navigator.language;// sera ca_es es_es , en_uk, en_gb algo as� si pillo la primera parte tengo el idioma corto
	tmp=language_device.split("-");
	language_device_curt=tmp[0];
	 if (language_device_curt=="en" && navigator.userAgent.indexOf("Android") != -1) // SI ES ANDROID MIRO EL IDIOMA TAMBI�N DE OTRA FORMA PORQUE A VECES LO DETECTA MAL Y SIEMPRE DETECTA INGLES
	 {
		if ( navigator && navigator.userAgent && (lang = navigator.userAgent.match(/android.*\W(\w\w)-(\w\w)\W/i))) 
		{
		      lang = lang[1];
		}
		language_device_curt=lang;
	 }
	
	 if (DEBUG) console.log("Device language="+language_device+" curt="+language_device_curt);    
	var idioma=localStorage.getItem('idioma');   
    if(idioma=='es' || idioma=='en' || idioma=='ca')
		return idioma;        
    else if(language_device_curt=='es' || language_device_curt=='en' || language_device_curt=='ca') // no ha entrado nunca pillo el del dispositivo
        return language_device_curt;
    else if(language_device_curt=='') // si la detecccion de android se hace mal y no detecta nada lo pongo vacio
    	return 'es';
    else
	    return 'en'; // idioma por defecto ingl�s
} 

/*
 * Traducir todas las etiquetas html con class i18 al idioma en el setLocale.
 */
function changeLanguage()
{
    $('.i18').each(function(){
        $(this).html( $._( $(this).attr('rel') ) );
    });

    $('input:button.i18').each(function(){
    	// esto es para la versi�n 1.0.1 del jquerymobile
        //$(this).prev('.ui-btn-inner').children('.ui-btn-text').text( $._( $(this).attr('rel') ) );
        
        $(this).attr("value", $._( $(this).attr('rel') ) );
        
        if($(this).button()!=null)
        {
          $(this).button('refresh');
        }
    });    
    // esto es para los placeholder de los inputs (placeholder es cuando el label est� dentro del campos
    $('.i18_placeholder').each(function(){
        $(this).attr("placeholder", $._( $(this).attr('rel') ) );
    });            
    
    localStorage.setItem('idioma',$._.getLocale()); //Guardamos el nuevo locale en el movil 
}

function alertCallback() {}

/* 
 * ALERT FUNCTION
 */
function doAlert(message,title,buttonName)
{
	message=message.toString();
    if(typeof title==="undefined")
        title=APPNAME;
    if(DESKTOP_NAVIGATOR)
		alert(message);
	else
    {
        navigator.notification.alert(message,null,title,'');	

    }
}


/* 
 * Check network avaibility 
 */
function checkNetwork(url)
{
	var resultado;
	var networkState = navigator.network.connection.type;
	var states = {};
	states[Connection.UNKNOWN] = 'Unknown connection';
	states[Connection.ETHERNET] = 'Ethernet connection';
	states[Connection.WIFI] = 'WiFi connection';
	states[Connection.CELL_2G] = 'Cell 2G connection';
	states[Connection.CELL_3G] = 'Cell 3G connection';
	states[Connection.CELL_4G] = 'Cell 4G connection';
	states[Connection.NONE] = 'No network connection';	
    doAlert(states[networkState]);
	if(states[networkState] == states[Connection.NONE] || states[networkState] == states[Connection.UNKNOWN])
	{
		doAlert($._('error_no_connection'));	
		resultado= false;
	}	
	else
	{				
		$.ajax({
		type: "GET",
		data: "{}",
		url: url,
		cache: false,
		 async: false,
		timeout: 10 * 1000,
		success:function(response)
		{			
			resultado= true;
		},
		error:function(xhr, textStatus, errorThrown) 
		{
			
			alert($._('error_connection_slow'));
			resultado= false;
		}
		});
		
	}
	return resultado;
}
function ucfirst (str) {
    // Makes a string's first character uppercase     
    var f = str.charAt(0).toUpperCase();
    return f + str.substr(1);
}
function shortString(str,maxlength){
	if(str.length>maxlength)
		str=str.substr(0,maxlength)+"...";			
	return str;
}

function addLinksTargetBlank(str) {

	// realmente esto no hace falta ya que porque utilizo in app browser y en el init ya a�ado al onclick que a�ada el window.open
	//return  str.replace('<a ', '<a  target="_blank" ');	
	return str
}
function init_variables()
{
	// borro las variables locales
    localStorage.removeItem('id_area_actual');
    localStorage.removeItem('id_tipus_actual');
    localStorage.removeItem('id_curs_actual');
    localStorage.removeItem('id_rss_actual');
    localStorage.removeItem('id_event_actual');
    localStorage.removeItem('id_validacio_actual');        
    localStorage.removeItem('rss_list');
	localStorage.setItem('last_reload_noticies',0);
	localStorage.setItem('last_reload_agenda',0);		
	localStorage.setItem('last_reload_emotiva_validacions',0);
	localStorage.setItem('last_reload_emotiva_etickets',0);
    localStorage.setItem('last_reload_courselist',0);
    localStorage.setItem('preinscripcio',0);
    localStorage.setItem('max_length_text_share',110);
}

/*
 * inicializa todas las variables
 */
function init()
{		    
	init_variables();
	// cargo el idioma actual
	var userLocale = readUserLocale();	
    $._.setLocale(userLocale);     
    changeLanguage();
    
    
    // SI ES IOS7 A�ADO CSS
    /*if( DESKTOP_NAVIGATOR || (navigator.userAgent.indexOf("Android") == -1 &&  parseInt(device.version.substr(0,1))>=7)) // CSS PARA IOS7
  		$('head').prepend('<link rel="stylesheet" href="css/app_ios7.css" type="text/css" />');// a�ado css para ios7 especial*/
  		
  		  	
    
    
	// inicializo el tipo de dispositivo
	var deviceType = (navigator.userAgent.match(/iPad/i))  == "iPad" ? "iPad" : (navigator.userAgent.match(/iPhone/i))  == "iPhone" ? "iPhone" : (navigator.userAgent.match(/Android/i)) == "Android" ? "Android" : (navigator.userAgent.match(/BlackBerry/i)) == "BlackBerry" ? "BlackBerry" : "null";
	//deviceType="iPad";
	if(deviceType=="Android" && !navigator.userAgent.match(/mobile/i) ) // Si es un android y no contiene la palabra mobile entonces es un tablet, pongo el device Type como un iPad
		deviceType="iPad";
		
	localStorage.setItem('deviceType',deviceType);	
	if(deviceType=="iPad")
	{
		$('head').append('<link rel="stylesheet" href="css/app_ipad.css" type="text/css" />');// a�ado css para ipad especial
		
		$('#page1').append($('#page2').html()); // lo de la p�gina 2 lo a�ado a la p�gina 1		
		$('#page2').remove(); // borro la p�gina 2
		$('.hide_ipad').hide();
		$('.hide_iphone').show();
	}
	else
	{			
		$('.hide_ipad').show();
		$('.hide_iphone').hide();
	}
	 if (navigator.userAgent.indexOf("Android") != -1) // ANDROID
	 {
		 $('head').append('<link rel="stylesheet" href="css/app_android.css" type="text/css" />');// a�ado css para android		 
		 // ACCION DE BOTON COMPARTIR (SHARE)
		 $(".share_ios").remove(); // borro los botones de compartir de ios
	 }
	 else// IOS
	 {
		 // ACCION DE BOTON COMPARTIR (SHARE)
		 $(".share_android").remove(); // borro los botones de compartir de android
		 if( DESKTOP_NAVIGATOR ||  parseInt(device.version.substr(0,1))<6)
		 	$(".share_ios").remove(); // borro los botones de compartir de ios
	 }
	 // COMPARTIR REDES SOCIALES
	 $(".share_android,.share_ios").on('click', function(event) {
		 
			 if($(this).hasClass("share_news"))
			 {
				 actual_page=$("#content_all_rss .content_page:visible");	
				 var share_title=actual_page.find("#input_share_title").val();
				 var share_text= actual_page.find("#input_share_text").val();
			 }
			 else
			 {		
				 var share_title=$(this).attr("share_title");
				 var share_text= $(this).attr("share_text");			 
			 }		
			 if (DEBUG) console.log('share title:'+share_title);
			 if (DEBUG) console.log('share text:'+share_text);
		     window.plugins.socialsharing.share(share_text,share_title);
		     if (DEBUG) console.log('despues de share');
		     $(".share_android,.share_ios").removeClass("ui-btn-active");
			 console.log("disable button share");

 	});
	 // CAMBIO TODOS LOS LINKS (EXCETO LOS DE QUE TIENEN CLASE INAPP) POR UN WINDOW OPEN _SYSTEM PARA QUE NO UTILIZE EL INAPPBROWSER Y LO ABRA EN UN NAVEGADOR EXTERNO
	 // A�ADIDO PORQUE CON IOS NO HAC�A FALTA PERO EN ANDROID SI
	 $(document).on('click','a:not(.inapp)', function(e) {
         var elem = $(this);
         var url = elem.attr('href');
         //alert("LINK DETECTADO");
         
         if (typeof url  !== "undefined" && (url.indexOf('http://') !== -1 || url.indexOf('https://') !== -1)) {
        	 e.preventDefault();
        	 if (DEBUG) console.log('cambio link por _system');
             window.open(url, '_system','location=no');
         }
     });
	 // LOS LINKS CON IAPP EN VEZ DE SYSTEM LES PONGO BLANK PARA QUE LO ABRA CON IAPP
	 $("a.inapp").on('click',function(event) {	
			event.preventDefault();
			event.stopPropagation();
			event.stopImmediatePropagation();
			if (DEBUG) console.log('cambio link por _blank inapp');
			window.open(this.href,'_blank','location=no,enableViewportScale=yes');// si lo abro con inappbrowser (_blank) me abre el inapp y ademas me abre el safari	
	});
	 
	 
	 if(localStorage.getItem('UtilitzarCalendari')=='SI')
	 {		 		 
		 // Adem�s asi ya pregunta si quiere acceder al calendario al abrir la app por primera vez
		 //	hago una llamada vacia y el plugin al detectar vacio no har� nada. hago esto porque la primera llamada siempre falla
		/* SE HA CAMBIADO POR UN NUEVO PLUGIN Y ESTO NO HACE FALTA YA
		 * 
		 * var cal;		 
        cal = window.plugins.calendarPlugin;        
        cal.createEvent("","", "", "", "",function(){},function(){}); */	
	 }
	
	// orientaci�n
	window.onorientationchange = function()
	{
	    doOnOrientationChange();
	};
	// Initial execution
	  doOnOrientationChange();
}


/* 
 * User login function 
 */
function login_campus(login, password)
{
	if(login=="" || password=="")
	{		
		show_error_message('.login_error_message',$._('error_omplir_camps'));				
	}
	else
	{			
	md5 = $().crypt( {
        method: 'md5',
        source: password
    });			
	
	var result="";
	
	var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cach� de llamadas
	  if (DEBUG) console.log('Hago post a ' + URLAPICAMPUS+"?v="+aleatorio);
	$.post(URLAPICAMPUS+"?v="+aleatorio, 
            {    
                service : 'app_init',
                data   : {"login":login, "md5":md5 }
            }, 
            function(data) { 
            	//if (DEBUG) console.log("data="+data);
            	//if (DEBUG) console.log("data="+data.id_usuari+" "+data.te_presencia+" "+data.te_campus_actius+" ");
            	if(data.id_usuari=="KO")
            	{		   
            		result="KO";
            		localStorage.removeItem('id_usuari');
            		localStorage.removeItem('te_presencia');
            		localStorage.removeItem('te_campus_actius');
            		localStorage.removeItem('te_emotiva');
            		localStorage.removeItem('te_emotiva_validacions');
            		localStorage.removeItem('te_emotiva_recursos');
            		localStorage.removeItem('intranet_ubicacio');
            		localStorage.removeItem('nom_usuari');
            		localStorage.removeItem('md5');
            		localStorage.removeItem('clau');
            		localStorage.removeItem('challenge');	
            		localStorage.removeItem('response');
            		login_changes("off");
                    if (DEBUG) console.log('dentro KO: ' + localStorage.getItem('id_usuari'));
            	}
                else
            	{		                		
            		result="OK";
            		//Guardamos los datos del usuario
            		localStorage.setItem('id_usuari',data.id_usuari);
            		localStorage.setItem('te_presencia',data.te_presencia);
            		localStorage.setItem('te_campus_actius',data.te_campus_actius);
            		localStorage.setItem('te_emotiva',data.te_emotiva);    
            		localStorage.setItem('te_emotiva_validacions',data.te_emotiva_validacions);
            		localStorage.setItem('te_emotiva_recursos',data.te_emotiva_recursos);
            		localStorage.setItem('intranet_ubicacio',data.intranet_ubicacio);
            		localStorage.setItem('nom_usuari',data.nom_usuari);
            		localStorage.setItem('login',login); 
            		localStorage.setItem('clau',password); 
            		localStorage.setItem('md5',md5); 
            		var challenge=1 + Math.floor(Math.random() * 999999999);// guardo un n�mero aleatorio
            		localStorage.setItem('challenge',challenge);
            		var response_source=login+":"+md5+":"+challenge;
            		var response = $().crypt( {
    	                method: 'md5',
    	                source: response_source
    	            });	
            		localStorage.setItem('response',response);		                				                		
            		login_changes("on");
            	}

            },
            'json' ).error(function(a) { 
                           if(a.status==0)
                           {
                               //doAlert( $._('error_no_connection') );
                               show_error_message('.login_error_message',$._('error_no_connection'));	
                               if(DEBUG) console.log('error1');
                           }
                           else
                           {	                                	   
                               //doAlert("error "+a.statusText+" status "+a.status);
                               show_error_message('.login_error_message',$._('error_no_connection'));
                               if(DEBUG) console.log('error2'+a.statusText+" status "+a.status);
                           } 
            }).success(function(a) { 		                	
            	if(result=="KO")	
            	{
            		//doAlert($._('error_user_password'));
            		show_error_message('.login_error_message',$._('error_user_password'),false);
            		$('#input_password').val('');
                    if(DEBUG) console.log('error3');
            	}
            	else
            	{
            		//doAlert($._('valid_user'));
            		$('.login_error_message').hide(); // por si hab�a un error y no se hab�a escondido todav�a
            		show_error_message('.login_success_message',$._('valid_user'));
            		$('.button_login').hide();
					$('.button_logout').show();
            		setTimeout(function () 
            				{		 
            					$('#input_login').val('');
            					$('#input_password').val('');
            					$('.ui-dialog').dialog('close');                								
            				}, 2000);		                		
            	}
            });                
	}
}

/* 
 * Show/Hide presence & campus virtual icons 
 */
function login_changes(action)
{
	if(action=="off")
	{	
		$('#presenceIcon').addClass('presenceIconOff');
		$('#campusIcon').addClass('campusIconOff');
		//$('#home_button_emotiva_validacions').hide();
		$('#home_button_emotiva').hide();
		$('.labelDesactivable').addClass('labelOff');
		
			$("#home_button_presence").off('click');
			$("#home_button_presence").on('click', function(event) {	
				if (DEBUG) console.log("event="+event.type+"  "+event);
                doAlert($._('error_no_validated'),'Error');		
                return false; // para que no siga propagando
			});
			
			$("#home_button_campus").off('click');
			$("#home_button_campus").on('click', function(event) {	
				if (DEBUG) console.log("event="+event.type+"  "+event);
                doAlert($._('error_no_validated'),'Error');		
                return false; // para que no siga propagando
			});
		
		$('.button_login').show();
		$('.button_logout').hide();		
	}	
	else
	{
		//El usuario se valida y tiene presencia
		if( localStorage.getItem('te_presencia')=='true' )
		{
			$("#home_button_presence").off('click');
			$('#presenceIcon').removeClass('presenceIconOff');
			$('#presenceLabel.labelDesactivable').removeClass('labelOff');
		}
		else //El usuario se valida y NO tiene presencia
		{
			$('#presenceIcon').addClass('presenceIconOff');
			$('#presenceLabel.labelDesactivable').addClass('labelOff');
			
			$("#home_button_presence").off('click');
			$("#home_button_presence").on('click', function(event) {	
	    		
				if (DEBUG) console.log("event="+event.type+"  "+event);
                doAlert($._('error_no_presence'),'Error');		
                return false; // para que no siga propagando
			});
		}
		
		// El usuario se valida y tiene emotiva validaciones
		if( localStorage.getItem('te_emotiva_validacions')=='true' )	
		{
		//	$('#home_button_emotiva_validacions').show();
			//$('#divider_Etickets').show();
			$('#emotiva_validacio_li').show();
		}
		else
		{
		//	$('#home_button_emotiva_validacions').hide();
			//$('#divider_Etickets').hide();
			$('#emotiva_validacio_li').hide();
		}
		// El usuario se valida y tiene emotiva recursos
		if( localStorage.getItem('te_emotiva_recursos')=='true' )	
		{
			$('#emotiva_recursos_li').show();
		}
		else
		{
			$('#emotiva_recursos_li').hide();
		}
		
		if( localStorage.getItem('te_emotiva')=='true' )
		{
			
			$('#emotiva_etickets_li').show();
			$('#home_button_emotiva').show();
			$("#button_emotiva").off('click');
			var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cach� de llamadas
			// quito lo de app=true para que al abrirse en el navegador salga el boton de logout
			 	
			var url_emotiva=URLEMOTIVA+"?username="+localStorage.getItem('login')+"&challenge="+localStorage.getItem('challenge')+"&response="+localStorage.getItem('response')+"&v="+aleatorio;
			
			$("#button_emotiva").attr("href",url_emotiva);	
			
			$("#emotiva_recursos_li a").attr("href",url_emotiva+"&next=intranet_llistat_ssiii.php");	

		}
		else
		{
			$('#emotiva_etickets_li').hide();
			$('#home_button_emotiva').hide();
			$("#button_emotiva").off('click');
			$("#button_emotiva").on('click', function(event) {	
	    		
				if (DEBUG) console.log("event="+event.type+"  "+event);
                doAlert('No tens permisos per accedir a emotiva','Error');		
                return false; // para que no siga propagando
			});
		}
		//El usuario se valida y tiene campus virtuales activos
		if( localStorage.getItem('te_campus_actius')=='true' )
		{
			$("#home_button_campus").off('click');
			var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cach� de llamadas
			//url_campus=URLCAMPUSMOBILE+"?app=true&username="+localStorage.getItem('login')+"&challenge="+localStorage.getItem('challenge')+"&response="+localStorage.getItem('response')+"&v="+aleatorio;
			// quito lo de app=true para que al abrirse en el navegador salga el boton de logout
			var base_url_campus;
			 if(localStorage.getItem('deviceType')=='iPad')
				base_url_campus=URLCAMPUS;
			else
				base_url_campus=URLCAMPUSMOBILE;	
			url_campus=base_url_campus+"?username="+localStorage.getItem('login')+"&challenge="+localStorage.getItem('challenge')+"&response="+localStorage.getItem('response')+"&v="+aleatorio;
			$("#home_button_campus").attr("href",url_campus);
		
			
			$('#campusIcon').removeClass('campusIconOff');
			$('#campusLabel.labelDesactivable').removeClass('labelOff');
		}
		else //El usuario se valida y NO tiene campus virtuales activos
		{			
			$('#campusIcon').addClass('campusIconOff');
			$('#campusLabel.labelDesactivable').addClass('labelOff');
			
			$("#home_button_campus").off('click');
			$("#home_button_campus").on('click', function(event) {	
	    		
				if (DEBUG) console.log("event="+event.type+"  "+event);
                doAlert($._('error_no_campus_active'),'Error');		
                return false; // para que no siga propagando
			});
			// para el caso que no es childbrowser
			$("#home_button_campus").removeAttr("target");
			$("#home_button_campus").removeAttr("href");
		}
		
		
        $('.button_login').hide();
		$('.button_logout').show();		
	}
}

/* 
 * Function to show login error message 
 */
function show_error_message(selector,text)
{
	$(selector).html(text).fadeIn('slow').delay(2000).fadeOut('slow');
}
/*
 * HACER LO QUE SEA AL CAMBIAR DE ORIENTACI�N
 * Al girar si no es un tablet escondo el logo para que quepan los iconos
 */
function doOnOrientationChange()
{	
  switch(window.orientation) 
  {
    case -90:
    case 90: // LANDSCAPE - HORIZONTAL
      if(localStorage.getItem('deviceType')!='iPad')
      {
    	  $("#home .ui-content").addClass("content_no_logo");
      	  $("#homeLogo").hide();
      }	 
      break; 
    default:// PORTRAIT - VERTICAL
    	if(localStorage.getItem('deviceType')!='iPad')
    	{
    	  $("#home .ui-content").removeClass("content_no_logo");
       	  $("#homeLogo").show();
    	}    	    	 
      break; 
  }
  if($('.ui-page-active').attr("id")=="where")
  {
		   // RECALCULO LA ALTURA PARA QUE ME OCUPE EL 100% (sino no se ve el mapa)	
		   var the_height = ($(window).height() - $("#where").find('[data-role="header"]').height() - $("#where").find('[data-role="footer"]').height());
		   $("#where").height($(window).height()).find('[data-role="content"]').height(the_height);
		   $('#map_square').gmap("refresh");// refresco el mapa
		   if (DEBUG) console.log("refresh map where");
   }
   if($('.ui-page-active').attr("id")=="where_ride")
   {
	   // RECALCULO LA ALTURA PARA QUE ME OCUPE EL 100% (sino no se ve el mapa)	
	   var the_height = ($(window).height() - $("#where_ride").find('[data-role="header"]').height() - $("#where_ride").find('[data-role="footer"]').height());
	   $("#where_ride").height($(window).height()).find('[data-role="content"]').height(the_height);
	    $('#map_canvas').gmap("refresh");// refresco el mapa
	   if (DEBUG) console.log("refresh map route");
   }
}

function youtube_parser(url){
	var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
	var match = url.match(regExp);
	if (match&&match[7].length==11){
		return match[7];
	}else{
		return "";
	}
}

// mira si dentro hay video de youtube, y los substituye por la imagen con un link
function youtube_fix(selector_madre)
{	
	// si hay videos de youtube con object los substituyo por link
	if($(selector_madre+" object").length>0)
	{
		$(selector_madre+" object").each(function(){
			url=$(this).find("param[name='movie']").val();
			if (url.indexOf("www.youtu") >= 0)
			{										
				id_youtube = youtube_parser(url);	
				if (DEBUG) console.log("id="+id_youtube);
				if(id_youtube!="")
				{
					if(localStorage.getItem('deviceType')=='iPad')
						$(this).replaceWith('<a href="http://www.youtube.com/watch?v='+id_youtube+'" target="_blank"><div class="img_youtube_ipad" style="background-image:url(http://img.youtube.com/vi/'+id_youtube+'/0.jpg)"><img src="img/playvideo.png" class="play"></div></a>');
					else	
						$(this).replaceWith('<a href="http://www.youtube.com/watch?v='+id_youtube+'" target="_blank"><div class="img_youtube" style="background-image:url(http://img.youtube.com/vi/'+id_youtube+'/1.jpg)"><img src="img/playvideo_little.png" class="play"></div></a>');
				}
			}
		});
	}	
	// si hay videos de youtube con iframe los substituyo por link
	if($(selector_madre+" iframe").length>0)
	{
		if (DEBUG) console.log("youtube hay iframe:not('.youtube_fix')"); // si ya le he aplicado el fix ya no lo vuelvo a hacer (por eso el not youtube fix
		$(selector_madre+" iframe").each(function(){			
			if ($(this).attr("src").indexOf("ww.youtu")>0)
			{						
				// antes cambiaba por un link, porque sino solo entrar en la p�gina lo abr�a en safari, pero ahora no pasa, por lo que solo cambio el tama�o
				/*id_youtube = youtube_parser($(this).attr("src"));
				if (DEBUG) console.log("id="+id_youtube);
				if(localStorage.getItem('deviceType')=='iPad')
					$(this).replaceWith('<a href="http://www.youtube.com/watch?v='+id_youtube+'" target="_blank"><div class="img_youtube_ipad" style="background-image:url(http://img.youtube.com/vi/'+id_youtube+'/0.jpg)"><img src="img/playvideo.png" class="play"></div></a>');
				else	
					$(this).replaceWith('<a href="http://www.youtube.com/watch?v='+id_youtube+'" target="_blank"><div class="img_youtube" style="background-image:url(http://img.youtube.com/vi/'+id_youtube+'/1.jpg)"><img src="img/playvideo_little.png" class="play"></div></a>');							        
				*/			
				
				width_orig=$(this).attr('width');
				height_orig=$(this).attr('height');				
				if(localStorage.getItem('deviceType')=='iPad')			
					new_width=400; // si se cambian estos width cambar tambi�n el css div.youtube_container													
				else				
					new_width=250;									
				new_height=Math.round(new_width*height_orig/width_orig);				
				$(this).attr("width",new_width);
				$(this).attr("height",new_height);
				// le a�ado un div para que pueda centrar el video
				$(this).wrap('<div class="youtube_container" />');
				
			}
		});
	}	
}
// FUNCION QUE SE LLAMA CUANDO SE ABRE UNA URL DE LA APP ESTANDO YA ABIERTA
function handleOpenURL(url) {
	$('#loading').show();
    window.setTimeout(function () {
    	// la url ser� talentupc://?id_emotiva_validacio=1145?setpropietari // la segunda parte es opcional
    	// la url para creadores de eticket sera
    	// // la url ser� talentupc://?id_emotiva_eticket=1145
        //window.alert('handleOpenURL: ' + url);  
        var urlAux=url.split("?");
        var paramsAux=urlAux[1].split("=");
        var paramName=paramsAux[0];
        var paramValue=paramsAux[1]; 
        var setPropietari=0;
        if(urlAux[2]=='setpropietari')
        {
          setPropietari=1;
        }
        //window.alert('paramName: ' + paramName+" param value="+paramValue+");
        if (DEBUG) console.log("url crida="+url);
        if (DEBUG) console.log('paramName: ' + paramName+" param value="+paramValue+" setPropietari="+setPropietari+" lenght="+urlAux.lenght+" param2="+urlAux[2]);
    	if(paramName=="id_emotiva_validacio")
    	{    		
    		if(localStorage.getItem('id_usuari')!='' && localStorage.getItem('id_usuari')!=null)    		
    		{    			
    			if( localStorage.getItem('te_emotiva_validacions')=='true' )
    			{
    				// si me envian por la url el set propietari llamo a la api para hacer el set
    				if(setPropietari==1)
			        {
    					var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cach� de llamadas
    					if (DEBUG) console.log("LLAMO A POST DE CAMBIAR VALIDADOR A "+URLAPICAMPUS+"?v="+aleatorio);
			        	$.post(URLAPICAMPUS+"?v="+aleatorio, 
			        	        {    
			        	            service : 'incidencia_validacions',
			        	            data   : {"id_usuari":localStorage.getItem('id_usuari'),
			        		    			  "call":"set_propietari",
			        		    			  "id_incidencia":paramValue
			        		    		     }
			           });	
			        }
		    		localStorage.setItem('id_validacio_click',paramValue);
		    		$.mobile.changePage('#emotiva_validacionsdetail',{transition:'none',allowSamePageTransition:true});
    			}
    			else
    			{
    				doAlert($._('validacio_no_perms'));
    				$('#loading').hide();
    			}
    		}
    		else 
    		{
    			doAlert($._('validacio_emotiva'));
    			$('#loading').hide();
    		}
    	}   
    	if(paramName=="id_emotiva_eticket")
    	{    		
    		if(localStorage.getItem('id_usuari')!='' && localStorage.getItem('id_usuari')!=null)    		
    		{    			
    			if( localStorage.getItem('te_emotiva')=='true' )
    			{
    				localStorage.setItem('id_eticket_click',paramValue);
            		$.mobile.changePage('#emotiva_eticketsdetail',{transition:'none',allowSamePageTransition:true});
    			}
    			else
    			{
    				doAlert($._('validacio_no_perms'));
    				$('#loading').hide();
    			}
    		}
    		else 
    		{
    			doAlert($._('validacio_emotiva'));
    			$('#loading').hide();
    		}
    	}   
    	$('#loading').hide();
    	
    }, 1000);
}
// para evitar que al pulsar back detecte doble back
$( document ).bind( 'mobileinit', function(){
    $.mobile.pushStateEnabled = false;
});


/*
 * MAIN
 * ---------------
 * On Ready function.
 * 
 */
$(function() {	
    if (DEBUG && (navigator.userAgent.indexOf("Android") != -1 ||  navigator.userAgent.indexOf("Mobile") != -1))
        DESKTOP_NAVIGATOR=false;
    else if (!DEBUG)// en prod es desktop navigator false
        DESKTOP_NAVIGATOR=false;
    else
    {
        DESKTOP_NAVIGATOR=true;
        localStorage.setItem('UtilitzarCalendari','NO');
    }
    if( !DESKTOP_NAVIGATOR)
    {
		document.addEventListener("deviceready", onDeviceReady, false);    
		// para evitar problemas de navegaci�n
		$.extend(  $.mobile , {
		    ajaxEnabled      : false//,
		    //hashListeningEnabled: false
		});
    }
	else
	{    	
		window.setTimeout(function() {
			onDeviceReady();
		}, 100);   
	}
    function backKeyDown() { 
    	if($.mobile.activePage.is('#home')){
            e.preventDefault();
        }
    	else
    	{
    		navigator.app.backHistory();
    	}
    }

	function onDeviceReady() 
	{		
		// HE A�ADIDO ESTO PORQUE CON IOS7 A�ADE ESTOS ESTILOS A�ADIENDO UN CSS, PERO NO SE CARGA HASTA MAS TARDE Y PRODUCE QUE AL CARGARSE SE MUEVA UN POCO LA CABECERA
		// DE ESTA FORMA EL ESTILO SE APLICA ANTES		
		if( DESKTOP_NAVIGATOR || (navigator.userAgent.indexOf("Android") == -1 &&  parseInt(device.version.substr(0,1))>=7))
		{
			//document.body.style.marginTop = "20px";
		}
		/*if( DESKTOP_NAVIGATOR || (navigator.userAgent.indexOf("Android") == -1 &&  parseInt(device.version.substr(0,1))>=7)) // CSS PARA IOS7
		{	
			$(".ui-mobile-viewport").css("margin-top","20px");
			$('.ui-page[data-role="page"] .ui-header').css("top","20px");
		//	alert("device ready ios7");			
		}*/
		
		document.addEventListener("backbutton", backKeyDown, true);
		init();				
		  
	    /*
	     * Page: Home
	     * ---------------
	     * Home page.
	     */ 				
 
		
		
		$("#home").on('pagebeforeshow', function(e) {
							
			if (DEBUG) console.log(this.id+" "+e.type);		
                // si no estoy validado no me dejar� entrar a presencia
                if(localStorage.getItem('id_usuari')=='' || localStorage.getItem('id_usuari')==null)
                {									
                	login_changes("off");
                }
                else
                {                	
                	login_changes("on");					
                }    
                
		});
		// PARA ANDROID AL CARGARSE NO DA TIEMPO A CARGARSE EL CSS Y SE VE COMO SE VA COMPONIENDO Y QUEDA FEO. LO QUE HAGO ES
		 // ESCONDER EL BODY Y CON EL LOAD ENTONCES MUESTRO EL BODY
		// NO FUNCIONA BIEN PORQUE SI PONGO EN EL BODY DEL INDEX DISPLAY NONE FUNCIONA PERO EN IOS HACE UN PARPADEO, Y SI LO A�ADO EN APP_ANDROIC.CSS EL DISPLAY NONE DE BODY ESTE SE A�ADE LUEGO DE HACER EL FADE Y NO SE MUESTRA
		 /*if (navigator.userAgent.indexOf("Android") != -1) // ANDROID
	     {
			 $('#home').on("pageinit", function(e) {
				 if (DEBUG) console.log("HOME PAGEINIT");
				$("body").fadeIn(1000); 
			 });
	     }*/
		// CAMBIO DE PANTALLA		
		if(localStorage.getItem('deviceType')!='iPad')
		{	
			$("#home").on('swipeleft',function(event){
				if (DEBUG) console.log("event="+event.type);				
				//$.mobile.changePage($('#home2'), {});	   
				if($('#page1').is (':visible'))
				{
					if (DEBUG) console.log("escondo pag1 y muestro 2");	
					$('#page1').hide("slide", { direction: "left" }, 500);
					$('#page2').show("slide", { direction: "right" }, 500);
					$('#slider_navigator .page1').removeClass("current");
					$('#slider_navigator .page2').addClass("current");
					
				}
		        event.preventDefault();
		    }).on('swiperight',function(event){
				if (DEBUG) console.log("event="+event.type);
				//$.mobile.changePage($('#home'), {reverse:true});
				if($('#page2').is (':visible'))
				{       
					if (DEBUG) console.log("escondo pag2 y muestro 1");	
					$('#page2').hide("slide", { direction: "right" }, 500);
					$('#page1').show("slide", { direction: "left" }, 500);
					$('#slider_navigator .page2').removeClass("current");
					$('#slider_navigator .page1').addClass("current");
				}
				event.preventDefault();
		    });
		}		
		// A TODOS LOS FORMULARIOS LES A�ADO QEU SI HACEN CLICK EN EL BOTON GO, QUE ES UN RETURN, QUE SE ENVIE PULSANDO EL BOT�N DE ENVIAR
		$("form").each(function () {
			$(this).keyup(function(event){			
				if(event.which==13) // si pulsa go envio
				{					
					if(!$(event.target).is("textarea"))// si es textare el que hace enter no envio
					{
						if (DEBUG) console.log("pulsa go, boton="+$(this).find('.send_button').attr("rel"));
						if (DEBUG) console.log("hago click en boton");
						$($(this).find('.send_button:visible')[0]).trigger("click");// por si hay dos botones hago esto
					}
						
					
				}
	        
	        });
		});
		
		// VALIDARSE EN EL CAMPUS
		// al possar el usuario y password validem que l'usuari es correcte		
		$('#login_send').on('click', function(event) {				
            
			event.stopPropagation();
			//doAlert($('#header_login').val()+"__"+$('#header_password').val())

			//Esta funciOn valida que el usuario y password es correcto. 
            //Si lo es devuelve un array con id_usuario, tiene presencia y tiene campus activos, sino todo en "KO"
			login_campus( $('#input_login').val(), $('#input_password').val() );

		}); 
		// fin envio login / password VALIDACI�N CAMPUS
		
		// LOGOUT DEL CAMPUS
		$('#logout_ok').on('click', function(event) {	
			 if (DEBUG) console.log('Pulso logout');
			//$('.button_logout').hide();
			//$('.button_login').show();
			localStorage.removeItem('login');
			localStorage.removeItem('id_usuari');
     		localStorage.removeItem('md5');
            localStorage.removeItem('clau');
            localStorage.removeItem('challenge');
            localStorage.removeItem('response');  
            if (DEBUG) console.log('Antes de login_changes');
            login_changes("off");
            if (DEBUG) console.log('Despues de login_changes');
        	$('.ui-dialog').dialog('close');
        	if (DEBUG) console.log('dialog close');
        //	 document.location.href="#home";        	
        	
		}); 		 

		// CANCEL DIALOG
		$('.dialog_cancel').on('click', function(event) {	
			$('.ui-dialog').dialog('close');
			//$('.popupLogin').popup("close");						
		});
		
		if(navigator.userAgent.indexOf("Android") != -1)
		{
			// escondo lo de a�adir fichero desde camara porque sino reinicia la app con android al llevar la app a background 
			$(".camera_button").hide();
			
			
			//PREVENIR DOBLE CLICK porque hay dispositivos que en vez de un click hacen dos, y por ejemplo en las areas la plegan y desplegan
			last_click_time = new Date().getTime();
			document.addEventListener('click', function (e) {
			    click_time = e['timeStamp'];
			    if (DEBUG) console.log('click valido');
			    if (click_time && (click_time - last_click_time) < 400) {
			    	if (DEBUG) console.log('click invalido doble click desactivado NOOOO ELIMINADO ESTO');
			       /* e.stopImmediatePropagation();
			        e.preventDefault();
			        return false;
			        HE QUITADO ESTO PORQUE SINO NO FUNCIONABA NINGUN CLICK CON LOS ANDROIDS NUEVOS Y NO IBA NADA
			        */
			    }
			    last_click_time = click_time;
			}, true);
		}
		if (DEBUG){
			/*$('a[data-direction="reverse"]').on('vclick', function(event) {	
				//$('#loading').hide();				
				if (DEBUG) console.log("back pulsado voy a "+$(this).attr("href"));	     
				$.mobile.changePage($(this).attr("href"),{transition:'fade'});
				event.stopPropagation();
			});*/
		}	
		$('a[data-direction="reverse"]').on('tap', function(event) {
			$('#loading').hide();				
			if (DEBUG) console.log("back pulsado voy a "+$(this).attr("href"));	 
			event.preventDefault();
			event.stopPropagation();
			event.stopImmediatePropagation();
			$.mobile.changePage($(this).attr("href"),{transition:'fade'});
		});
		
		$.mobile.changePage('#home',{transition:'none'});					
	}

});

// funciones para el share de ios
function shareSuccessIOS (result) {
    console.log("Fired Share Activity Successfully");
}

function shareErrorIOS (error) {
    console.log("Share Activity ERROR fired");
}
//funciones para comprobar NIF y NIE
function isValidNif(abc)
{
	dni=abc.substring(0,abc.length-1);
	let=abc.charAt(abc.length-1);
	if (!isNaN(let)) 
	{
		return false;
	}
	else
	{
		cadena = "TRWAGMYFPDXBNJZSQVHLCKET";
		posicion = dni % 23;
		letra = cadena.substring(posicion,posicion+1);
		if (letra!=let.toUpperCase())
		{
			return false;
		}
	}
	return true;
}
function isValidNie(abc)
{
	var dni = abc.toUpperCase();
	var pre = abc.substr(0, 1);
	var prev = '0';
	if (pre == 'X')
	   prev = '0';
	else if (pre == 'Y')
	   prev = '1';
	else if (pre == 'Z')
	   prev = '2';
	numero = prev + dni.substr(1,dni.length-1);
	return isValidNif(numero); 
} 
