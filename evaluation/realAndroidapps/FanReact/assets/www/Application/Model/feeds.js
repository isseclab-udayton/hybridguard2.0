window.localAppVersion = 1.03;
//THIS IS A SPECIAL FEED MANAGER THAT IS SET TO POST BY DEFAULT
window.SqliteDatabase = new ContentActive.Sqlite.SqliteDB("FanReactFeeds.db");
window.FeedManager = new ContentActive.FeedSystem.FeedManager(undefined, window.SqliteDatabase);

window.serverName = domainNameSpace.name;

window.GetReactionPosts = new ContentActive.FeedSystem.Feed("GetReactionPosts", serverName + "/?alttemplate=JsonFeedGetReactionPost" , 0, null, true );
window.FeedManager.AddFeed(window.GetReactionPosts);

window.GetReactionPostsSQL = new ContentActive.FeedSystem.Feed("GetReactionPostsSQL", serverName + "/?alttemplate=JsonFeedGetReactionPost" , 0, null, true );
window.FeedManager.AddFeed( window.GetReactionPostsSQL );

window.GetTrendingPostSql = new ContentActive.FeedSystem.Feed("GetTrendingPostSql", serverName + "/?alttemplate=JsonFeedGetPostsTrendingV001" , 0, null, true );
window.FeedManager.AddFeed( window.GetTrendingPostSql );

window.GetTrendingPostSqlMore = new ContentActive.FeedSystem.Feed("GetTrendingPostSqlMore", serverName + "/?alttemplate=JsonFeedGetPostsTrendingV001" , 0, null, true );
window.FeedManager.AddFeed( window.GetTrendingPostSqlMore );

window.GetTeamFollowing = new ContentActive.FeedSystem.Feed("GetTeamFollowing", serverName + "/?alttemplate=JsonFeedTeamListSQL" , 0, null, true );
window.FeedManager.AddFeed( window.GetTeamFollowing );

window.GetSocialRegisterInfo = new ContentActive.FeedSystem.Feed("GetSocialRegisterInfo", serverName + "/?alttemplate=JsonFeedRegisterSocial" , 0, null, true );
window.FeedManager.AddFeed( window.GetSocialRegisterInfo );

window.RegisterNewUser = new ContentActive.FeedSystem.Feed("RegisterNewUser", serverName + "/?alttemplate=JsonFeedRegisterSQLNEW&setting=2066" , 0, null, false );
window.FeedManager.AddFeed( window.RegisterNewUser );

window.GetLoginInfoWithProfileId = new ContentActive.FeedSystem.Feed("GetLoginInfoWithProfileId", serverName + "/?alttemplate=JsonFeedLoginSQLnew" , 0, null, true );
window.FeedManager.AddFeed( window.GetLoginInfoWithProfileId );

window.GetNotification = new ContentActive.FeedSystem.Feed("GetNotification", serverName + "/?alttemplate=JsonFeedGetNotificationsV2" , 0, null, true );
window.FeedManager.AddFeed( window.GetNotification );


