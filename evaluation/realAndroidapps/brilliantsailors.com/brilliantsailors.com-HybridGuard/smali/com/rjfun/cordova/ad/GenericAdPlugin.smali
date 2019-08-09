.class public abstract Lcom/rjfun/cordova/ad/GenericAdPlugin;
.super Lcom/rjfun/cordova/ext/CordovaPluginExt;
.source "GenericAdPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;
    }
.end annotation


# static fields
.field public static final ACTION_CREATE_BANNER:Ljava/lang/String; = "createBanner"

.field public static final ACTION_HIDE_BANNER:Ljava/lang/String; = "hideBanner"

.field public static final ACTION_IS_INTERSTITIAL_READY:Ljava/lang/String; = "isInterstitialReady"

.field public static final ACTION_PREPARE_INTERSTITIAL:Ljava/lang/String; = "prepareInterstitial"

.field public static final ACTION_REMOVE_BANNER:Ljava/lang/String; = "removeBanner"

.field public static final ACTION_SET_OPTIONS:Ljava/lang/String; = "setOptions"

.field public static final ACTION_SHOW_BANNER:Ljava/lang/String; = "showBanner"

.field public static final ACTION_SHOW_BANNER_AT_XY:Ljava/lang/String; = "showBannerAtXY"

.field public static final ACTION_SHOW_INTERSTITIAL:Ljava/lang/String; = "showInterstitial"

.field public static final ADSIZE_BANNER:Ljava/lang/String; = "BANNER"

.field public static final ADSIZE_CUSTOM:Ljava/lang/String; = "CUSTOM"

.field public static final ADSIZE_FULL_BANNER:Ljava/lang/String; = "FULL_BANNER"

.field public static final ADSIZE_LEADERBOARD:Ljava/lang/String; = "LEADERBOARD"

.field public static final ADSIZE_MEDIUM_RECTANGLE:Ljava/lang/String; = "MEDIUM_RECTANGLE"

.field public static final ADSIZE_SKYSCRAPER:Ljava/lang/String; = "SKYSCRAPER"

.field public static final ADSIZE_SMART_BANNER:Ljava/lang/String; = "SMART_BANNER"

.field public static final ADTYPE_BANNER:Ljava/lang/String; = "banner"

.field public static final ADTYPE_INTERSTITIAL:Ljava/lang/String; = "interstitial"

.field public static final ADTYPE_NATIVE:Ljava/lang/String; = "native"

.field public static final BOTTOM_CENTER:I = 0x8

.field public static final BOTTOM_LEFT:I = 0x7

.field public static final BOTTOM_RIGHT:I = 0x9

.field public static final CENTER:I = 0x5

.field public static final EVENT_AD_DISMISS:Ljava/lang/String; = "onAdDismiss"

.field public static final EVENT_AD_FAILLOAD:Ljava/lang/String; = "onAdFailLoad"

.field public static final EVENT_AD_LEAVEAPP:Ljava/lang/String; = "onAdLeaveApp"

.field public static final EVENT_AD_LOADED:Ljava/lang/String; = "onAdLoaded"

.field public static final EVENT_AD_PRESENT:Ljava/lang/String; = "onAdPresent"

.field public static final EVENT_AD_WILLDISMISS:Ljava/lang/String; = "onAdWillDismiss"

.field public static final EVENT_AD_WILLPRESENT:Ljava/lang/String; = "onAdWillPresent"

.field public static final LEFT:I = 0x4

.field private static final LOGTAG:Ljava/lang/String; = "GenericAdPlugin"

.field public static final NO_CHANGE:I = 0x0

.field public static final OPT_ADID:Ljava/lang/String; = "adId"

.field public static final OPT_AD_SIZE:Ljava/lang/String; = "adSize"

.field public static final OPT_AUTO_SHOW:Ljava/lang/String; = "autoShow"

.field public static final OPT_BANNER_ID:Ljava/lang/String; = "bannerId"

.field public static final OPT_HEIGHT:Ljava/lang/String; = "height"

.field public static final OPT_INTERSTITIAL_ID:Ljava/lang/String; = "interstitialId"

.field public static final OPT_IS_TESTING:Ljava/lang/String; = "isTesting"

