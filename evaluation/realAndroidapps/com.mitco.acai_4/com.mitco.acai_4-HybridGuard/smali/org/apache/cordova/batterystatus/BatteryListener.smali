.class public Lorg/apache/cordova/batterystatus/BatteryListener;
.super Lorg/apache/cordova/CordovaPlugin;
.source "BatteryListener.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "BatteryManager"


# instance fields
.field private batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

.field receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 40
    iput-object v0, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 46
    iput-object v0, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    .line 47
    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/batterystatus/BatteryListener;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 147
    invoke-direct {p0, p1}, Lorg/apache/cordova/batterystatus/BatteryListener;->updateBatteryInfo(Landroid/content/Intent;)V

    return-void
.end method

.method private getBatteryInfo(Landroid/content/Intent;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "batteryIntent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 131
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 133
    .local v1, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "level"

    const-string v4, "level"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 134
    const-string v3, "isPlugged"

    const-string v4, "plugged"

    const/4 v5, -0x1

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-lez v4, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_0
    return-object v1

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "BatteryManager"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private removeBatteryListener()V
    .locals 4

    .prologue
    .line 114
    iget-object v1, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 116
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 117
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "BatteryManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error unregistering battery receiver: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private sendUpdate(Lorg/json/JSONObject;Z)V
    .locals 2
    .param p1, "info"    # Lorg/json/JSONObject;
    .param p2, "keepCallback"    # Z

    .prologue
    .line 157
    iget-object v1, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 158
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 159
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 160
    iget-object v1, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 162
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method private updateBatteryInfo(Landroid/content/Intent;)V
    .locals 2
    .param p1, "batteryIntent"    # Landroid/content/Intent;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/apache/cordova/batterystatus/BatteryListener;->getBatteryInfo(Landroid/content/Intent;)Lorg/json/JSONObject;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/cordova/batterystatus/BatteryListener;->sendUpdate(Lorg/json/JSONObject;Z)V

    .line 149
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 58
    const-string v4, "start"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 59
    iget-object v3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 60
    const-string v3, "Battery listener already running."

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 93
    :goto_0
    return v2

    .line 63
    :cond_0
    iput-object p3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 66
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 67
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 68
    iget-object v3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    if-nez v3, :cond_1

    .line 69
    new-instance v3, Lorg/apache/cordova/batterystatus/BatteryListener$1;

    invoke-direct {v3, p0}, Lorg/apache/cordova/batterystatus/BatteryListener$1;-><init>(Lorg/apache/cordova/batterystatus/BatteryListener;)V

    iput-object v3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    .line 75
    iget-object v3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 79
    :cond_1
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 80
    .local v1, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 81
    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 85
    .end local v0    # "intentFilter":Landroid/content/IntentFilter;
    .end local v1    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :cond_2
    const-string v4, "stop"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 86
    invoke-direct {p0}, Lorg/apache/cordova/batterystatus/BatteryListener;->removeBatteryListener()V

    .line 87
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {p0, v4, v3}, Lorg/apache/cordova/batterystatus/BatteryListener;->sendUpdate(Lorg/json/JSONObject;Z)V

    .line 88
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/cordova/batterystatus/BatteryListener;->batteryCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 89
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    :cond_3
    move v2, v3

    .line 93
    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/apache/cordova/batterystatus/BatteryListener;->removeBatteryListener()V

    .line 101
    return-void
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 107
    invoke-direct {p0}, Lorg/apache/cordova/batterystatus/BatteryListener;->removeBatteryListener()V

    .line 108
    return-void
.end method
