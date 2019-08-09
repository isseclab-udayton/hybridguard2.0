.class Lcom/phonegap/plugins/mapkit/MapKit$5;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit;->changeMapType(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/mapkit/MapKit;

.field final synthetic val$options:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "this$0"    # Lcom/phonegap/plugins/mapkit/MapKit;

    .prologue
    .line 235
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iput-object p2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->val$options:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 239
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v2, v2, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v2, :cond_0

    .line 240
    const/4 v1, 0x0

    .line 242
    .local v1, "mapType":I
    :try_start_0
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->val$options:Lorg/json/JSONObject;

    const-string v3, "mapType"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 248
    :goto_0
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v2, v2, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/MapView;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->getMapType()I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 249
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v2, v2, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/MapView;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/android/gms/maps/GoogleMap;->setMapType(I)V

    .line 253
    .end local v1    # "mapType":I
    :cond_0
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v2}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 254
    return-void

    .line 243
    .restart local v1    # "mapType":I
    :catch_0
    move-exception v0

    .line 244
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$5;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v2}, Lcom/phonegap/plugins/mapkit/MapKit;->access$000(Lcom/phonegap/plugins/mapkit/MapKit;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Error reading options"

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
