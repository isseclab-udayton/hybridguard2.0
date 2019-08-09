.class Lorg/apache/cordova/splashscreen/SplashScreen$3$1;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/splashscreen/SplashScreen$3;


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen$3;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/splashscreen/SplashScreen$3;

    .prologue
    .line 223
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$3$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    const/4 v1, 0x0

    .line 231
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$000()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$000()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$000()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 233
    invoke-static {v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$002(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 234
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$3$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$3;

    iget-object v0, v0, Lorg/apache/cordova/splashscreen/SplashScreen$3;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    invoke-static {v0, v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$202(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    .line 236
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 240
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 226
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$3$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$3;

    iget-object v0, v0, Lorg/apache/cordova/splashscreen/SplashScreen$3;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    invoke-static {v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    .line 227
    return-void
.end method
