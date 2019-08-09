//FUNCIONES CURSOS 2

function Ocultar(id){
	$("#"+id).hide();
}

function Mostrar(id){
	$("#"+id).show();
}
	//CONSULTAMOS LOS CURSOS EN FUNCION DE SU MODO O ESTADO
function consultarCursos(modo,estado){
	Ocultar("listadoCursos");
	Ocultar("listadoCurso");
	Ocultar("solicitardiv");
	$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url;
	var orden = 1;
	var callback;
	if (modo=='0'){
		if (estado== '1'){
		url = 'https://sig.altran.es/aesp/json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=0&modoorden="+orden+"&estadocurso=1";
		callback ='realizados';
		}
		else if(estado=='HOY'){
		url = 'https://sig.altran.es/aesp/json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=0&modoorden="+orden+"&fechaInicio=HOY";
		callback ='proceso';
		}
	} else if(modo=='1') {
	url='https://sig.altran.es/aesp/json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+"&modo=1&modoorden="+orden;
	callback ='proximos';
	}
	
    //ejecutamos la llamada jsonp
    jsonp(url,callback);
} 

	//CONSULTAMOS UN CURSO PASANDO IN ID
	
var idcursoglobal=-1;
var ultimaUrl="";
	
function consultarCurso(idcurso,modo){
	Ocultar("listadoCursos");
	Ocultar("listadoCurso");
	Ocultar("solicitardiv");
	$("#cargando").remove(); 
	$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];	
	var url;
	var orden = 1;
	var callback;
	
	idcursoglobal = idcurso;
	
	if (modo== '0'){
		url='https://sig.altran.es/aesp/json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&modo=0&idcurso='+idcurso;
	} else if(modo=='1'){
		url='https://sig.altran.es/aesp/json/apiFormacion.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&modo=1&idcurso='+idcurso;
	}

	callback ='detalle';
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
	
	
	function proceso(data) {
	  Mostrar("listadoCursos");
	  Ocultar("listadoCurso");
	  Ocultar("solicitardiv");
		var result = "";
		var cursoAnterior = "";
		var idcursoanterior = "";
		var contador = 0;
		var contadorIndividual = 0;
		var hashtable = {};
		
		
		$("#cursos").html("<h3>Actualmente no tienes formación prevista.</h3>"); 		
		$("#cargando").remove(); 
		
		 $.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				contador++;
				if (curso.tipo != cursoAnterior && contador > 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + ": <span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";
					hashtable['contador'+idcursoanterior] = contadorIndividual;
					contadorIndividual = 0;
				}else if (contador == 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + ":<span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";					
				}
				contadorIndividual++;

				result += "<li><a href=\"#\"  onClick=\"javascript: consultarCurso("+curso.idcurso+",0)\">";
				result += "<h3>"+curso.curso+"</h3>";
				result += "<p><strong>Fecha Inicio: "+curso.inicio+" </strong></p>";
				result += "<p><strong>Fecha Fin: "+curso.fin+" </strong></p>";
				result += "<p class=\"ui-li-aside\"><strong>Estado: </strong>"+curso.estado+"</p></a></li>";
				
				$("#cursos").html(result); 
				
				idcursoanterior = curso.idtipo;
				cursoAnterior = curso.tipo;
		  });
		  
		  $("#contador"+idcursoanterior).html(contadorIndividual);
		  for (contador in hashtable){
			$("#"+contador).html(hashtable[contador]);
		  }		  
		  
    	  $("#cursos").listview('refresh');
	} 
	
	
	function realizados(data) {
	  Mostrar("listadoCursos");
	  Ocultar("listadoCurso");
	  Ocultar("solicitardiv");
		var result = "";
		var cursoAnterior = "";
		var idcursoanterior = "";
		var contador = 0;
		var contadorIndividual = 0;
		var hashtable = {};
		
		
		$("#cursos").html("<h3>Actualmente no tienes formación realizada.</h3>"); 
		$("#cargando").remove(); 
		 $.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				contador++;
				if (curso.tipo != cursoAnterior && contador > 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + "<span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";
					hashtable['contador'+idcursoanterior] = contadorIndividual;
					contadorIndividual = 0;
				}else if (contador == 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + ":<span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";					
				}
				contadorIndividual++;

				result += "<li><a href=\"#\"  onClick=\"javascript: consultarCurso("+curso.idcurso+",0)\">";
				result += "<h3>"+curso.curso+"</h3>";
				result += "<p><strong>Fecha Inicio: "+curso.inicio+" </strong></p>";
				result += "<p><strong>Fecha Fin: "+curso.fin+" </strong></p>";
				result += "<p class=\"ui-li-aside\"><strong>Estado: </strong>"+curso.estado+"</p></a></li>";
				
				$("#cursos").html(result); 
				
				idcursoanterior = curso.idtipo;
				cursoAnterior = curso.tipo;
		  });
		  
		  $("#contador"+idcursoanterior).html(contadorIndividual);
		  for (contador in hashtable){
			$("#"+contador).html(hashtable[contador]);
		  }		  
		  
    	  $("#cursos").listview('refresh');
	} 
	
	
	function proximos(data) {
		Mostrar("listadoCursos");
		Ocultar("listadoCurso");
		Ocultar("solicitardiv");
		var result = "";
		var cursoAnterior = "";
		var idcursoanterior = "";
		var contador = 0;
		var contadorIndividual = 0;
		
		var hashtable = {};
	
		$("#cursos").html("<h3>No hay cursos pendientes.</h3>"); 
		
		 $.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				contador++;
				if (curso.tipo != cursoAnterior && contador > 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + "<span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";
					hashtable['contador'+idcursoanterior] = contadorIndividual;
					contadorIndividual = 0;
				}else if (contador == 1) {
					result +="<li data-role=\"list-divider\" > "+curso.tipo  + ": <span id=\"contador"+curso.idtipo+"\" class=\"ui-li-count\">_</span></li>";					
				}
				contadorIndividual++;
				result += "<li><a href=\"#\"  onClick=\"javascript: consultarCurso("+curso.idcurso+",0)\">";
				result += "<h3>"+curso.curso+"</h3>";
				result += "<p><strong>Fecha Inicio:</strong> "+curso.inicio+"</p>";
				result += "<p><strong>Fecha Fin:</strong> "+curso.fin+" </p>";
				result += "<p class=\"ui-li-aside\"><strong>Plazas: </strong>"+curso.plazas+"</p></a></li>";
				$("#cargando").remove(); 
				$("#cursos").html(result); 

				idcursoanterior = curso.idtipo;
				cursoAnterior = curso.tipo;
		  });
		  $("#contador"+idcursoanterior).html(contadorIndividual);
		  for (contador in hashtable){
			$("#"+contador).html(hashtable[contador]);
		  }
		  
    	  $("#cursos").listview('refresh');
	} 
	
		function detalle(data) {
		var modo;
		if (data.items==''){
			modo = 1;			
			consultarCurso(idcursoglobal,modo);
		}
		Ocultar("listadoCursos");
		Mostrar("listadoCurso");
		
		//$("#page").append("-->" + ultimaUrl + "<br>");
		
		 $.each(data.items, function(key, curso) {	
		  		//Dar formato al json
				result ="<li data-role=\"list-divider\" > "+curso.curso+"<span class=\"ui-li-count\">"+curso.nombresede+" - "+curso.aula+"</span></li>";
				result += "<li><p><strong>"+curso.tipo+"</strong></p>";
				result += "<p><strong> Inicio Inscripcion:</strong> "+curso.inicioinscripcion+"<strong> Fin Inscripcion:</strong> "+curso.fininscripcion+" </p>";
				result += "<p><strong>Fecha Inicio:</strong> "+curso.inicio+" <strong>Fecha fin:</strong> "+curso.fin+"</p>";
				result += "<p><strong>Horario: </strong>"+curso.horario+"<strong> Horas: </strong> "+curso.horas+"</p>";
				result += "<p class=\"ui-li-aside\"><strong>Plazas: </strong>"+curso.plazas+"</p></li>";
				result += "<li data-theme=\"b\">Audiencia:</li>";
				result += "<li><p>"+curso.audiencia+"</p></li>";
				result += "<li data-theme=\"b\">Objetivo:</li>";
				result += "<li><p>"+curso.objetivo+"</p></li>";
				result += "<li data-theme=\"b\">Descripcion:</li>";
				result += "<li><p>"+curso.descripcion+"</p></li>";
				if (curso.temario != ""){
					result += "<li data-theme=\"b\">Temario:</li>";
					result += "<li><div>"+curso.temario+"</div></li>";
				}
				if(curso.idestado==-1){
					Mostrar("solicitardiv");
				}else{
					Ocultar("solicitardiv");
					result += "<li data-theme=\"a\"><span class=\"ui-li-count\">"+curso.estado+"</span></li>";
				}
				$("#cargando").remove(); 
				$("#curso").html(result); 
		  });
    	  $("#curso").listview('refresh');
	}
	
	function solicitarCurso(){
		alert("Por hacer, Solicitar Curso:" + idcursoglobal);
	}
	
	


















