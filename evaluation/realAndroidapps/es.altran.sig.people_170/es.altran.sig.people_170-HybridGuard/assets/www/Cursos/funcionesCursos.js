//FUNCIONES CURSOS 2

//Variables Glovales
var presencial;
var idcurso; // ID del curso 
var idpersona; // ID de la Persona
var PAGINABUSCAR = 0; // Pagina que queremos mostar del paginado
var modo; var estado;// Modo de busqueda y estado  0,1 = Mi formacion        0,Hoy = Mi proxima Formacion        1,0 = Proximos Cursos    2,0 = Buscador Cursos

var SERVIDORSIG = 'https://sig.altran.es/aesp/';


function Ocultar(id){
	$("#"+id).hide();
}

function Mostrar(id){
	$("#"+id).show();
}

//Funciones para descargar Documentacion

function loadURL(url){
	//alert("LLega")
    //navigator.app.loadUrl(url, { openExternal:true });
	//window.plugins.childBrowser.showWebPage(url, { showLocationBar: false });
	window.plugins.childBrowser.openExternal(url);
	//return false;
} 



	//CONSULTAMOS LOS CURSOS EN FUNCION DE SU MODO O ESTADO
function consultarCursos(resetPagina,modo,estado,PaginaAux){
	
	Ocultar("buscador");
	Ocultar("listadoCursos");
	Ocultar("listadoCurso");
	Ocultar("solicitardiv");
	Ocultar("cancelardiv");	
	Ocultar("solicitardivDistancia");
	Ocultar("buscadorCursos");
	this.modo=modo;
	this.estado=estado;

	
	if(resetPagina){
		PAGINABUSCAR = 0;
	}
	if(PaginaAux >= 0){
		 PAGINABUSCAR = PaginaAux;
	 }
	$('#cargando').show();
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url;
	var orden = 1;
	var callback;
	if (modo=='0'){
		if (estado== '1'){
		url = SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=0&modoorden="+orden+"&estadocurso=1,2,4,11&pagina="+PAGINABUSCAR;
		}
		else if(estado=='HOY'){
		url = SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=0&modoorden="+orden+"&fechaInicio=HOY&pagina="+PAGINABUSCAR;
		}
	} else if(modo=='1') {
		url=SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=1&modoorden="+orden+"&pagina="+PAGINABUSCAR;
	} else if(modo=='2') {
		url=SERVIDORSIG+'json/apiFormacion.asp?criteriobusqueda='+criteriobusqueda+'&method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=2&modoorden="+orden+"&pagina="+PAGINABUSCAR;
	}

	
	var d = new Date();
	var ts = d.getTime();
	url += "&ts=" + ts;
	
	callback ='resultado';
    //ejecutamos la llamada jsonp
	$.mobile.loading('show');
    jsonp(url,callback);
} 

var criteriobusqueda = ''

function buscadorCursos(){
	Mostrar("buscadorCursos");
	//$("#criteriobusqueda").val(criteriobusqueda);
	Ocultar("listadoCursos");
	Ocultar("listadoCurso");	
	Ocultar("solicitardiv");
	Ocultar("solicitardivDistancia");	
}

function buscarCurso(){
	criteriobusqueda = $("#criteriobusqueda").val();
	consultarCursos(true,2,0);
}

	//CONSULTAMOS UN CURSO PASANDO IN ID
	
var idcursoglobal=-1;
var ultimaUrl="";
	
function consultarCurso(idcurso,modo){
	Ocultar("listadoCursos");
	Ocultar("listadoCurso");	
	Ocultar("solicitardiv");
	Ocultar("cancelardiv");
	Ocultar("solicitardivDistancia");
	Ocultar("buscadorCursos");

	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];	
	var url;
	var orden = 1;
	var callback;
	
	idcursoglobal = idcurso;
	
	if (modo== '0'){
		url=SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&modo=0&idcurso='+idcurso;
	} else if(modo=='1'){
		url=SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&modo=1&idcurso='+idcurso;
	} else if(modo=='2'){
		url=SERVIDORSIG+'json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&modo=2&idcurso='+idcurso;
	}

	var d = new Date();
	var ts = d.getTime();
	url += "&ts=" + ts;	
	
	callback ='detalleCurso';
	$.mobile.loading('show'); // Mostrar Simbolo de carga
    jsonp(url,callback);
}  

