.class public final Lcom/google/zxing/client/android/HelpActivity;
.super Landroid/app/Activity;
.source "HelpActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/HelpActivity$HelpClient;
    }
.end annotation


# static fields
.field private static final BASE_URL:Ljava/lang/String; = "file:///android_asset/html/"

.field private static final BUGGY_MODEL_SUBSTRINGS:[Ljava/lang/String;

.field private static final BUGGY_URI:Landroid/net/Uri;

.field public static final DEFAULT_PAGE:Ljava/lang/String; = "index.html"

.field public static final REQUESTED_PAGE_KEY:Ljava/lang/String; = "requested_page_key"

.field private static final TAG:Ljava/lang/String;

.field private static final WEBVIEW_STATE_PRESENT:Ljava/lang/String; = "webview_state_present"

.field public static final WHATS_NEW_PAGE:Ljava/lang/String; = "whatsnew.html"

.field private static initialized:Z


# instance fields
.field private backButton:Landroid/widget/Button;

.field private final backListener:Landroid/view/View$OnClickListener;

.field private final doneListener:Landroid/view/View$OnClickListener;

.field private final groupsListener:Landroid/content/DialogInterface$OnClickListener;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 40
    const-class v0, Lcom/google/zxing/client/android/HelpActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/HelpActivity;->TAG:Ljava/lang/String;

    .line 43
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    .line 44
    const-string v1, "Desire"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    .line 45
    const-string v2, "Pulse"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 46
    const-string v2, "Geeksphone"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 47
    const-string v2, "supersonic"

    aput-object v2, v0, v1

    .line 43
    sput-object v0, Lcom/google/zxing/client/android/HelpActivity;->BUGGY_MODEL_SUBSTRINGS:[Ljava/lang/String;

    .line 50
    const-string v0, "http://code.google.com/p/zxing/wiki/FrequentlyAskedQuestions"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 49
    sput-object v0, Lcom/google/zxing/client/android/HelpActivity;->BUGGY_URI:Landroid/net/Uri;

    .line 61
    sput-boolean v3, Lcom/google/zxing/client/android/HelpActivity;->initialized:Z

    .line 38
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 65
    new-instance v0, Lcom/google/zxing/client/android/HelpActivity$1;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/HelpActivity$1;-><init>(Lcom/google/zxing/client/android/HelpActivity;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->backListener:Landroid/view/View$OnClickListener;

    .line 71
    new-instance v0, Lcom/google/zxing/client/android/HelpActivity$2;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/HelpActivity$2;-><init>(Lcom/google/zxing/client/android/HelpActivity;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->doneListener:Landroid/view/View$OnClickListener;

    .line 78
    new-instance v0, Lcom/google/zxing/client/android/HelpActivity$3;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/HelpActivity$3;-><init>(Lcom/google/zxing/client/android/HelpActivity;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->groupsListener:Landroid/content/DialogInterface$OnClickListener;

    .line 38
    return-void
.end method

.method static synthetic access$0(Lcom/google/zxing/client/android/HelpActivity;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$1()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/google/zxing/client/android/HelpActivity;->BUGGY_URI:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$2(Lcom/google/zxing/client/android/HelpActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->backButton:Landroid/widget/Button;

    return-object v0
.end method

.method private checkBuggyDevice()V
    .locals 7

    .prologue
    .line 123
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 124
    .local v2, "model":Ljava/lang/String;
    sget-object v3, Lcom/google/zxing/client/android/HelpActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Build model is "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    if-eqz v2, :cond_0

    .line 126
    sget-object v4, Lcom/google/zxing/client/android/HelpActivity;->BUGGY_MODEL_SUBSTRINGS:[Ljava/lang/String;

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v5, :cond_1

    .line 137
    :cond_0
    :goto_1
    return-void

    .line 126
    :cond_1
    aget-object v0, v4, v3

    .line 127
    .local v0, "buggyModelSubstring":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 128
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 129
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    sget v3, Lcom/google/zxing/client/android/R$string;->msg_buggy:I

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 130
    sget v3, Lcom/google/zxing/client/android/R$string;->button_ok:I

    iget-object v4, p0, Lcom/google/zxing/client/android/HelpActivity;->groupsListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 131
    sget v3, Lcom/google/zxing/client/android/R$string;->button_cancel:I

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 132
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 126
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 88
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 89
    sget v3, Lcom/google/zxing/client/android/R$layout;->help:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/HelpActivity;->setContentView(I)V

    .line 91
    sget v3, Lcom/google/zxing/client/android/R$id;->help_contents:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/HelpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    .line 92
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    new-instance v4, Lcom/google/zxing/client/android/HelpActivity$HelpClient;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/google/zxing/client/android/HelpActivity$HelpClient;-><init>(Lcom/google/zxing/client/android/HelpActivity;Lcom/google/zxing/client/android/HelpActivity$HelpClient;)V

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 97
    invoke-virtual {p0}, Lcom/google/zxing/client/android/HelpActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 98
    .local v1, "intent":Landroid/content/Intent;
    if-eqz p1, :cond_1

    const-string v3, "webview_state_present"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 99
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v3, p1}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 111
    :goto_0
    sget v3, Lcom/google/zxing/client/android/R$id;->back_button:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/HelpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->backButton:Landroid/widget/Button;

    .line 112
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->backButton:Landroid/widget/Button;

    iget-object v4, p0, Lcom/google/zxing/client/android/HelpActivity;->backListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    sget v3, Lcom/google/zxing/client/android/R$id;->done_button:I

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/HelpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 114
    .local v0, "doneButton":Landroid/view/View;
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->doneListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    sget-boolean v3, Lcom/google/zxing/client/android/HelpActivity;->initialized:Z

    if-nez v3, :cond_0

    .line 117
    const/4 v3, 0x1

    sput-boolean v3, Lcom/google/zxing/client/android/HelpActivity;->initialized:Z

    .line 118
    invoke-direct {p0}, Lcom/google/zxing/client/android/HelpActivity;->checkBuggyDevice()V

    .line 120
    :cond_0
    return-void

    .line 100
    .end local v0    # "doneButton":Landroid/view/View;
    :cond_1
    if-eqz v1, :cond_3

    .line 101
    const-string v3, "requested_page_key"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "page":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 103
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "file:///android_asset/html/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 105
    :cond_2
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    const-string v4, "file:///android_asset/html/index.html"

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 108
    .end local v2    # "page":Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    const-string v4, "file:///android_asset/html/index.html"

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 150
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 153
    const/4 v0, 0x1

    .line 156
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 141
    iget-object v1, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "url":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 143
    iget-object v1, p0, Lcom/google/zxing/client/android/HelpActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, p1}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    .line 144
    const-string v1, "webview_state_present"

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 146
    :cond_0
    return-void
.end method
