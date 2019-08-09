.class public Lorg/apache/cordova/Notification;
.super Lorg/apache/cordova/api/Plugin;
.source "Notification.java"


# instance fields
.field public confirmResult:I

.field public progressDialog:Landroid/app/ProgressDialog;

.field public spinnerDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/cordova/Notification;->confirmResult:I

    .line 41
    iput-object v1, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 42
    iput-object v1, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    .line 48
    return-void
.end method


# virtual methods
.method public declared-synchronized activityStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 282
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    .line 283
    iget-object v1, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 284
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 286
    :cond_0
    move-object v2, p0

    .line 287
    .local v2, "notification":Lorg/apache/cordova/Notification;
    iget-object v3, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 288
    .local v3, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    new-instance v0, Lorg/apache/cordova/Notification$3;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/Notification$3;-><init>(Lorg/apache/cordova/Notification;Lorg/apache/cordova/Notification;Lorg/apache/cordova/api/CordovaInterface;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1, v0}, Lorg/apache/cordova/api/CordovaInterface;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    monitor-exit p0

    return-void

    .line 282
    .end local v0    # "runnable":Ljava/lang/Runnable;
    .end local v2    # "notification":Lorg/apache/cordova/Notification;
    .end local v3    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized activityStop()V
    .locals 1

    .prologue
    .line 305
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 307
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/Notification;->spinnerDialog:Landroid/app/ProgressDialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    :cond_0
    monitor-exit p0

    return-void

    .line 305
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "buttonLabel"    # Ljava/lang/String;
    .param p4, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 187
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 188
    .local v2, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    move-object v6, p0

    .line 190
    .local v6, "notification":Lorg/apache/cordova/Notification;
    new-instance v0, Lorg/apache/cordova/Notification$1;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lorg/apache/cordova/Notification$1;-><init>(Lorg/apache/cordova/Notification;Lorg/apache/cordova/api/CordovaInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/Notification;Ljava/lang/String;)V

    .line 208
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1, v0}, Lorg/apache/cordova/api/CordovaInterface;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    monitor-exit p0

    return-void

    .line 187
    .end local v0    # "runnable":Ljava/lang/Runnable;
    .end local v2    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    .end local v6    # "notification":Lorg/apache/cordova/Notification;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public beep(J)V
    .locals 10
    .param p1, "count"    # J

    .prologue
    const-wide/16 v8, 0x64

    .line 145
    const/4 v6, 0x2

    invoke-static {v6}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v3

    .line 146
    .local v3, "ringtone":Landroid/net/Uri;
    iget-object v6, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v3}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v2

    .line 149
    .local v2, "notification":Landroid/media/Ringtone;
    if-eqz v2, :cond_1

    .line 150
    const-wide/16 v0, 0x0

    .local v0, "i":J
    :goto_0
    cmp-long v6, v0, p1

    if-gez v6, :cond_1

    .line 151
    invoke-virtual {v2}, Landroid/media/Ringtone;->play()V

    .line 152
    const-wide/16 v4, 0x1388

    .line 153
    .local v4, "timeout":J
    :goto_1
    invoke-virtual {v2}, Landroid/media/Ringtone;->isPlaying()Z

    move-result v6

    if-eqz v6, :cond_0

    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_0

    .line 154
    sub-long/2addr v4, v8

    .line 156
    const-wide/16 v6, 0x64

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 157
    :catch_0
    move-exception v6

    goto :goto_1

    .line 150
    :cond_0
    const-wide/16 v6, 0x1

    add-long/2addr v0, v6

    goto :goto_0

    .line 162
    .end local v0    # "i":J
    .end local v4    # "timeout":J
    :cond_1
    return-void
.end method

