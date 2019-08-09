.class public Lorg/apache/cordova/GeoBroker;
.super Lorg/apache/cordova/api/Plugin;
.source "GeoBroker.java"


# instance fields
.field private geoListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/GeoListener;",
            ">;"
        }
    .end annotation
.end field

.field private global:Lorg/apache/cordova/GeoListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    .line 47
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 8
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 58
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 59
    .local v3, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v1, ""

    .line 62
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    const-string v4, "getCurrentLocation"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 63
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getInt(I)I

    move-result v5

    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    invoke-virtual {p0, v4, v5, v6}, Lorg/apache/cordova/GeoBroker;->getCurrentLocation(ZII)V

    .line 72
    :cond_0
    :goto_0
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v4, v3, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 74
    :goto_1
    return-object v4

    .line 65
    :cond_1
    const-string v4, "start"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 66
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v5

    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    const/4 v7, 0x3

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    invoke-virtual {p0, v4, v5, v6, v7}, Lorg/apache/cordova/GeoBroker;->start(Ljava/lang/String;ZII)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "s":Ljava/lang/String;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v4, v3, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 73
    .end local v2    # "s":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 69
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    const-string v4, "stop"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 70
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/cordova/GeoBroker;->stop(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public getCurrentLocation(ZII)V
    .locals 2
    .param p1, "enableHighAccuracy"    # Z
    .param p2, "timeout"    # I
    .param p3, "maximumAge"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Lorg/apache/cordova/GeoListener;

    const-string v1, "global"

    invoke-direct {v0, p0, v1, p3}, Lorg/apache/cordova/GeoListener;-><init>(Lorg/apache/cordova/GeoBroker;Ljava/lang/String;I)V

    iput-object v0, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    .line 129
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    invoke-virtual {v0, p3}, Lorg/apache/cordova/GeoListener;->start(I)V

    goto :goto_0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 86
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    .line 94
    iget-object v4, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 95
    .local v3, "s":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/cordova/GeoListener;>;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 96
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/cordova/GeoListener;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 98
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/cordova/GeoListener;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/GeoListener;

    .line 99
    .local v2, "listener":Lorg/apache/cordova/GeoListener;
    invoke-virtual {v2}, Lorg/apache/cordova/GeoListener;->destroy()V

    goto :goto_0

    .line 101
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/cordova/GeoListener;>;"
    .end local v2    # "listener":Lorg/apache/cordova/GeoListener;
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 102
    iget-object v4, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    if-eqz v4, :cond_1

    .line 103
    iget-object v4, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    invoke-virtual {v4}, Lorg/apache/cordova/GeoListener;->destroy()V

    .line 105
    :cond_1
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/cordova/GeoBroker;->global:Lorg/apache/cordova/GeoListener;

    .line 106
    return-void
.end method

.method public start(Ljava/lang/String;ZII)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "enableHighAccuracy"    # Z
    .param p3, "timeout"    # I
    .param p4, "maximumAge"    # I

    .prologue
    .line 143
    iget-object v1, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/GeoListener;

    .line 144
    .local v0, "listener":Lorg/apache/cordova/GeoListener;
    if-nez v0, :cond_0

    .line 145
    new-instance v0, Lorg/apache/cordova/GeoListener;

    .end local v0    # "listener":Lorg/apache/cordova/GeoListener;
    invoke-direct {v0, p0, p1, p4}, Lorg/apache/cordova/GeoListener;-><init>(Lorg/apache/cordova/GeoBroker;Ljava/lang/String;I)V

    .line 146
    .restart local v0    # "listener":Lorg/apache/cordova/GeoListener;
    iget-object v1, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    :cond_0
    invoke-virtual {v0, p4}, Lorg/apache/cordova/GeoListener;->start(I)V

    .line 151
    return-object p1
.end method

.method public stop(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v1, p0, Lorg/apache/cordova/GeoBroker;->geoListeners:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/GeoListener;

    .line 161
    .local v0, "listener":Lorg/apache/cordova/GeoListener;
    if-eqz v0, :cond_0

    .line 162
    invoke-virtual {v0}, Lorg/apache/cordova/GeoListener;->stop()V

    .line 164
    :cond_0
    return-void
.end method
