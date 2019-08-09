.class Lcom/google/cordova/admob/AdMob$BannerListener;
.super Lcom/google/android/gms/ads/AdListener;
.source "AdMob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/cordova/admob/AdMob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BannerListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;


# direct methods
.method private constructor <init>(Lcom/google/cordova/admob/AdMob;)V
    .locals 0

    .prologue
    .line 515
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/cordova/admob/AdMob;Lcom/google/cordova/admob/AdMob$BannerListener;)V
    .locals 0

    .prologue
    .line 515
    invoke-direct {p0, p1}, Lcom/google/cordova/admob/AdMob$BannerListener;-><init>(Lcom/google/cordova/admob/AdMob;)V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 2

    .prologue
    .line 545
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onBannerDismiss\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 546
    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 5
    .param p1, "errorCode"    # I

    .prologue
    .line 518
    const-string v0, "AdMob"

    const-string v1, "Failed to load banner Ad"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 520
    const-string v1, "javascript:cordova.fireDocumentEvent(\'onBannerFailedToReceive\', { \'error\': %d, \'reason\':\'%s\' });"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 521
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-virtual {v4, p1}, Lcom/google/cordova/admob/AdMob;->getErrorReason(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 519
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 522
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 2

    .prologue
    .line 526
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onBannerLeaveApp\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 527
    return-void
.end method

.method public onAdLoaded()V
    .locals 5

    .prologue
    .line 531
    const-string v0, "AdMob"

    const-string v1, "BannerAdLoaded"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onBannerReceive\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 533
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$0(Lcom/google/cordova/admob/AdMob;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$1(Lcom/google/cordova/admob/AdMob;)I

    move-result v1

    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$2(Lcom/google/cordova/admob/AdMob;)I

    move-result v2

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v3}, Lcom/google/cordova/admob/AdMob;->access$3(Lcom/google/cordova/admob/AdMob;)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/cordova/admob/AdMob;->access$4(Lcom/google/cordova/admob/AdMob;IIILorg/apache/cordova/CallbackContext;)V

    .line 536
    :cond_0
    return-void
.end method

.method public onAdOpened()V
    .locals 2

    .prologue
    .line 540
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$BannerListener;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "javascript:cordova.fireDocumentEvent(\'onBannerPresent\');"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 541
    return-void
.end method
