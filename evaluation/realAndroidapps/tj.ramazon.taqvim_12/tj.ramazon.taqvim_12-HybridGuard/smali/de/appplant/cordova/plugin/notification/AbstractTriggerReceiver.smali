.class public abstract Lde/appplant/cordova/plugin/notification/AbstractTriggerReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AbstractTriggerReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private isFirstAlarmInFuture(Lde/appplant/cordova/plugin/notification/Options;)Ljava/lang/Boolean;
    .locals 11
    .param p1, "options"    # Lde/appplant/cordova/plugin/notification/Options;

    .prologue
    const/16 v10, 0xc

    const/16 v9, 0xb

    const/4 v8, 0x0

    .line 104
    new-instance v7, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v7, p1}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Lde/appplant/cordova/plugin/notification/Options;)V

    invoke-virtual {v7}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v5

    .line 106
    .local v5, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v7

    if-nez v7, :cond_0

    .line 107
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 119
    :goto_0
    return-object v7

    .line 109
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    .line 110
    .local v6, "now":Ljava/util/Calendar;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 112
    .local v0, "alarm":Ljava/util/Calendar;
    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v7

    invoke-virtual {v7}, Lde/appplant/cordova/plugin/notification/Options;->getTriggerDate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 114
    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 115
    .local v1, "alarmHour":I
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 116
    .local v2, "alarmMin":I
    invoke-virtual {v6, v9}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 117
    .local v3, "currentHour":I
    invoke-virtual {v6, v10}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 119
    .local v4, "currentMin":I
    if-eq v3, v1, :cond_1

    if-eq v4, v2, :cond_1

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_0

    :cond_1
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_0
.end method


# virtual methods
.method public abstract buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 52
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 56
    .local v1, "bundle":Landroid/os/Bundle;
    :try_start_0
    const-string v8, "NOTIFICATION_OPTIONS"

    invoke-virtual {v1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "data":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 59
    .local v3, "dict":Lorg/json/JSONObject;
    new-instance v8, Lde/appplant/cordova/plugin/notification/Options;

    invoke-direct {v8, p1}, Lde/appplant/cordova/plugin/notification/Options;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v3}, Lde/appplant/cordova/plugin/notification/Options;->parse(Lorg/json/JSONObject;)Lde/appplant/cordova/plugin/notification/Options;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 65
    .local v6, "options":Lde/appplant/cordova/plugin/notification/Options;
    if-nez v6, :cond_1

    .line 76
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "dict":Lorg/json/JSONObject;
    .end local v6    # "options":Lde/appplant/cordova/plugin/notification/Options;
    :cond_0
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v4

    .line 61
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 68
    .end local v4    # "e":Lorg/json/JSONException;
    .restart local v2    # "data":Ljava/lang/String;
    .restart local v3    # "dict":Lorg/json/JSONObject;
    .restart local v6    # "options":Lde/appplant/cordova/plugin/notification/Options;
    :cond_1
    invoke-direct {p0, v6}, Lde/appplant/cordova/plugin/notification/AbstractTriggerReceiver;->isFirstAlarmInFuture(Lde/appplant/cordova/plugin/notification/Options;)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_0

    .line 71
    new-instance v0, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v0, v6}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Lde/appplant/cordova/plugin/notification/Options;)V

    .line 72
    .local v0, "builder":Lde/appplant/cordova/plugin/notification/Builder;
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/AbstractTriggerReceiver;->buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v5

    .line 73
    .local v5, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Notification;->isUpdate()Z

    move-result v7

    .line 75
    .local v7, "updated":Z
    invoke-virtual {p0, v5, v7}, Lde/appplant/cordova/plugin/notification/AbstractTriggerReceiver;->onTrigger(Lde/appplant/cordova/plugin/notification/Notification;Z)V

    goto :goto_0
.end method

.method public abstract onTrigger(Lde/appplant/cordova/plugin/notification/Notification;Z)V
.end method
