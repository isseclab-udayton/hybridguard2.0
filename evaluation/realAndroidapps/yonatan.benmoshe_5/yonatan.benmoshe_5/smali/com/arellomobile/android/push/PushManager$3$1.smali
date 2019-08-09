.class Lcom/arellomobile/android/push/PushManager$3$1;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/PushManager$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/arellomobile/android/push/PushManager$3;

.field private final synthetic val$location:Landroid/location/Location;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/PushManager$3;Landroid/content/Context;Landroid/location/Location;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager$3$1;->this$1:Lcom/arellomobile/android/push/PushManager$3;

    iput-object p3, p0, Lcom/arellomobile/android/push/PushManager$3$1;->val$location:Landroid/location/Location;

    .line 269
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 275
    :try_start_0
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager$3$1;->val$location:Landroid/location/Location;

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/DeviceFeature2_5;->getNearestZone(Landroid/content/Context;Landroid/location/Location;)Lcom/arellomobile/android/push/data/PushZoneLocation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    :goto_0
    return-void

    .line 276
    :catch_0
    move-exception v0

    goto :goto_0
.end method
