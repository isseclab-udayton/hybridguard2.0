.class public Lcom/rjfun/cordova/admob/AdMobPlugin;
.super Lcom/rjfun/cordova/ad/GenericAdPlugin;
.source "AdMobPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;,
        Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "AdMobPlugin"

.field private static final OPT_ADCOLONY:Ljava/lang/String; = "AdColony"

.field public static final OPT_AD_EXTRAS:Ljava/lang/String; = "adExtras"

.field private static final OPT_FACEBOOK:Ljava/lang/String; = "Facebook"

.field private static final OPT_FLURRY:Ljava/lang/String; = "Flurry"

.field private static final OPT_INMOBI:Ljava/lang/String; = "InMobi"

.field public static final OPT_LOCATION:Ljava/lang/String; = "location"

.field private static final OPT_MMEDIA:Ljava/lang/String; = "mMedia"

.field private static final OPT_MOBFOX:Ljava/lang/String; = "MobFox"

.field private static final TEST_BANNER_ID:Ljava/lang/String; = "ca-app-pub-6869992474017983/4748283957"

.field private static final TEST_INTERSTITIAL_ID:Ljava/lang/String; = "ca-app-pub-6869992474017983/6225017153"


# instance fields
.field private adExtras:Lorg/json/JSONObject;

.field private adSize:Lcom/google/android/gms/ads/AdSize;

.field private mLocation:Landroid/location/Location;

.field private mediations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/rjfun/cordova/admob/AdMobMediation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;-><init>()V

    .line 43
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    iput-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 46
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    .line 49
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdErrorEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->autoShowBanner:Z

    return v0
.end method

