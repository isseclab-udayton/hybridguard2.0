.class public Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;
.super Landroid/widget/RelativeLayout;
.source "MyPromoBanner.java"


# instance fields
.field public ctx:Landroid/content/Context;

.field public mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->ctx:Landroid/content/Context;

    .line 30
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->setBackgroundColor(I)V

    .line 33
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 34
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->ctx:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 35
    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 37
    new-instance v1, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-direct {v1, p1}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    .line 39
    return-void
.end method


# virtual methods
.method public convertToDp(I)I
    .locals 3
    .param p1, "input"    # I

    .prologue
    .line 52
    invoke-virtual {p0}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 53
    .local v0, "scale":F
    int-to-float v1, p1

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    float-to-int v1, v1

    return v1
.end method

.method public hidePromoBanner()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->setVisibility(I)V

    .line 49
    return-void
.end method

.method public loadPromoBanner(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 56
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 57
    new-instance v1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 58
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 59
    return-void
.end method

.method public showPromoBanner()V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;->mInterstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    .line 45
    :cond_0
    return-void
.end method
