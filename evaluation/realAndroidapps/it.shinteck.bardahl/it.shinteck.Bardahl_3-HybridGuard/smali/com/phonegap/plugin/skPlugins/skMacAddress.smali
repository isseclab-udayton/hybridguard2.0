.class public Lcom/phonegap/plugin/skPlugins/skMacAddress;
.super Lorg/apache/cordova/api/Plugin;
.source "skMacAddress.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 32
    return-void
.end method

.method private getMacAddress()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 110
    const/4 v1, 0x0

    .line 112
    .local v1, "macAddress":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/phonegap/plugin/skPlugins/skMacAddress;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 113
    .local v2, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 118
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 122
    .end local v2    # "wm":Landroid/net/wifi/WifiManager;
    :cond_0
    :goto_0
    return-object v3

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "wm":Landroid/net/wifi/WifiManager;
    :cond_1
    move-object v3, v1

    .line 122
    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 45
    const-string v5, "getMacAddress"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 54
    invoke-direct {p0}, Lcom/phonegap/plugin/skPlugins/skMacAddress;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "macAddress":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 56
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v6, "Can\'t get mac address"

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 74
    .end local v3    # "macAddress":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 59
    .restart local v3    # "macAddress":Ljava/lang/String;
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 62
    .local v0, "JSONresult":Lorg/json/JSONObject;
    :try_start_0
    const-string v5, "mac"

    invoke-virtual {v0, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .local v4, "result":Lorg/apache/cordova/api/PluginResult;
    goto :goto_0

    .line 64
    .end local v4    # "result":Lorg/apache/cordova/api/PluginResult;
    :catch_0
    move-exception v2

    .line 65
    .local v2, "jsonEx":Lorg/json/JSONException;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v6, "Json Exception"

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 68
    .restart local v4    # "result":Lorg/apache/cordova/api/PluginResult;
    goto :goto_0

    .line 66
    .end local v2    # "jsonEx":Lorg/json/JSONException;
    .end local v4    # "result":Lorg/apache/cordova/api/PluginResult;
    :catch_1
    move-exception v1

    .line 67
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v4    # "result":Lorg/apache/cordova/api/PluginResult;
    goto :goto_0

    .line 74
    .end local v0    # "JSONresult":Lorg/json/JSONObject;
    .end local v1    # "ex":Ljava/lang/Exception;
    .end local v3    # "macAddress":Ljava/lang/String;
    .end local v4    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v6, "Invalid action"

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method
