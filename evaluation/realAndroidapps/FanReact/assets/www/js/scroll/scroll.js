scrollNamespace = {};
scrollNamespace.var = {};
scrollNamespace.var.lastScrollingPosition = 0;
scrollNamespace.var.scrollDirection = '';
scrollNamespace.var.getMoreButton = 'none';

scrollNamespace.var.modify = function (name, value) {

    scrollNamespace.var[name] = value;
};

scrollNamespace.call = function () {

    var current = scrollNamespace.detectCurrentPosition();
    scrollNamespace.var.scrollDirection = scrollNamespace.detectDirection(current, scrollNamespace.var.lastScrollingPosition);
    scrollNamespace.var.lastScrollingPosition = current;

    scrollNamespace.scrollTriggerGetMore(current);
    scrollNamespace.onPageDefinedCall.call(scrollNamespace.var.scrollDirection);
};

scrollNamespace.detectCurrentPosition = function () {
    return $(window).scrollTop() + $(window).height();
}

scrollNamespace.scrollTriggerGetMore = function (current) {

    if (scrollNamespace.var.enableGetMore == false) {
        return false;
    }

    var reachBottom = false;
    var scrollingNearEnd = false;
    var minimumNotReach = false;

    var scrollingPosition = current;
    var documentHeight = $(document).height();
    var halfDocumentHeight = documentHeight / 2;
    var minimumDocumentHeight = 2000;

    if (scrollingPosition > documentHeight - 1000) {
        scrollingNearEnd = true;
    }

    //customNamespace.console('scrolling ' + scrollingPosition + ' ' + (documentHeight - 1000) +  ' ' + scrollingNearEnd ) ;

    var getMoreButton = scrollNamespace.var.getMoreButton;
    if (minimumNotReach == true || scrollingNearEnd == true) {
        customNamespace.console('cliked')
        $.mobile.activePage.find(getMoreButton).trigger('click');
    }
};

scrollNamespace.detectDirection = function (current, last) {

    var direction = '';

    if (current > last) {
        direction = 'down';
    }
    else if (current < last) {
        direction = 'up';
    }
    return direction;
};

scrollNamespace.updateButton = {};
scrollNamespace.updateButton.var = {};
scrollNamespace.updateButton.var.enable = false;
scrollNamespace.updateButton.disable = function () {
    scrollNamespace.updateButton.var.enable = false;
    $('#indexHeaderNewUpdate').hide();
};
scrollNamespace.updateButton.alignCenter = function () {
    elementName = '.new-feed-container';
    var screenWidth = $('#commonForAllPagePreventFlashSolution').width();
    var updateButtonWidth = $(elementName).width();
    var alignMargin = screenWidth / 2 - updateButtonWidth / 2;
    $(elementName).css('margin-left', alignMargin + 'px');
    $(elementName).css('width', updateButtonWidth + 'px');
};
scrollNamespace.updateButton.updateText = function (elementText) {
    $('#indexHeaderNewUpdate span').html(elementText);
    scrollNamespace.updateButton.alignCenter();
    scrollNamespace.updateButton.var.enable = true;
    scrollNamespace.updateButton.alignCenter();
};

scrollNamespace.timeOut = function (timeId, callback, timeOut) {
    if (timeOut == undefined) {
        timeOut = 5000;
    }

    clearTimeout($.data(this, timeId));
    $.data(this, timeId, setTimeout(function () {
        customNamespace.console(' trigger  ' + timeOut);
        callback();
    }, timeOut));
};


scrollNamespace.onPageDefinedCall = {};
scrollNamespace.onPageDefinedCall.call = function (direction) {
    if (direction == 'up') {

        if (scrollNamespace.updateButton.var.enable == true) {
            $('#indexHeaderNewUpdate').fadeIn();
        }

        scrollNamespace.onPageDefinedCall.up();
    }
    else if (direction == 'down') {

        $('#indexHeaderNewUpdate').fadeOut();

        scrollNamespace.onPageDefinedCall.down();

        scrollNamespace.timeOut('scrollNamespace.scrollTriggerGetMore', function () {
            $('#indexHeaderNewUpdate').fadeOut();
        });
    }
};

