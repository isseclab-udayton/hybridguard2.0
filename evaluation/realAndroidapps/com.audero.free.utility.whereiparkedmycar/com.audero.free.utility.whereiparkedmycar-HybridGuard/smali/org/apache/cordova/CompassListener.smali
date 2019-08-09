.class public Lorg/apache/cordova/CompassListener;
.super Lorg/apache/cordova/api/Plugin;
.source "CompassListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field public static ERROR_FAILED_TO_START:I

.field public static RUNNING:I

.field public static STARTING:I

.field public static STOPPED:I


# instance fields
.field public TIMEOUT:J

.field accuracy:I

.field heading:F

.field lastAccessTime:J

.field mSensor:Landroid/hardware/Sensor;

.field private sensorManager:Landroid/hardware/SensorManager;

.field status:I

.field timeStamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/CompassListener;->STOPPED:I

    .line 42
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/CompassListener;->STARTING:I

    .line 43
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/CompassListener;->RUNNING:I

    .line 44
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/CompassListener;->ERROR_FAILED_TO_START:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 46
    const-wide/16 v0, 0x7530

    iput-wide v0, p0, Lorg/apache/cordova/CompassListener;->TIMEOUT:J

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/CompassListener;->heading:F

    .line 62
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/CompassListener;->timeStamp:J

    .line 63
    sget v0, Lorg/apache/cordova/CompassListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/CompassListener;->setStatus(I)V

    .line 64
    return-void
.end method

