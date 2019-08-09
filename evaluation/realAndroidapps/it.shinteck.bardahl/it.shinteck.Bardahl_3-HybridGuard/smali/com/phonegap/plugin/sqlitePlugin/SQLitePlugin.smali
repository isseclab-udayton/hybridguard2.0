.class public Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;
.super Lorg/apache/cordova/api/Plugin;
.source "SQLitePlugin.java"


# instance fields
.field myDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 34
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 22
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 48
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 49
    .local v20, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v19, ""

    .line 52
    .local v19, "result":Ljava/lang/String;
    :try_start_0
    const-string v4, "open"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 53
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "1"

    const-string v7, "database"

    const-wide/32 v8, 0x4c4b40

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->openDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 92
    :cond_0
    :goto_0
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v4, v0, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 94
    :goto_1
    return-object v4

    .line 58
    :cond_1
    const-string v4, "executeSqlBatch"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 60
    const/16 v17, 0x0

    .line 61
    .local v17, "queries":[Ljava/lang/String;
    const/16 v18, 0x0

    .line 62
    .local v18, "queryIDs":[Ljava/lang/String;
    const/16 v21, 0x0

    .line 63
    .local v21, "trans_id":Ljava/lang/String;
    const/4 v10, 0x0

    .line 64
    .local v10, "a":Lorg/json/JSONObject;
    const/4 v13, 0x0

    .line 65
    .local v13, "jsonArr":Lorg/json/JSONArray;
    const/16 v16, 0x0

    .line 66
    .local v16, "paramLen":I
    const/4 v14, 0x0

    .line 68
    .local v14, "jsonparams":[Lorg/json/JSONArray;
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 69
    const/4 v4, 0x0

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 87
    :cond_2
    if-eqz v21, :cond_4

    .line 88
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v14, v2, v3}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 93
    .end local v10    # "a":Lorg/json/JSONObject;
    .end local v13    # "jsonArr":Lorg/json/JSONArray;
    .end local v14    # "jsonparams":[Lorg/json/JSONArray;
    .end local v16    # "paramLen":I
    .end local v17    # "queries":[Ljava/lang/String;
    .end local v18    # "queryIDs":[Ljava/lang/String;
    .end local v21    # "trans_id":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 94
    .local v11, "e":Lorg/json/JSONException;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 71
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v10    # "a":Lorg/json/JSONObject;
    .restart local v13    # "jsonArr":Lorg/json/JSONArray;
    .restart local v14    # "jsonparams":[Lorg/json/JSONArray;
    .restart local v16    # "paramLen":I
    .restart local v17    # "queries":[Ljava/lang/String;
    .restart local v18    # "queryIDs":[Ljava/lang/String;
    .restart local v21    # "trans_id":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v15

    .line 72
    .local v15, "len":I
    new-array v0, v15, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 73
    new-array v0, v15, [Ljava/lang/String;

    move-object/from16 v18, v0

    .line 74
    new-array v14, v15, [Lorg/json/JSONArray;

    .line 76
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    if-ge v12, v15, :cond_2

    .line 78
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 79
    const-string v4, "query"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v17, v12

    .line 80
    const-string v4, "query_id"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v18, v12

    .line 81
    const-string v4, "trans_id"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 82
    const-string v4, "params"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 83
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v16

    .line 84
    aput-object v13, v14, v12

    .line 76
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 90
    .end local v12    # "i":I
    .end local v15    # "len":I
    :cond_4
    const-string v4, "error"

    const-string v5, "null trans_id"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public executeSqlBatch([Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "queryarr"    # [Ljava/lang/String;
    .param p2, "jsonparams"    # [Lorg/json/JSONArray;
    .param p3, "queryIDs"    # [Ljava/lang/String;
    .param p4, "tx_id"    # Ljava/lang/String;

    .prologue
    .line 150
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 151
    const-string v11, ""

    .line 152
    .local v11, "query":Ljava/lang/String;
    const-string v12, ""

    .line 153
    .local v12, "query_id":Ljava/lang/String;
    move-object/from16 v0, p1

    array-length v7, v0

    .line 154
    .local v7, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v7, :cond_7

    .line 155
    aget-object v11, p1, v3

    .line 156
    aget-object v12, p3, v3

    .line 157
    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    const-string v15, "insert"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    if-eqz p2, :cond_4

    .line 158
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14, v11}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v9

    .line 159
    .local v9, "myStatement":Landroid/database/sqlite/SQLiteStatement;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    aget-object v14, p2, v3

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v6, v14, :cond_3

    .line 160
    aget-object v14, p2, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    instance-of v14, v14, Ljava/lang/Float;

    if-nez v14, :cond_0

    aget-object v14, p2, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    instance-of v14, v14, Ljava/lang/Double;

    if-eqz v14, :cond_1

    .line 161
    :cond_0
    add-int/lit8 v14, v6, 0x1

    aget-object v15, p2, v3

    invoke-virtual {v15, v6}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v15

    move-wide v0, v15

    invoke-virtual {v9, v14, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 159
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 162
    :cond_1
    aget-object v14, p2, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    instance-of v14, v14, Ljava/lang/Number;

    if-eqz v14, :cond_2

    .line 163
    add-int/lit8 v14, v6, 0x1

    aget-object v15, p2, v3

    invoke-virtual {v15, v6}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v15

    move-wide v0, v15

    invoke-virtual {v9, v14, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 193
    .end local v3    # "i":I
    .end local v6    # "j":I
    .end local v7    # "len":I
    .end local v9    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v11    # "query":Ljava/lang/String;
    .end local v12    # "query_id":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 194
    .local v2, "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 195
    const-string v14, "executeSqlBatch"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLitePlugin.executeSql(): Error="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.txErrorCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\', \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\');"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 204
    const-string v14, "executeSqlBatch"

    move-object/from16 v0, p4

    invoke-static {v14, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.txCompleteCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\');"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    .line 207
    .end local v2    # "ex":Landroid/database/sqlite/SQLiteException;
    :goto_3
    return-void

    .line 165
    .restart local v3    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "len":I
    .restart local v9    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v11    # "query":Ljava/lang/String;
    .restart local v12    # "query_id":Ljava/lang/String;
    :cond_2
    add-int/lit8 v14, v6, 0x1

    :try_start_2
    aget-object v15, p2, v3

    invoke-virtual {v15, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_2

    .line 197
    .end local v3    # "i":I
    .end local v6    # "j":I
    .end local v7    # "len":I
    .end local v9    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v11    # "query":Ljava/lang/String;
    .end local v12    # "query_id":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 198
    .local v2, "ex":Lorg/json/JSONException;
    :try_start_3
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 199
    const-string v14, "executeSqlBatch"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLitePlugin.executeSql(): Error="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.txErrorCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\', \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\');"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 203
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 204
    const-string v14, "executeSqlBatch"

    move-object/from16 v0, p4

    invoke-static {v14, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.txCompleteCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\');"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 168
    .end local v2    # "ex":Lorg/json/JSONException;
    .restart local v3    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "len":I
    .restart local v9    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v11    # "query":Ljava/lang/String;
    .restart local v12    # "query_id":Ljava/lang/String;
    :cond_3
    :try_start_4
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v4

    .line 170
    .local v4, "insertId":J
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "{\'insertId\':\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\'}"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 171
    .local v13, "result":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.queryCompleteCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\',\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\', "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ");"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    .line 154
    .end local v4    # "insertId":J
    .end local v6    # "j":I
    .end local v9    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v13    # "result":Ljava/lang/String;
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 173
    :cond_4
    const/4 v10, 0x0

    .line 175
    .local v10, "params":[Ljava/lang/String;
    if-eqz p2, :cond_6

    .line 176
    aget-object v14, p2, v3

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    new-array v10, v14, [Ljava/lang/String;

    .line 178
    const/4 v6, 0x0

    .restart local v6    # "j":I
    :goto_5
    aget-object v14, p2, v3

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v6, v14, :cond_6

    .line 179
    aget-object v14, p2, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v10, v6

    .line 180
    aget-object v14, v10, v6

    const-string v15, "null"

    if-ne v14, v15, :cond_5

    .line 181
    const-string v14, ""

    aput-object v14, v10, v6

    .line 178
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 185
    .end local v6    # "j":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14, v11, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 187
    .local v8, "myCursor":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v8, v12, v1}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->processResults(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_4

    .line 203
    .end local v3    # "i":I
    .end local v7    # "len":I
    .end local v8    # "myCursor":Landroid/database/Cursor;
    .end local v10    # "params":[Ljava/lang/String;
    .end local v11    # "query":Ljava/lang/String;
    .end local v12    # "query_id":Ljava/lang/String;
    :catchall_0
    move-exception v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 204
    const-string v15, "executeSqlBatch"

    move-object/from16 v0, p4

    invoke-static {v15, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLitePluginTransaction.txCompleteCallback(\'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\');"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    throw v14

    .line 191
    .restart local v3    # "i":I
    .restart local v7    # "len":I
    .restart local v11    # "query":Ljava/lang/String;
    .restart local v12    # "query_id":Ljava/lang/String;
    :cond_7
    :try_start_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 203
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 204
    const-string v14, "executeSqlBatch"

    move-object/from16 v0, p4

    invoke-static {v14, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SQLitePluginTransaction.txCompleteCallback(\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\');"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 107
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 119
    :cond_0
    return-void
.end method

.method public openDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .param p1, "db"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "display_name"    # Ljava/lang/String;
    .param p4, "size"    # J

    .prologue
    .line 141
    iget-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".db"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->myDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 146
    return-void
.end method

.method public processResults(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "cur"    # Landroid/database/Cursor;
    .param p2, "query_id"    # Ljava/lang/String;
    .param p3, "tx_id"    # Ljava/lang/String;

    .prologue
    .line 219
    const-string v5, "[]"

    .line 222
    .local v5, "result":Ljava/lang/String;
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 223
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 224
    .local v2, "fullresult":Lorg/json/JSONArray;
    const-string v4, ""

    .line 225
    .local v4, "key":Ljava/lang/String;
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    .line 229
    .local v0, "colCount":I
    :cond_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 231
    .local v6, "row":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_4

    .line 232
    :try_start_0
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v4

    .line 234
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xb

    if-lt v7, v8, :cond_3

    .line 236
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getType(I)I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 231
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 239
    :pswitch_0
    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 262
    :catch_0
    move-exception v1

    .line 263
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 266
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 268
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    .line 270
    .end local v0    # "colCount":I
    .end local v2    # "fullresult":Lorg/json/JSONArray;
    .end local v3    # "i":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "row":Lorg/json/JSONObject;
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 271
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " SQLitePluginTransaction.queryCompleteCallback(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\', "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ");"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/phonegap/plugin/sqlitePlugin/SQLitePlugin;->sendJavascript(Ljava/lang/String;)V

    .line 273
    :cond_2
    return-void

    .line 242
    .restart local v0    # "colCount":I
    .restart local v2    # "fullresult":Lorg/json/JSONArray;
    .restart local v3    # "i":I
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v6    # "row":Lorg/json/JSONObject;
    :pswitch_1
    :try_start_1
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 245
    :pswitch_2
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    float-to-double v7, v7

    invoke-virtual {v6, v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_1

    .line 248
    :pswitch_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 251
    :pswitch_4
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 257
    :cond_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 260
    :cond_4
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 236
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
