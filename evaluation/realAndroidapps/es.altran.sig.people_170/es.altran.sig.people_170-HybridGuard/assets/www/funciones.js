

function login() {

			// Cargando
			$("#formularioLogin").hide();
			$("#login").hide();

			
			localStorage.setItem('usuario',$("#clk").val());
			localStorage.setItem('clave',$("#ps").val());
			
			localStorage.setItem('ididioma',$("#ididioma").val());	


			var idioma = localStorage["ididioma"];
			var usuario = localStorage["usuario"];
			var clave = localStorage["clave"];
			
			url = 'https://sig.altran.es/aesp/altranApi/AltranAuth.asp?usuario='+usuario+'&password='+clave+"&criterios=MYID";
			callback ='doLogin';
			jsonp(url,callback);
}

function doLogin(data){
			var usuario = localStorage["usuario"];
			var clave = localStorage["clave"];
			var idioma = localStorage["ididioma"];

	if(data.error == "2" || data.error == "1" || data.error == "3"){
			if(usuario != "" || clave != "" ){
			$("#alerta").html('<h4><font color="red">Usuario / Password incorrectos</font></h4>'); 
			}
			localStorage.setItem('usuario','');
			localStorage.setItem('clave','');
			$("#formularioLogin").show();
			$("#login").show();
		}else{
		document.location.href="AltranPeople/altranPeople.html";
	}	
}

function doLogoff(){
			url = 'https://sig.altran.es/aesp/altranApi/AltranAuth.asp?logoff';
			callback ='logoff';
			jsonp(url,callback);
		localStorage.setItem('usuario','');
		localStorage.setItem('clave','');		
		document.location.href="../index.html";
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



//Funcion para traducir textos

var TextosGlobal;

function traducir(textos){
		 var ididioma = localStorage["ididioma"];
		// NO FUNCIONA (se usa para asignar por defecto el idioma)
		// var opcion;
		// if (ididioma == 1) {
			// opcion = '<option selected id="espanol" value="1" >Español</option>';
			// opcion += '<option id="ingles" value="2" >English</option>';
			// $("#ididioma").html(opcion)
		// }
		// if (ididioma == 2) {
			// opcion = '<option selected id="ingles" value="2" >English</option>';
			// opcion += '<option id="espanol" value="1" >Español</option>';
			// $("#ididioma").html(opcion)
		// }
		if (ididioma == undefined) ididioma = 1;
		if (ididioma != 1){
			var url; 
			var texto = textos; 
			TextosGlobal = textos.split("|");
			url = 'https://sig.altran.es/aesp/altranAPI/AltranTranslate.asp?ididioma='+ididioma+"&textos="+texto;
			callback ='resultadoTraducir';
			jsonp(url,callback);
		}
	}
	
function resultadoTraducir(data){
		 $.each(data.items, function(key,name) {	
			for(var i=0;i<TextosGlobal.length;i++){
				var id = TextosGlobal[i].toLowerCase();
				id = replaceAll(id," ","");
				//cuenta = contar(id,name)
				var texto = name[id];
				console.log(id + ' ' + name[id]);
				TraducirElemento(id,name[id]);
			}
		 });
	}
	
function TraducirElemento(idelemento,texto){

		if (texto != "" && texto != undefined){
			$("#"+idelemento+'-tr').html(texto);
			$("."+idelemento+'-tr').html(texto);
		}else{
			//$("#"+idelemento+'-tr').html("Traducir");
		}

}
	
	
function replaceAll( text, busca, reemplaza ){
  while (text.toString().indexOf(busca) != -1)
      text = text.toString().replace(busca,reemplaza);
  return text;
}



	function atras(){
		 history.go(-1);

	};

	


