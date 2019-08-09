
	/*********************XML URL LINKS *********************/
	var User=1;
	
	
	
	function setUser(selUser)
	{
		User=selUser;
		setUrls();
		$.mobile.changePage( "#homePG", { role: "page" ,  transition:"none"} );
	}
	
	var urlTeamList;
	var urlContacts;
	var urlOffer;
	var urlImLost;
	var urlDays;
	
	function setUrls()
	{
	
			if(User==1)
			{
				 urlTeamList="http://www.ilibart.com/app/xml/teamList.xml";
				 urlContacts="http://www.ilibart.com/app/xml/contacts.xml";
				 urlOffer ="http://www.ilibart.com/app/xml/offer.xml";
				 urlImLost="http://www.ilibart.com/app/xml/imlost.xml";
				 urlDays="http://www.ilibart.com/app/xml/days.xml";			
			}
			else if(User==2)
			{
				 urlTeamList="http://www.ilibart.com/app/xml/teamList2.xml";
				 urlContacts="http://www.ilibart.com/app/xml/contacts2.xml";
				 urlOffer ="http://www.ilibart.com/app/xml/offer2.xml";
				 urlImLost="http://www.ilibart.com/app/xml/imlost2.xml";
				 urlDays="http://www.ilibart.com/app/xml/days2.xml";	
			}
	}
		/*********************XML URL LINKS *********************/
/************gmaps ***********************/

	
    //
    function goToLocation() {
   // alert("ingotoloc");
   // alert("ingotoloc:"+arguments[0]);
	dAddr = arguments[0];
     //   navigator.geolocation.getCurrentPosition(onSuccess, onError);
		$.mobile.changePage( "#directions_map" , { transition:"none"} );
    }
	
	
	
	
	
	
	
	/*****************/
	 // onSuccess Geolocation
    //
    function onSuccess(position) {
                            //alert("success");
                            lng=position.coords.longitude;
                            lat=position.coords.latitude;
                     	 //alert("latlong"+lat+","+lng);
						codeLatLng();
    }
    function onError(error) {
        alert('code: '    + error.code    + '\n' +               'message: ' + error.message + '\n');
    }
	
	/*********************gmaps *********************/
	
	   navigator.geolocation.getCurrentPosition(onSuccess, onError);
	/*****************/
	
	
	
	
	
	
     function codeLatLng() {
       // var input = document.getElementById('latlng').value;
       // var latlngStr = input.split(',', 2);
       // var lat =24.917879900000000000; //parseFloat(24.917879900000000000);
       // var lng = 67.097065299999940000;//parseFloat(latlngStr[1]);
        var latlng = new google.maps.LatLng(lat, lng);
        geocoder.geocode({'latLng': latlng}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
              /*map.setZoom(11);
              marker = new google.maps.Marker({
                  position: latlng,
                  map: map
              });*/
              //infowindow.setContent(results[1].formatted_address);
			 cAddr= results[1].formatted_address;
              //infowindow.open(map, marker);
            } else {
              //alert('No results found');
            }
          } else {
            //alert('Geocoder failed due to: ' + status);
          }
        });
      }
	
	/*********************gmaps *********************/
	

/****************al sukan *******************8*/
function getXML()
	{
		 $.ajax({
   			 type: "GET",
    		url: urlTeamList,
    		dataType: "xml",
    		success: parseXml
  			});
	
	}
	
	function parseXml(xml)
	{
  		var html="";
		//alert("success");
  		$(xml).find("teamMember").each(function()
  		{
  		//alert("success");
    		//$("#output").append($(this).attr("author") + "<br />");
     	//	alert($(this).find("id").text());
		var des="onclick= 'goToLocation("+$(this).find("destination").text().toString() +")'";
		//console.log(des)
    	 html+='<li  >'+
    		
           '  <div class="ui-grid-a">'+
                    '<div class="ui-block-a" align="left"   style="width:50%"> '+
                          ' <a ' + des +'><img src="images/gmaps.png "   /></a>'+
                        /*   '+$(this).find("destination").text()+'*/
                    '</div>'+
                    '<div class="ui-block-b " align="right" style="width:50%">'+
                           '<h3 class="ui-li-heading">'+$(this).find("name").text()+'</h3>'+
							'<p class="ui-li-desc">'+$(this).find("desigination").text()+' </p>'+
           				   
                    '</div>   '+
                '</div>'+
      '</li>';
		console.log(html);
			//alert($(this).find("name").text());
      		//alert($(this).find("phone").text());
        	//alert($(this).find("desigination").text());
  		});
		$("#alsakandiv").html(html);
		$("#alsakandiv").listview("refresh");
	}
	
/************al sukan *******************/	



/****************al contacts calls *******************8*/
function getXMLCalls()
	{
		 $.ajax({
   			 type: "GET",
    		url: urlContacts,
    		dataType: "xml",
    		success: parseXmlCalls
  			});
	
	}
	
	function parseXmlCalls(xml)
	{
  		var html="";
		//alert("success");
  		$(xml).find("contact").each(function()
  		{
  		//alert("success");
    		//$("#output").append($(this).attr("author") + "<br />");
     	//	alert($(this).find("id").text());
    	 html+='<li data-iconpos="left" data-theme="d" class="ui-btn ui-btn-icon-left">'+
            	'<div class="ui-btn-inner ui-li"><div class="ui-btn-text">'+
                '<a href="tel:'+$(this).find("phone").text()+'" data-transition="none" class="ui-link-inherit">'+
				'<h3 class="ui-li-heading">'+$(this).find("name").text()+'</h3>'+
				'<p class="ui-li-desc">'+$(this).find("desigination").text()+' </p></a>'+
                '</div><span class="ui-icon ui-icon-call">&nbsp;</span></div>'+
            '</li>';
		
			//alert($(this).find("name").text());
      		//alert($(this).find("phone").text());
        	//alert($(this).find("desigination").text());
  		});
		$("#teamcall").html(html);
		$("#teamcall").listview("refresh");
	}
	
