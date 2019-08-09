var api;
var articles;
var searchResults = new SearchResults();
var currentVendor;
var auth_user;
var map;
var map_visible;
var is_exiting;

var hide_extra_panel_func;

var URL_BASE_HREF = 'http://www.greenproductionguide.com/';

var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        //console.log('Received Event: ' + id);

        if (id == 'deviceready') {
            init();
        }
    },
    close: function() {
        navigator.app.exitApp();
    }
};


function init() {
    api = new GPGAPI();
    api.error_method = onError;

    if (DEBUG == 1) {
        var position = {
          coords: {
//            latitude: 40.754279,
//            longitude: -73.987083,
              latitude: 40.721242,
              longitude: -73.804779,
            accuracy: 10000
          },
          timestamp: (new Date()).valueOf()
        };

        onGeolocationSuccess(position);
    } else {
        navigator.geolocation.getCurrentPosition(onGeolocationSuccess, onGeolocationError, { maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
    }

    //console.log('window: ' + $(window).width() + 'x' + $(window).height() + " classes: " + $('body').attr('class'));

    GpgDAO.getDao();

    insertAdditionalPanels();
    initNavigation();
    initStartupData();

    console.log('size: ' + window.innerWidth + "x" +window.innerHeight);

    if (window.innerWidth <= 600 && window.innerWidth > 550) {
        $("#search-form").css('marginLeft', -(653 - window.innerWidth)/2);
    }

    setTimeout(function() {
        $("#header").css('width', '100%');
    }, 200);

    

    if (DEBUG == 1) {
        FB.init({
          appId      : '314794148641752', // App ID from the App Dashboard
          channelUrl : '//kbhomesocial.com/map/channel.html', // Channel File for x-domain communication
          status     : true, // check the login status upon init?
          cookie     : true, // set sessions cookies to allow your server to access the session?
          xfbml      : true  // parse XFBML tags on this page?
        });
    } else {
        FB.init({ appId: "314794148641752", nativeInterface: CDV.FB, useCachedDialogs: false });
    }
}

function onGeolocationSuccess(resp) {
    //console.log('location: ' + resp.coords.latitude + ' ' + resp.coords.longitude);

    var place = new google.maps.LatLng(resp.coords.latitude, resp.coords.longitude);
    var params = {latLng: place};

    processGeoposition(params);
}

function onGeolocationError(resp) {
    //console.log("location error: ");
    //console.log(resp);
}

function processGeoposition(params) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode(params , function(data, status) {
        //console.log(data[0]);

        current_position = new CurrentPosition();
        current_position.setPosition(data[0].geometry.location.lat(), data[0].geometry.location.lng());
        
        for(var i=0; i < data[0].address_components.length; i++) {
            if (data[0].address_components[i].types[0] == 'administrative_area_level_1') {
                //console.log('administrative_area_level_1: ' + data[0].address_components[i].long_name);
                current_position.state = data[0].address_components[i].long_name;
            }

            if (data[0].address_components[i].types[0] == 'locality') {
                //console.log('locality: ' + data[0].address_components[i].long_name);
                current_position.city = data[0].address_components[i].long_name;
            }
        }

        $("#location").val(current_position.getPositionDesc());
        hideLoader();
    });
}


function onError(resp) {
    console.log('ERROR: ');
    console.log(resp);
}


function detectDevice() {
    var device = 'tablet';

    if ($(window).width() < 550)
        device = 'smartphone';

    if ($(window).width() > 550 && $(window).width() <= 600 )
        device = 'seven-inch';

    return device;
}


function initNavigation() {

    $("#show-prev-searches").bind('click', function(e) {
        e.preventDefault();
        showExtraPanel('previous-searches');
        return false;
    });

    $("#previous-searches-btn").bind('click', function(e) {
        e.preventDefault();
        showExtraPanel('previous-searches');
        return false;
    });

    $("#show-category-list").bind('click', function(e) {
        e.preventDefault();
        showExtraPanel('category-list');
        return false;
    });

    $(".dropdown").bind('click', function(e) {
        e.preventDefault();
        showExtraPanel('category-list');
        return false;
    });
    
    $("#perform-search").bind('click', function(e) {
        e.preventDefault();

        hideExtraPanel('previous-searches');
        hideExtraPanel('category-list');

        showLoader();

        var keyword = $("#keyword").val();
        var categories = [];
        var departments = [];

        var name = '';
        if (keyword != '') {
            name = keyword;
        }
        $("#selected-categories li").each( function() {
            var id = $(this).attr('id');

            if (id.indexOf('cat_') == 0) {
                categories.push(parseInt(id.replace('cat_','')));
            }
            if (id.indexOf('dep_') == 0) {
                departments.push(parseInt(id.replace('dep_','')));
            }

            if (name == '')
                name = $(this).text();
        });

        if (name == '') {
            name = 'All Vendors';
        }

        dao.addSavedSearch(name, keyword, categories.join(','), departments.join(','));
        loadSavedSearches();

        api.searchVendors(current_position.lat, current_position.lng, keyword, categories, departments, function(resp) {
            fillSearchPhrase();

            if (resp.result[5].length == 0) {
                $("#search-results-list").hide();
                $("#search-results .message").show();
            } else {
                $("#search-results-list").show();
                $("#search-results .message").hide();

                var results = $("<ul id='results'></ul>");

                searchResults.clearVendors();

                var source = $("#search-result-template").html();
                var template = Handlebars.compile(source);
                for (var i=0; i < resp.result[5].length; i++) {
                    var data = resp.result[5][i];
                    var html = template(data);

                    searchResults.addVendor(data);

                    results.append(html);
                }

                $("#search-results-list").html(results);

                $('.vendor').bind('click', function() {
                    var id = $(this).attr('id').replace('vendor_','');

                    var vendor = searchResults.getVendorById(id);
                    fillVendorDetails(vendor);

                    iui.showPageById('vendor-details');
                });
            }

            hideLoader();
            iui.showPageById('search-results');

        });

        return false;
    });

    $("#search-again").bind('click', function() {
        iui.goBack();
    });


    $("#show-favorites-btn").bind('click', function() {
        showFavoriteVendors();
    });
    
    $("#show-favorites-btn-smartphone").bind('click', function() {
        showFavoriteVendors();
    });

    $("#show-favorite-vendors").bind('click', function() {
        showFavoriteVendors();
    });

    $("#search").bind('aftertransition', function(e) {
        //console.log('after transition ' + $(this).attr('selected'));

        $("body").scrollTop(0);

        if ($(this).attr('selected') == 'selected') {
            //$(".extra-panel").show();
			//$("html").css('overflow-y','hidden');
        } else {
            //$(".extra-panel").hide();
			//$("html").css('overflow-y','visible');
        }

    });

    $(document).bind('backbuttonclicked', function(e) {
        console.log('back button clicked');

        hideExtraPanel('previous-searches');
        hideExtraPanel('category-list');
    });

    document.addEventListener("backbutton", function() {
        hideExtraPanel('previous-searches');
        hideExtraPanel('category-list');

        var page_id = $("body > div[selected=true]").attr('id');
        
        if(page_id == 'main-screen'){
            if (!is_exiting) {
                is_exiting = true;

                showMessage('press again to exit.');

                setTimeout(function() { is_exiting = false }, 3000);
            } else {
                navigator.app.exitApp();
            }

        } else {
            navigator.app.backHistory();
        }
    }, false);

    $("#clear-location").bind('click', function() {
        $("#location").val('');
        $("#location").focus();
    });

    $("#location").focus(function() {
        $("#location").val('');
    }).bind('blur', function(e) {
            setTimeout(function() {
                $("#clear-location").hide();
                
                var params = {address: $("#location").val()};
                if (params.address.length > 0) {
                    showLoader();
                    processGeoposition(params);
                }

            }, 200);
        });

    $("#location").bind('keydown', function(e) {
        if ($(this).val() != '') {
            $("#clear-location").show();
        }

        if (e.which == 13) { //enter pressed
//            showLoader();
//            var params = {address: $(this).val()};
//            processGeoposition(params);
//
            $("#location").blur();
        }

        setTimeout(function() {
            var location = $("#location").val();
            if (location.length > 3) {
                fillLocationPrediction(location);
            }
        }, 0);
    });


    $("#search .refresh").bind('click', function() {
        showLoader();
        navigator.geolocation.getCurrentPosition(onGeolocationSuccess, onGeolocationError, { maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
    });

    $("#article-font-size").bind('click', function() {
        var current_font_size = parseInt($("#article-content .content").css('fontSize'));
        var device = detectDevice();

        if (device == 'tablet') {

            if (current_font_size == 23) {
                $("#article-content .content").css('fontSize', 17);
            } else if (current_font_size == 17) {
                $("#article-content .content").css('fontSize', 20);
            } else if (current_font_size == 20) {
                $("#article-content .content").css('fontSize', 23);
            }
        } else {
            if (current_font_size == 20) {
                $("#article-content .content").css('fontSize', 14);
            } else if (current_font_size == 14) {
                $("#article-content .content").css('fontSize', 16);
            } else if (current_font_size == 16) {
                $("#article-content .content").css('fontSize', 20);
            }

        }
    } );
    
    $(".extra-panel ul").scroll(function(e) {
        e.stopPropagation();
    });
    
    window.addEventListener("orientationchange", function() {
        insertAdditionalPanels();
        initArticlePage();

        initStaticPages();

    }, false);


    $("#category").bind('keypress', function(e) {
        var value = $(this).val() + String.fromCharCode(e.charCode);
        var hint = $("#category-hint");
        hint.html('');

        if (value.length >= 3) {
            $("#category-list .cell").each(function() {
                var category = $(this).html();

                if (category.toLowerCase().indexOf(value.toLowerCase()) >= 0) {
                    var id = $(this).attr('id');
                    hint.append('<li id="hint_'+id+'">' +category+ '</li>');
                }
            });

            $("#category-hint li").bind('click', function(e) {
                var id = $(this).attr('id').replace('hint_','');

                $("#selected-categories").html('<li id="'+id+'">'+$(this).html()+'</li>');
                $("#category-hint").html('');
                $("#category").val($(this).text());
            });
        }

        if (value.length > 0) {
            $("#clear-category").show();
        } else {
            $("#clear-category").hide();
        }
    });

    $("#clear-category").bind('click', function() {
        $("#category").val('');
        $("#selected-categories").html('');
        $("#category").focus();
    });

    $("#category").focus(function() {
        if ($(this).val().length > 0) {
            $("#clear-category").show();
                         
        }
        disableScrolling();
    }).bind('blur', function(e) {
            setTimeout(function() {$("#clear-category").hide();$("#category-hint").html('');enableScrolling()}, 200);
        });

    $("#keyword").bind('keydown', function() {
        if ($(this).val().length > 0) {
            $("#clear-keyword").show();
        } else {
            $("#clear-keyword").hide();
        }
    });

    $("#clear-keyword").bind('click', function() {
        $("#keyword").val('');
        $("#keyword").focus();
    });

    $("#keyword").focus(function() {
        if ($(this).val().length > 0) {
            $("#clear-keyword").show();
        }
        disableScrolling();
    }).bind('blur', function(e) {
            setTimeout(function() {$("#clear-keyword").hide(); enableScrolling();}, 200);
        });


    $("#show-my-profile").bind('click', function() {
        var dao = GpgDAO.getDao();

        dao.getUser(function(user) {
            if (user) {
                showLoader();
                api.getUser(user.token, function(result) {
                    //console.log(result);

                    if (result.result.token) {
                        $("#first_name").val(result.result.first_name);
                        $("#last_name").val(result.result.last_name);
                        $("#email").val(result.result.email);

                        hideLoader();

                        $("#user-profile .user-registered").show();
                        $("#user-profile .not-registered").hide();

                        iui.showPageById('user-profile');
                    } else {

                        if (user.login_type == 'facebook') {
                            loginWithFacebook(function() {
                                $("#show-my-profile").click();

                            });
                        }

                        if (user.login_type == 'login') {
                            hideLoader();
                            iui.showPageById('login-user');
                        }
                    }

                });
            } else {
                $("#user-profile .user-registered").hide();
                $("#user-profile .not-registered").show();

                iui.showPageById('user-profile');
            }
        });

    });

    $(".register-using-fb").bind('click', function() {
        var next = $(this).attr('next');
        loginWithFacebook( function() {
            $("#" + next).click();
        });
    });


    $("#save-user-data").bind('click', function() {
        saveUserData();
    });

    $("#show-suggest-a-vendor").bind('click', function() {
        dao.getUser(function(user) {
            if (user) {
                $("#suggest-a-vendor .not-registered").hide();
                $("#suggest-a-vendor .user-registered").show();
            } else {
                $("#suggest-a-vendor .not-registered").show();
                $("#suggest-a-vendor .user-registered").hide();
            }

            iui.showPageById('suggest-a-vendor');

        });
    });

    $("#submit-suggest-a-vendor").bind('click', function() {
        suggestVendor();
    });

    initStaticPages();
    
    $("#share-button").bind('click', function() {
        sendShareEmail();
    });

    $("#login-btn").bind('click', function() {
        var username = $("#login-username").val();
        var pass = $("#login-password").val();

        if (username != '' && pass != '') {
            showLoader();
            api.authenticate(username, pass, function(response) {
                hideLoader();

                if (response.result != 0) {
                    auth_user = response.result;
                    dao = GpgDAO.getDao();

                    dao.saveUser(auth_user.first_name, auth_user.last_name, auth_user.email, auth_user.token, 'login', function() {
                        setTimeout(function() {
                            $("#show-my-profile").click();
                        }, 0);
                    });
                } else {
                    showMessage("Could not authenticate user.");
                }

            });
        }
    });


    $("#register-btn").bind('click' , function() {
        var first = $("#register-firstname").val();
        var last = $("#register-lastname").val();
        var email = $("#register-email").val();
        var pass = $("#register-password").val();
        var pass2 = $("#register-confirmpassword").val();
        var username = $("#register-username").val();

        if (first != '' && email != '' && pass != '' && pass == pass2) {
            showLoader();
            api.registerUser(username, first, last, email, pass, pass2, function(response) {
                if (response.result.error) {
                    hideLoader();
                    switch (response.result.name) {
                        case 'AlreadyTaken':
                            showMessage('Username already taken.');
                            break;
                    }
                } else {
                    auth_user = response.result;
                    dao = GpgDAO.getDao();

                    dao.saveUser(auth_user.first_name, auth_user.last_name, auth_user.email, auth_user.token , 'login', function() {
                        setTimeout(function() {
                            hideLoader();
                            $("#show-my-profile").click();
                        }, 0);
                    });
                }
            });
        } else {

            if (first == '') {
                showMessage('First name cannot be empty');
                return;
            }

            if (email == '') {
                showMessage('E-mail address cannot be empty');
                return;
            }

            if (pass == '') {
                showMessage('Password cannot be empty');
                return;
            }

            if (pass != pass2) {
                showMessage('Passwords do not match');
                return;
            }

        }
    });

    $("a[target='_blank']").on('click', function(e) {

        e.preventDefault();e.stopPropagation();
        navigator.app.loadUrl($(this).attr('rel'), {openExternal: true});

        return false;
    });
    
    var device = detectDevice();
    if (device == 'smartphone') {
        $('#main-screen').bind('aftertransition', function(e) {

            if ($("#main-screen").attr('selected') == 'selected') {
                showLogoOnIphone();
            } else {
                hideLogoOnIphone();
            }
        });

        $("#fakeBackButton").bind('click', function(e) {
            e.preventDefault();
            $("#hide-map").click();
            return false;
        });
    }
    
    $("#suggest-a-vendor input").focus(
        function(){
            if (!keyboard_visible) {
                disableScrolling();
                keyboard_visible = true;
            }
        }).blur(function() {
            keyboard_visible = false;
            enableScrolling();

        });


    $("#suggest-a-vendor textarea").focus(
        function() {
            if (!keyboard_visible) {
                disableScrolling();
                keyboard_visible = true;
            }
        }).blur(function() {
            keyboard_visible = false;
            enableScrolling();

        });
    $("#user-profile input").focus(
        function() {
            if (!keyboard_visible) {
                disableScrolling();
                keyboard_visible = true;
            }
        }).blur(function() {
            keyboard_visible = false;
            enableScrolling();

        });

    $("#register-user input").focus(
        function() {
            if (!keyboard_visible) {
                disableScrolling();
                keyboard_visible = true;
            }
        }).blur(function() {
            keyboard_visible = false;
            enableScrolling();

        });

    $("#login-user input").focus(
        function() {
            if (!keyboard_visible) {
                disableScrolling();
                keyboard_visible = true;
            }
        }).blur(function() {
            keyboard_visible = false;
            enableScrolling();

        });

    $("#user-profile").bind('aftertransition', function(e) {
        if ($("#user-profile").attr('selected') == 'selected') {
            $(window).scrollTop(0);
        }
    });

    $("#suggest-a-vendor").bind('aftertransition', function(e) {
        if ($("#suggest-a-vendor").attr('selected') == 'selected') {
            $(window).scrollTop(0);
        }
    });

}

var keyboard_visible = false;

function fillSearchPhrase() {
    var keyword = $("#keyword").val();
    var location = $("#location").val();
    var cat = $("#category").val();

    if (cat != '') {
        var cat_type = 'category ';
        if ($("#selected-categories li").attr('id').indexOf('dep_') == 0) cat_type = 'department ';
    }


    var phrase = 'Vendors ';
    if (keyword != '' && cat != '') {
        phrase += 'matching ' + cat_type + cat + ' or keyword ' + keyword;
    } else if (keyword != '' && cat == '') {
        phrase += 'matching keyword ' + keyword;
    } else if (keyword == '' && cat != '') {
        phrase += 'matching ' + cat_type + cat;
    }

    phrase += ' near ' + location;
    $("#search-phrase").html(phrase);
}


function initStaticPages() {
    setTimeout(function() {
        var desc_height = $(window).height() - $("#header").outerHeight() - $("#footer").outerHeight() - 61;
        $("#vendor-description .scroller").css('height', desc_height);

        var carbon_height = $(window).height() - $("#header").outerHeight() - $("#footer").outerHeight() - 91;

               var device = detectDevice();
               if (device == 'smartphone') {
               $("#about-gpg .scroller").css('height', carbon_height- 10);
               $("#carbon-calculator .scroller").css('height', carbon_height + 15);
               } else {
                $("#about-gpg .scroller").css('height', carbon_height - 2);
                $("#carbon-calculator .scroller").css('height', carbon_height);
               }
        
    }, 500);

}

function insertAdditionalPanels() {
    var device = detectDevice();

    if ($("#previous-searches").length > 0) {
        var prev_searches = $("#previous-searches");
        var addToDom = false;
    } else {
        var prev_searches = $("<div id='previous-searches' class='extra-panel'></div>");
        var addToDom = true;
    }

    if (device == 'tablet') {
        prev_searches.css('height', screen.height - $("#header").height() - $("#footer").height() + 14);
        //prev_searches.css('height', $(window).height());
        var width = Math.floor(screen.width/3);
        prev_searches.css('width', width);
        prev_searches.css('left' , -width);
        prev_searches.css('top', 0);
    } if (device == 'seven-inch') {
        prev_searches.css('height', screen.height - $("#header").height() - $("#footer").height() + 14);
        //prev_searches.css('height', $(window).height());
        var width = 2*Math.floor(screen.width/3);
        prev_searches.css('width', width);
        prev_searches.css('left' , -width);
        prev_searches.css('top', 0);
    } else {
        prev_searches.css('height' , Math.floor($(window).height()*0.7));
        prev_searches.css('width', $(window).width() - 60);
        prev_searches.css('left' , 30);
        prev_searches.css('top', $(window).height() - $("#footer").outerHeight());
    }
    
    if (addToDom)
        $('body').append(prev_searches);

    
    if ($("#category-list").length > 0) {
        var category_list = $("#category-list");
    } else {
       var category_list = $("<div id='category-list' class='extra-panel'></div>"); 
    }
    

    if (device == 'tablet' || device == 'seven-inch') {
        category_list.css('height', screen.height - $("#header").height() - $("#footer").height() + 14);
        //category_list.css('height', $(window).height());
        category_list.css('width', width);
        category_list.css('left' , -width);
        category_list.css('top',0);
    } else {
        category_list.css('height' , Math.floor($(window).height()*0.7));
        category_list.css('width', $(window).width() - 60);
        category_list.css('left' , 30);
        category_list.css('top', $(window).height() - $("#footer").outerHeight());

        category_list.bind('webkitTransitionEnd', function() {
            hide_extra_panel_func();
        });
    }

    if (addToDom)
        $('body').append(category_list);

    //console.log('category list height: ' + $("#category-list").height()  +screen.height);
}


function loadMap(latLng) {

    var myOptions = {
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          draggable: true,
          streetViewControl: false
        };
    map = new google.maps.Map(document.getElementById('google-map'), myOptions);

    map.setCenter(latLng);

    var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        icon: 'theme/img/map_pin.png'
    });
}

function initStartupData() {
    //console.log("initializing startup data");
    api.getCategories(function(result) {
        var categories = $("<div id='categories' class='list'></div>");
        for(var i=0; i< result.result.length; i++) {
            var r = result.result[i];

            var bold = r[1].substring(0, r[1].indexOf('-'));
            var normal = r[1].substring(r[1].indexOf('-')+1);

            var html_elem = '';
            if (bold.length > 0 && bold === bold.toUpperCase()) {
                html_elem = "<span class='bold'>" + bold + "</span>" + normal;
            } else if (bold.length == 0 && normal === normal.toUpperCase()) {
                html_elem = "<span class='bold'>" + normal + "</span>";
            }

            var elem = $("<div class='row'><div class='cell' id='cat_" + r[0] + "' class='" + (i%2 ==0 ? 'odd' : 'even') + "'>" + html_elem + "</div></div>");
            categories.append(elem);
        }

        $("#category-list").append(categories);


        api.getDepartments(function(result) {
            var departments = $("<div id='departments' class='list'></div>");
            for(var i=0; i< result.result.length; i++) {
                var r = result.result[i];

                var bold = r[1].substring(0, r[1].indexOf('-'));
                var normal = r[1].substring(r[1].indexOf('-')+1);

                var html_elem = '';
                if (bold.length > 0 && bold === bold.toUpperCase()) {
                    html_elem = "<span class='bold'>" + bold + "</span>" + normal;
                } else if (bold.length == 0 && normal === normal.toUpperCase()) {
                    html_elem = "<span class='bold'>" + normal + "</span>";
                } else {
                    html_elem = r[1];
                }


                var elem = $("<div class='row'><div class='cell' id='dep_" + r[0] + "' class='" + (i%2 ==0 ? 'odd' : 'even') + "'>" + html_elem+ "</div></div>");
                departments.append(elem);
            }

            $("#category-list").append(departments);

            bindCategoryEvent();
        });
    });


    api.getArticles(function(resp) {
        articles = [];
        for (var i=0; i < resp.result.length; i++) {
            var r = resp.result[i];
            var article = new Article(r.id, r.slug, r.title, r.content);
            articles.push(article);
        }

        initArticleList();
    });

    loadSavedSearches();
}

function showFavoriteVendors() {
    var dao = GpgDAO.getDao();
    
    dao.getUser(function(user) {
        if (user) {
            showLoader();
            synchronizeFavorites(user, function() {
                hideLoader();
                fillFavorites();
            });
        } else {
            fillFavorites();
        }
    });
}


function fillFavorites() {
    dao.listFavorites(function(resultSet) {
        if (resultSet.length == 0) {
            $("#fav-vendors-list").hide();
            $("#fav-vendors .message").show();
        } else {
            $("#fav-vendors-list").show();
            $("#fav-vendors .message").hide();

            var results = $("<ul id='favorites'></ul>");

            var source = $("#search-result-template").html();
            var template = Handlebars.compile(source);
            for(var i=0; i < resultSet.length; i++) {
                var data = resultSet.item(i);
                var unescaped_data = new Array();
                for (var j=0; j < Object.keys(data).length; j++) {
                    var key = Object.keys(data)[j];

                    var value = unescape(data[Object.keys(data)[j]]);
                    if (value == 'null') value = null;
                        unescaped_data[key] = value;
                }

                var html = template(unescaped_data);

                results.append(html);
            }

            $("#fav-vendors-list").html(results);

            $("#favorites li").bind('click', function() {
                var id = $(this).attr('id').replace('vendor_','');

                var dao = GpgDAO.getDao();
                dao.getFavoriteById(id, function(resp) {
                    var data = resp.item(0);
                    var vendor = new Object();
                    for (var j=0; j < Object.keys(data).length; j++) {
                    var key = Object.keys(data)[j];
                    var value = unescape(data[Object.keys(data)[j]]);
                    if (value == 'null') value = null;
                        vendor[key] = value;
                    }

                    fillVendorDetails(vendor);
                    iui.showPageById('vendor-details');
                });

            });
        }

//        console.log('adding buttons');
//
//        var buttons = $("#fav-vendors .buttons").clone();
//        buttons.css('top', $(window).height() - 35 - 21);
//        buttons.attr('id', 'favorite-share-buttons');
//        buttons.find('.redButton .icon').addClass('up');
//        $('body').append(buttons);
//        buttons.fadeIn();
//
//        buttons.find('.redButton').bind('click', function() {
//            var icon = $(this).find('.icon');
//            if (icon.hasClass('up')) {
//                var transf = 'translateY(' + (-buttons.height() + 21) + 'px)';
//                buttons.css('webkitTransform' , transf);
//
//                icon.removeClass('up');
//            } else {
//                var transf = 'translateY(0px)';
//                buttons.css('webkitTransform' , transf);
//
//                icon.addClass('up');
//            }
//        });
                      
//        buttons.find('#share-by-email').bind('click', function() {
//            sendShareEmail();
//        });


        iui.showPageById('fav-vendors');

//        $("#fav-vendors").bind('beforetransition', function() {
//
//            if ($("#fav-vendors").attr('selected')) {
//                console.log($("#fav-vendors").attr('selected'));
//                $("#favorite-share-buttons").remove();
//
//                //$("#fav-vendors").unbind('beforetransition');
//            }
//        });
    });
}


function loadSavedSearches() {
    var dao = GpgDAO.getDao();
    dao.getSavedSearches(function(resp) {
        var searches = $("<div id='searches' class='list'></ul>");
        for(var i=0; i < resp.length; i++) {
            var elem = $("<div class='row'><div class='cell' id='search_" + resp[i].id +  "' class='" + (i%2 ==0 ? 'odd' : 'even') + "'>" + resp[i].name + '</div></div>');
            searches.append(elem);
        }

        $("#previous-searches").html(searches);

        $("#searches .cell").bind('click', function(e) {
            var id = $(this).attr('id').replace("search_",'');

            dao.getSavedSearchById(id, function(search) {
                $("#selected-categories").html('');

                if (search.categories != '') {
                    var categories = search.categories.split(',');
                    for (var i=0; i < categories.length; i++) {
                        $("#cat_" + categories[i]).click();
                    }
                }

                if (search.departments != '') {
                    var departments = search.departments.split(',');
                    for (var i=0; i < departments.length; i++) {
                        $("#dep_" + departments[i]).click();
                    }
                }

                $("#keyword").val(search.keyword);
            });
        });
    });
}


function bindCategoryEvent() {
    if ($("#category-list .list").length == 2) {
        $("#category-list .cell").bind('click', function() {

            var category = $(this).text();
            $("#selected-categories").html('<li id="' + $(this).attr('id') + '">' + category + '</li>');
            $("#category").val(category);

//            chosen.find(".remove").click(function() {
//                $(this).parent().fadeOut(600, function() {$(this).remove();});
//            });

            hideExtraPanel('category-list');
            $("#keyword").val('');
            $("#perform-search").trigger('click');
        });
    }
}

function initArticlePage() {
    
    setTimeout(function() {
        var art_height = $(window).height() - $("#header").outerHeight() - $("#best-practises h2").outerHeight() - $("#article-header").outerHeight() - $("#footer").outerHeight() - 30;
        $("#article-content .scroller").css('height', art_height);
    }, 500);
    
}

function initArticleList() {
    initArticlePage();

    var list = $("#article-select");
    for (var i=0; i < articles.length; i++) {
        list.append(articles[i].getOptionElement());
    }

    list.bind('change', function() {
        var id = $(this).attr('value');

        for (var i=0; i< articles.length; i++) {
            if (articles[i].id == id) {
                $("#article-content .content").html('<h3>'+articles[i].title+'</h3>' + articles[i].content);
                $("#article-content .scroller").scrollTop(0);
                $("#article-content .content a").each(function() {
                    $(this).attr('rel', $(this).attr('href'));
                    $(this).attr('href','');

                    $(this).bind('click', function(e){
                        e.preventDefault();

                        navigator.app.loadUrl($(this).attr('rel'), {openExternal: true});
                    });

//                    if ($(this).attr('href').indexOf('http') == 0) {
//                        $(this).attr('target', '_blank');
//                    } else {
//                        $(this).attr('href', URL_BASE_HREF + $(this).attr('href'));
//                    }

                });

                if (i == 0) {
                    var more_articles = $("<div class='more-articles'></div>");
                    for (var j=1; j < articles.length; j++) {
                        var art_title = $("<a href='javascript:void(0)' class='whiteButton' article_id='"+articles[j].id+"'>"+ articles[j].title+"</a>");
                        more_articles.append(art_title);

                        $("#article-content .content").append(more_articles);

                        $("#article-content .more-articles a").bind('click', function() {
                            $("#article-select").val($(this).attr('article_id'));
                            $("#article-select").change();
                        });
                    }
                }

                break;
            }
        }
    });
    list.change();
}

function fillVendorDetails (v) {
    currentVendor = v;
    var source = $("#vendor-details-template").html();
    var template = Handlebars.compile(source);
    
    $(window).scrollTop(0);

    var html = template(v);
    $("#vendor-details").html(html);
    $("#vendor-details").attr('title', v.company_title);

    var address = v.address + ', ' + v.city + ', ' + v.state;
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({address: address},  function(data, status) {
        $("#google-map").attr('lat',data[0].geometry.location.lat());
        $("#google-map").attr('lng',data[0].geometry.location.lng());

        var device = detectDevice();
        if (device == 'tablet') {
            loadMap(data[0].geometry.location);
        }
    } );



    $("#add-to-fav").bind('click', function() {
        var dao = GpgDAO.getDao();
        var vendor = currentVendor;

        dao.isFavorite(vendor.id, function() {
            dao.removeFavorite(vendor.id);
            $("#add-to-fav").html('<span class="icon"></span>Add to Favorites');
        }, function() {
            dao.addFavorite(vendor);
            $("#add-to-fav").html('<span class="icon-remove"></span>Remove');
        });
    });

    $("#call-vendor").bind('click', function() {
        window.location.href="tel:" + v.phone_number.replace('(','').replace(')','').replace('-','').replace(' ','');
    });
    
    $("#email-vendor").bind('click', function() {
        window.plugins.emailComposer.showEmailComposer("", "", v.email,"","",true);
    });

    var dao = GpgDAO.getDao();
    dao.isFavorite(v.id, function() {
        $("#add-to-fav").html('<span class="icon-remove"></span>Remove');
    }, function() {});

    $("#get-directions").bind('click', function() {
        var lat = $("#google-map").attr('lat');
        var lng = $("#google-map").attr('lng');

        getDirections(lat, lng);
    });

    $("#add-to-contacts").bind('click' , function() {
        var vendor = currentVendor;

        var name = new ContactName();
        name.familyName = vendor.company_title;

        var contact = {
            displayName: vendor.company_title,
            nickname: vendor.company_title,
            name: name
        };
        
        if (vendor.web_page) {
            var url = new ContactField('profile',vendor.web_page, true);
            contact.urls = [url];
        }

        if (vendor.phone_number) {
            contact.phoneNumbers = [];
            var ph = vendor.phone_number.replace('(','').replace(')','').replace('-','').replace(' ','');
            contact.phoneNumbers[0] = new ContactField('work',ph, true);
        }

        var address = new ContactAddress();
        address.pref = true;
        address.streetAddress = vendor.address;
        address.region = vendor.state;
        address.country = vendor.country;
        address.locality = vendor.city;
        contact.addresses = [];
        contact.addresses[0] = address;

        //console.log(contact);

        var c = navigator.contacts.create(contact);
        c.save();

        showMessage(vendor.company_title + ' was added to your contact list');
    });

    var device = detectDevice();
    if (device == 'smartphone' || device == 'seven-inch') {
        $("#vendor-details .redButton").hide();

//        var buttons = $("#vendor-details .buttons").detach();
//        $("body").append(buttons);
//
//        buttons.css('top', $(window).height() - 35 - 21);
//        buttons.css('position', 'fixed');
//        buttons.find('.redButton .icon').addClass('up');
//
//        buttons.find('.redButton').bind('click', function() {
//            buttons.css('position', 'absolute');
//            var icon = $(this).find('.icon');
//            if (icon.hasClass('up')) {
//                var transf = 'translateY(' + (-buttons.height() + 21) + 'px)';
//                buttons.css('webkitTransform' , transf);
//
//                icon.removeClass('up');
//            } else {
//                var transf = 'translateY(0px)';
//                buttons.css('webkitTransform' , transf);
//
//                icon.addClass('up');
//            }
//        });
//
//        $("#vendor-details").bind('aftertransition', function(e) {
//            buttons.show();
//
//            $("#vendor-details").unbind('aftertransition');
//            $("#vendor-details").bind('beforetransition', function(e) {
//                $("body > .buttons").remove();
//
//                $("#vendor-details").unbind('beforetransition');
//            });
//        });



        $("#show-map").bind('click', function() {
            //buttons.find('.redButton').click();

            var map = $("#vendor-details .right");
            if (device == 'smartphone')
                map.css('top', $(window).scrollTop() - 83);
            else
                map.css('top', $(window).scrollTop() - 26);
            var h = $(window).height() - $("#header").height() - $("#footer").height() + 16;
            map.css('height', h);

            $("#google-map").css('height', h - 60);

            map.fadeIn(600, function() {
                //buttons.hide();

                var loc = new google.maps.LatLng($("#google-map").attr('lat'),$("#google-map").attr('lng') );
                loadMap(loc);

                map_visible = true;
                $("#backButton").hide();
                $("#fakeBackButton").show();
            });
        });

        $("#hide-map").bind('click', function() {
            //buttons.show();
            var map = $("#vendor-details .right").fadeOut();
            map_visible = false;
            $("#backButton").show();
                $("#fakeBackButton").hide();
        });

        setTimeout(function() {
            var detail_height = $(window).height() - $("#header").outerHeight() - $("#footer").outerHeight() - $("#vendor-details .title").outerHeight() - 58 - 35;

            if (device == 'seven-inch') detail_height -= $("#vendor-details .buttons").outerHeight() + 35;
            $("#vendor-details .info").css('min-height' , detail_height);
        }, 200);

    } else {
        $("#vendor-description h2").html(v.company_title);

        if (v.categories) {
            var categories = $("<div id='vendor-categories'><h3>Categories</h3></div>");

            var cat_array = v.categories;
            if( typeof v.categories === 'string' ) {
                cat_array = v.categories.split(';');
            }

            for (var i=0; i < cat_array.length; i++) {
                var cat = $("<span>" + cat_array[i] + "</span>");
                categories.append(cat);
            }


            $("#vendor-description .categories").html(categories);
        } else {
            $("#vendor-description .categories").html('');
        }

        if (v.departments) {
            var departments = $("<div id='vendor-departments'><h3>Departments</h3></div>");
            var dep_array = v.departments;
            if( typeof v.departments === 'string' ) {
                dep_array = v.departments.split(';');
            }

            for (var i=0; i < dep_array.length; i++) {
                var dep = $("<span>" + dep_array[i] + "</span>");
                departments.append(dep);
            }


            $("#vendor-description .departments").html(departments);
        } else {
            $("#vendor-description .departments").html('');
        }


        $("#vendor-description #description").html(v.description);
    }
}


function showExtraPanel(name) {
    var device = detectDevice();

    disableScrolling(name);
    if (device == 'tablet' || device == 'seven-inch') {
        var elem = $("#"  + name);
        elem.css('top', $(window).scrollTop() + $("#header").height() - 25);
        elem.css('display', 'block');
        var toStart = 'translateX(' + elem.width() + 'px)';
        elem.css('webkitTransform' , toStart);

        $("#search").css('webkitTransform', toStart);
        $("#header").css('webkitTransform', toStart);
        $("#footer").css('webkitTransform', toStart);
    } else {
        var elem = $("#"  + name);
        var toStart = 'translateY(' + (-elem.height()) + 'px)';

        elem.css('display', 'block');
        elem.css('webkitTransform' , toStart);

        hide_extra_panel_func = function() {};
    }

}

function hideExtraPanel(name) {
    var device = detectDevice();
    
    enableScrolling();

    if (device == 'tablet' || device == 'seven-inch') {
        var elem = $("#"  + name);
        var toStart = 'translateX(0px)';
        elem.css('webkitTransform' , toStart);

        $("#search").css('webkitTransform', toStart);
        $("#header").css('webkitTransform', toStart);
        $("#footer").css('webkitTransform', toStart);
    } else {
        var elem = $("#"  + name);
        var toStart = 'translateX(0px)';
        elem.css('webkitTransform' , toStart);

        hide_extra_panel_func = function() {
            elem.hide();
        }
    }
}


function disableScrolling(panel) {
    $("#search").bind("touchmove", function(e) {
        //blocks horizontal scrolling on MobileSafari. There is no problem on PC
        e.preventDefault();
                      
        var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];        
        ////console.log('touch: ' + touch.pageY+' '+touch.pageX);
    });
    
    $("#suggest-a-vendor").bind('touchmove', function(e) {
        e.preventDefault();
    });
    $("#user-profile").bind('touchmove', function(e) {
        e.preventDefault();
    });
    $("#register-user").bind('touchmove', function(e) {
        e.preventDefault();
    });
    $("#login-user").bind('touchmove', function(e) {
        e.preventDefault();
    });

    $("#suggest-a-vendor").bind('click', function(e) {});
    $("#user-profile").bind('click', function(e) {});
    $("#register-user").bind('click', function(e) {});
    $("#login-user").bind('click', function(e) {});
    
    if (panel != undefined) {
        $("#search").bind("touchstart", function(e) {
            specialScroll.setStart(e);
        });
    
        $("#search").bind("touchend", function(e) {
            specialScroll.setStop(e);
                      
            if (specialScroll.isScrollEvent()) {
                hideExtraPanel(panel);
            }
                      
        //console.log(specialScroll.toString());
        });
    } else {
        $("#footer").hide();
    }
}

