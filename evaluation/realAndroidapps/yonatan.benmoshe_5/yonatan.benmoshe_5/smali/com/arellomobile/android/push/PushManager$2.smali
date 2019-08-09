.class Lcom/arellomobile/android/push/PushManager$2;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->getTagsAsync(Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$2;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$2;->val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 241
    new-instance v0, Lcom/arellomobile/android/push/PushManager$2$1;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$2;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$2;->val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    invoke-direct {v0, p0, v1, v2}, Lcom/arellomobile/android/push/PushManager$2$1;-><init>(Lcom/arellomobile/android/push/PushManager$2;Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V

    .line 256
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 257
    return-void
.end method
