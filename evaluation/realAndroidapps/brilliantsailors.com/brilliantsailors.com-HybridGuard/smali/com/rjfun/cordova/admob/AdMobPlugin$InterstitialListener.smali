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
    .line 534
    iput-object p1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p2, "x1"    # Lcom/rjfun/cordova/admob/AdMobPlugin$1;

    .prologue
    .line 534
    invoke-direct {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;)V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 3

    .prologue
    .line 562
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdDismiss"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1700(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->removeInterstitial()V

    .line 564
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
    .line 538
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdFailLoad"

    iget-object v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v2, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getErrorReason(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "interstitial"

    invoke-static {v0, v1, p1, v2, v3}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1200(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 539
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 3

    .prologue
    .line 543
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdLeaveApp"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1300(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    return-void
.end method

.method public onAdLoaded()V
    .locals 3

    .prologue
    .line 548
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-static {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1400(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 549
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->showInterstitial()V

    .line 552
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdLoaded"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1500(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    return-void
.end method

.method public onAdOpened()V
    .locals 3

    .prologue
    .line 557
    iget-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;->this$0:Lcom/rjfun/cordova/admob/AdMobPlugin;

    const-string v1, "onAdPresent"

    const-string v2, "interstitial"

    invoke-static {v0, v1, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->access$1600(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    return-void
.end method
