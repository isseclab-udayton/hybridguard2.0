.class Lcom/google/cordova/admob/AdMob$5;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->executePrepareInterstitial(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field private final synthetic val$strUnitId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/cordova/admob/AdMob;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    iput-object p2, p0, Lcom/google/cordova/admob/AdMob$5;->val$strUnitId:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/cordova/admob/AdMob$5;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 437
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 440
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 441
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 442
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0, v3}, Lcom/google/cordova/admob/AdMob;->access$6(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)V

    .line 444
    :cond_0
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    if-nez v0, :cond_1

    .line 445
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    new-instance v1, Lcom/google/android/gms/ads/InterstitialAd;

    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v2, v2, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/google/cordova/admob/AdMob;->access$6(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)V

    .line 446
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$5;->val$strUnitId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 447
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    new-instance v1, Lcom/google/cordova/admob/AdMob$InterstitialListener;

    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-direct {v1, v2, v3}, Lcom/google/cordova/admob/AdMob$InterstitialListener;-><init>(Lcom/google/cordova/admob/AdMob;Lcom/google/cordova/admob/AdMob$InterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 449
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$5;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$14(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 452
    :cond_1
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$5;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 453
    :cond_2
    return-void
.end method
