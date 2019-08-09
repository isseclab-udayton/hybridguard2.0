.class Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$2;
.super Lcom/arellomobile/android/push/BasePushMessageReceiver;
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
    iput-object p1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$2;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    .line 652
    invoke-direct {p0}, Lcom/arellomobile/android/push/BasePushMessageReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected onMessageReceive(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 657
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$2;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    const-string v1, "pw_data_json_string"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->access$1(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Ljava/lang/String;)V

    .line 658
    return-void
.end method
