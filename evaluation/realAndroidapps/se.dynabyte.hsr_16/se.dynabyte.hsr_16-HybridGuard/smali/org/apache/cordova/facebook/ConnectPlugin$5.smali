.class Lorg/apache/cordova/facebook/ConnectPlugin$5;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/facebook/ConnectPlugin;->pluginInitialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback",
        "<",
        "Lcom/facebook/share/widget/GameRequestDialog$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/facebook/ConnectPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 191
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    .line 210
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    invoke-direct {v0}, Lcom/facebook/FacebookOperationCanceledException;-><init>()V

    .line 211
    .local v0, "e":Lcom/facebook/FacebookOperationCanceledException;
    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 212
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 5
    .param p1, "e"    # Lcom/facebook/FacebookException;

    .prologue
    .line 216
    const-string v0, "Activity"

    const-string v1, "Error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/facebook/FacebookException;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 218
    return-void
.end method

.method public onSuccess(Lcom/facebook/share/widget/GameRequestDialog$Result;)V
    .locals 6
    .param p1, "result"    # Lcom/facebook/share/widget/GameRequestDialog$Result;

    .prologue
    const/4 v5, 0x0

    .line 194
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 196
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 197
    .local v1, "json":Lorg/json/JSONObject;
    const-string v2, "requestId"

    invoke-virtual {p1}, Lcom/facebook/share/widget/GameRequestDialog$Result;->getRequestId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    const-string v2, "recipientsIds"

    new-instance v3, Lorg/json/JSONArray;

    invoke-virtual {p1}, Lcom/facebook/share/widget/GameRequestDialog$Result;->getRequestRecipients()Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 200
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$402(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v1    # "json":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "ex":Lorg/json/JSONException;
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 203
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$5;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2, v5}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$402(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    goto :goto_0
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 191
    check-cast p1, Lcom/facebook/share/widget/GameRequestDialog$Result;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/facebook/ConnectPlugin$5;->onSuccess(Lcom/facebook/share/widget/GameRequestDialog$Result;)V

    return-void
.end method
