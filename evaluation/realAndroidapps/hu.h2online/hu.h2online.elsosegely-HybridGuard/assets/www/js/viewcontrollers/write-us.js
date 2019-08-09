ViewController.WriteUs = new Class({
    Extends: ViewController.MainViewController,
    list: null,
    send_button: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/write-us.html');
        this.screenName = "contact-form";
        this.search_hospital_button = this.view.getChildComponent('send-button');
    	this.search_hospital_button.addEvent('tap', this.bound('sendMessage'));
        this.search_hospital_button.setLabel(Localization.trans("FIRSTAID_RES_0042"));
        this.parent();
    },
    viewDidLoad: function() {
        this.parent();
    },
    viewDidBecomeReady: function() {
        this.parent();
    },
    viewWillEnter: function() {
    	
        this.parent();
    },
    sendMessage: function() {
		var self = this;
    	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (re.test($(".user-email").val())) {
        	$.ajax({
                
                url: Localization.trans("FIRSTAID_RES_REST_URL")+'/mobile/send_mail',
                type: 'POST',
                data: 'email='+$(".user-email").val()+'&helyzet='+$(".helyzet").val()+'&javaslat='+$(".javaslat").val()+'&hasznos='+$(".hasznos").val()+'&device='+device.name+" - "+device.platform+" "+device.version,
                cache: false,
                success: function(data) { 
                                if (data="OK"){
                                                
                             	   
                             	   				navigator.notification.alert(
                             	   				Localization.trans("FIRSTAID_RES_0050"),  // message
                                                function(){
                             	   					$(".write-us-view input[type=text], .write-us-view textarea").val()
                             	   					viewstack.popViewController(); 
                                                },         // callback
                                                Localization.trans("FIRSTAID_RES_0051"),            // title
                                                Localization.trans("FIRSTAID_RES_0002")                  // buttonName
                             	   				); 
                                                
                                }
                },
                beforeSend: function(xhr){
                                xhr.setRequestHeader('Securitycode','elsosegelymobil');
                                xhr.setRequestHeader('Passkey','wbelsosegely2012');
                },
                error:function(xhr,ajaxOptions, thrownError){
                    
                                
                }
                
        		});
        } else {
        	self.showMessage(Localization.trans("FIRSTAID_RES_0049"), Localization.trans("FIRSTAID_RES_0029"));
        }
    },
    destroy: function() {
        this.parent();
    }
});





