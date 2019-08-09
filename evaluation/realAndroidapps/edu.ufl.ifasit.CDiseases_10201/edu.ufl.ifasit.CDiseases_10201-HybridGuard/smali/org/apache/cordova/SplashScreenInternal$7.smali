.class Lorg/apache/cordova/SplashScreenInternal$7;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal;->spinnerStop()V
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
    .param p1, "this$0"    # Lorg/apache/cordova/SplashScreenInternal;

    .prologue
    .line 248
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$7;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 250
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$400()Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$400()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    invoke-static {}, Lorg/apache/cordova/SplashScreenInternal;->access$400()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 252
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/apache/cordova/SplashScreenInternal;->access$402(Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 254
    :cond_0
    return-void
.end method
