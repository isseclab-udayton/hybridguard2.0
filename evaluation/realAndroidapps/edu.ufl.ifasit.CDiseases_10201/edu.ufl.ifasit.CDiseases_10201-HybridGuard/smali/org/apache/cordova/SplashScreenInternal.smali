.class public Lorg/apache/cordova/SplashScreenInternal;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SplashScreenInternal.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "SplashScreenInternal"

.field private static firstShow:Z

.field private static spinnerDialog:Landroid/app/ProgressDialog;

.field private static splashDialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/cordova/SplashScreenInternal;->firstShow:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/SplashScreenInternal;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/SplashScreenInternal;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$102(Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/Dialog;

    .prologue
    .line 39
    sput-object p0, Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/cordova/SplashScreenInternal;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/SplashScreenInternal;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->removeSplashScreen()V

    return-void
.end method

.method static synthetic access$300(Lorg/apache/cordova/SplashScreenInternal;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/SplashScreenInternal;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->spinnerStop()V

    return-void
.end method

.method static synthetic access$400()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lorg/apache/cordova/SplashScreenInternal;->spinnerDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$402(Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/ProgressDialog;

    .prologue
    .line 39
    sput-object p0, Lorg/apache/cordova/SplashScreenInternal;->spinnerDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method private loadSpinner()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 207
    const/4 v1, 0x0

    .line 208
    .local v1, "loading":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebView;->canGoBack()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 209
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "LoadingDialog"

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 214
    :goto_0
    if-eqz v1, :cond_1

    .line 215
    const-string v3, ""

    .line 216
    .local v3, "title":Ljava/lang/String;
    const-string v2, "Loading Application..."

    .line 218
    .local v2, "message":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 219
    const/16 v4, 0x2c

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 220
    .local v0, "comma":I
    if-lez v0, :cond_3

    .line 221
    const/4 v4, 0x0

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 222
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 229
    .end local v0    # "comma":I
    :cond_0
    :goto_1
    invoke-direct {p0, v3, v2}, Lorg/apache/cordova/SplashScreenInternal;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    .end local v2    # "message":Ljava/lang/String;
    .end local v3    # "title":Ljava/lang/String;
    :cond_1
    return-void

    .line 212
    :cond_2
    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "LoadingPageDialog"

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 225
    .restart local v0    # "comma":I
    .restart local v2    # "message":Ljava/lang/String;
    .restart local v3    # "title":Ljava/lang/String;
    :cond_3
    const-string v3, ""

    .line 226
    move-object v2, v1

    goto :goto_1
.end method

.method private removeSplashScreen()V
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/SplashScreenInternal$4;

    invoke-direct {v1, p0}, Lorg/apache/cordova/SplashScreenInternal$4;-><init>(Lorg/apache/cordova/SplashScreenInternal;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 140
    return-void
.end method

.method private showSplashScreen(Z)V
    .locals 5
    .param p1, "hideAfterDelay"    # Z

    .prologue
    .line 147
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashScreenDelay"

    const/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v1

    .line 148
    .local v1, "splashscreenTime":I
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 151
    .local v0, "drawableId":I
    sget-object v2, Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;

    if-eqz v2, :cond_1

    sget-object v2, Lorg/apache/cordova/SplashScreenInternal;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 200
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    if-eqz v0, :cond_0

    if-gtz v1, :cond_2

    if-nez p1, :cond_0

    .line 158
    :cond_2
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/SplashScreenInternal$5;

    invoke-direct {v3, p0, v0, p1, v1}, Lorg/apache/cordova/SplashScreenInternal$5;-><init>(Lorg/apache/cordova/SplashScreenInternal;IZI)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private spinnerStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/SplashScreenInternal$6;

    invoke-direct {v1, p0, p1, p2}, Lorg/apache/cordova/SplashScreenInternal$6;-><init>(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 245
    return-void
.end method

.method private spinnerStop()V
    .locals 2

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/SplashScreenInternal$7;

    invoke-direct {v1, p0}, Lorg/apache/cordova/SplashScreenInternal$7;-><init>(Lorg/apache/cordova/SplashScreenInternal;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 256
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 84
    const-string v4, "hide"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 85
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/SplashScreenInternal$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/SplashScreenInternal$1;-><init>(Lorg/apache/cordova/SplashScreenInternal;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 108
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    move v2, v3

    .line 109
    :cond_0
    return v2

    .line 90
    :cond_1
    const-string v4, "show"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 91
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/SplashScreenInternal$2;

    invoke-direct {v4, p0}, Lorg/apache/cordova/SplashScreenInternal$2;-><init>(Lorg/apache/cordova/SplashScreenInternal;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 96
    :cond_2
    const-string v4, "spinnerStart"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 97
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 98
    .local v1, "title":Ljava/lang/String;
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/SplashScreenInternal$3;

    invoke-direct {v4, p0, v1, v0}, Lorg/apache/cordova/SplashScreenInternal$3;-><init>(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->removeSplashScreen()V

    .line 79
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/cordova/SplashScreenInternal;->firstShow:Z

    .line 80
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 114
    const-string v0, "splashscreen"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 115
    const-string v0, "hide"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 116
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->removeSplashScreen()V

    .line 128
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 118
    :cond_1
    invoke-direct {p0, v2}, Lorg/apache/cordova/SplashScreenInternal;->showSplashScreen(Z)V

    goto :goto_0

    .line 120
    :cond_2
    const-string v0, "spinner"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 121
    const-string v0, "stop"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->spinnerStop()V

    .line 123
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    goto :goto_0

    .line 125
    :cond_3
    const-string v0, "onReceivedError"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->spinnerStop()V

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->removeSplashScreen()V

    .line 73
    return-void
.end method

.method protected pluginInitialize()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 47
    sget-boolean v2, Lorg/apache/cordova/SplashScreenInternal;->firstShow:Z

    if-nez v2, :cond_0

    .line 67
    :goto_0
    return-void

    .line 51
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    .line 52
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    invoke-virtual {v2, v3, v5}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 53
    .local v0, "drawableId":I
    if-nez v0, :cond_2

    .line 54
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashScreen"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "splashResource":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 56
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    iget-object v4, p0, Lorg/apache/cordova/SplashScreenInternal;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 60
    :cond_1
    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    invoke-virtual {v2, v3, v0}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;I)V

    .line 64
    .end local v1    # "splashResource":Ljava/lang/String;
    :cond_2
    sput-boolean v5, Lorg/apache/cordova/SplashScreenInternal;->firstShow:Z

    .line 65
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenInternal;->loadSpinner()V

    .line 66
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lorg/apache/cordova/SplashScreenInternal;->showSplashScreen(Z)V

    goto :goto_0
.end method
