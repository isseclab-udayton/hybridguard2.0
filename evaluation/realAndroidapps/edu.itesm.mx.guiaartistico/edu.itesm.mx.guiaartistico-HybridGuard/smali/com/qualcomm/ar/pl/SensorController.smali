.class public Lcom/qualcomm/ar/pl/SensorController;
.super Landroid/os/HandlerThread;
.source "SensorController.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    }
.end annotation


# static fields
.field private static final AR_SENSOR_CONFIDENCE_HIGH:I = 0x4

.field private static final AR_SENSOR_CONFIDENCE_LOW:I = 0x2

.field private static final AR_SENSOR_CONFIDENCE_MEDIUM:I = 0x3

.field private static final AR_SENSOR_CONFIDENCE_UNKNOWN:I = 0x0

.field private static final AR_SENSOR_CONFIDENCE_UNRELIABLE:I = 0x1

.field private static AR_SENSOR_INDEX_DONTCARE:I = 0x0

.field private static final AR_SENSOR_PARAMTYPE_ACCURACY:I = 0x70000008

.field private static final AR_SENSOR_PARAMTYPE_BASE:I = 0x70000000

.field private static final AR_SENSOR_PARAMTYPE_DATARANGE_MAX:I = 0x70000002

.field private static final AR_SENSOR_PARAMTYPE_DATARANGE_MIN:I = 0x70000001

.field private static final AR_SENSOR_PARAMTYPE_RESOLUTION:I = 0x70000004

.field private static final AR_SENSOR_PARAMTYPE_SENSITIVITY:I = 0x70000010

.field private static final AR_SENSOR_PARAMTYPE_UPDATEINTERVAL:I = 0x70000020

.field private static final AR_SENSOR_PARAMTYPE_UPDATEINTERVAL_ABSTRACT:I = 0x70000040

.field private static final AR_SENSOR_PARAMTYPE_UPDATEINTERVAL_MIN:I = 0x70000080

.field private static final AR_SENSOR_PARAMTYPE_UPDATERATE_MIN:I = 0x70000100

.field private static final AR_SENSOR_STATUS_IDLE:I = 0x50010002

.field private static final AR_SENSOR_STATUS_RUNNING:I = 0x50010003

.field private static final AR_SENSOR_STATUS_UNINITIALIZED:I = 0x50010001

.field private static final AR_SENSOR_STATUS_UNKNOWN:I = 0x50010000

.field private static final AR_SENSOR_TYPE_ACCELEROMETER:I = 0x50000002

.field private static final AR_SENSOR_TYPE_AMBIENT_LIGHT:I = 0x50000006

.field private static final AR_SENSOR_TYPE_GYROSCOPE:I = 0x50000001

.field private static final AR_SENSOR_TYPE_MAGNETOMETER:I = 0x50000003

.field private static final AR_SENSOR_TYPE_PROXIMITY:I = 0x50000005

.field private static final AR_SENSOR_TYPE_UNKNOWN:I = 0x50000000

.field private static final AR_SENSOR_UPDATEINTERVAL_HIGHESTRATE:I = 0x4

.field private static final AR_SENSOR_UPDATEINTERVAL_HIGHRATE:I = 0x3

.field private static final AR_SENSOR_UPDATEINTERVAL_LOWRATE:I = 0x1

.field private static final AR_SENSOR_UPDATEINTERVAL_MEDIUMRATE:I = 0x2

.field private static final AR_SENSOR_UPDATEINTERVAL_UNKNOWN:I = 0x0

.field private static CONVERT_FORMAT_TO_ANDROID:Z = false

.field private static CONVERT_FORMAT_TO_PL:Z = false

.field private static final MODULENAME:Ljava/lang/String; = "SensorController"

.field private static final SENSORINFO_VALUE_ANDROIDSENSORTYPE:I = 0x1

.field private static final SENSORINFO_VALUE_ISDEFAULT:I = 0x2

.field private static final SENSORINFO_VALUE_PLSENSORTYPE:I = 0x0

.field private static final SENSOR_TYPE_CONVERSIONTABLE:[I

.field private static final _NUM_SENSORINFO_VALUE_:I = 0x3


# instance fields
.field private sensorCacheInfo:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;",
            ">;"
        }
    .end annotation
.end field

.field private sensorEventHandler:Landroid/os/Handler;