scrollNamespace.refreshOnnPageDefinedCall = function () {
    scrollNamespace.onPageDefinedCall.up = function () { };
    scrollNamespace.onPageDefinedCall.down = function () { };

    scrollNamespace.updateButton.disable();
};


//////////////////////////////////////// begin shortener ///////////////////////////////


scrollNamespace.page = {};
scrollNamespace.page.shortner = {};
scrollNamespace.page.shortner.var = {};
scrollNamespace.page.shortner.var.currentMid = '#notificationsView-currentmidPage' ;
scrollNamespace.page.shortner.var.feedChild = '#notificationFeed tr' ;
scrollNamespace.page.shortner.var.currentPage =  'notificationsView' ;
scrollNamespace.page.shortner.var.feedId = '#notificationFeed' ;
scrollNamespace.page.shortner.var.getMore = '.notificationsView-getMore' ;
//scrollNamespace.page.shortner.var.feedName = '#notificationFeed-duplicate';
scrollNamespace.page.shortner.var.duplicateName = '#notificationFeed-duplicate';
scrollNamespace.page.shortner.var.duplicateChild = '#notificationFeed-duplicate tr';
scrollNamespace.page.shortner.var.duplicateLengthMinimum = 30;
scrollNamespace.page.shortner.var.startCount = 0;
scrollNamespace.page.shortner.var.endCount = 30;
scrollNamespace.page.shortner.var.increase = 30;
scrollNamespace.page.shortner.var.decrease = 30;
scrollNamespace.page.shortner.var.nextBtn = '#notificationsView-nextBtn';
scrollNamespace.page.shortner.var.previousBtn = '#notificationsView-previousBtn';
scrollNamespace.page.shortner.var.nextErrorMsg = '#notificationsView-nextError';
scrollNamespace.page.shortner.var.previousError = '#notificationsView-previousError';
scrollNamespace.page.shortner.change = function(){
    
    var startCount = 0;
    var endCount = 5;
    var currentMid = '#reactionsView-currentmidPage' ;
    var feedChild = '#reactionsFeed .reaction-child';
    var duplicateName = '#reactionsFeed-duplicate';
    var duplicateChild = scrollNamespace.page.shortner.var.duplicateChild;
    var duplicateLengthMinimum =  scrollNamespace.page.shortner.var.duplicateLengthMinimum;
    startCount = scrollNamespace.page.shortner.var.startCount;
    endCount = scrollNamespace.page.shortner.var.endCount;
    currentMid = scrollNamespace.page.shortner.var.currentMid;
    feedChild = scrollNamespace.page.shortner.var.feedChild;
    duplicateName = scrollNamespace.page.shortner.var.duplicateName;
    var current = $(currentMid).val();
    current = parseInt(current);
    var content = '';
    var feedLength = $(feedChild).length;
    //console.log(feedLength)
    for(x=startCount;x<endCount;x++){
        //console.log(current+x)
        if(current+x < 0 || current+x >= feedLength ){ break; }
        //console.log(feedChild)
        content += $(feedChild).eq(current+x)[0].outerHTML;
        
    }
    $(duplicateName).html(content);

    var scrollToFirst = function(){
        var headerHeight = $('.ui-header').height();
        $('html,body').animate({
           scrollTop: $(duplicateChild).eq(0).offset().top - headerHeight
        });
    };
    
    if( duplicateChild.length >= duplicateLengthMinimum ){
        scrollToFirst();
    }
}

