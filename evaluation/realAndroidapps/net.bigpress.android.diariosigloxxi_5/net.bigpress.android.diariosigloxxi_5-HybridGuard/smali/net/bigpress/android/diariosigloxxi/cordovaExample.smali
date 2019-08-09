.class public Lnet/bigpress/android/diariosigloxxi/cordovaExample;
.super Lorg/apache/cordova/DroidGap;
.source "cordovaExample.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/apache/cordova/DroidGap;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 12
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 15
    const-string v0, "loadInWebView"

    const/4 v1, 0x1

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setBooleanProperty(Ljava/lang/String;Z)V

    .line 16
    const-string v0, "http://www.diariosigloxxi.com/mobile/"

    invoke-super {p0, v0}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    .line 17
    return-void
.end method
