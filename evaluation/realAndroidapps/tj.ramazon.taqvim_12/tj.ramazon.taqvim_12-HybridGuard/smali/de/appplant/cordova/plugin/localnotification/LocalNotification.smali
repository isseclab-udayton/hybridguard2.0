.class public Lde/appplant/cordova/plugin/localnotification/LocalNotification;
.super Lorg/apache/cordova/CordovaPlugin;
.source "LocalNotification.java"


# static fields
.field private static deviceready:Ljava/lang/Boolean;

.field private static eventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static isInBackground:Ljava/lang/Boolean;

.field private static webView:Lorg/apache/cordova/CordovaWebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 54
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready:Ljava/lang/Boolean;

    .line 57
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->eventQueue:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->schedule(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$1(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 218
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->update(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$10(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 351
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getScheduledIds(Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$11(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 364
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getTriggeredIds(Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$12(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 379
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getAll(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$13(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 399
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getScheduled(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$14(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 420
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getTriggered(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$15()V
    .locals 0

    .prologue
    .line 436
    invoke-static {}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready()V

    return-void
.end method

.method static synthetic access$16()Lorg/apache/cordova/CordovaWebView;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->webView:Lorg/apache/cordova/CordovaWebView;

    return-object v0
.end method

.method static synthetic access$2(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 236
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->cancel(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$3(Lde/appplant/cordova/plugin/localnotification/LocalNotification;)V
    .locals 0

    .prologue
    .line 250
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->cancelAll()V

    return-void
.end method

.method static synthetic access$4(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 261
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->clear(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$5(Lde/appplant/cordova/plugin/localnotification/LocalNotification;)V
    .locals 0

    .prologue
    .line 275
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->clearAll()V

    return-void
.end method

.method static synthetic access$6(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 288
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isPresent(ILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$7(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 305
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isScheduled(ILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$8(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 323
    invoke-direct {p0, p1, p2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isTriggered(ILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$9(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 339
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getAllIds(Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method private cancel(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "ids"    # Lorg/json/JSONArray;

    .prologue
    .line 237
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 245
    return-void

    .line 238
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONArray;->optInt(II)I

    move-result v1

    .line 241
    .local v1, "id":I
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lde/appplant/cordova/plugin/notification/Manager;->cancel(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v2

    .line 243
    .local v2, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    const-string v3, "cancel"

    invoke-static {v3, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 237
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private cancelAll()V
    .locals 1

    .prologue
    .line 251
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v0

    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Manager;->cancelAll()V

    .line 252
    const-string v0, "cancelall"

    invoke-direct {p0, v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method private clear(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "ids"    # Lorg/json/JSONArray;

    .prologue
    .line 262
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 270
    return-void

    .line 263
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONArray;->optInt(II)I

    move-result v1

    .line 266
    .local v1, "id":I
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v3

    invoke-virtual {v3, v1}, Lde/appplant/cordova/plugin/notification/Manager;->clear(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v2

    .line 268
    .local v2, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    const-string v3, "clear"

    invoke-static {v3, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private clearAll()V
    .locals 1

    .prologue
    .line 276
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v0

    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Manager;->clearAll()V

    .line 277
    const-string v0, "clearall"

    invoke-direct {p0, v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;)V

    .line 278
    return-void
.end method

.method private static declared-synchronized deviceready()V
    .locals 4

    .prologue
    .line 437
    const-class v2, Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    monitor-enter v2

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    .line 438
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready:Ljava/lang/Boolean;

    .line 440
    sget-object v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->eventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v0, "js":Ljava/lang/String;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 444
    sget-object v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->eventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    monitor-exit v2

    return-void

    .line 440
    :cond_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "js":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 441
    .restart local v0    # "js":Ljava/lang/String;
    invoke-static {v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->sendJavascript(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 437
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private fireEvent(Ljava/lang/String;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 454
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 455
    return-void
.end method

.method static fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V
    .locals 5
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "notification"    # Lde/appplant/cordova/plugin/notification/Notification;

    .prologue
    .line 466
    invoke-static {}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getApplicationState()Ljava/lang/String;

    move-result-object v2

    .line 467
    .local v2, "state":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 469
    .local v1, "params":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 470
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lde/appplant/cordova/plugin/notification/Notification;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 473
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "cordova.plugins.notification.local.fireEvent(\""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 474
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 473
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 476
    .local v0, "js":Ljava/lang/String;
    invoke-static {v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->sendJavascript(Ljava/lang/String;)V

    .line 477
    return-void
.end method

.method private getAll(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "ids"    # Lorg/json/JSONArray;
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 382
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 383
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Manager;->getOptions()Ljava/util/List;

    move-result-object v0

    .line 388
    .local v0, "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :goto_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 389
    return-void

    .line 385
    .end local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :cond_0
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsById(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .restart local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    goto :goto_0
.end method

.method private getAllIds(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 340
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Manager;->getIds()Ljava/util/List;

    move-result-object v0

    .line 342
    .local v0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 343
    return-void
.end method

.method static getApplicationState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 526
    sget-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "background"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "foreground"

    goto :goto_0
.end method

.method private getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;
    .locals 1

    .prologue
    .line 533
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lde/appplant/cordova/plugin/notification/Manager;->getInstance(Landroid/content/Context;)Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v0

    return-object v0
.end method

.method private getScheduled(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "ids"    # Lorg/json/JSONArray;
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 402
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 403
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-virtual {v1, v2}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;

    move-result-object v0

    .line 409
    .local v0, "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :goto_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 410
    return-void

    .line 405
    .end local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :cond_0
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    .line 406
    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    .line 405
    invoke-virtual {v1, v2, v3}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsBy(Lde/appplant/cordova/plugin/notification/Notification$Type;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .restart local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    goto :goto_0
.end method

.method private getScheduledIds(Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 352
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    .line 353
    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    .line 352
    invoke-virtual {v1, v2}, Lde/appplant/cordova/plugin/notification/Manager;->getIdsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;

    move-result-object v0

    .line 355
    .local v0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 356
    return-void
.end method

.method private getTriggered(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "ids"    # Lorg/json/JSONArray;
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 423
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 424
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-virtual {v1, v2}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;

    move-result-object v0

    .line 430
    .local v0, "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :goto_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 431
    return-void

    .line 426
    .end local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :cond_0
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    .line 427
    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    .line 426
    invoke-virtual {v1, v2, v3}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsBy(Lde/appplant/cordova/plugin/notification/Notification$Type;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .restart local v0    # "options":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    goto :goto_0
.end method

.method private getTriggeredIds(Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 365
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v1

    .line 366
    sget-object v2, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    .line 365
    invoke-virtual {v1, v2}, Lde/appplant/cordova/plugin/notification/Manager;->getIdsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;

    move-result-object v0

    .line 368
    .local v0, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 369
    return-void
.end method

.method private isPresent(ILorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 289
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lde/appplant/cordova/plugin/notification/Manager;->exist(I)Z

    move-result v0

    .line 291
    .local v0, "exist":Z
    new-instance v1, Lorg/apache/cordova/PluginResult;

    .line 292
    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 291
    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 294
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 295
    return-void
.end method

.method private isScheduled(ILorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 306
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v2

    .line 307
    sget-object v3, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    .line 306
    invoke-virtual {v2, p1, v3}, Lde/appplant/cordova/plugin/notification/Manager;->exist(ILde/appplant/cordova/plugin/notification/Notification$Type;)Z

    move-result v0

    .line 309
    .local v0, "exist":Z
    new-instance v1, Lorg/apache/cordova/PluginResult;

    .line 310
    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 309
    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 312
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 313
    return-void
.end method

.method private isTriggered(ILorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "command"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 324
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v2

    .line 325
    sget-object v3, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    .line 324
    invoke-virtual {v2, p1, v3}, Lde/appplant/cordova/plugin/notification/Manager;->exist(ILde/appplant/cordova/plugin/notification/Notification$Type;)Z

    move-result v0

    .line 327
    .local v0, "exist":Z
    new-instance v1, Lorg/apache/cordova/PluginResult;

    .line 328
    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 327
    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 330
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 331
    return-void
.end method

.method private schedule(Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "notifications"    # Lorg/json/JSONArray;

    .prologue
    .line 202
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 210
    return-void

    .line 203
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 206
    .local v2, "options":Lorg/json/JSONObject;
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v3

    const-class v4, Lde/appplant/cordova/plugin/localnotification/TriggerReceiver;

    invoke-virtual {v3, v2, v4}, Lde/appplant/cordova/plugin/notification/Manager;->schedule(Lorg/json/JSONObject;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v1

    .line 208
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    const-string v3, "schedule"

    invoke-static {v3, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 202
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static declared-synchronized sendJavascript(Ljava/lang/String;)V
    .locals 3
    .param p0, "js"    # Ljava/lang/String;

    .prologue
    .line 487
    const-class v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 488
    sget-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->eventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 501
    :goto_0
    monitor-exit v1

    return-void

    .line 492
    :cond_0
    :try_start_1
    sget-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v2, Lde/appplant/cordova/plugin/localnotification/LocalNotification$2;

    invoke-direct {v2, p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification$2;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CordovaWebView;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 487
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private toList(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 3
    .param p1, "ary"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 510
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 512
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 516
    return-object v1

    .line 513
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 512
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private update(Lorg/json/JSONArray;)V
    .locals 6
    .param p1, "updates"    # Lorg/json/JSONArray;

    .prologue
    .line 219
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v0, v4, :cond_0

    .line 228
    return-void

    .line 220
    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 221
    .local v3, "update":Lorg/json/JSONObject;
    const-string v4, "id"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    .line 224
    .local v1, "id":I
    invoke-direct {p0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->getNotificationMgr()Lde/appplant/cordova/plugin/notification/Manager;

    move-result-object v4

    const-class v5, Lde/appplant/cordova/plugin/localnotification/TriggerReceiver;

    invoke-virtual {v4, v1, v3, v5}, Lde/appplant/cordova/plugin/notification/Manager;->update(ILorg/json/JSONObject;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v2

    .line 226
    .local v2, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    const-string v4, "update"

    invoke-static {v4, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->fireEvent(Ljava/lang/String;Lde/appplant/cordova/plugin/notification/Notification;)V

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "command"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 131
    const-class v0, Lde/appplant/cordova/plugin/localnotification/TriggerReceiver;

    invoke-static {v0}, Lde/appplant/cordova/plugin/notification/Notification;->setDefaultTriggerReceiver(Ljava/lang/Class;)V

    .line 133
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;-><init>(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 192
    const/4 v0, 0x1

    return v0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/cordova/CordovaPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 72
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready:Ljava/lang/Boolean;

    .line 105
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    .line 106
    return-void
.end method

.method public onPause(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 82
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    .line 83
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    .line 84
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 94
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    .line 95
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->isInBackground:Ljava/lang/Boolean;

    .line 96
    invoke-static {}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->deviceready()V

    .line 97
    return-void
.end method
