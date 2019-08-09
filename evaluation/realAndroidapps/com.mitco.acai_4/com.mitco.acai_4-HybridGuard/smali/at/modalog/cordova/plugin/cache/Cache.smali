.class public Lat/modalog/cordova/plugin/cache/Cache;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Cache.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Cache"


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 45
    return-void
.end method

.method static synthetic access$0(Lat/modalog/cordova/plugin/cache/Cache;)Lorg/apache/cordova/CallbackContext;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lat/modalog/cordova/plugin/cache/Cache;->callbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 53
    const-string v1, "clear"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    const-string v1, "Cache"

    const-string v2, "Cordova Android Cache.clear() called."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iput-object p3, p0, Lat/modalog/cordova/plugin/cache/Cache;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 58
    move-object v0, p0

    .line 59
    .local v0, "self":Lat/modalog/cordova/plugin/cache/Cache;
    iget-object v1, p0, Lat/modalog/cordova/plugin/cache/Cache;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lat/modalog/cordova/plugin/cache/Cache$1;

    invoke-direct {v2, p0, v0}, Lat/modalog/cordova/plugin/cache/Cache$1;-><init>(Lat/modalog/cordova/plugin/cache/Cache;Lat/modalog/cordova/plugin/cache/Cache;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 84
    const/4 v1, 0x1

    .line 86
    .end local v0    # "self":Lat/modalog/cordova/plugin/cache/Cache;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
