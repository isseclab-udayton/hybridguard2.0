.class public abstract Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;
.super Landroid/os/AsyncTask;
.source "SendPushTagsAbstractAsyncTask.java"

# interfaces
.implements Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;",
        "Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mError:Lcom/arellomobile/android/push/exception/PushWooshException;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mContext:Landroid/content/Context;

    .line 25
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->doInBackground([Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/util/Map;)Ljava/util/Map;
    .locals 5
    .param p1, "maps"    # [Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 40
    :try_start_0
    array-length v3, p1

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 42
    new-instance v3, Lcom/arellomobile/android/push/exception/PushWooshException;

    const-string v4, "Wrong parameters"

    invoke-direct {v3, v4}, Lcom/arellomobile/android/push/exception/PushWooshException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Lcom/arellomobile/android/push/exception/PushWooshException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Lcom/arellomobile/android/push/exception/PushWooshException;
    iput-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mError:Lcom/arellomobile/android/push/exception/PushWooshException;

    .line 52
    iput-object v2, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mContext:Landroid/content/Context;

    move-object v1, v2

    .line 53
    .end local v0    # "e":Lcom/arellomobile/android/push/exception/PushWooshException;
    :goto_0
    return-object v1

    .line 45
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-static {v3, v4}, Lcom/arellomobile/android/push/PushManager;->sendTagsFromBG(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 46
    .local v1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mContext:Landroid/content/Context;
    :try_end_1
    .catch Lcom/arellomobile/android/push/exception/PushWooshException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->onPostExecute(Ljava/util/Map;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/Map;)V
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
    .line 60
    .local p1, "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 62
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mError:Lcom/arellomobile/android/push/exception/PushWooshException;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->mError:Lcom/arellomobile/android/push/exception/PushWooshException;

    invoke-virtual {p0, v0}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->onSentTagsError(Lcom/arellomobile/android/push/exception/PushWooshException;)V

    .line 70
    :goto_0
    return-void

    .line 68
    :cond_0
    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->onSentTagsSuccess(Ljava/util/Map;)V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 30
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 32
    invoke-virtual {p0}, Lcom/arellomobile/android/push/tags/SendPushTagsAbstractAsyncTask;->taskStarted()V

    .line 33
    return-void
.end method
