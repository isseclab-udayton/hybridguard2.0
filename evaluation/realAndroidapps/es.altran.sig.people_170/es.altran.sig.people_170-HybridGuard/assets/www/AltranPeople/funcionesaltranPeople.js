//Variables Glovales
var idcursoglobal=-1;
var ultimaUrl="";

var VolverTipo = 0;
var VolverPagina = 0;

var modoPersona = 0;

//FUNCIONES CURSOS 2
var idpersona;
function Ocultar(id){
	$("#"+id).hide();
}

function Mostrar(id){
	$("#"+id).show();
}

function buscador(){
	Ocultar("listadoPersonas");
	Ocultar("listadoPersona");
	Mostrar("buscador");
	PAGINABUSCAR = 0;		
} 





var PAGINABUSCAR = 0;

function buscar(resetPagina,PaginaAux){
	if (resetPagina){
		PAGINABUSCAR = 0;
	}
	if(PaginaAux >= 0){
		 PAGINABUSCAR = PaginaAux;
	 }
	AgendaON = false;
	$("#personas").html(''); 
	//$("#cargando").remove(); 
	//$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url;
	var criterios="";
	criterios = $("input#criterios").val();
	var callback;
	//Recoger datos del campo criterios
	
	
    url = 'https://sig.altran.es/aesp/json/apipersonas.asp?usuario='+usuario+'&password='+clave+"&criterios="+criterios+"&pagina="+PAGINABUSCAR;
	callback ='resultadoBusqueda';
	$.mobile.loading('show');
    jsonp(url,callback);
}

var AgendaON = false;

function agenda(resetPagina,PaginaAux){
	AgendaON=true;
	
	var d = new Date();
	var ts = d.getTime();	
	
	if (resetPagina){
		PAGINABUSCAR = 0;
	}
	if(PaginaAux >= 0){
		 PAGINABUSCAR = PaginaAux;
	 }	
	Ocultar("listadoPersonas");
	Ocultar("listadoPersona");
	Ocultar("buscador");
	// $("#personas").attr({ 
         // data-filter: "true"

       // });
	//$("#cargando").remove(); 
	//$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url;
	var callback;
	//Recoger datos del campo criterios
    url = 'https://sig.altran.es/aesp/json/apipersonas.asp?usuario='+usuario+'&password='+clave+"&favoritos=1&pagina="+PAGINABUSCAR;
	url += '&ts=' + ts;
	callback ='resultadoBusqueda';
	$.mobile.loading('show');
    jsonp(url,callback);
}

	
	

	
function consultarPersona(idpersona,modoPersona){
	this.modoPersona=modoPersona
	$("#persona").html(''); 
	Ocultar("listadoPersonas");
	Ocultar("buscador");
	Mostrar("listadoPersona");
	//$("#cargando").remove(); 
	//$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url;
	var callback;
		if(modoPersona == 0)url = 'https://sig.altran.es/aesp/json/apipersonas.asp?usuario='+usuario+'&password='+clave+"&idpersonaver="+idpersona;
		if(modoPersona == 1)url = 'https://sig.altran.es/aesp/json/apipersonas.asp?usuario='+usuario+'&password='+clave+"&favoritoset="+idpersona;
		if(modoPersona == 2)url = 'https://sig.altran.es/aesp/json/apipersonas.asp?usuario='+usuario+'&password='+clave+"&criterios=MYID";
		
	var d = new Date();
	var ts = d.getTime();
	url += '&ts=' + ts;
		
	callback ='detallePersona';	 
	$.mobile.loading('show');	
    jsonp(url,callback);
}


function jsonp(url,callback)
{
	ultimaUrl = url;
    // creamos un elemento <script>
    scriptElement = document.createElement("SCRIPT");
    // del tipo javascript
    scriptElement.type = "text/javascript";
    // le agregamos la url que ya creamos en el atributo src
    // y le agregamos la funcion de callback que ya definimos
    scriptElement.src = url + "&jsoncallback="+callback;
    // abrimos la cabecera de la pagina para agregar nuestro script ahi
    document.getElementsByTagName("head")[0].appendChild(scriptElement);
    // y listo , eso genera que el mismo script haga la llamada a flickr y
    //conteste con la funcion que le pasamos de callback y el json con la info
    // de las fotos como parametro
}

