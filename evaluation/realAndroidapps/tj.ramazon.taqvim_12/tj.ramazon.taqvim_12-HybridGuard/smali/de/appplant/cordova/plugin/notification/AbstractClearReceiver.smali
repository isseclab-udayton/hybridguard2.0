.class public abstract Lde/appplant/cordova/plugin/notification/AbstractClearReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AbstractClearReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onClear(Lde/appplant/cordova/plugin/notification/Notification;)V
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 50
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 54
    .local v0, "bundle":Landroid/os/Bundle;
    :try_start_0
    const-string v5, "NOTIFICATION_OPTIONS"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "data":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .local v4, "options":Lorg/json/JSONObject;
    new-instance v5, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v5, p1, v4}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v3

    .line 64
    .local v3, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {p0, v3}, Lde/appplant/cordova/plugin/notification/AbstractClearReceiver;->onClear(Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 65
    .end local v1    # "data":Ljava/lang/String;
    .end local v3    # "notification":Lde/appplant/cordova/plugin/notification/Notification;
    .end local v4    # "options":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v2

    .line 57
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