function enableScrolling() {
    $("#search").unbind("touchmove");
    $("#search").unbind("touchstart");
    $("#search").unbind("touchend");
    
    $("#suggest-a-vendor").unbind("touchmove");
    $("#user-profile").unbind("touchmove");
    $("#register-user").unbind("touchmove");
    $("#login-user").unbind("touchmove");

    $("#suggest-a-vendor").unbind("click");
    $("#user-profile").unbind("click");
    $("#register-user").unbind("click");
    $("#login-user").unbind("click");
    
    $("#footer").show();
}

function showLoader() {
    if ($("#loader").length == 0) {
        var loader = $('<div id="loader"><div id="floatingBarsG"><div class="blockG" id="rotateG_01"></div><div class="blockG" id="rotateG_02"></div><div class="blockG" id="rotateG_03"></div><div class="blockG" id="rotateG_04"></div><div class="blockG" id="rotateG_05"></div><div class="blockG" id="rotateG_06"></div><div class="blockG" id="rotateG_07"></div><div class="blockG" id="rotateG_08"></div></div></div>');
        var left = Math.floor(($(window).width() - 140)/2);
        var top = Math.floor(($(window).height() - 140)/2);
        loader.css('left', left);
        loader.css('top', top);
        $('body').append(loader);

        setTimeout(function() {
            if ($("#loader").length != 0) {
                showMessage('An error occurred, please try again later');
                hideLoader();
            }
        }, 10000);
    }
}

