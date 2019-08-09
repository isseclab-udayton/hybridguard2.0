.class public Lit/shinteck/Bardahl/MainActivity;
.super Lorg/apache/cordova/DroidGap;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
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

    .line 14
    const-string v0, "loadUrlTimeoutValue"

    const v1, 0xea60

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setIntegerProperty(Ljava/lang/String;I)V

    .line 15
    const-string v0, "splashscreen"

    const v1, 0x7f020002

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setIntegerProperty(Ljava/lang/String;I)V

    .line 20
    const-string v0, "keepRunning"

    const/4 v1, 0x1

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->setBooleanProperty(Ljava/lang/String;Z)V

    .line 25
    const-string v0, "file:///android_asset/www/index.html"

    const/16 v1, 0x3a98

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;I)V

    .line 26
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    return-void
.end method
