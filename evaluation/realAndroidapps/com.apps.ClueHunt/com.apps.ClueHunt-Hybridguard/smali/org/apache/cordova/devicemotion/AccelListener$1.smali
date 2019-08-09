.class Lorg/apache/cordova/devicemotion/AccelListener$1;
.super Ljava/lang/Object;
.source "AccelListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/devicemotion/AccelListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/devicemotion/AccelListener;


# direct methods
.method constructor <init>(Lorg/apache/cordova/devicemotion/AccelListener;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/cordova/devicemotion/AccelListener$1;->this$0:Lorg/apache/cordova/devicemotion/AccelListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/cordova/devicemotion/AccelListener$1;->this$0:Lorg/apache/cordova/devicemotion/AccelListener;

    invoke-static {v0}, Lorg/apache/cordova/devicemotion/AccelListener;->access$000(Lorg/apache/cordova/devicemotion/AccelListener;)V

    .line 66
    return-void
.end method
