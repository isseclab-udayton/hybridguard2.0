.class Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;
.super Ljava/lang/Object;
.source "PushNotifications.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnMessageReceive(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

.field private final synthetic val$jsStatement:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iput-object p2, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;->val$jsStatement:Ljava/lang/String;

    .line 643
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 646
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iget-object v0, v0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;->val$jsStatement:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 647
    return-void
.end method
