.class public Lorg/apache/cordova/TempListener;
.super Lorg/apache/cordova/api/Plugin;
.source "TempListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field mSensor:Landroid/hardware/Sensor;

.field private sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 44
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 67
    .local v1, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v0, ""

    .line 69
    .local v0, "result":Ljava/lang/String;
    const-string v2, "start"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 70
    invoke-virtual {p0}, Lorg/apache/cordova/TempListener;->start()V

    .line 75
    :cond_0
    :goto_0
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v1, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    return-object v2

    .line 72
    :cond_1
    const-string v2, "stop"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/apache/cordova/TempListener;->stop()V

    goto :goto_0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 104
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/cordova/TempListener;->stop()V

    .line 84
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 3
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 108
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v0, v1, v2

    .line 109
    .local v0, "temp":F
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "gotTemp("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/cordova/TempListener;->sendJavascript(Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method public setContext(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 1
    .param p1, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 53
    invoke-super {p0, p1}, Lorg/apache/cordova/api/Plugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 54
    const-string v0, "sensor"

    invoke-interface {p1, v0}, Lorg/apache/cordova/api/CordovaInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/apache/cordova/TempListener;->sensorManager:Landroid/hardware/SensorManager;

    .line 55
    return-void
.end method

.method public start()V
    .locals 4

    .prologue
    .line 91
    iget-object v1, p0, Lorg/apache/cordova/TempListener;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 92
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 93
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Sensor;

    iput-object v1, p0, Lorg/apache/cordova/TempListener;->mSensor:Landroid/hardware/Sensor;

    .line 94
    iget-object v1, p0, Lorg/apache/cordova/TempListener;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lorg/apache/cordova/TempListener;->mSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    invoke-virtual {v1, p0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 96
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/cordova/TempListener;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 100
    return-void
.end method
