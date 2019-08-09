.class Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1;
.super Lcom/arellomobile/android/push/utils/RegisterBroadcastReceiver;
.source "PushNotifications.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;


# direct methods
.method constructor <init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    .line 68
    invoke-direct {p0}, Lcom/arellomobile/android/push/utils/RegisterBroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onRegisterActionReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    invoke-static {v0, p2}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->access$0(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Landroid/content/Intent;)V

    .line 74
    return-void
.end method