.field private sensorIndexMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/Sensor;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 88
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    .line 98
    const/4 v0, 0x1

    sput-boolean v0, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_PL:Z

    .line 99
    const/4 v0, 0x0

    sput-boolean v0, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_ANDROID:Z

    .line 110
    const/4 v0, -0x1

    sput v0, Lcom/qualcomm/ar/pl/SensorController;->AR_SENSOR_INDEX_DONTCARE:I

    return-void

    .line 88
    nop

    :array_0
    .array-data 4
        0x4
        0x50000001
        0x1
        0x50000002    # 8.5899366E9f
        0x2
        0x50000003
        0x8
        0x50000005
        0x5
        0x50000006
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 155
    const-string v0, "SensorController"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 157
    iput-object v1, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    .line 158
    iput-object v1, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorIndexMap:Ljava/util/HashMap;

    .line 159
    return-void
.end method

.method private getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    .locals 1
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    .line 169
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 172
    :cond_0
    const/4 v0, 0x0

    .line 176
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    goto :goto_0
.end method

.method private native newDataAvailable(IJI[F)V
.end method

.method private translateSensorType(IZ)I
    .locals 4
    .param p1, "fromValue"    # I
    .param p2, "conversionMode"    # Z

    .prologue
    .line 182
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    array-length v2, v2

    div-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_3

    .line 184
    sget-boolean v2, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_0

    sget-object v2, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    aget v0, v2, v3

    .line 188
    .local v0, "compareValue":I
    :goto_1
    if-ne p1, v0, :cond_2

    .line 190
    sget-boolean v2, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_1

    sget-object v2, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    .line 197
    .end local v0    # "compareValue":I
    :goto_2
    return v2

    .line 184
    :cond_0
    sget-object v2, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v0, v2, v3

    goto :goto_1

    .line 190
    .restart local v0    # "compareValue":I
    :cond_1
    sget-object v2, Lcom/qualcomm/ar/pl/SensorController;->SENSOR_TYPE_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    aget v2, v2, v3

    goto :goto_2

    .line 182
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 197
    .end local v0    # "compareValue":I
    :cond_3
    sget-boolean v2, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_4

    const/high16 v2, 0x50000000

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private translateSensorUpdateIntervalToAndroid(I)I
    .locals 1
    .param p1, "updateIntervalValue_PL"    # I

    .prologue
    .line 203
    const/4 v0, -0x1

    .line 206
    .local v0, "updateIntervalValue_Android":I
    packed-switch p1, :pswitch_data_0

    .line 230
    :goto_0
    return v0

    .line 209
    :pswitch_0
    const/4 v0, 0x3

    .line 210
    goto :goto_0

    .line 213
    :pswitch_1
    const/4 v0, 0x2

    .line 214
    goto :goto_0

    .line 217
    :pswitch_2
    const/4 v0, 0x1

    .line 218
    goto :goto_0

    .line 221
    :pswitch_3
    const/4 v0, 0x0

    .line 223
    goto :goto_0

    .line 206
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method close(I)Z
    .locals 5
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    .line 479
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v2

    .line 482
    .local v2, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v2, :cond_0

    .line 484
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 485
    const-string v3, "Sensor handle is invalid"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    .line 486
    const/4 v1, 0x0

    .line 508
    :goto_0
    return v1

    .line 489
    :cond_0
    const/4 v1, 0x0

    .line 493
    .local v1, "result":Z
    :try_start_0
    iget-object v3, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v4, v2, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3, p0, v4}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 494
    const/4 v1, 0x1

    .line 505
    :goto_1
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_0

    .line 496
    :catch_0
    move-exception v0

    .line 500
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x6

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 501
    const-string v3, "Failed to unregister sensor event listerer"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getAllSupportedSensors()I
    .locals 12

    .prologue
    const/4 v10, -0x1

    .line 329
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 330
    .local v0, "activity":Landroid/app/Activity;
    const-string v9, "sensor"

    invoke-virtual {v0, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/hardware/SensorManager;

    iput-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    .line 333
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v9, :cond_0

    .line 335
    const/4 v9, 0x6

    invoke-static {v9}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 336
    const-string v9, "Failed to retrieve Context\'s Sensor Service"

    invoke-static {v9}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    move v9, v10

    .line 399
    :goto_0
    return v9

    .line 343
    :cond_0
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-lez v9, :cond_1

    .line 346
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    goto :goto_0

    .line 350
    :cond_1
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v9, v10}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v8

    .line 353
    .local v8, "supportedSensors":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    const/4 v7, 0x0

    .line 355
    .local v7, "supportedSensorIndex":I
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 356
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/hardware/Sensor;>;"
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 359
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Sensor;

    .line 362
    .local v5, "sensor":Landroid/hardware/Sensor;
    invoke-virtual {v5}, Landroid/hardware/Sensor;->getType()I

    move-result v6

    .line 363
    .local v6, "sensorType":I
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v9, v6}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 369
    .local v1, "isDefaultSensor":Z
    sget-boolean v9, Lcom/qualcomm/ar/pl/SensorController;->CONVERT_FORMAT_TO_PL:Z

    invoke-direct {p0, v6, v9}, Lcom/qualcomm/ar/pl/SensorController;->translateSensorType(IZ)I

    move-result v3

    .line 370
    .local v3, "plSensorType":I
    const/high16 v9, 0x50000000

    if-eq v3, v9, :cond_2

    .line 373
    new-instance v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    invoke-direct {v4, p0}, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;-><init>(Lcom/qualcomm/ar/pl/SensorController;)V

    .line 374
    .local v4, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    iput-object v5, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    .line 375
    iput v3, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->plSensorType:I

    .line 376
    iput-boolean v1, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->isDefaultSensor:Z

    .line 377
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    iput v9, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->cacheIndex:I

    .line 381
    const/4 v9, 0x0

    iput v9, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->requestedAbstractUpdateRate:I

    .line 387
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v9, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 390
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorIndexMap:Ljava/util/HashMap;

    iget-object v10, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    iget v11, v4, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->cacheIndex:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 399
    .end local v1    # "isDefaultSensor":Z
    .end local v3    # "plSensorType":I
    .end local v4    # "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    .end local v5    # "sensor":Landroid/hardware/Sensor;
    .end local v6    # "sensorType":I
    :cond_3
    iget-object v9, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    goto :goto_0
