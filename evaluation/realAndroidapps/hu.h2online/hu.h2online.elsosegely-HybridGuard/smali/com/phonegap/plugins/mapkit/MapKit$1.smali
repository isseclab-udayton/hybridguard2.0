.class Lcom/phonegap/plugins/mapkit/MapKit$1;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit;->showMap(Lorg/json/JSONObject;)V
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
    .line 45
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iput-object p2, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->val$options:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v12, 0x1

    const/4 v14, -0x1

    .line 48
    const-wide/16 v4, 0x0

    .local v4, "latitude":D
    const-wide/16 v6, 0x0

    .line 49
    .local v6, "longitude":D
    const/16 v3, 0x1cc

    .line 50
    .local v3, "height":I
    const/4 v0, 0x0

    .line 52
    .local v0, "atBottom":Z
    :try_start_0
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->val$options:Lorg/json/JSONObject;

    const-string v11, "height"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 53
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->val$options:Lorg/json/JSONObject;

    const-string v11, "lat"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 54
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->val$options:Lorg/json/JSONObject;

    const-string v11, "lon"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 55
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->val$options:Lorg/json/JSONObject;

    const-string v11, "atBottom"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 60
    :goto_0
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v9

    .line 61
    .local v9, "resultCode":I
    if-nez v9, :cond_2

    .line 62
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    new-instance v11, Lcom/google/android/gms/maps/MapView;

    iget-object v12, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v12, v12, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v12

    new-instance v13, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v13}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    invoke-direct {v11, v12, v13}, Lcom/google/android/gms/maps/MapView;-><init>(Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v11, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    .line 64
    iget-object v11, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    iput-object v10, v11, Lcom/phonegap/plugins/mapkit/MapKit;->root:Landroid/view/ViewGroup;

    .line 65
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->root:Landroid/view/ViewGroup;

    iget-object v11, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v11, v11, Lcom/phonegap/plugins/mapkit/MapKit;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v11}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 66
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    iget-object v11, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v11, v11, Lcom/phonegap/plugins/mapkit/MapKit;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v11}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 68
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    iget-object v11, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v11, v11, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    invoke-virtual {v10, v11}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 70
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 72
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v8, v14, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 74
    .local v8, "params":Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz v0, :cond_1

    .line 75
    const/16 v10, 0xc

    invoke-virtual {v8, v10, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 81
    :goto_1
    const/16 v10, 0xe

    invoke-virtual {v8, v10, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 84
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v10, v8}, Lcom/google/android/gms/maps/MapView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/google/android/gms/maps/MapView;->onCreate(Landroid/os/Bundle;)V

    .line 86
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v10}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 88
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    iget-object v11, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v11, v11, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v10, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 91
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v10}, Lcom/google/android/gms/maps/MapView;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v10

    new-instance v11, Lcom/google/android/gms/maps/model/LatLng;

    invoke-direct {v11, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    const/high16 v12, 0x41700000    # 15.0f

    .line 92
    invoke-static {v11, v12}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v11

    .line 91
    invoke-virtual {v10, v11}, Lcom/google/android/gms/maps/GoogleMap;->moveCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    .line 94
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 110
    .end local v8    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    :goto_2
    return-void

    .line 56
    .end local v9    # "resultCode":I
    :catch_0
    move-exception v2

    .line 57
    .local v2, "e":Lorg/json/JSONException;
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v10}, Lcom/phonegap/plugins/mapkit/MapKit;->access$000(Lcom/phonegap/plugins/mapkit/MapKit;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "Error reading options"

    invoke-static {v10, v11}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 78
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v8    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v9    # "resultCode":I
    :cond_1
    const/16 v10, 0xa

    invoke-virtual {v8, v10, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_1

    .line 96
    .end local v8    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2
    if-eq v9, v12, :cond_3

    const/4 v10, 0x2

    if-eq v9, v10, :cond_3

    const/4 v10, 0x3

    if-ne v9, v10, :cond_0

    .line 99
    :cond_3
    iget-object v10, p0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v10, v10, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    new-instance v11, Lcom/phonegap/plugins/mapkit/MapKit$1$1;

    invoke-direct {v11, p0, v9}, Lcom/phonegap/plugins/mapkit/MapKit$1$1;-><init>(Lcom/phonegap/plugins/mapkit/MapKit$1;I)V

    invoke-static {v9, v10, v12, v11}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;ILandroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;

    move-result-object v1

    .line 107
    .local v1, "dialog":Landroid/app/Dialog;
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    goto :goto_2
.end method
