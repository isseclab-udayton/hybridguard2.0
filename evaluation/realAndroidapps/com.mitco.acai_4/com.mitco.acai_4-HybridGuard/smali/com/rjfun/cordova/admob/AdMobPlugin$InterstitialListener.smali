.class Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;
.super Lcom/google/android/gms/ads/AdListener;
.source "AdMobPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rjfun/cordova/admob/AdMobPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InterstitialListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;


# direct methods
.method private constructor <init>(Lcom/rjfun/cordova/admob/AdMobPlugin;)V
    .locals 0

    .prologue
    .line 374
    iput-object p1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;)V
    .locals 0

    .prologue
    .line 374
    invoke-direct {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;)V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 3

    .prologue
    .line 402
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdDismiss"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->removeInterstitial()V

    .line 404
    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 4
    .param p1, "errorCode"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdFailLoad"

    iget-object v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v2, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getErrorReason(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "interstitial"

    invoke-static {v0, v1, p1, v2, v3}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$0(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 379
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 3

    .prologue
    .line 383
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdLeaveApp"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    return-void
.end method

.method public onAdLoaded()V
    .locals 3

    .prologue
    .line 388
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-static {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$7(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->showInterstitial()V

    .line 392
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdLoaded"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    return-void
.end method

.method public onAdOpened()V
    .locals 3

    .prologue
    .line 397
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdPresent"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    return-void
.end method
