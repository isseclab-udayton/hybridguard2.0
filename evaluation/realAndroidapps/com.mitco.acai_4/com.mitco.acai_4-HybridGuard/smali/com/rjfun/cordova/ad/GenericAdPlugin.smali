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


# instance fields
.field protected adHeight:I

.field protected adPosition:I

.field protected adView:Landroid/view/View;

.field protected adWidth:I

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

.field protected widthOfView:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 27
    invoke-direct {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;-><init>()V

    .line 88
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 89
    const-string v0, ""

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 105
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

    .line 106
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    .line 107
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    .line 108
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->logVerbose:Z

    .line 110
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adWidth:I

    .line 111
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adHeight:I

    .line 112
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    .line 113
    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    .line 115
    const/16 v0, 0x8

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adPosition:I

    .line 116
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    .line 117
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    .line 119
    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 120
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowInterstitial:Z

    .line 122
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    .line 123
    iput v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    .line 125
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    .line 126
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    .line 127
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    .line 128
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 129
    iput-object v4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 131
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 132
    iput-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialReady:Z

    .line 219
    return-void

    :cond_0
    move v0, v2

    .line 105
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V
    .locals 0
    .param p0, "x0"    # Lcom/rjfun/cordova/ad/GenericAdPlugin;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->detachBanner()V

    return-void
.end method

.method private detachBanner()V
    .locals 3

    .prologue
    .line 460
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v1, :cond_1

    .line 469
    :cond_0
    :goto_0
    return-void

    .line 462
    :cond_1
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 463
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 465
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 466
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 467
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0
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

    .line 261
    const-string v8, "/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "fields":[Ljava/lang/String;
    array-length v8, v0

    const/4 v9, 0x2

    if-lt v8, v9, :cond_3

    .line 263
    aget-object v5, v0, v7

    .line 264
    .local v5, "userid":Ljava/lang/String;
    aget-object v3, v0, v6

    .line 265
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

    .line 266
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

    .line 267
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

    .line 274
    .end local v2    # "genKey2":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "userid":Ljava/lang/String;
    :goto_1
    iget-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->licenseValidated:Z

    if-eqz v6, :cond_1

    .line 275
    const-string v6, "GenericAdPlugin"

    const-string v8, "valid license"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    iput-boolean v7, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    .line 278
    :cond_1
    return-void

    .restart local v2    # "genKey2":Ljava/lang/String;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "userid":Ljava/lang/String;
    :cond_2
    move v6, v7

    .line 267
    goto :goto_0

    .line 269
    .end local v1    # "genKey":Ljava/lang/String;
    .end local v2    # "genKey2":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "userid":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 270
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

    .line 271
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
    .line 231
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 232
    .local v0, "w":I
    iget v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    if-ne v0, v1, :cond_0

    .line 237
    :goto_0
    return-void

    .line 234
    :cond_0
    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->widthOfView:I

    .line 236
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->onViewOrientationChanged()V

    goto :goto_0
.end method

.method public createBanner(Ljava/lang/String;Z)Z
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "autoShow"    # Z

    .prologue
    .line 300
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

    .line 302
    iput-boolean p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 304
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 307
    :goto_0
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getTestBannerId()Ljava/lang/String;

    move-result-object p1

    .line 309
    :cond_0
    move-object v1, p1

    .line 310
    .local v1, "strAdUnitId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 311
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;

    invoke-direct {v2, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 324
    const/4 v2, 0x1

    return v2

    .line 305
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "strAdUnitId":Ljava/lang/String;
    :cond_1
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    goto :goto_0
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
    .line 136
    const/4 v7, 0x0

    .line 138
    .local v7, "result":Lorg/apache/cordova/PluginResult;
    const-string v10, "setOptions"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 139
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 140
    .local v6, "options":Lorg/json/JSONObject;
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 141
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 196
    .end local v6    # "options":Lorg/json/JSONObject;
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    :goto_0
    move-object/from16 v0, p3

    invoke-virtual {p0, v7, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->sendPluginResult(Lorg/apache/cordova/PluginResult;Lorg/apache/cordova/CallbackContext;)V

    .line 198
    const/4 v10, 0x1

    return v10

    .line 143
    :cond_0
    const-string v10, "createBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 144
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 145
    .restart local v6    # "options":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->length()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_1

    .line 146
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 148
    :cond_1
    const-string v10, "adId"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 149
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

    .line 151
    .local v3, "autoShow":Z
    :goto_1
    invoke-virtual {p0, v1, v3}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->createBanner(Ljava/lang/String;Z)Z

    move-result v4

    .line 152
    .local v4, "isOk":Z
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    if-eqz v4, :cond_4

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    :goto_2
    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 154
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 149
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 152
    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v3    # "autoShow":Z
    .restart local v4    # "isOk":Z
    :cond_4
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    goto :goto_2

    .line 154
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

    .line 155
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->removeBanner()V

    .line 156
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 158
    :cond_6
    const-string v10, "hideBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 159
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->hideBanner()V

    .line 160
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 162
    :cond_7
    const-string v10, "showBanner"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 163
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optInt(I)I

    move-result v5

    .line 164
    .local v5, "nPos":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {p0, v5, v10, v11}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V

    .line 165
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 167
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .end local v5    # "nPos":I
    :cond_8
    const-string v10, "showBannerAtXY"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 168
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 169
    .local v2, "args":Lorg/json/JSONObject;
    const-string v10, "x"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    .line 170
    .local v8, "x":I
    const-string v10, "y"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    .line 171
    .local v9, "y":I
    const/16 v10, 0xa

    invoke-virtual {p0, v10, v8, v9}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V

    .line 172
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 174
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

    .line 175
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 176
    .restart local v6    # "options":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->length()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_a

    .line 177
    invoke-virtual {p0, v6}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->setOptions(Lorg/json/JSONObject;)V

    .line 179
    :cond_a
    const-string v10, "adId"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 180
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

    .line 181
    .restart local v3    # "autoShow":Z
    :goto_3
    invoke-virtual {p0, v1, v3}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->prepareInterstitial(Ljava/lang/String;Z)Z

    move-result v4

    .line 182
    .restart local v4    # "isOk":Z
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    if-eqz v4, :cond_d

    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    :goto_4
    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 184
    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 180
    .end local v3    # "autoShow":Z
    .end local v4    # "isOk":Z
    :cond_c
    const/4 v3, 0x0

    goto :goto_3

    .line 182
    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    .restart local v3    # "autoShow":Z
    .restart local v4    # "isOk":Z
    :cond_d
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    goto :goto_4

    .line 184
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

    .line 185
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->showInterstitial()V

    .line 186
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v7, v10}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 188
    :cond_f
    const-string v10, "isInterstitialReady"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 189
    new-instance v7, Lorg/apache/cordova/PluginResult;

    .end local v7    # "result":Lorg/apache/cordova/PluginResult;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-boolean v11, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialReady:Z

    invoke-direct {v7, v10, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .restart local v7    # "result":Lorg/apache/cordova/PluginResult;
    goto/16 :goto_0

    .line 192
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

    .line 193
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
    .line 599
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v1

    .line 600
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

    .line 601
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {p0, v1, p1, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 602
    return-void
.end method

.method protected fireAdEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "adType"    # Ljava/lang/String;

    .prologue
    .line 592
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getProductShortName()Ljava/lang/String;

    move-result-object v1

    .line 593
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

    .line 594
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {p0, v1, p1, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 595
    return-void
.end method

.method public fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/String;
    .param p2, "eventName"    # Ljava/lang/String;
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 203
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_0

    .line 204
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

    .line 206
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public hideBanner()V
    .locals 3

    .prologue
    .line 472
    const-string v1, "GenericAdPlugin"

    const-string v2, "hideBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 486
    :goto_0
    return-void

    .line 475
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowBanner:Z

    .line 477
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 478
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 282
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 283
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 284
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 285
    .local v4, "messageDigest":[B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 286
    .local v2, "hexString":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-ge v3, v5, :cond_1

    .line 287
    aget-byte v5, v4, v3

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 288
    .local v1, "h":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 289
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

    .line 290
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 292
    .end local v1    # "h":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 296
    .end local v0    # "digest":Ljava/security/MessageDigest;
    .end local v2    # "hexString":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "messageDigest":[B
    :goto_2
    return-object v5

    .line 294
    :catch_0
    move-exception v5

    .line 296
    const-string v5, ""

    goto :goto_2
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 559
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 560
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__destroyAdView(Landroid/view/View;)V

    .line 561
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 563
    :cond_0
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 564
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__destroyInterstitial(Ljava/lang/Object;)V

    .line 565
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 567
    :cond_1
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    if-eqz v1, :cond_3

    .line 568
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 569
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_2

    .line 570
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 572
    :cond_2
    iput-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    .line 574
    .end local v0    # "parentView":Landroid/view/ViewGroup;
    :cond_3
    invoke-super {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onDestroy()V

    .line 575
    return-void
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 543
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 544
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__pauseAdView(Landroid/view/View;)V

    .line 546
    :cond_0
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onPause(Z)V

    .line 547
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 551
    invoke-super {p0, p1}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->onResume(Z)V

    .line 552
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 553
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__resumeAdView(Landroid/view/View;)V

    .line 555
    :cond_0
    return-void
.end method

.method public onViewOrientationChanged()V
    .locals 3

    .prologue
    .line 578
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_0

    const-string v0, "GenericAdPlugin"

    const-string v1, "Orientation Changed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    if-eqz v0, :cond_2

    .line 580
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    if-eqz v0, :cond_3

    .line 581
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_1

    const-string v0, "GenericAdPlugin"

    const-string v1, "renew banner on orientation change"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    :cond_1
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->removeBanner()V

    .line 583
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->createBanner(Ljava/lang/String;Z)Z

    .line 589
    :cond_2
    :goto_0
    return-void

    .line 585
    :cond_3
    iget-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    if-eqz v0, :cond_4

    const-string v0, "GenericAdPlugin"

    const-string v1, "adjust banner position"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
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
    .line 211
    invoke-super {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->pluginInitialize()V

    .line 213
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    const/4 v1, 0x3

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    .line 215
    :cond_0
    new-instance v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;

    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    .line 216
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 217
    return-void
.end method

.method public prepareInterstitial(Ljava/lang/String;Z)Z
    .locals 5
    .param p1, "adId"    # Ljava/lang/String;
    .param p2, "autoShow"    # Z

    .prologue
    .line 489
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

    .line 491
    iput-boolean p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->autoShowInterstitial:Z

    .line 493
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 496
    :goto_0
    iget-boolean v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->testTraffic:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getTestInterstitialId()Ljava/lang/String;

    move-result-object p1

    .line 498
    :cond_0
    move-object v1, p1

    .line 499
    .local v1, "strUnitId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 500
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/rjfun/cordova/ad/GenericAdPlugin$5;

    invoke-direct {v2, p0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin$5;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 513
    const/4 v2, 0x1

    return v2

    .line 494
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "strUnitId":Ljava/lang/String;
    :cond_1
    iget-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    goto :goto_0
.end method

.method public removeBanner()V
    .locals 3

    .prologue
    .line 328
    const-string v1, "GenericAdPlugin"

    const-string v2, "removeBanner"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 331
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 342
    return-void
.end method

.method public removeInterstitial()V
    .locals 2

    .prologue
    .line 529
    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 530
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 531
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$7;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$7;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 537
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstitialAd:Ljava/lang/Object;

    .line 539
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_0
    return-void
.end method

.method public setOptions(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 240
    if-eqz p1, :cond_b

    .line 241
    const-string v0, "license"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "license"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->validateLicense(Ljava/lang/String;)V

    .line 242
    :cond_0
    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "isTesting"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->isTesting:Z

    .line 243
    :cond_1
    const-string v0, "logVerbose"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "logVerbose"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->logVerbose:Z

    .line 245
    :cond_2
    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adWidth:I

    .line 246
    :cond_3
    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adHeight:I

    .line 247
    :cond_4
    const-string v0, "overlap"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "overlap"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    .line 248
    :cond_5
    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "orientationRenew"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->orientationRenew:Z

    .line 250
    :cond_6
    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adPosition:I

    .line 251
    :cond_7
    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "x"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    .line 252
    :cond_8
    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "y"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    .line 254
    :cond_9
    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "bannerId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerId:Ljava/lang/String;

    .line 255
    :cond_a
    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "interstitialId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->interstialId:Ljava/lang/String;

    .line 257
    :cond_b
    return-void
.end method

.method public showBanner(III)V
    .locals 7
    .param p1, "argPos"    # I
    .param p2, "argX"    # I
    .param p3, "argY"    # I

    .prologue
    .line 345
    const-string v0, "GenericAdPlugin"

    const-string v1, "showBanner"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 348
    const-string v0, "GenericAdPlugin"

    const-string v1, "banner is null, call createBanner() first."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    :goto_0
    return-void

    .line 352
    :cond_0
    iget-boolean v6, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 354
    .local v6, "bannerAlreadyVisible":Z
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v5

    .line 355
    .local v5, "activity":Landroid/app/Activity;
    new-instance v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$3;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/rjfun/cordova/ad/GenericAdPlugin$3;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;IIILandroid/app/Activity;)V

    invoke-virtual {v5, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public showInterstitial()V
    .locals 3

    .prologue
    .line 517
    const-string v1, "GenericAdPlugin"

    const-string v2, "showInterstitial"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    invoke-virtual {p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 520
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Lcom/rjfun/cordova/ad/GenericAdPlugin$6;

    invoke-direct {v1, p0}, Lcom/rjfun/cordova/ad/GenericAdPlugin$6;-><init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 526
    return-void
.end method