function resultadoBusqueda(data) {
		Mostrar("listadoPersonas");
		Ocultar("listadoPersona");
		var result = "";
		var letraAnterior = "";
		var idcursoanterior = "";
		var contador = 0;
		var contadorIndividual = 0;
		var hashtable = {};
		var cadenafoto;
		var pLetra;
		var apellidos;
		$("#persona").html(""); 
		
		//$("#cargando").remove(); 
		if(data.error == "1" || data.items ==""){
			$("#personas").html('<h4>No se encontraron resultados con ese criterio</h4>'); 
		}else{
			var nElementos = data.items.length;
			var elementoActual = 0;
		}
			
		 $.each(data.items, function(key, persona) {	
		  		//Dar formato al json
				elementoActual++;
				
				apellidos = persona.apellidos;
				pLetra = apellidos.substr(0,1);
				contador++;
				 if (pLetra != letraAnterior && contador > 1) {
					result +="<li data-role=\"list-divider\" > "+pLetra+"<span id=\"contador"+pLetra+"\" class=\"ui-li-count\">_</span></li>";
					hashtable['contador'+idcursoanterior] = contadorIndividual;
					contadorIndividual = 0;
				}else if (contador == 1) {
					result +="<li data-role=\"list-divider\" > "+pLetra+ "<span id=\"contador"+pLetra+"\" class=\"ui-li-count\">_</span></li>";					
				}
				contadorIndividual++; 

				result += "<li><a href=\"#\"  onClick=\"javascript: consultarPersona("+persona.idpersona+",0)\">";
				cadenafoto =  persona.foto;
				if(cadenafoto == ""){
					cadenafoto = 'imagenes/foto.jpg';
				}else{
					cadenafoto =cadenafoto.replace('..','https://sig.altran.es/aesp');
				}
				result += "<img src=\""+cadenafoto+"\" />";
				result += "<h3>"+persona.apellidos+" , "+persona.nombre+"</h3>";
				result += "<p> "+persona.desccatprof+"</p>";
				result += "<p class=\"ui-li-aside\"></p></a></li>";
				
				if (persona.total > 0 || (PAGINABUSCAR > 0 && elementoActual == nElementos) ){	
					result += "<li class=\"ui-body ui-body-b\">";
					var JavascriptAdelante = "";
					var JavascriptAtras = "";
					var clase1 = "";
					var clase2 = "";
					if (AgendaON){
						JavascriptAdelante = "agenda(false,"+(PAGINABUSCAR+1)+")";
						JavascriptAtras = "agenda(false,"+(PAGINABUSCAR-1)+")";
					}else{
						JavascriptAdelante = "buscar(false,"+(PAGINABUSCAR+1)+")";
						JavascriptAtras = "buscar(false,"+(PAGINABUSCAR-1)+")";
					}
					
					//console.log("JavascriptAtras:" + JavascriptAtras);
					//console.log("JavascriptAdelante:" + JavascriptAdelante);
					
					if (PAGINABUSCAR > 0 && persona.total > 0){
						result += '<fieldset class="ui-grid-a">';
						clase1 = "ui-block-a";
						clase2 = "ui-block-b";
					}else{
						result += '<fieldset>';
						clase1 = "";
						clase2 = "";						
					}
					if (PAGINABUSCAR > 0){
						result += '<div class="'+clase1+'"><button class="paginado" data-icon="arrow-l" data-iconpos="left" onClick=\"javascript:'+JavascriptAtras+'\">Ant.</buton></div>';
					}
					if (persona.total > 0){
						result += '<div class="'+clase2+'"><button class="paginado" data-icon="arrow-r" data-iconpos="right" onClick=\"javascript:'+JavascriptAdelante+'\">Sig.</buton></div>';
					}
					result += '</fieldset>';

					result += "</li>";
					
					var totalPaginas;
					if (persona.totalpaginas == undefined){
							totalPaginas = (PAGINABUSCAR+1);
					}else{
							totalPaginas = persona.totalpaginas;
					}					
					result += "<li data-role=\"list-divider\" >&nbsp;<span class=\"ui-li-count\">Pagina: "+(PAGINABUSCAR+1)+"/"+totalPaginas+"</span></li>";
				}
				
				$("#personas").html(result); 
				
				idcursoanterior = pLetra;
				letraAnterior = pLetra;
		  });
		  
		   $("#contador"+idcursoanterior).html(contadorIndividual);
		  for (contador in hashtable){
			$("#"+contador).html(hashtable[contador]);
		  }	 	  
		  $.mobile.loading('hide');
		 
    	  $("#personas").listview('refresh');
		 $('.paginado').button();   
		  
	} 
	
	
	function detallePersona(data) {
		var cadenafoto;
		var fotoresponsable;
		var imagenfav;
		Ocultar("listadoPersonas");
		Mostrar("listadoPersona");

		 $.each(data.items, function(key, persona) {	
		  		//Dar formato al json
				result ="<li data-role=\"list-divider\" > "+persona.nombre+" "+persona.apellidos;
				//Favoritos
				if (modoPersona != 2){
					if (persona.favorito == 0) imagenfav = 'estrella-n';
					if (persona.favorito == 1) imagenfav = 'estrella';
				result += "<span class=\"ui-li-count\"><a href=\"#\" onClick=\"javascript: consultarPersona("+persona.idpersona+",1)\"><img src=\"imagenes/"+imagenfav+".png\" width=\"14\" height\"14\"></img></a></span></li>";
				}
				else{
					result += "</li>"
				}
				// Prepara la cadena de la Foto
				cadenafoto =  persona.foto;
				fotoresponsable =  persona.fotoresponsable;
				if(cadenafoto == ""){
					cadenafoto = 'imagenes/foto.jpg';
				}else{
					cadenafoto =cadenafoto.replace('..','https://sig.altran.es/aesp');
				}
				if(fotoresponsable == ""){
					fotoresponsable = 'imagenes/foto.jpg';
				}else{
					fotoresponsable =fotoresponsable.replace('..','https://sig.altran.es/aesp');
				}

				
				result += "<li data-corners=\"false\" data-shadow=\"false\" data-iconshadow=\"true\" data-wrapperels=\"div\" data-icon=\"arrow-r\" data-iconpos=\"right\" data-theme=\"c\" class=\"ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c\">"
					result += "<div class=\"ui-btn-inner ui-li\">"
						result += "<div class=\"ui-btn-text\">"
						result += "<li data-icon=\"false\"><a href=\"#\" class=\"ui-link-inherit\">"
							//result += "<li><a href=\"https://sig.altran.es/aesp/personal/vcard.asp?idpersona="+persona.idpersona+"\" class=\"ui-link-inherit\">"
								result += "<img src=\""+cadenafoto+"\" class=\"ui-li-thumb\"/>"
								result += "<h3 class=\"ui-li-heading\">"+persona.desccatprof+"</h3>"
								$.each(persona.funciones, function(key, funciones) {//Usar para futura Vcard
									if(funciones.departamento != "") result += "<p class=\"ui-li-desc\">"+funciones.departamento+"</p>";//	Usar para futura Vcard				
								});	//Usar para futura Vcard
							result += "</a></li>" 
						result += "</div>"
					result += "</div>"
				result += "</li>"
					
				if (persona.idresponsable > 0){
					result += "<li data-theme=\"b\"><span id='responsable-tr'>Responsable</span></li>";
					result += "<li data-corners=\"false\" data-shadow=\"false\" data-iconshadow=\"true\" data-wrapperels=\"div\" data-icon=\"arrow-r\" data-iconpos=\"right\" data-theme=\"c\" class=\"ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c\">"
						result += "<div class=\"ui-btn-inner ui-li\">"
							result += "<div class=\"ui-btn-text\">"
								result += "<a href=\"#\" onClick=\"javascript:consultarPersona("+persona.idresponsable+",0);\"\" class=\"ui-link-inherit\">"
									result += "<img src=\""+fotoresponsable+"\" class=\"ui-li-thumb\"/>"
									result += "<h3 class=\"ui-li-heading\">"+persona.responsable+"</h3>"
									result += "<p class=\"ui-li-desc\">"+persona.categoriaresponsable+"</p>"
								result += "</a>"
							result += "</div>"
							result += "<span class=\"ui-icon ui-icon-arrow-r ui-icon-shadow\"/>"
						result += "</div>"
					result += "</li>"
				}
				result += "<li data-theme=\"b\"><span id='correo-tr'>Correo</span></li>";
				result += "<li><a class=\"ui-link-inherit\" href=\"mailto:"+persona.e_mail+"\">"+persona.e_mail+"</a></li>";
				if (persona.telefono != ''){
					result += "<li data-theme=\"b\"><span id='telefono-tr'>Telefono</span></li>";
					result += "<li><a class=\"ui-link-inherit\" href=\"tel:"+persona.telefono+"\">"+persona.telefono+"</a></li>";
				}
				if (persona.movil != ''){
				result += "<li data-theme=\"b\"><span id='movil-tr'>Movil</span></li>";
				result += "<li><a class=\"ui-link-inherit\" href=\"tel:"+persona.movil+"\">"+persona.movil+"</a></li>";
				}
				if (modoPersona != 2){
				result += "<li data-theme=\"a\"><a class=\"ui-link-inherit\" href=\"#\" onclick='volverPeople();' data-icon=\"back\"><span id='volver-tr'>Volver</span></a></li>";
				}
				$("#persona").html(result); 
		  });
		  $.mobile.loading('hide');
    	  $("#persona").listview('refresh');
		  traducir("usuario|clave|Correo|Responsable|Mis Datos|Buscador|Desconectar|Buscar|Criterios|Telefono|Correo|Movil");
	}
	
	
	
	
	
	
	function recargaPeople(){
		$(document).ready(function() {
			Ocultar("listadoPersonas");
			Ocultar("listadoPersona");
			Ocultar("buscador");
			if (localStorage.getItem('usuario') == '' && localStorage.getItem('clave') == '' ) {
				document.location.href="../index.html";
			}
			
			buscador();
			traducir("usuario|clave|Correo|Responsable|Mis Datos|Buscador|Desconectar|Buscar|Criterios|Telefono|Correo|Movil");
			function refrescarPopup(){
			$("#pop").listview('refresh');
			}
		});
	}
	
	
	function volverPeople(){
	
		var criterios="";
		criterios = $("input#criterios").val();
	
		if (AgendaON){
			agenda(false,PAGINABUSCAR);
		}else{
			buscar(false,PAGINABUSCAR);
		}
	}
	
	
	
	
	
	
	