.class Lcom/phonegap/plugins/mapkit/MapKit$3;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit;->addMapPins(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/mapkit/MapKit;

.field final synthetic val$pins:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/phonegap/plugins/mapkit/MapKit;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iput-object p2, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->val$pins:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 145
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v10, :cond_3

    .line 147
    const/4 v2, 0x0

    .local v2, "i":I
    :try_start_0
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->val$pins:Lorg/json/JSONArray;

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v3

    .local v3, "j":I
    :goto_0
    if-ge v2, v3, :cond_4

    .line 148
    const-wide/16 v4, 0x0

    .local v4, "latitude":D
    const-wide/16 v6, 0x0

    .line 149
    .local v6, "longitude":D
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->val$pins:Lorg/json/JSONArray;

    invoke-virtual {v10, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 150
    .local v9, "options":Lorg/json/JSONObject;
    const-string v10, "lat"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 151
    const-string v10, "lon"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 153
    new-instance v8, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v8}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 155
    .local v8, "mOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    new-instance v10, Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {v10, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v8, v10}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 157
    const-string v10, "title"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 158
    const-string v10, "title"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 160
    :cond_0
    const-string v10, "snippet"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 161
    const-string v10, "snippet"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/google/android/gms/maps/model/MarkerOptions;->snippet(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 163
    :cond_1
    const-string v10, "icon"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 164
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10, v9}, Lcom/phonegap/plugins/mapkit/MapKit;->access$200(Lcom/phonegap/plugins/mapkit/MapKit;Lorg/json/JSONObject;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v0

    .line 165
    .local v0, "bDesc":Lcom/google/android/gms/maps/model/BitmapDescriptor;
    if-eqz v0, :cond_2

    .line 166
    invoke-virtual {v8, v0}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 173
    .end local v0    # "bDesc":Lcom/google/android/gms/maps/model/BitmapDescriptor;
    :cond_2
    :try_start_1
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v10}, Lcom/google/android/gms/maps/MapView;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v10

    invoke-virtual {v10, v8}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 174
    :catch_0
    move-exception v1

    .line 175
    .local v1, "e":Ljava/lang/NullPointerException;
    :try_start_2
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$000(Lcom/phonegap/plugins/mapkit/MapKit;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "An error occurred when adding the marker. Check if icon exists"

    invoke-static {v10, v11}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 179
    .end local v1    # "e":Ljava/lang/NullPointerException;
    .end local v3    # "j":I
    .end local v4    # "latitude":D
    .end local v6    # "longitude":D
    .end local v8    # "mOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    .end local v9    # "options":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 180
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 181
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$000(Lcom/phonegap/plugins/mapkit/MapKit;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "An error occurred while reading pins"

    invoke-static {v10, v11}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v10

    const-string v11, "An error occurred while reading pins"

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 185
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "i":I
    :cond_3
    :goto_2
    return-void

    .line 178
    .restart local v2    # "i":I
    .restart local v3    # "j":I
    :cond_4
    :try_start_3
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$3;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2
.end method
