.class public abstract Lorg/apache/cordova/api/Plugin;
.super Ljava/lang/Object;
.source "Plugin.java"

# interfaces
.implements Lorg/apache/cordova/api/IPlugin;


# instance fields
.field public cordova:Lorg/apache/cordova/api/CordovaInterface;

.field public ctx:Lorg/apache/cordova/api/LegacyContext;

.field public id:Ljava/lang/String;

.field public webView:Lorg/apache/cordova/CordovaWebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public error(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    .locals 2
    .param p1, "pluginResult"    # Lorg/apache/cordova/api/PluginResult;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {p1, p2}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method public error(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, p2}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public abstract execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 128
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 105
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 115
    const/4 v0, 0x0

    return-object v0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 99
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 137
    const/4 v0, 0x0

    return v0
.end method

.method public onPause(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 85
    return-void
.end method

.method public onResume(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 93
    return-void
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;

    .prologue
    .line 147
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 2
    .param p1, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/apache/cordova/api/Plugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    .line 66
    new-instance v0, Lorg/apache/cordova/api/LegacyContext;

    iget-object v1, p0, Lorg/apache/cordova/api/Plugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1}, Lorg/apache/cordova/api/LegacyContext;-><init>(Lorg/apache/cordova/api/CordovaInterface;)V

    iput-object v0, p0, Lorg/apache/cordova/api/Plugin;->ctx:Lorg/apache/cordova/api/LegacyContext;

    .line 67
    return-void
.end method

.method public setView(Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .param p1, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 77
    return-void
.end method

.method public success(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lorg/apache/cordova/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method public success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    .locals 2
    .param p1, "pluginResult"    # Lorg/apache/cordova/api/PluginResult;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {p1, p2}, Lorg/apache/cordova/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public success(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/cordova/api/Plugin;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, p2}, Lorg/apache/cordova/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    .line 172
    return-void
.end method
