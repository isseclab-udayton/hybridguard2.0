//FUNCIONES CURSOS 2

function Ocultar(id){
	$("#"+id).hide();
}

function Mostrar(id){
	$("#"+id).show();
}
	//CONSULTAMOS LOS PROYECTOS
function consultarProyectos(){
	Ocultar("listadoProyectos");
	Ocultar("listadoProyevto");
	$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];
	var url = 'https://sig.altran.es/aesp/json/apiProyectos.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave;
	var callback;
	callback ='consulta';
    //ejecutamos la llamada jsonp
    jsonp(url,callback);
} 


//CONSULTAMOS UN PROYECTO PASANDO IN ID	
function consultarProyecto(idproyecto){
	Ocultar("listadoProyectos");
	Ocultar("listadoProyecto");
	$("#cargando").remove(); 
	$('#page').append('<div align=" center" id="cargando" ><img align="middle" src="imagenes/loading.gif"/></div>');
	var usuario = localStorage["usuario"];
	var clave = localStorage["clave"];	
	var callback;
	
	idproyectoglobal = idproyecto;
	var url = 'https://sig.altran.es/aesp/json/apiProyectos.asp?method=SigEspecial&format=json&usuario='+usuario+'&password='+clave+'&idproyecto='+idproyecto;

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
	
	
	function consulta(data) {
	  Mostrar("listadoProyectos");
	  Ocultar("listadoProyecto");
		var result = "";
		
		
		//$("#cursos").html("<h3>Actualmente no tienes formación prevista.</h3>"); 		
		$("#cargando").remove(); 
		
		 $.each(data.items, function(key, proyecto) {	
		  		//Dar formato al json
				
				result +="<li data-role=\"list-divider\" > "+proyecto.proyectotipo  + ": </li>";
				result += "<li><a href=\"#\"  onClick=\"javascript: consultarProyecto("+proyecto.idproyecto+")\">";
				result += "<h3>"+proyecto.proyectonombre+"</h3>";
				result += "<p><strong>Fecha Inicio:</strong> "+proyecto.proyectoinicio+" </p>";
				result += "<p><strong>Fecha Fin:</strong> "+proyecto.proyectofin+" </p>";
				result += "<p class=\"ui-li-aside\"><strong>Empresa: </strong>"+proyecto.empresanombre+"</p></a></li>";
				
				$("#proyectos").html(result); 
		  });
		  	  
		  
    	  $("#proyectos").listview('refresh');
	} 
	
	
	
		function detalle(data) {
		Ocultar("listadoProyectos");
		Mostrar("listadoProyecto");
		
		//$("#page").append("-->" + ultimaUrl + "<br>");
		
		 $.each(data.items, function(key, proyecto) {	
		  		//Dar formato al json
				result ="<li data-role=\"list-divider\" > "+proyecto.proyectonombre+"<span class=\"ui-li-count\">Empresa "+proyecto.empresanombre+"</span></li>";
				result += "<li><p><strong>"+proyecto.proyectotipo+"</strong></p>";
				result += "<p><strong>Fecha Inicio:</strong> "+proyecto.proyectoinicio+" <strong>Fecha fin:</strong> "+proyecto.proyectofin+"</p>";
				result += "<p class=\"ui-li-aside\"><strong>Codproyecto: </strong>"+proyecto.codproyecto+"</p></li>";
				result += "<li data-theme=\"b\">Descripcion:</li>";
				result += "<li><p>"+proyecto.proyectodescripcion+"</p></li>";
				result += "<li data-theme=\"b\">Resumen:</li>";
				result += "<li><p>"+proyecto.proyectoresumen+"</p></li>";
				$("#cargando").remove(); 
				$("#proyecto").html(result); 
		  });
    	  $("#proyecto").listview('refresh');
	}
















