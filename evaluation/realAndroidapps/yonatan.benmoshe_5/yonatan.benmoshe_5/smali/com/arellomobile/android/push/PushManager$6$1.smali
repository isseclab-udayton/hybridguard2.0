.class Lcom/arellomobile/android/push/PushManager$6$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PushManager$6;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager$6;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$6$1;->this$1:Lcom/arellomobile/android/push/PushManager$6;

    .line 482
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 487
    invoke-static {p1}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendAppOpen(Landroid/content/Context;)V

    .line 488
    return-void
.end method
