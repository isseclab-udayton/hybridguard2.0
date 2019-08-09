.class Lcom/arellomobile/android/push/PackageRemoveReceiver$1;
.super Ljava/lang/Object;
.source "PackageRemoveReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PackageRemoveReceiver;->sendPackageRemoved(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arellomobile/android/push/PackageRemoveReceiver;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PackageRemoveReceiver;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->this$0:Lcom/arellomobile/android/push/PackageRemoveReceiver;

    iput-object p2, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->val$packageName:Ljava/lang/String;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 36
    new-instance v0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;

    iget-object v1, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/arellomobile/android/push/PackageRemoveReceiver$1;->val$packageName:Ljava/lang/String;

    invoke-direct {v0, p0, v1, v2}, Lcom/arellomobile/android/push/PackageRemoveReceiver$1$1;-><init>(Lcom/arellomobile/android/push/PackageRemoveReceiver$1;Landroid/content/Context;Ljava/lang/String;)V

    .line 49
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 50
    return-void
.end method
