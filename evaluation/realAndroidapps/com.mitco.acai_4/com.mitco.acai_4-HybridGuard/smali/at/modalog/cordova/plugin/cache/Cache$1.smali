.class Lat/modalog/cordova/plugin/cache/Cache$1;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lat/modalog/cordova/plugin/cache/Cache;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lat/modalog/cordova/plugin/cache/Cache;

.field private final synthetic val$self:Lat/modalog/cordova/plugin/cache/Cache;


# direct methods
.method constructor <init>(Lat/modalog/cordova/plugin/cache/Cache;Lat/modalog/cordova/plugin/cache/Cache;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lat/modalog/cordova/plugin/cache/Cache$1;->this$0:Lat/modalog/cordova/plugin/cache/Cache;

    iput-object p2, p0, Lat/modalog/cordova/plugin/cache/Cache$1;->val$self:Lat/modalog/cordova/plugin/cache/Cache;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 65
    :try_start_0
    iget-object v3, p0, Lat/modalog/cordova/plugin/cache/Cache$1;->val$self:Lat/modalog/cordova/plugin/cache/Cache;

    iget-object v3, v3, Lat/modalog/cordova/plugin/cache/Cache;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lorg/apache/cordova/CordovaWebView;->clearCache(Z)V

    .line 68
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 69
    .local v2, "result":Lorg/apache/cordova/PluginResult;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 70
    iget-object v3, p0, Lat/modalog/cordova/plugin/cache/Cache$1;->val$self:Lat/modalog/cordova/plugin/cache/Cache;

    invoke-static {v3}, Lat/modalog/cordova/plugin/cache/Cache;->access$0(Lat/modalog/cordova/plugin/cache/Cache;)Lorg/apache/cordova/CallbackContext;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :goto_0
    return-void

    .line 72
    .end local v2    # "result":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Error while clearing webview cache."

    .line 75
    .local v1, "msg":Ljava/lang/String;
    const-string v3, "Cache"

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 79
    .restart local v2    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v2, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 80
    iget-object v3, p0, Lat/modalog/cordova/plugin/cache/Cache$1;->val$self:Lat/modalog/cordova/plugin/cache/Cache;

    invoke-static {v3}, Lat/modalog/cordova/plugin/cache/Cache;->access$0(Lat/modalog/cordova/plugin/cache/Cache;)Lorg/apache/cordova/CallbackContext;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method
