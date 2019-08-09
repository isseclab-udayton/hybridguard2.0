.class public abstract Lcom/arellomobile/android/push/utils/RegisterBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "RegisterBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/arellomobile/android/push/utils/RegisterBroadcastReceiver;->onRegisterActionReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 20
    invoke-static {p1}, Lcom/arellomobile/android/push/utils/GeneralUtils;->checkStickyBroadcastPermissions(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.arellomobile.android.push.REGISTER_BROAD_CAST_ACTION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->removeStickyBroadcast(Landroid/content/Intent;)V

    .line 24
    :cond_0
    return-void
.end method

.method protected abstract onRegisterActionReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end method
