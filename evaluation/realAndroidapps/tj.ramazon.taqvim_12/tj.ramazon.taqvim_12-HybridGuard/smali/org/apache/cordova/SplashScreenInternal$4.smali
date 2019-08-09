.class Lorg/apache/cordova/SplashScreenInternal$4;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal;->removeSplashScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/SplashScreenInternal;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$4;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 134
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$1()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$1()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$1()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 136
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/apache/cordova/SplashScreenInternal;->access$2(Landroid/app/Dialog;)V

    .line 138
    :cond_0
    return-void
.end method
