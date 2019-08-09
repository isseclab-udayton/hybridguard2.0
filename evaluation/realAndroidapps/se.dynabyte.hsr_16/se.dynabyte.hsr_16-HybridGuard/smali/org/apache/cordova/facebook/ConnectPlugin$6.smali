.class Lorg/apache/cordova/facebook/ConnectPlugin$6;
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
        "Lcom/facebook/share/widget/AppInviteDialog$Result;",
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
    .line 222
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    .line 244
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    invoke-direct {v0}, Lcom/facebook/FacebookOperationCanceledException;-><init>()V

    .line 245
    .local v0, "e":Lcom/facebook/FacebookOperationCanceledException;
    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 246
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 5
    .param p1, "e"    # Lcom/facebook/FacebookException;

    .prologue
    .line 250
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

    .line 251
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 252
    return-void
.end method

.method public onSuccess(Lcom/facebook/share/widget/AppInviteDialog$Result;)V
    .locals 7
    .param p1, "result"    # Lcom/facebook/share/widget/AppInviteDialog$Result;

    .prologue
    const/4 v6, 0x0

    .line 225
    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v4}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 227
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 228
    .local v2, "json":Lorg/json/JSONObject;
    invoke-virtual {p1}, Lcom/facebook/share/widget/AppInviteDialog$Result;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 229
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 230
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$500(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 235
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 236
    .local v1, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v4}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 237
    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v4, v6}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$402(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    .line 240
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    :goto_1
    return-void

    .line 233
    .restart local v0    # "bundle":Landroid/os/Bundle;
    .restart local v2    # "json":Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v4}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 234
    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$6;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$402(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 222
    check-cast p1, Lcom/facebook/share/widget/AppInviteDialog$Result;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/facebook/ConnectPlugin$6;->onSuccess(Lcom/facebook/share/widget/AppInviteDialog$Result;)V

    return-void
.end method
