.class public Lcom/arellomobile/android/push/GeoLocationService;
.super Landroid/app/Service;
.source "GeoLocationService.java"


# static fields
.field private static final TEN_METERS:I = 0xa

.field private static final TEN_SECONDS:I = 0x2710

.field private static final TWO_MINUTES:I = 0x1d4c0


# instance fields
.field private mIfUpdating:Z

.field private final mListener:Landroid/location/LocationListener;

.field private mLocationManager:Landroid/location/LocationManager;

.field private mMinDistance:J

.field private mOldLocation:Landroid/location/Location;

.field private final mSyncObject:Ljava/lang/Object;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mSyncObject:Ljava/lang/Object;

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mIfUpdating:Z

    .line 247
    new-instance v0, Lcom/arellomobile/android/push/GeoLocationService$1;

    invoke-direct {v0, p0}, Lcom/arellomobile/android/push/GeoLocationService$1;-><init>(Lcom/arellomobile/android/push/GeoLocationService;)V

    iput-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mListener:Landroid/location/LocationListener;

    .line 25
    return-void
.end method

.method static synthetic access$0(Lcom/arellomobile/android/push/GeoLocationService;Landroid/location/Location;)V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lcom/arellomobile/android/push/GeoLocationService;->updateLocation(Landroid/location/Location;)V

    return-void
.end method

.method static synthetic access$1(Lcom/arellomobile/android/push/GeoLocationService;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mSyncObject:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2(Lcom/arellomobile/android/push/GeoLocationService;Ljava/lang/String;J)Landroid/location/Location;
    .locals 1

    .prologue
    .line 154
    invoke-direct {p0, p1, p2, p3}, Lcom/arellomobile/android/push/GeoLocationService;->requestUpdatesFromProvider(Ljava/lang/String;J)Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/arellomobile/android/push/GeoLocationService;Z)V
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mIfUpdating:Z

    return-void
.end method

.method private initService()V
    .locals 7

    .prologue
    .line 69
    const-string v3, "power"

    invoke-virtual {p0, v3}, Lcom/arellomobile/android/push/GeoLocationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    .line 70
    .local v2, "pm":Landroid/os/PowerManager;
    const/4 v3, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    iput-object v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 71
    iget-object v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 72
    const-string v3, "location"

    invoke-virtual {p0, v3}, Lcom/arellomobile/android/push/GeoLocationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/LocationManager;

    iput-object v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    .line 75
    iget-object v4, p0, Lcom/arellomobile/android/push/GeoLocationService;->mSyncObject:Ljava/lang/Object;

    monitor-enter v4

    .line 77
    :try_start_0
    iget-object v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    iget-object v5, p0, Lcom/arellomobile/android/push/GeoLocationService;->mListener:Landroid/location/LocationListener;

    invoke-virtual {v3, v5}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 79
    const-string v3, "gps"

    const-wide/16 v5, 0xa

    invoke-direct {p0, v3, v5, v6}, Lcom/arellomobile/android/push/GeoLocationService;->requestUpdatesFromProvider(Ljava/lang/String;J)Landroid/location/Location;

    move-result-object v0

    .line 80
    .local v0, "gpsLocation":Landroid/location/Location;
    const-string v3, "network"

    const-wide/16 v5, 0xa

    invoke-direct {p0, v3, v5, v6}, Lcom/arellomobile/android/push/GeoLocationService;->requestUpdatesFromProvider(Ljava/lang/String;J)Landroid/location/Location;

    move-result-object v1

    .line 75
    .local v1, "networkLocation":Landroid/location/Location;
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/arellomobile/android/push/GeoLocationService;->getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/arellomobile/android/push/GeoLocationService;->updateLocation(Landroid/location/Location;)V

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 75
    .end local v0    # "gpsLocation":Landroid/location/Location;
    .end local v1    # "networkLocation":Landroid/location/Location;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 89
    .restart local v0    # "gpsLocation":Landroid/location/Location;
    .restart local v1    # "networkLocation":Landroid/location/Location;
    :cond_1
    if-eqz v0, :cond_2

    .line 91
    invoke-direct {p0, v0}, Lcom/arellomobile/android/push/GeoLocationService;->updateLocation(Landroid/location/Location;)V

    goto :goto_0

    .line 93
    :cond_2
    if-eqz v1, :cond_0

    .line 95
    invoke-direct {p0, v1}, Lcom/arellomobile/android/push/GeoLocationService;->updateLocation(Landroid/location/Location;)V

    goto :goto_0
