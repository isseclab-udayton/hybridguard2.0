.class Lcom/google/cordova/admob/AdMob$6;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->executeShowInterstitial(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$6;->this$0:Lcom/google/cordova/admob/AdMob;

    iput-object p2, p0, Lcom/google/cordova/admob/AdMob$6;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$6;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$6;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    .line 472
    :cond_0
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$6;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$6;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 473
    :cond_1
    return-void
.end method
