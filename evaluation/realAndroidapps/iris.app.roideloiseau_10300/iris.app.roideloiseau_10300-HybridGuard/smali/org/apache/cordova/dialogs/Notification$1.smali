.class Lorg/apache/cordova/dialogs/Notification$1;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/dialogs/Notification;->beep(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/dialogs/Notification;

.field final synthetic val$count:J


# direct methods
.method constructor <init>(Lorg/apache/cordova/dialogs/Notification;J)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/dialogs/Notification;

    .prologue
    .line 130
    iput-object p1, p0, Lorg/apache/cordova/dialogs/Notification$1;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iput-wide p2, p0, Lorg/apache/cordova/dialogs/Notification$1;->val$count:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x64

    .line 132
    const/4 v5, 0x2

    invoke-static {v5}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v4

    .line 133
    .local v4, "ringtone":Landroid/net/Uri;
    iget-object v5, p0, Lorg/apache/cordova/dialogs/Notification$1;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iget-object v5, v5, Lorg/apache/cordova/dialogs/Notification;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v4}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v1

    .line 136
    .local v1, "notification":Landroid/media/Ringtone;
    if-eqz v1, :cond_1

    .line 137
    const-wide/16 v2, 0x0

    .local v2, "i":J
    :goto_0
    iget-wide v8, p0, Lorg/apache/cordova/dialogs/Notification$1;->val$count:J

    cmp-long v5, v2, v8

    if-gez v5, :cond_1

    .line 138
    invoke-virtual {v1}, Landroid/media/Ringtone;->play()V

    .line 139
    const-wide/16 v6, 0x1388

    .line 140
    .local v6, "timeout":J
    :goto_1
    invoke-virtual {v1}, Landroid/media/Ringtone;->isPlaying()Z

    move-result v5

    if-eqz v5, :cond_0

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 141
    sub-long/2addr v6, v10

    .line 143
    const-wide/16 v8, 0x64

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 137
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    goto :goto_0

    .line 150
    .end local v2    # "i":J
    .end local v6    # "timeout":J
    :cond_1
    return-void
.end method
