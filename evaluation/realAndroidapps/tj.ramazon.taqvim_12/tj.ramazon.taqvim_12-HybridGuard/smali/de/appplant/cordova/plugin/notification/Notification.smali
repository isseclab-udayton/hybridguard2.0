.class public Lde/appplant/cordova/plugin/notification/Notification;
.super Ljava/lang/Object;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/appplant/cordova/plugin/notification/Notification$Type;
    }
.end annotation


# static fields
.field static final PREF_KEY:Ljava/lang/String; = "LocalNotification"

.field private static defaultReceiver:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private final builder:Landroid/support/v4/app/NotificationCompat$Builder;

.field private final context:Landroid/content/Context;

.field private final options:Lde/appplant/cordova/plugin/notification/Options;

.field private receiver:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-class v0, Lde/appplant/cordova/plugin/notification/TriggerReceiver;

    sput-object v0, Lde/appplant/cordova/plugin/notification/Notification;->defaultReceiver:Ljava/lang/Class;

    .line 56
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lde/appplant/cordova/plugin/notification/Options;Landroid/support/v4/app/NotificationCompat$Builder;Ljava/lang/Class;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Lde/appplant/cordova/plugin/notification/Options;
    .param p3, "builder"    # Landroid/support/v4/app/NotificationCompat$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lde/appplant/cordova/plugin/notification/Options;",
            "Landroid/support/v4/app/NotificationCompat$Builder;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p4, "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lde/appplant/cordova/plugin/notification/Notification;->defaultReceiver:Ljava/lang/Class;

    iput-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->receiver:Ljava/lang/Class;

    .line 83
    iput-object p1, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    .line 84
    iput-object p2, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    .line 85
    iput-object p3, p0, Lde/appplant/cordova/plugin/notification/Notification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    .line 87
    if-eqz p4, :cond_0

    .end local p4    # "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    iput-object p4, p0, Lde/appplant/cordova/plugin/notification/Notification;->receiver:Ljava/lang/Class;

    .line 88
    return-void

    .line 87
    .restart local p4    # "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    sget-object p4, Lde/appplant/cordova/plugin/notification/Notification;->defaultReceiver:Ljava/lang/Class;

    goto :goto_0
.end method

.method private getAlarmMgr()Landroid/app/AlarmManager;
    .locals 2

    .prologue
    .line 355
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    return-object v0
.end method

.method private getNotMgr()Landroid/app/NotificationManager;
    .locals 2

    .prologue
    .line 347
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    .line 348
    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 347
    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method

.method private getPrefs()Landroid/content/SharedPreferences;
    .locals 3

    .prologue
    .line 340
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    const-string v1, "LocalNotification"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private persist()V
    .locals 3

    .prologue
    .line 310
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 312
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Options;->getId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v2}, Lde/appplant/cordova/plugin/notification/Options;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 314
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-ge v1, v2, :cond_0

    .line 315
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 319
    :goto_0
    return-void

    .line 317
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method

.method public static setDefaultTriggerReceiver(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 365
    .local p0, "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sput-object p0, Lde/appplant/cordova/plugin/notification/Notification;->defaultReceiver:Ljava/lang/Class;

    .line 366
    return-void
.end method

.method private showDialog()V
    .locals 0

    .prologue
    .line 251
    return-void
.end method

.method private showNotification()V
    .locals 3

    .prologue
    .line 235
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v1

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Options;->getIdAsInt()I

    move-result v0

    .line 237
    .local v0, "id":I
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xf

    if-gt v1, v2, :cond_0

    .line 239
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/notification/Notification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 244
    :goto_0
    return-void

    .line 242
    :cond_0
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/notification/Notification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method

.method private unpersist()V
    .locals 3

    .prologue
    .line 325
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 327
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Options;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 329
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-ge v1, v2, :cond_0

    .line 330
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 334
    :goto_0
    return-void

    .line 332
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 210
    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    iget-object v4, p0, Lde/appplant/cordova/plugin/notification/Notification;->receiver:Ljava/lang/Class;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 211
    iget-object v3, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Options;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 214
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    invoke-static {v2, v5, v0, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 216
    .local v1, "pi":Landroid/app/PendingIntent;
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getAlarmMgr()Landroid/app/AlarmManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 217
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v2

    iget-object v3, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Options;->getIdAsInt()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 219
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->unpersist()V

    .line 220
    return-void
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 194
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->wasInThePast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->unpersist()V

    .line 199
    :goto_0
    return-void

    .line 197
    :cond_0
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Options;->getIdAsInt()I

    move-result v0

    return v0
.end method

.method public getNextTriggerTime()J
    .locals 8

    .prologue
    .line 257
    iget-object v3, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Options;->getTriggerTime()J

    move-result-wide v4

    .line 259
    .local v4, "triggerTime":J
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isTriggered()Z

    move-result v3

    if-nez v3, :cond_1

    .line 265
    .end local v4    # "triggerTime":J
    :cond_0
    :goto_0
    return-wide v4

    .line 262
    .restart local v4    # "triggerTime":J
    :cond_1
    iget-object v3, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Options;->getRepeatInterval()J

    move-result-wide v0

    .line 263
    .local v0, "interval":J
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getTriggerCountSinceSchedule()I

    move-result v2

    .line 265
    .local v2, "triggerCount":I
    add-int/lit8 v3, v2, 0x1

    int-to-long v6, v3

    mul-long/2addr v6, v0

    add-long/2addr v4, v6

    goto :goto_0
.end method

.method public getOptions()Lde/appplant/cordova/plugin/notification/Options;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    return-object v0
.end method

.method public getTriggerCountSinceSchedule()I
    .locals 8

    .prologue
    .line 272
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 273
    .local v2, "now":J
    iget-object v4, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v4}, Lde/appplant/cordova/plugin/notification/Options;->getTriggerTime()J

    move-result-wide v0

    .line 275
    .local v0, "initTriggerTime":J
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->wasInThePast()Z

    move-result v4

    if-nez v4, :cond_0

    .line 276
    const/4 v4, 0x0

    .line 281
    :goto_0
    return v4

    .line 278
    :cond_0
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v4

    if-nez v4, :cond_1

    .line 279
    const/4 v4, 0x1

    goto :goto_0

    .line 281
    :cond_1
    sub-long v4, v2, v0

    iget-object v6, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v6}, Lde/appplant/cordova/plugin/notification/Options;->getRepeatInterval()J

    move-result-wide v6

    div-long/2addr v4, v6

    long-to-int v4, v4

    goto :goto_0
