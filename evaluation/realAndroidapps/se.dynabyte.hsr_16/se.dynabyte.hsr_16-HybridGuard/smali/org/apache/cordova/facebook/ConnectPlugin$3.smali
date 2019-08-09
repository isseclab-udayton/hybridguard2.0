.class Lorg/apache/cordova/facebook/ConnectPlugin$3;
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
        "Lcom/facebook/share/Sharer$Result;",
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
    .line 145
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    .line 156
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    invoke-direct {v0}, Lcom/facebook/FacebookOperationCanceledException;-><init>()V

    .line 157
    .local v0, "e":Lcom/facebook/FacebookOperationCanceledException;
    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 158
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 5
    .param p1, "e"    # Lcom/facebook/FacebookException;

    .prologue
    .line 162
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

    .line 163
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$300(Lorg/apache/cordova/facebook/ConnectPlugin;Lcom/facebook/FacebookException;Lorg/apache/cordova/CallbackContext;)V

    .line 164
    return-void
.end method

.method public onSuccess(Lcom/facebook/share/Sharer$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/facebook/share/Sharer$Result;

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/share/Sharer$Result;->getPostId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$3;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$402(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    .line 152
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 145
    check-cast p1, Lcom/facebook/share/Sharer$Result;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/facebook/ConnectPlugin$3;->onSuccess(Lcom/facebook/share/Sharer$Result;)V

    return-void
.end method
