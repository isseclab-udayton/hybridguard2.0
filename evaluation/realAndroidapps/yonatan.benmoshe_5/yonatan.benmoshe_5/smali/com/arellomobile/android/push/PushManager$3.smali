.class Lcom/arellomobile/android/push/PushManager$3;
.super Ljava/lang/Object;
.source "PushManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager;->sendLocation(Landroid/content/Context;Landroid/location/Location;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$location:Landroid/location/Location;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/location/Location;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$3;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager$3;->val$location:Landroid/location/Location;

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 269
    new-instance v0, Lcom/arellomobile/android/push/PushManager$3$1;

    iget-object v1, p0, Lcom/arellomobile/android/push/PushManager$3;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager$3;->val$location:Landroid/location/Location;

    invoke-direct {v0, p0, v1, v2}, Lcom/arellomobile/android/push/PushManager$3$1;-><init>(Lcom/arellomobile/android/push/PushManager$3;Landroid/content/Context;Landroid/location/Location;)V

    .line 282
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 283
    return-void
.end method
