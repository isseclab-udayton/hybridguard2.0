.class public Lde/appplant/cordova/plugin/notification/ClearReceiver;
.super Lde/appplant/cordova/plugin/notification/AbstractClearReceiver;
.source "ClearReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/AbstractClearReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onClear(Lde/appplant/cordova/plugin/notification/Notification;)V
    .locals 0
    .param p1, "notification"    # Lde/appplant/cordova/plugin/notification/Notification;

    .prologue
    .line 41
    invoke-virtual {p1}, Lde/appplant/cordova/plugin/notification/Notification;->clear()V

    .line 42
    return-void
.end method
