.class Lcom/phonegap/plugins/mapkit/MapKit$2;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit;->hideMap()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/mapkit/MapKit;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/mapkit/MapKit;)V
    .locals 0
    .param p1, "this$0"    # Lcom/phonegap/plugins/mapkit/MapKit;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onDestroy()V

    .line 125
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v1, v1, Lcom/phonegap/plugins/mapkit/MapKit;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 126
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->main:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v1, v1, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 127
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->root:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v1, v1, Lcom/phonegap/plugins/mapkit/MapKit;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 128
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v1, v1, Lcom/phonegap/plugins/mapkit/MapKit;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 129
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    .line 130
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$2;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v0}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 132
    :cond_0
    return-void
.end method
