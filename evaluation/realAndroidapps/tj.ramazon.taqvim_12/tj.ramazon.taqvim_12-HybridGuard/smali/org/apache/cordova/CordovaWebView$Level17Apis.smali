.class final Lorg/apache/cordova/CordovaWebView$Level17Apis;
.super Ljava/lang/Object;
.source "CordovaWebView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/CordovaWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Level17Apis"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 865
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static setMediaPlaybackRequiresUserGesture(Landroid/webkit/WebSettings;Z)V
    .locals 0
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "value"    # Z

    .prologue
    .line 867
    invoke-virtual {p0, p1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 868
    return-void
.end method
