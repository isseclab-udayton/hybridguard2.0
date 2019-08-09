$(function () {

    document.addEventListener('deviceready', function() {

        $.ajaxSetup({timeout: 10000, crossDomain:true, cache: false});
        $.support.cors = true;
                        
        var proxiedSync = Backbone.sync;
        Backbone.sync = function(method, model, options) {
            options || (options = {});
            if (!options.crossDomain) {
              options.crossDomain = true;
            }
            if (!options.xhrFields) {
              options.xhrFields = {withCredentials:true};
            }
            return proxiedSync(method, model, options);
        };
        
        $("#loading").spin({}).hide();

        $('#login-link').click(function(event) {
            $('#form-signin').submit(); 

            event.preventDefault();
            return false;
        });

        $('#form-signin').ajaxForm({ 
            dataType:  'json', 
            beforeSubmit : function() {
                $('#loading').fadeIn();

            },
            success: function(response) {
                console.log(response);

                                   
                localStorage.setItem('username', $("#username").val());
                localStorage.setItem('password', $("#password").val());

                                   
                if (response.redirect_url) {
                    window.location.href = response.redirect_url;
                } else if (response.error) {
                    $('#loading').fadeOut();
                    console.log(response.error);            

                    $('#error-message').show();
                    $('#error-message').html(response.error);

                    $("html, body").animate({ scrollTop: 0 }, "slow");
                } else {
                    $('#loading').fadeOut();
                }
            },
            error: function(response) {
                $('#loading').fadeOut();


            }
        });
         
                              
        $("#username").val(localStorage.getItem('username'));
        $("#password").val(localStorage.getItem('password'));

                              
    //    $("#username").val("hadar+1a@mybuilding.org");
    //    $("#password").val("123456!");
                              
        console.log("LOADED");

        if ($("#username").val().length>0 && $("#password").val().length>0) {
            $('#form-signin').submit();
        }
                              
    }, false);


});