.end method

.method getSensorInfoValues(I)[I
    .locals 6
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 517
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v0

    .line 520
    .local v0, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v0, :cond_0

    .line 523
    const/4 v1, 0x0

    .line 531
    :goto_0
    return-object v1

    .line 526
    :cond_0
    const/4 v4, 0x3

    new-array v1, v4, [I

    .line 527
    .local v1, "sensorInfoValues":[I
    iget v4, v0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->plSensorType:I

    aput v4, v1, v3

    .line 528
    iget-object v4, v0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v4}, Landroid/hardware/Sensor;->getType()I

    move-result v4

    aput v4, v1, v2

    .line 529
    const/4 v4, 0x2

    iget-boolean v5, v0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->isDefaultSensor:Z

    if-eqz v5, :cond_1

    :goto_1
    aput v2, v1, v4

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method getSensorName(I)Ljava/lang/String;
    .locals 2
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    .line 540
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v0

    .line 543
    .local v0, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v0, :cond_0

    .line 546
    const/4 v1, 0x0

    .line 549
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method getTypedSensorParameter(II)Ljava/lang/Object;
    .locals 5
    .param p1, "sensorCacheInfoIndex"    # I
    .param p2, "type"    # I

    .prologue
    const/4 v2, 0x0

    .line 558
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v1

    .line 561
    .local v1, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v1, :cond_0

    .line 563
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 564
    const-string v3, "Sensor handle is invalid"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    .line 617
    :goto_0
    return-object v2

    .line 570
    :cond_0
    sparse-switch p2, :sswitch_data_0

    .line 606
    const/4 v3, 0x3

    :try_start_0
    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 607
    const-string v3, "Unknown sensor parameter"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 611
    :catch_0
    move-exception v0

    .line 613
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x6

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 614
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get sensor parameter: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0

    .line 576
    .end local v0    # "e":Ljava/lang/Exception;
    :sswitch_0
    const/4 v3, 0x3

    :try_start_1
    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 577
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Querying sensor parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not supported for sensor type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->plSensorType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const v3, 0x70000020

    if-ne p2, v3, :cond_1

    const-string v3, " when using the Java-based sensor API"

    :goto_1
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v3, ""

    goto :goto_1

    .line 585
    :sswitch_1
    iget-object v3, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_0

    .line 588
    :sswitch_2
    iget-object v3, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3}, Landroid/hardware/Sensor;->getResolution()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_0

    .line 591
    :sswitch_3
    const/16 v3, 0x9

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 593
    iget-object v3, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3}, Landroid/hardware/Sensor;->getMinDelay()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0

    .line 597
    :cond_2
    const/4 v3, 0x3

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 598
    const-string v3, "Unknown sensor parameter"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 603
    :sswitch_4
    iget v3, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->requestedAbstractUpdateRate:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    goto/16 :goto_0

    .line 570
    :sswitch_data_0
    .sparse-switch
        0x70000001 -> :sswitch_0
        0x70000002 -> :sswitch_1
        0x70000004 -> :sswitch_2
        0x70000008 -> :sswitch_0
        0x70000010 -> :sswitch_0
        0x70000020 -> :sswitch_0
        0x70000040 -> :sswitch_4
        0x70000080 -> :sswitch_3
    .end sparse-switch
