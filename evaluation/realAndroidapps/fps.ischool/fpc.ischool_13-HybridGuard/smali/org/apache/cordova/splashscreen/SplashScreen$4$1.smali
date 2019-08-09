.class Lorg/apache/cordova/splashscreen/SplashScreen$4$1;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen$4;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 322
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$9()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;

    invoke-static {v0}, Lorg/apache/cordova/splashscreen/SplashScreen$4;->access$0(Lorg/apache/cordova/splashscreen/SplashScreen$4;)Lorg/apache/cordova/splashscreen/SplashScreen;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$10(Lorg/apache/cordova/splashscreen/SplashScreen;Z)V

    .line 325
    :cond_0
    return-void
.end method
