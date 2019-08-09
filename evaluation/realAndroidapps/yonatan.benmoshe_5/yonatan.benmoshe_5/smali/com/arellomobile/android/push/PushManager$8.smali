.class Lcom/arellomobile/android/push/PushManager$8;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->getRegisterAsyncTask(Landroid/content/Context;Ljava/lang/String;)Landroid/os/AsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arellomobile/android/push/PushManager;

.field private final synthetic val$regId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$8;->this$0:Lcom/arellomobile/android/push/PushManager;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$8;->val$regId:Ljava/lang/String;

    .line 517
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 522
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager$8;->this$0:Lcom/arellomobile/android/push/PushManager;

    invoke-static {v0}, Lcom/arellomobile/android/push/PushManager;->access$3(Lcom/arellomobile/android/push/PushManager;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$8;->val$regId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/arellomobile/android/push/DeviceRegistrar;->registerWithServer(Landroid/content/Context;Ljava/lang/String;)V

    .line 523
    return-void
.end method