.field public static final OPT_LICENSE:Ljava/lang/String; = "license"

.field public static final OPT_LOG_VERBOSE:Ljava/lang/String; = "logVerbose"

.field public static final OPT_ORIENTATION_RENEW:Ljava/lang/String; = "orientationRenew"

.field public static final OPT_OVERLAP:Ljava/lang/String; = "overlap"

.field public static final OPT_POSITION:Ljava/lang/String; = "position"

.field public static final OPT_WIDTH:Ljava/lang/String; = "width"

.field public static final OPT_X:Ljava/lang/String; = "x"

.field public static final OPT_Y:Ljava/lang/String; = "y"

.field public static final POS_XY:I = 0xa

.field public static final RIGHT:I = 0x6

.field protected static final TEST_TRAFFIC:I = 0x3

.field public static final TOP_CENTER:I = 0x2

.field public static final TOP_LEFT:I = 0x1

.field public static final TOP_RIGHT:I = 0x3

.field private static final USER_AGENT:Ljava/lang/String; = "Mozilla/5.0"


# instance fields
.field protected adHeight:I

.field protected adPosition:I

.field protected adView:Landroid/view/View;

.field protected adWidth:I

.field private adlicBannerId:Ljava/lang/String;

.field private adlicInited:Z

.field private adlicInterstitialId:Ljava/lang/String;

.field private adlicNativeId:Ljava/lang/String;

.field private adlicRate:I

.field private final adlicUrl:Ljava/lang/String;

.field protected autoShowBanner:Z

.field protected autoShowInterstitial:Z

.field protected bannerId:Ljava/lang/String;

.field protected bannerVisible:Z

.field protected interstialId:Ljava/lang/String;

.field protected interstitialAd:Ljava/lang/Object;

.field protected interstitialReady:Z

.field protected isTesting:Z

.field protected licenseValidated:Z

.field protected logVerbose:Z

.field protected orientation:Landroid/view/OrientationEventListener;

.field protected orientationRenew:Z

.field protected overlap:Z

.field protected overlapLayout:Landroid/widget/RelativeLayout;

.field protected parentView:Landroid/view/ViewGroup;

.field protected posX:I

.field protected posY:I

.field protected splitLayout:Landroid/widget/LinearLayout;

.field protected testTraffic:Z

.field protected validatedLicense:Ljava/lang/String;

