.class public Lorg/apache/cordova/splashscreen/SplashScreen;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SplashScreen.java"


# static fields
.field private static final HAS_BUILT_IN_SPLASH_SCREEN:Z

.field private static final LOG_TAG:Ljava/lang/String; = "SplashScreen"

.field private static firstShow:Z

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

    .line 46
    const-string v2, "4.1.1"

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

    .line 49
    sput-boolean v1, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/splashscreen/SplashScreen;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 307
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$10()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$2(Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 47
    sput-object p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$3(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)V
    .locals 0

    .prologue
    .line 54
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    return-void
.end method

.method static synthetic access$4(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5(Lorg/apache/cordova/splashscreen/SplashScreen;)Lorg/apache/cordova/CordovaPreferences;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    return-object v0
.end method

.method static synthetic access$6(Lorg/apache/cordova/splashscreen/SplashScreen;)Z
    .locals 1

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->isMaintainAspectRatio()Z

    move-result v0

    return v0
.end method

.method static synthetic access$7(Lorg/apache/cordova/splashscreen/SplashScreen;)V
    .locals 0

    .prologue
    .line 196
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen()V

    return-void
.end method

.method static synthetic access$8(Lorg/apache/cordova/splashscreen/SplashScreen;)V
    .locals 0

    .prologue
    .line 321
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V

    return-void
.end method

.method static synthetic access$9(Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 48
    sput-object p0, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method private getView()Landroid/view/View;
    .locals 4

    .prologue
    .line 64
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

    .line 66
    :goto_0
    return-object v1

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    check-cast v1, Landroid/view/View;

    goto :goto_0
.end method

.method private isMaintainAspectRatio()Z
    .locals 3

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "SplashMaintainAspectRatio"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private loadSpinner()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 281
    const/4 v1, 0x0

    .line 282
    .local v1, "loading":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaWebView;->canGoBack()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 283
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "LoadingDialog"

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 288
    :goto_0
    if-eqz v1, :cond_1

    .line 289
    const-string v3, ""

    .line 290
    .local v3, "title":Ljava/lang/String;
    const-string v2, "Loading Application..."

    .line 292
    .local v2, "message":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 293
    const/16 v4, 0x2c

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 294
    .local v0, "comma":I
    if-lez v0, :cond_3

    .line 295
    const/4 v4, 0x0

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 296
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 303
    .end local v0    # "comma":I
    :cond_0
    :goto_1
    invoke-direct {p0, v3, v2}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    .end local v2    # "message":Ljava/lang/String;
    .end local v3    # "title":Ljava/lang/String;
    :cond_1
    return-void

    .line 286
    :cond_2
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v5, "LoadingPageDialog"

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 299
    .restart local v0    # "comma":I
    .restart local v2    # "message":Ljava/lang/String;
    .restart local v3    # "title":Ljava/lang/String;
    :cond_3
    const-string v3, ""

    .line 300
    move-object v2, v1

    goto :goto_1
.end method

.method private removeSplashScreen()V
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$4;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$4;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 206
    return-void
.end method

.method private showSplashScreen(Z)V
    .locals 5
    .param p1, "hideAfterDelay"    # Z

    .prologue
    .line 213
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashScreenDelay"

    const/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v1

    .line 214
    .local v1, "splashscreenTime":I
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 217
    .local v0, "drawableId":I
    sget-object v2, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    if-eqz v2, :cond_1

    sget-object v2, Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    if-eqz v0, :cond_0

    if-gtz v1, :cond_2

    if-nez p1, :cond_0

    .line 224
    :cond_2
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/splashscreen/SplashScreen$5;

    invoke-direct {v3, p0, v0, p1, v1}, Lorg/apache/cordova/splashscreen/SplashScreen$5;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;IZI)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private spinnerStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 308
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$6;

    invoke-direct {v1, p0, p1, p2}, Lorg/apache/cordova/splashscreen/SplashScreen$6;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 319
    return-void
.end method

.method private spinnerStop()V
    .locals 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/splashscreen/SplashScreen$7;

    invoke-direct {v1, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$7;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 330
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

    .line 129
    const-string v4, "hide"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 130
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/splashscreen/SplashScreen$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$1;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 155
    :cond_0
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    move v2, v3

    .line 156
    :cond_1
    return v2

    .line 135
    :cond_2
    const-string v4, "show"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 136
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/splashscreen/SplashScreen$2;

    invoke-direct {v4, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$2;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 141
    :cond_3
    const-string v4, "spinnerStart"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 142
    sget-boolean v4, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-nez v4, :cond_0

    .line 143
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "title":Ljava/lang/String;
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v4, Lorg/apache/cordova/splashscreen/SplashScreen$3;

    invoke-direct {v4, p0, v1, v0}, Lorg/apache/cordova/splashscreen/SplashScreen$3;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 183
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iget v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    if-eq v1, v2, :cond_0

    .line 184
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iput v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    .line 187
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "SplashDrawableId"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 189
    .local v0, "drawableId":I
    if-eqz v0, :cond_0

    .line 190
    iget-object v1, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;

    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    .end local v0    # "drawableId":I
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 118
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_0

    .line 125
    :goto_0
    return-void

    .line 122
    :cond_0
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen()V

    goto :goto_0
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 161
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_1

    .line 178
    :cond_0
    :goto_0
    return-object v3

    .line 164
    :cond_1
    const-string v0, "splashscreen"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 165
    const-string v0, "hide"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 166
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen()V

    goto :goto_0

    .line 168
    :cond_2
    invoke-direct {p0, v2}, Lorg/apache/cordova/splashscreen/SplashScreen;->showSplashScreen(Z)V

    goto :goto_0

    .line 170
    :cond_3
    const-string v0, "spinner"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 171
    const-string v0, "stop"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V

    .line 173
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 175
    :cond_4
    const-string v0, "onReceivedError"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 109
    sget-boolean v0, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-eqz v0, :cond_0

    .line 114
    :goto_0
    return-void

    .line 113
    :cond_0
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->removeSplashScreen()V

    goto :goto_0
.end method

.method protected pluginInitialize()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 72
    sget-boolean v2, Lorg/apache/cordova/splashscreen/SplashScreen;->HAS_BUILT_IN_SPLASH_SCREEN:Z

    if-nez v2, :cond_0

    sget-boolean v2, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    if-nez v2, :cond_1

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->getView()Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 77
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    invoke-virtual {v2, v3, v5}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 78
    .local v0, "drawableId":I
    if-nez v0, :cond_3

    .line 79
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashScreen"

    const-string v4, "screen"

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "splashResource":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 81
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

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

    .line 82
    if-nez v0, :cond_2

    .line 83
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 85
    :cond_2
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashDrawableId"

    invoke-virtual {v2, v3, v0}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;I)V

    .line 90
    .end local v1    # "splashResource":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    iput v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->orientation:I

    .line 92
    iget-object v2, p0, Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SplashShowOnlyFirstTime"

    invoke-virtual {v2, v3, v6}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 93
    sput-boolean v5, Lorg/apache/cordova/splashscreen/SplashScreen;->firstShow:Z

    .line 96
    :cond_4
    invoke-direct {p0}, Lorg/apache/cordova/splashscreen/SplashScreen;->loadSpinner()V

    .line 97
    invoke-direct {p0, v6}, Lorg/apache/cordova/splashscreen/SplashScreen;->showSplashScreen(Z)V

    goto/16 :goto_0
.end method
