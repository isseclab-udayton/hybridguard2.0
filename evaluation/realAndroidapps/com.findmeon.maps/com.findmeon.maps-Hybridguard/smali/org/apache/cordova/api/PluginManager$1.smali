.class Lorg/apache/cordova/api/PluginManager$1;
.super Ljava/lang/Object;
.source "PluginManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/api/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/apache/cordova/api/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/api/PluginManager;

.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$args:Lorg/json/JSONArray;

.field final synthetic val$callbackId:Ljava/lang/String;

.field final synthetic val$plugin:Lorg/apache/cordova/api/IPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/api/PluginManager;Lorg/apache/cordova/api/IPlugin;Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 227
    iput-object p1, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    iput-object p2, p0, Lorg/apache/cordova/api/PluginManager$1;->val$plugin:Lorg/apache/cordova/api/IPlugin;

    iput-object p3, p0, Lorg/apache/cordova/api/PluginManager$1;->val$action:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$args:Lorg/json/JSONArray;

    iput-object p5, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 231
    :try_start_0
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->val$plugin:Lorg/apache/cordova/api/IPlugin;

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$action:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/cordova/api/PluginManager$1;->val$args:Lorg/json/JSONArray;

    iget-object v6, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-interface {v3, v4, v5, v6}, Lorg/apache/cordova/api/IPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v1

    .line 232
    .local v1, "cr":Lorg/apache/cordova/api/PluginResult;
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lorg/apache/cordova/api/PluginResult;->toCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 233
    .local v0, "callbackString":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 234
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    invoke-static {v3}, Lorg/apache/cordova/api/PluginManager;->access$000(Lorg/apache/cordova/api/PluginManager;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    .end local v0    # "callbackString":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 236
    .end local v1    # "cr":Lorg/apache/cordova/api/PluginResult;
    :catch_0
    move-exception v2

    .line 237
    .local v2, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 238
    .restart local v1    # "cr":Lorg/apache/cordova/api/PluginResult;
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    invoke-static {v3}, Lorg/apache/cordova/api/PluginManager;->access$000(Lorg/apache/cordova/api/PluginManager;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    goto :goto_0
.end method
