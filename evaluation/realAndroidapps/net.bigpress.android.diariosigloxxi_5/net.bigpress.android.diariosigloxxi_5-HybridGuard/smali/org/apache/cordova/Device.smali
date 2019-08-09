.class public Lorg/apache/cordova/Device;
.super Lorg/apache/cordova/api/Plugin;
.source "Device.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "Device"

.field public static cordovaVersion:Ljava/lang/String;

.field public static platform:Ljava/lang/String;

.field public static uuid:Ljava/lang/String;


# instance fields
.field telephonyReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "1.7.0"

    sput-object v0, Lorg/apache/cordova/Device;->cordovaVersion:Ljava/lang/String;

    .line 42
    const-string v0, "Android"

    sput-object v0, Lorg/apache/cordova/Device;->platform:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    .line 51
    return-void
.end method

.method private initTelephonyReceiver()V
    .locals 4

    .prologue
    .line 126
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 127
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lorg/apache/cordova/Device;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 129
    .local v1, "myctx":Lorg/apache/cordova/api/CordovaInterface;
    new-instance v2, Lorg/apache/cordova/Device$1;

    invoke-direct {v2, p0, v1}, Lorg/apache/cordova/Device$1;-><init>(Lorg/apache/cordova/Device;Lorg/apache/cordova/api/CordovaInterface;)V

    iput-object v2, p0, Lorg/apache/cordova/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    .line 156
    iget-object v2, p0, Lorg/apache/cordova/Device;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    iget-object v3, p0, Lorg/apache/cordova/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-interface {v2, v3, v0}, Lorg/apache/cordova/api/CordovaInterface;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 157
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 74
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 75
    .local v3, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v2, ""

    .line 78
    .local v2, "result":Ljava/lang/String;
    :try_start_0
    const-string v4, "getDeviceInfo"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 79
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 80
    .local v1, "r":Lorg/json/JSONObject;
    const-string v4, "uuid"

    sget-object v5, Lorg/apache/cordova/Device;->uuid:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    const-string v4, "version"

    invoke-virtual {p0}, Lorg/apache/cordova/Device;->getOSVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v4, "platform"

    sget-object v5, Lorg/apache/cordova/Device;->platform:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v4, "name"

    invoke-virtual {p0}, Lorg/apache/cordova/Device;->getProductName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v4, "cordova"

    sget-object v5, Lorg/apache/cordova/Device;->cordovaVersion:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v4, v3, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 92
    .end local v1    # "r":Lorg/json/JSONObject;
    :goto_0
    return-object v4

    .line 90
    :cond_0
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v4, v3, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0
.end method

.method public getCordovaVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    sget-object v0, Lorg/apache/cordova/Device;->cordovaVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 189
    .local v0, "model":Ljava/lang/String;
    return-object v0
.end method

.method public getOSVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 204
    .local v0, "osversion":Ljava/lang/String;
    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    sget-object v0, Lorg/apache/cordova/Device;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 194
    .local v0, "productname":Ljava/lang/String;
    return-object v0
.end method

.method public getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 209
    .local v0, "sdkversion":Ljava/lang/String;
    return-object v0
.end method

.method public getTimeZoneID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 214
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 215
    .local v0, "tz":Ljava/util/TimeZone;
    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUuid()Ljava/lang/String;
    .locals 3

    .prologue
    .line 174
    iget-object v1, p0, Lorg/apache/cordova/Device;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "uuid":Ljava/lang/String;
    return-object v0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 103
    const-string v0, "getDeviceInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    const/4 v0, 0x1

    .line 106
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/cordova/Device;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    iget-object v1, p0, Lorg/apache/cordova/Device;->telephonyReceiver:Landroid/content/BroadcastReceiver;

    invoke-interface {v0, v1}, Lorg/apache/cordova/api/CordovaInterface;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 114
    return-void
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 1
    .param p1, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 60
    invoke-super {p0, p1}, Lorg/apache/cordova/api/Plugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 61
    invoke-virtual {p0}, Lorg/apache/cordova/Device;->getUuid()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/cordova/Device;->uuid:Ljava/lang/String;

    .line 62
    invoke-direct {p0}, Lorg/apache/cordova/Device;->initTelephonyReceiver()V

    .line 63
    return-void
.end method
