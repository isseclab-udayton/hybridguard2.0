.class Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;
.super Landroid/webkit/WebViewClient;
.source "InAppBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$4;


# direct methods
.method constructor <init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$4;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$4;

    .line 373
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 376
    iget-object v0, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$4;

    invoke-static {v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->access$0(Lorg/apache/cordova/inappbrowser/InAppBrowser$4;)Lorg/apache/cordova/inappbrowser/InAppBrowser;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 377
    iget-object v0, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$4$1;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$4;

    invoke-static {v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser$4;->access$0(Lorg/apache/cordova/inappbrowser/InAppBrowser$4;)Lorg/apache/cordova/inappbrowser/InAppBrowser;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$2(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/inappbrowser/InAppBrowserDialog;->dismiss()V

    .line 379
    :cond_0
    return-void
.end method
