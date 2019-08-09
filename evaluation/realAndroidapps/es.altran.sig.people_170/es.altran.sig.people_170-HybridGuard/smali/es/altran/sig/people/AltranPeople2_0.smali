.class public Les/altran/sig/people/AltranPeople2_0;
.super Lorg/apache/cordova/DroidGap;
.source "AltranPeople2_0.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/apache/cordova/DroidGap;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    const/4 v0, 0x0

    .line 31
    .local v0, "hasSplash":Z
    const/16 v1, 0x1388

    .line 33
    .local v1, "splashScreenDuration":I
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 35
    if-eqz v0, :cond_0

    .line 36
    invoke-static {}, Lorg/apache/cordova/Config;->getStartUrl()Ljava/lang/String;

    move-result-object v2

    invoke-super {p0, v2, v1}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;I)V

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lorg/apache/cordova/Config;->getStartUrl()Ljava/lang/String;

    move-result-object v2

    invoke-super {p0, v2}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
