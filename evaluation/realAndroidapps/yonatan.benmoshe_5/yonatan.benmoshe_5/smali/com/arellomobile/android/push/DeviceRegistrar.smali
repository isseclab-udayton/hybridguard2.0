.class public Lcom/arellomobile/android/push/DeviceRegistrar;
.super Ljava/lang/Object;
.source "DeviceRegistrar.java"


# static fields
.field private static final REGISTER_PATH:Ljava/lang/String; = "registerDevice"

.field private static final TAG:Ljava/lang/String; = "DeviceRegistrar"

.field private static final UNREGISTER_PATH:Ljava/lang/String; = "unregisterDevice"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static makeRequest(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceRegistrationID"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 121
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/request/RequestHelper;->getRegistrationUnregistrationData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 123
    invoke-static {v0, p2}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v1

    return-object v1
.end method

.method static registerWithServer(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceRegistrationID"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0xc8

    .line 34
    const-string v5, "DeviceRegistrar"

    const-string v6, "Try To Registered for pushes"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    const/4 v4, 0x0

    .line 36
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 37
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 60
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 62
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onRegisterError(Landroid/content/Context;Ljava/lang/String;)V

    .line 63
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Registration error "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 71
    :goto_1
    return-void

    .line 41
    :cond_1
    :try_start_0
    const-string v5, "registerDevice"

    invoke-static {p0, p1, v5}, Lcom/arellomobile/android/push/DeviceRegistrar;->makeRequest(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 42
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 37
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 48
    const/4 v5, 0x1

    invoke-static {p0, v5}, Lcom/google/android/gcm/GCMRegistrar;->setRegisteredOnServer(Landroid/content/Context;Z)V

    .line 49
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onRegistered(Landroid/content/Context;Ljava/lang/String;)V

    .line 50
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-static {p0, v5, v6}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setLastRegistration(Landroid/content/Context;J)V

    .line 51
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Registered for pushes: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 54
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    move-object v2, v0

    goto :goto_2

    .line 67
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "err":Ljava/lang/String;
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Registration error "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onRegisterError(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method

.method static unregisterWithServer(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceRegistrationID"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0xc8

    .line 75
    const-string v5, "DeviceRegistrar"

    const-string v6, "Try To Unregistered for pushes"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const/4 v5, 0x0

    invoke-static {p0, v5}, Lcom/google/android/gcm/GCMRegistrar;->setRegisteredOnServer(Landroid/content/Context;Z)V

    .line 78
    const/4 v4, 0x0

    .line 79
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 80
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 103
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 105
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onUnregisteredError(Landroid/content/Context;Ljava/lang/String;)V

    .line 106
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unregistration error "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    :goto_1
    return-void

    .line 84
    :cond_1
    :try_start_0
    const-string v5, "unregisterDevice"

    invoke-static {p0, p1, v5}, Lcom/arellomobile/android/push/DeviceRegistrar;->makeRequest(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 86
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 80
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 92
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onUnregistered(Landroid/content/Context;Ljava/lang/String;)V

    .line 93
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unregistered for pushes: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-static {p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->resetLastRegistration(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 97
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    move-object v2, v0

    goto :goto_2

    .line 110
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "err":Ljava/lang/String;
    const-string v5, "DeviceRegistrar"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unregistration error "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onUnregisteredError(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method
