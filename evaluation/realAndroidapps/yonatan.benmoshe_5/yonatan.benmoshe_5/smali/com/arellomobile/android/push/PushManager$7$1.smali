.class Lcom/arellomobile/android/push/PushManager$7$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PushManager$7;

.field private final synthetic val$count:Ljava/lang/Integer;

.field private final synthetic val$goal:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager$7;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$7$1;->this$1:Lcom/arellomobile/android/push/PushManager$7;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$7$1;->val$goal:Ljava/lang/String;

    iput-object p4, p0, Lcom/arellomobile/android/push/PushManager$7$1;->val$count:Ljava/lang/Integer;

    .line 501
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 506
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager$7$1;->val$goal:Ljava/lang/String;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$7$1;->val$count:Ljava/lang/Integer;

    invoke-static {p1, v0, v1}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendGoalAchieved(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 507
    return-void
.end method
