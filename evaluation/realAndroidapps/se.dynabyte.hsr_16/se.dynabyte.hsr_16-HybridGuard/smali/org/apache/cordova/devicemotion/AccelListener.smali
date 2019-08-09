.class public Lorg/apache/cordova/devicemotion/AccelListener;
.super Lorg/apache/cordova/CordovaPlugin;
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

.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private mSensor:Landroid/hardware/Sensor;

.field private mainHandler:Landroid/os/Handler;

.field private mainRunnable:Ljava/lang/Runnable;

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
    .line 47
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    .line 48
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/devicemotion/AccelListener;->STARTING:I

    .line 49
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    .line 50
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/devicemotion/AccelListener;->ERROR_FAILED_TO_START:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 55
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainHandler:Landroid/os/Handler;

    .line 63
    new-instance v0, Lorg/apache/cordova/devicemotion/AccelListener$1;

    invoke-direct {v0, p0}, Lorg/apache/cordova/devicemotion/AccelListener$1;-><init>(Lorg/apache/cordova/devicemotion/AccelListener;)V

    iput-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainRunnable:Ljava/lang/Runnable;

    .line 73
    iput v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->x:F

    .line 74
    iput v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->y:F

    .line 75
    iput v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->z:F

    .line 76
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->timestamp:J

    .line 77
    sget v0, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 78
    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/devicemotion/AccelListener;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/devicemotion/AccelListener;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->timeout()V

    return-void
.end method

.method private fail(ILjava/lang/String;)V
    .locals 4
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 277
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 279
    .local v2, "errorObj":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "code"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 280
    const-string v3, "message"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 285
    .local v1, "err":Lorg/apache/cordova/PluginResult;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 286
    iget-object v3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 287
    return-void

    .line 281
    .end local v1    # "err":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v0

    .line 282
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private getAccelerationJSON()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 300
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 302
    .local v1, "r":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "x"

    iget v3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->x:F

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 303
    const-string v2, "y"

    iget v3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->y:F

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 304
    const-string v2, "z"

    iget v3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->z:F

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 305
    const-string v2, "timestamp"

    iget-wide v4, p0, Lorg/apache/cordova/devicemotion/AccelListener;->timestamp:J

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    :goto_0
    return-object v1

    .line 306
    :catch_0
    move-exception v0

    .line 307
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 297
    iput p1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    .line 298
    return-void
.end method

.method private start()I
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 144
    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v2, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    if-eq v1, v2, :cond_0

    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v2, Lorg/apache/cordova/devicemotion/AccelListener;->STARTING:I

    if-ne v1, v2, :cond_1

    .line 145
    :cond_0
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->startTimeout()V

    .line 146
    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    .line 176
    :goto_0
    return v1

    .line 149
    :cond_1
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STARTING:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 152
    iget-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 155
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 156
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Sensor;

    iput-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mSensor:Landroid/hardware/Sensor;

    .line 157
    iget-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 158
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STARTING:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 161
    iput v3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    .line 174
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->startTimeout()V

    .line 176
    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    goto :goto_0

    .line 163
    :cond_2
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 164
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->ERROR_FAILED_TO_START:I

    const-string v2, "Device sensor returned an error."

    invoke-direct {p0, v1, v2}, Lorg/apache/cordova/devicemotion/AccelListener;->fail(ILjava/lang/String;)V

    .line 165
    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    goto :goto_0

    .line 169
    :cond_3
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->ERROR_FAILED_TO_START:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 170
    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->ERROR_FAILED_TO_START:I

    const-string v2, "No sensors found to register accelerometer listening to."

    invoke-direct {p0, v1, v2}, Lorg/apache/cordova/devicemotion/AccelListener;->fail(ILjava/lang/String;)V

    .line 171
    iget v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    goto :goto_0
.end method

.method private startTimeout()V
    .locals 4

    .prologue
    .line 180
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->stopTimeout()V

    .line 181
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainHandler:Landroid/os/Handler;

    .line 182
    iget-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 183
    return-void
.end method

.method private stop()V
    .locals 2

    .prologue
    .line 193
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->stopTimeout()V

    .line 194
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 195
    iget-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 197
    :cond_0
    sget v0, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 198
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    .line 199
    return-void
.end method

.method private stopTimeout()V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->mainRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 188
    :cond_0
    return-void
.end method

.method private timeout()V
    .locals 2

    .prologue
    .line 207
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STARTING:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 211
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->timestamp:J

    .line 212
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->win()V

    .line 214
    :cond_0
    return-void
.end method

.method private win()V
    .locals 3

    .prologue
    .line 291
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->getAccelerationJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 292
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 293
    iget-object v1, p0, Lorg/apache/cordova/devicemotion/AccelListener;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 294
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 4
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v1, 0x1

    .line 102
    const-string v2, "start"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 103
    iput-object p3, p0, Lorg/apache/cordova/devicemotion/AccelListener;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 104
    iget v2, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v3, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    if-eq v2, v3, :cond_0

    .line 107
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->start()I

    .line 119
    :cond_0
    :goto_0
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    const-string v3, ""

    invoke-direct {v0, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 120
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 121
    invoke-virtual {p3, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 122
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :goto_1
    return v1

    .line 110
    :cond_1
    const-string v2, "stop"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 111
    iget v2, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v3, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    if-ne v2, v3, :cond_0

    .line 112
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->stop()V

    goto :goto_0

    .line 116
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 89
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 90
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->sensorManager:Landroid/hardware/SensorManager;

    .line 91
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 224
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 232
    iput p2, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 130
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->stop()V

    .line 131
    return-void
.end method

.method public onReset()V
    .locals 2

    .prologue
    .line 269
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    if-ne v0, v1, :cond_0

    .line 270
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->stop()V

    .line 272
    :cond_0
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 242
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 262
    :cond_0
    :goto_0
    return-void

    .line 247
    :cond_1
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->status:I

    sget v1, Lorg/apache/cordova/devicemotion/AccelListener;->STOPPED:I

    if-eq v0, v1, :cond_0

    .line 250
    sget v0, Lorg/apache/cordova/devicemotion/AccelListener;->RUNNING:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/devicemotion/AccelListener;->setStatus(I)V

    .line 252
    iget v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->accuracy:I

    if-lt v0, v3, :cond_0

    .line 255
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->timestamp:J

    .line 256
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->x:F

    .line 257
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    iput v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->y:F

    .line 258
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v3

    iput v0, p0, Lorg/apache/cordova/devicemotion/AccelListener;->z:F

    .line 260
    invoke-direct {p0}, Lorg/apache/cordova/devicemotion/AccelListener;->win()V

    goto :goto_0
.end method
