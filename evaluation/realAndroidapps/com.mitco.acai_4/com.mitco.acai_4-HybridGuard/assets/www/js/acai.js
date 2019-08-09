/* LOGIN PROCEDURE ------------------------------------*/

myApp.onPageInit('index', function (page) {
	getHome();
	myApp.allowPanelOpen = true;//riabilito lo swipe del panel menu laterale
	//alert(localStorage.getItem("countAd"));
	if(localStorage.getItem("countAd")==3){
		//alert("ok");
					AdMob.prepareInterstitial({
					adId: admobid.interstitial,
					autoShow: true
					});
					localStorage.setItem("countAd",1);
					
		}
		else
		{localStorage.setItem("countAd",parseInt(localStorage.getItem("countAd"))+1);}
		
});



myApp.onPageInit('login', function (page) {
	myApp.allowPanelOpen = false; //disabilito lo swipe del panel menu laterale
	mainView.history=[]; //reset della storia di navigazione
	if(localStorage.getItem("rem")==true){
		$('#rem_check').attr('checked','checked');
		$("#cod_sede").val(localStorage.getItem("cod_sede"));
		$("#psw_sede").val(localStorage.getItem("sede_pwd"));
		}
	else{$('#rem_check').removeAttr('checked');}
});



 

function login(){
	
	var sede=$("#cod_sede").val();
	var pass=$("#psw_sede").val();
	//var rem=$("#slider").val();
	if($('#rem_check').is(':checked')){
		
		localStorage.setItem("rem", true);
		}else{
			localStorage.setItem("rem",false);
			}
	//alert($('#rem_check').attr('checked'));
	usrid=device.uuid;
	//localStorage.setItem("rem", $('#rem_check').attr('checked'));
	$.ajax({
            type:'POST',
            url: 'http://www.cafacaidip.it/acaiapp2/server/login.php',
            data: "sede="+sede+"&pass="+pass+"&usrid="+usrid,
            success:function(data){	
				if(data=='ok'){
					localStorage.setItem("cod_sede", sede);
					update_reg(localStorage.getItem("idusr"),localStorage.getItem("idreg"));
					$("#hsede").html( localStorage.getItem("cod_sede"));
					if(localStorage.getItem("rem")=="true"){
					localStorage.setItem("sede_pwd", pass);
					}
					else{
						localStorage.removeItem("sede_pwd");
						}
					mainView.router.loadPage("index.html");
					//start admob after login----------
					/*AdMob.prepareInterstitial({
					adId: admobid.interstitial,
					autoShow: true
					});*/
					//----------------------------------
				
				
				}else{myApp.alert("User e Password errati","Accesso Negato");}
			   },
			
			error:function(data){
				myApp.alert("E' errore nella procedura, si prega di riprovare","Ops");
            }
        });
	
	
	}
/* ----------------------------------------------------*/



/* LOGOUT PROCEDURE ------------------------------------*/
function logout(){
//localStorage.removeItem("cod_sede");
localStorage.removeItem("sede_pwd");
mainView.router.loadPage("login.html");
}
/* ----------------------------------------------------*/


/* UPDATE REG ID FOR PUSH NOTIFICATION PROCEDURE ------------------------------------*/
function update_reg(id,reg){	
	//navigator.geolocation.getCurrentPosition(onSuccess, onError);
	//lat=localStorage.getItem("lat");
	//lng=localStorage.getItem("lng");
	//localStorage.getItem("sede");
	if(localStorage.getItem("cod_sede")!=null){sede=localStorage.getItem("cod_sede");}
	else{sede="";}
	//alert(sede+" | "+ id+" | "+reg);
	$.ajax({
            type:'POST',
            url: 'http://www.cafacaidip.it/acaiapp2/server/update_reg.php',
            data: "sede="+sede+"&id="+id+"&reg="+reg,
            success:function(data){	
				//alert(data);

            },
			error:function(data){
				//alert("kokoko");
            }
        });
}
/* -------------------------------------------------------------------------------*/








	