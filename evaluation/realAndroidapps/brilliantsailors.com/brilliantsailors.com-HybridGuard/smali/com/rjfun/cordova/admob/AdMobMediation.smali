.class public abstract Lcom/rjfun/cordova/admob/AdMobMediation;
.super Ljava/lang/Object;
.source "AdMobMediation.java"


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract joinAdRequest(Lcom/google/android/gms/ads/AdRequest$Builder;)Lcom/google/android/gms/ads/AdRequest$Builder;
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 12
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 10
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 11
    return-void
.end method
