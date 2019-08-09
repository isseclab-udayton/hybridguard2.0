.class public Lorg/apache/cordova/splashscreen/SplashScreen;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SplashScreen.java"


# static fields
.field private static final DEFAULT_SPLASHSCREEN_DURATION:I = 0xbb8

.field private static final HAS_BUILT_IN_SPLASH_SCREEN:Z

.field private static final LOG_TAG:Ljava/lang/String; = "SplashScreen"

.field private static firstShow:Z

.field private static lastHideAfterDelay:Z

.field private static spinnerDialog:Landroid/app/ProgressDialog;

.field private static splashDialog:Landroid/app/Dialog;


# instance fields
.field private orientation:I

.field private splashImageView:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 53
    const-string v2, "5.1.1"

    const-string v3, "\\."

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    move v0, v1

    :cond_0
    sput-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    .line 57
    sput-boolean v1, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$002(Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/Dialog;

    .prologue
    .line 49
    sput-object p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/cordova/splashscreen/SplashScreen;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getFadeDuration()I

    move-result v0

    return v0
.end method

.method static synthetic access$1000()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$1002(Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/ProgressDialog;

    .prologue
    .line 49
    sput-object p0, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$202(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;
    .param p1, "x1"    # Landroid/widget/ImageView;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V

    return-void
.end method

.method static synthetic access$400(Lorg/apache/cordova/splashscreen/SplashScreen;)Lorg/apache/cordova/CordovaPreferences;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    return-object v0
.end method

.method static synthetic access$500(Lorg/apache/cordova/splashscreen/SplashScreen;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->isMaintainAspectRatio()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lorg/apache/cordova/splashscreen/SplashScreen;)Lorg/apache/cordova/CordovaPreferences;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    return-object v0
.end method

.method static synthetic access$700(Lorg/apache/cordova/splashscreen/SplashScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStart()V

    return-void
.end method

.method static synthetic access$800()Z
    .locals 1

    .prologue
    .line 49
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->lastHideAfterDelay:Z

    return v0
.end method

.method static synthetic access$900(Lorg/apache/cordova/splashscreen/SplashScreen;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/splashscreen/SplashScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen(Z)V

    return-void
.end method

.method private getFadeDuration()I
    .locals 4

    .prologue
    .line 119
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "FadeSplashScreen"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "FadeSplashScreenDuration"

    const/16 v3, 0xbb8

    .line 120
    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 122
    .local v0, "fadeSplashScreenDuration":I
    :goto_0
    const/16 v1, 0x1e

    if-ge v0, v1, :cond_0

    .line 125
    mul-int/lit16 v0, v0, 0x3e8

    .line 128
    :cond_0
    return v0

    .line 120
    .end local v0    # "fadeSplashScreenDuration":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getView()Landroid/view/View;
    .locals 4

    .prologue
    .line 73
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getView"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    :goto_0
    return-object v1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    check-cast v1, Landroid/view/View;

    goto :goto_0
.end method

.method private isMaintainAspectRatio()Z
    .locals 3

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "SplashMaintainAspectRatio"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private removeSplashScreen(Z)V
    .locals 2
    .param p1, "forceHideImmediately"    # Z

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$3;

    invoke-direct {v1, p0, p1}, Lorg/apache/cordova/splashscreen/SplashScreen$3;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 251
    return-void
.end method

.method private showSplashScreen(Z)V
    .locals 8
    .param p1, "hideAfterDelay"    # Z

    .prologue
    const/4 v7, 0x0

    .line 258
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "SplashScreenDelay"

    const/16 v6, 0xbb8

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v3

    .line 259
    .local v3, "splashscreenTime":I
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "SplashDrawableId"

    invoke-virtual {v4, v5, v7}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 261
    .local v0, "drawableId":I
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getFadeDuration()I

    move-result v2

    .line 262
    .local v2, "fadeSplashScreenDuration":I
    sub-int v4, v3, v2

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 264
    .local v1, "effectiveSplashDuration":I
    sput-boolean p1, Lorg/apache/cordova/splashscreen/SplashScreen;->lastHideAfterDelay:Z

    .line 267
    sget-object v4, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    if-eqz v4, :cond_1

    sget-object v4, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 270
    :cond_1
    if-eqz v0, :cond_0

    if-gtz v3, :cond_2

    if-nez p1, :cond_0

    .line 274
    :cond_2
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    new-instance v5, Lorg/apache/cordova/splashscreen/SplashScreen$4;

    invoke-direct {v5, p0, v0, p1, v1}, Lorg/apache/cordova/splashscreen/SplashScreen$4;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;IZI)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private spinnerStart()V
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$5;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$5;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 366
    return-void
.end method

.method private spinnerStop()V
    .locals 2

    .prologue
    .line 369
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$6;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$6;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 377
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 153
    const-string v0, "hide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$1;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 169
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 170
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 159
    :cond_0
    const-string v0, "show"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$2;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$2;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 166
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 196
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iget v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    if-eq v1, v2, :cond_0

    .line 197
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iput v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    .line 200
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    .line 201
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "SplashDrawableId"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 202
    .local v0, "drawableId":I
    if-eqz v0, :cond_0

    .line 203
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 207
    .end local v0    # "drawableId":I
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 142
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_0

    .line 149
    :goto_0
    return-void

    .line 146
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen(Z)V

    goto :goto_0
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 175
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_1

    .line 191
    :cond_0
    :goto_0
    return-object v3

    .line 178
    :cond_1
    const-string v0, "splashscreen"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 179
    const-string v0, "hide"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 180
    invoke-direct {p0, v2}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen(Z)V

    goto :goto_0

    .line 182
    :cond_2
    invoke-direct {p0, v2}, Lorg/apache/cordova/splashscreen/SplashScreen;->showSplashScreen(Z)V

    goto :goto_0

    .line 184
    :cond_3
    const-string v0, "spinner"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 185
    const-string v0, "stop"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 188
    :cond_4
    const-string v0, "onReceivedError"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 133
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_0

    .line 138
    :goto_0
    return-void

    .line 137
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen(Z)V

    goto :goto_0
.end method

.method protected pluginInitialize()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 81
    sget-boolean v3, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v3, :cond_1

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getView()Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 86
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "SplashDrawableId"

    invoke-virtual {v3, v4, v6}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v1

    .line 87
    .local v1, "drawableId":I
    if-nez v1, :cond_3

    .line 88
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "SplashScreen"

    const-string v5, "screen"

    invoke-virtual {v3, v4, v5}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "splashResource":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 90
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "drawable"

    iget-object v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 91
    if-nez v1, :cond_2

    .line 92
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "drawable"

    iget-object v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 94
    :cond_2
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "SplashDrawableId"

    invoke-virtual {v3, v4, v1}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;I)V

    .line 99
    .end local v2    # "splashResource":Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    iput v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    .line 101
    sget-boolean v3, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    if-eqz v3, :cond_4

    .line 102
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "AutoHideSplashScreen"

    invoke-virtual {v3, v4, v7}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 103
    .local v0, "autoHide":Z
    invoke-direct {p0, v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->showSplashScreen(Z)V

    .line 106
    .end local v0    # "autoHide":Z
    :cond_4
    iget-object v3, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "SplashShowOnlyFirstTime"

    invoke-virtual {v3, v4, v7}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    sput-boolean v6, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    goto/16 :goto_0
.end method
