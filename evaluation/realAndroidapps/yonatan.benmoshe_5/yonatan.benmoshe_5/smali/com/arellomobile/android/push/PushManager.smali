.class public Lcom/arellomobile/android/push/PushManager;
.super Ljava/lang/Object;
.source "PushManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arellomobile/android/push/PushManager$GetTagsListener;
    }
.end annotation


# static fields
.field private static final HTML_URL_FORMAT:Ljava/lang/String; = "https://cp.pushwoosh.com/content/%s"

.field public static final PUSH_RECEIVE_EVENT:Ljava/lang/String; = "PUSH_RECEIVE_EVENT"

.field public static final REGISTER_BROAD_CAST_ACTION:Ljava/lang/String; = "com.arellomobile.android.push.REGISTER_BROAD_CAST_ACTION"

.field public static final REGISTER_ERROR_EVENT:Ljava/lang/String; = "REGISTER_ERROR_EVENT"

.field public static final REGISTER_EVENT:Ljava/lang/String; = "REGISTER_EVENT"

.field public static final UNREGISTER_ERROR_EVENT:Ljava/lang/String; = "UNREGISTER_ERROR_EVENT"

.field public static final UNREGISTER_EVENT:Ljava/lang/String; = "UNREGISTER_EVENT"

.field private static mRegistrationAsyncTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field static volatile mSenderId:Ljava/lang/String;

.field private static final mSyncObj:Ljava/lang/Object;


