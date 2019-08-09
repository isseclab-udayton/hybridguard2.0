.class public Lde/appplant/cordova/plugin/localnotification/ClearReceiver;
.super Lde/appplant/cordova/plugin/notification/ClearReceiver;
.source "ClearReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/ClearReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onClear(Lde/appplant/cordova/plugin/notification/Notification;)V
    .locals 1
    .param p1, "notification"    # Lde/appplant/cordova/plugin/notification/Notification;

    .prologue
    .line 44
    invoke-super {p0, p1}, Lde/appplant/cordova/plugin/notification/ClearReceiver;->onClear(Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 45
    const-string v0, "clear"

    invoke-static {v0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 46
    return-void
.end method
