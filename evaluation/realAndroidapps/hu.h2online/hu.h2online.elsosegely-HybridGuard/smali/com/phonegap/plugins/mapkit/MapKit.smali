.class public Lcom/phonegap/plugins/mapkit/MapKit;
.super Lorg/apache/cordova/CordovaPlugin;
.source "MapKit.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private cCtx:Lorg/apache/cordova/CallbackContext;

.field protected main:Landroid/widget/RelativeLayout;

.field protected mapView:Lcom/google/android/gms/maps/MapView;

.field protected root:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 35
    const-string v0, "MapKitPlugin"

    iput-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/phonegap/plugins/mapkit/MapKit;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/phonegap/plugins/mapkit/MapKit;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;
    .locals 1
    .param p0, "x0"    # Lcom/phonegap/plugins/mapkit/MapKit;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method static synthetic access$200(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONObject;)Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 1
    .param p0, "x0"    # Lcom/phonegap/plugins/mapkit/MapKit;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/phonegap/plugins/mapkit/MapKit;->getBitmapDescriptor(Lorg/json/JSONObject;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    return-object v0
.end method

.method private getBitmapDescriptor(Lorg/json/JSONObject;)Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 8
    .param p1, "iconOption"    # Lorg/json/JSONObject;

    .prologue
    .line 195
    :try_start_0
    const-string v6, "icon"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 196
    .local v3, "o":Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "type":Ljava/lang/String;
    const/4 v4, 0x0

    .line 197
    .local v4, "resource":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "org.json.JSONObject"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 198
    move-object v0, v3

    check-cast v0, Lorg/json/JSONObject;

    move-object v2, v0

    .line 199
    .local v2, "icon":Lorg/json/JSONObject;
    const-string v6, "type"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "resource"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 200
    const-string v6, "type"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 201
    const-string v6, "resource"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 202
    const-string v6, "asset"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 203
    invoke-static {v4}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->fromAsset(Ljava/lang/String;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v6

    .line 213
    .end local v2    # "icon":Lorg/json/JSONObject;
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "resource":Ljava/lang/String;
    .end local v5    # "type":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 208
    .restart local v3    # "o":Ljava/lang/Object;
    .restart local v4    # "resource":Ljava/lang/String;
    .restart local v5    # "type":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    invoke-static {v6}, Lcom/google/android/gms/maps/model/BitmapDescriptorFactory;->defaultMarker(F)Lcom/google/android/gms/maps/model/BitmapDescriptor;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    goto :goto_0

    .line 210
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "resource":Ljava/lang/String;
    .end local v5    # "type":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 211
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 213
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private hideMap()V
    .locals 3

    .prologue
    .line 120
    :try_start_0
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/mapkit/MapKit$2;

    invoke-direct {v2, p0}, Lcom/phonegap/plugins/mapkit/MapKit$2;-><init>(Lcom/phonegap/plugins/mapkit/MapKit;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_0
    return-void

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 136
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    const-string v2, "MapKitPlugin::hideMap(): An exception occured"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public addMapPins(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "pins"    # Lorg/json/JSONArray;

    .prologue
    .line 142
    :try_start_0
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/mapkit/MapKit$3;

    invoke-direct {v2, p0, p1}, Lcom/phonegap/plugins/mapkit/MapKit$3;-><init>(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONArray;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    return-void

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 189
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    const-string v2, "MapKitPlugin::addMapPins(): An exception occured"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public changeMapType(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 235
    :try_start_0
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/mapkit/MapKit$5;

    invoke-direct {v2, p0, p1}, Lcom/phonegap/plugins/mapkit/MapKit$5;-><init>(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    :goto_0
    return-void

    .line 256
    :catch_0
    move-exception v0

    .line 257
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 258
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    const-string v2, "MapKitPlugin::changeMapType(): An exception occured "

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public clearMapPins()V
    .locals 3

    .prologue
    .line 218
    :try_start_0
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/mapkit/MapKit$4;

    invoke-direct {v2, p0}, Lcom/phonegap/plugins/mapkit/MapKit$4;-><init>(Lcom/phonegap/plugins/mapkit/MapKit;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    :goto_0
    return-void

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 229
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    const-string v2, "MapKitPlugin::clearMapPins(): An exception occured"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 264
    iput-object p3, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    .line 265
    const-string v0, "showMap"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 266
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/phonegap/plugins/mapkit/MapKit;->showMap(Lorg/json/JSONObject;)V

    .line 276
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const/4 v0, 0x1

    return v0

    .line 267
    :cond_1
    const-string v0, "hideMap"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    .line 268
    invoke-direct {p0}, Lcom/phonegap/plugins/mapkit/MapKit;->hideMap()V

    goto :goto_0

    .line 269
    :cond_2
    const-string v0, "addMapPins"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 270
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/phonegap/plugins/mapkit/MapKit;->addMapPins(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 271
    :cond_3
    const-string v0, "clearMapPins"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 272
    invoke-virtual {p0}, Lcom/phonegap/plugins/mapkit/MapKit;->clearMapPins()V

    goto :goto_0

    .line 273
    :cond_4
    const-string v0, "changeMapType"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 274
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/phonegap/plugins/mapkit/MapKit;->changeMapType(Lorg/json/JSONObject;)V

    goto :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 40
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    .line 41
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 301
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    const-string v1, "MapKitPlugin::onDestroy()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onDestroy()V

    .line 305
    :cond_0
    invoke-super {p0}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    .line 306
    return-void
.end method

.method public onPause(Z)V
    .locals 2
    .param p1, "multitasking"    # Z

    .prologue
    .line 283
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    const-string v1, "MapKitPlugin::onPause()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onPause()V

    .line 287
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    .line 288
    return-void
.end method

.method public onResume(Z)V
    .locals 2
    .param p1, "multitasking"    # Z

    .prologue
    .line 292
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->TAG:Ljava/lang/String;

    const-string v1, "MapKitPlugin::onResume()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 296
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    .line 297
    return-void
.end method

.method public showMap(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/phonegap/plugins/mapkit/MapKit$1;

    invoke-direct {v2, p0, p1}, Lcom/phonegap/plugins/mapkit/MapKit$1;-><init>(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :goto_0
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 114
    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit;->cCtx:Lorg/apache/cordova/CallbackContext;

    const-string v2, "MapKitPlugin::showMap(): An exception occured"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method
