.class public Lcom/rjfun/cordova/admob/AdMobPlugin;
.super Lcom/rjfun/cordova/ad/GenericAdPlugin;
.source "AdMobPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;,
        Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "AdMobPlugin"

.field private static final OPT_ADCOLONY:Ljava/lang/String; = "AdColony"

.field public static final OPT_AD_EXTRAS:Ljava/lang/String; = "adExtras"

.field public static final OPT_CONTENTURL:Ljava/lang/String; = "contentUrl"

.field public static final OPT_CUSTOMTARGETING:Ljava/lang/String; = "customTargeting"

.field public static final OPT_EXCLUDE:Ljava/lang/String; = "exclude"

.field private static final OPT_FACEBOOK:Ljava/lang/String; = "Facebook"

.field private static final OPT_FLURRY:Ljava/lang/String; = "Flurry"

.field public static final OPT_FORCHILD:Ljava/lang/String; = "forChild"

.field public static final OPT_FORFAMILY:Ljava/lang/String; = "forFamily"

.field public static final OPT_GENDER:Ljava/lang/String; = "gender"

.field private static final OPT_INMOBI:Ljava/lang/String; = "InMobi"

.field public static final OPT_LOCATION:Ljava/lang/String; = "location"

.field private static final OPT_MMEDIA:Ljava/lang/String; = "mMedia"

.field private static final OPT_MOBFOX:Ljava/lang/String; = "MobFox"

.field private static final TEST_BANNER_ID:Ljava/lang/String; = "ca-app-pub-8094096715994524/6097141095"

.field private static final TEST_INTERSTITIAL_ID:Ljava/lang/String; = "ca-app-pub-8094096715994524/4760008695"


# instance fields
.field private adExtras:Lorg/json/JSONObject;

.field private adSize:Lcom/google/android/gms/ads/AdSize;

.field protected mContentURL:Ljava/lang/String;

.field protected mCustomTargeting:Lorg/json/JSONObject;

.field protected mExclude:Lorg/json/JSONArray;

.field protected mForChild:Ljava/lang/String;

.field protected mForFamily:Ljava/lang/String;