scrollNamespace.page.shortner.getNext = function(){   
    var nextError = scrollNamespace.page.shortner.var.nextError;
    var nextBtn = scrollNamespace.page.shortner.var.nextBtn;
    var increase = scrollNamespace.page.shortner.var.increase ;
    var currentPage = 'reactionsView';
    var currentMid = '#reactionsView-currentmidPage' ;
    var feedId = '#reactionsFeed' ;
    var feedChild = '';
    var duplicateChild = scrollNamespace.page.shortner.var.duplicateChild;
    var getMore = '.reactionsView-getMore';
    var previousBtn = scrollNamespace.page.shortner.var.previousBtn;
    currentPage = scrollNamespace.page.shortner.var.currentPage;
    currentMid = scrollNamespace.page.shortner.var.currentMid;
    feedId = scrollNamespace.page.shortner.var.feedId;
    feedChild = scrollNamespace.page.shortner.var.feedChild;
    getMore = scrollNamespace.page.shortner.var.getMore;
    var activePage = $.mobile.activePage.attr('id');
    if( activePage != currentPage){return false;}
    var current = $(currentMid).val();
    var feedLength = $(feedChild).length;
    current = parseInt(current);
    //console.log(feedLength);
    $(previousBtn).fadeIn();
    if( current > feedLength - 40){
        //$('.indexHtml-commonLoadingScreen').fadeIn();
        $(getMore).trigger('click');
    }
    
    if( current+increase >= feedLength ){
        $(nextBtn).fadeOut();
        $(nextError).fadeIn();
        return false;
    }
    $(currentMid).val(current+increase);
    
    scrollNamespace.page.shortner.change();
}

scrollNamespace.page.shortner.getPrevious = function(){   
    var currentPage = 'reactionsView' ;
    var currentMid = '#reactionsView-currentmidPage' ;    
    var nextBtn = scrollNamespace.page.shortner.var.nextBtn;
    var previousError = scrollNamespace.page.shortner.var.previousError;
    var previousBtn = scrollNamespace.page.shortner.var.previousBtn;

    var decrease = scrollNamespace.page.shortner.var.decrease;
    currentPage = scrollNamespace.page.shortner.var.currentPage;
    currentMid = scrollNamespace.page.shortner.var.currentMid;
    $(nextBtn).fadeIn();
    var activePage = $.mobile.activePage.attr('id');
    if( activePage != currentPage ){return false;}
    var current = $(currentMid).val();
    current = parseInt(current);   
    if(current-decrease < 0){
        $(previousBtn).slideUp();
        $(previousError).slideDown();
        return false;
    }
    $(currentMid).val(current-decrease);
    scrollNamespace.page.shortner.change()
}

scrollNamespace.page.shortner.initialize = function(extraAction){   

    scrollNamespace.page.shortner.var.currentMid = '#notificationsView-currentmidPage' ;
    scrollNamespace.page.shortner.var.feedChild = '#notificationFeed tr' ;
    scrollNamespace.page.shortner.var.currentPage =  'notificationsView' ;
    scrollNamespace.page.shortner.var.feedId = '#notificationFeed' ;
    scrollNamespace.page.shortner.var.getMore = '.notificationsView-getMore' ;
    //scrollNamespace.page.shortner.var.feedName = '#notificationFeed-duplicate';
    scrollNamespace.page.shortner.var.duplicateName = '#notificationFeed-duplicate';
    scrollNamespace.page.shortner.var.duplicateChild = '#notificationFeed-duplicate tr';
    scrollNamespace.page.shortner.var.duplicateLengthMinimum = 30;
    scrollNamespace.page.shortner.var.startCount = 0;
    scrollNamespace.page.shortner.var.endCount = 30;
    scrollNamespace.page.shortner.var.increase = 30;
    scrollNamespace.page.shortner.var.decrease = 30;
    scrollNamespace.page.shortner.var.nextBtn = '#notificationsView-nextBtn';
    scrollNamespace.page.shortner.var.previousBtn = '#notificationsView-previousBtn';
    scrollNamespace.page.shortner.var.nextErrorMsg = '#notificationsView-nextError';
    scrollNamespace.page.shortner.var.previousError = '#notificationsView-previousError';
    
    try{extraAction();}catch(err){}
    //scrollNamespace.page.shortner.var.nextBtn).show();
    $(scrollNamespace.page.shortner.var.nextBtn).trigger('click');
    //$(scrollNamespace.page.shortner.var.previousBtn).hide();
}

//////////////////////////////////////// end shortener ///////////////////////////////