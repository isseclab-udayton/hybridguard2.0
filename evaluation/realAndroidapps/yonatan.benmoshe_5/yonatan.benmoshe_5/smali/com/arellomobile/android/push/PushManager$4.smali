.class Lcom/arellomobile/android/push/PushManager$4;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->registerOnPushWoosh(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arellomobile/android/push/PushManager;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$regId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$4;->this$0:Lcom/arellomobile/android/push/PushManager;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$4;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$4;->val$regId:Ljava/lang/String;

    .line 448
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 451
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager$4;->this$0:Lcom/arellomobile/android/push/PushManager;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$4;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$4;->val$regId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/arellomobile/android/push/PushManager;->access$0(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)Landroid/os/AsyncTask;

    move-result-object v0

    invoke-static {v0}, Lcom/arellomobile/android/push/PushManager;->access$1(Landroid/os/AsyncTask;)V

    .line 453
    invoke-static {}, Lcom/arellomobile/android/push/PushManager;->access$2()Landroid/os/AsyncTask;

    move-result-object v0

    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 454
    return-void
.end method
