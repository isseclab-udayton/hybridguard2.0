.class Lcom/arellomobile/android/push/PushManager$7;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->sendGoalAchieved(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$count:Ljava/lang/Integer;

.field private final synthetic val$goal:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$7;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$7;->val$goal:Ljava/lang/String;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$7;->val$count:Ljava/lang/Integer;

    .line 499
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 501
    new-instance v0, Lcom/arellomobile/android/push/PushManager$7$1;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$7;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$7;->val$goal:Ljava/lang/String;

    iget-object v3, p0, Lcom/arellomobile/android/push/PushManager$7;->val$count:Ljava/lang/Integer;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/arellomobile/android/push/PushManager$7$1;-><init>(Lcom/arellomobile/android/push/PushManager$7;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 510
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 511
    return-void
.end method
