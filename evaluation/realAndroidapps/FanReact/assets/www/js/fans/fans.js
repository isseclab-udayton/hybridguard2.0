var fansNameSpace = {
    
    otherProfile: 0,
    tabActive: "MyFans",
    
    /*This function is called when My Fans List should appear*/
    myFansActive: function () {
        $("#pageTitle").text("Fans");
        $("#fansOfList").hide();
    },
    
    /*This function is called when Fans Of List should appear*/
    fansOfActive: function () {
        $("#pageTitle").text("Fans of");
        $("#fansOfTab").addClass("active");
        $("#myFansTab").removeClass("active");
        $("#myFansList").hide();
    },
    
    /*My Fans Tab On Click Event*/
    myFansTabOnClick: function () {
        $("#pageTitle").text("Fans");
        $("#myFansList").show();
        $("#fansOfList").hide();
        $("#myFansTab").addClass("active");
        $("#fansOfTab").removeClass("active");
        fansNameSpace.tabActive = "MyFans";
    },
    
    /*Fans Of Tab On Click Event*/
    fansOfTabOnClick: function () {
        $("#pageTitle").text("Fans Of");
        $("#myFansList").hide();
        $("#fansOfList").show();
        $("#fansOfTab").addClass("active");
        $("#myFansTab").removeClass("active");
        fansNameSpace.tabActive = "FansOf";
    },

    getNotificationCount: function () {
        var profileId = loginNameSpace.loggedUserID;
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedGetFansNotificationCount&profileId=' + profileId;
        //console.log(chosenUrl);
        $.ajax({
            type: "GET",
            url: chosenUrl
        }).success(function (data) {
            
            if (data.ErrorCode != 0) { return false; }
            var count = data.Data[0].notificationCount;
            $(".countFansForCommonFooter").html(count);
            $(".fanNotifications").html(count);
            if(count==0){$(".countFansForCommonFooter").hide(); $(".fanNotifications").hide();}
            if(count>0){$(".countFansForCommonFooter").show(); $(".fanNotifications").show();}
        
            // hide count of fan when viewing fan page
            try {
                var pageId = $.mobile.activePage.attr('id');
                if (pageId == 'fansView') {
                    $(".countFansForCommonFooter").hide();
                }
            } catch (err) { console.log(err.message) }

            
        }).fail(function () {
            console.log("Fail");
        });
    },
    
};