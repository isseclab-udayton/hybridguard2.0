.class public abstract Lcom/arellomobile/android/push/utils/WorkerTask;
.super Landroid/os/AsyncTask;
.source "WorkerTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/arellomobile/android/push/utils/WorkerTask;->mContext:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/utils/WorkerTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "aVoids"    # [Ljava/lang/Void;

    .prologue
    const/4 v1, 0x0

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/WorkerTask;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/arellomobile/android/push/utils/WorkerTask;->doWork(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    iput-object v1, p0, Lcom/arellomobile/android/push/utils/WorkerTask;->mContext:Landroid/content/Context;

    .line 37
    :goto_0
    return-object v1

    .line 28
    :catch_0
    move-exception v0

    .line 34
    iput-object v1, p0, Lcom/arellomobile/android/push/utils/WorkerTask;->mContext:Landroid/content/Context;

    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    iput-object v1, p0, Lcom/arellomobile/android/push/utils/WorkerTask;->mContext:Landroid/content/Context;

    .line 35
    throw v0
.end method

.method protected abstract doWork(Landroid/content/Context;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
