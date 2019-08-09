.class public Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "PushNotifications.java"


# static fields
.field public static final CLEAR_LOCAL_NOTIFICATION:Ljava/lang/String; = "clearLocalNotification"

.field public static final CREATE_LOCAL_NOTIFICATION:Ljava/lang/String; = "createLocalNotification"

.field public static final GET_TAGS:Ljava/lang/String; = "getTags"

.field public static final ON_DEVICE_READY:Ljava/lang/String; = "onDeviceReady"

.field public static final REGISTER:Ljava/lang/String; = "registerDevice"

.field public static final SEND_LOCATION:Ljava/lang/String; = "sendLocation"

.field public static final SET_TAGS:Ljava/lang/String; = "setTags"

.field public static final START_GEO_PUSHES:Ljava/lang/String; = "startGeoPushes"

.field public static final STOP_GEO_PUSHES:Ljava/lang/String; = "stopGeoPushes"

.field public static final UNREGISTER:Ljava/lang/String; = "unregisterDevice"


# instance fields
.field callbackIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/api/CallbackContext;",
            ">;"
        }
    .end annotation
.end field

.field loggedStart:Z

.field mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field mPushManager:Lcom/arellomobile/android/push/PushManager;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field receiversRegistered:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 39
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    .line 52
    iput-boolean v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->loggedStart:Z

    .line 53
    iput-boolean v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->receiversRegistered:Z

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    .line 68
    new-instance v0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1;

    invoke-direct {v0, p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1;-><init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;)V

    iput-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 652
    new-instance v0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$2;

    invoke-direct {v0, p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$2;-><init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;)V

    iput-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 39
    return-void
.end method