# instance fields
.field private volatile mAppId:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mLastBundle:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/arellomobile/android/push/PushManager;->mSyncObj:Ljava/lang/Object;

    .line 41
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const-string v0, "context"

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/utils/GeneralUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    iput-object p1, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    .line 71
    invoke-static {p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getApplicationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mAppId:Ljava/lang/String;

    .line 72
    invoke-static {p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getSenderId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arellomobile/android/push/PushManager;->mSenderId:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "senderId"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/arellomobile/android/push/PushManager;-><init>(Landroid/content/Context;)V

    .line 79
    iput-object p2, p0, Lcom/arellomobile/android/push/PushManager;->mAppId:Ljava/lang/String;

    .line 80
    sput-object p3, Lcom/arellomobile/android/push/PushManager;->mSenderId:Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mAppId:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setApplicationId(Landroid/content/Context;Ljava/lang/String;)V

    .line 82
    invoke-static {p1, p3}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setSenderId(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method static synthetic access$0(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)Landroid/os/AsyncTask;
    .locals 1

    .prologue
    .line 515
    invoke-direct {p0, p1, p2}, Lcom/arellomobile/android/push/PushManager;->getRegisterAsyncTask(Landroid/content/Context;Ljava/lang/String;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Landroid/os/AsyncTask;)V
    .locals 0

    .prologue
    .line 65
    sput-object p0, Lcom/arellomobile/android/push/PushManager;->mRegistrationAsyncTask:Landroid/os/AsyncTask;

    return-void
.end method

.method static synthetic access$2()Landroid/os/AsyncTask;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/arellomobile/android/push/PushManager;->mRegistrationAsyncTask:Landroid/os/AsyncTask;

    return-object v0
.end method

.method static synthetic access$3(Lcom/arellomobile/android/push/PushManager;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private cancelPrevRegisterTask()V
    .locals 3

    .prologue
    .line 529
    sget-object v1, Lcom/arellomobile/android/push/PushManager;->mSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 531
    :try_start_0
    sget-object v0, Lcom/arellomobile/android/push/PushManager;->mRegistrationAsyncTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    .line 533
    sget-object v0, Lcom/arellomobile/android/push/PushManager;->mRegistrationAsyncTask:Landroid/os/AsyncTask;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 535
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/arellomobile/android/push/PushManager;->mRegistrationAsyncTask:Landroid/os/AsyncTask;

    .line 529
    monitor-exit v1

    .line 537
    return-void

    .line 529
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static clearLocalNotifications(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 557
    invoke-static {p0}, Lcom/arellomobile/android/push/AlarmReceiver;->clearAlarm(Landroid/content/Context;)V

    .line 558
    return-void
.end method

.method private getRegisterAsyncTask(Landroid/content/Context;Ljava/lang/String;)Landroid/os/AsyncTask;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "regId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .prologue
    .line 517
    new-instance v0, Lcom/arellomobile/android/push/PushManager$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/arellomobile/android/push/PushManager$8;-><init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTagsAsync(Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "listener"    # Lcom/arellomobile/android/push/PushManager$GetTagsListener;

    .prologue
    .line 235
    invoke-static {p0}, Lcom/google/android/gcm/GCMRegistrar;->isRegisteredOnServer(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 259
    :goto_0
    return-void

    .line 238
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 239
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$2;

    invoke-direct {v1, p0, p1}, Lcom/arellomobile/android/push/PushManager$2;-><init>(Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static getTagsSync(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    invoke-static {p0}, Lcom/google/android/gcm/GCMRegistrar;->isRegisteredOnServer(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    const/4 v0, 0x0

    .line 230
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/arellomobile/android/push/DeviceFeature2_5;->getTags(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public static incrementalTag(Ljava/lang/Integer;)Ljava/util/Map;
    .locals 3
    .param p0, "value"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 561
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 562
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "operation"

    const-string v2, "increment"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    const-string v1, "value"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    return-object v0
.end method

.method private neededToRequestPushWooshServer(Landroid/content/Context;)Z
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 428
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 429
    .local v1, "nowTime":Ljava/util/Calendar;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 430
    .local v2, "tenMinutesBefore":Ljava/util/Calendar;
    const/16 v3, 0xc

    const/16 v4, -0xa

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 432
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 433
    .local v0, "lastPushWooshRegistrationTime":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    invoke-static {p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getLastRegistration(Landroid/content/Context;)J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 435
    invoke-virtual {v2, v0}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 438
    const/4 v3, 0x0

    .line 440
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method private registerOnPushWoosh(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "regId"    # Ljava/lang/String;

    .prologue
    .line 445
    invoke-direct {p0}, Lcom/arellomobile/android/push/PushManager;->cancelPrevRegisterTask()V

    .line 447
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 448
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/arellomobile/android/push/PushManager$4;-><init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 456
    return-void
.end method

.method public static scheduleLocalNotification(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "seconds"    # I

    .prologue
    .line 541
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/arellomobile/android/push/PushManager;->scheduleLocalNotification(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 542
    return-void
.end method

.method public static scheduleLocalNotification(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;I)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "seconds"    # I

    .prologue
    .line 553
    invoke-static {p0, p1, p2, p3}, Lcom/arellomobile/android/push/AlarmReceiver;->setAlarm(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;I)V

    .line 554
    return-void
.end method

.method private sendAppOpen(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 479
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 480
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$6;

    invoke-direct {v1, p0, p1}, Lcom/arellomobile/android/push/PushManager$6;-><init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 494
    return-void
.end method

.method public static sendGoalAchieved(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "goal"    # Ljava/lang/String;
    .param p2, "count"    # Ljava/lang/Integer;

    .prologue
    .line 498
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 499
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/arellomobile/android/push/PushManager$7;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 513
    return-void
.end method

.method public static sendLocation(Landroid/content/Context;Landroid/location/Location;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 263
    invoke-static {p0}, Lcom/google/android/gcm/GCMRegistrar;->isRegisteredOnServer(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 285
    :goto_0
    return-void

    .line 266
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 267
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$3;

    invoke-direct {v1, p0, p1}, Lcom/arellomobile/android/push/PushManager$3;-><init>(Landroid/content/Context;Landroid/location/Location;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static sendTags(Landroid/content/Context;Ljava/util/Map;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "callBack"    # Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;",
            ")V"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 214
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/arellomobile/android/push/PushManager$1;-><init>(Landroid/content/Context;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 218
    return-void
.end method

.method public static sendTagsFromBG(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/arellomobile/android/push/exception/PushWooshException;
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 188
    .local v3, "wrongTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendTags(Landroid/content/Context;Ljava/util/Map;)Lorg/json/JSONArray;

    move-result-object v4

    .line 190
    .local v4, "wrongTagsArray":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v1, v5, :cond_0

    .line 202
    return-object v3

    .line 192
    :cond_0
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 193
    .local v2, "reason":Lorg/json/JSONObject;
    const-string v5, "tag"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "reason"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    .end local v1    # "i":I
    .end local v2    # "reason":Lorg/json/JSONObject;
    .end local v4    # "wrongTagsArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Lcom/arellomobile/android/push/exception/PushWooshException;

    invoke-direct {v5, v0}, Lcom/arellomobile/android/push/exception/PushWooshException;-><init>(Ljava/lang/Exception;)V

    throw v5
.end method

.method public static sendTagsFromUI(Landroid/content/Context;Ljava/util/Map;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "callBack"    # Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;",
            ")V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;

    invoke-direct {v0, p0, p2}, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;-><init>(Landroid/content/Context;Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/util/Map;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/arellomobile/android/push/tags/SendPushTagsAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 209
    return-void
.end method

.method public static setEnableLED(Landroid/content/Context;Z)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ledOn"    # Z

    .prologue
    .line 325
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setEnableLED(Landroid/content/Context;Z)V

    .line 326
    return-void
.end method

.method public static setLightScreenOnNotification(Landroid/content/Context;Z)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "lightsOn"    # Z

    .prologue
    .line 320
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setLightScreenOnNotification(Landroid/content/Context;Z)V

    .line 321
    return-void
.end method

.method public static setMultiNotificationMode(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 297
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setMultiMode(Landroid/content/Context;Z)V

    .line 298
    return-void
.end method

.method public static setSimpleNotificationMode(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 305
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setMultiMode(Landroid/content/Context;Z)V

    .line 306
    return-void
.end method

.method public static setSoundNotificationType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/SoundType;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "soundNotificationType"    # Lcom/arellomobile/android/push/preference/SoundType;

    .prologue
    .line 310
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setSoundType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/SoundType;)V

    .line 311
    return-void
.end method

.method public static setVibrateNotificationType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/VibrateType;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "vibrateNotificationType"    # Lcom/arellomobile/android/push/preference/VibrateType;

    .prologue
    .line 315
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setVibrateType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/VibrateType;)V

    .line 316
    return-void
.end method


# virtual methods
.method getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCustomData()Ljava/lang/String;
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mLastBundle:Landroid/os/Bundle;

    if-nez v0, :cond_0

    .line 165
    const/4 v0, 0x0

    .line 168
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mLastBundle:Landroid/os/Bundle;

    const-string v1, "u"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method onHandlePush(Landroid/app/Activity;)Z
    .locals 12
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 335
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string v10, "pushBundle"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    .line 336
    .local v5, "pushBundle":Landroid/os/Bundle;
    if-eqz v5, :cond_0

    iget-object v9, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    if-nez v9, :cond_1

    :cond_0
    move v7, v8

    .line 418
    :goto_0
    return v7

    .line 341
    :cond_1
    iput-object v5, p0, Lcom/arellomobile/android/push/PushManager;->mLastBundle:Landroid/os/Bundle;

    .line 343
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 344
    .local v0, "dataObject":Lorg/json/JSONObject;
    invoke-virtual {v5}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 345
    .local v3, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_3

    .line 369
    iget-object v9, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v5}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onMessageReceive(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 372
    const-string v9, "h"

    invoke-virtual {v5, v9}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 374
    .local v6, "url":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 376
    const-string v9, "https://cp.pushwoosh.com/content/%s"

    new-array v10, v7, [Ljava/lang/Object;

    aput-object v6, v10, v8

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 379
    new-instance v1, Landroid/content/Intent;

    const-class v8, Lcom/arellomobile/android/push/PushWebview;

    invoke-direct {v1, p1, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 380
    .local v1, "intent":Landroid/content/Intent;
    const-string v8, "url"

    invoke-virtual {v1, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 381
    invoke-virtual {p1, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 385
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_2
    const-string v8, "l"

    invoke-virtual {v5, v8}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 416
    .local v4, "packageName":Ljava/lang/String;
    iget-object v8, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    const-string v9, "p"

    invoke-virtual {v5, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/arellomobile/android/push/PushManager;->sendPushStat(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 345
    .end local v4    # "packageName":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    :cond_3
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 347
    .local v2, "key":Ljava/lang/String;
    const-string v10, "u"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 351
    :try_start_0
    const-string v10, "userdata"

    const-string v11, "u"

    invoke-virtual {v5, v11}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 361
    :cond_4
    :goto_2
    :try_start_1
    invoke-virtual {v5, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 363
    :catch_0
    move-exception v10

    goto :goto_1

    .line 353
    :catch_1
    move-exception v10

    goto :goto_2
.end method

.method public onStartup(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/arellomobile/android/push/PushManager;->onStartup(Landroid/content/Context;Z)V

    .line 88
    return-void
.end method

.method public onStartup(Landroid/content/Context;Z)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registerAppOpen"    # Z

    .prologue
    .line 95
    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager;->mAppId:Ljava/lang/String;

    const-string v3, "mAppId"

    invoke-static {v2, v3}, Lcom/arellomobile/android/push/utils/GeneralUtils;->checkNotNullOrEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    sget-object v2, Lcom/arellomobile/android/push/PushManager;->mSenderId:Ljava/lang/String;

    const-string v3, "mSenderId"

    invoke-static {v2, v3}, Lcom/arellomobile/android/push/utils/GeneralUtils;->checkNotNullOrEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->checkDevice(Landroid/content/Context;)V

    .line 102
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->checkManifest(Landroid/content/Context;)V

    .line 104
    if-eqz p2, :cond_0

    .line 105
    invoke-direct {p0, p1}, Lcom/arellomobile/android/push/PushManager;->sendAppOpen(Landroid/content/Context;)V

    .line 107
    :cond_0
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->getRegistrationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "regId":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 111
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    sget-object v4, Lcom/arellomobile/android/push/PushManager;->mSenderId:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {p1, v2}, Lcom/google/android/gcm/GCMRegistrar;->register(Landroid/content/Context;[Ljava/lang/String;)V

    .line 142
    :cond_1
    :goto_0
    return-void

    .line 115
    :cond_2
    instance-of v2, p1, Landroid/app/Activity;

    if-eqz v2, :cond_3

    move-object v2, p1

    .line 117
    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "PUSH_RECEIVE_EVENT"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 124
    :cond_3
    invoke-static {p1}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getApplicationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "oldAppId":Ljava/lang/String;
    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager;->mAppId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 128
    invoke-direct {p0, p1, v1}, Lcom/arellomobile/android/push/PushManager;->registerOnPushWoosh(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 132
    :cond_4
    invoke-direct {p0, p1}, Lcom/arellomobile/android/push/PushManager;->neededToRequestPushWooshServer(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 134
    invoke-direct {p0, p1, v1}, Lcom/arellomobile/android/push/PushManager;->registerOnPushWoosh(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 138
    :cond_5
    invoke-static {p1, v1}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onRegistered(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method sendPushStat(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "hash"    # Ljava/lang/String;

    .prologue
    .line 460
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 461
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/arellomobile/android/push/PushManager$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/arellomobile/android/push/PushManager$5;-><init>(Lcom/arellomobile/android/push/PushManager;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 475
    return-void
.end method

.method public startTrackingGeoPushes()V
    .locals 4

    .prologue
    .line 146
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    const-class v3, Lcom/arellomobile/android/push/GeoLocationService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 147
    return-void
.end method

.method public stopTrackingGeoPushes()V
    .locals 4

    .prologue
    .line 151
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    const-class v3, Lcom/arellomobile/android/push/GeoLocationService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 152
    return-void
.end method

.method public unregister()V
    .locals 1

    .prologue
    .line 156
    invoke-direct {p0}, Lcom/arellomobile/android/push/PushManager;->cancelPrevRegisterTask()V

    .line 158
    iget-object v0, p0, Lcom/arellomobile/android/push/PushManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gcm/GCMRegistrar;->unregister(Landroid/content/Context;)V

    .line 159
    return-void
.end method