.end method

.method private isSameProvider(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "provider1"    # Ljava/lang/String;
    .param p2, "provider2"    # Ljava/lang/String;

    .prologue
    .line 240
    if-nez p1, :cond_1

    .line 242
    if-nez p2, :cond_0

    const/4 v0, 0x1

    .line 244
    :goto_0
    return v0

    .line 242
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 244
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private requestUpdatesFromProvider(Ljava/lang/String;J)Landroid/location/Location;
    .locals 8
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "distance"    # J

    .prologue
    .line 156
    iput-wide p2, p0, Lcom/arellomobile/android/push/GeoLocationService;->mMinDistance:J

    .line 158
    const/4 v7, 0x0

    .line 161
    .local v7, "location":Landroid/location/Location;
    :try_start_0
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    const-wide/16 v2, 0x2710

    long-to-float v4, p2

    iget-object v5, p0, Lcom/arellomobile/android/push/GeoLocationService;->mListener:Landroid/location/LocationListener;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 164
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 171
    :cond_0
    :goto_0
    return-object v7

    .line 167
    :catch_0
    move-exception v6

    .line 169
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Check ACCESS_FINE_LOCATION permission"

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private updateLocation(Landroid/location/Location;)V
    .locals 5
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 101
    iget-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService;->mSyncObject:Ljava/lang/Object;

    monitor-enter v2

    .line 103
    :try_start_0
    iget-boolean v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mIfUpdating:Z

    if-nez v1, :cond_1

    invoke-static {p0}, Lcom/google/android/gcm/GCMRegistrar;->isRegisteredOnServer(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 105
    iget-object v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mOldLocation:Landroid/location/Location;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mOldLocation:Landroid/location/Location;

    invoke-virtual {p1, v1}, Landroid/location/Location;->distanceTo(Landroid/location/Location;)F

    move-result v1

    iget-wide v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mMinDistance:J

    long-to-float v3, v3

    cmpg-float v1, v1, v3

    if-gez v1, :cond_0

    .line 107
    monitor-exit v2

    .line 152
    :goto_0
    return-void

    .line 110
    :cond_0
    iput-object p1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mOldLocation:Landroid/location/Location;

    .line 112
    iget-object v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    iget-object v3, p0, Lcom/arellomobile/android/push/GeoLocationService;->mListener:Landroid/location/LocationListener;

    invoke-virtual {v1, v3}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 114
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mIfUpdating:Z

    .line 116
    new-instance v0, Lcom/arellomobile/android/push/GeoLocationService$2;

    invoke-direct {v0, p0, p0, p1}, Lcom/arellomobile/android/push/GeoLocationService$2;-><init>(Lcom/arellomobile/android/push/GeoLocationService;Landroid/content/Context;Landroid/location/Location;)V

    .line 149
    .local v0, "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    invoke-static {v0}, Lcom/arellomobile/android/push/utils/executor/ExecutorHelper;->executeAsyncTask(Landroid/os/AsyncTask;)V

    .line 101
    .end local v0    # "task":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    :cond_1
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method protected getBetterLocation(Landroid/location/Location;Landroid/location/Location;)Landroid/location/Location;
    .locals 14
    .param p1, "newLocation"    # Landroid/location/Location;
    .param p2, "currentBestLocation"    # Landroid/location/Location;

    .prologue
    .line 186
    if-nez p2, :cond_1

    .line 232
    .end local p1    # "newLocation":Landroid/location/Location;
    :cond_0
    :goto_0
    return-object p1

    .line 193
    .restart local p1    # "newLocation":Landroid/location/Location;
    :cond_1
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getTime()J

    move-result-wide v12

    sub-long v8, v10, v12

    .line 194
    .local v8, "timeDelta":J
    const-wide/32 v10, 0x1d4c0

    cmp-long v10, v8, v10

    if-lez v10, :cond_2

    const/4 v6, 0x1

    .line 195
    .local v6, "isSignificantlyNewer":Z
    :goto_1
    const-wide/32 v10, -0x1d4c0

    cmp-long v10, v8, v10

    if-gez v10, :cond_3

    const/4 v7, 0x1

    .line 196
    .local v7, "isSignificantlyOlder":Z
    :goto_2
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-lez v10, :cond_4

    const/4 v4, 0x1

    .line 200
    .local v4, "isNewer":Z
    :goto_3
    if-nez v6, :cond_0

    .line 205
    if-eqz v7, :cond_5

    move-object/from16 p1, p2

    .line 207
    goto :goto_0

    .line 194
    .end local v4    # "isNewer":Z
    .end local v6    # "isSignificantlyNewer":Z
    .end local v7    # "isSignificantlyOlder":Z
    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    .line 195
    .restart local v6    # "isSignificantlyNewer":Z
    :cond_3
    const/4 v7, 0x0

    goto :goto_2

    .line 196
    .restart local v7    # "isSignificantlyOlder":Z
    :cond_4
    const/4 v4, 0x0

    goto :goto_3

    .line 211
    .restart local v4    # "isNewer":Z
    :cond_5
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v10

    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getAccuracy()F

    move-result v11

    sub-float/2addr v10, v11

    float-to-int v0, v10

    .line 212
    .local v0, "accuracyDelta":I
    if-lez v0, :cond_8

    const/4 v2, 0x1

    .line 213
    .local v2, "isLessAccurate":Z
    :goto_4
    if-gez v0, :cond_9

    const/4 v3, 0x1

    .line 214
    .local v3, "isMoreAccurate":Z
    :goto_5
    const/16 v10, 0xc8

    if-le v0, v10, :cond_a

    const/4 v5, 0x1

    .line 217
    .local v5, "isSignificantlyLessAccurate":Z
    :goto_6
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lcom/arellomobile/android/push/GeoLocationService;->isSameProvider(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 220
    .local v1, "isFromSameProvider":Z
    if-nez v3, :cond_0

    .line 224
    if-eqz v4, :cond_6

    if-eqz v2, :cond_0

    .line 228
    :cond_6
    if-eqz v4, :cond_7

    if-nez v5, :cond_7

    if-nez v1, :cond_0

    :cond_7
    move-object/from16 p1, p2

    .line 232
    goto :goto_0

    .line 212
    .end local v1    # "isFromSameProvider":Z
    .end local v2    # "isLessAccurate":Z
    .end local v3    # "isMoreAccurate":Z
    .end local v5    # "isSignificantlyLessAccurate":Z
    :cond_8
    const/4 v2, 0x0

    goto :goto_4

    .line 213
    .restart local v2    # "isLessAccurate":Z
    :cond_9
    const/4 v3, 0x0

    goto :goto_5

    .line 214
    .restart local v3    # "isMoreAccurate":Z
    :cond_a
    const/4 v5, 0x0

    goto :goto_6
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 55
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Lcom/arellomobile/android/push/GeoLocationService;->mListener:Landroid/location/LocationListener;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 56
    iget-object v0, p0, Lcom/arellomobile/android/push/GeoLocationService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 57
    iput-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 58
    iput-object v2, p0, Lcom/arellomobile/android/push/GeoLocationService;->mLocationManager:Landroid/location/LocationManager;

    .line 59
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 43
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    .line 45
    invoke-direct {p0}, Lcom/arellomobile/android/push/GeoLocationService;->initService()V

    .line 47
    const/4 v0, 0x1

    return v0
.end method
