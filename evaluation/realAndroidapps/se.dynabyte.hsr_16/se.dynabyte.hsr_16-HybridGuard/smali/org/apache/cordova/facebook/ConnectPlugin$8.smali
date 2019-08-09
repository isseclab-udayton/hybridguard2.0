.class Lorg/apache/cordova/facebook/ConnectPlugin$8;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/facebook/ConnectPlugin;->makeGraphCall()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/facebook/ConnectPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 822
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 4
    .param p1, "response"    # Lcom/facebook/GraphResponse;

    .prologue
    const/4 v3, 0x0

    .line 825
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 826
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 827
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->getFacebookRequestErrorResponse(Lcom/facebook/FacebookRequestError;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 831
    :goto_0
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0, v3}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$602(Lorg/apache/cordova/facebook/ConnectPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 832
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0, v3}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$002(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    .line 834
    :cond_0
    return-void

    .line 829
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$8;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_0
.end method
