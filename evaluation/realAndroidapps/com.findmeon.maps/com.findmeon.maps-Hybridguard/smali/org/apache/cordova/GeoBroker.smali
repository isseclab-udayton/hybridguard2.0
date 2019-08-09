.class public Lorg/apache/cordova/GeoBroker;
.super Lorg/apache/cordova/api/Plugin;
.source "GeoBroker.java"


# instance fields
.field private gpsListener:Lorg/apache/cordova/GPSListener;

.field private locationManager:Landroid/location/LocationManager;

.field private networkListener:Lorg/apache/cordova/NetworkListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 46
    return-void
.end method

.method private addWatch(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "timerId"    # Ljava/lang/String;
    .param p2, "callbackId"    # Ljava/lang/String;
    .param p3, "enableHighAccuracy"    # Z

    .prologue
    .line 115
    if-eqz p3, :cond_0

    .line 116
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/GPSListener;->addWatch(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :goto_0
    return-void

    .line 118
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/NetworkListener;->addWatch(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private clearWatch(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/GPSListener;->clearWatch(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NetworkListener;->clearWatch(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method private getCurrentLocation(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "callbackId"    # Ljava/lang/String;
    .param p2, "enableHighAccuracy"    # Z

    .prologue
    .line 107
    if-eqz p2, :cond_0

    .line 108
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/GPSListener;->addCallback(Ljava/lang/String;)V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NetworkListener;->addCallback(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    .line 57
    iget-object v8, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    if-nez v8, :cond_0

    .line 58
    iget-object v8, p0, Lorg/apache/cordova/GeoBroker;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v8}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string v9, "location"

    invoke-virtual {v8, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/location/LocationManager;

    iput-object v8, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    .line 59
    new-instance v8, Lorg/apache/cordova/NetworkListener;

    iget-object v9, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    invoke-direct {v8, v9, p0}, Lorg/apache/cordova/NetworkListener;-><init>(Landroid/location/LocationManager;Lorg/apache/cordova/GeoBroker;)V

    iput-object v8, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    .line 60
    new-instance v8, Lorg/apache/cordova/GPSListener;

    iget-object v9, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    invoke-direct {v8, v9, p0}, Lorg/apache/cordova/GPSListener;-><init>(Landroid/location/LocationManager;Lorg/apache/cordova/GeoBroker;)V

    iput-object v8, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    .line 63
    :cond_0
    sget-object v7, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    .line 64
    .local v7, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v5, "Location API is not available for this device."

    .line 65
    .local v5, "message":Ljava/lang/String;
    new-instance v6, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v6, v7, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 67
    .local v6, "result":Lorg/apache/cordova/api/PluginResult;
    iget-object v8, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    const-string v9, "gps"

    invoke-virtual {v8, v9}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    iget-object v8, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    const-string v9, "network"

    invoke-virtual {v8, v9}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 70
    :cond_1
    invoke-virtual {v6, v10}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 73
    :try_start_0
    const-string v8, "getLocation"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 74
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v1

    .line 75
    .local v1, "enableHighAccuracy":Z
    const/4 v8, 0x1

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    .line 76
    .local v4, "maximumAge":I
    iget-object v9, p0, Lorg/apache/cordova/GeoBroker;->locationManager:Landroid/location/LocationManager;

    if-eqz v1, :cond_3

    const-string v8, "gps"

    :goto_0
    invoke-virtual {v9, v8}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v3

    .line 78
    .local v3, "last":Landroid/location/Location;
    if-eqz v3, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v3}, Landroid/location/Location;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    int-to-long v10, v4

    cmp-long v8, v8, v10

    if-gtz v8, :cond_4

    .line 79
    new-instance v6, Lorg/apache/cordova/api/PluginResult;

    .end local v6    # "result":Lorg/apache/cordova/api/PluginResult;
    sget-object v8, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {p0, v3}, Lorg/apache/cordova/GeoBroker;->returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 97
    .end local v1    # "enableHighAccuracy":Z
    .end local v3    # "last":Landroid/location/Location;
    .end local v4    # "maximumAge":I
    .restart local v6    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_2
    :goto_1
    return-object v6

    .line 76
    .restart local v1    # "enableHighAccuracy":Z
    .restart local v4    # "maximumAge":I
    :cond_3
    const-string v8, "network"

    goto :goto_0

    .line 81
    .restart local v3    # "last":Landroid/location/Location;
    :cond_4
    invoke-direct {p0, p3, v1}, Lorg/apache/cordova/GeoBroker;->getCurrentLocation(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 93
    .end local v1    # "enableHighAccuracy":Z
    .end local v3    # "last":Landroid/location/Location;
    .end local v4    # "maximumAge":I
    .end local v6    # "result":Lorg/apache/cordova/api/PluginResult;
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Lorg/json/JSONException;
    new-instance v6, Lorg/apache/cordova/api/PluginResult;

    sget-object v8, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v6    # "result":Lorg/apache/cordova/api/PluginResult;
    goto :goto_1

    .line 84
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_5
    :try_start_1
    const-string v8, "addWatch"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 85
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 86
    .local v2, "id":Ljava/lang/String;
    const/4 v8, 0x1

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v1

    .line 87
    .restart local v1    # "enableHighAccuracy":Z
    invoke-direct {p0, v2, p3, v1}, Lorg/apache/cordova/GeoBroker;->addWatch(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1

    .line 89
    .end local v1    # "enableHighAccuracy":Z
    .end local v2    # "id":Ljava/lang/String;
    :cond_6
    const-string v8, "clearWatch"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 90
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 91
    .restart local v2    # "id":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/apache/cordova/GeoBroker;->clearWatch(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public fail(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 176
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 177
    .local v2, "obj":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 179
    .local v0, "backup":Ljava/lang/String;
    :try_start_0
    const-string v4, "code"

    invoke-virtual {v2, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 180
    const-string v4, "message"

    invoke-virtual {v2, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :goto_0
    if-eqz v2, :cond_0

    .line 187
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 192
    .local v3, "result":Lorg/apache/cordova/api/PluginResult;
    :goto_1
    invoke-virtual {p0, v3, p3}, Lorg/apache/cordova/GeoBroker;->error(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 193
    return-void

    .line 181
    .end local v3    # "result":Lorg/apache/cordova/api/PluginResult;
    :catch_0
    move-exception v1

    .line 182
    .local v1, "e":Lorg/json/JSONException;
    const/4 v2, 0x0

    .line 183
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\'code\':"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",\'message\':\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    const-string v6, "\'"

    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 189
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v3    # "result":Lorg/apache/cordova/api/PluginResult;
    goto :goto_1
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 130
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 138
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    invoke-virtual {v0}, Lorg/apache/cordova/NetworkListener;->destroy()V

    .line 139
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    invoke-virtual {v0}, Lorg/apache/cordova/GPSListener;->destroy()V

    .line 140
    iput-object v1, p0, Lorg/apache/cordova/GeoBroker;->networkListener:Lorg/apache/cordova/NetworkListener;

    .line 141
    iput-object v1, p0, Lorg/apache/cordova/GeoBroker;->gpsListener:Lorg/apache/cordova/GPSListener;

    .line 142
    return-void
.end method

.method public returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    const/4 v2, 0x0

    .line 145
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 148
    .local v1, "o":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "latitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 149
    const-string v3, "longitude"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 150
    const-string v4, "altitude"

    invoke-virtual {p1}, Landroid/location/Location;->hasAltitude()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    :goto_0
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    const-string v3, "accuracy"

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 152
    const-string v3, "heading"

    invoke-virtual {p1}, Landroid/location/Location;->hasBearing()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Landroid/location/Location;->hasSpeed()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    :cond_0
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    const-string v2, "speed"

    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v3

    float-to-double v3, v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 154
    const-string v2, "timestamp"

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_1
    return-object v1

    :cond_1
    move-object v3, v2

    .line 150
    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public win(Landroid/location/Location;Ljava/lang/String;)V
    .locals 3
    .param p1, "loc"    # Landroid/location/Location;
    .param p2, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/GeoBroker;->returnLocationJSON(Landroid/location/Location;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 165
    .local v0, "result":Lorg/apache/cordova/api/PluginResult;
    invoke-virtual {p0, v0, p2}, Lorg/apache/cordova/GeoBroker;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 166
    return-void
.end method
