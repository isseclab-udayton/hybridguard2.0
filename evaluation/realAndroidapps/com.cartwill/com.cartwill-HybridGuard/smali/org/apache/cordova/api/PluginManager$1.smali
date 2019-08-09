.class Lorg/apache/cordova/api/PluginManager$1;
.super Ljava/lang/Object;
.source "PluginManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/api/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
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
    .line 188
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
    .line 192
    :try_start_0
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->val$plugin:Lorg/apache/cordova/api/IPlugin;

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$action:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/cordova/api/PluginManager$1;->val$args:Lorg/json/JSONArray;

    iget-object v6, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-interface {v3, v4, v5, v6}, Lorg/apache/cordova/api/IPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v0

    .line 193
    .local v0, "cr":Lorg/apache/cordova/api/PluginResult;
    invoke-virtual {v0}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v2

    .line 196
    .local v2, "status":I
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v3}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {v0}, Lorg/apache/cordova/api/PluginResult;->getKeepCallback()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 212
    .end local v2    # "status":I
    :goto_0
    return-void

    .line 200
    .restart local v2    # "status":I
    :cond_0
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v3}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-eq v2, v3, :cond_1

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v3}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 201
    :cond_1
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    invoke-static {v3}, Lorg/apache/cordova/api/PluginManager;->access$000(Lorg/apache/cordova/api/PluginManager;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/apache/cordova/api/PluginResult;->toSuccessCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 208
    .end local v0    # "cr":Lorg/apache/cordova/api/PluginResult;
    .end local v2    # "status":I
    :catch_0
    move-exception v1

    .line 209
    .local v1, "e":Ljava/lang/Exception;
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 210
    .restart local v0    # "cr":Lorg/apache/cordova/api/PluginResult;
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    invoke-static {v3}, Lorg/apache/cordova/api/PluginManager;->access$000(Lorg/apache/cordova/api/PluginManager;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V

    goto :goto_0

    .line 206
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "status":I
    :cond_2
    :try_start_1
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager$1;->this$0:Lorg/apache/cordova/api/PluginManager;

    invoke-static {v3}, Lorg/apache/cordova/api/PluginManager;->access$000(Lorg/apache/cordova/api/PluginManager;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/api/PluginManager$1;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CordovaWebView;->sendJavascript(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
