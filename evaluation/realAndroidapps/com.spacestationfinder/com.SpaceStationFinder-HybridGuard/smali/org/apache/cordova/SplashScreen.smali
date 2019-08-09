.class public Lorg/apache/cordova/SplashScreen;
.super Lorg/apache/cordova/api/Plugin;
.source "SplashScreen.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 30
    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 31
    .local v1, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v0, ""

    .line 33
    .local v0, "result":Ljava/lang/String;
    const-string v2, "hide"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 34
    iget-object v2, p0, Lorg/apache/cordova/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v3, "splashscreen"

    const-string v4, "hide"

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    :goto_0
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v1, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    return-object v2

    .line 35
    :cond_0
    const-string v2, "show"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 36
    iget-object v2, p0, Lorg/apache/cordova/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v3, "splashscreen"

    const-string v4, "show"

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 39
    :cond_1
    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    goto :goto_0
.end method
