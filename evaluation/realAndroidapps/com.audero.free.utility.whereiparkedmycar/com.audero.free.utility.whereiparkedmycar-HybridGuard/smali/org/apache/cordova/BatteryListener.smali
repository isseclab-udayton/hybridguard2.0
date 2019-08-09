.class public Lorg/apache/cordova/BatteryListener;
.super Lorg/apache/cordova/api/Plugin;
.source "BatteryListener.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "BatteryManager"


# instance fields
.field private batteryCallbackId:Ljava/lang/String;

.field receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 39
    iput-object v0, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/BatteryListener;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/BatteryListener;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/apache/cordova/BatteryListener;->updateBatteryInfo(Landroid/content/Intent;)V

    return-void
.end method

.method private getBatteryInfo(Landroid/content/Intent;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "batteryIntent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 123
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 125
    .local v1, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "level"

    const-string v4, "level"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 126
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

    .line 130
    :goto_0
    return-object v1

    .line 127
    :catch_0
    move-exception v0

    .line 128
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
    .line 106
    iget-object v1, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 108
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/BatteryListener;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 109
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "BatteryManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering battery receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

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
    .line 149
    iget-object v1, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 150
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 151
    .local v0, "result":Lorg/apache/cordova/api/PluginResult;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 152
    iget-object v1, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/BatteryListener;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 154
    .end local v0    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_0
    return-void
.end method

.method private updateBatteryInfo(Landroid/content/Intent;)V
    .locals 2
    .param p1, "batteryIntent"    # Landroid/content/Intent;

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lorg/apache/cordova/BatteryListener;->getBatteryInfo(Landroid/content/Intent;)Lorg/json/JSONObject;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/apache/cordova/BatteryListener;->sendUpdate(Lorg/json/JSONObject;Z)V

    .line 141
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 57
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    .line 58
    .local v3, "status":Lorg/apache/cordova/api/PluginResult$Status;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported Operation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 60
    .local v2, "result":Ljava/lang/String;
    const-string v4, "start"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 61
    iget-object v4, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 62
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v5, "Battery listener already running."

    invoke-direct {v1, v4, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 92
    :goto_0
    return-object v1

    .line 64
    :cond_0
    iput-object p3, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    .line 67
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 68
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 69
    iget-object v4, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    if-nez v4, :cond_1

    .line 70
    new-instance v4, Lorg/apache/cordova/BatteryListener$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/BatteryListener$1;-><init>(Lorg/apache/cordova/BatteryListener;)V

    iput-object v4, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    .line 76
    iget-object v4, p0, Lorg/apache/cordova/BatteryListener;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/cordova/BatteryListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v4, v5, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 80
    :cond_1
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 81
    .local v1, "pluginResult":Lorg/apache/cordova/api/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_0

    .line 85
    .end local v0    # "intentFilter":Landroid/content/IntentFilter;
    .end local v1    # "pluginResult":Lorg/apache/cordova/api/PluginResult;
    :cond_2
    const-string v4, "stop"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 86
    invoke-direct {p0}, Lorg/apache/cordova/BatteryListener;->removeBatteryListener()V

    .line 87
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const/4 v5, 0x0

    invoke-direct {p0, v4, v5}, Lorg/apache/cordova/BatteryListener;->sendUpdate(Lorg/json/JSONObject;Z)V

    .line 88
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/cordova/BatteryListener;->batteryCallbackId:Ljava/lang/String;

    .line 89
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0

    .line 92
    :cond_3
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v1, v3, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/cordova/BatteryListener;->removeBatteryListener()V

    .line 100
    return-void
.end method
