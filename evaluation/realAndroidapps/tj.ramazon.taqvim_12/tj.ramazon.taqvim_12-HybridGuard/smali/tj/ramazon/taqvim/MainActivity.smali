.class public Ltj/ramazon/taqvim/MainActivity;
.super Lorg/apache/cordova/CordovaActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 13
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->init()V

    .line 16
    iget-object v0, p0, Ltj/ramazon/taqvim/MainActivity;->launchUrl:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ltj/ramazon/taqvim/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 19
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    return-void
.end method
