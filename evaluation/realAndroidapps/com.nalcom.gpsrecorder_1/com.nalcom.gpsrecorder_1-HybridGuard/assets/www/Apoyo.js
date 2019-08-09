/*
 * 
 * Apoyo, calculos y tratamiento de datos
 */

function MejorPosicion(contenedor){
	
	var valor, aux, elegido;
	//alert("seleccion");
	
	valor = contenedor[0].coords.accuracy;
	
	//alert("Entrando en seleccion");
	for(var i=0;i<contenedor.length;i++){
		aux=contenedor[i].coords.accuracy;
		if(valor<=aux){
			valor=aux;
			elegido=contenedor[i];
		}
	}
	
	MiAccuracydeCorte(contenedor);

	return elegido;
}


function getFecha(){

	var fecha = new Date();
	var paquete;
	var ano = fecha.getFullYear().toString();
	var mes = (fecha.getMonth()+1).toString();
	var dia= fecha.getDate().toString();
	var hora = fecha.getHours().toString();
	var min = fecha.getMinutes().toString();
	var sec = fecha.getSeconds().toString();
	
	
	if(mes.length==1){
		mes="0"+mes;
	}
	if(dia.length==1){
		dia="0"+dia;
	}
	if(hora.length==1){
		hora="0"+hora;	
	}
	if(min.length==1){
		min="0"+min;
	}
	if(sec.length==1){
		sec="0"+sec;
	}
	paquete = dia+"/"+mes+"/"+ano+", "+hora+":"+min+":"+sec;
	
	return paquete;
}

function Redes(){
	var mired = navigator.connection.type;//recoge mi red
		
		var estado = [8];
		
		
		estado[Connection.UNKNOWN]  = 'Conexión desconocida';
	    estado[Connection.ETHERNET] = 'Conexión ethernet';
	    estado[Connection.WIFI]     = 'Conexión WiFi';
	    estado[Connection.CELL_2G]  = 'Conexión movil 2G';
	    estado[Connection.CELL_3G]  = 'Conexión movil 3G';
	    estado[Connection.CELL_4G]  = 'Conexión movil 4G';
	    estado[Connection.CELL]     = 'Cell generic connection';
	    estado[Connection.NONE]     = 'Sin conexión';
	    
	    estado[mired];
	    
	    if(estado[mired]== 'Sin conexión'){
	    	return false;
	    }else{
	    	return true;
	    }
}

function MiAccuracydeCorte(todas){
	
	var accuracys = [];
	var valores=parseInt(0);
	var valorFinal=parseInt(0);
	
	for(var i=0;i<todas.length;i++){
		accuracys.push(todas[i].coords.accuracy);
	}
	
	var local = localStorage.getItem('accuracy_corte');
	
	if(!local){
		local=0;
	}
	
	accuracys.push(local);
	var cont=0;
	for(var i=0;i<accuracys.length;i++){
		
		if(!isNaN(accuracys[i])){
			if(parseInt(accuracys[i])<40){
				valores +=parseInt(accuracys[i]);
				cont++;
			}
			
		}
		
		
			
	}
	
	
	valorFinal= valores/((cont));
	
	
	localStorage.setItem('accuracy_corte',valorFinal);
	
}





function loadingScreen(){
	cancelAll=false;
	$("#loading").show();
	$("#loading_1").show();
	$("#red").hide();
	
	
	$("#cancel").click(function(){
		navigator.geolocation.clearWatch(timerInterval);
		clearTimeout(timerOut);
		
		estadoOnPause=false;
		
		cancelAll=true;
		fija=null;
		$("#caja").val('');
		$("#cargando").hide();
		$("#research").show();
		$("#stopresearch").hide();
		unloadingScreen();
		
		
		
	});
	
	

}


function unloadingScreen(){
	
	$("#loading").hide();
	
	$("#loading_1").hide();
}





function onGrades(grade){
	
	grados=grade.magneticHeading;
	

	if(!grados || grados==0){
		grados = 1;
	}
	if(!colorFlecha){
		colorFlecha="rojas";
	}
	
	if(grados>=11.25 && grados <33.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_22-5.png";
	}
	if(grados>=33.75 && grados<56.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_45.png";
	}
	if(grados>=56.25 && grados<78.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_67-5.png";
	}
	if(grados>=78.75 && grados<101.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_90.png";
	}
	if(grados>=101.25 && grados<123.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_112-5.png";
	}
	if(grados>=123.75 && grados<146.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_135.png";
	}
	if(grados>=146.25 && grados<168.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_157-5.png";
	}
	if(grados>=168.75 && grados<191.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_180.png";
	}
	if(grados>=191.25 && grados<213.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_202-5.png";
	}
	if(grados>=213.75 && grados<236.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_225.png";
	}
	if(grados>=236.25 && grados<258.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_247-5.png";
	}
	if(grados>=258.75 && grados<281.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_270.png";
	}
	if(grados>=281.25 && grados<303.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_292-5.png";
	}
	if(grados>=303.75 && grados<326.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_315.png";
	}
	if(grados>=326.25 && grados<348.75){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_337-5.png";
	}
	if(grados>=348.75 || grados<11.25){
		flecha = "iconos/flechas/"+colorFlecha+"/flecha_0.png";
	}
	
	if(markers[0]){
		markers[0].setIcon(flecha);
	}
	

	
}

function CargarWidget(){
	
	if(!(localStorage.getItem('timerSetting'))){
		localStorage.setItem('timerSetting', 10000);
		timerSetting=localStorage.getItem('timerSetting');
	}
	
	var milisec = localStorage.getItem('timerSetting');
	var numActual = milisec.charAt(0)+""+milisec.charAt(1);
	
	var paquete= "";

	for (i=10;i<31;i++){
		if(parseInt(numActual)==i){
			paquete = paquete + "<div class='item'><font color='green'>"+i+" sec"+"</font></div>";
		}else{
			paquete = paquete + "<div class='item'><font>"+i+" sec"+"</font></div>";
		}
		
	}
	$("#listNumber").append(paquete);
	
	$(".item").click(function(){
		
		$(this).children().css('color', 'green');
		
		var trozo =  $(this).children().text();
		var sec= trozo.charAt(0)+""+trozo.charAt(1);
		
		//alert(sec);
		timerSetting=sec+"000";
		localStorage.setItem('timerSetting', timerSetting);
		
		$("#loading_1").hide();
		$("#config").hide();
		
		$(".item").remove();
	});
	
	$("#loading_1").click(function(){
		$("#loading_1").hide();
		$("#config").hide();
		
	});
	
}



function drawToast(message){
	
	var alert = document.getElementById("toast");
	
	if (alert == null){
		var toastHTML = '<div id="toast">' + message + '</div>';
		document.body.insertAdjacentHTML('beforeEnd', toastHTML);
	}
	else{
		//$("#toast").text('');
		$("#toast").text(message);
		alert.style.opacity = .9;
	}
	
	
	intervalCounter = setInterval("hideToast()", 2500);
}


function hideToast(){
	clearInterval(intervalCounter);
	$("#toast").css('opacity', '.0');

}

function Toast(texto){
	drawToast(texto);
}