.method public declared-synchronized confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "buttonLabels"    # Ljava/lang/String;
    .param p4, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 223
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 224
    .local v2, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    move-object v6, p0

    .line 225
    .local v6, "notification":Lorg/apache/cordova/Notification;
    const-string v1, ","

    invoke-virtual {p3, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 227
    .local v5, "fButtons":[Ljava/lang/String;
    new-instance v0, Lorg/apache/cordova/Notification$2;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lorg/apache/cordova/Notification$2;-><init>(Lorg/apache/cordova/Notification;Lorg/apache/cordova/api/CordovaInterface;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lorg/apache/cordova/Notification;Ljava/lang/String;)V

    .line 272
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1, v0}, Lorg/apache/cordova/api/CordovaInterface;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    monitor-exit p0

    return-void

    .line 223
    .end local v0    # "runnable":Ljava/lang/Runnable;
    .end local v2    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    .end local v5    # "fButtons":[Ljava/lang/String;
    .end local v6    # "notification":Lorg/apache/cordova/Notification;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 59
    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 60
    .local v3, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v2, ""

    .line 63
    .local v2, "result":Ljava/lang/String;
    :try_start_0
    const-string v4, "beep"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 64
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/Notification;->beep(J)V

    .line 96
    :cond_0
    :goto_0
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v1, v3, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 98
    :goto_1
    return-object v1

    .line 66
    :cond_1
    const-string v4, "vibrate"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 67
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/Notification;->vibrate(J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 69
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    const-string v4, "alert"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 70
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6, p3}, Lorg/apache/cordova/Notification;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 72
    .local v1, "r":Lorg/apache/cordova/api/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_1

    .line 75
    .end local v1    # "r":Lorg/apache/cordova/api/PluginResult;
    :cond_3
    const-string v4, "confirm"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 76
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6, p3}, Lorg/apache/cordova/Notification;->confirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 78
    .restart local v1    # "r":Lorg/apache/cordova/api/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    goto :goto_1

    .line 81
    .end local v1    # "r":Lorg/apache/cordova/api/PluginResult;
    :cond_4
    const-string v4, "activityStart"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 82
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/Notification;->activityStart(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 84
    :cond_5
    const-string v4, "activityStop"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 85
    invoke-virtual {p0}, Lorg/apache/cordova/Notification;->activityStop()V

    goto/16 :goto_0

    .line 87
    :cond_6
    const-string v4, "progressStart"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 88
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/Notification;->progressStart(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 90
    :cond_7
    const-string v4, "progressValue"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 91
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/apache/cordova/Notification;->progressValue(I)V

    goto/16 :goto_0

    .line 93
    :cond_8
    const-string v4, "progressStop"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 94
    invoke-virtual {p0}, Lorg/apache/cordova/Notification;->progressStop()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public isSynch(Ljava/lang/String;)Z
    .locals 2
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 109
    const-string v1, "alert"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 131
    :cond_0
    :goto_0
    return v0

    .line 112
    :cond_1
    const-string v1, "confirm"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 115
    const-string v1, "activityStart"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 118
    const-string v1, "activityStop"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 121
    const-string v1, "progressStart"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 124
    const-string v1, "progressValue"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 127
    const-string v1, "progressStop"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 131
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized progressStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 318
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    .line 319
    iget-object v1, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 320
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    .line 322
    :cond_0
    move-object v2, p0

    .line 323
    .local v2, "notification":Lorg/apache/cordova/Notification;
    iget-object v3, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 324
    .local v3, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    new-instance v0, Lorg/apache/cordova/Notification$4;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/Notification$4;-><init>(Lorg/apache/cordova/Notification;Lorg/apache/cordova/Notification;Lorg/apache/cordova/api/CordovaInterface;Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1, v0}, Lorg/apache/cordova/api/CordovaInterface;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 343
    monitor-exit p0

    return-void

    .line 318
    .end local v0    # "runnable":Ljava/lang/Runnable;
    .end local v2    # "notification":Lorg/apache/cordova/Notification;
    .end local v3    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized progressStop()V
    .locals 1

    .prologue
    .line 360
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 361
    iget-object v0, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 362
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 364
    :cond_0
    monitor-exit p0

    return-void

    .line 360
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized progressValue(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 351
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lorg/apache/cordova/Notification;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setProgress(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 354
    :cond_0
    monitor-exit p0

    return-void

    .line 351
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public vibrate(J)V
    .locals 3
    .param p1, "time"    # J

    .prologue
    .line 171
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    .line 172
    const-wide/16 p1, 0x1f4

    .line 174
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/Notification;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    const-string v2, "vibrator"

    invoke-interface {v1, v2}, Lorg/apache/cordova/api/CordovaInterface;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 175
    .local v0, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 176
    return-void
.end method
