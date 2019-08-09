.class Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PackageRemoveReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PackageRemoveReceiver$1;

.field private final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PackageRemoveReceiver$1;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;->this$1:Lcom/arellomobile/android/push/PackageRemoveReceiver$1;

    iput-object p3, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;->val$packageName:Ljava/lang/String;

    .line 36
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    :try_start_0
    iget-object v0, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;->val$packageName:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendAppRemovedData(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v0

    goto :goto_0
.end method