function hideLoader() {
    $("#loader").fadeOut(200, function() {
        $("#loader").remove();
    });
}


function showLogoOnIphone() {
    $("#gpg-logo").show();
    $("#fakeBackButton").hide();
    $("#backButton").hide();
}

function hideLogoOnIphone() {
    $("#gpg-logo").hide();
    $("#fakeBackButton").hide();
}

function loginWithFacebook(callback) {
    FB.getLoginStatus(function(response) {
        //console.log(response);

        if (response.status == 'connected') {
            fbLoginSuccess(response.authResponse.accessToken, callback);
        } else {
            FB.login(function(response) {
                if (response.status == 'connected') {
                    fbLoginSuccess(response.authResponse.accessToken, callback);
                    callback();
                }
            }, {scope: 'email'});
        }
    });
}


function fbLoginSuccess(accessToken, callback) {
    api.connect(accessToken, function(response) {
        //console.log('CONNECT RESPONSE');
        //console.log(response);

        auth_user = response.result;
        dao = GpgDAO.getDao();

        dao.saveUser(auth_user.first_name, auth_user.last_name, auth_user.email, auth_user.token, 'facebook', callback);
    });
}

function getDirections(lat, lng) {
    var url = getMapsUrl() + 'saddr=' + current_position.lat + ',' + current_position.lng +
        "&daddr=" + lat + "," + lng;

    navigator.app.loadUrl(url, {openExternal: true});
}
function getMapsUrl() {
    return 'http://maps.google.com/maps?';
}


