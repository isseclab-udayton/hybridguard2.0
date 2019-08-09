


(function($) {
	
	
	var SITE_URL = Settings.SITE_URL;
	var API_URL = SITE_URL+"api/";
	
	/* Server Api */ 
	
	/* Page */
	var SearchFilter = [];
	
	var _PageInit = {		
			 
			start:function(e){
				
				_Renderer.log("e:"+e);				
				_Renderer.loaderStart();		
				
				
				
				
				
				
				ImgCache.init();				
				
					var pathArray = e.split( '/' );
					if(pathArray.length>0){
						e = pathArray[0];	
						if(pathArray[1] && pathArray[2]){
							SearchFilter = pathArray;
						}
						else{
							SearchFilter = [];
						}
					}
					
					
					if(e=="") {
						e = "download";
						

						
						
					}
				
					switch(e){				
						
						case "fellepok":
							_PageInit.fellepok();
						break;
						case "adatlap":
							_PageInit.adatlap();
						break;
						case "esemenyek":
							_PageInit.esemenyek();
						break;
						
						case "test":
							_PageInit.test();
						break;
						case "login":
							_PageInit.login();
						break;
						case "logout":
							_PageInit.logout();
						break;
						case "terkep":
							_PageInit.terkep();
						break;
						case "settings":
							_PageInit.settings();
						break;							
						case "page":
							_PageInit.page();
						break;
						case "profile":
							_PageInit.profile();
						break;
						case "device":
							_PageInit.device();
						break;
						case "kereses":
							_PageInit.kereses();
						break;
						case "download":
							_PageInit.download();	
						break;
						
						case "nyeremeny":
							_PageInit.nyeremeny();
						break;
						default:
							_PageInit.main();				
						break;
					}
				
				_Renderer.loaderEnd();
				
			},
			profile:function(){
				var e = $("section#template_profile").clone();
				var callback = function(t){	
					if (navigator.geolocation) {
						  navigator.geolocation.getCurrentPosition(Api.profileMap,
								  function(){
									  _Renderer.log("nem kapok GSP adatokat");
									  Api.profileMap(null);
								  },
								  {maximumAge:60000, timeout:5000, enableHighAccuracy:true});
					} else {
						 /*setTimeout("Api.initmap(null);",61000); */
					}
				};
				_Renderer.render(e,callback);
			},
			download:function(){
				
				
				var e = $("section#template_download").clone();
				e.find("#downloader").height(screen.height).width(screen.width);
				var callback = function(t){	
					Api.pb = progressBar();
					$("#progressBarde").html(Api.pb.getDiv());
					var preloaderText = $("#progressBardeText");
					Api.pb.start(100);
					
					var send = function(e){
						if(e==true){
							
							Api.timeOut = window.setInterval(function () {
								if (navigator.geolocation) {
									  navigator.geolocation.getCurrentPosition(Api.sendGeoCode,
											  function(){
												  window.clearInterval(Api.timeOut);
											  },
											  {maximumAge:60000, timeout:10000, enableHighAccuracy:true});
								} 
							},300000);
						}
					};
					Api.registerdevice(send);
					
					
					
					/*preloaderText.html("<div class='progressBardeTextAnim'>Betöltés..</div>");*/
					
					//ImgCache.clearCache();
						Api.pb.updateBar(10);
						preloaderText.html("<div class='progressBardeTextAnim'>Helyszínek letöltése..</div>");
					
						
						Api.requestPlaces(function(kk){
							Api.pb.updateBar(20);
							preloaderText.html("<div class='progressBardeTextAnim'>Információs oldalak letöltése...</div>");

							Api.requestStatic(function(kk){
								Api.pb.updateBar(30);
								preloaderText.html("<div class='progressBardeTextAnim'>Események letöltése...</div>");

								Api.requestEvents(function(kk){
										Api.pb.updateBar(40);
										preloaderText.html("<div class='progressBardeTextAnim'>Képek letöltése...</div>");
										var result = json_decode(window.localStorage.getItem("events"));	
										if(result){
											
													  				
									  		for(var i=0; i<result.length; i++) {
									  			try{
									  				if(typeof(result[i])=="object" && result[i].thumb){
										  				ImgCache.isCached(result[i].thumb,function(c,t){
										  					if(t==false){
										  						
												  				Api.pb.updateBar(1);
											  					ImgCache.cacheFile(c);
										  					}else{
										  						
												  				Api.pb.updateBar(1);
										  					}
														});
									  				}else{
									  					throw "no obj";
									  				}
									  			}catch(e){
									  				
									  			}
									  		}
									  		setTimeout(function(){document.location.href='index.html#main';},1000);
										}else{
											
											
											preloaderText.html("<div class='progressBardeTextAnim'>Nincs internet kapcsolat</div>");
											setTimeout(function(){document.location.href='index.html#main';},1000);
										}
									
								});
							});
							
							
							
						});
						
						
					
						
											
				};
				_Renderer.render(e,callback);
			},
			kereses:function(){
				
				var e = $("section#template_kereses").clone();
				var callback = function(t){
					
					
					
					
					var keresoBox = function(){
						var K = $("#render #searchInput");
						var textProdSearch="Írd be, mit keresel";				 
						K.bind("blur",function(){
							
							if(this.value==""){
								this.value = textProdSearch;
							}
						});					
						K.bind("focus",function(){
							
							if(this.value==textProdSearch){
								this.value = "";
							}
						});					
										
						K.val(textProdSearch);
					};
		
					keresoBox();
					
					
					var k = window.localStorage.getItem("events");
					var p = window.localStorage.getItem("places");
					var ide = $("#render #ide");
					k = json_decode(k);
					
					p = json_decode(p);
					var ide2 = $("#deba");
					var interval = null;
					interval =  window.setInterval(function () {
							
						var searchinp = $("#render #searchInput");
							if(searchinp.length==0) window.clearInterval(interval);
						 	var kkk = $("#render #searchInput").val();
							
						 	
							if(kkk!=ide2.html()){
								ide2.html(kkk);
								

								var searchString = kkk;
								if(searchString && searchString.length>2){
									ide.html("<br><br><div id='keresesInfo'>Keress előadóra, helyszínre vagy off-programra</div>");
									if(k){
										
										for (var i = 0; i < k.length; i++) {
										
											var title = k[i].title.toLowerCase();
											if(title.search(searchString)>=0){
												
												ide.html("");
												ide.append("<li>" +
														"<img src='" +k[i].thumb+"' class='kep' style='float:left;height:58px;margin-right:10px;'><a  class='event' href='#adatlap/id/"+k[i].nid+"'>"+
														k[i].title+"<span>" +
														k[i].day_text+" "+k[i].time+"</span></a>" +								
														"</li>");
												
											}
								  		}
									}
									
									if(p){
										
										for (var i = 0; i < p.length; i++) {
											
											var title = p[i].title.toLowerCase();
											if(title.search(searchString)>=0){
												ide.append("<li><a  class='place' href='#terkep/id/"+p[i].id+"'>"+
														"<img src='"+Api.getIcon(p[i])+"' style='float:left;width:40px;margin-right:10px;'>" +
														p[i].title+"</a>" +								
														"</li>");
											}
								  		}
									}
									
								}
							
								
								
								
							}
					    }, 600); 
					
					_Renderer.menu();
					
				};
				_Renderer.render(e,callback);
			},
			main:function(){
				_Renderer.log("test");
				var e = $("section#template_main").clone();
				var callback = function(t){					
										
					_Renderer.menu();
					$("#laptopszalonad").click(function(){
						if(typeof device=="object"){
							//navigator.app.loadUrl("http://www.laptopszalon.hu","_blank");	
							navigator.app.loadUrl("http://www.laptopszalon.hu", { openExternal:true });
							//window.open("http://www.laptopszalon.hu", '_blank');
						}
						else{
							window.open("http://www.laptopszalon.hu", '_blank');
						}
					});
				};
				_Renderer.render(e,callback);
			},
			
			nyeremeny:function(){
				_Renderer.log("nyeremeny");
				
					
				
					var e = $("section#template_nyeremeny").clone();
					
					var callback = function(t){
						
						
						
					};
					_Renderer.render(e,callback);
					
				
			},
			
			
			adatlap:function(){
				_Renderer.log("adatlap");
				
					
				
					var e = $("section#template_adatlap").clone();
					
					var callback = function(t){
						
						if(SearchFilter!=null && SearchFilter[1]=="id"){
							_Renderer.updateAdatlap(SearchFilter[2],$("#render #ide"));
						}
						
						
					};
					_Renderer.render(e,callback);
					
				
			},
			
			fellepok:function(){
				_Renderer.log("fellepok");
				
					
				
					var e = $("section#template_fellepok").clone();
					
					var callback = function(t){
						t.find("button").click(function(n){
					
							n.preventDefault();
							_Renderer.log("akció");
						});
						
						_Renderer.menu();
						
						
							
						var e = $("section#template_fellepok").clone();
						
					
						e.find(".item").remove();
						$("#render #ide").html("<br><br><div style='text-align:center;'><img src='css/images/ajax-loader-yellow.gif'></div> ");
						
						var data = window.localStorage.getItem('events');		
						
						_Renderer.updateFellepok(data);
						
						
					};
					_Renderer.render(e,callback);
					
				
			
				
				
				
				
			},
			esemenyek:function(){
				_Renderer.log("fellepok");
				
				
				
				var e = $("section#template_esemenyek").clone();
				
				var callback = function(t){
					t.find("button").click(function(n){
				
						n.preventDefault();
						_Renderer.log("akció");
					});
					
					_Renderer.menu();
					
					
						
					var e = $("section#template_esemenyek").clone();
					
					
					e.find(".item").remove();
					$("#render #ide").html("<br><br><div style='text-align:center;'><img src='css/images/ajax-loader-yellow.gif'></div> ");
					
					var data = window.localStorage.getItem('events');		
					
					_Renderer.updateEsemenyek(data);
					
				};
				_Renderer.render(e,callback);
				
			
		
			
			
			
			
		},
		terkep:function(){
				var e = $("section#template_terkep").clone();
				var callback = function(t){
					
					near = document.getElementById("mapResultItems");
					near.innerHTML = "<div align='center' style='text-align:center;'><img src='css/images/ajax-loader-w.gif'></div>";
					
					
					Api.initmap(null);
					
					
					
					$("#laptopszalonad").click(function(){
						if(typeof device=="object"){
							navigator.app.loadUrl("http://www.laptopszalon.hu", { openExternal:true });
						}
						else{
							window.open("http://www.laptopszalon.hu", '_blank');
						}
					});
					
					_Renderer.mapMenu();
				};
				_Renderer.render(e,callback);
			},
			
			error:function(){
				_Renderer.log("error");
				
				var e = $("section#template_error").clone();
				
				var callback = function(t){
					t.find("button").click(function(n){
				
						n.preventDefault();
						_Renderer.log("akció");
					});
				};
				_Renderer.render(e,callback);
				
				
			},
			device:function(){
				_Renderer.log("error");
				
				var e = $("section#template_device").clone();
				
				var callback = function(t){
					if(typeof device=="object"){
					var element = document.getElementById('dev-device');
					
					
					
					
				        element.innerHTML = 'Device UUID: '     + device.uuid     + '<br />' +
				                            'Device Version: '  + device.version  + '<br />'+json_encode(device)+
				                            'local.token: '     + window.localStorage.getItem("token") + '<br />' + 
				                            'local.allplace: '     + window.localStorage.getItem("places") + '<br />' + '';
				                            
						
					
					
					}
						var element = document.getElementById('dev-pixelration');
				        element.innerHTML = window.devicePixelRatio;
					
				        var element = document.getElementById('dev-width');
				        element.innerHTML = screen.width+" x "+screen.height+" ("+screen.availWidth+" x "+screen.availHeight+")";				
				};
				_Renderer.render(e,callback);
				
				
			},
			
			page:function(){
				_Renderer.log("page");
				
				var e = $("section#template_sub").clone();
				
				var callback = function(t){		
				
				
					var data = window.localStorage.getItem("static");
					_Renderer.updateStaticList(data);
				};
				_Renderer.render(e,callback);
				
				
			},	
			login:function(){
				_Renderer.log("error");
				
				var e = $("section#template_login").clone();
				
				var callback = function(t){
					t.find("button").click(function(n){
				
						n.preventDefault();
						_Renderer.log("akció");
					});
				};
				_Renderer.render(e,callback);
				
				
			},	
			settings:function(){			
				var e = $("section#template_settings").clone();				
				var callback = function(t){
					_Renderer.menu();
				};
				_Renderer.render(e,callback);
			}
			
			
			
			
	};
	
	var Api = {
			
			favorites:[],
			markers:[],
			mapCenter:null,
			pb:progressBar(),
			timeOut:null,
			map_infobox:null,
			call:function(e,n,callback){
				if(e){					
					$.post(API_URL+e, n).done(function(data) {
						_Renderer.log(data);
						callback(data);
					}).fail(function(data){
						_Renderer.log(data);
						callback(false);
					});
				}				
			},
			W: new function () {
                for (var a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".split(""), b = 64; b;)--b;
                this.e = function (b) {
                    for (var c = [], f = 0, g = 0, h, j = b.length, k = j % 3; f < j;) c[g++] = a[(h = b[f++] << 16 | b[f++] << 8 | b[f++]) >> 18 & 63] + a[h >> 12 & 63] + a[h >> 6 & 63] + a[h & 63];
                    if (k) for (c[--g] =
                            c[g].substr(0, c[g].length - (k = 3 - k)); k--;) c[g] += "*";
                   
                };
            }, 
			sendGeoCode:function(position){
				var token = window.localStorage.getItem('token');
				var locationShare = window.localStorage.getItem('locationShare');
				
				if(position.coords.latitude && token){	
					var lat1 = parseFloat(position.coords.latitude) * 1000;
					var lng1 = parseFloat(position.coords.longitude) * 1000;
					
					if(lat1<46148 && lat1>46140 && lng1<18142  && lng1>18131 && locationShare!="disabled"){
						var an = {token:token,lat:position.coords.latitude,lng:position.coords.longitude};
						$.post(API_URL+"geo/send",an).done(function(data) {
							
							_Renderer.log(json_encode(data));
							
						}).fail(function(data){
							_Renderer.log("fail:"+API_URL+"geo/send"+json_encode(data));
							
						});
					}else{
						
						
						
						
					}
				}	
			},
			
			registerdevice:function(callback,fall){
				
				var token = window.localStorage.getItem('token');
				
				var uuid = null;
				
				if(typeof device=="object"){
					uuid = device.uuid;
				}
				else{
					
					var s4 = function() {
						  return Math.floor((1 + Math.random()) * 0x10000)
						             .toString(16)
						             .substring(1);
					};

					var guid = function() {
						  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
						         s4() + '-' + s4() + s4() + s4();
					};
					uuid = guid();
				}
				
				if(!token){
					
					$.post(API_URL+"auth/reg", {uuid:uuid}).done(function(data) {
						
						if(data!="FALSE"){
						  window.localStorage.setItem("token",data);						 
						}
						 if(typeof callback == 'function'){
					    		callback(true);
						 }	
					}).fail(function(data){
						_Renderer.log("nincs internet kapcsolat:"+API_URL+"auth/reg"+json_encode(data));
						 if(typeof callback == 'function'){
					    		callback(false);
						 }	
					});
				}else{
					if(typeof callback == 'function'){
			    		callback(true);
					}
				}
			},
		
			
			profileMap:function(position){
				var glat = null;
				var glng = null;
				if(position==null){
					glat = '46.145128';
					glng = '18.137312';
				} 
				else{
					glat = position.coords.latitude;
					glng = position.coords.longitude;
				}
				  
				
				var gmap;
				
				
				Api.pb = progressBar();
				
				
				/*var mypos = new google.maps.LatLng('46.145128','18.137312');*/
				var mypos = new google.maps.LatLng(glat,glng);
				
				Api.map_infobox = new google.maps.InfoWindow();
				
				var style = Settings.MapDefaultStyle;				
				
				var hr = (new Date()).getHours(); //get hours of the day in 24Hr format (0-23)
				
				if(hr>19 || hr<10){
					style = Settings.MapNightStyle;
				}
				var myOptions = {
				   zoom:17,
				   mapTypeId: google.maps.MapTypeId.ROADMAP,
				   center: new google.maps.LatLng('46.145128','18.137312')
				   
				};
			    gmap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				gmap.setOptions({styles: style});
				gmap.controls[google.maps.ControlPosition.RIGHT].push(Api.pb.getDiv());
				
				
				
				var tent = window.localStorage.getItem("tent");
		  		tent = json_decode(tent);
		  		if(tent){	
		  			
					var gmarkers = new google.maps.Marker({
						map: gmap,
						optimized: true, 
						position: new google.maps.LatLng(tent[0].lat,tent[0].lng),
						title: "Sátram",
						icon: Settings.Tent,
						draggable: true,
						
					});
					Api.markers.push(gmarkers);
					
					google.maps.event.addDomListener(gmarkers,"dragend",function(r){
						
						
						if(r.latLng.jb){
							
							window.localStorage.setItem("tent",'[{"lat":"'+r.latLng.jb+'","lng":"'+r.latLng.kb+'"}]');
						}
					});
					
					$("#addSator").addClass("hide");
					$("#delSator").removeClass("hide");
		  		}
				
				
				if(position==null){
					_Renderer.log("nincs helyadatom");
					$("#whereami").addClass("iamlost");
				}else{
					
					var gmarkers = new google.maps.Marker({
							map: gmap,
							optimized: true, 
							position: mypos,
							title: "Itt vagyok",
							icon: Settings.Me,
							draggable: false
					});
					Api.markers.push(gmarkers);
					
					
					
					
					$("#whereami").show().bind("click",function(e){
						/*gmap.setZoom(17);*/
						e.preventDefault();
		    		    gmap.setCenter(new google.maps.LatLng(glat,glng)); 
		    		    
		    		    if (navigator.geolocation) {
							  navigator.geolocation.getCurrentPosition(function(position){								  		
								   		/*gmap.setZoom(17);*/
								  		gmap.setCenter(new google.maps.LatLng(position.coords.latitude,position.coords.longitude)); 
							  		  },
									  function(){},
									  {maximumAge:6000, timeout:5000, enableHighAccuracy:true});
						} else {
							
						}
		    		    
		    		    
					});
					
				}	
					
					$("#addSator").bind("click",function(){
						
						$(this).addClass("hide");
											
						window.localStorage.setItem("tent",'[{"lat":"'+glat+'","lng":"'+glng+'"}]');
						var gmarkers = new google.maps.Marker({
							map: gmap,
							optimized: true, 
							position: new google.maps.LatLng(glat,glng),
							title: "Sátram",
							icon: Settings.Tent,
							draggable: true,
							
						});
						
						google.maps.event.addDomListener(gmarkers,"dragend",function(r){
							
							_Renderer.log("megváltozott a pozició"+json_encode(r));
							if(r.latLng.jb){
								
								window.localStorage.setItem("tent",'[{"lat":"'+r.latLng.jb+'","lng":"'+r.latLng.kb+'"}]');
							}
						});
						
						Api.markers.push(gmarkers);
						$("#delSator").removeClass("hide");
					});
					
					$("#delSator").bind("click",function(){
						
						$(this).addClass("hide");
						window.localStorage.removeItem("tent");
						for (var i = 0; i < Api.markers.length; i++) {
							
							if(Api.markers[i].draggable!=false){
								Api.markers[i].setMap(null);		
							}
				  		}
						
						$("#addSator").removeClass("hide");
						
					});
					
					
				
					$("#enableLocation").bind("click",function(e){
						e.preventDefault();
						$(this).addClass("hide");											
						window.localStorage.setItem("locationShare","disabled");
						$("#disableLocation").removeClass("hide");
					});
					
					$("#disableLocation").bind("click",function(e){
						e.preventDefault();
						$(this).addClass("hide");
						window.localStorage.setItem("locationShare","");
						$("#enableLocation").removeClass("hide");
						
					});
				
				
			},  

		
			initmap:function(position) {
				
				
				var gmap;
				
				
				$("#render #mapWrapper #map_canvas").height(screen.height-$("#mapWrapper header").height()-60);
				
				  
				
								
				Api.pb = progressBar();				
				if(typeof google=="object"){
					
				
							
					Api.map_infobox = new google.maps.InfoWindow();				
					var style = Settings.MapDefaultStyle;				
					var hr = (new Date()).getHours(); //get hours of the day in 24Hr format (0-23)
					
					if(hr>20 || hr<8){
						style = Settings.MapNightStyle;
					}
					var myOptions = {
					   zoom:17,  					  
					   mapTypeId: google.maps.MapTypeId.ROADMAP,
					   center: new google.maps.LatLng('46.145128','18.137312'),
					   
					};
					
					
				    gmap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
					gmap.setOptions({styles: style});					
					gmap.controls[google.maps.ControlPosition.RIGHT].push(Api.pb.getDiv());					
					Api.mapcenter  = gmap.getCenter();
					
					
					
					google.maps.event.addListener(gmap, 'zoom_changed', function() {					
						setTimeout(function(){gmap.setCenter(Api.mapcenter);},700); 
					});
					
					
					
					
					
					
						
						
						if (navigator.geolocation) {
							  navigator.geolocation.getCurrentPosition(function(position){								  		
								  		var mypos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
								  		
								  		Api.whereami(gmap, mypos);
								  		
							  		  },
									  function(){},
									  {maximumAge:60000, timeout:5000});
						}
						
							
						$("#whereami").bind("click",function(){
								
				    		   		    		    
				    		    if (navigator.geolocation) {
									  navigator.geolocation.getCurrentPosition(function(position){								  		
										  		var mypos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
										  		
										  		gmap.setCenter(mypos); 
										  		Api.whereami(gmap, mypos);
										  		
									  		  },
											  function(){},
											  {maximumAge:60000, timeout:5000, enableHighAccuracy:true});
								} else {
									
								}			    		    
						});
							
						
					
					
					
					
					
					
					
					$(".mapTypes").unbind().bind("click",function(e){
						e.preventDefault();
						_Renderer.log("gomb");
						$(".mapTypes").removeClass("selected");
						
						var t = $(this);
						t.addClass("selected");
						var type = t.attr("rel");
						var flyerleft = $("#mapLayer");
						var display = $("#mapWrapper");
						display.transition({ x: '0' },function(){
							
							$(this).attr("style","");
							flyerleft.hide();
							
							
							near = document.getElementById("mapResultItems");
							near.innerHTML = "<div align='center' style='text-align:center;'><img src='css/images/ajax-loader-w.gif'></div>";
							
							
							
							Api.addMapLayer(gmap,type);
							
							
						});
						return true;
					});
					
					
					
					if(SearchFilter!=null && SearchFilter[1]=="type"){
						Api.addMapLayer(gmap,SearchFilter[2]);
					}
					else{
						Api.addMapLayer(gmap,"stage");
					}
				
				}else{
					$("#whereami").addClass("iamlost");
					Api.addOfflinePlaces();
				}
				
				
				
			   

		},
		getIcon:function(place){
			if(place.icon!=""){
				
				switch(place.icon){
				case "drink":
					return Settings.Drink;
				break;
				case "wc":
					return Settings.WC;
				break;
				case "info":
					return Settings.Info;
				break;
				case "feny":
					return Settings.Feny;
				break;
				case "hotdog":
					return Settings.Hotdog;
				break;
				case "bringa":
					return Settings.Bringa;
				break;
				case "mento":
					return Settings.Mento;
				break;
				case "unicum":
					return Settings.Uniqum;
				break;
				case "uniqum":
					return Settings.Uniqum;
				break;
				case "laptopszalon":
					return Settings.Laptopszalon;
				break;
				case "viasat6":
					return Settings.Viasat6;
				break;
				case "porthu":
					return Settings.PortHu;
				break;
				case "bus":
					return Settings.Bus;
				break;
				default:
					return place.icon;
				break;
				}
				
				
			}
			else{
				switch(place.type){
				case "stage":
					return Settings.Stage;
				break;
				case "food":
					return Settings.Food;
				break;
				case "kozlekedes":
					return Settings.Info;
				break;
				case "info":
					return Settings.Info;
				break;
				default:
					return Settings.Info;
				break;
				}
			}
		},
		
		whereami:function(gmap,pos){
			
			for (var i = 0; i < Api.markers.length; i++) {
	  			if(Api.markers[i].title=="Itt vagyok"){
	  				Api.markers[i].setMap(null);			
	  			}
	  		}
			

			var gmarkers = new google.maps.Marker({
					map: gmap,
					optimized: true, 
					position: pos,
					title: "Itt vagyok",
					icon: Settings.Me,
					draggable: false
			});
			
			Api.markers.push(gmarkers);
		},
		createMarker: function(gmap,place) {
			near = document.getElementById("mapResultItems");
			
			var icondest = Api.getIcon(place);
			
			var nowtime = strtotime("now");
			
			var marker= new google.maps.Marker({
			      map: gmap,
			      title: place.title,
			      icon: Api.getIcon(place),
			      shadow:"css/icon/map_shadow.png",
			      position: new google.maps.LatLng(place.lat,place.lng)
			});
			google.maps.event.addListener(marker,'click',function(){
				//gmap.setZoom(17);
    		    gmap.panTo(marker.getPosition());
    		    $(".nearby").removeClass("selected");
    		    k.className = "nearby selected";
    		    if(place.events!=null){
    		    	
    		    	var mostmegy = "Események";
    		    	for(var i=0;i<place.events.length;i++){
    		    		place.events[i].date;
    		    		var time = strtotime(place.events[i].date);
						mostmegy = (((time-3600)<nowtime && (time>nowtime) )? place.events[i].title + " "+place.events[i].time : mostmegy);
    		    	}
    		    	
    		    	Api.map_infobox.setContent(place.title+"<br><a href='#fellepok/place/"+place.id+"'>"+mostmegy+"</a>");
	    		}else{
		    		Api.map_infobox.setContent(place.title);
	    		}
		        Api.map_infobox.open(gmap, marker);
				
			});
			
			if(place.clicked){
				gmap.panTo(marker.getPosition());
    		    $(".nearby").removeClass("selected");
    		   
    		    if(place.events!=null){
    		    	
    		    	var mostmegy = "Események";
    		    	for(i=0;i<place.events.length;i++){
    		    		place.events[i].date;
    		    		var time = strtotime(place.events[i].date);
						mostmegy = (((time-3600)<nowtime && (time>nowtime) )? place.events[i].title + " "+place.events[i].time : mostmegy);
    		    	}
	    		    Api.map_infobox.setContent(place.title+"<a href='#fellepok/place/"+place.id+"'>események</a>");
	    		}else{
		    		    Api.map_infobox.setContent(place.title);
	    		}
		        Api.map_infobox.open(gmap, marker);
			}
			
			Api.markers.push(marker);
			
			
			
			var k = document.createElement("div");
		    k.className= "nearby";
		    k.setAttribute("rel",place.id);
		    if(place.events!=null){
		    	
		    	var mostmegy = "";
		    	for(var i=0;i<place.events.length;i++){
		    		place.events[i].date;
		    		var time = strtotime(place.events[i].date);
					 mostmegy = (((time-3600)<nowtime && (time>nowtime) )? place.events[i].time+" - "+place.events[i].title : mostmegy);
		    	}
		    	
		    	k.innerHTML = "<img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title+"<br>"+mostmegy+"<a href='#fellepok/place/"+place.id+"' class='event'>események</a>";
		    }else{
		    	k.innerHTML = "<img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title;

		    }
		    k.addEventListener("click",function(){
		    			
		    			
		    			var g = new google.maps.LatLng(parseFloat(place.lat)+0.00015,parseFloat(place.lng));
		    			
		    		    gmap.panTo(g);
		    		    $(".nearby").removeClass("selected");
		    		    $(this).addClass("selected");
		    		    
		    		    if(place.events!=null){
		    		    	
		    		    	Api.map_infobox.setContent(place.title+"<br><a href='#fellepok/place/"+place.id+"'>események</a>");
		    		    	
		    		    }else{
			    		    Api.map_infobox.setContent(place.title);
		    			}
		    		    Api.map_infobox.open(gmap, marker);
		    		    
		    		    var d = $(this);
		    		    $(".nearby").removeClass("selected");
		    		    d.addClass("selected");
		    		    
		    		   
		    		    if(place.text!=""){
		    		    $("#mapPopup").html("<div class='wrp'><h1><img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title+"</h1> <h2><br>Koordináta: "+place.lat+", "+place.lng+"<br><div>"+place.text+"</div></div>").show();
				    	
		    		    
		    		    $("#mapPopup").click(function(e){e.preventDefault();$(this).hide();});
		    		    }
		    		    
		    	  
		    });
		    
		    
		    
		    
		    
	    	near.appendChild(k);
			
	  	},
	  	
	  	addOfflinePlaces:function(){
	  		
	  		
	  		$("#map_canvas").html("<div style='width:100%;margin:auto;text-align:center;position:absolute;bottom:50%;'>A Manóba. Úgy tűnik, nincs internet :(</div>");
	  		$("#closeResult").click();
	  		var storedData = window.localStorage.getItem("places");	  		
	  		var nowtime = strtotime("now");	  		
	  		if(storedData){
	  			resulto = json_decode(storedData);					
				near = document.getElementById("mapResultItems");
				if(resulto && resulto.length){
					near.innerHTML = "";
					for(var z=0;z<resulto.length;z++){						
						
									
						var place = resulto[z];
						var icondest = Api.getIcon(place);	
						var k = document.createElement("div");
					    k.className= "nearby";
					    k.setAttribute("rel",place.id);
					    if(place.events!=null){
					    	
					    	var mostmegy = "";
					    	for(var i=0;i<place.events.length;i++){
					    		
					    		var time = strtotime(place.events[i].date);
								mostmegy = (((time-3600)<nowtime && (time>nowtime) )? place.events[i].time+" - "+place.events[i].title : mostmegy);
					    	}
					    	
					    	k.innerHTML = "<img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title+"<br>"+mostmegy+"<a href='#fellepok/place/"+place.id+"' class='event'>események</a>";
					    }else{
					    	k.innerHTML = "<img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title;

					    }					    
					    
					    
					    k.addEventListener("click",function(e){
			    			
			    			var d = $(this);
			    			
			    		    $(".nearby").removeClass("selected");
			    		    d.addClass("selected");
			    		    
			    		    resulto = json_decode(storedData);	
			    		    for(var z=0;z<resulto.length;z++){	
			    		    	if(resulto[z].id==d.attr("rel")){
			    		    		var place = resulto[z];
			    		    		var icondest = Api.getIcon(place);
					    		    $("#mapPopup").html("<div class='wrp'><h1><img src='"+icondest+"' style='float:left;width:40px;margin-right:10px;'>"+place.title+"</h1> <h2><br>Koordináta: "+place.lat+", "+place.lng+"<br><div>"+place.text+"</div></div>").show();
					    		    break;
			    		    	}
			    		    }
			    		    
			    		    $("#mapPopup").click(function(e){e.preventDefault();$(this).hide();});
					    });

					    
				    	near.appendChild(k);
						
						
					}
				}
	  		}
	  	},
	  	addMapLayer:function(gmap,type){
	  		
	  		for (var i = 0; i < Api.markers.length; i++) {
	  			if(Api.markers[i].title!="Itt vagyok"){
	  				Api.markers[i].setMap(null);			
	  			}
	  		}
	  		
	  		var tent = window.localStorage.getItem("tent");
	  		tent = json_decode(tent);
	  		if(tent){	
	  			
				var gmarkers = new google.maps.Marker({
					map: gmap,
					optimized: true, 
					position: new google.maps.LatLng(tent[0].lat,tent[0].lng),
					title: "Sátram",
					icon: Settings.Tent,
					draggable: false,
					
				});
				Api.markers.push(gmarkers);
	  		}
	  		
	  		
	  		var token = window.localStorage.getItem('token');		
	  		var resulto = [];
	  		var storedData = window.localStorage.getItem("places");
	  		if(storedData){
	  			resulto = json_decode(storedData);					
				near = document.getElementById("mapResultItems");
				if(resulto && resulto.length){
					
					
					Api.pb.start(resulto.length);
					near.innerHTML = "";
					for(i=0;i<resulto.length;i++){
						
						if(SearchFilter!=null && SearchFilter[1]=="id" && resulto[i].id==SearchFilter[2]){
							Api.pb.updateBar(1);
							resulto[i].clicked = true;
							Api.createMarker(gmap,resulto[i]);
						}
						else if(resulto[i].type==type || resulto[i].icon=="mento"){
							Api.pb.updateBar(1);
							Api.createMarker(gmap,resulto[i]);
						}
					}
					Api.pb.hide();
				}else{						
					near.innerHTML = "Nincs találat";
				}
	  		}
	  		
	  		var locationShare = window.localStorage.getItem('locationShare');
	  		if(type=="heatmap" && locationShare!="disabled"){
	  				near.innerHTML = "<div style='padding:10px;'>Egy kis érdekesség. Nézd hőtérképen, hogy oszlik el a tömeg a FOO területén. (2km-es körzet)</div>";

	  				$.post(API_URL+"geo/get", {token:token,type:'heatmapl'}).done(function(data) {
								  				
						var item = json_decode(data);	
						var heatMapData = [];
						if(typeof(item.heatmap)){
							for(i=0;i<item.heatmap.length;i++){	
								var loc = new google.maps.LatLng(item.heatmap[i].lat,item.heatmap[i].lng);
								if(item.heatmap[i].weight && loc){								 
									heatMapData.push({location: loc, weight:parseFloat(item.heatmap[i].weight)});
								}
							}
							var heatmap = new google.maps.visualization.HeatmapLayer({
							    data: heatMapData,
							    radius: 10
							});
							heatmap.setMap(gmap);
						}
		  			}).fail(function(data){
		  				
						near.innerHTML = "<div style='padding:10px;'>Hőtérkép átmenetileg nem üzemel :(</div>";

		  			});
	  		}else{

	  		}
	  		
	  		
			
	  	},
	  	
	  	requestEvents:function(callback){
	  		
	  		var v = window.localStorage.getItem("events");
	  		if(!v || Settings.requestAllTime==true){
		  		FileApi.setItem(API_URL+"event/list","events.json",function(d){
		  			
				  	FileApi.getItem("events.json",function(k){
				  			if(k!=false){
						  		window.localStorage.setItem("events",k);					  		
						  		if(typeof callback == 'function'){
							    	callback(k);
								}
				  			}else{
				  				if(typeof callback == 'function'){
							    	callback(false);
								}
				  			}
				  	});
		  		});
	  		}else{
	  			if(typeof callback == 'function'){
			    	callback(v);
				}
	  		}
	  		
	  	},
	  	
	  	requestPlaces:function(callback){
	  		
	  		var v = window.localStorage.getItem("places");
	  		if(!v || Settings.requestAllTime==true){
		  		FileApi.setItem(API_URL+"allplace","places.json",function(d){
		  			
		  			
				  	FileApi.getItem("places.json",function(k){
				  			if(k!=false){
						  		window.localStorage.setItem("places",k);					  		
						  		if(typeof callback == 'function'){
							    	callback(k);
								}
				  			}else{
				  				if(typeof callback == 'function'){
							    	callback(false);
								}
				  			}
				  	});
		  					  		
		  		});	  	
	  		}else{
	  			if(typeof callback == 'function'){
			    	callback(v);
				}
	  		}
	  	},
	  	
	  	
	  	
	  	requestStatic:function(callback){
	  		
	  	
	  		var v = window.localStorage.getItem("static");
	  		if(!v || Settings.requestAllTime==true){
	  		
		  		FileApi.setItem(API_URL+"static","static.json",function(d){
		  			
		  			
				  	FileApi.getItem("static.json",function(k){
				  			if(k!=false){
						  		window.localStorage.setItem("static",k);					  		
						  		if(typeof callback == 'function'){
							    	callback(k);
								}
				  			}else{
				  				if(typeof callback == 'function'){
							    	callback(false);
								}
				  			}
				  	});
		  			
			  		
		  		});
	  		}else{
	  			if(typeof callback == 'function'){
			    	callback(v);
				}
	  		}
	  		
	  	},
	  	array_unique:function(arr) {
		    arr = arr.sort(function (a, b) { return a*1 - b*1; });
		    var ret = [arr[0]];
		    for (var i = 1; i < arr.length; i++) { // start loop at 1 as element 0 can never be a duplicate
		        if (arr[i-1] !== arr[i]) {
		            ret.push(arr[i]);
		        }
		    }
		    return ret;
		}
	};
	
	
	
	/* Render */
	var _Renderer = {
			
			
			
			loaderStart:function(){
				
				$("#render").css({x:"+100%"});
				
			},
			
			loaderEnd:function(){				
				
				$("#render").transition({ x: '0%' },600,'easeOutQuart');
			},
			
			check:function(e){
				
				
			},
			
			
			render:function(e,callback){
				
				
				
				var display = $("#render");
				
				display.html(e.html());
				display.show();	
				_Renderer.loaderEnd();
							
				$("header").show();

				setTimeout(function(){				
					callback(display);
				},100);
				
				
				
			},
			log:function(e){
				;
				$("#result").prepend(e+"<br>");
			},
			
			mapMenu:function(){
				var flyerleft = $("#mapLayer");
				var display = $("#mapWrapper");
				
				var x2 = display.width()-80;
				
				$("#mapMenuButton").unbind().bind("click",function(e){
							e.preventDefault();
							
							
							if(flyerleft.css("display")=="none"){								
								flyerleft.show();
								display.transition({ x: '-80%' });
								
							}else{
								display.transition({ x: '0' },function(){
									$(this).attr("style","");
									flyerleft.hide();
								});									
							}
							
							
				});
				
				
				var openButon = $(".closeResult");
				
				
				
				openButon.click(function(){
					
					
					var mapWrapper = $("html").height();
					var laptopszalonad = $("#laptopszalonad").height();
				
					
					
					var canvas = $("#mapResult");
				
					var height = (mapWrapper*0.6);
					canvas.height(height);
					canvas.css({"bottom":"-"+(height)+"px"});
					if(openButon.attr("rel")=="opened"){
						openButon.attr("rel","");
						$("#mapResult").transition({ y: '0px' });
						$("#map_canvas").transition({ y: '0%' });
					}else{
						openButon.attr("rel","opened");
						var height = (canvas.height());
						canvas.transition({ y: '-'+height+'px' });
						$("#map_canvas").transition({ y: '-' + (height/2)+'px' });
					}
				});
						
				
			},
			
			getDensity:function(){	
				switch(window.devicePixelRatio){
					case "2":
						return "hdpi";
					break;
				
					case "1.5":
						return "hdpi";
					break;
					
					case "1.0":
						return "mdpi";
					break;
					
					case "0.5":
						return "ldpi";
					break;
					default:
						_Renderer.log(window.devicePixelRatio);
						return "mdpi";
					break;			
				}			
			},
			
			menu:function(){
					
				
									
					
				
			},
			
			getPlace:function(place,id){
				
				for(var i=0; i<place.length; i++) {
					if(place[i].id==id){
						return place[i];
					}
				}
				return false;
			},
			
			updateStaticList:function(data){
				
					if(data!="false" && data!=null){
						
						var res = json_decode(data);
						
						
						if(res && res.length){
							var ide = $("#render #ide");
							
							ide.html("");						
							for(var i=1;i<res.length;i++){
								ide.append("<li><a href='' class='clickevent' rel='"+res[i][0].catid+"'>"+res[i][0].name+"</a></li>" +
										"<div id='art"+res[i][0].catid+"' class='hide desc'>"+res[i][0].text+"</div>");
							}
							
							$(".clickevent").click(function(e){
								e.preventDefault();
								var rel = $(this).attr("rel");
								var ar = $("#art"+rel);
								if(ar.attr("rel")!="open"){
									ar.show();
									ar.attr("rel","open");
									_Renderer.log("zar");
								}else {
									ar.attr("rel","");
									ar.hide();
									_Renderer.log("nyit");
								}
							});
							
							
							
							
						}else{
							var b = $("<button>Ismét</button>");
							b.addClass("retry");
							b.click(function(){
								$("#render #ide").html("<br><br><div style='text-align:center;'>frissítés</div>");
								_PageInit.download();
							});
							$("#render #ide").html("<div class='error'>Nincs internet kapcsolat.").append(b);
						}
						
						
						
					}
			},
			
			
			updateAdatlap:function(id,e){
			
				var k = $("section#template_adatlap").find(".item").clone();
				
				if(id){
					
					
					var d = window.localStorage.getItem('events');
					var favorites = window.localStorage.getItem('favorites');
					if(favorites){
						Api.favorites = json_decode(favorites);
					}
					else{
						Api.favorites = [];
					}
					var res = json_decode(d);
					
					
					var places = window.localStorage.getItem('places');
					places = json_decode(places);
					
					
					var nap;
					if(res.length){
						
						e.html("");
						var data = [];
						for(var i=0;i<res.length;i++){
							
							if(id == res[i].nid){
								data = res[i];
								k.find("img.leaderPic").attr("title",i).attr("id","thumb"+data.nid);
								break;
							}
						}
						
						
					
						
						var kep = data.thumb;
						if(kep!=""){
						var dakep = k.find("img.leaderPic");
						dakep.attr("src",kep).attr("title",i).attr("id","thumb"+data.nid);
						
						
							ImgCache.useCachedFile(dakep,null,function(){
								
							});
						}
						
						
						var placename = _Renderer.getPlace(places, data.place);
						if(placename!=undefined  && placename!=false){
							 placename = placename.title;								
						}
						else{
							placename = "";
						}
						$("#render #bandname").html(data.title);
						k.find(".leaderTitle").html(data.title);
						k.find(".time").html(data.day_text+" "+data.time);
						k.find(".place").attr("href","#fellepok/place/"+data.place).find("span").html(placename);
						
						var body = data.body;
						
						k.find(".artDesc2").html(body).attr("id","art"+i);
						
						if(Api.favorites.indexOf(data.nid)!=-1){
							k.find("#addKedvencek").removeClass("disabled");
						}
						
						k.find("#addKedvencek").attr("rel",data.nid).bind("click",function(){
							var m = $(this);
							var res = m.attr("rel");
							
							if(Api.favorites){
								
								
								if(m.hasClass("disabled")){
									Api.favorites.push(res);
									m.removeClass("disabled");
								}else{
									m.addClass("disabled");
									var newarr = new Array();
									for(var i=0;i<Api.favorites.length;i++){
										if(Api.favorites[i]!=res){
										newarr.push(Api.favorites[i]);
										}
									}
									if(newarr==null){
										newarr = [];
									}
									Api.favorites = newarr;
								}									
								
							}else{
								Api.favorites = [];
								Api.favorites.push(res);
								m.removeClass("disabled");
							}
							Api.favorites = Api.array_unique(Api.favorites);
							window.localStorage.setItem("favorites",json_encode(Api.favorites));
							return false;
						});
						
						k.show();
						e.append(k);
						
						
					}
					
				}
				
				
			},
			
			
			updateFellepok:function(data){
				
				
				
				
				
				
				
				if(data!="false" && data!=null){
					
					var e = $("section#template_fellepok").clone();
					
					var itemTemp = e.find(".item");	
					
					window.localStorage.setItem('events',(data));
					
					var res = json_decode(data);
					
					
					var places = window.localStorage.getItem('places');
					var favorites = window.localStorage.getItem('favorites');
					if(favorites){
						Api.favorites = json_decode(favorites);
					}
					places = json_decode(places);
					
					
					var nap;
					if(res){
						
						if(SearchFilter!=null && SearchFilter[1]=="favorite" && Api.favorites.length==0){
							$("#render #ide").html("<br><br><div style='text-align:center;padding:20px;'>Kattints a csillagra az előadók adatlapján, hogy bekerüljön a kedvencek lisájába</div>");
						}else{
							$("#render #ide").html("");
						}
						
						for(var i=0;i<res.length;i++){
							
							var placeid = res[i].place;
						
							if(SearchFilter!=null && SearchFilter[1]=="place" && SearchFilter[2]!=placeid){
								
							}
							else if(SearchFilter!=null && SearchFilter[1]=="id" && SearchFilter[2]!=res[i].nid){
								
							}
							else if(SearchFilter!=null && SearchFilter[1]=="favorite" && (res[i].main=="0" || Api.favorites.indexOf(res[i].nid)==-1)){
								
							}
							else if(SearchFilter!=null && SearchFilter[1]=="main" && SearchFilter[2]!=res[i].main){
								
							}else{
							
								
							
							var k = itemTemp.clone();
							
							
							if(nap != res[i].day_text){
								
								var tim = res[i].time.substring(0,2);
								if(tim!="00" && tim!="01"){
								
								nap = res[i].day_text;
								var z = $("<div id='nap-"+res[i].date.substring(0,10)+"'></div>");
								z.addClass("dayContainer");
								
								
								z.append("<h2 class='nap closed' rel='nap-"+res[i].date.substring(0,10)+"'>"+nap+"<span>"+res[i].date.substring(0,10)+"</span></h2>");
								}
							}
						
							
							
							var placename = _Renderer.getPlace(places, placeid);
							if(placename!=undefined  && placename!=false){
								placename = placename.title;								
							}
							else{
								placename = "";
							}
							if(res[i].thumb!=""){
								
								k.find("img.leaderPic").attr("title",i).attr("id","thumb"+res[i].nid);
								
									
									var kep = res[i].thumb;
									if(kep!=""){
										var dakep = k.find("img.leaderPic");
										dakep.addClass("lazy")
										
										.attr("src",kep)
										.attr("title",i)
										.attr("id","thumb"+res[i].nid);
									
										
										ImgCache.useCachedFile(dakep,null,function(){
											
										});										
									}				
								
							}
							
							k.find(".clickevent").attr("rel",res[i].nid);
							k.find(".leaderTitle").html(res[i].title);
							/*k.find(".leaderText").html(res[i].short);*/
							k.find(".time").html(res[i].time);
							k.find(".place").html(placename);
							
							
							if(Api.favorites.indexOf(res[i].nid)!=-1){ 
								k.append("<div class='kedvencicon ezkedv'></div>");
							}
							
							
							var body = res[i].body;
							
							k.find(".artDesc").html(body+"<div class='ikonsor'><a href='#kedvencek' class='kedvencicon'></a><a href='#terkep' class='terkepicon'></a></div>").attr("id","art"+i);
							
							
							k.find(".clickevent").click(function(e){
								e.preventDefault();
								var rel = $(this).attr("rel");
								if(screen.width<330){
								window.location.href = "#adatlap/id/"+rel;
								}
								else{
								
								
									
									
									
									var pop = $("#render #adatlap");
									
									pop.css({x:"-100%"});
									
									$("header").hide();
									
									_Renderer.updateAdatlap(rel,pop);
									var bezar = $("<a></a>");
									bezar.html("<img src='css/icon/back.png'>");
									bezar.addClass("closex");
									bezar.click(function(){
										ar.attr("rel","");
										pop.transition({ x: '-100%' },400,'easeOutQuart');
										//pop.addClass("hide");
										_Renderer.log("nyit");
										pop.html("");
										$("header").show();
									});
									pop.append(bezar);
									var rel = $(this).attr("rel");
									var ar = $("#art"+rel);
									if(ar.attr("rel")!="open"){
										
										pop.removeClass("hide").transition({ x: '0%' },600,'easeOutQuart');
										ar.attr("rel","open");
										_Renderer.log("zar");
									}else {
										
										ar.attr("rel","");								
										pop.addClass("hide");
										_Renderer.log("nyit");
									}
								}
								
							});
							
							var time = strtotime(res[i].date);
							var nowtime = strtotime("now");
							/*nowtime.setFullYear(2013,5,21);*/
							if(nowtime<time){						
								
								/*k.show();*/
							}else{
								
							}
							z.append(k);
							}
							$("#render #ide").append(z);
						}
						var offSet = 0;
						var offsetArray = [];
						var i = 0;
						$(".dayContainer").each(function(g){
							offSet+= this.clientHeight;
							offsetArray[i] = offSet;
							i++;
						});
						
						
						$("h2.nap").bind("click",function(g){
							var m = $(this);
							
							if(m.hasClass("closed")){
								m.removeClass("closed");
								$("#"+m.attr("rel")+" .item").show();
							}else{
								m.addClass("closed");
								$("#"+m.attr("rel")+" .item").hide();
							}
						});
					

						
						
						$("img.lazy").each(function(index, value) {						   
						    var dakep = $(value);
						    
						    	
						    ImgCache.useCachedFile(dakep,function(dakep){
					    		dakep.attr("src",dakep.attr("data-src"));
					    	},function(dakep){
					    		dakep.attr("src",dakep.attr("data-src"));
					    	});
						    	
						});
						
						var bz = offsetArray[1];
						var ide = $("#render #ide");
						ide.scrollTop(bz+"px");
					}else{
						var b = $("<button>Ismét</button>");
						b.addClass("retry");
						b.click(function(){
							$("#render #ide").html("<br><br><div style='text-align:center;'>frissítés</div>");
							_PageInit.download();
						});
						$("#render #ide").html("<div class='error'>Nincs internet kapcsolat.").append(b);
					}				
				}
				else{
					var b = $("<button>Ismét</button>");
					b.addClass("retry");
					b.click(function(){
						$("#render #ide").html("<br><br><div style='text-align:center;'>frissítés</div>");
						_PageInit.download();
					});
					$("#render #ide").html("<div class='error'>Nincs internet kapcsolat.").append(b);
				}
				
	  	},
	  	
	  	
	  	
	  	updateEsemenyek:function(data){
			
			
			
			
			
			
			
			if(data!="false" && data!=null){
				
				var e = $("section#template_esemenyek").clone();
				
				var itemTemp = e.find(".item");	
				
			
				var res = json_decode(data);
				
				
				var places = window.localStorage.getItem('places');
				places = json_decode(places);
				
				var favorites = window.localStorage.getItem('favorites');
				if(favorites){
					Api.favorites = json_decode(favorites);
				}
				
				if(SearchFilter[1]=="favorite"){
					$("#render header span").html("Kedvencek");
				}
				var nap,z,k;
				if(res){
					
					
					
					$("#render #ide").html("<div>");
					for(var i=0;i<res.length;i++){
						
						var placeid = res[i].place;
						
						if(SearchFilter!=null && SearchFilter[1]=="favorite" && Api.favorites.indexOf(res[i].nid)==-1){
							
						}
						else if(SearchFilter[1]!="favorite" && res[i].main=="1"){
							
						}else{
						
						
						
						k = itemTemp.clone();
						
						
						if(nap != res[i].day_text){
							
							
							var tim = res[i].time.substring(0,2);
							if(tim!="00" && tim!="01"){							
								nap = res[i].day_text;
								z = $("<div></div>");
								z.append("<h2>"+nap+"<span>"+res[i].date.substring(0,10)+"</span></h2>");
							}														
						}
						
						var placename = _Renderer.getPlace(places, placeid);
						if(placename!=undefined  && placename!=false){
							placename = placename.title;								
						}
						else{
							placename = "";
						}
						
						
						k.find(".clickevent").attr("rel",i);
						k.find(".leaderTitle").html(res[i].title);
						/*k.find(".leaderText").html(res[i].short);*/
						k.find(".time").html(res[i].time);
						k.find(".place").html(placename);
						
						var body = res[i].body;
						
						k.find(".artDesc").html(body+"<div class='ikonsor'><a href='#kedvencek'  class=' kedvencicon disabled'></a></div>").attr("id","art"+i);
						
						
						if(res[i].thumb!=""){
							
						k.find("img.leaderPic").attr("title",i).attr("id","thumb"+res[i].nid);
							
								
								var kep = res[i].thumb;
								if(kep!=""){
								var dakep = k.find("img.leaderPic");
								dakep.attr("src",kep).attr("title",i).attr("id","thumb"+res[i].nid);
								
								
									ImgCache.useCachedFile(dakep,null,function(){
										
									});
								}
							
							
						}else{
							k.find("img.leaderPic").remove();
						}
						
						
						if(Api.favorites.indexOf(res[i].nid)!=-1){
							k.find(".kedvencicon").removeClass("disabled");
						}
						
						
						
						
						k.find(".kedvencicon").attr("rel",res[i].nid).bind("click",function(){
							var m = $(this);
							var res = m.attr("rel");
							var index;
							if(Api.favorites){
								
								
								if(m.hasClass("disabled")){
									Api.favorites.push(res);
									m.removeClass("disabled");
								}else{
									m.addClass("disabled");
									var newarr = new Array();
									for(var i=0;i<Api.favorites.length;i++){
										if(Api.favorites[i]!=res){
										newarr.push(Api.favorites[i]);
										}
									}
									if(newarr==null){
										newarr = [];
									}
									Api.favorites = newarr;
								}								
								
							}else{
								Api.favorites = [];
								Api.favorites.push(res);
								m.removeClass("disabled");
							}
							Api.favorites = Api.array_unique(Api.favorites);
							window.localStorage.setItem("favorites",json_encode(Api.favorites));
							return false;
						});
						
						
						k.find(".clickevent").click(function(e){
							e.preventDefault();
							
							var rel = $(this).attr("rel");
							var ar = $("#art"+rel);
							if(ar.attr("rel")!="open"){
								ar.show();
								ar.attr("rel","open");
								_Renderer.log("zar");
							}else {
								ar.attr("rel","");
								ar.hide();
								_Renderer.log("nyit");
							}
							
						});
						k.show();
						z.append(k);
						}
						
						$("#render #ide").append(z);
					}
					
				}else{
					var b = $("<button>Ismét</button>");
					b.addClass("retry");
					b.click(function(){
						$("#render #ide").html("<br><br><div style='text-align:center;'>frissítés</div>");
						_PageInit.download();
					});
					$("#render #ide").html("<div class='error'>Nincs internet kapcsolat.").append(b);
				}					
			}
			else{
				var b = $("<button>Ismét</button>");
				b.addClass("retry");
				b.click(function(){
					$("#render #ide").html("<br><br><div style='text-align:center;'>frissítés</div>");
					_PageInit.download();
				});
				$("#render #ide").html("<div class='error'>Nincs internet kapcsolat.").append(b);
			}
			
	  	}
			
	};
	
	var locationWrapper = {
	        put: function(hash, win) {
	            (win || window).location.hash = hash;
	        },
	        get: function(win) {
	            var hash = ((win || window).location.hash).replace(/^#/, '');
	            return hash;
	        }
	};
	
    var _ = {
            appState: undefined,
            callback: _PageInit.start,
            init:  function(callback) {},
            check: function() {},
            load:  function(hash) {},
            log: _Renderer.log            
    };
   
    $.foo = _;
    
    
    var Implementer = {
            init: function() {
                
                var current_hash = locationWrapper.get();
                _.appState = current_hash;
                _.callback(current_hash);
                setInterval(_.check, 70);
               
            },
            check: function() {
                var current_hash = locationWrapper.get();
                if(current_hash != _.appState) {
                    _.appState = current_hash;
                    _.callback(current_hash);
                   
                }
            },
            load: function(hash) {
                if(hash != _.appState) {
                    locationWrapper.put(hash);
                    _.appState = hash;
                    _.callback(hash);
                    
                }
            }
    };
    
	
	
    
    $.extend(_, Implementer);
    
   
    
})(jQuery);


