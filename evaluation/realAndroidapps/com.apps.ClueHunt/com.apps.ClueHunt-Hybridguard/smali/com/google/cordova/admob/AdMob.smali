.class public Lcom/google/cordova/admob/AdMob;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AdMob.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/cordova/admob/AdMob$BannerListener;,
        Lcom/google/cordova/admob/AdMob$InterstitialListener;,
        Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;
    }
.end annotation


# static fields
.field private static final ACTION_CREATE_BANNER:Ljava/lang/String; = "createBanner"

.field private static final ACTION_HIDE_BANNER:Ljava/lang/String; = "hideBanner"

.field private static final ACTION_IS_INTERSTITIAL_READY:Ljava/lang/String; = "isInterstitialReady"

.field private static final ACTION_PREPARE_INTERSTITIAL:Ljava/lang/String; = "prepareInterstitial"

.field private static final ACTION_REMOVE_BANNER:Ljava/lang/String; = "removeBanner"

.field private static final ACTION_SET_OPTIONS:Ljava/lang/String; = "setOptions"

.field private static final ACTION_SHOW_BANNER:Ljava/lang/String; = "showBanner"

.field private static final ACTION_SHOW_BANNER_AT_XY:Ljava/lang/String; = "showBannerAtXY"

.field private static final ACTION_SHOW_INTERSTITIAL:Ljava/lang/String; = "showInterstitial"

.field private static final BOTTOM_CENTER:I = 0x8

.field private static final BOTTOM_LEFT:I = 0x7

.field private static final BOTTOM_RIGHT:I = 0x9

.field private static final CENTER:I = 0x5

.field private static final DEFAULT_BANNER_ID:Ljava/lang/String; = "ca-app-pub-6869992474017983/4748283957"

.field private static final DEFAULT_INTERSTITIAL_ID:Ljava/lang/String; = "ca-app-pub-6869992474017983/6225017153"

.field private static final DONATION_PERCENT:I = 0x2

.field private static final LEFT:I = 0x4

.field private static final LOGTAG:Ljava/lang/String; = "AdMob"

.field private static final NO_CHANGE:I = 0x0

.field private static final OPT_ADID:Ljava/lang/String; = "adId"

.field private static final OPT_AD_EXTRAS:Ljava/lang/String; = "adExtras"

.field private static final OPT_AD_SIZE:Ljava/lang/String; = "adSize"

.field private static final OPT_AUTO_SHOW:Ljava/lang/String; = "autoShow"

.field private static final OPT_BANNER_ID:Ljava/lang/String; = "bannerId"

.field private static final OPT_HEIGHT:Ljava/lang/String; = "height"

.field private static final OPT_INTERSTITIAL_ID:Ljava/lang/String; = "interstitialId"

.field private static final OPT_IS_TESTING:Ljava/lang/String; = "isTesting"

.field private static final OPT_ORIENTATION_RENEW:Ljava/lang/String; = "orientationRenew"

.field private static final OPT_POSITION:Ljava/lang/String; = "position"

.field private static final OPT_WIDTH:Ljava/lang/String; = "width"

.field private static final OPT_X:Ljava/lang/String; = "x"

.field private static final OPT_Y:Ljava/lang/String; = "y"

.field private static final POS_XY:I = 0xa

.field private static final RIGHT:I = 0x6

.field private static final TOP_CENTER:I = 0x2

.field private static final TOP_LEFT:I = 0x1

.field private static final TOP_RIGHT:I = 0x3


# instance fields
.field private adExtras:Lorg/json/JSONObject;

.field private adPosition:I

.field private adSize:Lcom/google/android/gms/ads/AdSize;

.field private adView:Lcom/google/android/gms/ads/AdView;

.field private adViewLayout:Landroid/widget/RelativeLayout;

.field private autoShow:Z

.field private bannerInited:Z

.field private bannerVisible:Z

.field private height:I

.field private interstialAdId:Ljava/lang/String;

.field private interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

.field private isGpsAvailable:Z

.field private isTesting:Z

.field private orientation:Landroid/view/OrientationEventListener;

.field private orientationRenew:Z

.field private posX:I

.field private posY:I

.field private publisherId:Ljava/lang/String;

.field private width:I