function synchronizeFavorites(user, callback) {

        var dao = GpgDAO.getDao();
        dao.listFavorites(function(resultSet) {
            var favorites = new Array();
            for(var i=0; i < resultSet.length; i++) {
                var data = resultSet.item(i);
                favorites.push(data.id);
            }

            api.synchronizeFavorites(user.token, favorites, function(resp) {

                for (var i=0; i < resp.result.length; i++) {
                    var f = resp.result[i];

                    dao.removeFavorite(f.id);
                    dao.addFavorite(f);
                }
                                     
                callback();

            });
        });

}


function saveUserData() {
    dao.getUser(function(user) {
        if (user) {
            showLoader();

            var first_name = $("#first_name").val();
            var last_name = $("#last_name").val();
            var email = $("#email").val();

            dao.saveUser(first_name, last_name, email, user.token, user.login_type, function() {});

            api.saveUser(user.token, first_name, last_name, email, function(resp) {
                hideLoader();

                if (resp.result == 'ok') {
                    showMessage('Your data has been saved');
                }

            });

        } else {
            showMessage('You are not connected to Green Production Guide site');
        }
    });
}


function suggestVendor() {
    dao.getUser(function(user) {
        var company_name = $("#company-name").val();
        var contact_first_name = $("#contact-first-name").val();
        var contact_last_name = $("#contact-last-name").val();
        var contact_email = $("#contact-email").val();
        var message = $("#company-message").val();


        if (company_name == '') {
            showMessage('Company name cannot be empty');
            return;
        }

        if (contact_first_name == '') {
            showMessage('Contact First Name cannot be empty');
            return;
        }

        if (!validateEmail(contact_email)) {
            showMessage('Contact E-mail seems to be invalid');
            return;
        }

        if (user) {
            showLoader();
            api.suggestVendor(user.token, company_name, contact_first_name, contact_last_name, contact_email, message, function(resp) {
                hideLoader();
                if (resp.result.success == 1) {
                    showMessageDialog("Thank you for referring " + company_name + ".<br/>We've sent them an email inviting them to join The Green Production Guide. Close this window to refer another vendor.");

                    $("#company-name").val('');
                    $("#contact-first-name").val('');
                    $("#contact-last-name").val('');
                    $("#contact-email").val('');
                    $("#company-message").val('');
                } else {
                    var keys = Object.keys(resp.result.errors);
                    showMessage(resp.result.errors[keys[0]][0]);
                }
            });
        } else {
            var user_firstname = $("#user-firstname").val();
            var user_lastname = $("#user-lastname").val();
            var user_email = $("#user-email").val();

            if (!validateEmail(user_email)) {
                showMessage('Your E-mail seems to be invalid');
                return;
            }

            showLoader();
            api.suggestVendorWithoutAccount(user_firstname, user_lastname, user_email, company_name, contact_first_name, contact_last_name, contact_email, message, function(resp) {
                hideLoader();
                if (resp.result.success == 1) {
                    showMessageDialog("Thank you for referring " + company_name + ".<br/>We've sent them an email inviting them to join The Green Production Guide. Close this window to refer another vendor.");

                    $("#company-name").val('');
                    $("#contact-first-name").val('');
                    $("#contact-last-name").val('');
                    $("#contact-email").val('');
                    $("#company-message").val('');
                } else {
                    var keys = Object.keys(resp.result.errors);
                    showMessage(resp.result.errors[keys[0]][0]);
                }
            });
        }
    });
}


