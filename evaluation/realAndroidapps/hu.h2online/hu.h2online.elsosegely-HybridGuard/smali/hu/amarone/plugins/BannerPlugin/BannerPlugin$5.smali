.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;
.super Ljava/lang/Object;
.source "BannerPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    .prologue
    .line 132
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iput-object p2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 135
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->getAdUnitId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 136
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->loadPromoBanner(Ljava/lang/String;)V

    .line 142
    :goto_0
    return-void

    .line 138
    :cond_0
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    new-instance v1, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v2, v2, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    .line 139
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->loadPromoBanner(Ljava/lang/String;)V

    goto :goto_0
.end method
