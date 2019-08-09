.class public Lcom/phonegap/plugins/childBrowser/ChildBrowser;
.super Lorg/apache/cordova/api/Plugin;
.source "ChildBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;
    }
.end annotation


# static fields
.field private static CLOSE_EVENT:I = 0x0

.field private static LOCATION_CHANGED_EVENT:I = 0x0

.field protected static final LOG_TAG:Ljava/lang/String; = "ChildBrowser"


# instance fields
.field private browserCallbackId:Ljava/lang/String;

.field private dialog:Landroid/app/Dialog;

.field private edittext:Landroid/widget/EditText;

.field private showLocationBar:Z

.field private webview:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->CLOSE_EVENT:I

    .line 50
    const/4 v0, 0x1

    sput v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->LOCATION_CHANGED_EVENT:I

    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->browserCallbackId:Ljava/lang/String;

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showLocationBar:Z

    .line 46
    return-void
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 50
    sget v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->LOCATION_CHANGED_EVENT:I

    return v0
.end method

.method static synthetic access$1(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Lorg/json/JSONObject;Z)V
    .locals 0

    .prologue
    .line 407
    invoke-direct {p0, p1, p2}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->sendUpdate(Lorg/json/JSONObject;Z)V

    return-void
.end method

.method static synthetic access$10(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)V
    .locals 0

    .prologue
    .line 153
    invoke-direct {p0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->closeDialog()V

    return-void
.end method

.method static synthetic access$11(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    return-void
.end method

.method static synthetic access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$13(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z
    .locals 1

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->getShowLocationBar()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 54
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$4()I
    .locals 1

    .prologue
    .line 49
    sget v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->CLOSE_EVENT:I

    return v0
.end method

.method static synthetic access$5(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)V
    .locals 0

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->goBack()V

    return-void
.end method

.method static synthetic access$6(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)V
    .locals 0

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->goForward()V

    return-void
.end method

.method static synthetic access$7(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->edittext:Landroid/widget/EditText;

    return-void
.end method

.method static synthetic access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->edittext:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$9(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->navigate(Ljava/lang/String;)V

    return-void
.end method

.method private closeDialog()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 157
    :cond_0
    return-void
.end method

.method private getShowLocationBar()Z
    .locals 1

    .prologue
    .line 201
    iget-boolean v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showLocationBar:Z

    return v0
.end method

.method private goBack()V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 166
    :cond_0
    return-void
.end method

.method private goForward()V
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    .line 175
    :cond_0
    return-void
.end method

.method private navigate(Ljava/lang/String;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 183
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 184
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->edittext:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 186
    const-string v1, "http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "file:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "http://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 191
    :goto_0
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->requestFocus()Z

    .line 192
    return-void

    .line 189
    :cond_0
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->webview:Landroid/webkit/WebView;

    invoke-virtual {v1, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private sendUpdate(Lorg/json/JSONObject;Z)V
    .locals 2
    .param p1, "obj"    # Lorg/json/JSONObject;
    .param p2, "keepCallback"    # Z

    .prologue
    .line 408
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->browserCallbackId:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 409
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 410
    .local v0, "result":Lorg/apache/cordova/api/PluginResult;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 411
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->browserCallbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 413
    .end local v0    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 68
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 69
    .local v4, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v3, ""

    .line 72
    .local v3, "result":Ljava/lang/String;
    :try_start_0
    const-string v5, "showWebPage"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 73
    iput-object p3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->browserCallbackId:Ljava/lang/String;

    .line 76
    iget-object v5, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->dialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->isShowing()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 77
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v6, "ChildBrowser is already open"

    invoke-direct {v2, v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 112
    :goto_0
    return-object v2

    .line 80
    :cond_0
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showWebPage(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 83
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    .line 84
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v4, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v2, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0

    .line 86
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    :try_start_1
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v4, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 87
    .local v2, "pluginResult":Lorg/apache/cordova/api/PluginResult;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_0

    .line 91
    .end local v2    # "pluginResult":Lorg/apache/cordova/api/PluginResult;
    :cond_2
    const-string v5, "close"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 92
    invoke-direct {p0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->closeDialog()V

    .line 94
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 95
    .local v1, "obj":Lorg/json/JSONObject;
    const-string v5, "type"

    sget v6, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->CLOSE_EVENT:I

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 97
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v4, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 98
    .restart local v2    # "pluginResult":Lorg/apache/cordova/api/PluginResult;
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_0

    .line 101
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v2    # "pluginResult":Lorg/apache/cordova/api/PluginResult;
    :cond_3
    const-string v5, "openExternal"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 102
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->optBoolean(I)Z

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->openExternal(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 103
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_4

    .line 104
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    .line 110
    :cond_4
    :goto_1
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v4, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0

    .line 108
    :cond_5
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public openExternal(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "usePhoneGap"    # Z

    .prologue
    .line 125
    const/4 v1, 0x0

    .line 126
    .local v1, "intent":Landroid/content/Intent;
    if-eqz p2, :cond_0

    .line 127
    :try_start_0
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    iget-object v4, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lorg/apache/cordova/DroidGap;

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    .line 128
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 129
    const-string v3, "url"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    const-string v3, "loadUrlTimeoutValue"

    const v4, 0xea60

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 135
    const-string v3, "loadingDialog"

    const-string v4, "Wait,Loading web page..."

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 136
    const-string v3, "hideLoadingDialogOnPageLoad"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 142
    :goto_0
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    const-string v3, ""

    .line 146
    :goto_1
    return-object v3

    .line 139
    :cond_0
    :try_start_1
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 140
    .end local v1    # "intent":Landroid/content/Intent;
    .local v2, "intent":Landroid/content/Intent;
    :try_start_2
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v1, v2

    .end local v2    # "intent":Landroid/content/Intent;
    .restart local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    :goto_2
    const-string v3, "ChildBrowser"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ChildBrowser: Error loading url "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 144
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "intent":Landroid/content/Intent;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "intent":Landroid/content/Intent;
    .restart local v1    # "intent":Landroid/content/Intent;
    goto :goto_2
.end method

.method public showWebPage(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 212
    if-eqz p2, :cond_0

    .line 213
    const-string v1, "showLocationBar"

    const/4 v2, 0x1

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showLocationBar:Z

    .line 217
    :cond_0
    new-instance v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    invoke-direct {v0, p0, p1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;)V

    .line 398
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 399
    const-string v1, ""

    return-object v1
.end method
