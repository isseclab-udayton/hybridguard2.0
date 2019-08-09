.class public Lcom/adobe/phonegap/push/GCMIntentService;
.super Lcom/google/android/gms/gcm/GcmListenerService;
.source "GCMIntentService.java"

# interfaces
.implements Lcom/adobe/phonegap/push/PushConstants;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "PushPlugin_GCMIntentService"

.field private static messageMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/phonegap/push/GCMIntentService;->messageMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/google/android/gms/gcm/GcmListenerService;-><init>()V

    return-void
.end method

.method private createActions(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;Landroid/content/res/Resources;Ljava/lang/String;)V
    .locals 9
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;
    .param p3, "resources"    # Landroid/content/res/Resources;
    .param p4, "packageName"    # Ljava/lang/String;

    .prologue
    .line 331
    const-string v6, "PushPlugin_GCMIntentService"

    const-string v7, "create actions"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    const-string v6, "actions"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 333
    .local v1, "actions":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 335
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 336
    .local v2, "actionsArray":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v3, v6, :cond_1

    .line 352
    .end local v2    # "actionsArray":Lorg/json/JSONArray;
    .end local v3    # "i":I
    :cond_0
    :goto_1
    return-void

    .line 337
    .restart local v2    # "actionsArray":Lorg/json/JSONArray;
    .restart local v3    # "i":I
    :cond_1
    const-string v6, "PushPlugin_GCMIntentService"

    const-string v7, "adding action"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 339
    .local v0, "action":Lorg/json/JSONObject;
    const-string v6, "PushPlugin_GCMIntentService"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "adding callback = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "callback"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    new-instance v4, Landroid/content/Intent;

    const-class v6, Lcom/adobe/phonegap/push/PushHandlerActivity;

    invoke-direct {v4, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 341
    .local v4, "intent":Landroid/content/Intent;
    const-string v6, "callback"

    const-string v7, "callback"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 342
    const-string v6, "pushBundle"

    invoke-virtual {v4, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 343
    const/high16 v6, 0x8000000

    invoke-static {p0, v3, v4, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 345
    .local v5, "pIntent":Landroid/app/PendingIntent;
    const-string v6, "icon"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "drawable"

    invoke-virtual {p3, v6, v7, p4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 346
    const-string v7, "title"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 345
    invoke-virtual {p2, v6, v7, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 336
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 348
    .end local v0    # "action":Lorg/json/JSONObject;
    .end local v2    # "actionsArray":Lorg/json/JSONArray;
    .end local v3    # "i":I
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "pIntent":Landroid/app/PendingIntent;
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method private static getAppName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 590
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 591
    .local v0, "appName":Ljava/lang/CharSequence;
    check-cast v0, Ljava/lang/String;

    .end local v0    # "appName":Ljava/lang/CharSequence;
    return-object v0
.end method

.method private normalizeExtras(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 17
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 135
    const-string v14, "PushPlugin_GCMIntentService"

    const-string v15, "normalize extras"

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-virtual/range {p1 .. p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 137
    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 139
    .local v10, "newExtras":Landroid/os/Bundle;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_1

    .line 191
    return-object v10

    .line 140
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 142
    .local v9, "key":Ljava/lang/String;
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "key = "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const-string v14, "data"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_2

    const-string v14, "message"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 147
    :cond_2
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 149
    .local v6, "json":Ljava/lang/Object;
    instance-of v14, v6, Ljava/lang/String;

    if-eqz v14, :cond_4

    move-object v14, v6

    check-cast v14, Ljava/lang/String;

    const-string v15, "{"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 150
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "extracting nested message data from key = "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    check-cast v6, Ljava/lang/String;

    .end local v6    # "json":Ljava/lang/Object;
    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 154
    .local v2, "data":Lorg/json/JSONObject;
    const-string v14, "alert"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    const-string v14, "message"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    const-string v14, "body"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    const-string v14, "title"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 155
    :cond_3
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 156
    .local v7, "jsonIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v14

    if-nez v14, :cond_5

    .line 185
    .end local v2    # "data":Lorg/json/JSONObject;
    .end local v7    # "jsonIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->normalizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 186
    .local v11, "newKey":Ljava/lang/String;
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "replace key "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " with "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v9, v11, v1, v10}, Lcom/adobe/phonegap/push/GCMIntentService;->replaceKey(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 157
    .end local v11    # "newKey":Ljava/lang/String;
    .restart local v2    # "data":Lorg/json/JSONObject;
    .restart local v7    # "jsonIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_5
    :try_start_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 159
    .local v8, "jsonKey":Ljava/lang/String;
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "key = data/"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 162
    .local v13, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/adobe/phonegap/push/GCMIntentService;->normalizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 163
    invoke-virtual {v10, v8, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 166
    .end local v2    # "data":Lorg/json/JSONObject;
    .end local v7    # "jsonIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "jsonKey":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 167
    .local v3, "e":Lorg/json/JSONException;
    const-string v14, "PushPlugin_GCMIntentService"

    const-string v15, "normalizeExtras: JSON exception"

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 170
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_6
    const-string v14, "notification"

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 171
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v13

    .line 172
    .local v13, "value":Landroid/os/Bundle;
    invoke-virtual {v13}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 173
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 174
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 176
    .local v12, "notifkey":Ljava/lang/String;
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "notifkey = "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/phonegap/push/GCMIntentService;->normalizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 178
    .restart local v11    # "newKey":Ljava/lang/String;
    const-string v14, "PushPlugin_GCMIntentService"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "replace key "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " with "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    invoke-virtual {v13, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v11, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3
.end method

.method private normalizeKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 113
    const-string v0, "body"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "alert"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "gcm.notification.body"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    :cond_0
    const-string v0, "message"

    .line 127
    :goto_0
    return-object v0

    .line 115
    :cond_1
    const-string v0, "msgcnt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "badge"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 116
    :cond_2
    const-string v0, "count"

    goto :goto_0

    .line 117
    :cond_3
    const-string v0, "soundname"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 118
    const-string v0, "sound"

    goto :goto_0

    .line 119
    :cond_4
    const-string v0, "gcm.notification"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 120
    const-string v0, "gcm.notification"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 121
    :cond_5
    const-string v0, "gcm.n."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 122
    const-string v0, "gcm.n."

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 123
    :cond_6
    const-string v0, "com.urbanairship.push"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 124
    const-string v0, "com.urbanairship.push"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 125
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_7
    move-object v0, p1

    .line 127
    goto :goto_0
.end method

.method private parseInt(Ljava/lang/String;Landroid/os/Bundle;)I
    .locals 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 595
    const/4 v1, 0x0

    .line 598
    .local v1, "retval":I
    :try_start_0
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 607
    :goto_0
    return v1

    .line 600
    :catch_0
    move-exception v0

    .line 601
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "PushPlugin_GCMIntentService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Number format exception - Error parsing "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 603
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v0

    .line 604
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "PushPlugin_GCMIntentService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Number format exception - Error parsing "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private replaceKey(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "oldKey"    # Ljava/lang/String;
    .param p2, "newKey"    # Ljava/lang/String;
    .param p3, "extras"    # Landroid/os/Bundle;
    .param p4, "newExtras"    # Landroid/os/Bundle;

    .prologue
    .line 95
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 96
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 97
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 98
    check-cast v0, Ljava/lang/String;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-virtual {p4, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 99
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    .line 100
    check-cast v0, Ljava/lang/Boolean;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p4, p2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 101
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_3

    .line 102
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p4, p2, v2, v3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 104
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_3
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, p2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setNotificationCount(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 2
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 355
    const-string v1, "msgcnt"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 356
    .local v0, "msgcnt":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 357
    const-string v1, "badge"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 359
    :cond_0
    if-eqz v0, :cond_1

    .line 360
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 362
    :cond_1
    return-void
.end method

.method private setNotificationIconColor(Ljava/lang/String;Landroid/support/v4/app/NotificationCompat$Builder;Ljava/lang/String;)V
    .locals 4
    .param p1, "color"    # Ljava/lang/String;
    .param p2, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;
    .param p3, "localIconColor"    # Ljava/lang/String;

    .prologue
    .line 555
    const/4 v1, 0x0

    .line 556
    .local v1, "iconColor":I
    if-eqz p1, :cond_2

    .line 558
    :try_start_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 570
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 571
    invoke-virtual {p2, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 573
    :cond_1
    return-void

    .line 559
    :catch_0
    move-exception v0

    .line 560
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "couldn\'t parse color from android options"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 563
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2
    if-eqz p3, :cond_0

    .line 565
    :try_start_1
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    goto :goto_0

    .line 566
    :catch_1
    move-exception v0

    .line 567
    .restart local v0    # "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "couldn\'t parse color from android options"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setNotificationLargeIcon(Landroid/os/Bundle;Ljava/lang/String;Landroid/content/res/Resources;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 9
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "resources"    # Landroid/content/res/Resources;
    .param p4, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 508
    const-string v7, "image"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 509
    .local v3, "gcmLargeIcon":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 510
    const-string v7, "http://"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "https://"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 511
    :cond_0
    invoke-virtual {p0, v3}, Lcom/adobe/phonegap/push/GCMIntentService;->getBitmapFromURL(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {p4, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 512
    const-string v7, "PushPlugin_GCMIntentService"

    const-string v8, "using remote large-icon from gcm"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    :cond_1
    :goto_0
    return-void

    .line 514
    :cond_2
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/GCMIntentService;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 517
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 518
    .local v4, "istr":Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 519
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p4, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 520
    const-string v7, "PushPlugin_GCMIntentService"

    const-string v8, "using assets large-icon from gcm"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 521
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "istr":Ljava/io/InputStream;
    :catch_0
    move-exception v2

    .line 522
    .local v2, "e":Ljava/io/IOException;
    const/4 v6, 0x0

    .line 523
    .local v6, "largeIconId":I
    const-string v7, "drawable"

    invoke-virtual {p3, v3, v7, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 524
    if-eqz v6, :cond_3

    .line 525
    invoke-static {p3, v6}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 526
    .local v5, "largeIconBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 527
    const-string v7, "PushPlugin_GCMIntentService"

    const-string v8, "using resources large-icon from gcm"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 529
    .end local v5    # "largeIconBitmap":Landroid/graphics/Bitmap;
    :cond_3
    const-string v7, "PushPlugin_GCMIntentService"

    const-string v8, "Not setting large icon"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setNotificationLedColor(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 9
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    const/16 v8, 0x1f4

    .line 473
    const-string v4, "ledColor"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 474
    .local v2, "ledColor":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 476
    const-string v4, "\\["

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\]"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 477
    .local v1, "items":[Ljava/lang/String;
    array-length v4, v1

    new-array v3, v4, [I

    .line 478
    .local v3, "results":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v1

    if-lt v0, v4, :cond_1

    .line 483
    array-length v4, v3

    const/4 v5, 0x4

    if-ne v4, v5, :cond_2

    .line 484
    const/4 v4, 0x0

    aget v4, v3, v4

    const/4 v5, 0x1

    aget v5, v3, v5

    const/4 v6, 0x2

    aget v6, v3, v6

    const/4 v7, 0x3

    aget v7, v3, v7

    invoke-static {v4, v5, v6, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {p2, v4, v8, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 489
    .end local v0    # "i":I
    .end local v1    # "items":[Ljava/lang/String;
    .end local v3    # "results":[I
    :cond_0
    :goto_1
    return-void

    .line 480
    .restart local v0    # "i":I
    .restart local v1    # "items":[Ljava/lang/String;
    .restart local v3    # "results":[I
    :cond_1
    :try_start_0
    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v3, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 478
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 486
    :cond_2
    const-string v4, "PushPlugin_GCMIntentService"

    const-string v5, "ledColor parameter must be an array of length == 4 (ARGB)"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 481
    :catch_0
    move-exception v4

    goto :goto_2
.end method

.method private setNotificationMessage(ILandroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 14
    .param p1, "notId"    # I
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 383
    const-string v12, "message"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 385
    .local v4, "message":Ljava/lang/String;
    const-string v12, "style"

    const-string v13, "text"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 386
    .local v10, "style":Ljava/lang/String;
    const-string v12, "inbox"

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 387
    invoke-virtual {p0, p1, v4}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotification(ILjava/lang/String;)V

    .line 389
    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 391
    sget-object v12, Lcom/adobe/phonegap/push/GCMIntentService;->messageMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 392
    .local v5, "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 393
    .local v7, "sizeList":Ljava/lang/Integer;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v12

    const/4 v13, 0x1

    if-le v12, v13, :cond_3

    .line 394
    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 395
    .local v8, "sizeListMessage":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " more"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 396
    .local v9, "stacking":Ljava/lang/String;
    const-string v12, "summaryText"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 397
    const-string v12, "summaryText"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 398
    const-string v12, "%n%"

    invoke-virtual {v9, v12, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 400
    :cond_0
    new-instance v12, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v12}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    .line 401
    const-string v13, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    move-result-object v12

    .line 402
    invoke-virtual {v12, v9}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    move-result-object v6

    .line 404
    .local v6, "notificationInbox":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v12

    add-int/lit8 v3, v12, -0x1

    .local v3, "i":I
    :goto_0
    if-gez v3, :cond_2

    .line 408
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 453
    .end local v3    # "i":I
    .end local v5    # "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "notificationInbox":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .end local v7    # "sizeList":Ljava/lang/Integer;
    .end local v8    # "sizeListMessage":Ljava/lang/String;
    .end local v9    # "stacking":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 405
    .restart local v3    # "i":I
    .restart local v5    # "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6    # "notificationInbox":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .restart local v7    # "sizeList":Ljava/lang/Integer;
    .restart local v8    # "sizeListMessage":Ljava/lang/String;
    .restart local v9    # "stacking":Ljava/lang/String;
    :cond_2
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v6, v12}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 404
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 410
    .end local v3    # "i":I
    .end local v6    # "notificationInbox":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .end local v8    # "sizeListMessage":Ljava/lang/String;
    .end local v9    # "stacking":Ljava/lang/String;
    :cond_3
    new-instance v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v2}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 411
    .local v2, "bigText":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    if-eqz v4, :cond_1

    .line 412
    invoke-virtual {v2, v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 413
    const-string v12, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 414
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_1

    .line 417
    .end local v2    # "bigText":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    .end local v5    # "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v7    # "sizeList":Ljava/lang/Integer;
    :cond_4
    const-string v12, "picture"

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 418
    const-string v12, ""

    invoke-virtual {p0, p1, v12}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotification(ILjava/lang/String;)V

    .line 420
    new-instance v1, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    invoke-direct {v1}, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;-><init>()V

    .line 421
    .local v1, "bigPicture":Landroid/support/v4/app/NotificationCompat$BigPictureStyle;
    const-string v12, "picture"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lcom/adobe/phonegap/push/GCMIntentService;->getBitmapFromURL(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v12

    invoke-virtual {v1, v12}, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->bigPicture(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    .line 422
    const-string v12, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    .line 423
    const-string v12, "summaryText"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    .line 425
    const-string v12, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 426
    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 428
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_1

    .line 430
    .end local v1    # "bigPicture":Landroid/support/v4/app/NotificationCompat$BigPictureStyle;
    :cond_5
    const-string v12, ""

    invoke-virtual {p0, p1, v12}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotification(ILjava/lang/String;)V

    .line 432
    new-instance v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v2}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 434
    .restart local v2    # "bigText":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    if-eqz v4, :cond_1

    .line 435
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 437
    invoke-virtual {v2, v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 438
    const-string v12, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 440
    const-string v12, "summaryText"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 441
    .local v11, "summaryText":Ljava/lang/String;
    if-eqz v11, :cond_6

    .line 442
    invoke-virtual {v2, v11}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 445
    :cond_6
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_1
.end method

.method private setNotificationPriority(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 5
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 492
    const-string v3, "priority"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 493
    .local v2, "priorityStr":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 495
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 496
    .local v1, "priority":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, -0x2

    if-lt v3, v4, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x2

    if-gt v3, v4, :cond_1

    .line 497
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 505
    .end local v1    # "priority":Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 499
    .restart local v1    # "priority":Ljava/lang/Integer;
    :cond_1
    const-string v3, "PushPlugin_GCMIntentService"

    const-string v4, "Priority parameter must be between -2 and 2"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 501
    .end local v1    # "priority":Ljava/lang/Integer;
    :catch_0
    move-exception v0

    .line 502
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method private setNotificationSmallIcon(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/res/Resources;Landroid/support/v4/app/NotificationCompat$Builder;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "resources"    # Landroid/content/res/Resources;
    .param p5, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;
    .param p6, "localIcon"    # Ljava/lang/String;

    .prologue
    .line 537
    const/4 v1, 0x0

    .line 538
    .local v1, "iconId":I
    const-string v2, "icon"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 539
    .local v0, "icon":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 540
    const-string v2, "drawable"

    invoke-virtual {p4, v0, v2, p3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 541
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "using icon from plugin options"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 548
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "no icon resource found - using application icon"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v1, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 551
    :cond_1
    invoke-virtual {p5, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 552
    return-void

    .line 543
    :cond_2
    if-eqz p6, :cond_0

    .line 544
    const-string v2, "drawable"

    invoke-virtual {p4, p6, v2, p3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 545
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "using icon from plugin options"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setNotificationSound(Landroid/content/Context;Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 456
    const-string v2, "soundname"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 457
    .local v1, "soundname":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 458
    const-string v2, "sound"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 460
    :cond_0
    const-string v2, "ringtone"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 461
    sget-object v2, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    invoke-virtual {p3, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 470
    :goto_0
    return-void

    .line 462
    :cond_1
    if-eqz v1, :cond_2

    const-string v2, "default"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 463
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "android.resource://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 464
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/raw/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 463
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 465
    .local v0, "sound":Landroid/net/Uri;
    const-string v2, "PushPlugin_GCMIntentService"

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    invoke-virtual {p3, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0

    .line 468
    .end local v0    # "sound":Landroid/net/Uri;
    :cond_2
    sget-object v2, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {p3, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0
.end method

.method private setNotificationVibration(Landroid/os/Bundle;Ljava/lang/Boolean;Landroid/support/v4/app/NotificationCompat$Builder;)V
    .locals 7
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "vibrateOption"    # Ljava/lang/Boolean;
    .param p3, "mBuilder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 365
    const-string v4, "vibrationPattern"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 366
    .local v3, "vibrationPattern":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 367
    const-string v4, "\\["

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\]"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 368
    .local v1, "items":[Ljava/lang/String;
    array-length v4, v1

    new-array v2, v4, [J

    .line 369
    .local v2, "results":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v1

    if-lt v0, v4, :cond_1

    .line 374
    invoke-virtual {p3, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setVibrate([J)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 380
    .end local v0    # "i":I
    .end local v1    # "items":[Ljava/lang/String;
    .end local v2    # "results":[J
    :cond_0
    :goto_1
    return-void

    .line 371
    .restart local v0    # "i":I
    .restart local v1    # "items":[Ljava/lang/String;
    .restart local v2    # "results":[J
    :cond_1
    :try_start_0
    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    aput-wide v4, v2, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 369
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 376
    .end local v0    # "i":I
    .end local v1    # "items":[Ljava/lang/String;
    .end local v2    # "results":[J
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 377
    const/4 v4, 0x2

    invoke-virtual {p3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_1

    .line 372
    .restart local v0    # "i":I
    .restart local v1    # "items":[Ljava/lang/String;
    .restart local v2    # "results":[J
    :catch_0
    move-exception v4

    goto :goto_2
.end method

.method private showNotificationIfPossible(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 197
    const-string v3, "message"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 198
    .local v1, "message":Ljava/lang/String;
    const-string v3, "title"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 199
    .local v2, "title":Ljava/lang/String;
    const-string v3, "content-available"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "contentAvailable":Ljava/lang/String;
    const-string v3, "PushPlugin_GCMIntentService"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "message =["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    const-string v3, "PushPlugin_GCMIntentService"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "title =["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v3, "PushPlugin_GCMIntentService"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "contentAvailable =["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 206
    :cond_0
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 208
    :cond_1
    const-string v3, "PushPlugin_GCMIntentService"

    const-string v4, "create notification"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-virtual {p0, p1, p2}, Lcom/adobe/phonegap/push/GCMIntentService;->createNotification(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 213
    :cond_2
    const-string v3, "1"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 214
    const-string v3, "PushPlugin_GCMIntentService"

    const-string v4, "send notification event"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-static {p2}, Lcom/adobe/phonegap/push/PushPlugin;->sendExtras(Landroid/os/Bundle;)V

    .line 217
    :cond_3
    return-void
.end method


# virtual methods
.method public createNotification(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 220
    const-string v4, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/adobe/phonegap/push/GCMIntentService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/app/NotificationManager;

    .line 221
    .local v14, "mNotificationManager":Landroid/app/NotificationManager;
    invoke-static/range {p0 .. p0}, Lcom/adobe/phonegap/push/GCMIntentService;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    .line 222
    .local v11, "appName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 223
    .local v7, "packageName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 225
    .local v8, "resources":Landroid/content/res/Resources;
    const-string v4, "notId"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v4, v1}, Lcom/adobe/phonegap/push/GCMIntentService;->parseInt(Ljava/lang/String;Landroid/os/Bundle;)I

    move-result v15

    .line 226
    .local v15, "notId":I
    new-instance v16, Landroid/content/Intent;

    const-class v4, Lcom/adobe/phonegap/push/PushHandlerActivity;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 227
    .local v16, "notificationIntent":Landroid/content/Intent;
    const/high16 v4, 0x24000000

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 228
    const-string v4, "pushBundle"

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 229
    const-string v4, "notId"

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 231
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v18

    .line 232
    .local v18, "requestCode":I
    const/high16 v4, 0x8000000

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v12

    .line 235
    .local v12, "contentIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 236
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    move-wide/from16 v0, v22

    invoke-virtual {v4, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v4

    .line 237
    const-string v5, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v4

    .line 238
    const-string v5, "title"

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v4

    .line 239
    invoke-virtual {v4, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v4

    .line 240
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v9

    .line 242
    .local v9, "mBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    const-string v4, "com.adobe.phonegap.push"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 243
    .local v17, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "icon"

    const/4 v5, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 244
    .local v10, "localIcon":Ljava/lang/String;
    const-string v4, "iconColor"

    const/4 v5, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 245
    .local v13, "localIconColor":Ljava/lang/String;
    const-string v4, "sound"

    const/4 v5, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    .line 246
    .local v19, "soundOption":Z
    const-string v4, "vibrate"

    const/4 v5, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v20

    .line 247
    .local v20, "vibrateOption":Z
    const-string v4, "PushPlugin_GCMIntentService"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "stored icon="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const-string v4, "PushPlugin_GCMIntentService"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "stored iconColor="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    const-string v4, "PushPlugin_GCMIntentService"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "stored sound="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    const-string v4, "PushPlugin_GCMIntentService"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "stored vibrate="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v4, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationVibration(Landroid/os/Bundle;Ljava/lang/Boolean;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 265
    const-string v4, "color"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v9, v13}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationIconColor(Ljava/lang/String;Landroid/support/v4/app/NotificationCompat$Builder;Ljava/lang/String;)V

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    .line 279
    invoke-direct/range {v4 .. v10}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationSmallIcon(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/res/Resources;Landroid/support/v4/app/NotificationCompat$Builder;Ljava/lang/String;)V

    .line 293
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v7, v8, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationLargeIcon(Landroid/os/Bundle;Ljava/lang/String;Landroid/content/res/Resources;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 298
    if-eqz v19, :cond_0

    .line 299
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationSound(Landroid/content/Context;Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 305
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationLedColor(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 310
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationPriority(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 315
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v15, v1, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationMessage(ILandroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 320
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9}, Lcom/adobe/phonegap/push/GCMIntentService;->setNotificationCount(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;)V

    .line 325
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9, v8, v7}, Lcom/adobe/phonegap/push/GCMIntentService;->createActions(Landroid/os/Bundle;Landroid/support/v4/app/NotificationCompat$Builder;Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 327
    invoke-virtual {v9}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {v14, v11, v15, v4}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 328
    return-void
.end method

.method public getBitmapFromURL(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "strURL"    # Ljava/lang/String;

    .prologue
    .line 577
    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 578
    .local v3, "url":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 579
    .local v0, "connection":Ljava/net/HttpURLConnection;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 580
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 581
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 582
    .local v2, "input":Ljava/io/InputStream;
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 585
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local v2    # "input":Ljava/io/InputStream;
    .end local v3    # "url":Ljava/net/URL;
    :goto_0
    return-object v4

    .line 583
    :catch_0
    move-exception v1

    .line 584
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 585
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public onMessageReceived(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 59
    const-string v2, "PushPlugin_GCMIntentService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onMessage - from: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    if-eqz p2, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "com.adobe.phonegap.push"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 64
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "forceShow"

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 66
    .local v0, "forceShow":Z
    invoke-direct {p0, p2}, Lcom/adobe/phonegap/push/GCMIntentService;->normalizeExtras(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p2

    .line 69
    if-nez v0, :cond_1

    invoke-static {}, Lcom/adobe/phonegap/push/PushPlugin;->isInForeground()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 70
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "foreground"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const-string v2, "foreground"

    invoke-virtual {p2, v2, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 72
    invoke-static {p2}, Lcom/adobe/phonegap/push/PushPlugin;->sendExtras(Landroid/os/Bundle;)V

    .line 89
    .end local v0    # "forceShow":Z
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :cond_0
    :goto_0
    return-void

    .line 75
    .restart local v0    # "forceShow":Z
    .restart local v1    # "prefs":Landroid/content/SharedPreferences;
    :cond_1
    if-eqz v0, :cond_2

    invoke-static {}, Lcom/adobe/phonegap/push/PushPlugin;->isInForeground()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 76
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "foreground force"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const-string v2, "foreground"

    invoke-virtual {p2, v2, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 79
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/adobe/phonegap/push/GCMIntentService;->showNotificationIfPossible(Landroid/content/Context;Landroid/os/Bundle;)V

    goto :goto_0

    .line 83
    :cond_2
    const-string v2, "PushPlugin_GCMIntentService"

    const-string v3, "background"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    const-string v2, "foreground"

    invoke-virtual {p2, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/GCMIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/adobe/phonegap/push/GCMIntentService;->showNotificationIfPossible(Landroid/content/Context;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public setNotification(ILjava/lang/String;)V
    .locals 3
    .param p1, "notId"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 44
    sget-object v1, Lcom/adobe/phonegap/push/GCMIntentService;->messageMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 45
    .local v0, "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .restart local v0    # "messageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v1, Lcom/adobe/phonegap/push/GCMIntentService;->messageMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 55
    :goto_0
    return-void

    .line 53
    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