.end method

.method public init()Z
    .locals 1

    .prologue
    .line 312
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    .line 315
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    .line 318
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorIndexMap:Ljava/util/HashMap;

    .line 321
    const/4 v0, 0x1

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 241
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 249
    iget-object v0, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorIndexMap:Ljava/util/HashMap;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 250
    .local v6, "intObj":Ljava/lang/Object;
    if-nez v6, :cond_1

    .line 295
    .end local v6    # "intObj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 257
    .restart local v6    # "intObj":Ljava/lang/Object;
    :cond_1
    check-cast v6, Ljava/lang/Integer;

    .end local v6    # "intObj":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 260
    .local v8, "sensorCacheInfoIndex":I
    invoke-direct {p0, v8}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v7

    .line 261
    .local v7, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-eqz v7, :cond_0

    .line 269
    const/4 v4, 0x0

    .line 270
    .local v4, "plConfidenceValue":I
    iget v0, p1, Landroid/hardware/SensorEvent;->accuracy:I

    packed-switch v0, :pswitch_data_0

    .line 294
    :goto_1
    iget v1, v7, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->cacheIndex:I

    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/qualcomm/ar/pl/SensorController;->newDataAvailable(IJI[F)V

    goto :goto_0

    .line 273
    :pswitch_0
    const/4 v4, 0x1

    .line 274
    goto :goto_1

    .line 277
    :pswitch_1
    const/4 v4, 0x2

    .line 278
    goto :goto_1

    .line 281
    :pswitch_2
    const/4 v4, 0x3

    .line 282
    goto :goto_1

    .line 285
    :pswitch_3
    const/4 v4, 0x4

    .line 286
    goto :goto_1

    .line 270
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method open(II)Z
    .locals 7
    .param p1, "sensorType"    # I
    .param p2, "index"    # I

    .prologue
    const/4 v5, 0x0

    .line 408
    const/4 v2, 0x0

    .line 409
    .local v2, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    sget v4, Lcom/qualcomm/ar/pl/SensorController;->AR_SENSOR_INDEX_DONTCARE:I

    if-ne p2, v4, :cond_2

    .line 412
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 414
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    .line 415
    .local v3, "tmpSCI":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    iget v4, v3, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->plSensorType:I

    if-ne v4, p1, :cond_1

    iget-boolean v4, v3, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->isDefaultSensor:Z

    if-eqz v4, :cond_1

    .line 417
    move-object v2, v3

    .line 428
    .end local v1    # "i":I
    .end local v3    # "tmpSCI":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    :cond_0
    :goto_1
    if-nez v2, :cond_3

    .line 430
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 431
    const-string v4, "No sensor matching the requested sensor device info has been found"

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    move v4, v5

    .line 470
    :goto_2
    return v4

    .line 412
    .restart local v1    # "i":I
    .restart local v3    # "tmpSCI":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 424
    .end local v1    # "i":I
    .end local v3    # "tmpSCI":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    :cond_2
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorCacheInfo:Ljava/util/Vector;

    invoke-virtual {v4, p2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    check-cast v2, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    .restart local v2    # "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    goto :goto_1

    .line 439
    :cond_3
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorEventHandler:Landroid/os/Handler;

    if-nez v4, :cond_4

    .line 446
    :try_start_0
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/SensorController;->start()V

    .line 450
    new-instance v4, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/SensorController;->getLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorEventHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 470
    :cond_4
    const/4 v4, 0x1

    goto :goto_2

    .line 452
    :catch_0
    move-exception v0

    .line 454
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x6

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 455
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/SensorController;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "retrieve a handler for the sensor event handler thread"

    :goto_3
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ": "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    move v4, v5

    .line 463
    goto :goto_2

    .line 455
    :cond_5
    const-string v4, "start Java handler thread for sensor events"

    goto :goto_3
.end method

.method setTypedSensorParameter(IILjava/lang/Object;)Z
    .locals 6
    .param p1, "sensorCacheInfoIndex"    # I
    .param p2, "type"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 626
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v1

    .line 629
    .local v1, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v1, :cond_0

    .line 631
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 632
    const-string v4, "Sensor handle is invalid"

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    .line 682
    .end local p3    # "value":Ljava/lang/Object;
    :goto_0
    return v3

    .line 638
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_0
    sparse-switch p2, :sswitch_data_0

    .line 671
    const/4 v4, 0x3

    :try_start_0
    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 672
    const-string v4, "Unknown sensor parameter"

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 676
    .end local p3    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 678
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x6

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 679
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to get sensor parameter: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0

    .line 647
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p3    # "value":Ljava/lang/Object;
    :sswitch_0
    const/4 v4, 0x3

    :try_start_1
    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 648
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Sensor parameter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " cannot be set for sensor type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->plSensorType:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const v4, 0x70000020

    if-ne p2, v4, :cond_1

    const-string v4, " when using the Java-based sensor API"

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v4, ""

    goto :goto_1

    .line 656
    :sswitch_1
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 659
    .local v2, "updateIntervalValue":I
    if-lt v2, v4, :cond_2

    if-le v2, v5, :cond_3

    .line 661
    :cond_2
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 662
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid abstract sensor update interval ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 667
    :cond_3
    iput v2, v1, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->requestedAbstractUpdateRate:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move v3, v4

    .line 668
    goto/16 :goto_0

    .line 638
    nop

    :sswitch_data_0
    .sparse-switch
        0x70000001 -> :sswitch_0
        0x70000002 -> :sswitch_0
        0x70000004 -> :sswitch_0
        0x70000008 -> :sswitch_0
        0x70000010 -> :sswitch_0
        0x70000020 -> :sswitch_0
        0x70000040 -> :sswitch_1
        0x70000080 -> :sswitch_0
    .end sparse-switch
.end method

.method start(I)Z
    .locals 7
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    .line 691
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v2

    .line 694
    .local v2, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v2, :cond_1

    .line 696
    const/4 v4, 0x4

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 697
    const-string v4, "Sensor handle is invalid"

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    .line 698
    const/4 v1, 0x0

    .line 727
    :cond_0
    :goto_0
    return v1

    .line 702
    :cond_1
    iget v4, v2, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->requestedAbstractUpdateRate:I

    invoke-direct {p0, v4}, Lcom/qualcomm/ar/pl/SensorController;->translateSensorUpdateIntervalToAndroid(I)I

    move-result v3

    .line 703
    .local v3, "updateRateAndroid":I
    if-gez v3, :cond_2

    const/4 v0, 0x1

    .line 706
    .local v0, "requestedUpdateRateAndroid":I
    :goto_1
    const/4 v1, 0x0

    .line 710
    .local v1, "result":Z
    :try_start_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v5, v2, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    iget-object v6, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorEventHandler:Landroid/os/Handler;

    invoke-virtual {v4, p0, v5, v0, v6}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 718
    :goto_2
    if-nez v1, :cond_0

    .line 720
    const/4 v4, 0x6

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 721
    const-string v4, "Failed to start sensor, could not register sensor event listerer"

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0

    .end local v0    # "requestedUpdateRateAndroid":I
    .end local v1    # "result":Z
    :cond_2
    move v0, v3

    .line 703
    goto :goto_1

    .line 712
    .restart local v0    # "requestedUpdateRateAndroid":I
    .restart local v1    # "result":Z
    :catch_0
    move-exception v4

    goto :goto_2
.end method

.method stop(I)Z
    .locals 5
    .param p1, "sensorCacheInfoIndex"    # I

    .prologue
    .line 736
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SensorController;->getSensorCacheInfo(I)Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;

    move-result-object v2

    .line 739
    .local v2, "sci":Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
    if-nez v2, :cond_0

    .line 741
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 742
    const-string v3, "Sensor handle is invalid"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    .line 743
    const/4 v1, 0x0

    .line 762
    :goto_0
    return v1

    .line 747
    :cond_0
    const/4 v1, 0x0

    .line 750
    .local v1, "result":Z
    :try_start_0
    iget-object v3, p0, Lcom/qualcomm/ar/pl/SensorController;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v4, v2, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3, p0, v4}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 751
    const/4 v1, 0x1

    goto :goto_0

    .line 753
    :catch_0
    move-exception v0

    .line 757
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x6

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 758
    const-string v3, "Failed to stop sensor, could not unregister sensor event listerer"

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->logSystemError(Ljava/lang/String;)V

    goto :goto_0
.end method