.field protected widthOfView:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 32
    invoke-direct {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;-><init>()V

    .line 93
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 110
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v3, 0x64

    invoke-virtual {v0, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    const/4 v3, 0x3

    if-gt v0, v3, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    .line 111
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->validatedLicense:Ljava/lang/String;

    .line 113
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    .line 114
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->logVerbose:Z

    .line 116
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adWidth:I

    .line 117
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adHeight:I

    .line 118
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    .line 119
    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    .line 121
    const/16 v0, 0x8

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adPosition:I

    .line 122
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    .line 123
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    .line 125
    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 126
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowInterstitial:Z

    .line 128
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    .line 129
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    .line 131
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    .line 132
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    .line 133
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    .line 134
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 135
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 137
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 138
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialReady:Z

    .line 140
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    .line 143
    const-string v0, "http://adlic.rjfun.com/adlic"

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicUrl:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicBannerId:Ljava/lang/String;

    .line 145
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInterstitialId:Ljava/lang/String;

    .line 146
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicNativeId:Ljava/lang/String;

    .line 147
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicRate:I

    .line 367
    return-void

    :cond_0
    move v0, v2

    .line 110
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/ad/GenericAdPlugin;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->detachBanner()V

    return-void
.end method

.method private adlic()V
    .locals 11

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 327
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 328
    .local v5, "prod":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 329
    .local v0, "app":Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 330
    .local v4, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v9, "app"

    invoke-interface {v4, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    const-string v9, "os"

    const-string v10, "android"

    invoke-interface {v4, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    const-string v9, "net"

    invoke-interface {v4, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    const-string v9, "lic"

    iget-object v10, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->validatedLicense:Ljava/lang/String;

    invoke-interface {v4, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    const-string v9, "window.adlicAppId=\'%s\';"

    new-array v10, v8, [Ljava/lang/Object;

    aput-object v0, v10, v7

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->evalJs(Ljava/lang/String;)V

    .line 337
    const-string v9, "http://adlic.rjfun.com/adlic"

    invoke-static {v9, v4}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->httpPost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    .line 339
    .local v6, "ret":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 340
    .local v3, "json":Lorg/json/JSONObject;
    const-string v9, "b"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicBannerId:Ljava/lang/String;

    .line 341
    const-string v9, "i"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInterstitialId:Ljava/lang/String;

    .line 342
    const-string v9, "n"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicNativeId:Ljava/lang/String;

    .line 343
    const-string v9, "r"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    iput v9, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicRate:I

    .line 344
    new-instance v9, Ljava/util/Random;

    invoke-direct {v9}, Ljava/util/Random;-><init>()V

    const/16 v10, 0x64

    invoke-virtual {v9, v10}, Ljava/util/Random;->nextInt(I)I

    move-result v9

    iget v10, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicRate:I

    if-ge v9, v10, :cond_0

    move v7, v8

    :cond_0
    iput-boolean v7, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    .line 345
    const-string v7, "js"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 346
    .local v2, "js":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 347
    const-string v7, "http://"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {p0, v2}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->loadJs(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 355
    :cond_1
    :goto_0
    iput-boolean v8, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    .line 357
    .end local v2    # "js":Ljava/lang/String;
    .end local v3    # "json":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 348
    .restart local v2    # "js":Ljava/lang/String;
    .restart local v3    # "json":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    const-string v7, "https://"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 349
    invoke-virtual {p0, v2}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->evalJs(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 351
    .end local v2    # "js":Ljava/lang/String;
    .end local v3    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 352
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v7, "admob"

    if-ne v5, v7, :cond_4

    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 355
    :cond_3
    :goto_2
    iput-boolean v8, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    goto :goto_1

    .line 353
    :cond_4
    :try_start_3
    new-instance v7, Ljava/util/Random;

    invoke-direct {v7}, Ljava/util/Random;-><init>()V

    const/16 v9, 0x64

    invoke-virtual {v7, v9}, Ljava/util/Random;->nextInt(I)I

    move-result v7

    const/4 v9, 0x3

    if-gt v7, v9, :cond_3

    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 355
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    iput-boolean v8, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    throw v7
.end method

.method private detachBanner()V
    .locals 3

    .prologue
    .line 616
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v1, :cond_1

    .line 625
    :cond_0
    :goto_0
    return-void

    .line 618
    :cond_1
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 619
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 621
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 622
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 623
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0
.end method

.method protected static httpGet(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 225
    const-string v7, ""

    .line 227
    .local v7, "result":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 228
    .local v4, "obj":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 230
    .local v0, "con":Ljava/net/HttpURLConnection;
    const-string v9, "GET"

    invoke-virtual {v0, v9}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 231
    const-string v9, "User-Agent"

    const-string v10, "Mozilla/5.0"

    invoke-virtual {v0, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    const-string v9, "Accept-Language"

    const-string v10, "UTF-8"

    invoke-virtual {v0, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    .line 236
    .local v6, "responseCode":I
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 238
    .local v2, "in":Ljava/io/BufferedReader;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 240
    .local v5, "response":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "inputLine":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 241
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 246
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v3    # "inputLine":Ljava/lang/String;
    .end local v4    # "obj":Ljava/net/URL;
    .end local v5    # "response":Ljava/lang/StringBuffer;
    .end local v6    # "responseCode":I
    :catch_0
    move-exception v1

    .line 247
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v8, v7

    .line 258
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v7    # "result":Ljava/lang/String;
    .local v8, "result":Ljava/lang/String;
    :goto_1
    return-object v8

    .line 243
    .end local v8    # "result":Ljava/lang/String;
    .restart local v0    # "con":Ljava/net/HttpURLConnection;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "inputLine":Ljava/lang/String;
    .restart local v4    # "obj":Ljava/net/URL;
    .restart local v5    # "response":Ljava/lang/StringBuffer;
    .restart local v6    # "responseCode":I
    .restart local v7    # "result":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 245
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v7

    move-object v8, v7

    .line 258
    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1

    .line 248
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .end local v3    # "inputLine":Ljava/lang/String;
    .end local v4    # "obj":Ljava/net/URL;
    .end local v5    # "response":Ljava/lang/StringBuffer;
    .end local v6    # "responseCode":I
    .end local v8    # "result":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 249
    .local v1, "e":Ljava/net/MalformedURLException;
    :try_start_3
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    move-object v8, v7

    .line 258
    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1

    .line 250
    .end local v1    # "e":Ljava/net/MalformedURLException;
    .end local v8    # "result":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 251
    .local v1, "e":Ljava/net/ProtocolException;
    invoke-virtual {v1}, Ljava/net/ProtocolException;->printStackTrace()V

    move-object v8, v7

    .line 258
    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1

    .line 252
    .end local v1    # "e":Ljava/net/ProtocolException;
    .end local v8    # "result":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/String;
    :catch_3
    move-exception v1

    .line 253
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    move-object v8, v7

    .line 258
    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1

    .line 254
    .end local v1    # "e":Ljava/io/IOException;
    .end local v8    # "result":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/String;
    :catch_4
    move-exception v1

    .line 255
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v8, v7

    .line 258
    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v8    # "result":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v9

    move-object v8, v7

    .end local v7    # "result":Ljava/lang/String;
    .restart local v8    # "result":Ljava/lang/String;
    goto :goto_1
.end method

.method protected static httpPost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 16
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 263
    .local p1, "parameter":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v14, ""

    invoke-direct {v8, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 264
    .local v8, "params":Ljava/lang/StringBuilder;
    const-string v11, ""

    .line 266
    .local v11, "result":Ljava/lang/String;
    :try_start_0
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 267
    .local v13, "s":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "&"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string v15, "UTF-8"

    invoke-static {v14, v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 295
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v13    # "s":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 296
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v12, v11

    .line 307
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v11    # "result":Ljava/lang/String;
    .local v12, "result":Ljava/lang/String;
    :goto_1
    return-object v12

    .line 271
    .end local v12    # "result":Ljava/lang/String;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v11    # "result":Ljava/lang/String;
    :cond_0
    :try_start_2
    new-instance v6, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 272
    .local v6, "obj":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 274
    .local v1, "con":Ljava/net/HttpURLConnection;
    const-string v14, "POST"

    invoke-virtual {v1, v14}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 275
    const-string v14, "User-Agent"

    const-string v15, "Mozilla/5.0"

    invoke-virtual {v1, v14, v15}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    const-string v14, "Accept-Language"

    const-string v15, "UTF-8"

    invoke-virtual {v1, v14, v15}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 279
    new-instance v7, Ljava/io/OutputStreamWriter;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v14

    invoke-direct {v7, v14}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 280
    .local v7, "outputStreamWriter":Ljava/io/OutputStreamWriter;
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 281
    invoke-virtual {v7}, Ljava/io/OutputStreamWriter;->flush()V

    .line 283
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 285
    .local v10, "responseCode":I
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v14, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v14}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 287
    .local v4, "in":Ljava/io/BufferedReader;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    .line 289
    .local v9, "response":Ljava/lang/StringBuffer;
    :goto_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "inputLine":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 290
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 297
    .end local v1    # "con":Ljava/net/HttpURLConnection;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "inputLine":Ljava/lang/String;
    .end local v6    # "obj":Ljava/net/URL;
    .end local v7    # "outputStreamWriter":Ljava/io/OutputStreamWriter;
    .end local v9    # "response":Ljava/lang/StringBuffer;
    .end local v10    # "responseCode":I
    :catch_1
    move-exception v2

    .line 298
    .local v2, "e":Ljava/net/MalformedURLException;
    :try_start_3
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v12, v11

    .line 307
    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto :goto_1

    .line 292
    .end local v2    # "e":Ljava/net/MalformedURLException;
    .end local v12    # "result":Ljava/lang/String;
    .restart local v1    # "con":Ljava/net/HttpURLConnection;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "inputLine":Ljava/lang/String;
    .restart local v6    # "obj":Ljava/net/URL;
    .restart local v7    # "outputStreamWriter":Ljava/io/OutputStreamWriter;
    .restart local v9    # "response":Ljava/lang/StringBuffer;
    .restart local v10    # "responseCode":I
    .restart local v11    # "result":Ljava/lang/String;
    :cond_1
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 294
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v11

    move-object v12, v11

    .line 307
    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto :goto_1

    .line 299
    .end local v1    # "con":Ljava/net/HttpURLConnection;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "inputLine":Ljava/lang/String;
    .end local v6    # "obj":Ljava/net/URL;
    .end local v7    # "outputStreamWriter":Ljava/io/OutputStreamWriter;
    .end local v9    # "response":Ljava/lang/StringBuffer;
    .end local v10    # "responseCode":I
    .end local v12    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 300
    .local v2, "e":Ljava/net/ProtocolException;
    :try_start_5
    invoke-virtual {v2}, Ljava/net/ProtocolException;->printStackTrace()V

    move-object v12, v11

    .line 307
    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto :goto_1

    .line 301
    .end local v2    # "e":Ljava/net/ProtocolException;
    .end local v12    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 302
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v12, v11

    .line 307
    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto/16 :goto_1

    .line 303
    .end local v2    # "e":Ljava/io/IOException;
    .end local v12    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    :catch_4
    move-exception v2

    .line 304
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object v12, v11

    .line 307
    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto/16 :goto_1

    .end local v2    # "e":Ljava/lang/Exception;
    .end local v12    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v14

    move-object v12, v11

    .end local v11    # "result":Ljava/lang/String;
    .restart local v12    # "result":Ljava/lang/String;
    goto/16 :goto_1
.end method

.method private validateLicense(Ljava/lang/String;)V
    .locals 10
    .param p1, "license"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 409
    const-string v8, "/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 410
    .local v0, "fields":[Ljava/lang/String;
    array-length v8, v0

    const/4 v9, 0x2

    if-lt v8, v9, :cond_3

    .line 411
    aget-object v5, v0, v7

    .line 412
    .local v5, "userid":Ljava/lang/String;
    aget-object v3, v0, v6

    .line 413
    .local v3, "key":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "licensed to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " by floatinghotpot"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 414
    .local v1, "genKey":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " licensed to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " by floatinghotpot"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 415
    .local v2, "genKey2":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    :cond_0
    :goto_0
    iput-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    .line 422
    .end local v2    # "genKey2":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "userid":Ljava/lang/String;
    :goto_1
    iget-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    if-eqz v6, :cond_1

    .line 423
    const-string v6, "GenericAdPlugin"

    const-string v8, "valid license"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->validatedLicense:Ljava/lang/String;

    .line 425
    iput-boolean v7, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    .line 427
    :cond_1
    return-void

    .restart local v2    # "genKey2":Ljava/lang/String;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "userid":Ljava/lang/String;
    :cond_2
    move v6, v7

    .line 415
    goto :goto_0

    .line 417
    .end local v1    # "genKey":Ljava/lang/String;
    .end local v2    # "genKey2":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "userid":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 418
    .local v4, "packageName":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "licensed to "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " by floatinghotpot"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 419
    .restart local v1    # "genKey":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    goto :goto_1
.end method


# virtual methods
.method protected abstract __createAdView(Ljava/lang/String;)Landroid/view/View;
.end method

.method protected abstract __createInterstitial(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method protected abstract __destroyAdView(Landroid/view/View;)V
.end method

.method protected abstract __destroyInterstitial(Ljava/lang/Object;)V
.end method

.method protected abstract __getAdViewHeight(Landroid/view/View;)I
.end method

.method protected abstract __getAdViewWidth(Landroid/view/View;)I
.end method

.method protected abstract __getProductShortName()Ljava/lang/String;
.end method

.method protected abstract __getTestBannerId()Ljava/lang/String;
.end method

.method protected abstract __getTestInterstitialId()Ljava/lang/String;
.end method

.method protected abstract __loadAdView(Landroid/view/View;)V
.end method

.method protected abstract __loadInterstitial(Ljava/lang/Object;)V
.end method

.method protected abstract __pauseAdView(Landroid/view/View;)V
.end method

.method protected abstract __resumeAdView(Landroid/view/View;)V
.end method

.method protected abstract __showInterstitial(Ljava/lang/Object;)V
.end method

.method public checkOrientationChange()V
    .locals 2

    .prologue
    .line 379
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 380
    .local v0, "w":I
    iget v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    if-ne v0, v1, :cond_0

    .line 385
    :goto_0
    return-void

    .line 382
    :cond_0
    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    .line 384
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onViewOrientationChanged()V

    goto :goto_0
.end method

.method public createBanner(Ljava/lang/String;Z)Z
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "autoShow"    # Z

    .prologue
    .line 449
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlic()V

    .line 451
    :cond_0
    const-string v2, "GenericAdPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createBanner: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    iput-boolean p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 455
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 458
    :goto_0
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    if-eqz v2, :cond_1

    .line 459
    iget-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicBannerId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 460
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicBannerId:Ljava/lang/String;

    .line 465
    :cond_1
    :goto_1
    move-object v1, p1

    .line 466
    .local v1, "strAdUnitId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 467
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;

    invoke-direct {v2, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 480
    const/4 v2, 0x1

    return v2

    .line 456
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "strAdUnitId":Ljava/lang/String;
    :cond_2
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    goto :goto_0

    .line 462
    :cond_3
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getTestBannerId()Ljava/lang/String;

    move-result-object p1

    goto :goto_1
.end method

.method protected evalJs(Ljava/lang/String;)V
    .locals 2
    .param p1, "js"    # Ljava/lang/String;

    .prologue
    .line 312
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 313
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;

    invoke-direct {v1, p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 319
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 14
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inputs"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 151
    const/4 v7, 0x0

    .line 153
    .local v7, "result":Lorg/apache/cordova/PluginResult;
    const-string v10, "setOptions"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 154
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 155
    .local v6, "options":Lorg/json/JSONObject;
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 156
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 211
    .end local v6    # "options":Lorg/json/JSONObject;
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    :goto_0
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->sendPluginResult(Lorg/apache/cordova/PluginResult;Lorg/apache/cordova/CallbackContext;)V

    .line 213
    const/4 v10, 0x1

    return v10

    .line 158
    :cond_0
    const-string v10, "createBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 159
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 160
    .restart local v6    # "options":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->length()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_1

    .line 161
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 163
    :cond_1
    const-string v10, "adId"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "adId":Ljava/lang/String;
    const-string v10, "autoShow"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "autoShow"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    :cond_2
    const/4 v3, 0x1

    .line 166
    .local v3, "autoShow":Z
    :goto_1
    invoke-virtual {p0, v1, v3}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->createBanner(Ljava/lang/String;Z)Z

    move-result v4

    .line 167
    .local v4, "isOk":Z
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    if-eqz v4, :cond_4

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    :goto_2
    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 169
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 164
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 167
    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v3    # "autoShow":Z
    .restart local v4    # "isOk":Z
    :cond_4
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    goto :goto_2

    .line 169
    .end local v1    # "adId":Ljava/lang/String;
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    .end local v6    # "options":Lorg/json/JSONObject;
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    :cond_5
    const-string v10, "removeBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 170
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->removeBanner()V

    .line 171
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 173
    :cond_6
    const-string v10, "hideBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 174
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->hideBanner()V

    .line 175
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 177
    :cond_7
    const-string v10, "showBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 178
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optInt(I)I

    move-result v5

    .line 179
    .local v5, "nPos":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {p0, v5, v10, v11}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V

    .line 180
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 182
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .end local v5    # "nPos":I
    :cond_8
    const-string v10, "showBannerAtXY"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 183
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 184
    .local v2, "args":Lorg/json/JSONObject;
    const-string v10, "x"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    .line 185
    .local v8, "x":I
    const-string v10, "y"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    .line 186
    .local v9, "y":I
    const/16 v10, 0xa

    invoke-virtual {p0, v10, v8, v9}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V

    .line 187
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 189
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .end local v2    # "args":Lorg/json/JSONObject;
    .end local v8    # "x":I
    .end local v9    # "y":I
    :cond_9
    const-string v10, "prepareInterstitial"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 190
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 191
    .restart local v6    # "options":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->length()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_a

    .line 192
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 194
    :cond_a
    const-string v10, "adId"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 195
    .restart local v1    # "adId":Ljava/lang/String;
    const-string v10, "autoShow"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    const-string v10, "autoShow"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c

    :cond_b
    const/4 v3, 0x1

    .line 196
    .restart local v3    # "autoShow":Z
    :goto_3
    invoke-virtual {p0, v1, v3}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->prepareInterstitial(Ljava/lang/String;Z)Z

    move-result v4

    .line 197
    .restart local v4    # "isOk":Z
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    if-eqz v4, :cond_d

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    :goto_4
    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 199
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 195
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    :cond_c
    const/4 v3, 0x0

    goto :goto_3

    .line 197
    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v3    # "autoShow":Z
    .restart local v4    # "isOk":Z
    :cond_d
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    goto :goto_4

    .line 199
    .end local v1    # "adId":Ljava/lang/String;
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    .end local v6    # "options":Lorg/json/JSONObject;
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    :cond_e
    const-string v10, "showInterstitial"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 200
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showInterstitial()V

    .line 201
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 203
    :cond_f
    const-string v10, "isInterstitialReady"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 204
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-boolean v11, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialReady:Z

    invoke-direct {v7, v10, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 207
    :cond_10
    const-string v10, "GenericAdPlugin"

    const-string v11, "Invalid action passed: %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object p1, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0
.end method

.method protected fireAdErrorEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "errCode"    # I
    .param p3, "errMsg"    # Ljava/lang/String;
    .param p4, "adType"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 762
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v1

    .line 763
    .local v1, "obj":Ljava/lang/String;
    const-string v2, "{\'adNetwork\':\'%s\',\'adType\':\'%s\',\'adEvent\':\'%s\',\'error\':%d,\'reason\':\'%s\'}"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    aput-object p4, v3, v4

    const/4 v4, 0x2

    aput-object p1, v3, v4

    const/4 v4, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    aput-object p3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 764
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {p0, v1, p1, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 765
    return-void
.end method

.method protected fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "adType"    # Ljava/lang/String;

    .prologue
    .line 755
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v1

    .line 756
    .local v1, "obj":Ljava/lang/String;
    const-string v2, "{\'adNetwork\':\'%s\',\'adType\':\'%s\',\'adEvent\':\'%s\'}"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 757
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {p0, v1, p1, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 758
    return-void
.end method

.method public fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/String;
    .param p2, "eventName"    # Ljava/lang/String;
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 218
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_0

    .line 219
    const-string v0, "GenericAdPlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    return-void
.end method

.method public hideBanner()V
    .locals 3

    .prologue
    .line 628
    const-string v1, "GenericAdPlugin"

    const-string v2, "hideBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 642
    :goto_0
    return-void

    .line 631
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 633
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 634
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$5;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$5;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method protected loadJs(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 322
    invoke-static {p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->httpGet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 323
    .local v0, "js":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->evalJs(Ljava/lang/String;)V

    .line 324
    :cond_0
    return-void
.end method

.method public final md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 431
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 432
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 433
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 434
    .local v4, "messageDigest":[B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 435
    .local v2, "hexString":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-ge v3, v5, :cond_1

    .line 436
    aget-byte v5, v4, v3

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 437
    .local v1, "h":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 438
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 439
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 441
    .end local v1    # "h":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 445
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v2    # "hexString":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "messageDigest":[B
    :goto_2
    return-object v5

    .line 443
    :catch_0
    move-exception v5

    .line 445
    const-string v5, ""

    goto :goto_2
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 722
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 723
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__destroyAdView(Landroid/view/View;)V

    .line 724
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 726
    :cond_0
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 727
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__destroyInterstitial(Ljava/lang/Object;)V

    .line 728
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 730
    :cond_1
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_3

    .line 731
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 732
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_2

    .line 733
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 735
    :cond_2
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    .line 737
    .end local v0    # "parentView":Landroid/view/ViewGroup;
    :cond_3
    invoke-super {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onDestroy()V

    .line 738
    return-void
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 706
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 707
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__pauseAdView(Landroid/view/View;)V

    .line 709
    :cond_0
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onPause(Z)V

    .line 710
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 714
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onResume(Z)V

    .line 715
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 716
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__resumeAdView(Landroid/view/View;)V

    .line 718
    :cond_0
    return-void
.end method

.method public onViewOrientationChanged()V
    .locals 3

    .prologue
    .line 741
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_0

    const-string v0, "GenericAdPlugin"

    const-string v1, "Orientation Changed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 742
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    if-eqz v0, :cond_2

    .line 743
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    if-eqz v0, :cond_3

    .line 744
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_1

    const-string v0, "GenericAdPlugin"

    const-string v1, "renew banner on orientation change"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 745
    :cond_1
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->removeBanner()V

    .line 746
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->createBanner(Ljava/lang/String;Z)Z

    .line 752
    :cond_2
    :goto_0
    return-void

    .line 748
    :cond_3
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_4

    const-string v0, "GenericAdPlugin"

    const-string v1, "adjust banner position"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 749
    :cond_4
    iget v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adPosition:I

    iget v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    iget v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V

    goto :goto_0
.end method

.method protected pluginInitialize()V
    .locals 2

    .prologue
    .line 361
    invoke-super {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->pluginInitialize()V

    .line 363
    new-instance v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;

    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    .line 364
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 365
    return-void
.end method

.method public prepareInterstitial(Ljava/lang/String;Z)Z
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "autoShow"    # Z

    .prologue
    .line 645
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInited:Z

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlic()V

    .line 647
    :cond_0
    const-string v2, "GenericAdPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "prepareInterstitial: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    iput-boolean p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowInterstitial:Z

    .line 651
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 654
    :goto_0
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    if-eqz v2, :cond_1

    .line 655
    iget-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInterstitialId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 656
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adlicInterstitialId:Ljava/lang/String;

    .line 661
    :cond_1
    :goto_1
    move-object v1, p1

    .line 662
    .local v1, "strUnitId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 663
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/rjfun/cordova/ad/GenericAdPlugin$6;

    invoke-direct {v2, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$6;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 676
    const/4 v2, 0x1

    return v2

    .line 652
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "strUnitId":Ljava/lang/String;
    :cond_2
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    goto :goto_0

    .line 658
    :cond_3
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getTestInterstitialId()Ljava/lang/String;

    move-result-object p1

    goto :goto_1
.end method

.method public removeBanner()V
    .locals 3

    .prologue
    .line 484
    const-string v1, "GenericAdPlugin"

    const-string v2, "removeBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 487
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$3;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$3;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 498
    return-void
.end method

.method public removeInterstitial()V
    .locals 2

    .prologue
    .line 692
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 693
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 694
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$8;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$8;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 700
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 702
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_0
    return-void
.end method

.method public setOptions(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 388
    if-eqz p1, :cond_b

    .line 389
    const-string v0, "license"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "license"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->validateLicense(Ljava/lang/String;)V

    .line 390
    :cond_0
    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    .line 391
    :cond_1
    const-string v0, "logVerbose"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "logVerbose"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->logVerbose:Z

    .line 393
    :cond_2
    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adWidth:I

    .line 394
    :cond_3
    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adHeight:I

    .line 395
    :cond_4
    const-string v0, "overlap"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "overlap"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    .line 396
    :cond_5
    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    .line 398
    :cond_6
    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adPosition:I

    .line 399
    :cond_7
    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    .line 400
    :cond_8
    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    .line 402
    :cond_9
    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 403
    :cond_a
    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 405
    :cond_b
    return-void
.end method

.method public showBanner(III)V
    .locals 7
    .param p1, "argPos"    # I
    .param p2, "argX"    # I
    .param p3, "argY"    # I

    .prologue
    .line 501
    const-string v0, "GenericAdPlugin"

    const-string v1, "showBanner"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 504
    const-string v0, "GenericAdPlugin"

    const-string v1, "banner is null, call createBanner() first."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    :goto_0
    return-void

    .line 508
    :cond_0
    iget-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 510
    .local v6, "bannerAlreadyVisible":Z
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v5

    .line 511
    .local v5, "activity":Landroid/app/Activity;
    new-instance v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;IIILandroid/app/Activity;)V

    invoke-virtual {v5, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public showInterstitial()V
    .locals 3

    .prologue
    .line 680
    const-string v1, "GenericAdPlugin"

    const-string v2, "showInterstitial"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 683
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$7;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$7;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 689
    return-void
.end method
