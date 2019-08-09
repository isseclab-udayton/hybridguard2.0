.class public Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;
.super Ljava/lang/Object;
.source "SensorController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/SensorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SensorCacheInfo"
.end annotation


# instance fields
.field cacheIndex:I

.field isDefaultSensor:Z

.field plSensorType:I

.field requestedAbstractUpdateRate:I

.field sensor:Landroid/hardware/Sensor;

.field final synthetic this$0:Lcom/qualcomm/ar/pl/SensorController;

.field valuesForForcedSensorEvent:[F


# direct methods
.method public constructor <init>(Lcom/qualcomm/ar/pl/SensorController;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/qualcomm/ar/pl/SensorController$SensorCacheInfo;->this$0:Lcom/qualcomm/ar/pl/SensorController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
