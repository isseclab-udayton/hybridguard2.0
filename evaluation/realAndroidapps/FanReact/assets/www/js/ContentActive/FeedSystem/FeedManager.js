var ContentActive = ContentActive || {};
ContentActive.FeedSystem = ContentActive.FeedSystem || {};

ContentActive.FeedSystem.DefaultFeedManagerUpdateInterval = 1000;

ContentActive.FeedSystem.FeedManager = function(updateInterval, database, tableName)
{
    this.Feeds = [];
    this.LastUpdateTime = Date.now();
    
    if(updateInterval == undefined)
    {
        updateInterval = ContentActive.FeedSystem.DefaultFeedManagerUpdateInterval;
    }
    
    if(database == undefined || !(database instanceof ContentActive.Sqlite.SqliteDB))
    {
        this.Database = new ContentActive.Sqlite.SqliteDB("FanReactFeeds.db");
    }
    else
    {
        this.Database = database;
    }
    
    if(tableName != undefined && tableName.length >= 0)
    {
        this.TableName = tableName;
    }
    else
    {
        this.TableName = "FeedManager";
    }
    
    this.Database.ExecuteQuery('CREATE TABLE IF NOT EXISTS ' + this.TableName + ' (feedName TEXT UNIQUE PRIMARY KEY ON CONFLICT REPLACE, jsonData TEXT, timeStamp INT)');
    
    var selfObjectReference = this;
    function setTimer()
    {
        setTimeout(function(){
            selfObjectReference.Update(); 
            setTimer();
        }, updateInterval);
    }
    setTimer();
}

ContentActive.FeedSystem.FeedManager.prototype.AddFeed = function(feed)
{
    if(feed instanceof ContentActive.FeedSystem.Feed)
    {
        this.Feeds.push(feed);
        
        //Get cached data
        if(feed.Cached)
        {
            this.RetrieveCachedFeed(feed);
        }
    }
}

ContentActive.FeedSystem.FeedManager.prototype.Update = function()
{
    if(navigator.network != undefined && navigator.network.connection.type != "none")
    {
        var currentTime = Date.now();
        var timeDifference = this.LastUpdateTime - currentTime;
        var referenceObject = this;
        
        this.Feeds.forEach(function f(feed)
        {
            if(feed.NeedSynchronousUpdate || (feed.UpdateDelay > 0 && (currentTime - feed.LastUpdateTime) >= feed.UpdateDelay))
            {
                feed.Execute(referenceObject);
                feed.NeedSynchronousUpdate = false;
            }
        });
        
        this.LastUpdateTime = currentTime;
    }
}

ContentActive.FeedSystem.FeedManager.prototype.CacheFeed = function(feed)
{
    if(this.Database instanceof ContentActive.Sqlite.SqliteDB)
    {
        var query = 'INSERT INTO ' + this.TableName + ' (feedName, jsonData, timeStamp) VALUES (?, ?, ?)';
        this.Database.ExecuteQuery(query, [feed.Name, JSON.stringify(feed.JsonObject), feed.LastUpdateTime]);
    }
}

ContentActive.FeedSystem.FeedManager.prototype.RetrieveCachedFeed = function(feed)
{
    if(this.Database instanceof ContentActive.Sqlite.SqliteDB)
    {
        var query = 'SELECT jsonData, timeStamp FROM ' + this.TableName + ' WHERE feedName = ?';
        this.Database.ExecuteQuery(query, [feed.Name], function(tx, results)
                                   {
                                       if(results.rows.length > 0)
                                       {
                                            feed.JsonObject = JSON.parse(results.rows.item(0).jsonData);
                                            feed.LastUpdateTime = results.rows.item(0).timeStamp;

                                            if(feed.DataUpdatedEvent != undefined)
                                            {
                                                feed.DataUpdatedEvent();
                                            }
                                       }
                                   });
    }
}