.end method

.method public getType()Lde/appplant/cordova/plugin/notification/Notification$Type;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isTriggered()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    goto :goto_0
.end method

.method public isRepeating()Z
    .locals 4

    .prologue
    .line 115
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v0

    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Options;->getRepeatInterval()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScheduled()Z
    .locals 1

    .prologue
    .line 129
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->wasInThePast()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isTriggered()Z
    .locals 1

    .prologue
    .line 136
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->wasInThePast()Z

    move-result v0

    return v0
.end method

.method protected isUpdate()Z
    .locals 10

    .prologue
    const/4 v4, 0x0

    .line 144
    iget-object v5, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "updatedAt"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 151
    :cond_0
    :goto_0
    return v4

    .line 147
    :cond_1
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 149
    .local v0, "now":J
    iget-object v5, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "updatedAt"

    invoke-virtual {v5, v6, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 151
    .local v2, "updatedAt":J
    sub-long v6, v0, v2

    const-wide/16 v8, 0x3e8

    cmp-long v5, v6, v8

    if-gez v5, :cond_0

    const/4 v4, 0x1

    goto :goto_0
.end method

.method reschedule()V
    .locals 1

    .prologue
    .line 184
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->isRepeating()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->schedule()V

    .line 187
    :cond_0
    return-void
.end method

.method public schedule()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 165
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getNextTriggerTime()J

    move-result-wide v2

    .line 167
    .local v2, "triggerTime":J
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->persist()V

    .line 170
    new-instance v4, Landroid/content/Intent;

    iget-object v5, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    iget-object v6, p0, Lde/appplant/cordova/plugin/notification/Notification;->receiver:Ljava/lang/Class;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 171
    iget-object v5, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v5}, Lde/appplant/cordova/plugin/notification/Options;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 172
    const-string v5, "NOTIFICATION_OPTIONS"

    iget-object v6, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v6}, Lde/appplant/cordova/plugin/notification/Options;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 175
    .local v0, "intent":Landroid/content/Intent;
    iget-object v4, p0, Lde/appplant/cordova/plugin/notification/Notification;->context:Landroid/content/Context;

    const/high16 v5, 0x10000000

    .line 174
    invoke-static {v4, v7, v0, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 177
    .local v1, "pi":Landroid/app/PendingIntent;
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->getAlarmMgr()Landroid/app/AlarmManager;

    move-result-object v4

    invoke-virtual {v4, v7, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 178
    return-void
.end method

.method public show()V
    .locals 0

    .prologue
    .line 227
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Notification;->showNotification()V

    .line 228
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 288
    iget-object v4, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v4}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v0

    .line 289
    .local v0, "dict":Lorg/json/JSONObject;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 292
    .local v2, "json":Lorg/json/JSONObject;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "json":Lorg/json/JSONObject;
    .local v3, "json":Lorg/json/JSONObject;
    move-object v2, v3

    .line 297
    .end local v3    # "json":Lorg/json/JSONObject;
    .restart local v2    # "json":Lorg/json/JSONObject;
    :goto_0
    const-string v4, "updatedAt"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 298
    const-string v4, "soundUri"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 299
    const-string v4, "iconUri"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 301
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 293
    :catch_0
    move-exception v1

    .line 294
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public wasInThePast()Z
    .locals 2

    .prologue
    .line 122
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iget-object v1, p0, Lde/appplant/cordova/plugin/notification/Notification;->options:Lde/appplant/cordova/plugin/notification/Options;

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Options;->getTriggerDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    return v0
.end method
