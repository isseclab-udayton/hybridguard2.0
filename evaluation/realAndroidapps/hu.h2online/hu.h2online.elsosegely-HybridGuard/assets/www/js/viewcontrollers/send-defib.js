ViewController.SendDefib = new Class({
    Extends: ViewController.MainViewController,
    
    send_button: null,
    photo_button: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/send-defib.html');
        this.screenName = "bekuldes";
        this.send_button = this.view.getChildComponent('send-button');
    	this.send_button.addEvent('tap', this.bound('sendMessage'));
        this.send_button.setLabel(Localization.trans("FIRSTAID_RES_0042"));
        this.photo_button = this.view.getChildComponent('photo-button');
    	this.photo_button.addEvent('tap', this.bound('takePhoto'));
        this.photo_button.setLabel(Localization.trans("FIRSTAID_RES_0075"));
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        this.parent();
    },
    viewWillEnter: function() {
    	if (device.platform == "iOS") {
    		navBar.hideRightButton();
    	}
        this.parent();
    },
    sendMessage: function() {
    	if ($(".name").val() == "" || $(".telepules").val() == "" || $(".iranyitoszam").val() == "" ||  $(".cim").val() == "" ||  $(".hely").val() == "" ||  $(".elerhetoseg").val() == "" ||  $(".bekuldo_nev").val() == "") {
    		alert(Localization.trans("FIRSTAID_RES_0089"));
    	} else {
    	$.ajax({
            
            url: Localization.trans("FIRSTAID_RES_REST_URL")+'/mobile/send_defib',
            type: 'POST',
            data: $("#bekuld-form").serialize(),
            cache: false,
            success: function(data) { 
                            if (data){
                         	   
                         	   $.ajax({

                         			url: Localization.trans("FIRSTAID_RES_REST_URL")+'/mobile/save_picture',
                         			type: 'POST',
                         			data: 'filename='+data+'.jpg&image_data='+defib_photo+'&id='+data,
                         			cache: false,
                         			success: function(data) {
                         				
                     	   				navigator.notification.alert(
                     	   					Localization.trans("FIRSTAID_RES_0050"),  // message
                                        function(){
                     	   						$("#bekuld-form input[type=text], #bekuld-form input[type=email], #bekuld-form input[type=number]").val("");
                     	   					viewstack.pushViewController(new ViewController.More(), new Moobile.ViewTransition.None);
                                        },         // callback
                                        Localization.trans("FIRSTAID_RES_0051"),            // title
                                        Localization.trans("FIRSTAID_RES_0002")                  // buttonName
                     	   				); 
                     	   				
                         			},
                         			beforeSend: function(xhr){
                         			xhr.setRequestHeader('Securitycode','elsosegelymobil');
                         			xhr.setRequestHeader('Passkey','wbelsosegely2012');
                         			},
                         			error:function(xhr,ajaxOptions, thrownError){
                         			
                         			}

                         			});
                                            
                         	   
                                            
                            }
                            
            },
            beforeSend: function(xhr){
                            xhr.setRequestHeader('Securitycode','elsosegelymobil');
                            xhr.setRequestHeader('Passkey','wbelsosegely2012');
            },
            error:function(xhr,ajaxOptions, thrownError){
                
                            
            }});
    	}
    },
    takePhoto: function() {
    	
    	capturePhoto();
    },
    destroy: function() {
    	
        this.parent();
    }
});