.method static synthetic access$3(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->bannerVisible:Z

    return v0
.end method

.method static synthetic access$4(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adPosition:I

    return v0
.end method

.method static synthetic access$5(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->posX:I

    return v0
.end method

.method static synthetic access$6(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->posY:I

    return v0
.end method

.method static synthetic access$7(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->autoShowInterstitial:Z

    return v0
.end method

.method public static adSizeFromString(Ljava/lang/String;)Lcom/google/android/gms/ads/AdSize;
    .locals 1
    .param p0, "size"    # Ljava/lang/String;

    .prologue
    .line 312
    const-string v0, "BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 313
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->BANNER:Lcom/google/android/gms/ads/AdSize;

    .line 325
    :goto_0
    return-object v0

    .line 314
    :cond_0
    const-string v0, "SMART_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 315
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 316
    :cond_1
    const-string v0, "MEDIUM_RECTANGLE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 317
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->MEDIUM_RECTANGLE:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 318
    :cond_2
    const-string v0, "FULL_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 319
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->FULL_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 320
    :cond_3
    const-string v0, "LEADERBOARD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 321
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->LEADERBOARD:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 322
    :cond_4
    const-string v0, "SKYSCRAPER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 323
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->WIDE_SKYSCRAPER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 325
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

    .line 231
    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 232
    .local v1, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    .line 234
    .local v2, "builder":Lcom/google/android/gms/ads/AdRequest$Builder;
    iget-boolean v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->isTesting:Z

    if-eqz v9, :cond_0

    .line 236
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "android_id"

    invoke-static {v9, v10}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "ANDROID_ID":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    .line 238
    .local v4, "deviceId":Ljava/lang/String;
    invoke-virtual {v2, v4}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v9

    sget-object v10, Lcom/google/android/gms/ads/AdRequest;->DEVICE_ID_EMULATOR:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    .line 241
    .end local v0    # "ANDROID_ID":Ljava/lang/String;
    .end local v4    # "deviceId":Ljava/lang/String;
    :cond_0
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    if-eqz v9, :cond_1

    .line 242
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 243
    .local v3, "bundle":Landroid/os/Bundle;
    const-string v9, "cordova"

    invoke-virtual {v3, v9, v14}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 244
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v9}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    .line 245
    .local v6, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_4

    .line 253
    new-instance v9, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;

    invoke-direct {v9, v3}, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v2, v9}, Lcom/google/android/gms/ads/AdRequest$Builder;->addNetworkExtras(Lcom/google/android/gms/ads/mediation/NetworkExtras;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    .line 256
    .end local v3    # "bundle":Landroid/os/Bundle;
    .end local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 257
    .restart local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_5

    .line 265
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    invoke-virtual {v2, v9}, Lcom/google/android/gms/ads/AdRequest$Builder;->setLocation(Landroid/location/Location;)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 267
    :cond_3
    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v9

    return-object v9

    .line 246
    .restart local v3    # "bundle":Landroid/os/Bundle;
    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 248
    .local v7, "key":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v9, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v7, v9}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 249
    :catch_0
    move-exception v5

    .line 250
    .local v5, "exception":Lorg/json/JSONException;
    const-string v9, "AdMobPlugin"

    const-string v10, "Caught JSON Exception: %s"

    new-array v11, v14, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v5}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 258
    .end local v3    # "bundle":Landroid/os/Bundle;
    .end local v5    # "exception":Lorg/json/JSONException;
    .end local v7    # "key":Ljava/lang/String;
    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 259
    .restart local v7    # "key":Ljava/lang/String;
    iget-object v9, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 260
    .local v8, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v8, :cond_2

    .line 261
    invoke-virtual {v8, v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->joinAdRequest(Lcom/google/android/gms/ads/AdRequest$Builder;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    goto :goto_1
.end method


# virtual methods
.method protected __createAdView(Ljava/lang/String;)Landroid/view/View;
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 100
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 101
    new-instance v0, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;-><init>(Landroid/content/Context;)V

    .line 102
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdUnitId(Ljava/lang/String;)V

    .line 103
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/ads/AdSize;

    iget-object v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdSizes([Lcom/google/android/gms/ads/AdSize;)V

    .line 104
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;

    invoke-direct {v1, p0, v4}, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 111
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-object v0

    .line 107
    :cond_0
    new-instance v0, Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    .line 108
    .local v0, "ad":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/AdView;->setAdUnitId(Ljava/lang/String;)V

    .line 109
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setAdSize(Lcom/google/android/gms/ads/AdSize;)V

    .line 110
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;

    invoke-direct {v1, p0, v4}, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0
.end method

.method protected __createInterstitial(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "adId"    # Ljava/lang/String;

    .prologue
    .line 191
    new-instance v0, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    .line 192
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 193
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 194
    return-object v0
.end method

.method protected __destroyAdView(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 176
    if-nez p1, :cond_0

    .line 187
    :goto_0
    return-void

    .line 178
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 179
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 180
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 181
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->destroy()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 183
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 184
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 185
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->destroy()V

    goto :goto_0
.end method

.method protected __destroyInterstitial(Ljava/lang/Object;)V
    .locals 2
    .param p1, "interstitial"    # Ljava/lang/Object;

    .prologue
    .line 221
    if-nez p1, :cond_1

    .line 227
    :cond_0
    :goto_0
    return-void

    .line 223
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 224
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 225
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0
.end method

.method protected __getAdViewHeight(Landroid/view/View;)I
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 144
    invoke-virtual {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    .line 145
    .local v0, "sz":Lcom/google/android/gms/ads/AdSize;
    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdSize;->getHeightInPixels(Landroid/content/Context;)I

    move-result v1

    return v1
.end method

.method protected __getAdViewWidth(Landroid/view/View;)I
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    .line 139
    .local v0, "sz":Lcom/google/android/gms/ads/AdSize;
    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdSize;->getWidthInPixels(Landroid/content/Context;)I

    move-result v1

    return v1
.end method

.method protected __getProductShortName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    const-string v0, "AdMob"

    return-object v0
.end method

.method protected __getTestBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, "ca-app-pub-6869992474017983/4748283957"

    return-object v0
.end method

.method protected __getTestInterstitialId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    const-string v0, "ca-app-pub-6869992474017983/6225017153"

    return-object v0
.end method

.method protected __loadAdView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 117
    instance-of v1, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 118
    check-cast v0, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 119
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    new-instance v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->build()Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->loadAd(Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;)V

    .line 124
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-void

    :cond_0
    move-object v0, p1

    .line 121
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 122
    .local v0, "ad":Lcom/google/android/gms/ads/AdView;
    invoke-direct {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->buildAdRequest()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    goto :goto_0
.end method

.method protected __loadInterstitial(Ljava/lang/Object;)V
    .locals 2
    .param p1, "interstitial"    # Ljava/lang/Object;

    .prologue
    .line 199
    if-nez p1, :cond_1

    .line 205
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 202
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 203
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    invoke-direct {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->buildAdRequest()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    goto :goto_0
.end method

.method protected __pauseAdView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 150
    if-nez p1, :cond_0

    .line 159
    :goto_0
    return-void

    .line 152
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 153
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 154
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->pause()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 156
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 157
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->pause()V

    goto :goto_0
.end method

.method protected __resumeAdView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 163
    if-nez p1, :cond_0

    .line 172
    :goto_0
    return-void

    .line 165
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 166
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 167
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->resume()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 169
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 170
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->resume()V

    goto :goto_0
.end method

.method protected __showInterstitial(Ljava/lang/Object;)V
    .locals 2
    .param p1, "interstitial"    # Ljava/lang/Object;

    .prologue
    .line 209
    if-nez p1, :cond_1

    .line 217
    :cond_0
    :goto_0
    return-void

    .line 211
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 212
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 213
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    goto :goto_0
.end method

.method protected getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 127
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_0

    move-object v1, p1

    .line 128
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 129
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v2

    .line 132
    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-object v2

    :cond_0
    move-object v0, p1

    .line 131
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 132
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v2

    goto :goto_0
.end method

.method public getErrorReason(I)Ljava/lang/String;
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 409
    const-string v0, ""

    .line 410
    .local v0, "errorReason":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 424
    :goto_0
    return-object v0

    .line 412
    :pswitch_0
    const-string v0, "Internal error"

    .line 413
    goto :goto_0

    .line 415
    :pswitch_1
    const-string v0, "Invalid request"

    .line 416
    goto :goto_0

    .line 418
    :pswitch_2
    const-string v0, "Network Error"

    .line 419
    goto :goto_0

    .line 421
    :pswitch_3
    const-string v0, "No fill"

    goto :goto_0

    .line 410
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    .line 295
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 296
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 301
    invoke-super {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onDestroy()V

    .line 302
    return-void

    .line 297
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 298
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 299
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onDestroy()V

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 272
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 273
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 279
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onPause(Z)V

    .line 280
    return-void

    .line 274
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 275
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 276
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onPause()V

    goto :goto_0
.end method

.method public onResume(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 284
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onResume(Z)V

    .line 285
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 286
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 291
    return-void

    .line 287
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 288
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 289
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onResume()V

    goto :goto_0
.end method

.method protected pluginInitialize()V
    .locals 0

    .prologue
    .line 55
    invoke-super {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->pluginInitialize()V

    .line 58
    return-void
.end method

.method public setOptions(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    const-wide/16 v4, 0x0

    .line 77
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 79
    const-string v1, "adSize"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "adSize"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSizeFromString(Ljava/lang/String;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 80
    :cond_0
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    if-nez v1, :cond_1

    .line 81
    new-instance v1, Lcom/google/android/gms/ads/AdSize;

    iget v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adWidth:I

    iget v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adHeight:I

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/ads/AdSize;-><init>(II)V

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 84
    :cond_1
    const-string v1, "adExtras"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "adExtras"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    .line 86
    :cond_2
    const-string v1, "location"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 87
    const-string v1, "location"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 88
    .local v0, "location":Lorg/json/JSONArray;
    if-eqz v0, :cond_3

    .line 89
    new-instance v1, Landroid/location/Location;

    const-string v2, "dummyprovider"

    invoke-direct {v1, v2}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    .line 90
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLatitude(D)V

    .line 91
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    .line 94
    .end local v0    # "location":Lorg/json/JSONArray;
    :cond_3
    return-void
.end method
