.class public Lcom/findmeon/maps/FindmeActivity;
.super Lorg/apache/cordova/DroidGap;
.source "FindmeActivity.java"


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
    .line 10
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 11
    const-string v0, "loadUrlTimeoutValue"

    const v1, 0xea60

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setIntegerProperty(Ljava/lang/String;I)V

    .line 12
    const-string v0, "keepRunning"

    const/4 v1, 0x1

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setBooleanProperty(Ljava/lang/String;Z)V

    .line 13
    const-string v0, "file:///android_asset/www/index.html"

    invoke-super {p0, v0}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V 
    .line 14
    return-void
.end method