/************al teamlists calls *******************/	

/****************al home*******************8*/
function getXMLhome()
	{
		 $.ajax({
   			 type: "GET",
    		url: urlOffer,
    		dataType: "xml",
    		success: parseXmlhome
  			});
	
	}
	
	function parseXmlhome(xml)
	{
  		var html="";
		//alert("success");
  		$(xml).find("offer").each(function()
  		{
  		//alert("success");
    		//$("#output").append($(this).attr("author") + "<br />");
     	//	alert($(this).find("id").text());
		
    	 html+='  <div data-role="collapsible" data-mini="true" class="ui-btn-icon-right">'+
            '<h3>'+$(this).find("name").text()+'</h3>'+
            '<p>'+$(this).find("description ").text()+'</p>'+
            
            '</div>';
			//alert($(this).find("name").text());
      		//alert($(this).find("phone").text());
        	//alert($(this).find("desigination").text());
  		});
		$("#homCollaps").html(html).trigger('create');
		//$("#homCollaps").trigger('create');
	}
	
/************al home *******************/	

/****************im lost*******************8*/
function getXMLlost()
	{
		 $.ajax({
   			 type: "GET",
    		url: urlImLost,
    		dataType: "xml",
    		success: parseXmllost
  			});
	
	}
	
	function parseXmllost(xml)
	{
  		var html="";
		//alert("success");
		html=' <li style="text-align:right" data-role="list-divider">البرنامج اليومي</li>';
  		$(xml).find("teamMember").each(function()
  		{
  		//alert("success");
    		//$("#output").append($(this).attr("author") + "<br />");
     	//	alert($(this).find("id").text());
		var des="onClick= 'smsSend("+$(this).find("sms").text().toString() + ")'";
    	 html+='<li  >'+
                '<div class="ui-grid-a">'+
                    '<div class="ui-block-a"  style="width:50%" align="center"> '+
                           '<a href="tel:'+$(this).find("phone").text()+'"  style="margin-left:20px"   data-transition="none" >'+
							'<img src="images/call.png " /></a>'+
                          '<a '+des+'  > <img src="images/msj.png " /></a>'+
                    '</div>'+
                    '<div class="ui-block-b " align="right" style="width:50%">'+
                           ' <h3 class="ui-li-heading">'+$(this).find("name").text()+'</h3><p class="ui-li-desc">'+
           				   $(this).find("desigination").text()+'</p>'+
                    '</div>   '+
                '</div>'+
            
        '</li>';
			//alert($(this).find("name").text());
      		//alert($(this).find("phone").text());
        	//alert($(this).find("desigination").text());
  		});
		//console.log(html)
		$("#ullost").html(html).listview("refresh");
	}
	
/************imlost *******************/	




/****************al days table*******************8*/
function getXMLRoutine()
	{
		 $.ajax({
   			 type: "GET",
    		url: urlDays,
    		dataType: "xml",
    		success: parseXmlRoutine
  			});
	
	}
	
	function parseXmlRoutine(xml)
	{
  		var html="",cls;
		//alert("success");
		
		
  		$(xml).find("day").each(function(ind)
  		{
  		//alert("success");
    		//$("#output").append($(this).attr("author") + "<br />");
     	//	alert($(this).find("id").text());
		
		html=' <div  data-role="content" class="ui-shadow ui-corner-all"  >'+
          '<div class="ui-bar ui-bar-b" data-corners="true" align="center">'+
          '<h1 id="headingDayTable">'+(5+ind)+' ذو الحجة</h1>'+
        
        '</div>'+
		'<div  class="ui-shadow ui-corner-all"  >';
		
		
		 html+=' <table  class="altrowstable " ' +cls +' width="100%" >'+
		 '<tr class="evenrowcolor">'+
            '<th width="35%"><h1 class="ui-li-heading">الوقت</h1> </th>'+
			'<th width="65%"><h1 class="ui-li-heading"> معلومات</h1> </th>'+
        '</tr>';
			$(this).find("event").each(function(index, element) {
				if(index%2==0)cls='"oddrowcolor"';
				else cls='"evenrowcolor"';
					html+='<tr class='+cls+'><td >'+
					
			'<div class="urdu-font-black-h1" align="right">'+$(this).find("time").text()+'</div>'+
					
			 '</td>'+
			'<td class="urdu-font-black" align="right">'+
			'<h3 class="ui-li-heading">'+$(this).find("name").text()+'</h3><p class="ui-li-desc">'+$(this).find("location").text()+' </p>'+							             		

					'</td>'+
					'</tr>';
                        
            });
		
		html+=    '</table></div><div>';    	
		//console.log(html);
		$("#day_table_"+(5+ind)).html(html);
		
		
			//alert($(this).find("name").text());
      		//alert($(this).find("phone").text());
        	//alert($(this).find("desigination").text());
  		});
		//$("#day_table_"+(5+ind)).find("table").listview("refresh");
	}
	
/************al teamlists calls *******************/	


	