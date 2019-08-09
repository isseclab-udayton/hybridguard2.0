.class public Lde/appplant/cordova/plugin/localnotification/RestoreReceiver;
.super Lde/appplant/cordova/plugin/notification/AbstractRestoreReceiver;
.source "RestoreReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/AbstractRestoreReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 2
    .param p1, "builder"    # Lde/appplant/cordova/plugin/notification/Builder;

    .prologue
    .line 56
    .line 57
    const-class v0, Lde/appplant/cordova/plugin/localnotification/TriggerReceiver;

    invoke-virtual {p1, v0}, Lde/appplant/cordova/plugin/notification/Builder;->setTriggerReceiver(Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Builder;

    move-result-object v0

    .line 58
    const-class v1, Lde/appplant/cordova/plugin/localnotification/ClearReceiver;

    invoke-virtual {v0, v1}, Lde/appplant/cordova/plugin/notification/Builder;->setClearReceiver(Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Builder;

    move-result-object v0

    .line 59
    const-class v1, Lde/appplant/cordova/plugin/localnotification/ClickActivity;

    invoke-virtual {v0, v1}, Lde/appplant/cordova/plugin/notification/Builder;->setClickActivity(Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Builder;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 56
    return-object v0
.end method

.method public onRestore(Lde/appplant/cordova/plugin/notification/Notification;)V
    .locals 0
    .param p1, "notification"    # Lde/appplant/cordova/plugin/notification/Notification;

    .prologue
    .line 45
    invoke-virtual {p1}, Lde/appplant/cordova/plugin/notification/Notification;->schedule()V

    .line 46
    return-void
.end method
