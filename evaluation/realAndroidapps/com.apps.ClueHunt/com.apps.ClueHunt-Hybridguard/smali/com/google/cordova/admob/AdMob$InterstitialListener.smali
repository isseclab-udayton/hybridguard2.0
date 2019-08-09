.class Lcom/google/cordova/admob/AdMob$InterstitialListener;
.super Lcom/google/android/gms/ads/AdListener;
.source "AdMob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/cordova/admob/AdMob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InterstitialListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;


# direct methods
.method private constructor <init>(Lcom/google/cordova/admob/AdMob;)V
    .locals 0

    .prologue
    .line 557
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/cordova/admob/AdMob;Lcom/google/cordova/admob/AdMob$InterstitialListener;)V
    .locals 0

    .prologue
    .line 557
    invoke-direct {p0, p1}, Lcom/google/cordova/admob/AdMob$InterstitialListener;-><init>(Lcom/google/cordova/admob/AdMob;)V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 2

    .prologue
    .line 588
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onInterstitialDismiss\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 589
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/cordova/admob/AdMob;->access$6(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)V

    .line 590
    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 5
    .param p1, "errorCode"    # I

    .prologue
    .line 560
    const-string v0, "AdMob"

    const-string v1, "Failed to load interstitial Ad"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 562
    const-string v1, "javascript:cordova.fireDocumentEvent(\'onInterstitialFailedToReceive\', { \'error\': %d, \'reason\':\'%s\' });"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 563
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-virtual {v4, p1}, Lcom/google/cordova/admob/AdMob;->getErrorReason(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 561
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 564
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 2

    .prologue
    .line 568
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onInterstitialLeaveApp\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 569
    return-void
.end method

.method public onAdLoaded()V
    .locals 2

    .prologue
    .line 573
    const-string v0, "AdMob"

    const-string v1, "InterstitialAdLoaded"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onInterstitialReceive\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 576
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$0(Lcom/google/cordova/admob/AdMob;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 577
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/cordova/admob/AdMob;->access$5(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 579
    :cond_0
    return-void
.end method

.method public onAdOpened()V
    .locals 2

    .prologue
    .line 583
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$InterstitialListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onInterstitialPresent\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 584
    return-void
.end method