.method static synthetic access$0(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->checkMessage(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 636
    invoke-direct {p0, p1}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnMessageReceive(Ljava/lang/String;)V

    return-void
.end method

.method private checkMessage(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 205
    if-eqz p1, :cond_1

    .line 207
    const-string v0, "PUSH_RECEIVE_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 209
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "PUSH_RECEIVE_EVENT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnMessageReceive(Ljava/lang/String;)V

    .line 228
    :cond_0
    :goto_0
    const-string v0, "PUSH_RECEIVE_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 229
    const-string v0, "REGISTER_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 230
    const-string v0, "UNREGISTER_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 231
    const-string v0, "REGISTER_ERROR_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 232
    const-string v0, "UNREGISTER_ERROR_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 234
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 236
    :cond_1
    return-void

    .line 211
    :cond_2
    const-string v0, "REGISTER_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 213
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "REGISTER_EVENT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnRegistered(Ljava/lang/String;)V

    goto :goto_0

    .line 215
    :cond_3
    const-string v0, "UNREGISTER_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 217
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "UNREGISTER_EVENT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnUnregistered(Ljava/lang/String;)V

    goto :goto_0

    .line 219
    :cond_4
    const-string v0, "REGISTER_ERROR_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 221
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "REGISTER_ERROR_EVENT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnRegisteredError(Ljava/lang/String;)V

    goto :goto_0

    .line 223
    :cond_5
    const-string v0, "UNREGISTER_ERROR_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "UNREGISTER_ERROR_EVENT"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->doOnUnregisteredError(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private doOnMessageReceive(Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 638
    const-string v1, "doOnMessageReceive"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "message is: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    const-string v1, "window.plugins.pushNotification.notificationCallback(%s);"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 642
    .local v0, "jsStatement":Ljava/lang/String;
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 643
    new-instance v2, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;

    invoke-direct {v2, p0, v0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$3;-><init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;Ljava/lang/String;)V

    .line 642
    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 650
    return-void
.end method

.method private doOnRegistered(Ljava/lang/String;)V
    .locals 3
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 598
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "registerDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 599
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 604
    :goto_0
    return-void

    .line 602
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    .line 603
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "registerDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private doOnRegisteredError(Ljava/lang/String;)V
    .locals 3
    .param p1, "errorId"    # Ljava/lang/String;

    .prologue
    .line 608
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "registerDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 609
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 614
    :goto_0
    return-void

    .line 612
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    .line 613
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "registerDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private doOnUnregistered(Ljava/lang/String;)V
    .locals 3
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 618
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 619
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 624
    :goto_0
    return-void

    .line 622
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    .line 623
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private doOnUnregisteredError(Ljava/lang/String;)V
    .locals 3
    .param p1, "errorId"    # Ljava/lang/String;

    .prologue
    .line 628
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 629
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 634
    :goto_0
    return-void

    .line 632
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    .line 633
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private internalRegister(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 7
    .param p1, "data"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    const/4 v6, 0x1

    .line 144
    const/4 v2, 0x0

    .line 147
    .local v2, "params":Lorg/json/JSONObject;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 157
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v4, "registerDevice"

    invoke-virtual {v3, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const/4 v0, 0x0

    .line 162
    .local v0, "appid":Ljava/lang/String;
    :try_start_1
    const-string v3, "appid"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 163
    const-string v3, "appid"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 167
    :goto_0
    new-instance v3, Lcom/arellomobile/android/push/PushManager;

    iget-object v4, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string v5, "projectid"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lcom/arellomobile/android/push/PushManager;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 180
    :try_start_2
    iget-boolean v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->loggedStart:Z

    if-eqz v3, :cond_1

    .line 182
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    iget-object v4, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/arellomobile/android/push/PushManager;->onStartup(Landroid/content/Context;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 199
    :goto_1
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->checkMessage(Landroid/content/Intent;)V

    .line 200
    .end local v0    # "appid":Ljava/lang/String;
    :goto_2
    return v6

    .line 149
    :catch_0
    move-exception v1

    .line 151
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 153
    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 165
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "appid":Ljava/lang/String;
    :cond_0
    :try_start_3
    const-string v3, "pw_appid"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v0

    goto :goto_0

    .line 169
    :catch_1
    move-exception v1

    .line 171
    .restart local v1    # "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v4, "registerDevice"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 174
    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 186
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    :try_start_4
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    iget-object v4, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/arellomobile/android/push/PushManager;->onStartup(Landroid/content/Context;Z)V

    .line 187
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->loggedStart:Z
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 190
    :catch_2
    move-exception v1

    .line 192
    .local v1, "e":Ljava/lang/RuntimeException;
    iget-object v3, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v4, "registerDevice"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 195
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private internalSendLocation(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 9
    .param p1, "data"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    const/4 v7, 0x0

    .line 257
    iget-object v8, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    if-nez v8, :cond_0

    .line 292
    :goto_0
    return v7

    .line 262
    :cond_0
    const/4 v6, 0x0

    .line 265
    .local v6, "params":Lorg/json/JSONObject;
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 273
    const-wide/16 v1, 0x0

    .line 274
    .local v1, "lat":D
    const-wide/16 v4, 0x0

    .line 278
    .local v4, "lon":D
    :try_start_1
    const-string v8, "lat"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    .line 279
    const-string v8, "lon"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v4

    .line 287
    new-instance v3, Landroid/location/Location;

    const-string v7, ""

    invoke-direct {v3, v7}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 288
    .local v3, "location":Landroid/location/Location;
    invoke-virtual {v3, v1, v2}, Landroid/location/Location;->setLatitude(D)V

    .line 289
    invoke-virtual {v3, v4, v5}, Landroid/location/Location;->setLongitude(D)V

    .line 290
    iget-object v7, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7, v3}, Lcom/arellomobile/android/push/PushManager;->sendLocation(Landroid/content/Context;Landroid/location/Location;)V

    .line 292
    const/4 v7, 0x1

    goto :goto_0

    .line 267
    .end local v1    # "lat":D
    .end local v3    # "location":Landroid/location/Location;
    .end local v4    # "lon":D
    :catch_0
    move-exception v0

    .line 269
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 281
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "lat":D
    .restart local v4    # "lon":D
    :catch_1
    move-exception v0

    .line 283
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private internalSendTags(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 11
    .param p1, "data"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    const/4 v9, 0x0

    .line 300
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 308
    .local v3, "params":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 309
    .local v2, "nameItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 310
    .local v4, "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 326
    :try_start_1
    iget-object v8, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v8}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-static {v8, v4}, Lcom/arellomobile/android/push/PushManager;->sendTagsFromBG(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    .line 328
    .local v5, "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 329
    .local v6, "skippedTagsObj":Lorg/json/JSONObject;
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_1

    .line 334
    invoke-virtual {p2, v6}, Lorg/apache/cordova/api/CallbackContext;->success(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/arellomobile/android/push/exception/PushWooshException; {:try_start_1 .. :try_end_1} :catch_2

    .line 335
    const/4 v8, 0x1

    .line 340
    .end local v2    # "nameItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v3    # "params":Lorg/json/JSONObject;
    .end local v4    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "skippedTagsObj":Lorg/json/JSONObject;
    :goto_2
    return v8

    .line 302
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    move v8, v9

    .line 305
    goto :goto_2

    .line 314
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "nameItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v3    # "params":Lorg/json/JSONObject;
    .restart local v4    # "paramsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    :try_start_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 315
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v4, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 317
    .end local v1    # "name":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 319
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    move v8, v9

    .line 320
    goto :goto_2

    .line 329
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v5    # "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v6    # "skippedTagsObj":Lorg/json/JSONObject;
    :cond_1
    :try_start_3
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 331
    .local v7, "tagName":Ljava/lang/String;
    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Lcom/arellomobile/android/push/exception/PushWooshException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 337
    .end local v5    # "skippedTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "skippedTagsObj":Lorg/json/JSONObject;
    .end local v7    # "tagName":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 339
    .local v0, "e":Lcom/arellomobile/android/push/exception/PushWooshException;
    invoke-virtual {v0}, Lcom/arellomobile/android/push/exception/PushWooshException;->printStackTrace()V

    move v8, v9

    .line 340
    goto :goto_2
.end method

.method private internalUnregister(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 4
    .param p1, "data"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    const/4 v3, 0x1

    .line 240
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :try_start_0
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gcm/GCMRegistrar;->unregister(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    :goto_0
    return v3

    .line 246
    :catch_0
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "unregisterDevice"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 12
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    .line 347
    const-string v9, "PushNotifications"

    const-string v10, "Plugin Called"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    invoke-virtual {p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->registerReceivers()V

    .line 352
    const-string v9, "onDeviceReady"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 354
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->checkMessage(Landroid/content/Intent;)V

    .line 355
    const/4 v9, 0x1

    .line 593
    :goto_0
    return v9

    .line 358
    :cond_0
    const-string v9, "registerDevice"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 360
    invoke-direct {p0, p2, p3}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->internalRegister(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z

    move-result v9

    goto :goto_0

    .line 363
    :cond_1
    const-string v9, "unregisterDevice"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 365
    invoke-direct {p0, p2, p3}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->internalUnregister(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z

    move-result v9

    goto :goto_0

    .line 368
    :cond_2
    const-string v9, "setTags"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 370
    invoke-direct {p0, p2, p3}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->internalSendTags(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z

    move-result v9

    goto :goto_0

    .line 373
    :cond_3
    const-string v9, "sendLocation"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 375
    invoke-direct {p0, p2, p3}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->internalSendLocation(Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z

    move-result v9

    goto :goto_0

    .line 378
    :cond_4
    const-string v9, "startGeoPushes"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 380
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    if-nez v9, :cond_5

    .line 382
    const/4 v9, 0x0

    goto :goto_0

    .line 385
    :cond_5
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    invoke-virtual {v9}, Lcom/arellomobile/android/push/PushManager;->startTrackingGeoPushes()V

    .line 386
    const/4 v9, 0x1

    goto :goto_0

    .line 389
    :cond_6
    const-string v9, "stopGeoPushes"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 391
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    if-nez v9, :cond_7

    .line 393
    const/4 v9, 0x0

    goto :goto_0

    .line 396
    :cond_7
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    invoke-virtual {v9}, Lcom/arellomobile/android/push/PushManager;->stopTrackingGeoPushes()V

    .line 397
    const/4 v9, 0x1

    goto :goto_0

    .line 400
    :cond_8
    const-string v9, "createLocalNotification"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 402
    const/4 v5, 0x0

    .line 405
    .local v5, "params":Lorg/json/JSONObject;
    const/4 v9, 0x0

    :try_start_0
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 416
    :try_start_1
    const-string v9, "msg"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 417
    .local v4, "message":Ljava/lang/String;
    const-string v9, "seconds"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 418
    .local v6, "seconds":Ljava/lang/Integer;
    if-eqz v4, :cond_9

    if-nez v6, :cond_a

    .line 419
    :cond_9
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 407
    .end local v4    # "message":Ljava/lang/String;
    .end local v6    # "seconds":Ljava/lang/Integer;
    :catch_0
    move-exception v1

    .line 409
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 410
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 421
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v4    # "message":Ljava/lang/String;
    .restart local v6    # "seconds":Ljava/lang/Integer;
    :cond_a
    :try_start_2
    const-string v9, "userData"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 423
    .local v8, "userData":Ljava/lang/String;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 424
    .local v2, "extras":Landroid/os/Bundle;
    if-eqz v8, :cond_b

    .line 425
    const-string v9, "u"

    invoke-virtual {v2, v9, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    :cond_b
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-static {v9, v4, v2, v10}, Lcom/arellomobile/android/push/PushManager;->scheduleLocalNotification(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;I)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 435
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 429
    .end local v2    # "extras":Landroid/os/Bundle;
    .end local v4    # "message":Ljava/lang/String;
    .end local v6    # "seconds":Ljava/lang/Integer;
    .end local v8    # "userData":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 431
    .restart local v1    # "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 432
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 438
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v5    # "params":Lorg/json/JSONObject;
    :cond_c
    const-string v9, "clearLocalNotification"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 440
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9}, Lcom/arellomobile/android/push/PushManager;->clearLocalNotifications(Landroid/content/Context;)V

    .line 441
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 444
    :cond_d
    const-string v9, "setMultiNotificationMode"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 446
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9}, Lcom/arellomobile/android/push/PushManager;->setMultiNotificationMode(Landroid/content/Context;)V

    .line 447
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 450
    :cond_e
    const-string v9, "setSingleNotificationMode"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 452
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9}, Lcom/arellomobile/android/push/PushManager;->setSimpleNotificationMode(Landroid/content/Context;)V

    .line 453
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 456
    :cond_f
    const-string v9, "setSoundType"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 460
    const/4 v9, 0x0

    :try_start_3
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 461
    .local v7, "type":Ljava/lang/Integer;
    if-nez v7, :cond_10

    .line 462
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 464
    :cond_10
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-static {v10}, Lcom/arellomobile/android/push/preference/SoundType;->fromInt(I)Lcom/arellomobile/android/push/preference/SoundType;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/arellomobile/android/push/PushManager;->setSoundNotificationType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/SoundType;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 472
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 466
    .end local v7    # "type":Ljava/lang/Integer;
    :catch_2
    move-exception v1

    .line 468
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 469
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 475
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_11
    const-string v9, "setVibrateType"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 479
    const/4 v9, 0x0

    :try_start_4
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 480
    .restart local v7    # "type":Ljava/lang/Integer;
    if-nez v7, :cond_12

    .line 481
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 483
    :cond_12
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-static {v10}, Lcom/arellomobile/android/push/preference/VibrateType;->fromInt(I)Lcom/arellomobile/android/push/preference/VibrateType;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/arellomobile/android/push/PushManager;->setVibrateNotificationType(Landroid/content/Context;Lcom/arellomobile/android/push/preference/VibrateType;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 491
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 485
    .end local v7    # "type":Ljava/lang/Integer;
    :catch_3
    move-exception v1

    .line 487
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 488
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 494
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_13
    const-string v9, "setLightScreenOnNotification"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 498
    const/4 v9, 0x0

    :try_start_5
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v7

    .line 499
    .local v7, "type":Z
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9, v7}, Lcom/arellomobile/android/push/PushManager;->setLightScreenOnNotification(Landroid/content/Context;Z)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 507
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 501
    .end local v7    # "type":Z
    :catch_4
    move-exception v1

    .line 503
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 504
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 510
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_14
    const-string v9, "setEnableLED"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 514
    const/4 v9, 0x0

    :try_start_6
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v7

    .line 515
    .restart local v7    # "type":Z
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9, v7}, Lcom/arellomobile/android/push/PushManager;->setEnableLED(Landroid/content/Context;Z)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 523
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 517
    .end local v7    # "type":Z
    :catch_5
    move-exception v1

    .line 519
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 520
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 527
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_15
    const-string v9, "sendGoalAchieved"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18

    .line 529
    const/4 v5, 0x0

    .line 532
    .restart local v5    # "params":Lorg/json/JSONObject;
    const/4 v9, 0x0

    :try_start_7
    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_6

    move-result-object v5

    .line 543
    :try_start_8
    const-string v9, "goal"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    move-result-object v3

    .line 544
    .local v3, "goal":Ljava/lang/String;
    if-nez v3, :cond_16

    .line 545
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 534
    .end local v3    # "goal":Ljava/lang/String;
    :catch_6
    move-exception v1

    .line 536
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 537
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 547
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v3    # "goal":Ljava/lang/String;
    :cond_16
    const/4 v0, 0x0

    .line 548
    .local v0, "count":Ljava/lang/Integer;
    :try_start_9
    const-string v9, "count"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_17

    .line 549
    const-string v9, "count"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 551
    :cond_17
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-static {v9, v3, v0}, Lcom/arellomobile/android/push/PushManager;->sendGoalAchieved(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 559
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 553
    .end local v0    # "count":Ljava/lang/Integer;
    .end local v3    # "goal":Ljava/lang/String;
    :catch_7
    move-exception v1

    .line 555
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 556
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 562
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "params":Lorg/json/JSONObject;
    :cond_18
    const-string v9, "getTags"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19

    .line 564
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v10, "getTags"

    invoke-virtual {v9, v10, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    iget-object v9, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v9

    new-instance v10, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;

    invoke-direct {v10, p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;-><init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;)V

    invoke-static {v9, v10}, Lcom/arellomobile/android/push/PushManager;->getTagsAsync(Landroid/content/Context;Lcom/arellomobile/android/push/PushManager$GetTagsListener;)V

    .line 589
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 592
    :cond_19
    const-string v9, "DirectoryListPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Invalid action : "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " passed"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    const/4 v9, 0x0

    goto/16 :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 139
    invoke-super {p0}, Lorg/apache/cordova/api/CordovaPlugin;->onDestroy()V

    .line 140
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 63
    invoke-super {p0, p1}, Lorg/apache/cordova/api/CordovaPlugin;->onNewIntent(Landroid/content/Intent;)V

    .line 65
    invoke-direct {p0, p1}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->checkMessage(Landroid/content/Intent;)V

    .line 66
    return-void
.end method

.method public onPause(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 130
    invoke-super {p0, p1}, Lorg/apache/cordova/api/CordovaPlugin;->onPause(Z)V

    .line 131
    invoke-virtual {p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->unregisterReceivers()V

    .line 132
    return-void
.end method

.method public onResume(Z)V
    .locals 0
    .param p1, "multitasking"    # Z

    .prologue
    .line 123
    invoke-super {p0, p1}, Lorg/apache/cordova/api/CordovaPlugin;->onResume(Z)V

    .line 124
    invoke-virtual {p0}, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->registerReceivers()V

    .line 125
    return-void
.end method

.method public registerReceivers()V
    .locals 6

    .prologue
    .line 80
    iget-boolean v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->receiversRegistered:Z

    if-eqz v1, :cond_0

    .line 92
    :goto_0
    return-void

    .line 83
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".action.PUSH_MESSAGE_RECEIVE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 86
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 89
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "com.arellomobile.android.push.REGISTER_BROAD_CAST_ACTION"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 91
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->receiversRegistered:Z

    goto :goto_0
.end method

.method public unregisterReceivers()V
    .locals 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->receiversRegistered:Z

    if-nez v0, :cond_0

    .line 118
    :goto_0
    return-void

    .line 101
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 110
    :goto_1
    :try_start_1
    iget-object v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 117
    :goto_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->receiversRegistered:Z

    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    goto :goto_2

    .line 103
    :catch_1
    move-exception v0

    goto :goto_1
.end method
