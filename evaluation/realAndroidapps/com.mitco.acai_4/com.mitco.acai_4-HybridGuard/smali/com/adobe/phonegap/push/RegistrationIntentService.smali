.class public Lcom/adobe/phonegap/push/RegistrationIntentService;
.super Landroid/app/IntentService;
.source "RegistrationIntentService.java"

# interfaces
.implements Lcom/adobe/phonegap/push/PushConstants;


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "PushPlugin_RegistrationIntentService"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    const-string v0, "PushPlugin_RegistrationIntentService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 21
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 25
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/RegistrationIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "com.adobe.phonegap.push"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 28
    .local v4, "sharedPreferences":Landroid/content/SharedPreferences;
    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v2

    .line 29
    .local v2, "instanceID":Lcom/google/android/gms/iid/InstanceID;
    const-string v6, "senderID"

    const-string v7, ""

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 31
    .local v3, "senderID":Ljava/lang/String;
    const-string v6, "GCM"

    const/4 v7, 0x0

    .line 30
    invoke-virtual {v2, v3, v6, v7}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v5

    .line 32
    .local v5, "token":Ljava/lang/String;
    const-string v6, "PushPlugin_RegistrationIntentService"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "new GCM Registration Token: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 36
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "registrationId"

    invoke-interface {v1, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 37
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "instanceID":Lcom/google/android/gms/iid/InstanceID;
    .end local v3    # "senderID":Ljava/lang/String;
    .end local v5    # "token":Ljava/lang/String;
    :goto_0
    return-void

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "PushPlugin_RegistrationIntentService"

    const-string v7, "Failed to complete token refresh"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
