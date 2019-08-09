.class Lorg/apache/cordova/deviceorientation/CompassListener$1;
.super Ljava/lang/Object;
.source "CompassListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/deviceorientation/CompassListener;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/deviceorientation/CompassListener;


# direct methods
.method constructor <init>(Lorg/apache/cordova/deviceorientation/CompassListener;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lorg/apache/cordova/deviceorientation/CompassListener$1;->this$0:Lorg/apache/cordova/deviceorientation/CompassListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/cordova/deviceorientation/CompassListener$1;->this$0:Lorg/apache/cordova/deviceorientation/CompassListener;

    invoke-static {v0}, Lorg/apache/cordova/deviceorientation/CompassListener;->access$000(Lorg/apache/cordova/deviceorientation/CompassListener;)V

    .line 118
    return-void
.end method
