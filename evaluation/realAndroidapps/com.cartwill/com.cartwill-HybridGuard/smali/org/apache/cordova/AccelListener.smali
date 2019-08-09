.class public Lorg/apache/cordova/AccelListener;
.super Lorg/apache/cordova/api/Plugin;
.source "AccelListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field public static ERROR_FAILED_TO_START:I

.field public static RUNNING:I

.field public static STARTING:I

.field public static STOPPED:I


# instance fields
.field private accuracy:I

.field private callbackId:Ljava/lang/String;

.field private mSensor:Landroid/hardware/Sensor;

.field private sensorManager:Landroid/hardware/SensorManager;

.field private status:I

.field private timestamp:J

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    .line 42
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/AccelListener;->STARTING:I

    .line 43
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/AccelListener;->RUNNING:I

    .line 44
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/AccelListener;->accuracy:I

    .line 60
    iput v1, p0, Lorg/apache/cordova/AccelListener;->x:F

    .line 61
    iput v1, p0, Lorg/apache/cordova/AccelListener;->y:F

    .line 62
    iput v1, p0, Lorg/apache/cordova/AccelListener;->z:F

    .line 63
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    .line 64
    sget v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 65
    return-void
.end method

.method private fail(ILjava/lang/String;)V
    .locals 4
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 230
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 232
    .local v2, "errorObj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "code"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 233
    const-string v3, "message"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    :goto_0
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v3, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 238
    .local v1, "err":Lorg/apache/cordova/api/PluginResult;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 240
    iget-object v3, p0, Lorg/apache/cordova/AccelListener;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v1, v3}, Lorg/apache/cordova/AccelListener;->error(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 241
    return-void

    .line 234
    .end local v1    # "err":Lorg/apache/cordova/api/PluginResult;
    :catch_0
    move-exception v0

    .line 235
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private getAccelerationJSON()Lorg/json/JSONObject;
    .locals 5

    .prologue
    .line 255
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .local v1, "r":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "x"

    iget v3, p0, Lorg/apache/cordova/AccelListener;->x:F

    float-to-double v3, v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 258
    const-string v2, "y"

    iget v3, p0, Lorg/apache/cordova/AccelListener;->y:F

    float-to-double v3, v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 259
    const-string v2, "z"

    iget v3, p0, Lorg/apache/cordova/AccelListener;->z:F

    float-to-double v3, v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 260
    const-string v2, "timestamp"

    iget-wide v3, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    :goto_0
    return-object v1

    .line 261
    :catch_0
    move-exception v0

    .line 262
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 252
    iput p1, p0, Lorg/apache/cordova/AccelListener;->status:I

    .line 253
    return-void
.end method

.method private start()I
    .locals 11

    .prologue
    const-wide/16 v9, 0x64

    const-wide/16 v7, 0x0

    .line 131
    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v5, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-eq v4, v5, :cond_0

    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v5, Lorg/apache/cordova/AccelListener;->STARTING:I

    if-ne v4, v5, :cond_1

    .line 132
    :cond_0
    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    .line 165
    :goto_0
    return v4

    .line 135
    :cond_1
    sget v4, Lorg/apache/cordova/AccelListener;->STARTING:I

    invoke-direct {p0, v4}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 138
    iget-object v4, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    .line 141
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 142
    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/Sensor;

    iput-object v4, p0, Lorg/apache/cordova/AccelListener;->mSensor:Landroid/hardware/Sensor;

    .line 143
    iget-object v4, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v5, p0, Lorg/apache/cordova/AccelListener;->mSensor:Landroid/hardware/Sensor;

    const/4 v6, 0x2

    invoke-virtual {v4, p0, v5, v6}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 144
    sget v4, Lorg/apache/cordova/AccelListener;->STARTING:I

    invoke-direct {p0, v4}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 152
    const-wide/16 v2, 0x7d0

    .line 153
    .local v2, "timeout":J
    :goto_1
    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v5, Lorg/apache/cordova/AccelListener;->STARTING:I

    if-ne v4, v5, :cond_3

    cmp-long v4, v2, v7

    if-lez v4, :cond_3

    .line 154
    sub-long/2addr v2, v9

    .line 156
    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 146
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v2    # "timeout":J
    :cond_2
    sget v4, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v4}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 147
    sget v4, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    const-string v5, "No sensors found to register accelerometer listening to."

    invoke-direct {p0, v4, v5}, Lorg/apache/cordova/AccelListener;->fail(ILjava/lang/String;)V

    .line 148
    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    goto :goto_0

    .line 161
    .restart local v2    # "timeout":J
    :cond_3
    cmp-long v4, v2, v7

    if-nez v4, :cond_4

    .line 162
    sget v4, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v4}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 163
    sget v4, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    const-string v5, "Accelerometer could not be started."

    invoke-direct {p0, v4, v5}, Lorg/apache/cordova/AccelListener;->fail(ILjava/lang/String;)V

    .line 165
    :cond_4
    iget v4, p0, Lorg/apache/cordova/AccelListener;->status:I

    goto :goto_0
.end method

.method private stop()V
    .locals 2

    .prologue
    .line 172
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 173
    iget-object v0, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 175
    :cond_0
    sget v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 176
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/AccelListener;->accuracy:I

    .line 177
    return-void
.end method

.method private win()V
    .locals 3

    .prologue
    .line 245
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {p0}, Lorg/apache/cordova/AccelListener;->getAccelerationJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 246
    .local v0, "result":Lorg/apache/cordova/api/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 248
    iget-object v1, p0, Lorg/apache/cordova/AccelListener;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/AccelListener;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 249
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 88
    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    .line 89
    .local v2, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v0, ""

    .line 90
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 91
    .local v1, "result":Lorg/apache/cordova/api/PluginResult;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 93
    const-string v3, "start"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 94
    iput-object p3, p0, Lorg/apache/cordova/AccelListener;->callbackId:Ljava/lang/String;

    .line 95
    iget v3, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v4, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-eq v3, v4, :cond_0

    .line 98
    invoke-direct {p0}, Lorg/apache/cordova/AccelListener;->start()I

    .line 109
    .end local v1    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_0
    :goto_0
    return-object v1

    .line 101
    .restart local v1    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1
    const-string v3, "stop"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 102
    iget v3, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v4, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-ne v3, v4, :cond_0

    .line 103
    invoke-direct {p0}, Lorg/apache/cordova/AccelListener;->stop()V

    goto :goto_0

    .line 107
    :cond_2
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    .end local v1    # "result":Lorg/apache/cordova/api/PluginResult;
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 187
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 195
    iput p2, p0, Lorg/apache/cordova/AccelListener;->accuracy:I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/cordova/AccelListener;->stop()V

    .line 118
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 205
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 225
    :cond_0
    :goto_0
    return-void

    .line 210
    :cond_1
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 213
    sget v0, Lorg/apache/cordova/AccelListener;->RUNNING:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 215
    iget v0, p0, Lorg/apache/cordova/AccelListener;->accuracy:I

    if-lt v0, v3, :cond_0

    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    .line 219
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/cordova/AccelListener;->x:F

    .line 220
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    iput v0, p0, Lorg/apache/cordova/AccelListener;->y:F

    .line 221
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v3

    iput v0, p0, Lorg/apache/cordova/AccelListener;->z:F

    .line 223
    invoke-direct {p0}, Lorg/apache/cordova/AccelListener;->win()V

    goto :goto_0
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 75
    invoke-super {p0, p1}, Lorg/apache/cordova/api/Plugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 76
    invoke-interface {p1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    .line 77
    return-void
.end method