function fillLocationPrediction(location) {
    var geocoder = new google.maps.Geocoder();
    var pred = $("#location-prediction");
    pred.html('');
    params = {address: location};
    geocoder.geocode(params , function(data, status) {

        var elements = 0;
        for (var j=0; j < data.length; j++) {
            for(var i=0; i < data[j].address_components.length; i++) {
                if (data[j].address_components[i].types[0] == 'locality' ||
                    data[j].address_components[i].types[0] == "administrative_area_level_1") {

                    var name = data[j].address_components[i].long_name;

                    var should_insert = true;
                    $("#location-prediction li").each(function() {
                        if ($(this).html() == name) {
                            should_insert = false;
                        }
                    });


                    if (should_insert && elements < 4) {
                        var elem = $("<li>" + name + "</li>");
                        pred.append(elem);

                        elements++;
                    }
                }
            }
        }

        $("#location-prediction li").bind('click', function() {
            $("#location").val($(this).html());
            $("#location").blur();

            $("#location-prediction").html('');
        });
    });

}

function sendShareEmail() {
    
    dao.listFavorites(function(resultSet) {
        var subject = 'My Green Vendors List';
        var body = "Here is my list of Green Vendors:<br/><br/>";

        for (var i = 0; i < resultSet.length; i++) {
            var data = resultSet.item(i);
            body += "<a href='http://www.greenproductionguide.com/vendors/" + data.slug + "'>" + unescape(data.company_title) + "</a><br/>";
        }

        window.plugins.emailComposer.showEmailComposer(subject, body, "", "", "", true);

    });


}


