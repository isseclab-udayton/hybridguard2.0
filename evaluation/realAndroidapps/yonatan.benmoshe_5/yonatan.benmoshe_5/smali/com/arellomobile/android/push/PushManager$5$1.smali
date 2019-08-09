.class Lcom/arellomobile/android/push/PushManager$5$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PushManager$5;

.field private final synthetic val$hash:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager$5;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$5$1;->this$1:Lcom/arellomobile/android/push/PushManager$5;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$5$1;->val$hash:Ljava/lang/String;

    .line 463
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 468
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager$5$1;->val$hash:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendPushStat(Landroid/content/Context;Ljava/lang/String;)V

    .line 469
    return-void
.end method
