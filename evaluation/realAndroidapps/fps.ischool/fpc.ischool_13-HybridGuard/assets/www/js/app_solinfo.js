/********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 * ********** NO SE UTILIZA **************
 */
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
	 *   VALIDAMOS LOS DATOS DEL FORMULARIO
	 * 
	 ***********************************************/
	function validaForm()
	{
		if ( localStorage.getItem('id_curs_actual')=='' ) return false;

		var empty_fields=false;
		var numeric_error=false;

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
		    $('#pais').addClass("errorbg");
		       empty_fields=true;
	    }			   
	    else
	    {
	        $('#pais').removeClass("errorbg");
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
	    if (DEBUG) console.log("Post sol infooo");
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
	    
	    $.get(URLAPIFC, 
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
        			  "idioma":$._.getLocale(),
        			  "origen":"APP_SCHOOL",
        			  "nick":$("#nick").val(),
        			  "name":$("#name").val(),
        			  "pregunta":pregunta,
        			 }
        }, 
        function(data) {     
        	if(data)
        	{
        		doAlert($._('sol_info_enviada'));
        		emptyFormValues();
        	}
        	else
        		doAlert($._('sol_info_error'));
        },
        'json' ).error(function(a) { 
        	if(a.status==0) /* Si detecta que no hay conexión activa */
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
	
	}

	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/
    function onDeviceReady() {   

    	$('#sol_info').on("pagecreate", function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);						
		}).on("pageinit", function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);		   		  
		}).on('pageshow', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);			
			
			//Guardamos si el curso tiene o no pregunta para sol. info
			if(localStorage.getItem('te_pregunta')==true)
				$(".question_info").show();
			else
				$(".question_info").hide();
			
			//Inicializamos el valor del contador
			$('#numChars').text(MAX_QUESTION_LETTERS); 
			
			//Borramos el selector de pais
			$('#pais').empty();

			//Rellenamos el selector de pais
			$('#pais').append('<option>-- ' + $._( 'selecciona' ) + ' --</option>');
			$('#pais').append('<option value="ES">' + $._( 'spain' ) + '</option>');
			/* $('#pais').append('<optgroup style="border-top: 1px dotted #ccc; margin: 5px 0;"></optgroup>'); */
			
			jQuery.each( $.paisnom[$._.getLocale()].strings, 
				function(i, val){
					$('#pais').append('<option value="' + i + '">' + val + '</option>');
				});
			
			$('#pais').selectmenu('refresh');

			//Enviamos formulario
			$('#sendsolinfo').click( function(event) {
				sendForm();
			});
		 
		}).on('pagehide', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);		
		});
		
	}
    
	/**********************************************
	 * 
	 *   DOCUMENT READY
	 * 
	 ***********************************************/
    $(document).ready(function() {
        
    	//Contador de letras de las preguntas
    	$('#pregunta').keyup(function() {
            var len = this.value.length;
            if (len >= MAX_QUESTION_LETTERS) {
                this.value = this.value.substring(0, MAX_QUESTION_LETTERS);
            }
            $('#numChars').text(MAX_QUESTION_LETTERS - len);
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
				$("#div_postal_code").slideUp();
				$("#postal").removeClass("required");
			}
		});
        
        //Link proteccio dades
		$("#proteccio_link").click(function(){
			$("#proteccio_dades").slideToggle("normal");
		});
        
    });
    
});		