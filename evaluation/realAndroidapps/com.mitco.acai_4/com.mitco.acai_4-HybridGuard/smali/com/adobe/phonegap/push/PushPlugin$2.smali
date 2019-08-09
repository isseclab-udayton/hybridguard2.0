.class Lcom/adobe/phonegap/push/PushPlugin$2;
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
.method constructor <init>(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    iput-object p2, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->val$data:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 137
    :try_start_0
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v5}, Lcom/adobe/phonegap/push/PushPlugin;->access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;

    move-result-object v5

    const-string v6, "com.adobe.phonegap.push"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 138
    .local v2, "sharedPref":Landroid/content/SharedPreferences;
    const-string v5, "registrationId"

    const-string v6, ""

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "token":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->val$data:Lorg/json/JSONArray;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    .line 140
    .local v4, "topics":Lorg/json/JSONArray;
    if-eqz v4, :cond_0

    const-string v5, ""

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 141
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v5, v4, v3}, Lcom/adobe/phonegap/push/PushPlugin;->access$5(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Ljava/lang/String;)V

    .line 157
    :goto_0
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v5}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 162
    .end local v2    # "sharedPref":Landroid/content/SharedPreferences;
    .end local v3    # "token":Ljava/lang/String;
    .end local v4    # "topics":Lorg/json/JSONArray;
    :goto_1
    return-void

    .line 143
    .restart local v2    # "sharedPref":Landroid/content/SharedPreferences;
    .restart local v3    # "token":Ljava/lang/String;
    .restart local v4    # "topics":Lorg/json/JSONArray;
    :cond_0
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->this$0:Lcom/adobe/phonegap/push/PushPlugin;

    invoke-static {v5}, Lcom/adobe/phonegap/push/PushPlugin;->access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/iid/InstanceID;->deleteInstanceID()V

    .line 144
    const-string v5, "PushPlugin"

    const-string v6, "UNREGISTER"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 148
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v5, "sound"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 149
    const-string v5, "vibrate"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 150
    const-string v5, "clearNotifications"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 151
    const-string v5, "forceShow"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 152
    const-string v5, "senderID"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 153
    const-string v5, "registrationId"

    invoke-interface {v1, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 154
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 158
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "sharedPref":Landroid/content/SharedPreferences;
    .end local v3    # "token":Ljava/lang/String;
    .end local v4    # "topics":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Ljava/io/IOException;
    const-string v5, "PushPlugin"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "execute: Got JSON Exception "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v5, p0, Lcom/adobe/phonegap/push/PushPlugin$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1
.end method
