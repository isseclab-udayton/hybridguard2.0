.class public Lcom/arellomobile/android/push/PushGCMIntentService;
.super Lcom/google/android/gcm/GCMBaseIntentService;
.source "PushGCMIntentService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GCMIntentService"


# instance fields
.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/google/android/gcm/GCMBaseIntentService;-><init>()V

    .line 38
    sget-object v0, Lcom/arellomobile/android/push/PushManager;->mSenderId:Ljava/lang/String;

    .line 39
    .local v0, "senderId":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 41
    const-string v0, ""

    .line 43
    :cond_0
    iput-object v0, p0, Lcom/arellomobile/android/push/PushGCMIntentService;->mSenderId:Ljava/lang/String;

    .line 44
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/arellomobile/android/push/PushGCMIntentService;->mHandler:Landroid/os/Handler;

    .line 45
    return-void
.end method

.method private static generateBroadcast(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 182
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 183
    .local v0, "broadcastIntent":Landroid/content/Intent;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".action.PUSH_MESSAGE_RECEIVE"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 184
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 186
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 188
    .local v1, "dataObject":Lorg/json/JSONObject;
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 189
    .local v3, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 213
    const-string v4, "pw_data_json_string"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 215
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ".permission.C2D_MESSAGE"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 216
    return-void

    .line 189
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 191
    .local v2, "key":Ljava/lang/String;
    const-string v5, "u"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 195
    :try_start_0
    const-string v5, "userdata"

    const-string v6, "u"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 205
    :cond_1
    :goto_1
    :try_start_1
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 207
    :catch_0
    move-exception v5

    goto :goto_0

    .line 197
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method private static generateNotification(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Handler;)V
    .locals 17
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 92
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 93
    .local v3, "extras":Landroid/os/Bundle;
    if-nez v3, :cond_0

    .line 178
    :goto_0
    return-void

    .line 98
    :cond_0
    const-string v2, "foreground"

    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/GeneralUtils;->isAppOnForeground(Landroid/content/Context;)Z

    move-result v6

    invoke-virtual {v3, v2, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 99
    const-string v6, "onStart"

    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/GeneralUtils;->isAppOnForeground(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v3, v6, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 101
    const-string v2, "title"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 102
    .local v5, "message":Ljava/lang/String;
    const-string v2, "header"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 103
    .local v4, "header":Ljava/lang/String;
    const-string v2, "l"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 107
    .local v11, "link":Ljava/lang/String;
    if-eqz v11, :cond_6

    .line 110
    new-instance v15, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v15, v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 111
    .local v15, "notifyIntent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v15, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 122
    :goto_2
    if-nez v4, :cond_2

    .line 124
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v8

    .line 125
    .local v8, "appName":Ljava/lang/CharSequence;
    if-nez v8, :cond_1

    .line 127
    const-string v8, ""

    .line 130
    :cond_1
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 133
    .end local v8    # "appName":Ljava/lang/CharSequence;
    :cond_2
    const-string v2, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/NotificationManager;

    .line 138
    .local v12, "manager":Landroid/app/NotificationManager;
    const-string v2, "b"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 142
    .local v9, "bannerUrl":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v6, "notification"

    const-string v7, "layout"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v2, v6, v7, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 144
    .local v10, "layoutId":I
    if-eqz v10, :cond_7

    if-eqz v9, :cond_7

    .line 147
    new-instance v1, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;

    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getSoundType(Landroid/content/Context;)Lcom/arellomobile/android/push/preference/SoundType;

    move-result-object v6

    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getVibrateType(Landroid/content/Context;)Lcom/arellomobile/android/push/preference/VibrateType;

    move-result-object v7

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;-><init>(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Lcom/arellomobile/android/push/preference/SoundType;Lcom/arellomobile/android/push/preference/VibrateType;)V

    .line 155
    .local v1, "notificationFactory":Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
    :goto_3
    invoke-virtual {v1}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->generateNotification()V

    .line 156
    invoke-virtual {v1}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->addSoundAndVibrate()V

    .line 157
    invoke-virtual {v1}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->addCancel()V

    .line 159
    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getEnableLED(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 160
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->addLED(Z)V

    .line 162
    :cond_3
    invoke-virtual {v1}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getNotification()Landroid/app/Notification;

    move-result-object v14

    .line 164
    .local v14, "notification":Landroid/app/Notification;
    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getMessageId(Landroid/content/Context;)I

    move-result v13

    .line 165
    .local v13, "messageId":I
    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getMultiMode(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 167
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->setMessageId(Landroid/content/Context;I)V

    .line 171
    :cond_4
    const/high16 v2, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v13, v15, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 170
    iput-object v2, v14, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 173
    invoke-virtual {v12, v13, v14}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 175
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/arellomobile/android/push/PushGCMIntentService;->generateBroadcast(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 177
    const-string v2, "p"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/arellomobile/android/push/DeviceFeature2_5;->sendMessageDeliveryEvent(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 99
    .end local v1    # "notificationFactory":Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
    .end local v4    # "header":Ljava/lang/String;
    .end local v5    # "message":Ljava/lang/String;
    .end local v9    # "bannerUrl":Ljava/lang/String;
    .end local v10    # "layoutId":I
    .end local v11    # "link":Ljava/lang/String;
    .end local v12    # "manager":Landroid/app/NotificationManager;
    .end local v13    # "messageId":I
    .end local v14    # "notification":Landroid/app/Notification;
    .end local v15    # "notifyIntent":Landroid/content/Intent;
    :cond_5
    const/4 v2, 0x1

    goto/16 :goto_1

    .line 115
    .restart local v4    # "header":Ljava/lang/String;
    .restart local v5    # "message":Ljava/lang/String;
    .restart local v11    # "link":Ljava/lang/String;
    :cond_6
    new-instance v15, Landroid/content/Intent;

    const-class v2, Lcom/arellomobile/android/push/PushHandlerActivity;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 116
    .restart local v15    # "notifyIntent":Landroid/content/Intent;
    const/high16 v2, 0x24000000

    invoke-virtual {v15, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 119
    const-string v2, "pushBundle"

    invoke-virtual {v15, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto/16 :goto_2

    .line 152
    .restart local v9    # "bannerUrl":Ljava/lang/String;
    .restart local v10    # "layoutId":I
    .restart local v12    # "manager":Landroid/app/NotificationManager;
    :cond_7
    new-instance v1, Lcom/arellomobile/android/push/utils/notification/SimpleNotificationFactory;

    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getSoundType(Landroid/content/Context;)Lcom/arellomobile/android/push/preference/SoundType;

    move-result-object v6

    .line 153
    invoke-static/range {p0 .. p0}, Lcom/arellomobile/android/push/utils/PreferenceUtils;->getVibrateType(Landroid/content/Context;)Lcom/arellomobile/android/push/preference/VibrateType;

    move-result-object v7

    move-object/from16 v2, p0

    .line 152
    invoke-direct/range {v1 .. v7}, Lcom/arellomobile/android/push/utils/notification/SimpleNotificationFactory;-><init>(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Lcom/arellomobile/android/push/preference/SoundType;Lcom/arellomobile/android/push/preference/VibrateType;)V

    .line 151
    .restart local v1    # "notificationFactory":Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
    goto :goto_3
.end method


# virtual methods
.method protected onDeletedMessages(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "total"    # I

    .prologue
    .line 72
    const-string v0, "GCMIntentService"

    const-string v1, "Received deleted messages notification"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void
.end method

.method protected onError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorId"    # Ljava/lang/String;

    .prologue
    .line 78
    const-string v0, "GCMIntentService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Messaging registration error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-static {p1, p2}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onRegisterError(Landroid/content/Context;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method protected onMessage(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 64
    const-string v0, "GCMIntentService"

    const-string v1, "Received message"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    iget-object v0, p0, Lcom/arellomobile/android/push/PushGCMIntentService;->mHandler:Landroid/os/Handler;

    invoke-static {p1, p2, v0}, Lcom/arellomobile/android/push/PushGCMIntentService;->generateNotification(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Handler;)V

    .line 67
    return-void
.end method

.method protected onRecoverableError(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorId"    # Ljava/lang/String;

    .prologue
    .line 86
    const-string v0, "GCMIntentService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Received recoverable error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-super {p0, p1, p2}, Lcom/google/android/gcm/GCMBaseIntentService;->onRecoverableError(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected onRegistered(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 50
    const-string v0, "GCMIntentService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Device registered: regId = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    invoke-static {p1, p2}, Lcom/arellomobile/android/push/DeviceRegistrar;->registerWithServer(Landroid/content/Context;Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method protected onUnregistered(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v0, "GCMIntentService"

    const-string v1, "Device unregistered"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-static {p1, p2}, Lcom/arellomobile/android/push/DeviceRegistrar;->unregisterWithServer(Landroid/content/Context;Ljava/lang/String;)V

    .line 59
    return-void
.end method
