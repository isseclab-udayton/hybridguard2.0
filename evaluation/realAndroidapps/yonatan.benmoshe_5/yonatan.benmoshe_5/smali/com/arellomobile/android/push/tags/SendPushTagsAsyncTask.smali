.class public Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;
.super Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;
.source "SendPushTagsAsyncTask.java"


# instance fields
.field private mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callBack"    # Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;-><init>(Landroid/content/Context;)V

    .line 22
    iput-object p2, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    .line 23
    return-void
.end method


# virtual methods
.method public onSentTagsError(Lcom/arellomobile/android/push/exception/PushWooshException;)V
    .locals 1
    .param p1, "error"    # Lcom/arellomobile/android/push/exception/PushWooshException;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    invoke-interface {v0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;->onSentTagsError(Lcom/arellomobile/android/push/exception/PushWooshException;)V

    .line 44
    :cond_0
    return-void
.end method

.method public onSentTagsSuccess(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    invoke-interface {v0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;->onSentTagsSuccess(Ljava/util/Map;)V

    .line 37
    :cond_0
    return-void
.end method

.method public taskStarted()V
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->mCallBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    invoke-interface {v0}, Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;->taskStarted()V

    .line 30
    :cond_0
    return-void
.end method
