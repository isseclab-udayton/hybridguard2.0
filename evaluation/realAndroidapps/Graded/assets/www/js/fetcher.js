var loc = null;
function changeMarkingPeriod(a){
    if(a == '(All Runs)'){
        a = 'ALL'
    }
    $.ajax({
        type: "POST",
        url: "https://app.graded.us/login",
        data: {username:credentials.username,password:credentials.password,url:credentials.link,device:deviceInfo,mp:a,only:"assignments",debug:"yes", dbID:credentials.dbID},
        success: function(data){
            if(user == null){
                user = {};
            }
            user.classes = data.classes;
            user.format = data.format;
            user.time = data.time;
            user.processTime = data.processTime;
            user.current_run = data.current_run;
            user.runs = data.runs;
            enableRefresh();
            disabledifferences();
            done.classwork = true;
            window.location = '#/classwork';
        },
        dataType: "JSON"
    });
}
function loader(){

    if(JSON.parse(initUser) == null) {
        console.log('nope notNew');
        $("#items").hide();
        $("#waiting").show();
        newMessage();
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/login",
            data: {username:credentials.username,password:credentials.password,url:credentials.link,device:deviceInfo,mp:"",only:"assignments",debug:"yes",dbID:credentials.dbID},
            success: function(data){
                if(user == null){
                    user = {};
                }
                console.log('Loaded Classwork');
                user.classes = data.classes;
                user.format = data.format;
                user.time = data.time;
                user.processTime = data.processTime;
                user.current_run = data.current_run;
                user.runs = data.runs;
                actions(credentials);
                dueDates();
                enableRefresh();
                $("#items").show();
                $("#waiting").hide();
            },
            error:function(error){
                noInternet(error);
                console.error("=====CLASSWORK ERR=====");
                console.error("Traceback-ID" + error.getResponseHeader('Traceback-ID'));
                console.error("Error" + error.getResponseHeader('Error'));
            },
            dataType: "JSON"
        });
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/login",
            data: {username:credentials.username,password:credentials.password,url:credentials.link,device:deviceInfo,mp:"",only:"grades",debug:"yes", dbID:credentials.dbID},
            success: function(data){
                if(user == null){
                    user = {};
                }
                console.log('Loaded Report');
                user.reportcard = data.reportcard;
                done.grades = true;
                if(location.hash == '#/reportcard'){
                    window.location = '#/feed';
                    window.location = '#/reportcard';
                }
            },
            error:function(error){
                Materialize.toast('Failed to load Grades',1000);
                console.error("=====REPORT CARD ERR=====");
                console.error("Traceback-ID" + error.getResponseHeader('Traceback-ID'));
                console.error("Error" + error.getResponseHeader('Error'));
            },
            dataType: "JSON"
        });
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/login",
            data: {username:credentials.username,password:credentials.password,url:credentials.link,device:deviceInfo,mp:"",only:"schedule",debug:"yes", dbID:credentials.dbID},
            success: function(data){
                if(user == null){
                    user = {};
                }
                //window.FirebasePlugin.subscribe(credentials.link);
                console.log(credentials["profile"]["school"].cleanup())

                window.FirebasePlugin.subscribe(credentials["profile"]["school"].cleanup());
                FirebasePlugin.setUserProperty("school",credentials["profile"]["school"].cleanup());

                var tmp = document.createElement ('a');
	            tmp.href = credentials.link;
                console.log(tmp.hostname.cleanup())
                FirebasePlugin.setUserProperty("district_url", tmp.hostname.cleanup());
                window.FirebasePlugin.subscribe(tmp.hostname.cleanup());

                console.log('Loaded Sched');
                user.schedule = data.schedule;
                done.schedule = true;
                if(location.hash == '#/schedule') {
                    console.log('onSchedPage = True');
                    window.location = '#/feed';
                    window.location = '#/schedule';
                }
            },
            error:function(error){
                Materialize.toast('Failed to load Schedule',1000);
                console.error("=====SCHEDULE ERR=====");
                console.error("Traceback-ID" + error.getResponseHeader('Traceback-ID'));
                console.error("Error" + error.getResponseHeader('Error'));

            },
            dataType: "JSON"
        });
        //http://ads.graded.us/api/advt?format=json
        $.ajax({
            type: "GET",
            url: "http://ads.graded.us/api/advt?format=json",
            success: function(data){
                ads = data["AdvtResponses"];
            },
            error:function(error){
                console.error("=====AD ERR=====");
                console.error(error);

            },
            dataType: "JSON"
        });

    }else{
        console.log('yep isNew');
        user = JSON.parse(initUser);
        actions(credentials);
        done.schedule = true;
        done.grades = true;
        done.classwork = true;
        localStorage.removeItem('fullUser')
    }
    if(allRuns == null && preventInf == false){
        preventInf = true;
        $.ajax({
            type: "POST",
            url: "https://app.graded.us/login",
            data: {username:credentials.username,password:credentials.password,url:credentials.link,device:deviceInfo,mp:"ALLgpa",only:"assignments",debug:"yes",dbID:credentials.dbID},
            success: function(data){
                allRuns = {};
                allRuns = data;
                done.gpa = true;
                if(location.hash == '#/gpa'){
                    console.log('hit');
                    window.location = '#/feed';
                    window.location = '#/gpa';
                }
            },
            error:function(err){
                console.error("=====MP ERR=====");
                console.error("Traceback-ID" + err.getResponseHeader('Traceback-ID'));
                console.error("err" + err.getResponseHeader('Error'));
            },
            dataType: "JSON"
        });
    }
}
function getAd(pageId){
    for(ad in ads){
        if(ads[ad]["PageId"] == pageId){
            return ads[ad];
        }
    }
    return null;
}
function getNewAd(pageId){
    //console.log({Id: ads[ad]["Id"], PageId: pageId, Lat: loc["coords"]["latitude"],Long: loc["coords"]["longitude"], School: credentials.profile.school, DistrictUrl: credentials.link});
    //console.log((loc !== null ? loc["coords"]["latitude"]: null));
    for(ad in ads){
        if(ads[ad]["PageId"] == pageId){
            $.ajax({
                type: "POST",
                url: "http://ads.graded.us/api/advt/track",
                data: {Id: ads[ad]["Id"], PageId: pageId, Lat: (loc !== null ? loc["coords"]["latitude"]: null),Long: (loc !== null ? loc["coords"]["longitude"]: null), School: credentials.profile.school, DistrictUrl: credentials.link},
                success: function(data){
                    //console.log(data["Advt"]);
                    ads[ad] = data["Advt"];
                },
                error: function(error){
                    console.error("=====AD ERR=====");
                    console.error(error);
                },
                dataType: "JSON"
            });
            return true;
        }
    }
}
function adClicked(){
    var $ad = $(".ad");
    var id = parseInt($ad.attr("identity"));
    var pageId = $ad.attr("pageId");
    var url = $ad.attr("url");
    $.ajax({
        type: "POST",
        url: "http://ads.graded.us/api/click/track",
        data: {Id: id, PageId: pageId, Lat: (loc !== null ? loc["coords"]["latitude"]: null),Long: (loc !== null ? loc["coords"]["longitude"]: null), School: credentials.profile.school, DistrictUrl: credentials.link},
        success: function(data){
            //console.log(data["Advt"]);
            console.log("clicked ad");
        },
        error: function(error){
            console.error("=====AD ERR=====");
            console.error(error);
        },
        dataType: "JSON"
    });
    window.open(url,"_system");
}