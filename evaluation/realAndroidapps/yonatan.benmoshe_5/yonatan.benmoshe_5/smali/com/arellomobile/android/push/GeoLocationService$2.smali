.class Lcom/arellomobile/android/push/GeoLocationService$2;
.super Lcom/arellomobile/android/push/utils/WorkerTask;
.source "GeoLocationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arellomobile/android/push/GeoLocationService;->updateLocation(Landroid/location/Location;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field protected mZoneLocation:Lcom/arellomobile/android/push/data/PushZoneLocation;

.field final synthetic this$0:Lcom/arellomobile/android/push/GeoLocationService;

.field private final synthetic val$location:Landroid/location/Location;


# direct methods
.method constructor <init>(Lcom/arellomobile/android/push/GeoLocationService;Landroid/content/Context;Landroid/location/Location;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->this$0:Lcom/arellomobile/android/push/GeoLocationService;

    iput-object p3, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->val$location:Landroid/location/Location;

    .line 116
    invoke-direct {p0, p2}, Lcom/arellomobile/android/push/utils/WorkerTask;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected doWork(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->val$location:Landroid/location/Location;

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/DeviceFeature2_5;->getNearestZone(Landroid/content/Context;Landroid/location/Location;)Lcom/arellomobile/android/push/data/PushZoneLocation;

    move-result-object v0

    iput-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->mZoneLocation:Lcom/arellomobile/android/push/data/PushZoneLocation;

    .line 124
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/GeoLocationService$2;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 129
    invoke-super {p0, p1}, Lcom/arellomobile/android/push/utils/WorkerTask;->onPostExecute(Ljava/lang/Object;)V

    .line 131
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->this$0:Lcom/arellomobile/android/push/GeoLocationService;

    invoke-static {v2}, Lcom/arellomobile/android/push/GeoLocationService;->access$1(Lcom/arellomobile/android/push/GeoLocationService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 133
    const-wide/16 v0, 0x0

    .line 135
    .local v0, "distance":J
    :try_start_0
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->mZoneLocation:Lcom/arellomobile/android/push/data/PushZoneLocation;

    if-eqz v2, :cond_0

    .line 137
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->mZoneLocation:Lcom/arellomobile/android/push/data/PushZoneLocation;

    invoke-virtual {v2}, Lcom/arellomobile/android/push/data/PushZoneLocation;->getDistanceTo()J

    move-result-wide v0

    .line 140
    :cond_0
    const-wide/16 v4, 0xa

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 142
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->this$0:Lcom/arellomobile/android/push/GeoLocationService;

    const-string v4, "gps"

    invoke-static {v2, v4, v0, v1}, Lcom/arellomobile/android/push/GeoLocationService;->access$2(Lcom/arellomobile/android/push/GeoLocationService;Ljava/lang/String;J)Landroid/location/Location;

    .line 143
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->this$0:Lcom/arellomobile/android/push/GeoLocationService;

    const-string v4, "network"

    invoke-static {v2, v4, v0, v1}, Lcom/arellomobile/android/push/GeoLocationService;->access$2(Lcom/arellomobile/android/push/GeoLocationService;Ljava/lang/String;J)Landroid/location/Location;

    .line 145
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService$2;->this$0:Lcom/arellomobile/android/push/GeoLocationService;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/arellomobile/android/push/GeoLocationService;->access$3(Lcom/arellomobile/android/push/GeoLocationService;Z)V

    .line 131
    monitor-exit v3

    .line 147
    return-void

    .line 131
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
