.class Lorg/apache/cordova/Notification$2$3;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/Notification$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/Notification$2;


# direct methods
.method constructor <init>(Lorg/apache/cordova/Notification$2;)V
    .locals 0

    .prologue
    .line 259
    iput-object p1, p0, Lorg/apache/cordova/Notification$2$3;->this$1:Lorg/apache/cordova/Notification$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 261
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 262
    iget-object v0, p0, Lorg/apache/cordova/Notification$2$3;->this$1:Lorg/apache/cordova/Notification$2;

    iget-object v0, v0, Lorg/apache/cordova/Notification$2;->val$notification:Lorg/apache/cordova/Notification;

    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    const/4 v3, 0x3

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    iget-object v2, p0, Lorg/apache/cordova/Notification$2$3;->this$1:Lorg/apache/cordova/Notification$2;

    iget-object v2, v2, Lorg/apache/cordova/Notification$2;->val$callbackId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/Notification;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 263
    return-void
.end method
