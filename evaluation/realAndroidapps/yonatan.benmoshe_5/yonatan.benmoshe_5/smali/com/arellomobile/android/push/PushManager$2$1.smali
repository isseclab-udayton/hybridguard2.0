.class Lcom/arellomobile/android/push/PushManager$2$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PushManager$2;

.field private final synthetic val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager$2;Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$2$1;->this$1:Lcom/arellomobile/android/push/PushManager$2;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$2$1;->val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    .line 241
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 248
    :try_start_0
    invoke-static {p1}, Lcom/arellomobile/android/push/DeviceFeature2_5;->getTags(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 249
    .local v1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$2$1;->val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    invoke-interface {v2, v1}, Lcom/arellomobile/android/push/PushManager$GetTagsListener;->onTagsReceived(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v1    # "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$2$1;->val$listener:Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    invoke-interface {v2, v0}, Lcom/arellomobile/android/push/PushManager$GetTagsListener;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method
