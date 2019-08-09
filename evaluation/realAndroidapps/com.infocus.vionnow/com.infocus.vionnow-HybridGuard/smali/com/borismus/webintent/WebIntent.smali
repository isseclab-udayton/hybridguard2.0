.class public Lcom/borismus/webintent/WebIntent;
.super Lorg/apache/cordova/api/Plugin;
.source "WebIntent.java"


# instance fields
.field private onNewIntentCallback:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/borismus/webintent/WebIntent;->onNewIntentCallback:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 15
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 47
    :try_start_0
    const-string v13, "startActivity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 48
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    const/4 v14, 0x1

    if-eq v13, v14, :cond_0

    .line 49
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 136
    :goto_0
    return-object v9

    .line 53
    :cond_0
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 54
    .local v8, "obj":Lorg/json/JSONObject;
    const-string v13, "type"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "type"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 55
    .local v10, "type":Ljava/lang/String;
    :goto_1
    const-string v13, "url"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    const-string v13, "url"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 56
    .local v11, "uri":Landroid/net/Uri;
    :goto_2
    const-string v13, "extras"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    const-string v13, "extras"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 57
    .local v4, "extras":Lorg/json/JSONObject;
    :goto_3
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 60
    .local v5, "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v4, :cond_1

    .line 61
    invoke-virtual {v4}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v3

    .line 62
    .local v3, "extraNames":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v6, v13, :cond_5

    .line 69
    .end local v3    # "extraNames":Lorg/json/JSONArray;
    .end local v6    # "i":I
    :cond_1
    const-string v13, "action"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13, v11, v10, v5}, Lcom/borismus/webintent/WebIntent;->startActivity(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;)V

    .line 70
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 134
    .end local v4    # "extras":Lorg/json/JSONObject;
    .end local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "obj":Lorg/json/JSONObject;
    .end local v10    # "type":Ljava/lang/String;
    .end local v11    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 135
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 136
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0

    .line 54
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v8    # "obj":Lorg/json/JSONObject;
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 55
    .restart local v10    # "type":Ljava/lang/String;
    :cond_3
    const/4 v11, 0x0

    goto :goto_2

    .line 56
    .restart local v11    # "uri":Landroid/net/Uri;
    :cond_4
    const/4 v4, 0x0

    goto :goto_3

    .line 63
    .restart local v3    # "extraNames":Lorg/json/JSONArray;
    .restart local v4    # "extras":Lorg/json/JSONObject;
    .restart local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "i":I
    :cond_5
    :try_start_1
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 64
    .local v7, "key":Ljava/lang/String;
    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 65
    .local v12, "value":Ljava/lang/String;
    invoke-interface {v5, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 72
    .end local v3    # "extraNames":Lorg/json/JSONArray;
    .end local v4    # "extras":Lorg/json/JSONObject;
    .end local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "i":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "obj":Lorg/json/JSONObject;
    .end local v10    # "type":Ljava/lang/String;
    .end local v11    # "uri":Landroid/net/Uri;
    .end local v12    # "value":Ljava/lang/String;
    :cond_6
    const-string v13, "hasExtra"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 73
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    const/4 v14, 0x1

    if-eq v13, v14, :cond_7

    .line 74
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 76
    :cond_7
    iget-object v13, p0, Lcom/borismus/webintent/WebIntent;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v13}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 77
    .local v6, "i":Landroid/content/Intent;
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "extraName":Ljava/lang/String;
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v6, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v14

    invoke-direct {v9, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Z)V

    goto/16 :goto_0

    .line 80
    .end local v2    # "extraName":Ljava/lang/String;
    .end local v6    # "i":Landroid/content/Intent;
    :cond_8
    const-string v13, "getExtra"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 81
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    const/4 v14, 0x1

    if-eq v13, v14, :cond_9

    .line 82
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 84
    :cond_9
    iget-object v13, p0, Lcom/borismus/webintent/WebIntent;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v13}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 85
    .restart local v6    # "i":Landroid/content/Intent;
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 86
    .restart local v2    # "extraName":Ljava/lang/String;
    invoke-virtual {v6, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 87
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v6, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v9, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 89
    :cond_a
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 91
    .end local v2    # "extraName":Ljava/lang/String;
    .end local v6    # "i":Landroid/content/Intent;
    :cond_b
    const-string v13, "getUri"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 92
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-eqz v13, :cond_c

    .line 93
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 96
    :cond_c
    iget-object v13, p0, Lcom/borismus/webintent/WebIntent;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v13}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 97
    .restart local v6    # "i":Landroid/content/Intent;
    invoke-virtual {v6}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v11

    .line 98
    .local v11, "uri":Ljava/lang/String;
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 99
    .end local v6    # "i":Landroid/content/Intent;
    .end local v11    # "uri":Ljava/lang/String;
    :cond_d
    const-string v13, "onNewIntent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_f

    .line 100
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-eqz v13, :cond_e

    .line 101
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 104
    :cond_e
    move-object/from16 v0, p3

    iput-object v0, p0, Lcom/borismus/webintent/WebIntent;->onNewIntentCallback:Ljava/lang/String;

    .line 105
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 106
    .local v9, "result":Lorg/apache/cordova/api/PluginResult;
    const/4 v13, 0x1

    invoke-virtual {v9, v13}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto/16 :goto_0

    .line 108
    .end local v9    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_f
    const-string v13, "sendBroadcast"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_14

    .line 110
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v13

    const/4 v14, 0x1

    if-eq v13, v14, :cond_10

    .line 111
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 115
    :cond_10
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 117
    .restart local v8    # "obj":Lorg/json/JSONObject;
    const-string v13, "extras"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_12

    const-string v13, "extras"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 118
    .restart local v4    # "extras":Lorg/json/JSONObject;
    :goto_5
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 121
    .restart local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v4, :cond_11

    .line 122
    invoke-virtual {v4}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v3

    .line 123
    .restart local v3    # "extraNames":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_6
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v6, v13, :cond_13

    .line 130
    .end local v3    # "extraNames":Lorg/json/JSONArray;
    .end local v6    # "i":I
    :cond_11
    const-string v13, "action"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13, v5}, Lcom/borismus/webintent/WebIntent;->sendBroadcast(Ljava/lang/String;Ljava/util/Map;)V

    .line 131
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_0

    .line 117
    .end local v4    # "extras":Lorg/json/JSONObject;
    .end local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_12
    const/4 v4, 0x0

    goto :goto_5

    .line 124
    .restart local v3    # "extraNames":Lorg/json/JSONArray;
    .restart local v4    # "extras":Lorg/json/JSONObject;
    .restart local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "i":I
    :cond_13
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 125
    .restart local v7    # "key":Ljava/lang/String;
    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 126
    .restart local v12    # "value":Ljava/lang/String;
    invoke-interface {v5, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 133
    .end local v3    # "extraNames":Lorg/json/JSONArray;
    .end local v4    # "extras":Lorg/json/JSONObject;
    .end local v5    # "extrasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "i":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "obj":Lorg/json/JSONObject;
    .end local v12    # "value":Ljava/lang/String;
    :cond_14
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 142
    iget-object v1, p0, Lcom/borismus/webintent/WebIntent;->onNewIntentCallback:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 143
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 144
    .local v0, "result":Lorg/apache/cordova/api/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 145
    iget-object v1, p0, Lcom/borismus/webintent/WebIntent;->onNewIntentCallback:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/borismus/webintent/WebIntent;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 147
    .end local v0    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_0
    return-void
.end method

.method sendBroadcast(Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 180
    .local p2, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 181
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 187
    iget-object v3, p0, Lcom/borismus/webintent/WebIntent;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v3, v0}, Lorg/apache/cordova/DroidGap;->sendBroadcast(Landroid/content/Intent;)V

    .line 188
    return-void

    .line 182
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 183
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 184
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method startActivity(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;)V
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p4, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 152
    .local v0, "i":Landroid/content/Intent;
    :goto_0
    if-eqz p3, :cond_2

    if-eqz p2, :cond_2

    .line 153
    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 160
    :cond_0
    :goto_1
    invoke-interface {p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 176
    iget-object v3, p0, Lcom/borismus/webintent/WebIntent;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 177
    return-void

    .line 150
    .end local v0    # "i":Landroid/content/Intent;
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 155
    .restart local v0    # "i":Landroid/content/Intent;
    :cond_2
    if-eqz p3, :cond_0

    .line 156
    invoke-virtual {v0, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 160
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 161
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 163
    .local v2, "value":Ljava/lang/String;
    const-string v4, "android.intent.extra.TEXT"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "text/html"

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 164
    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    goto :goto_2

    .line 165
    :cond_4
    const-string v4, "android.intent.extra.STREAM"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 168
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_2

    .line 169
    :cond_5
    const-string v4, "android.intent.extra.EMAIL"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 171
    const-string v4, "android.intent.extra.EMAIL"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 173
    :cond_6
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2
.end method
