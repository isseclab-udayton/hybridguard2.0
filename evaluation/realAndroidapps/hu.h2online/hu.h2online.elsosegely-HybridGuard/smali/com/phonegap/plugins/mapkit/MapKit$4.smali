.class Lcom/phonegap/plugins/mapkit/MapKit$4;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit;->clearMapPins()V
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
    .line 218
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$4;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$4;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$4;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit;->mapView:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 223
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$4;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v0}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 225
    :cond_0
    return-void
.end method
