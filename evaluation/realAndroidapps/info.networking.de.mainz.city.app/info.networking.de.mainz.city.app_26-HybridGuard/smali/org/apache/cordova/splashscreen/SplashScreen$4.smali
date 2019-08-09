.class Lorg/apache/cordova/splashscreen/SplashScreen$4;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/splashscreen/SplashScreen;


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 195
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$1()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$1()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$1()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 197
    invoke-static {v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$2(Landroid/app/Dialog;)V

    .line 198
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    invoke-static {v0, v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$3(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)V

    .line 200
    :cond_0
    return-void
.end method
