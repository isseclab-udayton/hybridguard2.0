.class public Lorg/apache/cordova/IceCreamCordovaWebViewClient;
.super Lorg/apache/cordova/CordovaWebViewClient;
.source "IceCreamCordovaWebViewClient.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 0
    .param p1, "cordova"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lorg/apache/cordova/CordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .param p1, "cordova"    # Lorg/apache/cordova/api/CordovaInterface;
    .param p2, "view"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/CordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 42
    return-void
.end method

.method private generateWebResourceResponse(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 55
    const-string v4, "file:///android_asset/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 56
    iget-object v4, p0, Lorg/apache/cordova/IceCreamCordovaWebViewClient;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {p1, v4}, Lorg/apache/cordova/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "mimetype":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/IceCreamCordovaWebViewClient;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {p1, v4}, Lorg/apache/cordova/FileHelper;->getInputStreamFromUriString(Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)Ljava/io/InputStream;

    move-result-object v3

    .line 60
    .local v3, "stream":Ljava/io/InputStream;
    new-instance v2, Landroid/webkit/WebResourceResponse;

    const-string v4, "UTF-8"

    invoke-direct {v2, v1, v4, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v1    # "mimetype":Ljava/lang/String;
    .end local v3    # "stream":Ljava/io/InputStream;
    :goto_0
    return-object v2

    .line 62
    .restart local v1    # "mimetype":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "generateWebResourceResponse"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "mimetype":Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static needsIceCreamSpaceInAssetUrlFix(Ljava/lang/String;)Z
    .locals 2
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 70
    const-string v1, "%20"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    :goto_0
    return v0

    .line 74
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 77
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 74
    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaWebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    .line 48
    .local v0, "ret":Landroid/webkit/WebResourceResponse;
    if-nez v0, :cond_1

    const-string v1, "?"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "#"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Lorg/apache/cordova/IceCreamCordovaWebViewClient;->needsIceCreamSpaceInAssetUrlFix(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 49
    :cond_0
    invoke-direct {p0, p2}, Lorg/apache/cordova/IceCreamCordovaWebViewClient;->generateWebResourceResponse(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    .line 51
    :cond_1
    return-object v0
.end method
