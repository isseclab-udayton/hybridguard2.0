.class Lcom/arellomobile/android/push/PushManager$6;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->sendAppOpen(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arellomobile/android/push/PushManager;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$6;->this$0:Lcom/arellomobile/android/push/PushManager;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$6;->val$context:Landroid/content/Context;

    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 482
    new-instance v0, Lcom/arellomobile/android/push/PushManager$6$1;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$6;->val$context:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/arellomobile/android/push/PushManager$6$1;-><init>(Lcom/arellomobile/android/push/PushManager$6;Landroid/content/Context;)V

    .line 491
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 492
    return-void
.end method
