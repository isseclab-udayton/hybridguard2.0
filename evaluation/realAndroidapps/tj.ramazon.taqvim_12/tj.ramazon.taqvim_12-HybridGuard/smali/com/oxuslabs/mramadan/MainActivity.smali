.class public Lcom/oxuslabs/mramadan/MainActivity;
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
    iget-object v0, p0, Lcom/oxuslabs/mramadan/MainActivity;->launchUrl:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/oxuslabs/mramadan/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 19
    return-void
.end method
