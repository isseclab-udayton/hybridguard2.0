.class public Lorg/apache/cordova/CordovaLocationListener;
.super Ljava/lang/Object;
.source "CordovaLocationListener.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field public static PERMISSION_DENIED:I

.field public static POSITION_UNAVAILABLE:I

.field public static TIMEOUT:I


# instance fields
.field private TAG:Ljava/lang/String;

.field private callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected locationManager:Landroid/location/LocationManager;

.field private owner:Lorg/apache/cordova/GeoBroker;

.field protected running:Z

.field public watches:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/CordovaLocationListener;->PERMISSION_DENIED:I

    .line 35
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/CordovaLocationListener;->POSITION_UNAVAILABLE:I

    .line 36
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/CordovaLocationListener;->TIMEOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/location/LocationManager;Lorg/apache/cordova/GeoBroker;Ljava/lang/String;)V
    .locals 1
    .param p1, "manager"    # Landroid/location/LocationManager;
    .param p2, "broker"    # Lorg/apache/cordova/GeoBroker;
    .param p3, "tag"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaLocationListener;->running:Z

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    .line 45
    const-string v0, "[Cordova Location Listener]"

    iput-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    .line 48
    iput-object p1, p0, Lorg/apache/cordova/CordovaLocationListener;->locationManager:Landroid/location/LocationManager;

    .line 49
    iput-object p2, p0, Lorg/apache/cordova/CordovaLocationListener;->owner:Lorg/apache/cordova/GeoBroker;

    .line 50
    iput-object p3, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    .line 51
    return-void
.end method

.method private stop()V
    .locals 1

    .prologue
    .line 193
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaLocationListener;->running:Z

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 195
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaLocationListener;->running:Z

    .line 197
    :cond_0
    return-void
.end method

.method private win(Landroid/location/Location;)V
    .locals 6
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 68
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 70
    .local v0, "callbackId":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->owner:Lorg/apache/cordova/GeoBroker;

    invoke-virtual {v4, p1, v0}, Lorg/apache/cordova/GeoBroker;->win(Landroid/location/Location;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    .end local v0    # "callbackId":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 74
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 75
    .local v2, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 76
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 77
    .local v3, "pairs":Ljava/util/Map$Entry;
    iget-object v5, p0, Lorg/apache/cordova/CordovaLocationListener;->owner:Lorg/apache/cordova/GeoBroker;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, p1, v4}, Lorg/apache/cordova/GeoBroker;->win(Landroid/location/Location;Ljava/lang/String;)V

    goto :goto_1

    .line 79
    .end local v3    # "pairs":Ljava/util/Map$Entry;
    :cond_1
    return-void
.end method


# virtual methods
.method public addCallback(Ljava/lang/String;)V
    .locals 2
    .param p1, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaLocationListener;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 152
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaLocationListener;->start()V

    .line 154
    :cond_0
    return-void
.end method

.method public addWatch(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "timerId"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaLocationListener;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 146
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaLocationListener;->start()V

    .line 148
    :cond_0
    return-void
.end method

.method public clearWatch(Ljava/lang/String;)V
    .locals 1
    .param p1, "timerId"    # Ljava/lang/String;

    .prologue
    .line 156
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    :cond_0
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaLocationListener;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 160
    invoke-direct {p0}, Lorg/apache/cordova/CordovaLocationListener;->stop()V

    .line 162
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .prologue
    .line 168
    invoke-direct {p0}, Lorg/apache/cordova/CordovaLocationListener;->stop()V

    .line 169
    return-void
.end method

.method protected fail(ILjava/lang/String;)V
    .locals 6
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 54
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 56
    .local v0, "callbackId":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->owner:Lorg/apache/cordova/GeoBroker;

    invoke-virtual {v4, p1, p2, v0}, Lorg/apache/cordova/GeoBroker;->fail(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 58
    .end local v0    # "callbackId":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 60
    iget-object v4, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 61
    .local v2, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 62
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 63
    .local v3, "pairs":Ljava/util/Map$Entry;
    iget-object v5, p0, Lorg/apache/cordova/CordovaLocationListener;->owner:Lorg/apache/cordova/GeoBroker;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, p1, p2, v4}, Lorg/apache/cordova/GeoBroker;->fail(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 65
    .end local v3    # "pairs":Ljava/util/Map$Entry;
    :cond_1
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 2
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    const-string v1, "The location has been updated!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-direct {p0, p1}, Lorg/apache/cordova/CordovaLocationListener;->win(Landroid/location/Location;)V

    .line 135
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 3
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Location provider \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' disabled."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    sget v0, Lorg/apache/cordova/CordovaLocationListener;->POSITION_UNAVAILABLE:I

    const-string v1, "GPS provider disabled."

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CordovaLocationListener;->fail(ILjava/lang/String;)V

    .line 93
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 3
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Location provider "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has been enabled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The status of the provider "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has changed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    if-nez p2, :cond_0

    .line 116
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is OUT OF SERVICE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    sget v0, Lorg/apache/cordova/CordovaLocationListener;->POSITION_UNAVAILABLE:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provider "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is out of service."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CordovaLocationListener;->fail(ILjava/lang/String;)V

    .line 125
    :goto_0
    return-void

    .line 119
    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    .line 120
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is TEMPORARILY_UNAVAILABLE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 123
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is AVAILABLE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public size()I
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->watches:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    iget-object v1, p0, Lorg/apache/cordova/CordovaLocationListener;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected start()V
    .locals 6

    .prologue
    .line 179
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaLocationListener;->running:Z

    if-nez v0, :cond_0

    .line 180
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getProvider(Ljava/lang/String;)Landroid/location/LocationProvider;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaLocationListener;->running:Z

    .line 182
    iget-object v0, p0, Lorg/apache/cordova/CordovaLocationListener;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    const-wide/32 v2, 0xea60

    const/high16 v4, 0x41200000    # 10.0f

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 184
    :cond_1
    sget v0, Lorg/apache/cordova/CordovaLocationListener;->POSITION_UNAVAILABLE:I

    const-string v1, "Network provider is not available."

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CordovaLocationListener;->fail(ILjava/lang/String;)V

    goto :goto_0
.end method