window.GetTeamBySearchTerm = new ContentActive.FeedSystem.Feed("GetTeamBySearchTerm", serverName + "/?alttemplate=JsonFeedGetAllTeamsV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamBySearchTerm);

window.GetTeamBySearchTermForPost = new ContentActive.FeedSystem.Feed("GetTeamBySearchTermForPost", serverName + "/?alttemplate=JsonFeedGetAllTeamsV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamBySearchTermForPost);

window.GetTeamBySearchTermForPostMore = new ContentActive.FeedSystem.Feed("GetTeamBySearchTermForPostMore", serverName + "/?alttemplate=JsonFeedGetAllTeamsV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamBySearchTermForPostMore);

window.GetTeamBySearchTerm = new ContentActive.FeedSystem.Feed("GetTeamBySearchTerm", serverName + "/?alttemplate=JsonFeedGetAllTeamsV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamBySearchTerm);

window.GetAllUsers = new ContentActive.FeedSystem.Feed("GetAllUsers", serverName + "/?alttemplate=JsonFeedGetAllUsers", 0, null, true);
window.FeedManager.AddFeed(window.GetAllUsers);

window.SubmitPost = new ContentActive.FeedSystem.Feed("SubmitPost", serverName + "/?alttemplate=JsonFeedSubmitPost", 0, null, false);
window.FeedManager.AddFeed(window.SubmitPost);

window.GetPostForATeam = new ContentActive.FeedSystem.Feed("GetPostForATeam", serverName + "/?alttemplate=JsonFeedGetAllPostsTeamV002", 0, null, true);
window.FeedManager.AddFeed(window.GetPostForATeam);

window.GetPostForATeamMore = new ContentActive.FeedSystem.Feed("GetPostForATeamMore", serverName + "/?alttemplate=JsonFeedGetAllPostsTeamV002", 0, null, true);
window.FeedManager.AddFeed(window.GetPostForATeamMore);

window.GetTeamPostTrending = new ContentActive.FeedSystem.Feed("GetTeamPostTrending", serverName + "/?alttemplate=JsonFeedGetAllPostsTeamTrendingV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamPostTrending);

window.GetTeamPostTrendingMore = new ContentActive.FeedSystem.Feed("GetTeamPostTrending", serverName + "/?alttemplate=JsonFeedGetAllPostsTeamTrendingV001", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamPostTrendingMore);

window.GetTeamTotalReaction = new ContentActive.FeedSystem.Feed("GetTeamTotalReaction", serverName + "/?alttemplate=JsonFeedGetTeamTotalReaction", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamTotalReaction);

window.GetTeamFanOfTheMonth = new ContentActive.FeedSystem.Feed("GetTeamFanOfTheMonth", serverName + "/?alttemplate=JsonFeedGetTeamFanOfTheMonth", 0, null, true);
window.FeedManager.AddFeed(window.GetTeamFanOfTheMonth);

window.SubmitPostToGameCenter = new ContentActive.FeedSystem.Feed("SubmitPostToGameCenter", serverName + "/?alttemplate=JsonFeedSubmitPostGC", 0, null, true);
window.FeedManager.AddFeed(window.SubmitPostToGameCenter);

window.UpdatePost = new ContentActive.FeedSystem.Feed("UpdatePost ", serverName + "/?alttemplate=JsonFeedUpdatePost", 0, null, true);
window.FeedManager.AddFeed(window.UpdatePost);

window.GetFanListThisUserFollowing = new ContentActive.FeedSystem.Feed("GetFanListThisUserFollowing", serverName + "/?alttemplate=JsonFeedFansFollowingListing", 0, null, true);
window.FeedManager.AddFeed(window.GetFanListThisUserFollowing);

window.GetFanListFollowingThisUser = new ContentActive.FeedSystem.Feed("GetFanListFollowingThisUser ", serverName + "/?alttemplate=JsonFeedFansFollowedListing", 0, null, true);
window.FeedManager.AddFeed(window.GetFanListFollowingThisUser);

window.SubmitComment = new ContentActive.FeedSystem.Feed("SubmitComment", serverName + "/?alttemplate=JsonFeedPostComment", 0, null, true);
window.FeedManager.AddFeed(window.SubmitComment);

window.GetAllSport = new ContentActive.FeedSystem.Feed("GetAllSport", serverName + "/?alttemplate=JsonFeedGetTeamSport", 0, null, true);
window.FeedManager.AddFeed(window.GetAllSport);

window.GetPostDetail = new ContentActive.FeedSystem.Feed("GetPostDetail", serverName + "/?alttemplate=JsonFeedGetPostV001", 0, null, true);
window.FeedManager.AddFeed(window.GetPostDetail);

window.GetComments = new ContentActive.FeedSystem.Feed("GetComments", serverName + "/?alttemplate=JsonFeedGetCommentsV001", 0, null, false);
window.FeedManager.AddFeed(window.GetComments);

window.GetProfile = new ContentActive.FeedSystem.Feed("GetProfile", serverName + "/?alttemplate=JsonFeedGetProfilev2", 0, null, true);
window.FeedManager.AddFeed(window.GetProfile );

window.GetProfileHypeRank = new ContentActive.FeedSystem.Feed("GetProfileHypeRank", serverName + "/?alttemplate=JsonFeedGetProfileHypeRank" , 0, null, true );
window.FeedManager.AddFeed( window.GetProfileHypeRank );

window.GetFanListAUserFollowing = new ContentActive.FeedSystem.Feed("GetFanListAUserFollowing", serverName + "/?alttemplate=JsonFeedFansFollowingListing", 0, null, true);
window.FeedManager.AddFeed(window.GetFanListAUserFollowing);

window.GetFanListFollowingAUser = new ContentActive.FeedSystem.Feed("GetFanListFollowingAUser ", serverName + "/?alttemplate=JsonFeedFansFollowedListing", 0, null, true);
window.FeedManager.AddFeed(window.GetFanListFollowingAUser);

window.GetTeamAUserFollowing = new ContentActive.FeedSystem.Feed("GetTeamAUserFollowing", serverName + "/?alttemplate=JsonFeedTeamListSQL" , 0, null, true );
window.FeedManager.AddFeed( window.GetTeamAUserFollowing );

window.GetAllPostOfAUser = new ContentActive.FeedSystem.Feed("GetAllPostOfAUser", serverName + "/?alttemplate=JsonFeedGetAllPostsV001" , 0, null, true );
window.FeedManager.AddFeed( window.GetAllPostOfAUser );

window.GetAllPostOfAUserMore = new ContentActive.FeedSystem.Feed("GetAllPostOfAUserMore", serverName + "/?alttemplate=JsonFeedGetAllPostsV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetAllPostOfAUserMore );

window.GetSponsor = new ContentActive.FeedSystem.Feed("GetSponsor", serverName + "/?alttemplate=JsonFeedGetSponsor" , 0, null, true );
window.FeedManager.AddFeed( window.GetSponsor );

window.GetTeamGameCenter = new ContentActive.FeedSystem.Feed("GetTeamGameCenter", serverName + "/?alttemplate=JsonFeedGameCenterTeams" , 0, null, true );
window.FeedManager.AddFeed( window.GetTeamGameCenter );

window.InsertOrUpdateVote = new ContentActive.FeedSystem.Feed("InsertOrUpdateVote", serverName + "/?alttemplate=jsonfeedvotev1" , 0, null, true );
window.FeedManager.AddFeed( window.InsertOrUpdateVote );

window.UpdateProfile = new ContentActive.FeedSystem.Feed("UpdateProfile", serverName + "/?alttemplate=JsonFeedUpdateProfileV001" , 0, null, true );
window.FeedManager.AddFeed( window.UpdateProfile );

window.GetAdvertisement = new ContentActive.FeedSystem.Feed("GetAdvertisement", serverName + "/?alttemplate=JsonFeedGetAdvertisementV001" , 0, null, true );
window.FeedManager.AddFeed( window.GetAdvertisement );

window.GetNotificationForNetworkNone = new ContentActive.FeedSystem.Feed("GetNotificationForNetworkNone", serverName + "/?alttemplate=JsonFeedGetNotificationForNetworkNoneV001" , 0, null, true );
window.FeedManager.AddFeed( window.GetNotificationForNetworkNone );

window.GetProfileByName = new ContentActive.FeedSystem.Feed("GetProfileByName", serverName + "/?alttemplate=JsonFeedGetProfileByHandleV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetProfileByName );

window.GetGameCenterPosts = new ContentActive.FeedSystem.Feed("GetGameCenterPosts", serverName + "/?alttemplate=JsonFeedGetAllPostsGCV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetGameCenterPosts );

window.GetGameCenterPostsMore = new ContentActive.FeedSystem.Feed("GetGameCenterPostsMore", serverName + "/?alttemplate=JsonFeedGetAllPostsGCV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetGameCenterPostsMore );

window.GetGameCenterTrending = new ContentActive.FeedSystem.Feed("GetGameCenterTrending", serverName + "/?alttemplate=JsonFeedGetAllPostsGCTrendingV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetGameCenterTrending );

window.GetGameCenterTrendingMore = new ContentActive.FeedSystem.Feed("GetGameCenterTrendingMore", serverName + "/?alttemplate=JsonFeedGetAllPostsGCTrendingV001" , 0, null, false );
window.FeedManager.AddFeed( window.GetGameCenterTrendingMore );


window.GetFanFollowingATeam = new ContentActive.FeedSystem.Feed("GetFanFollowingATeam", serverName + "/?alttemplate=JsonFeedFansFollowingATeam" , 0, null, false );
window.FeedManager.AddFeed( window.GetFanFollowingATeam );

window.GetFanFollowingATeamMore = new ContentActive.FeedSystem.Feed("GetFanFollowingATeamMore", serverName + "/?alttemplate=JsonFeedFansFollowingATeam" , 0, null, true );
window.FeedManager.AddFeed( window.GetFanFollowingATeamMore );

/*
window.GetScoreApi = new ContentActive.FeedSystem.Feed("GetScoreApi", "http://www.fanreact.com/mllscores.php", 0, null, true);
window.FeedManager.AddFeed(window.GetScoreApi);
*/

window.GetGameInfoTeamForScore = new ContentActive.FeedSystem.Feed("feedGetGameInfoTeamForScore", serverName + "/?alttemplate=JsonFeedGetGameInfo&type=getTeamForScore", 0, null, true);
window.FeedManager.AddFeed(window.feedGetGameInfoTeamForScore);

// this is feed saved to local sql lite 
window.SaveTeamSearchedTerm = new ContentActive.FeedSystem.Feed("SaveTeamSearchedTerm", "", 0, null, true);
window.FeedManager.AddFeed(window.SaveTeamSearchedTerm);



// this is feed saved to local sql lite 
window.SaveFriendAndFan = new ContentActive.FeedSystem.Feed("SaveFriendAndFan", "", 0, null, true);
window.FeedManager.AddFeed(window.SaveFriendAndFan);

// this is feed saved to local sql lite 
window.SavePostQueue = new ContentActive.FeedSystem.Feed("SavePostQueue", "", 0, null, true);
window.FeedManager.AddFeed(window.SavePostQueue);

// this is feed saved to local sql lite 
window.SaveImageAsCache = new ContentActive.FeedSystem.Feed("SaveImageAsCache", "", 0, null, true);
window.FeedManager.AddFeed(window.SaveImageAsCache);


