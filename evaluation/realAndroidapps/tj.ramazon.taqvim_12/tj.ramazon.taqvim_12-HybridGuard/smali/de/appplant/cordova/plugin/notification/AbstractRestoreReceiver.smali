.class public abstract Lde/appplant/cordova/plugin/notification/AbstractRestoreReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AbstractRestoreReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 52
    invoke-static {p1}, Lde/appplant/cordova/plugin/notification/Manager;->getInstance(Landroid/content/Context;)Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v3

    .line 55
    .local v3, "notificationMgr":Lde/appplant/cordova/plugin/notification/Manager;
    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Manager;->getOptions()Ljava/util/List;

    move-result-object v4

    .line 57
    .local v4, "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 65
    return-void

    .line 57
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 58
    .local v1, "data":Lorg/json/JSONObject;
    new-instance v0, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v0, p1, v1}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 61
    .local v0, "builder":Lde/appplant/cordova/plugin/notification/Builder;
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/AbstractRestoreReceiver;->buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v2

    .line 63
    .local v2, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {p0, v2}, Lde/appplant/cordova/plugin/notification/AbstractRestoreReceiver;->onRestore(Lde/appplant/cordova/plugin/notification/Notification;)V

    goto :goto_0
.end method

.method public abstract onRestore(Lde/appplant/cordova/plugin/notification/Notification;)V
.end method
