.class public abstract Lcom/arellomobile/android/push/BasePushMessageReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BasePushMessageReceiver.java"


# static fields
.field public static final JSON_DATA_KEY:Ljava/lang/String; = "pw_data_json_string"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract onMessageReceive(Landroid/content/Intent;)V
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 23
    const-string v2, "notification"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 25
    .local v0, "manager":Landroid/app/NotificationManager;
    invoke-static {p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getMessageId(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/app/NotificationManager;->cancel(I)V

    .line 27
    new-instance v1, Lcom/arellomobile/android/push/PushManager;

    invoke-direct {v1, p1}, Lcom/arellomobile/android/push/PushManager;-><init>(Landroid/content/Context;)V

    .line 28
    .local v1, "pushManager":Lcom/arellomobile/android/push/PushManager;
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "p"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/arellomobile/android/push/PushManager;->sendPushStat(Landroid/content/Context;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p0, p2}, Lcom/arellomobile/android/push/BasePushMessageReceiver;->onMessageReceive(Landroid/content/Intent;)V

    .line 30
    return-void
.end method