function jsonp(url,callback)//Funcion para consultar JsonP
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
	//console.log(url);
}
	
	
	// Resultado de la llamada Jsonp
	function resultado(data) {
		Ocultar("cancelardiv");
		Ocultar("listadoCurso");
		Ocultar("solicitardiv");
		Ocultar("solicitardivDistancia");
		Mostrar("listadoCursos");
		
		// if(modo=='2'){
			// $('#cursos').attr("data-filter", "false");
		//	alert("aqui1")
		// }else{
			// $('#cursos').attr("data-filter", "true");
		//	alert("aqui2")
		// }
		
		var result = "";
		var cursoAnterior = "";
		var idcursoanterior = "";
		var contador = 0;
		var contadorIndividual = 0;	
		
		var hashtable = {};
		
		if (modo=='0'){
			if (estado== '1'){
				$("#cursos").html("<h3><span id='actualmentenotienesformacionrealizada-tr'>Actualmente no tienes formación realizada</span>.</h3>"); 
			}
			else if(estado=='HOY'){
			$("#cursos").html("<h3><span id='actualmentenotienesformacionprevista-tr'>Actualmente no tienes formación prevista</span>.</h3>"); 
			}
		} else if(modo=='1') {
			$("#cursos").html("<h3><span id='nohaycursospendienrtes-tr'>No hay cursos pendientes</span>.</h3>"); 
		} else if(modo=='2') {
			$("#cursos").html("<h3><span id='nohaycursospendienrtes-tr'>No hay resultados.</span>.</h3>"); 
		}
		
		var nElementos = data.items.length;
		var elementoActual = 0;
		
		if(data.error == "2"){
			alert("Usuario / Password incorrectos");
			localStorage.setItem('usuario','');
			localStorage.setItem('clave','');
			document.location.href="../index.html";
		}
		
			$.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				contador++;
				elementoActual++;
				if (curso.tipo != cursoAnterior && contador > 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + "<span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";
					hashtable['contador'+idcursoanterior] = contadorIndividual;
					contadorIndividual = 0;
				}else if (contador == 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + ": <span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";					
				}
				contadorIndividual++;
				var inicioinscripcion = curso.inicioinscripcion;
				var fininscripcion = curso.fininscripcion;
				var corteInicio = inicioinscripcion.substring(0,5);
				var corteFin = fininscripcion.substring(0,5);
				

				if(modo=='2'){
					result += "<li><a href=\"#\"  onClick=\"javascript: consultarCurso("+curso.idcurso+",2)\">";
				}else{
					result += "<li><a href=\"#\"  onClick=\"javascript: consultarCurso("+curso.idcurso+",0)\">";
				}
				result += "<h3>"+curso.curso+"</h3>";

				//Inscripcion o fechas de curso segun si es para ver proximos o ya mi formacion
				if (modo=='0'){
					if (estado== '1'){
						result += "<p><strong><span class='formacionde-tr'>De</span>: </strong>"+curso.inicio+" a "+curso.fin;
					}
					else if(estado=='HOY'){
						result += "<p><strong><span class='formacionde-tr'>De</span>: </strong>"+curso.inicio+" a "+curso.fin;
					}
				} else if(modo=='1') {
					result += "<p><strong><span class='inscripcionde-tr'>Inscripción de</span>: </strong>"+corteInicio+" a "+corteFin;
				} else if(modo=='2') {
					result += "<p><strong><span class='formacionde-tr'>De</span>: </strong>"+curso.inicio+" a "+curso.fin;
				}

				if (curso.idestado==2){
					result+="<font color='red'> Solicitado</font>"
				}else if(curso.idestado==11){
					result+="<font color='red'> Solicitado</font>"
				}else if(curso.idestado==4){
					result+="<font color='red'> Aprobado</font>"
				}

				result+="</p>";
				//Nombre de la sede
				result += "<p><strong><span class='sede-tr'>Sede</span>: </strong>"+curso.nombresede+"</p></a></li>";
				//Paginado si procediara
				if (curso.total > 0 || (PAGINABUSCAR > 0 && elementoActual == nElementos) ){	
					result += "<li class=\"ui-body ui-body-b\">";
					var JavascriptAdelante = "";
					var JavascriptAtras = "";
					var clase1 = "";
					var clase2 = "";
					
					if (modo=='0'){
						if (estado== '1'){
							JavascriptAdelante = "consultarCursos(false,0,1,"+(PAGINABUSCAR+1)+")";
							JavascriptAtras = "consultarCursos(false,0,1,"+(PAGINABUSCAR-1)+")";
						}
						else if(estado=='HOY'){
						JavascriptAdelante = "consultarCursos(false,0,'HOY',"+(PAGINABUSCAR+1)+")";
						JavascriptAtras = "consultarCursos(false,0,'HOY',"+(PAGINABUSCAR-1)+")";
						}
					} else if(modo=='1') {
						JavascriptAdelante = "consultarCursos(false,1,0,"+(PAGINABUSCAR+1)+")";
						JavascriptAtras = "consultarCursos(false,1,0,"+(PAGINABUSCAR-1)+")";					
					} else if(modo=='2') {
						JavascriptAdelante = "consultarCursos(false,2,0,"+(PAGINABUSCAR+1)+")";
						JavascriptAtras = "consultarCursos(false,2,0,"+(PAGINABUSCAR-1)+")";
					}
					
					//console.log("JavascriptAtras:" + JavascriptAtras);
					//console.log("JavascriptAdelante:" + JavascriptAdelante);
					
					if (PAGINABUSCAR > 0 && curso.total > 0){
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
					if (curso.total > 0){
						result += '<div class="'+clase2+'"><button class="paginado" data-icon="arrow-r" data-iconpos="right" onClick=\"javascript:'+JavascriptAdelante+'\">Sig.</buton></div>';
					}
					result += '</fieldset>';

					result += "</li>";
					
					var totalPaginas;
					if (curso.totalpaginas == undefined){
							totalPaginas = (PAGINABUSCAR+1);
					}else{
							totalPaginas = curso.totalpaginas;
					}					
					result += "<li data-role=\"list-divider\" >&nbsp;<span class=\"ui-li-count\">Pagina: "+(PAGINABUSCAR+1)+"/"+totalPaginas+"</span></li>";
				}
				//Fin Paginado
				
				$("#cursos").html(result); 

				idcursoanterior = curso.idtipo;
				cursoAnterior = curso.tipo;
			});
		  $("#contador"+idcursoanterior).html(contadorIndividual);
		  for (contador in hashtable){
			$("#"+contador).html(hashtable[contador]);
		  }
		  
    	 //Traducir en caso de que sea necesario
		  traducir("Correo|Responsable|Mi Formacion|Mi Proxima Formacion|Desconectar|Buscar|Proximos Cursos|Audiencia|Objetivo|Descripcion|Temario|Solicitar|Cancelar|Menu|Inicio Inscripcion|Fin Inscripcion|Fecha Inicio|Fecha Fin|Horario|Horas|Sede|Actualmente no tienes formación realizada|Actualmente no tienes formación prevista|No hay cursos pendientes");
		  //Refrescar lista
		  $.mobile.loading('hide');
    	  $("#cursos").listview('refresh');
		  $('.paginado').button();   
	} 
	
		function detalleCurso(data) {
		
		var teleasistencia;
		if (data.items==''){
			modo = 1;			
			consultarCurso(idcursoglobal,modo);
		}
		//Ocultar("buscador");
		Ocultar("listadoCursos");
		Mostrar("listadoCurso");
		//$("#page").append("-->" + ultimaUrl + "<br>");
		
		 $.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				result ="<li data-role=\"list-divider\" > "+curso.curso+"</li>";
				result += "<li><p><strong>"+curso.tipo+"</strong></p>";
				result += "<p><strong><span class='lugar-tr'>Lugar</strong>: </span>"+curso.nombresede+" - "+curso.aula+"</p>";
					if (curso.solopresencial == "Verdadero") teleasistencia = "No";
					else teleasistencia = "Si";
				result += "<p><strong><span id='teleasistencia-tr'>Teleasistencia</span>:</strong> "+teleasistencia+"</p>";
				result += "<p><strong><span id='inicioinscripcion-tr'>Inicio Inscripcion</span>:</strong> "+curso.inicioinscripcion+" <strong><span id='fininscripcion-tr'>Fin Inscripcion</span>:</strong> "+curso.fininscripcion+" </p>";
				result += "<p><strong><span id='fechainicio-tr'>Fecha Inicio</span>:</strong> "+curso.inicio+" <strong><span id='fechafin-tr'>Fecha Fin</span>:</strong> "+curso.fin+"</p>";
				result += "<p><strong><span id='horario-tr'>Horario</span>: </strong>"+curso.horario+" <strong><span id='horas-tr'>Horas</span>: </strong> "+curso.horas+"</p>";
				result += "<p class=\"ui-li-aside\"></li>"; //<strong><span id='plazas-tr'>Plazas</span>: </strong>"+curso.plazas+"</p>
				result += "<li data-theme=\"b\"><span id='audiencia-tr'>Audiencia</span>:</li>";
				result += "<li><p>"+curso.audiencia+"</p></li>";
				result += "<li data-theme=\"b\"><span id='objetivo-tr'>Objetivo</span>:</li>";
				result += "<li><p>"+curso.objetivo+"</p></li>";
				result += "<li data-theme=\"b\"><span id='descripcion-tr'>Descripcion</span>:</li>";
				result += "<li><p>"+curso.descripcion+"</p></li>";
				if (curso.temario != ""){
					result += "<li data-theme=\"b\"><span id='temario-tr'>Temario</span>:</li>";
					result += "<li><div>"+curso.temario+"</div></li>";
				}				
				if (curso.documentacion != ""){
					result += "<li data-theme=\"b\"><span id='temario-tr'>Documentación</span>:</li>";
					result += "<li><div><a class=\"ui-link-inherit\" href='#' data-role='button' onClick=\"loadURL('"+SERVIDORSIG+'repositorio/nivel0/nivel1/'+curso.documentacion+"')\" >Ver Documentación </a></div></li>";
					//result += "<li><div><a class=\"ui-link-inherit\" href='#' data-role='button' onClick=\"loadURL('http://www.google.com')\" >Ver google </a></div></li>";
					//result += "<li><div><a href='#' data-role='button' onClick=\"descargarArchivo('"+SERVIDORSIG+'repositorio/nivel0/nivel1/'+curso.documentacion+"')\" >Descargar Documentación 1</a></div></li>";
					//result += "<li><div><a href=\""+SERVIDORSIG+'repositorio/nivel0/nivel1/'+curso.documentacion+"\" data-role='button' target=\"_blank\">Ver Documentación 2</a></div></li>";
				}
				result += "<li data-theme=\"a\"><a class=\"ui-link-inherit\" href=\"#\" onclick='volverCursos();' data-icon=\"back\"><span id='volver-tr'>Volver</span></a></li>";
				if(modo==2){
					}else{
					if(curso.idestado==-1){
						Mostrar("solicitardiv");
						idcurso = curso.idcurso;
						idpersona= curso.idpersona;
						if (curso.solopresencial == "Falso"){
						presencial = "Falso";
							Mostrar("solicitardivDistancia");
						} 
					}else{
						idcurso = curso.idcurso;
						idpersona= curso.idpersona;
						
						Ocultar("solicitardiv");

						if (curso.idestado == 2 || curso.idestado== 11){
							Mostrar("cancelardiv");
						}
						result += "<li data-theme=\"a\"><span id='spancursoestado' class=\"ui-li-count\">"+curso.estado+"</span></li>";
					}
				}	
				$("#curso").html(result); 
		  });
		  //Traducir en caso de que sea necesario
		  traducir("Correo|Responsable|Mi Formacion|Mi Proxima Formacion|Desconectar|Buscar|Proximos Cursos|Audiencia|Objetivo|Descripcion|Temario|Solicitar|Cancelar|Menu|Inicio Inscripcion|Fin Inscripcion|Fecha Inicio|Fecha Fin|Horario|Horas|Lugar|Formacion de|Inscripcion de|Sede|Teleasistencia|Solicitar a distancia");
		  //Refrescar lista
		  //$('#cargando').hide();
		  $.mobile.loading('hide');
    	  $("#curso").listview('refresh');
	}
	
	function solicitarCurso(idcurso,idpersona,modoSolicitar){

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} var today = dd+'/'+mm+'/'+yyyy;
	
		if (modoSolicitar == 1){
			url="https://sig.altran.es/aesp/Formacion/FormacionCursoInscritoBD.asp?IdCurso="+idcurso+"&IdPersona="+idpersona+"&Fecha="+today+"&Prioridad=3&Origen=CURSO&EnviarMails=on&IdEstado=2&Modo=2";
		}else{
			url="https://sig.altran.es/aesp/Formacion/FormacionCursoInscritoBD.asp?IdCurso="+idcurso+"&IdPersona="+idpersona+"&Fecha="+today+"&Prioridad=3&Origen=CURSO&EnviarMails=on&IdEstado=11&Modo=2";
		}	
		
		var callback = 'solicitar';
		$.mobile.loading('show');
		$.getJSON(url);
		//jsonp(url,callback);
		
		var result = "<li data-theme=\"a\"><span id='spancursoestado' class=\"ui-li-count\">Solicitado</span></li>";
		 $.mobile.loading('hide');

	
		if ($("#spancursoestado").size() == 0){
			//alert("No existe span");
			$("#curso").html($("#curso").html()+result); 			
			$("#curso").listview('refresh');
		}else{
			$("#spancursoestado").html("Solicitado"); 
		}
		Ocultar("solicitardiv");
		Ocultar("solicitardivDistancia");
		Mostrar("cancelardiv");
	}


	function cancelarCurso(idcurso,idpersona){

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!

		var yyyy = today.getFullYear();
		if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} var today = dd+'/'+mm+'/'+yyyy;
	
		url="https://sig.altran.es/aesp/Formacion/FormacionCursoInscritoBD.asp?IdCurso="+idcurso+"&IdPersona="+idpersona+"&Fecha="+today+"&Prioridad=3&Origen=CURSO&EnviarMails=on&Modo=3"
		
		
		var callback = 'cancelar';
		$.mobile.loading('show');
		//jsonp(url,callback);
		$.getJSON(url);
		$.mobile.loading('hide');
		Ocultar("cancelardiv");
		$("#spancursoestado").html("Cancelada inscripción");
		Mostrar("solicitardiv");
		if (presencial == "Falso"){
			Mostrar("solicitardivDistancia");
		} 
		
		
	}	
	
	function recargaCursos(){
		$(document).ready(function() {
			
			Ocultar("cancelardiv");
			Ocultar("solicitardiv");
			Ocultar("listadoCursos");
			Ocultar("listadoCurso");
			Ocultar("solicitardivDistancia");
			Ocultar("buscadorCursos");
			if (localStorage.getItem('usuario') == '' && localStorage.getItem('clave') == '' ) {
				document.location.href="index.html";
			}
			
				consultarCursos("true","1","0");
				traducir("Correo|Responsable|Mi Formacion|Mi Proxima Formacion|Desconectar|Buscar|Proximos Cursos|Audiencia|Objetivo|Descripcion|Temario|Solicitar|Cancelar|Menu|Inicio Inscripcion|Fin Inscripcion|Fecha Inicio|Fecha Fin|Horario|Horas|Volver");
			
			function refrescarPopup(){
			$("#pop").listview('refresh');
			}
		});
	}
	
	function volverCursos(){
		//Evaluacion estado anterior
		if (modo=='0'){
			if (estado== '1'){
					consultarCursos("false","0","1",PAGINABUSCAR);
				}
			else if(estado=='HOY'){
			consultarCursos("false","0","HOY",PAGINABUSCAR);
			}
		} else if(modo=='1') {
			consultarCursos("false","1","0",PAGINABUSCAR);
		} else if(modo=='2') {
			buscarCurso();
		}
	}
	

	


















