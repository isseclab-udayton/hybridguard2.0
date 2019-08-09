.class public Lde/appplant/cordova/plugin/localnotification/ClickActivity;
.super Lde/appplant/cordova/plugin/notification/ClickActivity;
.source "ClickActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/ClickActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 1
    .param p1, "builder"    # Lde/appplant/cordova/plugin/notification/Builder;

    .prologue
    .line 63
    .line 64
    const-class v0, Lde/appplant/cordova/plugin/notification/TriggerReceiver;

    invoke-virtual {p1, v0}, Lde/appplant/cordova/plugin/notification/Builder;->setTriggerReceiver(Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Builder;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 63
    return-object v0
.end method

.method public onClick(Lde/appplant/cordova/plugin/notification/Notification;)V
    .locals 2
    .param p1, "notification"    # Lde/appplant/cordova/plugin/notification/Notification;

    .prologue
    .line 44
    const-string v1, "click"

    invoke-static {v1, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 46
    invoke-virtual {p1}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v1

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Options;->isOngoing()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 47
    invoke-virtual {p1}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "clear"

    .line 49
    .local v0, "event":Ljava/lang/String;
    :goto_0
    invoke-static {v0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 52
    .end local v0    # "event":Ljava/lang/String;
    :cond_0
    invoke-super {p0, p1}, Lde/appplant/cordova/plugin/notification/ClickActivity;->onClick(Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 53
    return-void

    .line 47
    :cond_1
    const-string v0, "cancel"

    goto :goto_0
.end method
