this.imagePreview = function(){	
    xOffset = 490;
    yOffset = -150;
    $(".preview").hover(function(e){
        this.title = "";	
        var c = (this.t != "") ? "<br/>" + this.t  : "";
        $("body").append("<p align=right dir=rtl id='preview'><img  src='"+ this.id +"' width='530' height='430'  />"+ "</p>");								 
        $("#preview")
        .css("top",(e.pageY - xOffset) + "px")
        .css("left",(e.pageX + yOffset) + "px")
        .fadeIn("normal");						
    },
    function(){
        this.title = this.t;	
        $("#preview").remove();
    });	
    $(".preview").mousemove(function(e){
        $("#preview")
        .css("top",(e.pageY - xOffset) + "px")
        .css("left",(e.pageX + yOffset) + "px");
    });	
};

window.onscroll = function() {
    $("#bg").css("top", $("body").scrollTop());
};

$(window).load(function() {
    nav = "nav.asp"
    $.get(nav,function(response){
        $("#nav").html(response);
    });
});

$(document).ready(function(){

//registerPushwoosh();


    $.history.init(function(hash){
        if(hash != '' && hash != 'index.html')
        {
            golink(hash);
			$('html,body').animate({
				scrollTop:0
			},1300);
        } else
            golink("http://netivei-haor.net/mobile/go.asp");
    },
    {
        unescape: ",/"
    });
    $(".menubutton").live("click",function(){
        if ($(".panel").css("left") == "0px") {
            $("body").css("min-height", "0");
            $("body").css("max-height", "none");
            $("#bodyloader").css("overflow", "auto");
            $("#bodyloader").css("min-height", "0");
            $("#bodyloader").css("max-height", "none");
            $("#bg").hide();
            $('.panel').animate({
                left: "-205px"
            }, 500, function() {
                $(this).hide();
            });
        } else {
            $(".panel").show();
            var panelheight = $(".panel").height();
            $("body").css("min-height", panelheight);
            $("body").css("max-height", panelheight);
            $("#bodyloader").css("overflow", "hidden");
            $("#bodyloader").css("min-height", panelheight);
            $("#bodyloader").css("max-height", panelheight);
            $("#bg").show();
            $('.panel').animate({
                left: "0px"
            }, 500);
        }
    });
    $('.backbutton').live("click",function(){
        parent.history.back();
    });
    
    $("body").on("click","a,.box section:not('.inner')",function(){
        var moshe = ($(this).prop("tagName") == "SECTION") ? $(this).find("a.more") : $(this);
        var link = ""+$(moshe).attr("href");
        if (link == "undefined")
            return true;
        if($(moshe).attr('target') != undefined)
        {
            window.open(link);
            return false;
        }
        else
        {
            $.history.load(link);
            return false;
        }
    });
      
    $("footer .up").live("click",function(){
        $('html,body').animate({
            scrollTop:0
        },1300);
        return false;
    });
    $("#download").live("click",function(){
        $("body").append('<script src="js/addToHome.js"></script>');
        var addToHomeConfig = {
            autostart: true,
            startDelay: 0,
            returningVisitor: true,
            expire: 0,
            touchIcon: true,
            hookOnLoad: false
        };
        addToHome.show(true);
    });
    
    $(".faqbox section").live("click",function(){
        var faqid = $(this).attr("id");
        faqid = faqid.replace("faq-", "");
        $(".faqbox .ans").not(".faqbox #ans-"+faqid).hide("slow");
        $(".faqbox #ans-"+faqid).toggle("slow");
    });
    
    $(".faqbox .send#sendshela").live('click',function(){
        $('#addque').bPopup();
    });
    $(".faqbox .send#searchshela").live('click',function(){
        $('#searchbox').bPopup();
    });
    $(".submenu .reg").live('click',function(){
        $('#reg').bPopup();
    });
    $(".submenu .log").live('click',function(){
        $('#log').bPopup();
    });
    $("#contactpop, #menucontact").live('click',function(){
        $('#contact').bPopup();
    });
    $("#searchFrm").live("submit",function(event){
        event.preventDefault();
        var val = $('form[id="searchFrm"] input[name="q"]').val();
        if(val.length <=1){
            alert('חובה להכניס מילת חיפוש בעלת 2 תווים לפחות');
            return false;
        } else {
            link = 'http://netivei-haor.net/mobile/go.asp?go=search&'+$(this).serialize();
            $(".menubutton").trigger('click');
            $.history.load(link);
            return true;
        }
    });
	
    $("form[name='searchbox']").live("submit",function(event){
        event.preventDefault();
        var val = $('form[name="searchbox"] input[name="q"]').val();
        if(val.length <=1){
            alert('חובה להכניס מילת חיפוש בעלת 2 תווים לפחות');
            return false;
        } else {
            link = 'http://netivei-haor.net/mobile/go.asp?go=faq&'+$(this).serialize();
            $.history.load(link);
			location.reload();
            return true;
        }
    });
    
    $("#bg,a.close,.panel a").on("click",function(){
        $(".menubutton").trigger('click');
    });
    
    $('form[name="addfaq"]').live("submit",function(){
        sendshela();
        return false;
    });
    $('form[name="addcomment"]').live("submit",function(){
        sendcomment();
        return false;
    });
    $('form[name="reg"]').live("submit",function(){
        doreg();
        return false;
    });
    $('form[name="log"]').live("submit",function(){
        dologin();
        return false;
    });
    $('form[name="contact"]').live("submit",function(){
        sendcontact();
        return false;
    });
    imagePreview();
    
    function sendshela() {
        if($.trim($('form[name="addfaq"] #name').val()) == ''){
            alert('חובה להכניס שם מלא');
            return false;
        }
        if($.trim($('form[name="addfaq"] #text').val()) == ''){
            alert('חובה להכניס תוכן לשאלה');
            return false;
        }
        if($.trim($('form[name="addfaq"] #email').val()) == ''){
            alert('חובה להכניס כתובת דואר אלקטרוני');
            return false;
        }
        $('#sendus').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>');
        urlme = 'http://netivei-haor.net/goajax.asp?action=sendshela';
        datame = 'name=' + escape($('form[name="addfaq"] #name').val()) + '&nose=' + escape($('form[name="addfaq"] #nose').val()) + '&email=' + $('form[name="addfaq"] #email').val() + '&text=' +  escape($('form[name="addfaq"] #text').val());
        $.ajax({
            type: "POST",
            data: datame,
            cache: false,
            url: urlme,
            success: function(data) {
                if(data == "ok"){
                    $('#sendus').html("<span class='success'>השאלה נשלחה בהצלחה. תשובה תתקבל בכתובת המייל שסיפקת</span>");
                }
                else{
                    $('#sendus').html("<span class='error'>ישנה בעיה, אנא נסה שנית עוד כמה שניות</span>");
                }
            }
        });
    }
    function sendcomment() {
        if($.trim($('form[name="addcomment"] #content').val()) == ''){
            alert('חובה לכתוב טקסט לתגובה');
            return false;
        }
        datame = 'content=' + escape($('form[name="addcomment"] #content').val()) + '&shelaid=' + escape($('form[name="addcomment"] #shelaid').val());
        $.ajax({
            type: "POST",
            data: datame,
            cache: false,
            url: 'http://netivei-haor.net/goajax.asp?action=commentsend',
            success: function(data) {
                if (data == "ok"){
                    $("#outputcomment").html('<span class="success">נשלח בהצלחה ויפורסם אחרי אישור</span>')
                }
                if (data == "no"){
                    alert("זוהתה תקלה, יתכן ולא נרשמתם לאתר. לשליחת תגובות נדרש לבצע רישום לאתר")
                }
            }
        });
    }
    function doreg() {
        if($.trim($('form[name="reg"] #username').val()) == ''){
            alert('חובה לרשום כתובת מייל');
            return false;
        }
        if($.trim($('form[name="reg"] #password').val()) == ''){
            alert('חובה לרשום סיסמא');
            return false;
        }
        if($.trim($('form[name="reg"] #name').val()) == ''){
            alert('חובה לרשום שם');
            return false;
        }
        $('#outputreg').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>');
        $.ajax({
            type: "GET",
            cache: false,
            url: 'http://netivei-haor.net/goajax.asp?action=regme&username='+$('form[name="reg"] #username').val()+'&password='+escape($('form[name="reg"] #password').val())+'&name='+escape($('form[name="reg"] #name').val()),
            success: function(data) {
                $('#outputreg').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>')
                if(data == 'wrong'){
                    $('#outputreg').html('<span class="error">כתובת המייל שגוייה</span>')
                }
                if(data == 'kayam'){
                    $('#outputreg').html('<span class="error">כתובת המייל קיימת במערכת</span>')
                }
                if(data == 'ok'){
                    $('#outputreg').html('<span class="success">נרשמת בהצלחה, היכנס לחשבון.</span>')
                }
            }
        });
    }
    function dologin(){
        $('#outputlog').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>');
        $.ajax({
            type: "GET",
            cache: false,
            url: 'http://netivei-haor.net/goajax.asp?action=logme&username='+$('form[name="log"] #username2').val()+'&password='+escape($('form[name="log"] #password2').val()),
            success: function(data3) {
                $('#outputlog').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>')
                if(data3 == 'notgood'){
                    $('#outputlog').html('<span class="error">שם משתמש או סיסמא לא תקינים</span>')
                }
                if(data3 == 'haser'){
                    $('#outputlog').html('<span class="error">שם משתמש או סיסמא חסרים</span>')
                }
                if(data3 == 'ok'){
                    $('#outputlog').html('<span class="success">אנא המתן... הכניסה בוצעה</span>')
                    location.reload(true)
                }
            }
        });
    }
    function sendcontact(){
        if($.trim($('form[name="contact"] #contname').val()) == ''){
            alert('נא למלא שם');
            return false;
        }
        if($.trim($('form[name="contact"] #contemail').val()) == ''){
            alert('נא למלא כתובת מייל');
            return false;
        }
        if($.trim($('form[name="contact"] #contmelel').val()) == ''){
            alert('נא למלא את שדה ההודעה');
            return false;
        }
        $('#outputcontact').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>');
        melel = $('form[name="contact"] #contmelel').val();
        melel=melel.replace(/\n/g,"<br>");
        $.ajax({
            type: "GET",
            cache: false,
            url: 'http://netivei-haor.net/goajax.asp?action=contact&name='+escape($('form[name="contact"] #contname').val())+'&email='+escape($('form[name="contact"] #contemail').val())+'&pele='+$('form[name="contact"] #contpele').val()+'&text='+escape(melel),
            success: function(data) {
                $('#outputcontact').html('<span class=amten>אנא המתן...<img src="http://rabanim.info/tehilim-app/sites/ajax-loader.gif" ></span>')
                if(data == 'ok'){
                    $('#outputcontact').html('<span class="success">ההודעה נשלחה בהצלחה</span>')
                }
                else{
                    $('#outputcontact').html('<span class="error">זוהתה תקלה, אנא בדוק את הנתונים שהזנת או נסה שנית מאוחד יותר</span>')
                }
            }
        });
    }
});

function golink(link) {
    $("body").css("min-height", "0");
    $("body").css("max-height", "none");
    $("#bodyloader").css("min-height", "0");
    $("#bodyloader").css("max-height", "none");
    $("#bodyloader").fadeTo(200,0.2);
    $("#container").append('<img src="img/ajax.gif" alt="טוען..." id="ajax" />');
    $.get(link,function(response){
        $('#container').html(response);
        $("img#ajax").fadeOut(200).remove();
        $("#bodyloader").fadeTo(200,1);
    }).error(function(){
        location.href = link;
    });
    return false;
}