var appSettings = {
    
    /*Everlive - Backend Services*/
    everlive: {
        apiKey: '3dpDiIYZMGxn97as', // Put your Backend Services API key here
        scheme: 'http'
    },
    
    /*App ID - Facebook*/
    facebook: {
        appId: '1438705299742853', // Put your Facebook App ID here
        redirectUri: 'https://www.facebook.com/connect/login_success.html'
    },
    
    /*App ID - Google*/
    google: {
        clientId: '181564302659-75uu56ljhvpcrhl5tnqpic16rj1e3qsg.apps.googleusercontent.com', 
        redirectUri: 'http://api.fanreact.com/google' // Put your Google Redirect URI here
    },
    
    /*App ID - Twitter*/
    twitter: {
        clientId: 'a82OwbQssid9xGzKiA0cMVqVW', 
        redirectUri: 'https://api.twitter.com/oauth/authenticate?oauth_token=92172668-6Yq4hOoXOP6Zs0JBottUwUFiE6AE4dsCRtn9DkTVX' 
    },
    
    /*Register Error Codes*/
    register_error_codes: {
        success: 0,
        sameEmail: 1,
        failed: 2
    },
    
    /*Account Types*/
    register_account_types: {
        native: 0,
        facebook: 1,
        google: 2,
        twitter: 3
    },
    
    /*Teams Divisions*/
    teams_divisions: {
        east: "EAST",
        west: "WEST",
        north: "NORTH",
        south: "SOUTH" 
    },
};


var domainNameSpace = {

    
   // name: 'http://api.fanreact.com',
	//name: 'http://fanreact.dev.contentactive.com',
    name: 'https://api.fanreact.com',
    s3AmazonVideoLink: 'https://s3-us-west-2.amazonaws.com/fanreact-rtmp-video-stream/',
    s3AmazonVideoThumbnail: 'https://s3-us-west-2.amazonaws.com/fanreact-video-thumbnails/',
    defaultAvatar: 'https://pbs.twimg.com/profile_images/486599606201905152/kC7LEWJG.png',

    //This is your Telerik BackEnd Services API key.
    //baasApiKey : 'hh6cxpypdm5sri5r',
    baasApiKey : 'bm4vT43UNn8dglAI',
    
    //This is the scheme (http or https) to use for accessing Telerik BackEnd Services.
    baasScheme : 'https',
    
    //This is your Android project number. It is required by Google in order to enable push notifications for your app. You do not need it for iPhone.
    //androidProjectNumber : '636515343884',
    androidProjectNumber : '969045623582',

    googleAnalyticId : 'UA-27763738-1',
}