.class public Lorg/apache/cordova/SplashScreen;
.super Lorg/apache/cordova/api/Plugin;
.source "SplashScreen.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 11
    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 12
    .local v1, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v0, ""

    .line 14
    .local v0, "result":Ljava/lang/String;
    const-string v2, "hide"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 15
    iget-object v2, p0, Lorg/apache/cordova/SplashScreen;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    check-cast v2, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v2}, Lorg/apache/cordova/DroidGap;->removeSplashScreen()V

    .line 20
    :goto_0
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v1, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    return-object v2

    .line 18
    :cond_0
    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    goto :goto_0
.end method
