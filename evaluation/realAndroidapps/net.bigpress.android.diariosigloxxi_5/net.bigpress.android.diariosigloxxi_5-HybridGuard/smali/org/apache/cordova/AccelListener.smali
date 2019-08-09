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
.field public TIMEOUT:F

.field lastAccessTime:J

.field mSensor:Landroid/hardware/Sensor;

.field private sensorManager:Landroid/hardware/SensorManager;

.field status:I

.field timestamp:J

.field x:F

.field y:F

.field z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    .line 44
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/AccelListener;->STARTING:I

    .line 45
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/AccelListener;->RUNNING:I

    .line 46
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 48
    const v0, 0x46ea6000    # 30000.0f

    iput v0, p0, Lorg/apache/cordova/AccelListener;->TIMEOUT:F

    .line 62
    iput v1, p0, Lorg/apache/cordova/AccelListener;->x:F

    .line 63
    iput v1, p0, Lorg/apache/cordova/AccelListener;->y:F

    .line 64
    iput v1, p0, Lorg/apache/cordova/AccelListener;->z:F

    .line 65
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    .line 66
    sget v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 67
    return-void
.end method

.method private setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 308
    iput p1, p0, Lorg/apache/cordova/AccelListener;->status:I

    .line 309
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 11
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 89
    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 90
    .local v5, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v4, ""

    .line 93
    .local v4, "result":Ljava/lang/String;
    :try_start_0
    const-string v8, "getStatus"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 94
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->getStatus()I

    move-result v2

    .line 95
    .local v2, "i":I
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v8, v5, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    .line 157
    .end local v2    # "i":I
    :goto_0
    return-object v8

    .line 97
    :cond_0
    const-string v8, "start"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 98
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->start()I

    move-result v2

    .line 99
    .restart local v2    # "i":I
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v8, v5, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 156
    .end local v2    # "i":I
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Lorg/json/JSONException;
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    sget-object v9, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0

    .line 101
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    :try_start_1
    const-string v8, "stop"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 102
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->stop()V

    .line 103
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    const/4 v9, 0x0

    invoke-direct {v8, v5, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_0

    .line 105
    :cond_2
    const-string v8, "getAcceleration"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 107
    iget v8, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v9, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-eq v8, v9, :cond_5

    .line 108
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->start()I

    move-result v3

    .line 109
    .local v3, "r":I
    sget v8, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    if-ne v3, v8, :cond_3

    .line 110
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    sget-object v9, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    sget v10, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {v8, v9, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_0

    .line 113
    :cond_3
    const-wide/16 v6, 0x7d0

    .line 114
    .local v6, "timeout":J
    :goto_1
    iget v8, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v9, Lorg/apache/cordova/AccelListener;->STARTING:I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    if-ne v8, v9, :cond_4

    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_4

    .line 115
    const-wide/16 v8, 0x64

    sub-long/2addr v6, v8

    .line 117
    const-wide/16 v8, 0x64

    :try_start_2
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 118
    :catch_1
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 122
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_4
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-nez v8, :cond_5

    .line 123
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    sget-object v9, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    sget v10, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {v8, v9, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    goto :goto_0

    .line 126
    .end local v3    # "r":I
    .end local v6    # "timeout":J
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iput-wide v8, p0, Lorg/apache/cordova/AccelListener;->lastAccessTime:J

    .line 127
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .local v3, "r":Lorg/json/JSONObject;
    const-string v8, "x"

    iget v9, p0, Lorg/apache/cordova/AccelListener;->x:F

    float-to-double v9, v9

    invoke-virtual {v3, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 129
    const-string v8, "y"

    iget v9, p0, Lorg/apache/cordova/AccelListener;->y:F

    float-to-double v9, v9

    invoke-virtual {v3, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 130
    const-string v8, "z"

    iget v9, p0, Lorg/apache/cordova/AccelListener;->z:F

    float-to-double v9, v9

    invoke-virtual {v3, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 132
    const-string v8, "timestamp"

    iget-wide v9, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    invoke-virtual {v3, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 133
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v8, v5, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 135
    .end local v3    # "r":Lorg/json/JSONObject;
    :cond_6
    const-string v8, "setTimeout"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    move-result v8

    if-eqz v8, :cond_7

    .line 137
    const/4 v8, 0x0

    :try_start_4
    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    .line 138
    .local v6, "timeout":F
    invoke-virtual {p0, v6}, Lorg/apache/cordova/AccelListener;->setTimeout(F)V

    .line 139
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    const/4 v9, 0x0

    invoke-direct {v8, v5, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 140
    .end local v6    # "timeout":F
    :catch_2
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_5
    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    .line 142
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 155
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :goto_2
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v8, v5, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 143
    :catch_3
    move-exception v0

    .line 144
    .local v0, "e":Lorg/json/JSONException;
    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    .line 145
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 148
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_7
    const-string v8, "getTimeout"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 149
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->getTimeout()F

    move-result v1

    .line 150
    .local v1, "f":F
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v8, v5, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;F)V

    goto/16 :goto_0

    .line 153
    .end local v1    # "f":F
    :cond_8
    new-instance v8, Lorg/apache/cordova/api/PluginResult;

    sget-object v9, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v8, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 282
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    return v0
.end method

.method public getTimeout()F
    .locals 1

    .prologue
    .line 300
    iget v0, p0, Lorg/apache/cordova/AccelListener;->TIMEOUT:F

    return v0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 168
    const-string v1, "getStatus"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    :cond_0
    :goto_0
    return v0

    .line 171
    :cond_1
    const-string v1, "getAcceleration"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 173
    iget v1, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v2, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-eq v1, v2, :cond_0

    .line 180
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 177
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
    .line 243
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->stop()V

    .line 189
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v2, 0x1

    .line 253
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 258
    :cond_1
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 263
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    .line 264
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/cordova/AccelListener;->x:F

    .line 265
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    iput v0, p0, Lorg/apache/cordova/AccelListener;->y:F

    .line 266
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/cordova/AccelListener;->z:F

    .line 268
    sget v0, Lorg/apache/cordova/AccelListener;->RUNNING:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 271
    iget-wide v0, p0, Lorg/apache/cordova/AccelListener;->timestamp:J

    iget-wide v2, p0, Lorg/apache/cordova/AccelListener;->lastAccessTime:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    iget v1, p0, Lorg/apache/cordova/AccelListener;->TIMEOUT:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 272
    invoke-virtual {p0}, Lorg/apache/cordova/AccelListener;->stop()V

    goto :goto_0
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 1
    .param p1, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 76
    invoke-super {p0, p1}, Lorg/apache/cordova/api/Plugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 77
    const-string v0, "sensor"

    invoke-interface {p1, v0}, Lorg/apache/cordova/api/CordovaInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    .line 78
    return-void
.end method

.method public setTimeout(F)V
    .locals 0
    .param p1, "timeout"    # F

    .prologue
    .line 291
    iput p1, p0, Lorg/apache/cordova/AccelListener;->TIMEOUT:F

    .line 292
    return-void
.end method

.method public start()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 203
    iget v1, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v2, Lorg/apache/cordova/AccelListener;->RUNNING:I

    if-eq v1, v2, :cond_0

    iget v1, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v2, Lorg/apache/cordova/AccelListener;->STARTING:I

    if-ne v1, v2, :cond_1

    .line 204
    :cond_0
    iget v1, p0, Lorg/apache/cordova/AccelListener;->status:I

    .line 223
    :goto_0
    return v1

    .line 208
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 211
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 212
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Sensor;

    iput-object v1, p0, Lorg/apache/cordova/AccelListener;->mSensor:Landroid/hardware/Sensor;

    .line 213
    iget-object v1, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lorg/apache/cordova/AccelListener;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 214
    sget v1, Lorg/apache/cordova/AccelListener;->STARTING:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 215
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/apache/cordova/AccelListener;->lastAccessTime:J

    .line 223
    :goto_1
    iget v1, p0, Lorg/apache/cordova/AccelListener;->status:I

    goto :goto_0

    .line 220
    :cond_2
    sget v1, Lorg/apache/cordova/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    goto :goto_1
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 230
    iget v0, p0, Lorg/apache/cordova/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 231
    iget-object v0, p0, Lorg/apache/cordova/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 233
    :cond_0
    sget v0, Lorg/apache/cordova/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/AccelListener;->setStatus(I)V

    .line 234
    return-void
.end method
