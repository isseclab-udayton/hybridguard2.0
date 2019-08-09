.class Lorg/apache/cordova/splashscreen/SplashScreen$5$1;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/splashscreen/SplashScreen$5;


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen$5;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/splashscreen/SplashScreen$5;

    .prologue
    .line 339
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 341
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$1002(Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 342
    return-void
.end method
