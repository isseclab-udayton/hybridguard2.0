.class public Lcom/haji3/SmsPlugin;
.super Lcom/phonegap/api/Plugin;
.source "SmsPlugin.java"


# instance fields
.field public final ACTION_SEND_SMS:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/phonegap/api/Plugin;-><init>()V

    .line 37
    const-string v0, "SendSMS"

    iput-object v0, p0, Lcom/haji3/SmsPlugin;->ACTION_SEND_SMS:Ljava/lang/String;

    .line 36
    return-void
.end method

.method private sendSMS(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 59
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v0

    .line 61
    .local v0, "manager":Landroid/telephony/SmsManager;
    iget-object v1, p0, Lcom/haji3/SmsPlugin;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {v1, v5, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .local v4, "sentIntent":Landroid/app/PendingIntent;
    move-object v1, p1

    move-object v3, p2

    move-object v5, v2

    .line 63
    invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 64
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "arg1"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 41
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 43
    .local v3, "result":Lcom/phonegap/api/PluginResult;
    const-string v4, "SendSMS"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 45
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "phoneNumber":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "message":Ljava/lang/String;
    invoke-direct {p0, v2, v1}, Lcom/haji3/SmsPlugin;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    new-instance v3, Lcom/phonegap/api/PluginResult;

    .end local v3    # "result":Lcom/phonegap/api/PluginResult;
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lcom/phonegap/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "phoneNumber":Ljava/lang/String;
    .restart local v3    # "result":Lcom/phonegap/api/PluginResult;
    :cond_0
    :goto_0
    return-object v3

    .line 50
    .end local v3    # "result":Lcom/phonegap/api/PluginResult;
    :catch_0
    move-exception v0

    .line 51
    .local v0, "ex":Lorg/json/JSONException;
    new-instance v3, Lcom/phonegap/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/phonegap/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v3    # "result":Lcom/phonegap/api/PluginResult;
    goto :goto_0
.end method

.method public bridge synthetic execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/haji3/SmsPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lcom/phonegap/api/PluginResult;

    move-result-object v0

    return-object v0
.end method
