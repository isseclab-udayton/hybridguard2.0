var graded = angular.module('graded', ['ngRoute', 'ngIOS9UIWebViewPatch', 'pasvaz.bindonce', 'ngSanitize'],function($rootScopeProvider) {
    $rootScopeProvider.digestTtl(2);
});
var user;
var isDank = false;
var date;
var allRuns;
var time = moment().format('h:mm:ss a');
var load = true;
var tmrwDate;
var gradeDiff = {};
var classDiff = [];
var lastChecked;
var className = '';
var globalScope;
var dueToday = [];
var version = localStorage.getItem('version');
if(version != '1.0'){
    logOut();
}
var retrievedObject = localStorage.getItem('1');
if(JSON.parse(retrievedObject) == null){
    window.location = 'signin.html';
}
var credentials = JSON.parse(retrievedObject);

profile(credentials.profile.name,credentials.profile.school);
var initUser = localStorage.getItem('fullUser');
var dueTomorow = [];
var hideDisclaimer = localStorage.getItem('hideDisclaimer');
var classes =[];
var onPage = '';
var justRefresh = false;
var isNew = false;
var relocate = '#/feed';
graded.config(function($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl : 'pages/load.html',
            controller: 'loadContent'
        })
        // route for the home page
        .when('/feed', {
            templateUrl : 'pages/feed.html',
            controller: 'mainController'
        })
        .when('/class/:class', {
            templateUrl : 'pages/classes.html',
            controller: 'classController'
        })
        .when('/changemp/:mp', {
            templateUrl : 'pages/load.html',
            controller: 'mp'
        })
        .when('/classwork', {
            templateUrl : 'pages/classwork.html',
            controller: 'classworkController'
        })
        .when('/settings', {
            templateUrl : 'pages/settings.html',
            controller: 'settingsController'
        })
        .when('/about', {
            templateUrl : 'pages/about.html',
            controller:'about'
        })
        .when('/reportcard', {
            templateUrl : 'pages/reportcard.html',
            controller: 'reportcard'
        })
        .when('/profile', {
            templateUrl : 'pages/profile.html',
            controller:'profile'
        })
        .when('/schedule',{
            templateUrl:'pages/schedule.html',
            controller:'schedule'
        })
        .when('/gpa',{
            templateUrl:'pages/gpa.html',
            controller:'gpa'
        })

});
graded.controller('mainController', function($scope,$location,$sce) {
    switchToMenuBtn();
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    $scope.hNew = '';
    if(newVer != undefined){
        $scope.plat = platform;
        if(platform == 'ios') {
            $scope.versionNum = newVer['version'];
            $scope.hideAndroid = 'hide';
        }else{
            $scope.versionNum = newVer['Android_version'];
            $scope.hideIos = 'hide';
        }
        $scope.changeLog = newVer['changelog'];
    }else{
        $scope.hNew = 'hide';
    }
    if(manifest != null){
        appendMsg(manifest["msg"]);
    }
    if(isNew == true){
        $scope.firstTime = '';
    }else{
        $scope.firstTime = 'none';
    }
    if(dueToday.length == 0 && dueTomorow.length == 0){
        $scope.hideDues = 'none';
        $scope.duesMessage = 'Nothing due';
        $scope.duesSubMessage = 'Always check to be sure!';
    }else{
        $scope.hideDues = '';
        $scope.duesMessage = 'Due Dates';
        $scope.duesSubMessage = '';
    }
    if(classDiff.length == 0){
        $scope.hideNew = 'none';
        $scope.newMessage = 'No new items added';
    }else{
        $scope.hideNew = '';
        $scope.newMessage = 'New items added';
    }
    // create a message to display in our view
    onPage='feed';
    changeHeader('Whats New','feed');
    console.log(classDiff);
    $scope.ad = getAd("feed");
    getNewAd("feed");
    
    if($scope.ad !== null){
        $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
    }
    $scope.duetoday = dueToday;
    $scope.duetmrw = dueTomorow;
    $scope.newItems = classDiff;
    $scope.names = classes;
});
graded.controller('about',function($scope,$location,$sce){
    switchToMenuBtn();
    changeHeader('About','about');
    if(isDank == true){
        changeLogoToDank();
    }
});
graded.controller('mp',['$scope','$routeParams','$sce', function($scope, $routeParams,$sce){
    switchToMenuBtn();
    var a = $routeParams.mp;
    changeHeader('','');
    time = moment().format('h:mm:ss a');
    changeMarkingPeriod(a)
}]);
graded.controller('gpa',function($scope,$location,$sce){
    switchToMenuBtn();
    
    changeHeader('Estimated GPA','gpa');
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    $scope.ad = getAd("gpa");
    getNewAd("gpa");
    if($scope.ad !== null){
        $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
    }
    if(hideDisclaimer != null){
        $scope.hideDisclaimer = "hide";
    }else{
        $scope.hideDisclaimer = "";
    }
    if(done.gpa){
        $scope.hideGPA = '';
        $scope.hideLd = 'hide';
        $scope.gpa = allRuns;
        if(allRuns["transcriptFound"] == ""){
            $scope.show = "hide";
            $scope.message = "Your official GPA has been found on your HAC. This means that the GPA shown above is averaged between your Estimated GPA this year and your official overall GPA. Please check the GPA Scales web page for more information."
        }else{
            $scope.show = "";
            $scope.message = "Please note that the Estimated GPA doesn't count for your previous semesters GPA. It only counts for finished or currently occurring marking periods. Please check the GPA Scales web page for more information."
        }
    }else{
        $scope.hideGPA = 'hide';
        $scope.hideLd = '';
        $scope.gpa = {};
    }

});
graded.controller('settings',function($scope,$location){
    switchToMenuBtn();
    changeHeader('Settings','settings');
    if(localStorage.getItem('showMemeOption') == 'true'){
        $scope.hideMemes = '';
    }else{
        $scope.hideMemes = 'hide';
    }
    if(hideDisclaimer != null){
        checkBox("disclaimerSetting");
    }
    if(isDank == true){
        checkBox("myCheck");
    }
    console.log(errors);
    $scope.errs = errors;
    cordova.plugins.notification.local.getScheduled(function (notifications) {
        console.log(notifications);
        $scope.scheduled = notifications;
    });
});
graded.controller('schedule',function($scope,$location,$sce){
    switchToMenuBtn();
    
    onPage = 'schedule';
    changeHeader('Schedule','schedule');
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    $scope.ad = getAd("schedule");
    getNewAd("schedule");
    if($scope.ad !== null){
        $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
    }
    $scope.hideLoad = 'hide';
    $scope.sched = user['schedule'];
});
graded.controller('settingsController', function($scope,$location,$sce) {
    switchToMenuBtn();
    changeHeader('Settings','settings');
    $scope.dank = (localStorage.getItem('showMemeOption') == "true");
    $scope.sudo = (user.profile.name == "George Thayamkery");
    $scope.fcm = localStorage.getItem("pushID");
    console.log(errors);
    $scope.log = errors;
    showNotifs();
    onPage = 'settings';
});
graded.controller('reportcard', function($scope,$location,$sce) {
    switchToMenuBtn();
    
    onPage = 'reportcard';
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    if(done.grades == false) {
        $scope.hideLoad = ['','hide'];
    }else{
        $scope.hideLoad = ['hide',''];
        $scope.ipr = user['reportcard']['ipr'];
        $scope.rp = user['reportcard']['rpc'];
        tabs();
        $scope.ad = getAd("grades");
        getNewAd("grades");
        if($scope.ad !== null){
            $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
        }
    }
    
    changeHeader('Grades','grades');

});
graded.controller('classController',['$scope','$routeParams','$location','$sce', function($scope, $routeParams,$location,$sce){
    switchToBackBtn();
    
    transition("left");
    $scope.user = user;
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    $scope.ad = getAd("classpage");
    getNewAd("classpage");
    $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
    // create a message to display in our view
    var b = $routeParams.class;
    $scope.title = 'Classwork';
    $scope.class = user['classes'][b];

    $scope.user = user;

}]);
graded.controller('classworkController', function($scope,$location,$sce) {
    switchToMenuBtn();
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    // create a message to display in our view
    onPage = 'classwork';
    modal();
    changeHeader('Classwork','classwork');

    $scope.title = 'Classwork';
    var classList = this;
    classList.classes = [];
    for(var key in user['classes']) {
        classList.classes.push(user['classes'][key]);
    }
    $scope.ad = getAd("classwork");
    getNewAd("classwork");
    if($scope.ad !== null){
        $scope.adHTML = $sce.trustAsHtml($scope.ad["AdvtHtml"]);
    }
    $scope.testing = classList.classes;
    $scope.user = user;
    $scope.time = time;

});
graded.controller('profile', function($scope,$location) {
    switchToMenuBtn();
    
    // create a message to display in our view
    onPage = 'profile';
    changeHeader('Profile','profile');
    if(user == null){
        relocate = location.hash;
        $location.path('/');

    }
    $scope.user = user;

});
graded.controller('loadContent', function($scope) {
    switchToMenuBtn();
    console.log('called');
    time = moment().format('h:mm:ss a');
    disableRefresh();
    onPage = 'loading';
    if(load == true) {
        loader();
    }
    $scope.title = 'Loading';

});

