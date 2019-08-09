.class public Lorg/apache/cordova/plugin/ActivityIndicator;
.super Lorg/apache/cordova/CordovaPlugin;
.source "ActivityIndicator.java"


# instance fields
.field private activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 11
    iput-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

    .line 12
    iput-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->text:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$002(Lorg/apache/cordova/plugin/ActivityIndicator;Lorg/apache/cordova/plugin/AndroidProgressHUD;)Lorg/apache/cordova/plugin/AndroidProgressHUD;
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/plugin/ActivityIndicator;
    .param p1, "x1"    # Lorg/apache/cordova/plugin/AndroidProgressHUD;

    .prologue
    .line 9
    iput-object p1, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

    return-object p1
.end method

.method static synthetic access$100(Lorg/apache/cordova/plugin/ActivityIndicator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/plugin/ActivityIndicator;

    .prologue
    .line 9
    iget-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->text:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 4
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 16
    const-string v3, "show"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 17
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/plugin/ActivityIndicator;->show(Ljava/lang/String;)V

    .line 19
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 27
    .end local v0    # "text":Ljava/lang/String;
    :goto_0
    return v1

    .line 21
    :cond_0
    const-string v3, "hide"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 22
    invoke-virtual {p0}, Lorg/apache/cordova/plugin/ActivityIndicator;->hide()V

    .line 23
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    :cond_1
    move v1, v2

    .line 27
    goto :goto_0
.end method

.method public hide()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

    invoke-virtual {v0}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->dismiss()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->activityIndicator:Lorg/apache/cordova/plugin/AndroidProgressHUD;

    .line 52
    :cond_0
    return-void
.end method

.method public show(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->text:Ljava/lang/String;

    .line 37
    iget-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/plugin/ActivityIndicator$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/plugin/ActivityIndicator$1;-><init>(Lorg/apache/cordova/plugin/ActivityIndicator;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 42
    return-void
.end method