.field protected mGender:Ljava/lang/String;

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

    .line 35
    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;-><init>()V

    .line 49
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    iput-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 52
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    .line 55
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    .line 64
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    .line 65
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    .line 66
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForFamily:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    .line 69
    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$1000(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdErrorEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->autoShowInterstitial:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdErrorEvent(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->autoShowBanner:Z

    return v0
.end method

.method static synthetic access$500(Lcom/rjfun/cordova/admob/AdMobPlugin;)Z
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->bannerVisible:Z

    return v0
.end method

.method static synthetic access$600(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adPosition:I

    return v0
.end method

.method static synthetic access$700(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->posX:I

    return v0
.end method

.method static synthetic access$800(Lcom/rjfun/cordova/admob/AdMobPlugin;)I
    .locals 1
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;

    .prologue
    .line 35
    iget v0, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->posY:I

    return v0
.end method

.method static synthetic access$900(Lcom/rjfun/cordova/admob/AdMobPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/admob/AdMobPlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static adSizeFromString(Ljava/lang/String;)Lcom/google/android/gms/ads/AdSize;
    .locals 1
    .param p0, "size"    # Ljava/lang/String;

    .prologue
    .line 472
    const-string v0, "BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 473
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->BANNER:Lcom/google/android/gms/ads/AdSize;

    .line 485
    :goto_0
    return-object v0

    .line 474
    :cond_0
    const-string v0, "SMART_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 475
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->SMART_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 476
    :cond_1
    const-string v0, "MEDIUM_RECTANGLE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 477
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->MEDIUM_RECTANGLE:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 478
    :cond_2
    const-string v0, "FULL_BANNER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 479
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->FULL_BANNER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 480
    :cond_3
    const-string v0, "LEADERBOARD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 481
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->LEADERBOARD:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 482
    :cond_4
    const-string v0, "SKYSCRAPER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 483
    sget-object v0, Lcom/google/android/gms/ads/AdSize;->WIDE_SKYSCRAPER:Lcom/google/android/gms/ads/AdSize;

    goto :goto_0

    .line 485
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
    .line 280
    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 281
    .local v1, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    .line 283
    .local v2, "builder":Lcom/google/android/gms/ads/AdRequest$Builder;
    iget-boolean v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->isTesting:Z

    if-eqz v10, :cond_0

    .line 285
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "android_id"

    invoke-static {v10, v11}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 286
    .local v0, "ANDROID_ID":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    .line 287
    .local v4, "deviceId":Ljava/lang/String;
    invoke-virtual {v2, v4}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v10

    const-string v11, "B3EEABB8EE11C2BE770B684D95219ECB"

    invoke-virtual {v10, v11}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    .line 290
    .end local v0    # "ANDROID_ID":Ljava/lang/String;
    .end local v4    # "deviceId":Ljava/lang/String;
    :cond_0
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    if-eqz v10, :cond_2

    .line 291
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 292
    .local v3, "bundle":Landroid/os/Bundle;
    const-string v10, "cordova"

    const/4 v11, 0x1

    invoke-virtual {v3, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 293
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v10}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 294
    .local v7, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 295
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 297
    .local v8, "key":Ljava/lang/String;
    :try_start_0
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v8, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 298
    :catch_0
    move-exception v5

    .line 299
    .local v5, "exception":Lorg/json/JSONException;
    const-string v10, "AdMobPlugin"

    const-string v11, "Caught JSON Exception: %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v5}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 302
    .end local v5    # "exception":Lorg/json/JSONException;
    .end local v8    # "key":Ljava/lang/String;
    :cond_1
    new-instance v10, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;

    invoke-direct {v10, v3}, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->addNetworkExtras(Lcom/google/android/gms/ads/mediation/NetworkExtras;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    .line 305
    .end local v3    # "bundle":Landroid/os/Bundle;
    .end local v7    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v10}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 306
    .restart local v7    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 307
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 308
    .restart local v8    # "key":Ljava/lang/String;
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 309
    .local v9, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v9, :cond_3

    .line 310
    invoke-virtual {v9, v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->joinAdRequest(Lcom/google/android/gms/ads/AdRequest$Builder;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v2

    goto :goto_1

    .line 314
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    :cond_4
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    if-eqz v10, :cond_5

    .line 315
    const-string v10, "male"

    iget-object v11, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v10

    if-eqz v10, :cond_a

    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 319
    :cond_5
    :goto_2
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    if-eqz v10, :cond_6

    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->setLocation(Landroid/location/Location;)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 320
    :cond_6
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForFamily:Ljava/lang/String;

    if-eqz v10, :cond_7

    .line 321
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 322
    .local v6, "extras":Landroid/os/Bundle;
    const-string v10, "is_designed_for_families"

    const/4 v11, 0x1

    invoke-virtual {v6, v10, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 323
    const-class v10, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v2, v10, v6}, Lcom/google/android/gms/ads/AdRequest$Builder;->addNetworkExtrasBundle(Ljava/lang/Class;Landroid/os/Bundle;)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 325
    .end local v6    # "extras":Landroid/os/Bundle;
    :cond_7
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    if-eqz v10, :cond_8

    .line 326
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->tagForChildDirectedTreatment(Z)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 328
    :cond_8
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    if-eqz v10, :cond_9

    .line 329
    iget-object v10, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->setContentUrl(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    .line 332
    :cond_9
    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v10

    return-object v10

    .line 316
    :cond_a
    const-string v10, "female"

    iget-object v11, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v10

    if-eqz v10, :cond_b

    const/4 v10, 0x2

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/AdRequest$Builder;

    goto :goto_2

    .line 317
    :cond_b
    const/4 v10, 0x0

    invoke-virtual {v2, v10}, Lcom/google/android/gms/ads/AdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/AdRequest$Builder;

    goto :goto_2
.end method

.method private buildPublisherAdRequest()Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;
    .locals 24
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual/range {p0 .. p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 338
    .local v3, "activity":Landroid/app/Activity;
    new-instance v4, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    invoke-direct {v4}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;-><init>()V

    .line 340
    .local v4, "builder":Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->isTesting:Z

    move/from16 v19, v0

    if-eqz v19, :cond_0

    .line 342
    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "android_id"

    invoke-static/range {v19 .. v20}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 343
    .local v2, "ANDROID_ID":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/rjfun/cordova/admob/AdMobPlugin;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    .line 344
    .local v6, "deviceId":Ljava/lang/String;
    invoke-virtual {v4, v6}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    move-result-object v19

    const-string v20, "B3EEABB8EE11C2BE770B684D95219ECB"

    invoke-virtual/range {v19 .. v20}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    move-result-object v4

    .line 347
    .end local v2    # "ANDROID_ID":Ljava/lang/String;
    .end local v6    # "deviceId":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2

    .line 348
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 349
    .local v5, "bundle":Landroid/os/Bundle;
    const-string v19, "cordova"

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v11

    .line 351
    .local v11, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_1

    .line 352
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 354
    .local v13, "key":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v5, v13, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 355
    :catch_0
    move-exception v8

    .line 356
    .local v8, "exception":Lorg/json/JSONException;
    const-string v19, "AdMobPlugin"

    const-string v20, "Caught JSON Exception: %s"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v8}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 359
    .end local v8    # "exception":Lorg/json/JSONException;
    .end local v13    # "key":Ljava/lang/String;
    :cond_1
    new-instance v19, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;

    move-object/from16 v0, v19

    invoke-direct {v0, v5}, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;-><init>(Landroid/os/Bundle;)V

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addNetworkExtras(Lcom/google/android/gms/ads/mediation/NetworkExtras;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    move-result-object v4

    .line 362
    .end local v5    # "bundle":Landroid/os/Bundle;
    .end local v11    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_3

    .line 363
    const-string v19, "male"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v19

    if-eqz v19, :cond_9

    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 367
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    move-object/from16 v19, v0

    if-eqz v19, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->setLocation(Landroid/location/Location;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 368
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForFamily:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_5

    .line 369
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 370
    .local v9, "extras":Landroid/os/Bundle;
    const-string v20, "is_designed_for_families"

    const-string v19, "yes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v19

    if-nez v19, :cond_b

    const/16 v19, 0x1

    :goto_2
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 371
    const-class v19, Lcom/google/ads/mediation/admob/AdMobAdapter;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0, v9}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addNetworkExtrasBundle(Ljava/lang/Class;Landroid/os/Bundle;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 373
    .end local v9    # "extras":Landroid/os/Bundle;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_6

    .line 374
    const-string v19, "yes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v19

    if-nez v19, :cond_c

    const/16 v19, 0x1

    :goto_3
    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->tagForChildDirectedTreatment(Z)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 376
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_7

    .line 377
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->setContentUrl(Ljava/lang/String;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 381
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    if-eqz v19, :cond_f

    .line 382
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    .line 383
    .local v12, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_8
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_f

    .line 384
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 385
    .restart local v13    # "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 386
    .local v16, "str":Ljava/lang/String;
    if-eqz v16, :cond_d

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_d

    .line 387
    move-object/from16 v0, v16

    invoke-virtual {v4, v13, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addCustomTargeting(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    goto :goto_4

    .line 364
    .end local v12    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v13    # "key":Ljava/lang/String;
    .end local v16    # "str":Ljava/lang/String;
    :cond_9
    const-string v19, "female"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v19

    if-eqz v19, :cond_a

    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    goto/16 :goto_1

    .line 365
    :cond_a
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->setGender(I)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    goto/16 :goto_1

    .line 370
    .restart local v9    # "extras":Landroid/os/Bundle;
    :cond_b
    const/16 v19, 0x0

    goto/16 :goto_2

    .line 374
    .end local v9    # "extras":Landroid/os/Bundle;
    :cond_c
    const/16 v19, 0x0

    goto :goto_3

    .line 389
    .restart local v12    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v13    # "key":Ljava/lang/String;
    .restart local v16    # "str":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v18

    .line 390
    .local v18, "strs":Lorg/json/JSONArray;
    if-eqz v18, :cond_8

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_8

    .line 391
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .local v17, "strlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v10, v0, :cond_e

    .line 393
    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 394
    :cond_e
    move-object/from16 v0, v17

    invoke-virtual {v4, v13, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addCustomTargeting(Ljava/lang/String;Ljava/util/List;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    goto/16 :goto_4

    .line 399
    .end local v10    # "i":I
    .end local v12    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v13    # "key":Ljava/lang/String;
    .end local v16    # "str":Ljava/lang/String;
    .end local v17    # "strlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v18    # "strs":Lorg/json/JSONArray;
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    move-object/from16 v19, v0

    if-eqz v19, :cond_12

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v15

    .line 401
    .local v15, "n":I
    if-lez v15, :cond_12

    .line 403
    const/4 v14, 0x0

    .line 404
    .local v14, "method":Ljava/lang/reflect/Method;
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    const-string v20, "addCategoryExclusion"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const-class v23, Ljava/lang/String;

    aput-object v23, v21, v22

    invoke-virtual/range {v19 .. v21}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v14

    .line 405
    if-eqz v14, :cond_12

    .line 407
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_6
    if-ge v10, v15, :cond_12

    .line 408
    const/16 v19, 0x1

    :try_start_2
    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    move-object/from16 v21, v0

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v10, v1}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v14, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_1

    .line 407
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 413
    .end local v10    # "i":I
    :catch_1
    move-exception v7

    .line 415
    .local v7, "e":Ljava/lang/NoSuchMethodException;
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 416
    .restart local v5    # "bundle":Landroid/os/Bundle;
    const-string v16, ""

    .line 417
    .restart local v16    # "str":Ljava/lang/String;
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_7
    if-ge v10, v15, :cond_11

    .line 418
    if-lez v10, :cond_10

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ","

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 419
    :cond_10
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    move-object/from16 v20, v0

    const-string v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v0, v10, v1}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 417
    add-int/lit8 v10, v10, 0x1

    goto :goto_7

    .line 421
    :cond_11
    const-string v19, "excl_cat"

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v5, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    new-instance v19, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;

    move-object/from16 v0, v19

    invoke-direct {v0, v5}, Lcom/google/android/gms/ads/mediation/admob/AdMobExtras;-><init>(Landroid/os/Bundle;)V

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->addNetworkExtras(Lcom/google/android/gms/ads/mediation/NetworkExtras;)Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;

    .line 427
    .end local v5    # "bundle":Landroid/os/Bundle;
    .end local v7    # "e":Ljava/lang/NoSuchMethodException;
    .end local v10    # "i":I
    .end local v14    # "method":Ljava/lang/reflect/Method;
    .end local v15    # "n":I
    .end local v16    # "str":Ljava/lang/String;
    :cond_12
    :goto_8
    invoke-virtual {v4}, Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder;->build()Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;

    move-result-object v19

    return-object v19

    .line 410
    .restart local v10    # "i":I
    .restart local v14    # "method":Ljava/lang/reflect/Method;
    .restart local v15    # "n":I
    :catch_2
    move-exception v19

    goto :goto_8
.end method


# virtual methods
.method protected __createAdView(Ljava/lang/String;)Landroid/view/View;
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 139
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 140
    new-instance v0, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;-><init>(Landroid/content/Context;)V

    .line 141
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdUnitId(Ljava/lang/String;)V

    .line 142
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/gms/ads/AdSize;

    iget-object v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdSizes([Lcom/google/android/gms/ads/AdSize;)V

    .line 143
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;

    invoke-direct {v1, p0, v4}, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$1;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 150
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-object v0

    .line 146
    :cond_0
    new-instance v0, Lcom/google/android/gms/ads/AdView;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    .line 147
    .local v0, "ad":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/AdView;->setAdUnitId(Ljava/lang/String;)V

    .line 148
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setAdSize(Lcom/google/android/gms/ads/AdSize;)V

    .line 149
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;

    invoke-direct {v1, p0, v4}, Lcom/rjfun/cordova/admob/AdMobPlugin$BannerListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$1;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0
.end method

.method protected __createInterstitial(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "adId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 230
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 231
    new-instance v0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;-><init>(Landroid/content/Context;)V

    .line 232
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 233
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;

    invoke-direct {v1, p0, v3}, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$1;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 239
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;
    :goto_0
    return-object v0

    .line 236
    :cond_0
    new-instance v0, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    .line 237
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 238
    new-instance v1, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;

    invoke-direct {v1, p0, v3}, Lcom/rjfun/cordova/admob/AdMobPlugin$InterstitialListener;-><init>(Lcom/rjfun/cordova/admob/AdMobPlugin;Lcom/rjfun/cordova/admob/AdMobPlugin$1;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0
.end method

.method protected __destroyAdView(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 215
    if-nez p1, :cond_0

    .line 226
    :goto_0
    return-void

    .line 217
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 218
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 219
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 220
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->destroy()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 222
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 223
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 224
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->destroy()V

    goto :goto_0
.end method

.method protected __destroyInterstitial(Ljava/lang/Object;)V
    .locals 2
    .param p1, "interstitial"    # Ljava/lang/Object;

    .prologue
    .line 270
    if-nez p1, :cond_1

    .line 276
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 273
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 274
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    goto :goto_0
.end method

.method protected __getAdViewHeight(Landroid/view/View;)I
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 183
    invoke-virtual {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    .line 184
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
    .line 177
    invoke-virtual {p0, p1}, Lcom/rjfun/cordova/admob/AdMobPlugin;->getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    .line 178
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
    .line 82
    const-string v0, "AdMob"

    return-object v0
.end method

.method protected __getTestBannerId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    const-string v0, "ca-app-pub-8094096715994524/6097141095"

    return-object v0
.end method

.method protected __getTestInterstitialId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    const-string v0, "ca-app-pub-8094096715994524/4760008695"

    return-object v0
.end method

.method protected __loadAdView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 156
    instance-of v1, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 157
    check-cast v0, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 158
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-direct {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->buildPublisherAdRequest()Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->loadAd(Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;)V

    .line 163
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-void

    :cond_0
    move-object v0, p1

    .line 160
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 161
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
    .line 245
    if-nez p1, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 247
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    if-eqz v1, :cond_2

    move-object v0, p1

    .line 248
    check-cast v0, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    .line 249
    .local v0, "ad":Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;
    invoke-direct {p0}, Lcom/rjfun/cordova/admob/AdMobPlugin;->buildPublisherAdRequest()Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;->loadAd(Lcom/google/android/gms/ads/doubleclick/PublisherAdRequest;)V

    goto :goto_0

    .line 250
    .end local v0    # "ad":Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;
    :cond_2
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 251
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 252
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
    .line 189
    if-nez p1, :cond_0

    .line 198
    :goto_0
    return-void

    .line 191
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 192
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 193
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->pause()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 195
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 196
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->pause()V

    goto :goto_0
.end method

.method protected __resumeAdView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 202
    if-nez p1, :cond_0

    .line 211
    :goto_0
    return-void

    .line 204
    :cond_0
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 205
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 206
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->resume()V

    goto :goto_0

    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :cond_1
    move-object v0, p1

    .line 208
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 209
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->resume()V

    goto :goto_0
.end method

.method protected __showInterstitial(Ljava/lang/Object;)V
    .locals 2
    .param p1, "interstitial"    # Ljava/lang/Object;

    .prologue
    .line 258
    if-nez p1, :cond_1

    .line 266
    :cond_0
    :goto_0
    return-void

    .line 260
    :cond_1
    instance-of v1, p1, Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 261
    check-cast v0, Lcom/google/android/gms/ads/InterstitialAd;

    .line 262
    .local v0, "ad":Lcom/google/android/gms/ads/InterstitialAd;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 263
    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    goto :goto_0
.end method

.method protected getAdViewSize(Landroid/view/View;)Lcom/google/android/gms/ads/AdSize;
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 166
    instance-of v2, p1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    if-eqz v2, :cond_0

    move-object v1, p1

    .line 167
    check-cast v1, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;

    .line 168
    .local v1, "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    invoke-virtual {v1}, Lcom/google/android/gms/ads/doubleclick/PublisherAdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v2

    .line 171
    .end local v1    # "dfpView":Lcom/google/android/gms/ads/doubleclick/PublisherAdView;
    :goto_0
    return-object v2

    :cond_0
    move-object v0, p1

    .line 170
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 171
    .local v0, "admobView":Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v2

    goto :goto_0
.end method

.method public getErrorReason(I)Ljava/lang/String;
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 569
    const-string v0, ""

    .line 570
    .local v0, "errorReason":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 584
    :goto_0
    return-object v0

    .line 572
    :pswitch_0
    const-string v0, "Internal error"

    .line 573
    goto :goto_0

    .line 575
    :pswitch_1
    const-string v0, "Invalid request"

    .line 576
    goto :goto_0

    .line 578
    :pswitch_2
    const-string v0, "Network Error"

    .line 579
    goto :goto_0

    .line 581
    :pswitch_3
    const-string v0, "No fill"

    goto :goto_0

    .line 570
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
    .line 455
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 456
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 457
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 458
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 459
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onDestroy()V

    goto :goto_0

    .line 461
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    :cond_1
    invoke-super {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onDestroy()V

    .line 462
    return-void
.end method

.method public onPause(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 432
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 433
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 434
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 435
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 436
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onPause()V

    goto :goto_0

    .line 439
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    :cond_1
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onPause(Z)V

    .line 440
    return-void
.end method

.method public onResume(Z)V
    .locals 4
    .param p1, "multitasking"    # Z

    .prologue
    .line 444
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onResume(Z)V

    .line 445
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 446
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 447
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 448
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mediations:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rjfun/cordova/admob/AdMobMediation;

    .line 449
    .local v2, "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/rjfun/cordova/admob/AdMobMediation;->onResume()V

    goto :goto_0

    .line 451
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "m":Lcom/rjfun/cordova/admob/AdMobMediation;
    :cond_1
    return-void
.end method

.method protected pluginInitialize()V
    .locals 0

    .prologue
    .line 75
    invoke-super {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->pluginInitialize()V

    .line 78
    return-void
.end method

.method public setOptions(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    const-wide/16 v4, 0x0

    .line 97
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 99
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

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    if-nez v1, :cond_1

    .line 101
    new-instance v1, Lcom/google/android/gms/ads/AdSize;

    iget v2, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adWidth:I

    iget v3, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adHeight:I

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/ads/AdSize;-><init>(II)V

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adSize:Lcom/google/android/gms/ads/AdSize;

    .line 104
    :cond_1
    const-string v1, "adExtras"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "adExtras"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->adExtras:Lorg/json/JSONObject;

    .line 106
    :cond_2
    const-string v1, "location"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 107
    const-string v1, "location"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 108
    .local v0, "location":Lorg/json/JSONArray;
    if-eqz v0, :cond_3

    .line 109
    new-instance v1, Landroid/location/Location;

    const-string v2, "dummyprovider"

    invoke-direct {v1, v2}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    .line 110
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLatitude(D)V

    .line 111
    iget-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mLocation:Landroid/location/Location;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONArray;->optDouble(ID)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    .line 115
    .end local v0    # "location":Lorg/json/JSONArray;
    :cond_3
    const-string v1, "gender"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 116
    const-string v1, "gender"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mGender:Ljava/lang/String;

    .line 118
    :cond_4
    const-string v1, "forChild"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 119
    const-string v1, "forChild"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForChild:Ljava/lang/String;

    .line 121
    :cond_5
    const-string v1, "forFamily"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 122
    const-string v1, "forFamily"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mForFamily:Ljava/lang/String;

    .line 124
    :cond_6
    const-string v1, "contentUrl"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 125
    const-string v1, "contentUrl"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mContentURL:Ljava/lang/String;

    .line 127
    :cond_7
    const-string v1, "customTargeting"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 128
    const-string v1, "customTargeting"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mCustomTargeting:Lorg/json/JSONObject;

    .line 130
    :cond_8
    const-string v1, "exclude"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 131
    const-string v1, "exclude"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, p0, Lcom/rjfun/cordova/admob/AdMobPlugin;->mExclude:Lorg/json/JSONArray;

    .line 133
    :cond_9
    return-void
.end method