function actions(credentials){
    user.profile = credentials.profile;
    if (justRefresh == false) {
        if (credentials.oldclasswork == null) {
            isNew = true;
        } else {
            isNew = false;
            lastChecked = credentials.oldclasswork;
        }
    }
    if(isNew == false){

        justRefresh = false;
    }

    credentials.oldclasswork = user['classes'];
    localStorage.setItem('1', JSON.stringify(credentials));
    if(activeIndex != null){
        var a = localStorage.getItem("user_list");
        if(a != null){
            a = JSON.parse(a);
            a[activeIndex].oldclasswork = user['classes'];
            localStorage.setItem('user_list', JSON.stringify(a));

        }
    }
    try {
        differences();
    }catch(e){
        disabledifferences();
    }
    window.location = relocate;
    if(localStorage.getItem('defaultPage') != 'feed') {
        relocate = '#/classwork'
    }else{
        relocate = '#/feed';
    }

}
function refresh(a){
    window.location = '#/';
    relocate = a;
    justRefresh = true;
}

function differences(){
    if(isNew == false){
        var diff;
        for(var classwork in user['classes']){
            if(user['classes'][classwork]['avggrade'] == lastChecked[classwork]['avggrade']){
                gradeDiff[classwork] = ['hide',''];
            }else{
                diff = [Math.round((parseFloat(user['classes'][classwork]['avggrade'].split('%').pop()) - parseFloat(lastChecked[classwork]['avggrade'].split('%').pop()))), 'minus'];
                gradeDiff[classwork] = diff;
                if(gradeDiff[classwork][0] > 0){
                    gradeDiff[classwork][0] = '+' + (gradeDiff[classwork][0].toString());
                    gradeDiff[classwork][1] = 'plus';
                }
            }
            var isEqual = areArraysEqual(user['classes'][classwork]['classwork'],lastChecked[classwork]['classwork']);
            if(isEqual != true){
                classDiff.push([diffArray(user['classes'][classwork]['classwork'],lastChecked[classwork]['classwork']),classwork]);
                if(classDiff[classwork] != 0){
                    classes.push(classwork);
                }
            }
            for(var thing in user['classes']){
                user['classes'][thing]['gradediff'] = gradeDiff[thing];
                user['classes'][thing]['classdiff'] = classDiff[thing];
            }

        }
    }else{
        disabledifferences();
    }
}
function disabledifferences(){
        for(var classwork in user['classes']){
            gradeDiff[classwork] = ['hide',''];
            for(var thing in user['classes']){
                user['classes'][thing]['gradediff'] = gradeDiff[thing];
                user['classes'][thing]['classdiff'] = classDiff[thing];
            }

        }
}
function dueDates(){
    dueToday = [];
    date = moment().format('MM/DD/YYYY');
    tmrwDate = moment().add(1,'days').format('MM/DD/YYYY');
    var toCheck = 0;
    for(var item in user['format']){
        if(user['format'][item] == 'Date Due'){
            toCheck = item;
        }
    }
    for(var course in user['classes']){
        for(var assignment in user['classes'][course]['classwork']){
            if(user['classes'][course]['classwork'][assignment][toCheck] == date){
                dueToday.push({'assignment':user['classes'][course]['classwork'][assignment],'name':course})
            }
            if(user['classes'][course]['classwork'][assignment][toCheck] == tmrwDate){
                dueTomorow.push({'assignment':user['classes'][course]['classwork'][assignment],'name':course})
            }
        }
    }
    console.log(dueToday);
    console.log(dueTomorow);
    if(localStorage.getItem("date") != date && localStorage.getItem("pushID") != null && dueTomorow.length != 0 && isNew == false){
        if(moment().hour() < 4){
            if(dueTomorow.length > 1){
                newPushNotification(dueTomorow.length + " assignments due tommorow","", 0,"afternoon");
            }else{
                newPushNotification(dueTomorow[0]['assignment'][2]+ " due tommorow",dueToday[0]['name'],0,"afternoon");
            }
        }
        if(dueToday.length > 1){
            newPushNotification(dueToday.length + " assignments due today",0,"morning");
        }else{
            newPushNotification(dueToday[0]['assignment'][2]+ " due today",dueToday[0]['name'],0,"afternoon");
        }
    }
    localStorage.setItem("date",date);

}
function areArraysEqual(array1, array2) {
    var temp = new Array();
    if ( (!array1[0]) || (!array2[0]) ) { // If either is not an array
        return false;
    }
    if (array1.length != array2.length) {
        return false;
    }
    // Put all the elements from array1 into a "tagged" array
    for (var i=0; i<array1.length; i++) {
        key = (typeof array1[i]) + "~" + array1[i];
        // Use "typeof" so a number 1 isn't equal to a string "1".
        if (temp[key]) { temp[key]++; } else { temp[key] = 1; }
        // temp[key] = # of occurrences of the value (so an element could appear multiple times)
    }
    // Go through array2 - if same tag missing in "tagged" array, not equal
    for (var i=0; i<array2.length; i++) {
        key = (typeof array2[i]) + "~" + array2[i];
        if (temp[key]) {
            if (temp[key] == 0) { return false; } else { temp[key]--; }
            // Subtract to keep track of # of appearances in array2
        } else { // Key didn't appear in array1, arrays are not equal.
            return false;
        }
    }
    // If we get to this point, then every generated key in array1 showed up the exact same
    // number of times in array2, so the arrays are equal.
    return true;
}

function arr_diff(a1, a2)
{
    var a=[], diff=[];
    for(var i=0;i<a1.length;i++)
        a[a1[i]]=true;
    for(var i=0;i<a2.length;i++)
        if(a[a2[i]]) delete a[a2[i]];
        else a[a2[i]]=true;
    for(var k in a)
        diff.push(k);
    return diff;
}
function diffArray(a, b) {
    var seen = [], diff = [];
    for ( var i = 0; i < b.length; i++)
        seen[b[i]] = true;
    for ( var i = 0; i < a.length; i++)
        if (!seen[a[i]])
            diff.push(a[i]);
    return diff;
}
