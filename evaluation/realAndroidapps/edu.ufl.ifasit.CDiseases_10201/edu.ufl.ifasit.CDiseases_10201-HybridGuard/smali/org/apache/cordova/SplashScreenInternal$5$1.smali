.class Lorg/apache/cordova/SplashScreenInternal$5$1;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/SplashScreenInternal$5;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal$5;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/SplashScreenInternal$5;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$5$1;->this$1:Lorg/apache/cordova/SplashScreenInternal$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal$5$1;->this$1:Lorg/apache/cordova/SplashScreenInternal$5;

    iget-object v0, v0, Lorg/apache/cordova/SplashScreenInternal$5;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    invoke-static {v0}, Lorg/apache/cordova/SplashScreenInternal;->access$200(Lorg/apache/cordova/SplashScreenInternal;)V

    .line 195
    return-void
.end method
