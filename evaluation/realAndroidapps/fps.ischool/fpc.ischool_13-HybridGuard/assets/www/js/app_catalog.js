function imgError(objeto)
{	
	area = $(objeto).attr("rel");
	if(!(area>=1 && area<=6))
		area=0;	
	$(objeto).attr("src","img/area_"+area+".jpg");
}
$(function() {			
	if( !DESKTOP_NAVIGATOR) 
    	document.addEventListener("deviceready", onDeviceReady, false);    
    else
    {    	
    	window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
    }

	/*
	Cambiar el orden de una fecha. De YYYY-MM-DD a DD-MM-YYYY
	*/
	function mysql2normalDate(mysqlDate)
	{
		var split_data = mysqlDate.split("-");
		return split_data[2] + "-" + split_data[1] + "-" + split_data[0];
	}
	
	/**********************************************
	 * 
	 *   VALIDAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function validaForm()
	{
		if ( localStorage.getItem('id_curs_actual')=='' ) return false;

		var empty_fields=false;
		var numeric_error=false;

		//Si estoy logeado se envía directamente la sol. info sin validar ningun dato más 
		if( $("#party_id").val()!=null && $("#party_id").val()!="" ) return true;

		
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
		if($('#pais').prop("selectedIndex")==0)
	    {
		    $('#pais').parent().addClass("errorbg");
		       empty_fields=true;
	    }			   
	    else
	    {
	        $('#pais').parent().removeClass("errorbg");
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
		if($("#postal:visible").length>0)
		{
			 if ( !( 
						( $("#postal").val().match(/^[0-9]{5}$/)?true:false ) && 
						parseInt($("#postal").val(),10)<53000 
						&& parseInt($("#postal").val(),10)>1000 
						&& parseInt($("#postal").val(),10)%1000 
					) )
			 {
				 $('#postal').addClass("errorbg");
				 doAlert( $._( 'error_postal_invalido' ) );
				 $('#postal').focus();	
				 return false;
			}
			else
			{
				$('#postal').removeClass("errorbg");
			}	
		}
		if($("#pais").val()=="ES")
		{
			if(!(/^[9876][0-9]{8}$/.test($('#phone').attr("value")))	)		
			{
				$('#phone').addClass("errorbg");				
				doAlert( $._( 'error_telefono_invalido' ) );
				$('#phone').focus();				
				return false;
			}
			else
			{
				$('#phone').removeClass("errorbg");
			}
		}
		if($('#email').attr("value")!="" && !(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test($('#email').attr("value")) ))
		{
			$('#email').addClass("errorbg");
			doAlert( $._( 'error_email_invalido' ) );
			$('#email').focus();				
			return false;
		}
		else
		{
			$('#email').removeClass("errorbg");
		}
		
		return true;
	}
	
	/**********************************************
	 * 
	 *   ENVIAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function sendForm(event)
	{
	    if (DEBUG) console.log("Post sol info");
	    if (DEBUG) console.log('antes del post='+URLAPIFC);

	    if(!validaForm())
	    	return false;
	    
	    var pregunta;
	    
	    //Cambiamos nl2br en la pregunta si es necesario
	    if($("#pregunta").val()!='')
	    {
	    	pregunta = $("#pregunta").val();
	    	
	    	while (pregunta.toString().indexOf( "\n" ) != -1)
	    		pregunta = pregunta.toString().replace( "\n", "<br>");
	    	
	    	pregunta = '<p>' + pregunta + '</p>';
	    }
	    else
	    	pregunta = '';
	    
	    var idioma_app=$._.getLocale();
	    if(idioma_app=='en')
	    	idioma_post='ing';
	    else if( idioma_app=='ca')
	    	idioma_post='cat';
	    else
	    	idioma_post='esp';
	    
	    $.post(URLAPIFC, 
        {    
            method : 'appSolinfoModel', 
            data   : {"codi":localStorage.getItem('id_curs_actual'),  
        			  "nom":$("#nom").val(), 
        			  "cognoms":$("#cognoms").val(), 
        			  "pais":$("#pais").val(), 
        			  "postal":$("#postal").val(), 
        			  "prefix":$("#prefix").val(), 
        			  "phone":$("#phone").val(), 
        			  "email":$("#email").val(), 
        			  "idioma":idioma_post,
        			  "origen":"APP_SCHOOL",
        			  "nick":$("#nick").val(),
        			  "name":$("#name").val(),
        			  "pregunta":pregunta,
        			  "party_id":$("#party_id").val(),
        			  "party_name":$("#party_name").val()
        			 }
        }, 
        function(data) {     
        	if(data)
        	{
        		doAlert($._('sol_info_enviada'));
        		
        		//if( $("#party_id").val()=='' )
        		emptyFormValues();

        		$('.ui-dialog').dialog('close');
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexi�n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        });					
	}

	/**********************************************
	 * 
	 *   BORRAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function emptyFormValues()
	{		
		$("#nom").val(''); 
		$("#cognoms").val(''); 
		$('#pais').prop("selectedIndex","0");
		$('#pais').selectmenu('refresh');
		$("#postal").val('');
		$("#div_postal_code:visible").slideUp();
		$("#prefix").val(''); 
		$("#phone").val(''); 
		$("#email").val(''); 
		$("#nick").val('');
		$("#pregunta").val('');
		$('#numChars').text(MAX_QUESTION_LETTERS);
		$("#party_id").val('');
		$("#party_name").val('');
		$("#pregunta").val('');
	}
	

	/**********************************************
	 * 
	 *   LOAD COURSE LIST
	 * 
	 ***********************************************/
	function loadCourseList(id,id_area)
	{                
		 		    	         
	    if (DEBUG) console.log("Get course list");           
	    //$('#catalogcourselistcontent li').remove(); // borro el listado  // ahora lo hago fuera
        if (DEBUG) console.log('antes del post='+URLAPIFC+' area='+id_area+'tipus='+id);
        $.post(URLAPIFC, 
        {    
            method : 'appGetActivitatsModel',
            data   : {"school":1, "area":id_area, "tipus":id, "idioma":$._.getLocale() }
        }, 
        function(data) {     
    	    localStorage.setItem('id_tipus_actual',id); //Guardamos el nuevo id    	        	  
		    localStorage.setItem('id_area_actual',id_area); //Guardamos el nuevo valor en el movil  
    	    
            var emptyData = true;
              
            
            var courselist=$('#catalogcourselistcontent');
            var htmlitem='';
	 	    $.each(data, function (){	 	    	
	 	    		emptyData = false;
                   htmlitem=htmlitem+'<li  class="ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-up-c" id="'+this.codi+'"><div class=" ui-btn-inner ui-li"><div class="ui-btn-text"><a href="#catalogcoursedetail" class="ui-link-inherit catalogcourselink">'+this.nom+'</a></div><span class="ui-icon ui-icon-arrow-r ui-icon-shadow"></span></div></li>';
                   
            });		 	 
	 	   courselist.append(htmlitem);//.listview("refresh");	
	 	  $('#catalogcourselist .ui-content').iscrollview("refresh");
	 	  $('#loading').hide();

	 	   
            //Possem el missatge de no hi ha events si cal 
            if(emptyData)
            {
               var htmlitem='<div class="message">' + $._('empty_courses') + '</div>';
               $("#catalogcourselistcontent").parent().parent().append(htmlitem);
            }
        },
        'json' ).error(function(a) {
        	$('#loading').hide();
        	if(a.status==0) /* Si detecta que no hay conexi�n activa */
           	 doAlert($._('error_no_connection'));
            else
           	 doAlert($._('error_no_connection'));doAlert("error"+a.statusText+"status"+a.status);
        	// vuelvo al listado de areas / tipos 
       	 	$.mobile.changePage('#catalogarea');
        });						    
	}
	/**********************************************
	 * 
	 *   LOAD COURSE DETAIL
	 * 
	 ***********************************************/	 
      
	function loadCourse(id)
	{		
		 //$.mobile.silentScroll(0);
		if (DEBUG) console.log("Get course");	
		$('#catalogcoursedetail .item_info').html(''); // borro el item individual	
		if (DEBUG) console.log('antes del post='+URLAPIFC+' codi='+id);
		$.post(URLAPIFC, 
        {    
            method : 'appGetActivitatModel',
            data   : {"codi":id,"idioma":$._.getLocale(),"bloque":"presentacio"}	                    
        }, 
        function(data) {  
        	if (DEBUG) console.log('Set info curs '+data.nom);
                localStorage.setItem('id_curs_actual', id); //Guardamos el nuevo id en el móvil 
                localStorage.setItem('te_pregunta', data.te_pregunta); //Guardamos si tiene o no pregunta 
                
                // IMAGEN
                //courseImage                
                // a�ado una imagen y si no existe llama a la funcion de error que pone la de su area por defecto
                $('#catalogcoursedetail #courseImage').html('<img rel="'+data.area+'"  border="0" id="image_course" src="http://www.talent.upc.edu/images/areas_professionals/especifiques_cursos/'+id.substr(0,1)+id.substr(3,5)+'.jpg" onerror="imgError(this);" >');
              
                //Datos generales                
        	 	$('#catalogcoursedetail #title').html(data.nom);
        	 	var tipus_curs=data.nom_tipus+" "+data.nom_metode;
        	 	var idioma_actual=localStorage.getItem('idioma');
        	 	var enumeracio="";
        	 	if(data.edicio>1)
        		{            			
        			if(idioma_actual=='ca')
        				enumeracio="a";
        			else if(idioma_actual=='es')
        				enumeracio="&ordf;";
        			else if(idioma_actual=='en')
        			{
        				if(data.edicio==2)
        					enumeracio="nd";
        				else if(data.edicio==3)
        					enumeracio="rd";
        				else	
        					enumeracio="th";
        			}
        			enumeracio=data.edicio+enumeracio;
        			tipus_curs=tipus_curs+". "+enumeracio+" "+$._('edicio');
        		}            	 	            	 	
        	 	
    			$('#catalogcoursedetail #subtitle').html(tipus_curs);
    			if(data.landing_descripcio=="")
    				$('#catalogcoursedetail #presentation').hide();
    			else
    			{
    				$('#catalogcoursedetail #presentation').show();
    				$('#catalogcoursedetail #presentation').html(addLinksTargetBlank(data.landing_descripcio));
    			}
    			$('#catalogcoursedetail #aims').html(addLinksTargetBlank(data.objectius));
    			$('#catalogcoursedetail #whoisitfor').html(addLinksTargetBlank(data.destinataris));
    			/// SHARE BUTTONS
    			var titol_share=data.nom;
    			var text_share=shortString(data.nom,localStorage.getItem('max_length_text_share'))+" "+data.short_url;
    			$('#catalogcoursedetail #button_share_android').attr("share_title",titol_share);
    			$('#catalogcoursedetail #button_share_android').attr("share_text",text_share);
    			$('#catalogcoursedetail #button_share_ios').attr("share_text",text_share);
    			
    			//Proxim curs
               /* ahora ya lo pasa por parametro en data.data_proxim_curs
                * var data_proxim_curs = "";
                if( data.realitzacio_data_inici!='0000-00-00' )
                {
                    var split_data = data.realitzacio_data_inici.split("-");
                    if (DEBUG) console.log("split data"+split_data[0]+split_data[1]+split_data[2]);
                    var hoy = new Date();
                    var mes_despues = new Date(split_data[0],split_data[1], split_data[2]); //en la funcion el mes es 1 menos, así que no tocamos para que sea un mes más
                    if (DEBUG) console.log("hoy"+hoy);   
                    if (DEBUG) console.log("mes despues "+mes_despues);
                    if( ( data.tipus_prod_codi==2 || data.tipus_prod_codi==3 || data.tipus_prod_codi==4 ) && hoy >= mes_despues )
                    {
                        data_proxim_curs =ucfirst($._('mes_'+split_data[1])) + " " + $._('de') + " " + (parseInt(split_data[0])+1);
                    }
                }   */          
                if (DEBUG) console.log("data_proxim_curs "+data.data_proxim_curs);
                if(data.places_exhaurides=='1' && data.data_proxim_curs=="")
                    $('#catalogcoursedetail .places_exhaurides').show();
                else
                	$('#catalogcoursedetail .places_exhaurides').hide();
                
                //Durada
                if(data.eees=='1')
                    $('#catalogcoursedetail #duration').html( data.credits_total + " ECTS (" + data.hores_total + " " + $._('catalog_hores_lectives') + ")");
                else
                    $('#catalogcoursedetail #duration').html( data.hores_total + " " + $._('catalog_hores') + " (" + data.credits_total + " " +  $._('catalog_credits') + ")");
                                    
                
                $("#catalogcoursedetail #text_curs_iniciat").html("");
                $("#catalogcoursedetail #text_curs_iniciat").hide();
                $("#catalogcoursedetail #text_proxima_edicio").hide();
                //Dates de realitzacio                                     
                if(data.data_proxim_curs!="")
                {     
                	$('#catalogcoursedetail #datesproxcurs').html(ucFirst(data.data_proxim_curs));
                	$('#catalogcoursedetail #dates').parent().hide();
                	$('#catalogcoursedetail #datesproxcurs').parent().show();
                	var base=parseInt(data.codi.substr(1,2));
                	var any_acad="20"+base+"-"+(base+1); 
                	if(idioma_actual=='en')
                		$("#catalogcoursedetail #infogeneral").html($._('infogeneral')+" "+any_acad+" "+$._('edicio'));
                	else
                		$("#catalogcoursedetail #infogeneral").html($._('infogeneral')+" "+$._('edicio')+" "+any_acad);
                	
                	if(data.curs_iniciat==1)
                	{
                		$("#catalogcoursedetail #text_curs_iniciat").html($._('comencat1')+" "+any_acad+" "+$._('comencat2')+" "+data.nom_tipus.toLowerCase()+" "+$._('comencat3'));
                		$("#catalogcoursedetail #text_curs_iniciat").show();
                	}
                	$("#catalogcoursedetail #text_proxima_edicio").show();
                	
                } 
                else if(data.dates_lliure==1)
                {     
                	$('#catalogcoursedetail #datesproxcurs').parent().hide();
                	$('#catalogcoursedetail #dates').parent().show();
                	$("#catalogcoursedetail #infogeneral").html($._('infogeneral'));
                	$('#catalogcoursedetail #dates').html($._('lliure'));
                } 
                else if(data.data_inici_text!="")// ya me viene calculada con los textos correspondientes
                {
                	$('#catalogcoursedetail #datesproxcurs').parent().hide();
                	$('#catalogcoursedetail #dates').parent().show();
                	$("#catalogcoursedetail #infogeneral").html($._('infogeneral'));
                	html_dates = $._('datainici') + ': ' +data.data_inici_text;
                	if(data.data_fi_text!="")
                		html_dates = html_dates +"<br>"+ $._('datafi') + ': '+data.data_fi_text;
                	//Observacions dates realitzacio
                    if( data.obs_data_realit!='' )
                    {
                    	html_dates = html_dates + '<br>'+data.obs_data_realit;	                    	
                    }
                    $('#catalogcoursedetail #dates').html(html_dates);
                    if (DEBUG) console.log("hay fechas"); 
                }
                else // no se muestran las fechas
                {
                	 if (DEBUG) console.log("sin fechas");   
                	 $("#catalogcoursedetail #infogeneral").html($._('infogeneral'));
                	$('#catalogcoursedetail #dates').parent().show();
                	$('#catalogcoursedetail #datesproxcurs').parent().hide();
                }
                                  

		        //Horari
                html_horaris = "";
		        if( data.horaris!='' && data.metode!=3 )
		        {
		        	html_horaris = "";
		        	
		        	for(i=0;i < data.horaris.length; i++)
		        	{
		        		if ( i<2 || data.horaris[(i-2)].dia !=  data.horaris[i].dia )
		        		{
		        			html_horaris = html_horaris + ' ' + $._('dia_semana_' + data.horaris[i].dia ) + ' ' + data.horaris[i].hora_inici + ' ' + $._('a')  + ' ' + data.horaris[i].hora_fi;
		        			
		        			if ( i>=1 && data.horaris[(i-1)].dia ==  data.horaris[i].dia )
		        			{
		        				html_horaris = html_horaris + ' | ' + data.horaris[i].hora_inici + ' ' + $._('a')  + ' ' + data.horaris[i].hora_fi;
		        			}
		        			
		        			html_horaris = html_horaris + '<br>';
		        		}
		        	}
		        	 //Observacions del horari
                    if( data.observacions_horari!='' )
                    {
                    	html_horaris = html_horaris +data.observacions_horari;	                    	
                    }
		        	
		        	$('#catalogcoursedetail #timetable').html( html_horaris );
		        }
		        else
		        {
		        	$('#catalogcoursedetail #timetable').parent().hide();
		        }
		        			        			                            
               
                
                
		        //Lloc realització
                html_lloc_realitza = "";
		        if( data.localitzacions!='' && data.metode!=3 )
		        {
		        	if( data.localitzacions.length >1 )
		        	{
		        		$('#catalogcoursedetail #place_title').attr("rel","places");
		        		$('#catalogcoursedetail #place_title').html($._('places') );			        		
		        	}			        	
		        	html_lloc_realitza="";
		        	for(i=0;i < data.localitzacions.length; i++)
		        	{
		        		if(i>0)
		        			html_lloc_realitza = html_lloc_realitza +"<br>";
		        		html_lloc_realitza = html_lloc_realitza + data.localitzacions[i].nom + '<br>' + data.localitzacions[i].direccio + '<br>';
		        	}
		        	
		        	$('#catalogcoursedetail #place').html( html_lloc_realitza );
		        }                  
		        else
		        {
		        	$('#catalogcoursedetail #place').parent().hide();
		        }
                //Preu			        
                if( data.preu!='' && data.preu!=0)                    
                	$('#catalogcoursedetail #price').html(data.preu + " €" ); // NO CAMBIAR EL CARACTER RARO ES EL S�MBOLO DE EURO                    
                else
                	$('#catalogcoursedetail #price').html( ucfirst($._('perDeterminar')));
                
		        //Temari
                html_temari = "";
		        if( data.assignaturas!='' )
		        {			        			        	
		        	for(i=0;i < data.assignaturas.length; i++)
		        	{
		        		html_temari = html_temari + "<b>" + (i+1) + "- " + data.assignaturas[i].nom + "</b><br>";
		        		
	        			//if(data.assignaturas[i].id_tipus!=1)
	        			//	html_temari = html_temari + data.assignaturas[i].tipus + ". ";
		        		
	        			if(data.eees=='1')
	        				html_temari = html_temari + data.assignaturas[i].credits_total + " ECTS. ";
	        			else
	        				html_temari = html_temari + data.assignaturas[i].hores_total + " " + $._('hores')  + " ";

	        			if(data.duracio=='B1' || data.duracio=='B2' || data.duracio=='B3')
		        		{
		        			if(data.assignaturas[i].any_academic==1)
		        			{
		        				html_temari = html_temari + $._('primer_any');
		        			}
		        			else
		        			{
		        				html_temari = html_temari + $._('segon_any');
		        			}
		        		}
		        		
		        		html_temari = html_temari + "<br>";
		        	}
		        	
		        	$('#catalogcoursedetail #temari').html( html_temari );
		        	    
		        	
		        	
		        	
		        	        	 		
		        }        	 	
		        $('#loading').hide();
		       // $.mobile.silentScroll(0);
		        $('#footer_course_detail').show();    
		        $('#catalogcoursedetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);
        		$('#catalogcoursedetail .ui-content').fadeIn("fast", function () {
        			// llamo con timeout para dar tiempo a que la imagen se carge y calcule su altura
        			setTimeout(function(){
        				  $('#catalogcoursedetail .ui-content').iscrollview("refresh");	
        				  if (DEBUG) console.log("refresh iscroll timeout");   
        					},1000);				       
		        });	        		      		    
        		if (DEBUG) console.log("Course show");
        	               
        },
        'json' ).error(function(a) { 
        	$('#loading').hide();
        	if(a.status==0) /* Si detecta que no hay conexi�n activa */
              	 doAlert($._('error_no_connection'));
            else
              	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);  
        	// vuelvo al listado de cursos 
       	 	$.mobile.changePage('#catalogcourselist');
        	});												
					
	}
	
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/
    function onDeviceReady() {
    	
    	/**********************************************    	 
    	 *   LISTA AREAS
    	 ***********************************************/		
    	$('#catalogarea').on("pageinit", function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);			
			/*$('#catalogareacontent').on("tap", ".catalogarealink",function(event) {		
				var id=$(event.target).closest("li").attr("id");								
				if(id!=localStorage.getItem('id_area_actual')) // si he salido y he vuelto a entrar a la misma ahora no las consulto de nuevo
				{					
					// guardo el area actual
					localStorage.setItem('id_area_actual',id); //Guardamos el nuevo valor en el movil 
					localStorage.setItem('id_tipus_actual',''); // vacio el tipo para asegurarme que carga los nuevos
					//Si ha cambiado destruyo lo de antes
					$('#catalogcourselistcontent').children(':not(#leading):not(#courses)').remove();												
				}	
			});*/
			
			$('#catalogareacontent').on('click','.catalogtypelink', function(event) { // si pongo tap no funciona				
				 if (DEBUG) console.log("LOAD course list");
				 
				 console.log($(this));
				 console.log($(this).closest("li"));
			     var id=$(this).closest("li").attr("id");
			     var id_area=$(this).closest("li").attr("rel");		
			     localStorage.setItem('id_area_click',id_area);
			     localStorage.setItem('id_tipus_click',id);
			     if (DEBUG) console.log("clico en tipus="+id+" id area="+id_area);
				/* if(id!=localStorage.getItem('id_tipus_actual') || id_area!=localStorage.getItem('id_area_actual'))
				 {							 
					   $('#loading').show();
				       loadCourseList(id,id_area); // dentro si funciona modificara el id_tipus_actual
				 }          
		        else
		        {
		            if (DEBUG) console.log("Event list cached");	
		        } */  
				 //event.stopPropagation();
			});
		});
		
		/**********************************************    	 
    	 *   LISTA TIPO DE CURSO
    	 ***********************************************/		
 /*   	$('#catalogtype').on("pageinit", function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);
			$('#catalogtypecontent').on('click','.catalogtypelink', function(event) { // si pongo tap no funciona
				 if (DEBUG) console.log("LOAD course list");
			     var id=$(this).closest("li").attr("id");
				 if(id!=localStorage.getItem('id_tipus_actual'))
				 {		
					   $('#loading').show();
				    	loadCourseList(id); // dentro si funciona modificara el id_tipus_actual
				 }          
		        else
		        {
		            if (DEBUG) console.log("Event list cached");	
		        }   
				 event.stopPropagation();
			});
		   		  
		});*/
	    
		/**********************************************    	 
    	 *   LISTA CURSOS
    	 ***********************************************/
    	$('#catalogcourselist').on("pageinit", function(e) {
	    	if (DEBUG) console.log(this.id+" "+e.type);			    	
	    	  $('#catalogcourselistcontent').on('click','.catalogcourselink',function(event) { // si pongo tap no funciona	
	    		  var id=$(this).closest("li").attr("id");		
	    		  localStorage.setItem('id_curs_click',id);
	    		  /*
	    		   if (DEBUG) console.log("Load course id="+id);
	    		   if(id!=localStorage.getItem('id_curs_actual'))
	    		   {	
	    			   $('#loading').show();
	    			   loadCourse(id);
	    			  
	    		   }	
	    		   else
	    	   	   {	    			  
	    			   $.mobile.silentScroll(0);
	    			   $('#catalogcoursedetail .ui-content').fadeIn();
	    	   			if (DEBUG) console.log("Course cached");	
	    	   	   }*/		    		  
	    		   event.stopPropagation();
		    });	
    	}).on('pagebeforeshow', function(e) {
    		if (DEBUG) console.log(this.id+" "+e.type);
    		// si hay que cargar un nuevo listado, antes de que se vea borro el actual    		
    		if(localStorage.getItem('id_tipus_click')!=localStorage.getItem('id_tipus_actual') || localStorage.getItem('id_area_click')!=localStorage.getItem('id_area_actual'))
    		{	
    			$('#catalogcourselistcontent li').remove(); 
    		}
    		// esto es para el placeholder del filtro de los listados que se pone solo // le pongo el idioma correspondiente, sino pone siempre Filter_items	    	
	        $(".ui-input-search input").attr("placeholder",$._('filter_items'));	        
	    	$('#catalogcoursedetail .ui-content').hide(); // escondo el contenido del curso
	    	
    	}).on('pageshow', function(e) {
    		if (DEBUG) console.log(this.id+" "+e.type);
    		
    		if (DEBUG) console.log("Load course list id_tipus="+localStorage.getItem('id_tipus_click')+" id area="+localStorage.getItem('id_area_click'));
    		if(localStorage.getItem('id_tipus_click')!=localStorage.getItem('id_tipus_actual') || localStorage.getItem('id_area_click')!=localStorage.getItem('id_area_actual'))
			 {							 
				   $('#loading').show();
				   // borro el contenido del filtro
				   $('input[data-type="search"]').val("");
				   $('input[data-type="search"]').trigger("keyup");
			       loadCourseList(localStorage.getItem('id_tipus_click'),localStorage.getItem('id_area_click')); // dentro si funciona modificara el id_tipus_actual
			 }          
	        else
	        {
	            if (DEBUG) console.log("Event list cached");	
	        }   
    		
    	}); 
	    
	    /**********************************************    	 
    	 *   CURSO
    	 ***********************************************/    
    	
    	$('#catalogcoursedetail').on('pageinit', function(e) {
    		if (DEBUG) console.log(this.id+" "+e.type);   
    		// cuando se cargan las imagenes recargo el scrollview
    		/*$('#catalogcoursedetail .courseImage').imagesLoaded( function() {
    			if (DEBUG) console.log("imagen cargada refresh iscroll");   
    			$('#catalogcoursedetail .ui-content').iscrollview("refresh");
    		});*/
    		    		
    	}).on('pageshow', function(e) {
    		if (DEBUG) console.log(this.id+" "+e.type);   
    		if (DEBUG) console.log("Load course id="+localStorage.getItem('id_curs_click'));
  		   if(localStorage.getItem('id_curs_click')!=localStorage.getItem('id_curs_actual'))
  		   {	
  			   $('#loading').show();
  			 $('#catalogcoursedetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
  			   loadCourse(localStorage.getItem('id_curs_click'));  			  
  		   }	
  		   else
  	   	   {	    			  
  			 $('#catalogcoursedetail .ui-content').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
  			  $('#footer_course_detail').show();
  			$('#catalogcoursedetail .ui-content').fadeIn("fast", function () {
  				setTimeout(function(){
  				// llamo con timeout para dar tiempo a que la imagen se carge y calcule su altura                                         
  				  $('#catalogcoursedetail .ui-content').iscrollview("refresh");	
  				  if (DEBUG) console.log("refresh iscroll timeout");   
  					},1000);
	        				       
	        });	 
  	   			if (DEBUG) console.log("Course cached");	
  	   	   }    		
    	}).on('pagehide', function(e) {
	    	if (DEBUG) console.log(this.id+" "+e.type);   
	    	$('#footer_course_detail').hide();	    	
	    	//$('#catalogcoursedetail .ui-content').hide();
	    	//$('#loading').hide();
    	});  
     	
     	
     	 /**********************************************    	 
    	 *   SOLINFO
    	 ***********************************************/     	
     	$('#solinfo').on("pageinit", function(e) {
     		if (DEBUG) console.log(this.id+" "+e.type);

     		//Contador de letras de las preguntas
        	$('#pregunta').keyup(function() {
                var len = this.value.length;
                if (len >= MAX_QUESTION_LETTERS) {
                    this.value = this.value.substring(0, MAX_QUESTION_LETTERS);
                }
                num_cars=MAX_QUESTION_LETTERS - len;
                if(num_cars<0)
                	num_cars=0;
                $('#numChars').text(num_cars);
            });
            
            //Selector de pais, cambio prefijo y mostrar/ocultar codigo postal
            $('#pais').change(function() {
    			 if($('#pais').prop("selectedIndex")!=0)		 
    				$("#prefix").val( "00"+paisprefix[$("#pais").val()] );
    			else
    				$("#prefix").val("");
    			
    			if($("#pais").val()=="ES")
    			{
    				$("#div_postal_code").slideDown();
    				$("#postal").addClass("required");
    				$("#postal").val("");
    			}
    			else
    			{
    				$("#postal").val("");
    				$("#div_postal_code").slideUp();
    				$("#postal").removeClass("required");
    			}
    		});
            $('#pais').append('<option>' + $._( 'country' ) + '</option>');
			
			$('#pais').append('<option value="ES">' + $._( 'spain' ) + '</option>');			
			
			// ESTO VIENE DE LOS FICHEROS DATA/PAISNOM.IDIOMA.JSON 
			jQuery.each( $.paisnom[$._.getLocale()].strings, 
				function(i, val){
					$('#pais').append('<option value="' + i + '">' + val + '</option>');
				});
			
			$('#pais').selectmenu('refresh');

			//Enviamos formulario
			$('#sendsolinfo').click( function(event) {
				sendForm();
			});                		
    		
    		//Link proteccio dades
    		$("#proteccio_link").click(function(){
    			$("#proteccio_dades").slideToggle("normal");
    		});
    		
    		
     	}).on('pagebeforeshow', function(e) {
	    	if (DEBUG) console.log(this.id+" "+e.type);	  		    		    
	    	
	    	$("#proteccio_dades").hide();
			//Miramos si tenemos o no el party_id
			if(localStorage.getItem('id_usuari')=='' || localStorage.getItem('id_usuari')==null)
			{
				$("#not_empty_party_id").hide();
				$("#empty_party_id").show();
				
				$("#party_id").val('');
				$("#party_name").val('');
				$("#nom_party_id").val('');
			}
			else
			{
				$("#not_empty_party_id").show();
				$("#empty_party_id").hide();
				
				$("#party_id").val( localStorage.getItem('id_usuari') );
				$("#party_name").val( localStorage.getItem('nom_usuari') + ' ' + localStorage.getItem('cognom_usuari') );
				$("#nom_party_id").val( localStorage.getItem('nom_usuari') );
				$("#nom_party_id").attr('readonly', true); //Si estamos logados no se puede cambiar el nombre
			}
	    	
	    	//Miramos si el curso tiene o no pregunta para sol. info
			if(localStorage.getItem('te_pregunta')==true)
				$(".question_info").show();
			else
				$(".question_info").hide();
			
			//Inicializamos el valor del contador
			$('#numChars').text(MAX_QUESTION_LETTERS); 
			
			//DATOS AVISO LEGAL PROTECCION DE DATOS
    		if (DEBUG) console.log(URLAPISCHOOL+"getAvisLegal/id_activitat/"+localStorage.getItem('id_curs_actual')+"/idioma/"+$._.getLocale()+"/");
    		$.get(URLAPISCHOOL+"getAvisLegal/id_activitat/"+localStorage.getItem('id_curs_actual')+"/idioma/"+$._.getLocale()+"/",{}, 
		         function(data) {     
		   		 if (DEBUG) console.log("Retorno Get");  
		   						   			   			
					$('#proteccio_dades .text_politica').html(data.avis_legal);	
		           
		         },
		         'json' ).error(function(a) { 
		        	 $('#loading').hide();
		             if(a.status==0) // Si detecta que no hay conexi�n activa 
		            	 doAlert($._('error_no_connection'));
		             else
		            	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
		             // vuelvo al listado de eventos 
		        	// $.mobile.changePage('#event');
		    });	
																		    	
	    });
	    
	}
});		