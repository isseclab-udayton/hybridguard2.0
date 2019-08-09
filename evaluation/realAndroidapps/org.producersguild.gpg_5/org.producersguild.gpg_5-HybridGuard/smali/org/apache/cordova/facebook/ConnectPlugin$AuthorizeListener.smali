.class Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;
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
    name = "AuthorizeListener"
.end annotation


# instance fields
.field final fba:Lorg/apache/cordova/facebook/ConnectPlugin;

.field final synthetic this$0:Lorg/apache/cordova/facebook/ConnectPlugin;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V
    .locals 0
    .param p2, "fba"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 262
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    iput-object p2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    .line 265
    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    .line 311
    const-string v0, "ConnectPlugin"

    const-string v1, "cancel"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    const-string v1, "Cancelled"

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    return-void
.end method

.method public onComplete(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "values"    # Landroid/os/Bundle;

    .prologue
    .line 270
    iget-object v5, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v5}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lcom/facebook/android/Facebook;

    move-result-object v5

    invoke-virtual {v5}, Lcom/facebook/android/Facebook;->getAccessToken()Ljava/lang/String;

    move-result-object v2

    .line 271
    .local v2, "token":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v5}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lcom/facebook/android/Facebook;

    move-result-object v5

    invoke-virtual {v5}, Lcom/facebook/android/Facebook;->getAccessExpires()J

    move-result-wide v3

    .line 272
    .local v3, "token_expires":J
    iget-object v5, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v5, v5, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 273
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "access_expires"

    invoke-interface {v5, v6, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 274
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "access_token"

    invoke-interface {v5, v6, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 276
    const-string v5, "ConnectPlugin"

    const-string v6, "authorized"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    new-instance v1, Ljava/lang/Thread;

    new-instance v5, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;

    invoke-direct {v5, p0}, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;-><init>(Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;)V

    invoke-direct {v1, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 297
    .local v1, "t":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 298
    return-void
.end method

.method public onError(Lcom/facebook/android/DialogError;)V
    .locals 3
    .param p1, "e"    # Lcom/facebook/android/DialogError;

    .prologue
    .line 306
    const-string v0, "ConnectPlugin"

    const-string v1, "other error"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

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

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    return-void
.end method

.method public onFacebookError(Lcom/facebook/android/FacebookError;)V
    .locals 3
    .param p1, "e"    # Lcom/facebook/android/FacebookError;

    .prologue
    .line 301
    const-string v0, "ConnectPlugin"

    const-string v1, "facebook error"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

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

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    return-void
.end method
