.class public Lcom/audero/free/utility/whereiparkedmycar/WhereIparkedmycar;
.super Lorg/apache/cordova/DroidGap;
.source "WhereIparkedmycar.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/cordova/DroidGap;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    const/4 v0, 0x0

    .line 33
    .local v0, "hasSplash":Z
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    const-string v1, "splashscreen"

    const v2, 0x7f020002

    invoke-super {p0, v1, v2}, Lorg/apache/cordova/DroidGap;->setIntegerProperty(Ljava/lang/String;I)V

    const/4 v0, 0x1

    .line 35
    if-eqz v0, :cond_0

    .line 36
    const-string v1, "file:///android_asset/www/index.html"

    const/16 v2, 0x1388

    invoke-super {p0, v1, v2}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;I)V

    .line 40
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    :goto_0	
	return-void

    .line 38
    :cond_0
    const-string v1, "file:///android_asset/www/index.html"

    invoke-super {p0, v1}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V	
    goto :goto_0
.end method
