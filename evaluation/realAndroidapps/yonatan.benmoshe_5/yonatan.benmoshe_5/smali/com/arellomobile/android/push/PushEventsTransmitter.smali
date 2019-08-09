.class public Lcom/arellomobile/android/push/PushEventsTransmitter;
.super Ljava/lang/Object;
.source "PushEventsTransmitter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getUseBroadcast(Landroid/content/Context;)Z
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 23
    const/4 v0, 0x0

    .line 25
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 26
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 27
    .local v2, "metaData":Landroid/os/Bundle;
    if-eqz v2, :cond_0

    .line 29
    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v6, "PW_BROADCAST_REGISTRATION"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 30
    .local v3, "useBroadcast":Z
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Using broadcast registration: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .end local v2    # "metaData":Landroid/os/Bundle;
    .end local v3    # "useBroadcast":Z
    :goto_0
    return v3

    .restart local v2    # "metaData":Landroid/os/Bundle;
    :cond_0
    move v3, v4

    .line 34
    goto :goto_0

    .line 36
    .end local v2    # "metaData":Landroid/os/Bundle;
    :catch_0
    move-exception v1

    .line 37
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move v3, v4

    .line 38
    goto :goto_0
.end method

.method static onMessageReceive(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->onMessageReceive(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 131
    return-void
.end method

.method static onMessageReceive(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "pushBundle"    # Landroid/os/Bundle;

    .prologue
    .line 135
    const-string v0, "PUSH_RECEIVE_EVENT"

    invoke-static {p0, p1, v0, p2}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 136
    return-void
.end method

.method static onRegisterError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "errorId"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-static {p0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->getUseBroadcast(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    const-string v0, "REGISTER_ERROR_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmitBroadcast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    :goto_0
    return-void

    .line 81
    :cond_0
    const-string v0, "REGISTER_ERROR_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static onRegistered(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-static {p0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->getUseBroadcast(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    const-string v0, "REGISTER_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmitBroadcast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    :goto_0
    return-void

    .line 68
    :cond_0
    const-string v0, "REGISTER_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static onUnregistered(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-static {p0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->getUseBroadcast(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    const-string v0, "UNREGISTER_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmitBroadcast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :goto_0
    return-void

    .line 112
    :cond_0
    const-string v0, "UNREGISTER_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static onUnregisteredError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "errorId"    # Ljava/lang/String;

    .prologue
    .line 118
    invoke-static {p0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->getUseBroadcast(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    const-string v0, "UNREGISTER_ERROR_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmitBroadcast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    const-string v0, "UNREGISTER_ERROR_EVENT"

    invoke-static {p0, p1, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "stringToShow"    # Ljava/lang/String;
    .param p2, "messageKey"    # Ljava/lang/String;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/arellomobile/android/push/PushEventsTransmitter;->transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 45
    return-void
.end method

.method private static transmit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "stringToShow"    # Ljava/lang/String;
    .param p2, "messageKey"    # Ljava/lang/String;
    .param p3, "pushBundle"    # Landroid/os/Bundle;

    .prologue
    .line 49
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/arellomobile/android/push/MessageActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 51
    .local v0, "notifyIntent":Landroid/content/Intent;
    if-eqz p3, :cond_0

    .line 52
    invoke-virtual {v0, p3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 54
    :cond_0
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 56
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    return-void
.end method

.method private static transmitBroadcast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;
    .param p2, "registerEvent"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "packageName":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "com.arellomobile.android.push.REGISTER_BROAD_CAST_ACTION"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 89
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 92
    invoke-static {p0}, Lcom/arellomobile/android/push/utils/GeneralUtils;->checkStickyBroadcastPermissions(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendStickyBroadcast(Landroid/content/Intent;)V

    .line 101
    :goto_0
    return-void

    .line 98
    :cond_0
    const-class v2, Lcom/arellomobile/android/push/PushEventsTransmitter;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "No android.permission.BROADCAST_STICKY. Reverting to simple broadcast"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method
