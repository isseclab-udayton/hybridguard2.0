/*
usage example:
*/

var ContentActive = ContentActive || {};
ContentActive.Sqlite = ContentActive.Sqlite || {};

ContentActive.Sqlite.SqliteDB = function(dbName, version, displayName, size)
{
    if(dbName != undefined && dbName.length > 0)
    {
        if(version == undefined)
        {
            version = "1.0";
        }
        if(displayName == undefined)
        {
            displayName = dbName;
        }
        if(size == undefined)
        {
            size = 1000000;
        }
        
        this.Database = window.openDatabase(dbName, version, displayName, size);
    }
}

ContentActive.Sqlite.SqliteDB.prototype.ExecuteQuery = function(query, databaseArguments, success, fail, overallSuccess, overallFail)
{
    if(this.Database != undefined)
    {
        var transactionFunction = function(tx)
        {
            if(query instanceof Array)
            {
                for(var i = 0; i < query.length; i++)
                {
                    tx.executeSql(query[i], databaseArguments[i], success[i], fail[i]);
                }
            }
            else
            {
                tx.executeSql(query, databaseArguments, success, fail);
            }
        }
        
        this.Database.transaction(transactionFunction, overallSuccess, overallFail);
    }
}