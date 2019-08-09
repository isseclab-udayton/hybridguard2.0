.class Lorg/apache/cordova/facebook/ConnectPlugin$2$1;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Lcom/facebook/GraphRequest$GraphJSONObjectCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/facebook/ConnectPlugin$2;->onSuccess(Lcom/facebook/login/LoginResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;


# direct methods
.method constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin$2;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/facebook/ConnectPlugin$2;

    .prologue
    .line 97
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V
    .locals 3
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "response"    # Lcom/facebook/GraphResponse;

    .prologue
    .line 100
    invoke-virtual {p2}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 101
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 102
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v1, v1, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-virtual {p2}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->getFacebookRequestErrorResponse(Lcom/facebook/FacebookRequestError;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 103
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v1, v1, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-virtual {p2}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->getFacebookRequestErrorResponse(Lcom/facebook/FacebookRequestError;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 111
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 112
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$200(Lorg/apache/cordova/facebook/ConnectPlugin;)V

    goto :goto_0

    .line 116
    :cond_3
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 117
    const-string v0, "ConnectPlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "returning login object "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v1, v1, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-virtual {v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->getResponse()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 119
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$2$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$2;

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin$2;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$102(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    goto :goto_0
.end method
