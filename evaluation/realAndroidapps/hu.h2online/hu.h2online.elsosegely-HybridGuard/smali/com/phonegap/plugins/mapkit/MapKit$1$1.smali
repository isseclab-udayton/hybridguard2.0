.class Lcom/phonegap/plugins/mapkit/MapKit$1$1;
.super Ljava/lang/Object;
.source "MapKit.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/mapkit/MapKit$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/phonegap/plugins/mapkit/MapKit$1;

.field final synthetic val$resultCode:I


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/mapkit/MapKit$1;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/phonegap/plugins/mapkit/MapKit$1;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/phonegap/plugins/mapkit/MapKit$1$1;->this$1:Lcom/phonegap/plugins/mapkit/MapKit$1;

    iput p2, p0, Lcom/phonegap/plugins/mapkit/MapKit$1$1;->val$resultCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/phonegap/plugins/mapkit/MapKit$1$1;->this$1:Lcom/phonegap/plugins/mapkit/MapKit$1;

    iget-object v0, v0, Lcom/phonegap/plugins/mapkit/MapKit$1;->this$0:Lcom/phonegap/plugins/mapkit/MapKit;

    invoke-static {v0}, Lcom/phonegap/plugins/mapkit/MapKit;->access$100(Lcom/phonegap/plugins/mapkit/MapKit;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "com.google.android.gms.common.ConnectionResult "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/phonegap/plugins/mapkit/MapKit$1$1;->val$resultCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 104
    return-void
.end method
