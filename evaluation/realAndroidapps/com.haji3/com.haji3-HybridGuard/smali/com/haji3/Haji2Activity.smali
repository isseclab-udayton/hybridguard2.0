.class public Lcom/haji3/Haji2Activity;
.super Lorg/apache/cordova/DroidGap;
.source "Haji2Activity.java"


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
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 11
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 12
    const-string v0, "file:///android_asset/www/index.html"

    invoke-super {p0, v0}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    .line 13
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V 
    return-void
.end method