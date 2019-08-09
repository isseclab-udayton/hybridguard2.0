.class Lcom/arellomobile/android/push/PushManager$1;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->sendTags(Landroid/content/Context;Ljava/util/Map;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$callBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$tags:Ljava/util/Map;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$1;->val$callBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$1;->val$tags:Ljava/util/Map;

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 216
    new-instance v0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$1;->val$callBack:Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;

    invoke-direct {v0, v1, v2}, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;-><init>(Landroid/content/Context;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/util/Map;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/arellomobile/android/push/PushManager$1;->val$tags:Ljava/util/Map;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
