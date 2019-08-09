.class public Lorg/apache/cordova/GeoListener;
.super Ljava/lang/Object;
.source "GeoListener.java"


# static fields
.field public static PERMISSION_DENIED:I

.field public static POSITION_UNAVAILABLE:I

.field public static TIMEOUT:I


# instance fields
.field private broker:Lorg/apache/cordova/GeoBroker;

.field failCallback:Ljava/lang/String;

.field id:Ljava/lang/String;

.field interval:I

.field mGps:Lorg/apache/cordova/GpsListener;

.field mLocMan:Landroid/location/LocationManager;

.field mNetwork:Lorg/apache/cordova/NetworkListener;

.field successCallback:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/GeoListener;->PERMISSION_DENIED:I

    .line 28
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/GeoListener;->POSITION_UNAVAILABLE:I

    .line 29
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/GeoListener;->TIMEOUT:I

    return-void
.end method

.method constructor <init>(Lorg/apache/cordova/GeoBroker;Ljava/lang/String;I)V
    .locals 2
    .param p1, "broker"    # Lorg/apache/cordova/GeoBroker;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "time"    # I

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p2, p0, Lorg/apache/cordova/GeoListener;->id:Ljava/lang/String;

    .line 52
    iput p3, p0, Lorg/apache/cordova/GeoListener;->interval:I

    .line 53
    iput-object p1, p0, Lorg/apache/cordova/GeoListener;->broker:Lorg/apache/cordova/GeoBroker;

    .line 54
    iput-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    .line 55
    iput-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    .line 56
    iget-object v0, p1, Lorg/apache/cordova/GeoBroker;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    const-string v1, "location"

    invoke-interface {v0, v1}, Lorg/apache/cordova/api/CordovaInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lorg/apache/cordova/GeoListener;->mLocMan:Landroid/location/LocationManager;

    .line 59
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mLocMan:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getProvider(Ljava/lang/String;)Landroid/location/LocationProvider;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Lorg/apache/cordova/GpsListener;

    iget-object v1, p1, Lorg/apache/cordova/GeoBroker;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p3, p0}, Lorg/apache/cordova/GpsListener;-><init>(Lorg/apache/cordova/api/CordovaInterface;ILorg/apache/cordova/GeoListener;)V

    iput-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    .line 64
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mLocMan:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getProvider(Ljava/lang/String;)Landroid/location/LocationProvider;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 65
    new-instance v0, Lorg/apache/cordova/NetworkListener;

    iget-object v1, p1, Lorg/apache/cordova/GeoBroker;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p3, p0}, Lorg/apache/cordova/NetworkListener;-><init>(Lorg/apache/cordova/api/CordovaInterface;ILorg/apache/cordova/GeoListener;)V

    iput-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    .line 67
    :cond_1
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/apache/cordova/GeoListener;->stop()V

    .line 74
    return-void
.end method

.method fail(ILjava/lang/String;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->broker:Lorg/apache/cordova/GeoBroker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "navigator._geo.fail(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/GeoListener;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/GeoBroker;->sendJavascript(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p0}, Lorg/apache/cordova/GeoListener;->stop()V

    .line 102
    return-void
.end method

.method start(I)V
    .locals 2
    .param p1, "interval"    # I

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/GpsListener;->start(I)V

    .line 113
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NetworkListener;->start(I)V

    .line 116
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    if-nez v0, :cond_2

    .line 117
    sget v0, Lorg/apache/cordova/GeoListener;->POSITION_UNAVAILABLE:I

    const-string v1, "No location providers available."

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/GeoListener;->fail(ILjava/lang/String;)V

    .line 119
    :cond_2
    return-void
.end method

.method stop()V
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mGps:Lorg/apache/cordova/GpsListener;

    invoke-virtual {v0}, Lorg/apache/cordova/GpsListener;->stop()V

    .line 128
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    if-eqz v0, :cond_1

    .line 129
    iget-object v0, p0, Lorg/apache/cordova/GeoListener;->mNetwork:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0}, Lorg/apache/cordova/NetworkListener;->stop()V

    .line 131
    :cond_1
    return-void
.end method

.method success(Landroid/location/Location;)V
    .locals 4
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "params":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/GeoListener;->id:Ljava/lang/String;

    const-string v2, "global"

    if-ne v1, v2, :cond_0

    .line 88
    invoke-virtual {p0}, Lorg/apache/cordova/GeoListener;->stop()V

    .line 90
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/GeoListener;->broker:Lorg/apache/cordova/GeoBroker;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "navigator._geo.success(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/cordova/GeoListener;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\',"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/GeoBroker;->sendJavascript(Ljava/lang/String;)V

    .line 91
    return-void
.end method
