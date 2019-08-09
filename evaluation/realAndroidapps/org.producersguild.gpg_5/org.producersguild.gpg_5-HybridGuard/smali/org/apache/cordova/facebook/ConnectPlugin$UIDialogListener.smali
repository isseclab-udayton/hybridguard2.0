.class Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Lcom/facebook/android/Facebook$DialogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/facebook/ConnectPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UIDialogListener"
.end annotation


# instance fields
.field final fba:Lorg/apache/cordova/facebook/ConnectPlugin;

.field final synthetic this$0:Lorg/apache/cordova/facebook/ConnectPlugin;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V
    .locals 0
    .param p2, "fba"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 232
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    .line 235
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    .line 254
    const-string v0, "ConnectPlugin"

    const-string v1, "cancel"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    const-string v1, "Cancelled"

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    return-void
.end method

.method public onComplete(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "values"    # Landroid/os/Bundle;

    .prologue
    .line 239
    const-string v0, "ConnectPlugin"

    invoke-virtual {p1}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 241
    return-void
.end method

.method public onError(Lcom/facebook/android/DialogError;)V
    .locals 3
    .param p1, "e"    # Lcom/facebook/android/DialogError;

    .prologue
    .line 249
    const-string v0, "ConnectPlugin"

    const-string v1, "other error"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dialog error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/android/DialogError;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    return-void
.end method

.method public onFacebookError(Lcom/facebook/android/FacebookError;)V
    .locals 3
    .param p1, "e"    # Lcom/facebook/android/FacebookError;

    .prologue
    .line 244
    const-string v0, "ConnectPlugin"

    const-string v1, "facebook error"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Facebook error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/android/FacebookError;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    return-void
.end method
