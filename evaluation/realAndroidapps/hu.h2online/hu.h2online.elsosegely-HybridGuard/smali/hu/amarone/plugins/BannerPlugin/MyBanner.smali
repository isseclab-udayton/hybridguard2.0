.class public Lhu/amarone/plugins/BannerPlugin/MyBanner;
.super Landroid/widget/RelativeLayout;
.source "MyBanner.java"


# instance fields
.field public ctx:Landroid/content/Context;

.field public mAdView:Lcom/google/android/gms/ads/AdView;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIII)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "x1"    # I
    .param p3, "y1"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v4, 0x0

    .line 28
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 29
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->ctx:Landroid/content/Context;

    .line 31
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    invoke-virtual {p0, v4}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->setBackgroundColor(I)V

    .line 34
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 35
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->ctx:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 36
    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 38
    new-instance v2, Lcom/google/android/gms/ads/AdView;

    invoke-direct {v2, p1}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    .line 39
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, p5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 40
    .local v1, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 41
    invoke-virtual {v1, v4, v4, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 42
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v2, v1}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    const/16 v3, 0x82

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->requestFocus(I)Z

    .line 44
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    sget-object v3, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->setAdSize(Lcom/google/android/gms/ads/AdSize;)V

    .line 46
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v2, v4}, Lcom/google/android/gms/ads/AdView;->setVerticalScrollBarEnabled(Z)V

    .line 47
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v2, v4}, Lcom/google/android/gms/ads/AdView;->setHorizontalScrollBarEnabled(Z)V

    .line 48
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    new-instance v3, Lhu/amarone/plugins/BannerPlugin/MyBanner$1;

    invoke-direct {v3, p0}, Lhu/amarone/plugins/BannerPlugin/MyBanner$1;-><init>(Lhu/amarone/plugins/BannerPlugin/MyBanner;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 56
    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->addView(Landroid/view/View;)V

    .line 58
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->setVisibility(I)V

    .line 59
    return-void
.end method


# virtual methods
.method public convertToDp(I)I
    .locals 3
    .param p1, "input"    # I

    .prologue
    .line 97
    invoke-virtual {p0}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 98
    .local v0, "scale":F
    int-to-float v1, p1

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    float-to-int v1, v1

    return v1
.end method

.method public doubleSize(I)V
    .locals 4
    .param p1, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 83
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-virtual {p0, p1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->convertToDp(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 84
    .local v0, "iFrameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xc

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 85
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 86
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    return-void
.end method

.method public hideWebView()V
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->setVisibility(I)V

    .line 95
    return-void
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/ads/AdView;->setAdUnitId(Ljava/lang/String;)V

    .line 102
    new-instance v1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 103
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 104
    return-void
.end method

.method public resize(I)V
    .locals 4
    .param p1, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 62
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-virtual {p0, p1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->convertToDp(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 63
    .local v0, "iFrameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xc

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 64
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 65
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    return-void
.end method

.method public resize(IIII)V
    .locals 4
    .param p1, "x1"    # I
    .param p2, "y1"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 69
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-virtual {p0, p4}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->convertToDp(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 70
    .local v0, "iFrameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xc

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 71
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 72
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    return-void
.end method

.method public showWebView()V
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->setVisibility(I)V

    .line 91
    return-void
.end method

.method public singleSize(I)V
    .locals 4
    .param p1, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 76
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-virtual {p0, p1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->convertToDp(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 77
    .local v0, "iFrameParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xc

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 78
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 79
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    return-void
.end method