.method private getCompassHeading()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 291
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 294
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "magneticHeading"

    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->getHeading()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 295
    const-string v1, "trueHeading"

    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->getHeading()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 298
    const-string v1, "headingAccuracy"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 299
    const-string v1, "timestamp"

    iget-wide v2, p0, Lorg/apache/cordova/CompassListener;->timeStamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    :goto_0
    return-object v0

    .line 300
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 282
    iput p1, p0, Lorg/apache/cordova/CompassListener;->status:I

    .line 283
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 86
    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 87
    .local v6, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v5, ""

    .line 90
    .local v5, "result":Ljava/lang/String;
    :try_start_0
    const-string v9, "start"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 91
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->start()I

    .line 133
    :goto_0
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v9, v6, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 136
    :goto_1
    return-object v9

    .line 93
    :cond_0
    const-string v9, "stop"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 94
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->stop()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 136
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v10, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 96
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    :try_start_1
    const-string v9, "getStatus"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 97
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->getStatus()I

    move-result v1

    .line 98
    .local v1, "i":I
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v9, v6, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_1

    .line 100
    .end local v1    # "i":I
    :cond_2
    const-string v9, "getHeading"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 102
    iget v9, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v10, Lorg/apache/cordova/CompassListener;->RUNNING:I

    if-eq v9, v10, :cond_5

    .line 103
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->start()I

    move-result v4

    .line 104
    .local v4, "r":I
    sget v9, Lorg/apache/cordova/CompassListener;->ERROR_FAILED_TO_START:I

    if-ne v4, v9, :cond_3

    .line 105
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v10, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    sget v11, Lorg/apache/cordova/CompassListener;->ERROR_FAILED_TO_START:I

    invoke-direct {v9, v10, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_1

    .line 108
    :cond_3
    const-wide/16 v7, 0x7d0

    .line 109
    .local v7, "timeout":J
    :goto_2
    iget v9, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v10, Lorg/apache/cordova/CompassListener;->STARTING:I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    if-ne v9, v10, :cond_4

    const-wide/16 v9, 0x0

    cmp-long v9, v7, v9

    if-lez v9, :cond_4

    .line 110
    const-wide/16 v9, 0x64

    sub-long/2addr v7, v9

    .line 112
    const-wide/16 v9, 0x64

    :try_start_2
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 113
    :catch_1
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 117
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_4
    const-wide/16 v9, 0x0

    cmp-long v9, v7, v9

    if-nez v9, :cond_5

    .line 118
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v10, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    sget v11, Lorg/apache/cordova/CompassListener;->ERROR_FAILED_TO_START:I

    invoke-direct {v9, v10, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_1

    .line 121
    .end local v4    # "r":I
    .end local v7    # "timeout":J
    :cond_5
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {p0}, Lorg/apache/cordova/CompassListener;->getCompassHeading()Lorg/json/JSONObject;

    move-result-object v10

    invoke-direct {v9, v6, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto :goto_1

    .line 123
    :cond_6
    const-string v9, "setTimeout"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 124
    const/4 v9, 0x0

    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v9

    invoke-virtual {p0, v9, v10}, Lorg/apache/cordova/CompassListener;->setTimeout(J)V

    goto/16 :goto_0

    .line 126
    :cond_7
    const-string v9, "getTimeout"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 127
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->getTimeout()J

    move-result-wide v2

    .line 128
    .local v2, "l":J
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    long-to-float v10, v2

    invoke-direct {v9, v6, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;F)V

    goto/16 :goto_1

    .line 131
    .end local v2    # "l":J
    :cond_8
    new-instance v9, Lorg/apache/cordova/api/PluginResult;

    sget-object v10, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v9, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_1
.end method

.method public getHeading()F
    .locals 2

    .prologue
    .line 255
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/CompassListener;->lastAccessTime:J

    .line 256
    iget v0, p0, Lorg/apache/cordova/CompassListener;->heading:F

    return v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 246
    iget v0, p0, Lorg/apache/cordova/CompassListener;->status:I

    return v0
.end method

.method public getTimeout()J
    .locals 2

    .prologue
    .line 274
    iget-wide v0, p0, Lorg/apache/cordova/CompassListener;->TIMEOUT:J

    return-wide v0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 147
    const-string v1, "getStatus"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 159
    :cond_0
    :goto_0
    return v0

    .line 150
    :cond_1
    const-string v1, "getHeading"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 152
    iget v1, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v2, Lorg/apache/cordova/CompassListener;->RUNNING:I

    if-eq v1, v2, :cond_0

    .line 159
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 156
    :cond_3
    const-string v1, "getTimeout"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 217
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->stop()V

    .line 167
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 5
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 227
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v0, v1, v2

    .line 230
    .local v0, "heading":F
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/apache/cordova/CompassListener;->timeStamp:J

    .line 231
    iput v0, p0, Lorg/apache/cordova/CompassListener;->heading:F

    .line 232
    sget v1, Lorg/apache/cordova/CompassListener;->RUNNING:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/CompassListener;->setStatus(I)V

    .line 235
    iget-wide v1, p0, Lorg/apache/cordova/CompassListener;->timeStamp:J

    iget-wide v3, p0, Lorg/apache/cordova/CompassListener;->lastAccessTime:J

    sub-long/2addr v1, v3

    iget-wide v3, p0, Lorg/apache/cordova/CompassListener;->TIMEOUT:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 236
    invoke-virtual {p0}, Lorg/apache/cordova/CompassListener;->stop()V

    .line 238
    :cond_0
    return-void
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 73
    invoke-super {p0, p1}, Lorg/apache/cordova/api/Plugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 74
    invoke-interface {p1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/apache/cordova/CompassListener;->sensorManager:Landroid/hardware/SensorManager;

    .line 75
    return-void
.end method

.method public setTimeout(J)V
    .locals 0
    .param p1, "timeout"    # J

    .prologue
    .line 265
    iput-wide p1, p0, Lorg/apache/cordova/CompassListener;->TIMEOUT:J

    .line 266
    return-void
.end method

.method public start()I
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 181
    iget v1, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v2, Lorg/apache/cordova/CompassListener;->RUNNING:I

    if-eq v1, v2, :cond_0

    iget v1, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v2, Lorg/apache/cordova/CompassListener;->STARTING:I

    if-ne v1, v2, :cond_1

    .line 182
    :cond_0
    iget v1, p0, Lorg/apache/cordova/CompassListener;->status:I

    .line 202
    :goto_0
    return v1

    .line 187
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/CompassListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v3}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 190
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 191
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Sensor;

    iput-object v1, p0, Lorg/apache/cordova/CompassListener;->mSensor:Landroid/hardware/Sensor;

    .line 192
    iget-object v1, p0, Lorg/apache/cordova/CompassListener;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lorg/apache/cordova/CompassListener;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 193
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/apache/cordova/CompassListener;->lastAccessTime:J

    .line 194
    sget v1, Lorg/apache/cordova/CompassListener;->STARTING:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/CompassListener;->setStatus(I)V

    .line 202
    :goto_1
    iget v1, p0, Lorg/apache/cordova/CompassListener;->status:I

    goto :goto_0

    .line 199
    :cond_2
    sget v1, Lorg/apache/cordova/CompassListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/CompassListener;->setStatus(I)V

    goto :goto_1
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 209
    iget v0, p0, Lorg/apache/cordova/CompassListener;->status:I

    sget v1, Lorg/apache/cordova/CompassListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 210
    iget-object v0, p0, Lorg/apache/cordova/CompassListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 212
    :cond_0
    sget v0, Lorg/apache/cordova/CompassListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/CompassListener;->setStatus(I)V

    .line 213
    return-void
.end method
