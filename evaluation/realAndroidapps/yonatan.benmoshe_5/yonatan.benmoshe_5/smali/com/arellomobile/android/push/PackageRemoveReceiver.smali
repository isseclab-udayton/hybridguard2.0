.class public Lcom/arellomobile/android/push/PackageRemoveReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PackageRemoveReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private sendPackageRemoved(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 34
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;-><init>(Lcom/arellomobile/android/push/PackageRemoveReceiver;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 52
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 19
    const-string v2, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 29
    :cond_0
    :goto_0
    return-void

    .line 22
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 23
    .local v1, "uri":Landroid/net/Uri;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "pkg":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_0

    .line 28
    invoke-direct {p0, p1, v0}, Lcom/arellomobile/android/push/PackageRemoveReceiver;->sendPackageRemoved(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 23
    .end local v0    # "pkg":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method
