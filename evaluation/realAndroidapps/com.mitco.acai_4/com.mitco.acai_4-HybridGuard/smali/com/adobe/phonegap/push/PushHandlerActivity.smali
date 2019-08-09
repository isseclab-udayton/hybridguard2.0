.class public Lcom/adobe/phonegap/push/PushHandlerActivity;
.super Landroid/app/Activity;
.source "PushHandlerActivity.java"

# interfaces
.implements Lcom/adobe/phonegap/push/PushConstants;


# static fields
.field private static LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "PushPlugin_PushHandlerActivity"

    sput-object v0, Lcom/adobe/phonegap/push/PushHandlerActivity;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private forceMainActivityReload()V
    .locals 3

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 60
    .local v1, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 61
    .local v0, "launchIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->startActivity(Landroid/content/Intent;)V

    .line 62
    return-void
.end method

.method private processPushBundle(Z)V
    .locals 4
    .param p1, "isPushPluginActive"    # Z

    .prologue
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 44
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 45
    const-string v3, "pushBundle"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 47
    .local v1, "originalExtras":Landroid/os/Bundle;
    const-string v3, "foreground"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 48
    const-string v3, "coldstart"

    if-eqz p1, :cond_1

    :goto_0
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 49
    const-string v2, "callback"

    const-string v3, "callback"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    invoke-static {v1}, Lcom/adobe/phonegap/push/PushPlugin;->sendExtras(Landroid/os/Bundle;)V

    .line 53
    .end local v1    # "originalExtras":Landroid/os/Bundle;
    :cond_0
    return-void

    .line 48
    .restart local v1    # "originalExtras":Landroid/os/Bundle;
    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    new-instance v0, Lcom/adobe/phonegap/push/GCMIntentService;

    invoke-direct {v0}, Lcom/adobe/phonegap/push/GCMIntentService;-><init>()V

    .line 23
    .local v0, "gcm":Lcom/adobe/phonegap/push/GCMIntentService;
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "notId"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotification(ILjava/lang/String;)V

    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    sget-object v2, Lcom/adobe/phonegap/push/PushHandlerActivity;->LOG_TAG:Ljava/lang/String;

    const-string v3, "onCreate"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    invoke-static {}, Lcom/adobe/phonegap/push/PushPlugin;->isActive()Z

    move-result v1

    .line 28
    .local v1, "isPushPluginActive":Z
    invoke-direct {p0, v1}, Lcom/adobe/phonegap/push/PushHandlerActivity;->processPushBundle(Z)V

    .line 30
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->finish()V

    .line 32
    if-nez v1, :cond_0

    .line 33
    invoke-direct {p0}, Lcom/adobe/phonegap/push/PushHandlerActivity;->forceMainActivityReload()V

    .line 35
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 67
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/adobe/phonegap/push/PushHandlerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 68
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 69
    return-void
.end method
