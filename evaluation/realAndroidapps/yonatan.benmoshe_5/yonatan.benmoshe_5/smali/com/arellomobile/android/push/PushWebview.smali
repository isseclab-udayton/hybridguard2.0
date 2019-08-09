.class public Lcom/arellomobile/android/push/PushWebview;
.super Landroid/app/Activity;
.source "PushWebview.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arellomobile/android/push/PushWebview$HelloWebViewClient;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 26
    .local v1, "webView":Landroid/webkit/WebView;
    invoke-virtual {p0}, Lcom/arellomobile/android/push/PushWebview;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "url"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, "url":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 29
    new-instance v2, Lcom/arellomobile/android/push/PushWebview$HelloWebViewClient;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/arellomobile/android/push/PushWebview$HelloWebViewClient;-><init>(Lcom/arellomobile/android/push/PushWebview;Lcom/arellomobile/android/push/PushWebview$HelloWebViewClient;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 31
    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p0, v1}, Lcom/arellomobile/android/push/PushWebview;->setContentView(Landroid/view/View;)V

    .line 34
    return-void
.end method
