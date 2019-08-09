
var ajaxFeedingNameSpace = {

    isStarted: false,
    postId: 1,

    /*Starts the Update Process*/
    getSinglePost: function () {
        var profileId  = loginNameSpace.loggedUserID;
        //var postid = $('#postToPublicViewPostId').val();
        var postid = ajaxFeedingNameSpace.postId;
        var postDesc = $('#postToPublicViewComment').val();
        
        postDesc = customNamespace.commentImg(postDesc);
        
        var chosenUrl = domainNameSpace.name + '/?alttemplate=JsonFeedPostComment';
        //console.log(chosenUrl);
        $.ajax({
                type: "GET",
                url: chosenUrl,
                data:
                    { 
                        profileId: profileId ,
                        postId: postid ,
                        commentVideoLink: "",
                        commentImageLink: imagelink ,
                        commentDescription: postDesc,
                    },
        }).success(function (data) {
            //console.log(data);
            if (data.ErrorCode === 0) {
                location.hash='../comments/commentsView.html';
            } else {
                alert("Failed to post. Please check the input fileds.")
            }
        }).fail(function () {
            //alert("fail");
        });
    }
}