.field private widthOfView:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 91
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    .line 92
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    .line 93
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    .line 95
    const-string v0, "ca-app-pub-6869992474017983/4748283957"

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->publisherId:Ljava/lang/String;

    .line 96
    const-string v0, "ca-app-pub-6869992474017983/6225017153"

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->interstialAdId:Ljava/lang/String;

    .line 98
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 99
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->width:I

    .line 100
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->height:I

    .line 102
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    .line 103
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->posX:I

    .line 104
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->posY:I

    .line 106
    iput-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->isTesting:Z

    .line 107
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->adExtras:Lorg/json/JSONObject;

    .line 108
    iput-boolean v3, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    .line 109
    iput-boolean v3, p0, Lcom/google/cordova/admob/AdMob;->orientationRenew:Z

    .line 111
    iput-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->bannerInited:Z

    .line 112
    iput-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->bannerVisible:Z

    .line 113
    iput-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->isGpsAvailable:Z

    .line 115
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->orientation:Landroid/view/OrientationEventListener;

    .line 116
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->widthOfView:I

    .line 43
    return-void
.end method

.method private __showBanner(IIILorg/apache/cordova/CallbackContext;)V
    .locals 7
    .param p1, "argPos"    # I
    .param p2, "argX"    # I
    .param p3, "argY"    # I
    .param p4, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v0, Lcom/google/cordova/admob/AdMob$4;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/cordova/admob/AdMob$4;-><init>(Lcom/google/cordova/admob/AdMob;IIILorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 400
    return-void
.end method

.method static synthetic access$0(Lcom/google/cordova/admob/AdMob;)Z
    .locals 1

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    return v0
.end method

.method static synthetic access$1(Lcom/google/cordova/admob/AdMob;)I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    return v0
.end method

.method static synthetic access$10(Lcom/google/cordova/admob/AdMob;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$11(Lcom/google/cordova/admob/AdMob;Landroid/widget/RelativeLayout;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    return-void
.end method

.method static synthetic access$12(Lcom/google/cordova/admob/AdMob;Z)V
    .locals 0

    .prologue
    .line 111
    iput-boolean p1, p0, Lcom/google/cordova/admob/AdMob;->bannerInited:Z

    return-void
.end method

.method static synthetic access$13(Lcom/google/cordova/admob/AdMob;Z)V
    .locals 0

    .prologue
    .line 112
    iput-boolean p1, p0, Lcom/google/cordova/admob/AdMob;->bannerVisible:Z

    return-void
.end method

.method static synthetic access$14(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdRequest;
    .locals 1

    .prologue
    .line 302
    invoke-direct {p0}, Lcom/google/cordova/admob/AdMob;->buildAdRequest()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$15(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    return-object v0
.end method

.method static synthetic access$2(Lcom/google/cordova/admob/AdMob;)I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lcom/google/cordova/admob/AdMob;->posX:I

    return v0
.end method

.method static synthetic access$3(Lcom/google/cordova/admob/AdMob;)I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/google/cordova/admob/AdMob;->posY:I

    return v0
.end method

.method static synthetic access$4(Lcom/google/cordova/admob/AdMob;IIILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 345
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/cordova/admob/AdMob;->__showBanner(IIILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$5(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 1

    .prologue
    .line 458
    invoke-direct {p0, p1}, Lcom/google/cordova/admob/AdMob;->executeShowInterstitial(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 92
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    return-void
.end method

.method static synthetic access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    return-object v0
.end method

.method static synthetic access$8(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/AdView;)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    return-void
.end method

.method static synthetic access$9(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdSize;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adSize:Lcom/google/android/gms/ads/AdSize;

    return-object v0
.end method

.method public static adSizeFromString(Ljava/lang/String;)Lcom/google/android/gms/ads/AdSize;
    .locals 1
    .param p0, "size"    # Ljava/lang/String;

    .prologue
    .line 638
    const-string v0, "BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 639
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->BANNER:Lcom/google/android/gms/ads/AdSize;

    .line 651
    :goto_0
    return-object v0

    .line 640
    :cond_0
    const-string v0, "SMART_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 641
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 642
    :cond_1
    const-string v0, "MEDIUM_RECTANGLE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 643
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->MEDIUM_RECTANGLE:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 644
    :cond_2
    const-string v0, "FULL_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 645
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->FULL_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 646
    :cond_3
    const-string v0, "LEADERBOARD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 647
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->LEADERBOARD:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 648
    :cond_4
    const-string v0, "SKYSCRAPER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 649
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->WIDE_SKYSCRAPER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 651
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private buildAdRequest()Lcom/google/android/gms/ads/AdRequest;
    .locals 15
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    .line 303
    new-instance v8, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v8}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    .line 304
    .local v8, "request_builder":Lcom/google/android/gms/ads/AdRequest$Builder;
    iget-boolean v9, p0, Lcom/google/cordova/admob/AdMob;->isTesting:Z

    if-eqz v9, :cond_0

    .line 306
    iget-object v9, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "android_id"

    invoke-static {v9, v10}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "ANDROID_ID":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    .line 308
    .local v3, "deviceId":Ljava/lang/String;
    invoke-virtual {v8, v3}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/ads/AdRequest;->DEVICE_ID_EMULATOR:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v8

    .line 311
    .end local v0    # "ANDROID_ID":Ljava/lang/String;
    .end local v3    # "deviceId":Ljava/lang/String;
    :cond_0
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 312
    .local v2, "bundle":Landroid/os/Bundle;
    const-string v9, "cordova"

    invoke-virtual {v2, v9, v14}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 313
    iget-object v9, p0, Lcom/google/cordova/admob/AdMob;->adExtras:Lorg/json/JSONObject;

    if-eqz v9, :cond_1

    .line 314
    iget-object v9, p0, Lcom/google/cordova/admob/AdMob;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v9}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 315
    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 324
    .end local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    new-instance v1, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;-><init>(Landroid/os/Bundle;)V

    .line 325
    .local v1, "adextras":Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;
    invoke-virtual {v8, v1}, Lcom/google/android/gms/ads/AdRequest$Builder;->addNetworkExtras(Lcom/google/android/gms/ads/mediation/NetworkExtras;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v8

    .line 326
    invoke-virtual {v8}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v7

    .line 328
    .local v7, "request":Lcom/google/android/gms/ads/AdRequest;
    return-object v7

    .line 316
    .end local v1    # "adextras":Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;
    .end local v7    # "request":Lcom/google/android/gms/ads/AdRequest;
    .restart local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 318
    .local v6, "key":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/google/cordova/admob/AdMob;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v6, v9}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 319
    :catch_0
    move-exception v4

    .line 320
    .local v4, "exception":Lorg/json/JSONException;
    const-string v9, "AdMob"

    const-string v10, "Caught JSON Exception: %s"

    new-array v11, v14, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v4}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 3
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 229
    const-string v1, "AdMob"

    const-string v2, "executeCreateBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iput-object p1, p0, Lcom/google/cordova/admob/AdMob;->publisherId:Ljava/lang/String;

    .line 234
    :goto_0
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    const-string p1, "ca-app-pub-6869992474017983/4748283957"

    .line 236
    :cond_0
    move-object v0, p1

    .line 237
    .local v0, "strAdUnitId":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/google/cordova/admob/AdMob$1;

    invoke-direct {v2, p0, v0, p2}, Lcom/google/cordova/admob/AdMob$1;-><init>(Lcom/google/cordova/admob/AdMob;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 275
    const/4 v1, 0x0

    return-object v1

    .line 232
    .end local v0    # "strAdUnitId":Ljava/lang/String;
    :cond_1
    iget-object p1, p0, Lcom/google/cordova/admob/AdMob;->publisherId:Ljava/lang/String;

    goto :goto_0
.end method

.method private executeHideBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 332
    const-string v0, "AdMob"

    const-string v1, "executeHideBanner"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/google/cordova/admob/AdMob$3;

    invoke-direct {v1, p0, p1}, Lcom/google/cordova/admob/AdMob$3;-><init>(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 342
    const/4 v0, 0x0

    return-object v0
.end method

.method private executeIsInterstitialReady(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 189
    const/4 v0, 0x0

    .line 190
    .local v0, "isready":Z
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    const/4 v0, 0x1

    .line 193
    :cond_0
    if-eqz p1, :cond_1

    .line 194
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 197
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private executePrepareInterstitial(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 3
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 431
    const-string v1, "AdMob"

    const-string v2, "executePrepareInterstitial"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    iget-object p1, p0, Lcom/google/cordova/admob/AdMob;->interstialAdId:Ljava/lang/String;

    .line 434
    :cond_0
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_1

    const-string p1, "ca-app-pub-6869992474017983/6225017153"

    .line 436
    :cond_1
    move-object v0, p1

    .line 437
    .local v0, "strUnitId":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/google/cordova/admob/AdMob$5;

    invoke-direct {v2, p0, v0, p2}, Lcom/google/cordova/admob/AdMob$5;-><init>(Lcom/google/cordova/admob/AdMob;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 455
    const/4 v1, 0x0

    return-object v1
.end method

.method private executeRemoveBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 279
    const-string v0, "AdMob"

    const-string v1, "executeRemoveBanner"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/google/cordova/admob/AdMob$2;

    invoke-direct {v1, p0, p1}, Lcom/google/cordova/admob/AdMob$2;-><init>(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 298
    const/4 v0, 0x0

    return-object v0
.end method

.method private executeSetOptions(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 3
    .param p1, "options"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 201
    const-string v0, "AdMob"

    const-string v1, "executeSetOptions"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    if-eqz p1, :cond_c

    .line 204
    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->publisherId:Ljava/lang/String;

    .line 205
    :cond_0
    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->interstialAdId:Ljava/lang/String;

    .line 207
    :cond_1
    const-string v0, "adSize"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "adSize"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->adSizeFromString(Ljava/lang/String;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 208
    :cond_2
    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->width:I

    .line 209
    :cond_3
    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->height:I

    .line 210
    :cond_4
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adSize:Lcom/google/android/gms/ads/AdSize;

    if-nez v0, :cond_5

    .line 211
    new-instance v0, Lcom/google/android/gms/ads/AdSize;

    iget v1, p0, Lcom/google/cordova/admob/AdMob;->width:I

    iget v2, p0, Lcom/google/cordova/admob/AdMob;->height:I

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/AdSize;-><init>(II)V

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 214
    :cond_5
    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    .line 215
    :cond_6
    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->posX:I

    .line 216
    :cond_7
    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/cordova/admob/AdMob;->posY:I

    .line 218
    :cond_8
    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->isTesting:Z

    .line 219
    :cond_9
    const-string v0, "autoShow"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "autoShow"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    .line 220
    :cond_a
    const-string v0, "adExtras"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "adExtras"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->adExtras:Lorg/json/JSONObject;

    .line 221
    :cond_b
    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->orientationRenew:Z

    .line 224
    :cond_c
    if-eqz p2, :cond_d

    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 225
    :cond_d
    const/4 v0, 0x0

    return-object v0
.end method

.method private executeShowBanner(ILorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 2
    .param p1, "pos"    # I
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v1, 0x0

    .line 403
    iput p1, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    .line 405
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    if-nez v0, :cond_0

    .line 406
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    .line 407
    const-string v0, ""

    invoke-direct {p0, v0, p2}, Lcom/google/cordova/admob/AdMob;->executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 412
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 409
    :cond_0
    invoke-direct {p0, p1, v1, v1, p2}, Lcom/google/cordova/admob/AdMob;->__showBanner(IIILorg/apache/cordova/CallbackContext;)V

    goto :goto_0
.end method

.method private executeShowBannerAtXY(IILorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/16 v1, 0xa

    .line 416
    iput v1, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    .line 417
    iput p1, p0, Lcom/google/cordova/admob/AdMob;->posX:I

    .line 418
    iput p2, p0, Lcom/google/cordova/admob/AdMob;->posY:I

    .line 420
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    if-nez v0, :cond_0

    .line 421
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    .line 422
    const-string v0, ""

    invoke-direct {p0, v0, p3}, Lcom/google/cordova/admob/AdMob;->executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 427
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 424
    :cond_0
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/google/cordova/admob/AdMob;->__showBanner(IIILorg/apache/cordova/CallbackContext;)V

    goto :goto_0
.end method

.method private executeShowInterstitial(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v2, 0x0

    .line 460
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    if-nez v0, :cond_0

    .line 461
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->autoShow:Z

    .line 462
    const-string v0, ""

    invoke-direct {p0, v0, p1}, Lcom/google/cordova/admob/AdMob;->executePrepareInterstitial(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 476
    :goto_0
    return-object v2

    .line 466
    :cond_0
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/google/cordova/admob/AdMob$6;

    invoke-direct {v1, p0, p1}, Lcom/google/cordova/admob/AdMob$6;-><init>(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static final md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 678
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 679
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 680
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 681
    .local v4, "messageDigest":[B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 682
    .local v2, "hexString":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-lt v3, v5, :cond_0

    .line 688
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 692
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v2    # "hexString":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "messageDigest":[B
    :goto_1
    return-object v5

    .line 683
    .restart local v0    # "digest":Ljava/security/MessageDigest;
    .restart local v2    # "hexString":Ljava/lang/StringBuffer;
    .restart local v3    # "i":I
    .restart local v4    # "messageDigest":[B
    :cond_0
    aget-byte v5, v4, v3

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 684
    .local v1, "h":Ljava/lang/String;
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_1

    .line 686
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 682
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 685
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "0"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_2

    .line 690
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v1    # "h":Ljava/lang/String;
    .end local v2    # "hexString":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "messageDigest":[B
    :catch_0
    move-exception v5

    .line 692
    const-string v5, ""

    goto :goto_1
.end method


# virtual methods
.method public __onOrientationChange()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 480
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1}, Lorg/apache/cordova/CordovaWebView;->getWidth()I

    move-result v0

    .line 481
    .local v0, "ww":I
    iget v1, p0, Lcom/google/cordova/admob/AdMob;->widthOfView:I

    if-ne v0, v1, :cond_1

    .line 495
    :cond_0
    :goto_0
    return-void

    .line 483
    :cond_1
    iput v0, p0, Lcom/google/cordova/admob/AdMob;->widthOfView:I

    .line 485
    const-string v1, "AdMob"

    const-string v2, "Orientation Changed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    iget-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->bannerVisible:Z

    if-eqz v1, :cond_0

    .line 487
    iget-boolean v1, p0, Lcom/google/cordova/admob/AdMob;->orientationRenew:Z

    if-eqz v1, :cond_2

    .line 488
    const-string v1, "AdMob"

    const-string v2, "renew banner on orientation change"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    invoke-direct {p0, v4}, Lcom/google/cordova/admob/AdMob;->executeRemoveBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 490
    const-string v1, ""

    invoke-direct {p0, v1, v4}, Lcom/google/cordova/admob/AdMob;->executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    goto :goto_0

    .line 492
    :cond_2
    iget v1, p0, Lcom/google/cordova/admob/AdMob;->adPosition:I

    iget v2, p0, Lcom/google/cordova/admob/AdMob;->posX:I

    iget v3, p0, Lcom/google/cordova/admob/AdMob;->posY:I

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/cordova/admob/AdMob;->__showBanner(IIILorg/apache/cordova/CallbackContext;)V

    goto :goto_0
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inputs"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 131
    const/4 v4, 0x0

    .line 135
    .local v4, "result":Lorg/apache/cordova/PluginResult;
    const-string v7, "setOptions"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 136
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 137
    .local v2, "options":Lorg/json/JSONObject;
    invoke-direct {p0, v2, p3}, Lcom/google/cordova/admob/AdMob;->executeSetOptions(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 182
    .end local v2    # "options":Lorg/json/JSONObject;
    :goto_0
    if-eqz v4, :cond_0

    invoke-virtual {p3, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 184
    :cond_0
    return v11

    .line 139
    :cond_1
    const-string v7, "createBanner"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 140
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 141
    .restart local v2    # "options":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-le v7, v11, :cond_2

    .line 142
    invoke-direct {p0, v2, v8}, Lcom/google/cordova/admob/AdMob;->executeSetOptions(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 144
    :cond_2
    const-string v7, "adId"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "adId":Ljava/lang/String;
    invoke-direct {p0, v0, p3}, Lcom/google/cordova/admob/AdMob;->executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 147
    goto :goto_0

    .end local v0    # "adId":Ljava/lang/String;
    .end local v2    # "options":Lorg/json/JSONObject;
    :cond_3
    const-string v7, "removeBanner"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 148
    invoke-direct {p0, p3}, Lcom/google/cordova/admob/AdMob;->executeRemoveBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 150
    goto :goto_0

    :cond_4
    const-string v7, "hideBanner"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 151
    invoke-direct {p0, p3}, Lcom/google/cordova/admob/AdMob;->executeHideBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 153
    goto :goto_0

    :cond_5
    const-string v7, "showBanner"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 31
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->optInt(I)I

    move-result v3

    .line 155
    .local v3, "position":I
    invoke-direct {p0, v3, p3}, Lcom/google/cordova/admob/AdMob;->executeShowBanner(ILorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 157
    goto :goto_0

    .end local v3    # "position":I
    :cond_6
    const-string v7, "showBannerAtXY"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 158
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 159
    .local v1, "args":Lorg/json/JSONObject;
    const-string v7, "x"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    .line 160
    .local v5, "x":I
    const-string v7, "y"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    .line 161
    .local v6, "y":I
    invoke-direct {p0, v5, v6, p3}, Lcom/google/cordova/admob/AdMob;->executeShowBannerAtXY(IILorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 163
    goto :goto_0

    .end local v1    # "args":Lorg/json/JSONObject;
    .end local v5    # "x":I
    .end local v6    # "y":I
    :cond_7
    const-string v7, "prepareInterstitial"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 164
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 165
    .restart local v2    # "options":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-le v7, v11, :cond_8

    .line 166
    invoke-direct {p0, v2, v8}, Lcom/google/cordova/admob/AdMob;->executeSetOptions(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    .line 168
    :cond_8
    const-string v7, "adId"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .restart local v0    # "adId":Ljava/lang/String;
    invoke-direct {p0, v0, p3}, Lcom/google/cordova/admob/AdMob;->executePrepareInterstitial(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 171
    goto/16 :goto_0

    .end local v0    # "adId":Ljava/lang/String;
    .end local v2    # "options":Lorg/json/JSONObject;
    :cond_9
    const-string v7, "showInterstitial"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 172
    invoke-direct {p0, p3}, Lcom/google/cordova/admob/AdMob;->executeShowInterstitial(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 174
    goto/16 :goto_0

    :cond_a
    const-string v7, "isInterstitialReady"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 175
    invoke-direct {p0, p3}, Lcom/google/cordova/admob/AdMob;->executeIsInterstitialReady(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    .line 177
    goto/16 :goto_0

    .line 178
    :cond_b
    const-string v7, "AdMob"

    const-string v8, "Invalid action passed: %s"

    new-array v9, v11, [Ljava/lang/Object;

    aput-object p1, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    new-instance v4, Lorg/apache/cordova/PluginResult;

    .end local v4    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v7}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v4    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0
.end method

.method public getErrorReason(I)Ljava/lang/String;
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 658
    const-string v0, ""

    .line 659
    .local v0, "errorReason":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 673
    :goto_0
    return-object v0

    .line 661
    :pswitch_0
    const-string v0, "Internal error"

    .line 662
    goto :goto_0

    .line 664
    :pswitch_1
    const-string v0, "Invalid request"

    .line 665
    goto :goto_0

    .line 667
    :pswitch_2
    const-string v0, "Network Error"

    .line 668
    goto :goto_0

    .line 670
    :pswitch_3
    const-string v0, "No fill"

    goto :goto_0

    .line 659
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 5
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 120
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 122
    new-instance v0, Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, p0, v3}, Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;-><init>(Lcom/google/cordova/admob/AdMob;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/cordova/admob/AdMob;->orientation:Landroid/view/OrientationEventListener;

    .line 123
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 125
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->isGpsAvailable:Z

    .line 126
    const-string v3, "AdMob"

    const-string v4, "isGooglePlayServicesAvailable: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->isGpsAvailable:Z

    if-eqz v0, :cond_1

    const-string v0, "true"

    :goto_1
    aput-object v0, v1, v2

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-void

    :cond_0
    move v0, v2

    .line 125
    goto :goto_0

    .line 126
    :cond_1
    const-string v0, "false"

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 613
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    if-eqz v1, :cond_0

    .line 614
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdView;->destroy()V

    .line 615
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    .line 617
    :cond_0
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_1

    .line 618
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->interstitialAd:Lcom/google/android/gms/ads/InterstitialAd;

    .line 620
    :cond_1
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_3

    .line 621
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 622
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_2

    .line 623
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 625
    :cond_2
    iput-object v2, p0, Lcom/google/cordova/admob/AdMob;->adViewLayout:Landroid/widget/RelativeLayout;

    .line 627
    .end local v0    # "parentView":Landroid/view/ViewGroup;
    :cond_3
    invoke-super {p0}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    .line 628
    return-void
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 596
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_0

    .line 597
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->pause()V

    .line 599
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    .line 600
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 604
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    .line 605
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/google/cordova/admob/AdMob;->isGpsAvailable:Z

    .line 606
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_0

    .line 607
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob;->adView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->resume()V

    .line 609
    :cond_0
    return-void

    .line 605
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
