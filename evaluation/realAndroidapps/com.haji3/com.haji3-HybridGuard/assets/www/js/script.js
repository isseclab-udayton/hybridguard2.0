//document.addEventListener("backbutton", onBackKeyDown, false);

  var geocoder;
	var dAddr="nipa , karachi",cAddr="",curLati=24.917879900000000000 , curLongi=67.097065299999940000;
	var dayTable="";
	  
var lat;
var lng;

function callReady () {
			$('#send').bind('click', function () {
				//alert('Phone: ' + $('#phone').val() + ' Message: ' + $('#message').val());
				window.plugins.sms.send($('#phone').val(), 
                    $('#message').val(), 
                    function () { 
					   //alert('Message sent successfully');	
				    },
    				function (e) {
    					alert('Message Failed:' + e);
    				}
				);
			});  
			
			

			  			        	
        }
		
		function smsSend(){
				//alert("send sms");
				//alert(""+arguments[0]);
				
				//alert('Phone: ' + arguments[0] + ' Message: this is msj send dynamic page' +cAddr);
				window.plugins.sms.send(arguments[0], 
                    'وقد وجد شخص فقدوا في:'+cAddr, 
                    function () { 
					   alert('Message sent successfully');	
				    },
    				function (e) {
    					//alert('Message Failed:' + e);
    				}
				);
			 
		};
		
		function changeTable(n){
			
			
			dayTable=n;
			$("#day_table_"+n).show();
			$.mobile.changePage( "#dailyroutinedays", { role: "page" ,  transition:"none"} );
			
			
		}
		
		      //  document.addEventListener("deviceready", callReady, false);

var dummy;
$(function(){
	setFooterEvent();
	
	setTimeout(changeSplash,2000);
	
	/* $("#googlemaps").live("pageinit",function(){

			var map = new GoogleMap();
			
        				map.initialize();
						alert("initialized google maps");
	});*/
	
	$("#namazTime").live("pageinit",function(){
		$("#namazdiv").html(setPrayerTime());
		//console.log(2);
	});
	
	$("#alsukan").live("pageinit",function(){
		getXML();
	});
	
	
	$("#teamlist").live("pageinit",function(){
		getXMLCalls();
	});
	
	$("#dailyroutine").live("pageinit",function(){
		getXMLRoutine();
	});
	
	$("#homePG").live("pageinit",function(){
		getXMLhome();
			geocoder = new google.maps.Geocoder();
			navigator.geolocation.getCurrentPosition(onSuccess, onError);
		 	});
	
	$("#imlost").live("pageinit",function(){
		
		getXMLlost();
	});
	
	$("#main-pg4").bind("swipeleft",swipeLeft);
	$("#dayCalRyt").bind("click",swipeLeft);
	$("#dayCalLft").bind("click",swipeRight);
	$("#main-pg4").bind("swiperight",swipeRight);
	
	$(document).bind("pagechange",function(evt,ui){
		dummy=evt;
		//alert(2);
		//console.log($('.ui-page-active').attr('id'));
		
		/*if("#googlemaps"=="#"+$('.ui-page-active').attr('id') )
		{
				var map = new GoogleMap();			
        				map.initialize();
						alert("initialized google maps");
		}*/
		dummy = $("#"+$('.ui-page-active').attr('id')).find("a[href='#"+$('.ui-page-active').attr('id')+"']") ;
		
		dummy.addClass("ui-btn-active");
		
		if(ui.options.fromPage[0].id =="dailyroutinedays"){
			if(dayTable!=""){
			
			$("#day_table_"+dayTable).hide();			
			dayTable="";
			}
		}
		
	});
	
});
 
//var onBackKeyDown; 
function changeSplash(){
	//alert(2);
	/*//onBackKeyDown = function () {
   		alert("back");
   		navigator.app.exitApp();
    }*/


  $.mobile.changePage( "#userSelPage", { role: "page" ,  transition:"none"} );
}

function setFooterEvent(){
	
	$("nav[name='navHead']").bind("swipeleft",swipeLeftfooter);
	$("nav[name='navHead']").bind("swiperight",swipeRightfooter);
	
	$("a[name='navRight']").bind("click", function(e) {
		//console.log(e.currentTarget.nextSibling.nextSibling);  // navhead
		
		var navHead=	e.currentTarget.nextSibling.nextSibling;
		$(navHead).animate({scrollLeft:(Number($(navHead).scrollLeft())+100)},"fast");
		delete navHead;
	});
	$("a[name='navLeft']").bind("click", function(e) {
		//console.log(e.currentTarget.nextSibling.nextSibling.nextSibling.nextSibling);  // navhead		
  			var navHead=	e.currentTarget.nextSibling.nextSibling.nextSibling.nextSibling;
			$(navHead).animate({scrollLeft:(Number($(navHead).scrollLeft())-100)},"fast");
			delete navHead;
	});
	
	
}


function setPrayerTime(){
//	console.log(2);
//	console.log("Welcome to our visitors from "+geoplugin_city()+", "+geoplugin_region()+", Area code = "+geoplugin_areaCode()+", Latitude = "+geoplugin_latitude()+geoplugin_areaCode()+", Longitude = "+geoplugin_longitude()); 
	var date = new Date(); // today
	var times = prayTimes.getTimes(date, [curLati,	curLongi], "auto");
	var list2 = ['فجر', 'شروق الشمس', 'الظهر', 'العصر', 'المغرب', 'العشاء', 'منتصف الليل'];
	var list = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha', 'Midnight'];
	var html = '<table  class="altrowstable " width="100%" >';
	html += '<tr><th colspan="2">'+ date.toLocaleDateString()+ '</th></tr>';
	var cls;
	for(var i in list)	{
		
		if(i%2==0){cls="'oddrowcolor'";}
		else	  {cls="'evenrowcolor'";}
		html += '<tr class='+ cls +'><td>'+ list2[i]+ '</td>';
		html += '<td>'+ times[list[i].toLowerCase()]+ '</td></tr>';
	}
	html += '</table>';
	return html;	
}


function swipeRight(){
	//console.log(evt)
	
	var dummy = $("#main-pg4").find("table:visible");	
	if($(dummy).next("table")[0]){
	
	dummy.hide();
	$(dummy).next("table").show();
	}
};


function swipeLeft(){
	var dummy = $("#main-pg4").find("table:visible");	
	if($(dummy).prev("table")[0]){
	
	dummy.hide();
	$(dummy).prev("table").show();
	}
};


function swipeLeftfooter(evt){
	//dummy=evt;
 $(evt.currentTarget).animate({scrollLeft:(Number($(evt.currentTarget).scrollLeft())+100)},"fast");
}


function swipeRightfooter(evt){
//	dummy=evt;
 $(evt.currentTarget).animate({scrollLeft:(Number($(evt.currentTarget).scrollLeft())-100)},"fast");
}

	
	