function showMessage(msg) {
    var width = $(window).width() - 50;
    var left = 25;
    if ($("body").hasClass('landscape')) {
        width = $(window).height() - 50;
        left = ($(window).width() - $(window).height() + 50)/2;
    }

    $("<div id='message'><h1>" + msg + "</h1></div>").css({ "display": "block", "top": $(window).height() - 250 ,"width": width, "left": left})
      .appendTo( $('body') )
      .delay( 1500 )
      .fadeOut( 400, function(){
        $(this).remove();
    });
}


function showMessageDialog(msg) {
    var width = $(window).width() - 50;
    var left = 25;
    if ($("body").hasClass('landscape')) {
        width = $(window).height() - 50;
        left = ($(window).width() - $(window).height() + 50)/2;
    }

    var msg = $("<div id='message-dialog'><p>" + msg + "</p><a href='javascript:void(0)' id='message-dialog-close' class='whiteButton'>Close</a></div>");
    msg.css('top', $(window).height() - 350);
    msg.css('width', width);
    msg.css('left', left - 4);

    $('body').append(msg);
    msg.find('#message-dialog-close').bind('click', function() {
        $("#message-dialog").remove();
    });
}


function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function calculateDistance(lat1, lon1, lat2, lon2) {
    var latLngA = new google.maps.LatLng(lat1, lon1);
    var latLngB = new google.maps.LatLng(lat2, lon2);
    
    return google.maps.geometry.spherical.computeDistanceBetween (latLngA, latLngB);
//    var R = 6371; // km
//    var dLat = (lat2-lat1).toRad();
//    var dLon = (lon2-lon1).toRad();
//    var lat1 = lat1.toRad();
//    var lat2 = lat2.toRad();
//
//
//    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
//            Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
//    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
//    var d = R * c;
//
//    return d;
}