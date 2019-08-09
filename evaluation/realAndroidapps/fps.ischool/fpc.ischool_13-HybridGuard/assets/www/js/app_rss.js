$(function() {	
	if( !DESKTOP_NAVIGATOR)
    	document.addEventListener("deviceready", onDeviceReady, false);
  else
  {   
        window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
  }
	function get_rss_id(index)
	{
		var result='';
		var rss_list=JSON.parse(localStorage.getItem('rss_list')); // lo convierto en array	
		if(typeof rss_list[index]!="undefined")
		{			
			result = rss_list[index];			
		}			
		return result;
	}	
	
	function load_next_rss(index)
	{
		id=get_rss_id(index++);
		if(id!='')
			 loadRss(index++,false); 
	}
	function load_previous_rss(index)
	{
		id=get_rss_id(index--);
		if(id!='')
			 loadRss(index--,false); 
	}
	
	function esconder_mostrar_flechas(id_pagina_actual)
	{
		if(id_pagina_actual==0) // si e la primera página el left no se puede hacer
			$("#footer_news .left").hide();
		else
			$("#footer_news .left").show();
		var rss_list=JSON.parse(localStorage.getItem('rss_list'));
		num_paginas=rss_list.length;
		if(id_pagina_actual>=(num_paginas-1)) // si e la ultima página el right no se puede hacer
			$("#footer_news .right").hide();
		else
			$("#footer_news .right").show();		
	}
	
	/**********************************************
	 * 
	 *   LOAD RSS LIST
	 * 
	 ***********************************************/
	function loadRssList(e){
		$('#loading').show();
        if (DEBUG) console.log( 'last rss=' + localStorage.getItem('last_reload_noticies') );	
	    timestamp_actual= new Date().getTime();		    
	    interval_reload_news=timestamp_actual-localStorage.getItem('last_reload_noticies');
        if (DEBUG) console.log("interval reload="+interval_reload_news+">"+MAX_INTERVAL_RELOAD_NEWS);
	    if(interval_reload_news>MAX_INTERVAL_RELOAD_NEWS) 
	    {		
	    	if (DEBUG) console.log("Get rss list");	
	    	// Clear previous content
            $('.message').remove(); // borro el missatge
	    	$('#rsscontent .item_list').remove(); // borro el listado    
	    	$('#content_all_rss .content_page').remove();// borro los divs de las noticias también
	    	localStorage.removeItem('rss_list'); // borro del localStorage la lista
	    	if (DEBUG) console.log("Reload news url="+URLAPISCHOOL+"getLlistatNoticiesAPP/tipus/ESQUERRA/idioma/"+$._.getLocale()+"/");	    	
		    $.get(URLAPISCHOOL+"getLlistatNoticiesAPP/tipus/ESQUERRA/idioma/"+$._.getLocale()+"/",{}, 
		    	function(data) {    
		    	localStorage.setItem('last_reload_noticies',timestamp_actual);
                var emptyData = true;
                var index=0;
                var rss_list=[];
				$.each(data, function (){
                    emptyData = false;                   
	                var htmlitem='<li class="item_list"><a href="#rssdetail" class="newsitemlink" id="'+index+'"><div class="rssThumb"><img src="'+this.foto_thumb+'"  /></div>'+this.titol+'</a></li>';	                
	                $("#rsscontent").append(htmlitem);
	                rss_list[index]=this.id_noticia;	              	                              
	                index++;	                
		         });
				localStorage.setItem('rss_list',JSON.stringify(rss_list));				
	
	             $("#rsscontent").listview("refresh");
	             
	             //Possem el missatge de no hi ha events si cal 
	             if(emptyData)
	             {
	                 var htmlitem='<div class="message">' + $._('empty_news') + '</div>';
	                 $("#rsscontent").parent().parent().append(htmlitem);
	             }
	             $('#loading').hide();
		     },
		     'json' ).error(function(a) {
		    	 $('#loading').hide();
		    	 if(a.status==0) /* Si detecta que no hay conexión activa */
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
	   			if (DEBUG) console.log("RSS list cached");	
	   		}
	}	
	
	/**********************************************
	 * 
	 *   LOAD RSS DETAIL
	 * 
	 ***********************************************/
	
	
	
	function loadRss(id_pagina,show)
	{			
		if(show)
		{
			esconder_mostrar_flechas(id_pagina);
			if(DEBUG) console.log("-->Muestro y cargo la pagina #rssdetail #rss"+id_pagina);	
		}		
		else
		{			
			if(DEBUG) console.log("-->Cargo en segundo plano la pagina #rssdetail #rss"+id_pagina);
		}
		if($('#rssdetail #rss'+id_pagina).length>0) // si existe no hago nada
		{
			$('#loading').hide();
			if(show)
			{				  
				 $('#footer_news').show();
				 $('#content_all_rss').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
				  $('#rssdetail #rss'+id_pagina).fadeIn("fast", function () {
	        			// llamo con timeout para dar tiempo a que la imagen se carge y calcule su altura					  	
					  setTimeout(function(){
						  $('#content_all_rss').iscrollview("resizeWrapper");// lo hago sino la primera vez calcula mal la altura
        				  $('#content_all_rss').iscrollview("refresh");	
        				  if (DEBUG) console.log("refresh iscroll timeout");   
        					},1000);
			        });	        		      		    
				  if(DEBUG) console.log("fade in de  $('#rssdetail #rss"+id_pagina+"')  num paginas visibles="+$('#rssdetail .content_page:visible').length);		
	    		 
			}
			if (DEBUG) console.log("Rss "+id_pagina+" ya cargado");
			return true;
		}
		id=get_rss_id(id_pagina);	
		
		if(id=='') // esto no debería pasar nunca porque se debe comprobar antes de llamar a esta funcion pasa si llamo a la página -1 
		{
			if (DEBUG) console.log("Rss NO EXISTE PAGINA "+id_pagina+" id retornado="+id);				
		}
		else
		{
			if (DEBUG) console.log("Cargo RSS "+id_pagina+ " desde talent");				  
		   		$.get(URLAPISCHOOL+"getNoticiaAPP/id_noticia/"+id+"/idioma/"+$._.getLocale()+"/",{}, 
	        function(data) {
		   		var html='<div  data-role="content" class="content_page content-oracle" id="rss'+id_pagina+'" rel="'+id_pagina+'"><div class="content_page_padding"><h1 id="title" class="title item_info">'+data.titol+'</h1>';					   	
		   		html=html+'<input type="hidden" id="input_share_title" value=""/><input type="hidden" id="input_share_text" value=""/>';
		   		if (data.foto!=null) 
		   		{	
		   			html=html+'<div id="rssdetailImage" class="rssdetailImage item_info"><img src="'+data.foto+'" class="fl img_rss"/></div>';
		   		}
		   		html=html+'<div id="headlines" class="item_info cabecera_destacat">'+addLinksTargetBlank(data.capcelera)+'</div><div id="description" class="item_info">'+addLinksTargetBlank(data.text)+'</div></div></div>';		   		
		   		$('#content_all_rss .iscroll-content').prepend(html);	 
		   		/// SHARE BUTTONS
				var titol_share=data.titol;				
				var text_share=shortString(data.titol,localStorage.getItem('max_length_text_share'))+" "+data.short_url;	
		   		$("#rss"+id_pagina+" #input_share_title").val(titol_share);
		   		$("#rss"+id_pagina+" #input_share_text").val(text_share);
			    youtube_fix('#rssdetail #rss'+id_pagina); // si hay videos de youtube los arregla
			  $('#loading').hide();
			  			  
			  
			  if(show)
			  {
				  $('#footer_news').show();
				  $('#content_all_rss').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
				  $('#rssdetail #rss'+id_pagina).fadeIn("fast", function () {
	        			// llamo con timeout para dar tiempo a que la imagen se carge y calcule su altura
					  setTimeout(function(){	        			
						  $('#content_all_rss').iscrollview("resizeWrapper");// lo hago sino la primera vez calcula mal la altura
        				  $('#content_all_rss').iscrollview("refresh");	
        				  if (DEBUG) console.log("refresh iscroll timeout");   
        					},1000);
			        });	        		      		   
	    		 if (DEBUG) console.log("Rss show");
			  }
	         },
	         'json' ).error(function(a) {
	        	 $('#loading').hide();
	        	 if(a.status==0) /* Si detecta que no hay conexión activa */
	               	 doAlert($._('error_no_connection'));
	                else
	               	 doAlert($._('error_no_connection'));//doAlert("error"+a.statusText+"status"+a.status);
	        	 // vuelvo al listado de noticias 
	        	 $.mobile.changePage('#rssreader');
	        });		   
		}
	}		
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/	
    function onDeviceReady() 
	    /**********************************************    	 
		 *   LISTA RSS
		 ***********************************************/		{  
    	 $('#rssreader').on('pageinit', function(e) {
  		   if (DEBUG) console.log(this.id+" "+e.type);
  		   $('#rsscontent').on("click", ".newsitemlink",function(event) {	  			  
				//var id = event.target.id;	
				var id = event.currentTarget.id;
				if (DEBUG) console.log("clico en noticia "+id);	
				localStorage.setItem('id_rss_actual',id);				 
	    		 event.stopPropagation();	   								
			});
    	 }).on('pageshow', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);					
			loadRssList(e);					
			//$('#rssdetail .ui-content').hide(); // escondo el contenido de la noticia		
		}).on('pagehide', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);						
			//$('#loading').hide();
		});
    	 /**********************************************    	 
  	      *  RSS
     	  ***********************************************/
		 $('#rssdetail').on('pageshow', function(e) {
			 if (DEBUG) console.log(this.id+" "+e.type);			 
    		  $('#loading').show();
    		 // HACER UN PARSE INT DE LA PÁGINA
    		 loadRss(localStorage.getItem('id_rss_actual'),true); // Load rss actual  	 	
    		 load_next_rss(localStorage.getItem('id_rss_actual')); // Load rss siguiente
    		 load_previous_rss(localStorage.getItem('id_rss_actual'));// load rss anterior    		
		 }).on('pagehide', function(e) {	 
	           if (DEBUG) console.log(this.id+" "+e.type);		          
	           $('#rssdetail .content_page').hide();
	       	   $('#footer_news').hide();
	      });
		 
		 
		 /**********************************************    	 
  	      *  CAMBIO A SIGUIENTE / ANTERIOR RSS
     	  ***********************************************/		 
		 
		 function swipe_rss_left()
		 {
			//rss_actual=$('#rssdetail .content_page:visible');
			rss_actual=$('#rssdetail #rss'+localStorage.getItem('id_rss_actual'));
			// por si acaso escondo todos el que no es el actual
			$('#rssdetail .content_page:not(#rss'+localStorage.getItem("id_rss_actual")+')').hide();
			num_pag_next=parseInt(rss_actual.attr("rel"))+1;// en el rel guardo la página actual	
			rss_seguent=$('#rss'+num_pag_next);		
			if (DEBUG) console.log("cargo pagina derecha:pagina actual="+rss_actual.attr("rel")+"  pagina siguiente="+num_pag_next+" num pags visibles="+$('#rssdetail .content_page:visible').length);				
			if(rss_seguent.length==1)// si existe la siguiente página
			{
				esconder_mostrar_flechas(num_pag_next);			
				rss_actual.fadeOut("fast", function () {
					rss_seguent.fadeIn("fast");
				 });	 	
				$('#content_all_rss').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba
				//llamo con timeout para dar tiempo a que haga la transición    			
			    setTimeout(function(){	        					        			
				  $('#content_all_rss').iscrollview("refresh");	
				  if (DEBUG) console.log("refresh iscroll timeout");   
					},1000);
				localStorage.setItem('id_rss_actual',num_pag_next);
				load_next_rss(num_pag_next); // Load rss siguiente		    		 
			}				
			else
			{
				if (DEBUG) console.log("a la derecha no hay más paginas");
			}
		 }
		 function swipe_rss_right()
		 {
			 //rss_actual=$('#rssdetail .content_page:visible');
			rss_actual=$('#rssdetail #rss'+localStorage.getItem('id_rss_actual'));			
			// por si acaso escondo todos el que no es el actual
			$('#rssdetail .content_page:not(#rss'+localStorage.getItem("id_rss_actual")+')').hide();
			num_pag_previous=parseInt(rss_actual.attr("rel"))-1;// en el rel guardo la página actual
			if (DEBUG) console.log("cargo pagina izquerda:pagina actual="+rss_actual.attr("rel")+"  pagina anterior="+num_pag_previous);
			rss_anterior=$('#rss'+num_pag_previous);
			if(rss_anterior.length==1)// si existe la página anterior
			{           				
				esconder_mostrar_flechas(num_pag_previous);				
				rss_actual.fadeOut("fast", function () {
					rss_anterior.fadeIn("fast");					
				});
				$('#content_all_rss').iscrollview("scrollTo", 0, 0, 0, false);// pongo el scroll arriba				
				/// SHARE BUTTONS
				var titol_share=data.titol;
				var text_share=data.short_url+" "+shortString(data.titol,localStorage.getItem('max_length_text_share'));
				$('#rssdetail #button_share_android').attr("share_title",titol_share);
				$('#rssdetail #button_share_android').attr("share_text",text_share);

				
				//llamo con timeout para dar tiempo a que haga la transición    			
			    setTimeout(function(){	        					        			
				  $('#content_all_rss').iscrollview("refresh");	
				  if (DEBUG) console.log("refresh iscroll timeout");   
					},1000);
				localStorage.setItem('id_rss_actual',num_pag_previous);				
				load_previous_rss(num_pag_previous);// load rss anterior  
				
				 
			}
			else
			{
				if (DEBUG) console.log("a la izquierda no hay más paginas");
			} 
		 }
		 		
	/*	
	 * con el swipe hace el loco y se queda la página en blanco y deja de hacer el show
	 * 
	 * 
	 * 
	 *  $("#rssdetail #content_all_rss").on('swipeleft',function(event){
				if (DEBUG) console.log("event="+event.type);									  
				swipe_rss_left();
		        event.preventDefault();
		    }).on('swiperight',function(event){
				if (DEBUG) console.log("event="+event.type);
				swipe_rss_right();
				event.preventDefault();
		    });*/		 
		 $("#footer_news div.left").on('click',function(event){
			 if (DEBUG) console.log("event="+event.type);
			 swipe_rss_right();
			 event.preventDefault();
		 });
		 $("#footer_news div.right").on('click',function(event){
			 if (DEBUG) console.log("event="+event.type);
			 swipe_rss_left();
			 event.preventDefault();
		 });
		 
       
    }
});		