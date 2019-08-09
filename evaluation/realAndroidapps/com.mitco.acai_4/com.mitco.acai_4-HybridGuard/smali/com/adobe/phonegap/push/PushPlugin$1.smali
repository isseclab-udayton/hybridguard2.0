.class Lcom/adobe/phonegap/push/PushPlugin$1;
.super Ljava/lang/Object;
.source "PushPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/phonegap/push/PushPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/phonegap/push/PushPlugin;

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field private final synthetic val$data:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/adobe/phonegap/push/PushPlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    iput-object p2, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p3, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$data:Lorg/json/JSONArray;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    .line 51
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->access$0(Lorg/apache/cordova/CallbackContext;)V

    .line 52
    const/4 v2, 0x0

    .line 54
    .local v2, "jo":Lorg/json/JSONObject;
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "execute: data="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$data:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;

    move-result-object v10

    const-string v11, "com.adobe.phonegap.push"

    invoke-virtual {v10, v11, v13}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 56
    .local v7, "sharedPref":Landroid/content/SharedPreferences;
    const/4 v8, 0x0

    .line 57
    .local v8, "token":Ljava/lang/String;
    const/4 v6, 0x0

    .line 60
    .local v6, "senderID":Ljava/lang/String;
    :try_start_0
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$data:Lorg/json/JSONArray;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "android"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 62
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "execute: jo="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const-string v10, "senderID"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 66
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "execute: senderID="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-string v10, "senderID"

    const-string v11, ""

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 69
    .local v5, "savedSenderID":Ljava/lang/String;
    const-string v10, "registrationId"

    const-string v11, ""

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 72
    .local v4, "savedRegID":Ljava/lang/String;
    const-string v10, ""

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 73
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v10

    const-string v11, "GCM"

    invoke-virtual {v10, v6, v11}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 84
    :goto_0
    const-string v10, ""

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 85
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    const-string v11, "registrationId"

    invoke-virtual {v10, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    .line 87
    .local v3, "json":Lorg/json/JSONObject;
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "onRegistered: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const-string v10, "topics"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 90
    .local v9, "topics":Lorg/json/JSONArray;
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v10, v9, v8}, Lcom/adobe/phonegap/push/PushPlugin;->access$2(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Ljava/lang/String;)V

    .line 92
    invoke-static {v3}, Lcom/adobe/phonegap/push/PushPlugin;->sendEvent(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 105
    .end local v3    # "json":Lorg/json/JSONObject;
    .end local v4    # "savedRegID":Ljava/lang/String;
    .end local v5    # "savedSenderID":Ljava/lang/String;
    .end local v9    # "topics":Lorg/json/JSONArray;
    :goto_1
    if-eqz v2, :cond_0

    .line 106
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 108
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    :try_start_1
    const-string v10, "icon"

    const-string v11, "icon"

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 113
    :goto_2
    :try_start_2
    const-string v10, "iconColor"

    const-string v11, "iconColor"

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3

    .line 117
    :goto_3
    const-string v10, "sound"

    const-string v11, "sound"

    invoke-virtual {v2, v11, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 118
    const-string v10, "vibrate"

    const-string v11, "vibrate"

    invoke-virtual {v2, v11, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 119
    const-string v10, "clearNotifications"

    const-string v11, "clearNotifications"

    invoke-virtual {v2, v11, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 120
    const-string v10, "forceShow"

    const-string v11, "forceShow"

    invoke-virtual {v2, v11, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-interface {v1, v10, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 121
    const-string v10, "senderID"

    invoke-interface {v1, v10, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 122
    const-string v10, "registrationId"

    invoke-interface {v1, v10, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 123
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 126
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    invoke-static {}, Lcom/adobe/phonegap/push/PushPlugin;->access$3()Landroid/os/Bundle;

    move-result-object v10

    if-eqz v10, :cond_1

    .line 127
    const-string v10, "PushPlugin"

    const-string v11, "sending cached extras"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-static {}, Lcom/adobe/phonegap/push/PushPlugin;->access$3()Landroid/os/Bundle;

    move-result-object v10

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->sendExtras(Landroid/os/Bundle;)V

    .line 129
    const/4 v10, 0x0

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->access$4(Landroid/os/Bundle;)V

    .line 131
    :cond_1
    :goto_4
    return-void

    .line 76
    .restart local v4    # "savedRegID":Ljava/lang/String;
    .restart local v5    # "savedSenderID":Ljava/lang/String;
    :cond_2
    :try_start_3
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 77
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v10}, Lcom/adobe/phonegap/push/PushPlugin;->access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v10

    const-string v11, "GCM"

    invoke-virtual {v10, v6, v11}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 78
    goto/16 :goto_0

    .line 81
    :cond_3
    const-string v10, "registrationId"

    const-string v11, ""

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 94
    :cond_4
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v11, "Empty registration ID received from GCM"

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    .line 97
    .end local v4    # "savedRegID":Ljava/lang/String;
    .end local v5    # "savedSenderID":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Lorg/json/JSONException;
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "execute: Got JSON Exception "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 100
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 101
    .local v0, "e":Ljava/io/IOException;
    const-string v10, "PushPlugin"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "execute: Got JSON Exception "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v10, p0, Lcom/adobe/phonegap/push/PushPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 109
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :catch_2
    move-exception v0

    .line 110
    .local v0, "e":Lorg/json/JSONException;
    const-string v10, "PushPlugin"

    const-string v11, "no icon option"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 114
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v0

    .line 115
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v10, "PushPlugin"

    const-string v11, "no iconColor option"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method
