.class public Lorg/apache/cordova/CordovaChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "CordovaChromeClient.java"


# instance fields
.field private MAX_QUOTA:J

.field private TAG:Ljava/lang/String;

.field private ctx:Lorg/apache/cordova/DroidGap;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 45
    const-string v0, "CordovaLog"

    iput-object v0, p0, Lorg/apache/cordova/CordovaChromeClient;->TAG:Ljava/lang/String;

    .line 46
    const-wide/32 v0, 0x6400000

    iput-wide v0, p0, Lorg/apache/cordova/CordovaChromeClient;->MAX_QUOTA:J

    .line 55
    check-cast p1, Lorg/apache/cordova/DroidGap;

    .end local p1    # "ctx":Landroid/content/Context;
    iput-object p1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    .line 56
    return-void
.end method


# virtual methods
.method public onConsoleMessage(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I
    .param p3, "sourceID"    # Ljava/lang/String;

    .prologue
    .line 289
    iget-object v0, p0, Lorg/apache/cordova/CordovaChromeClient;->TAG:Ljava/lang/String;

    const-string v1, "%s: Line %d : %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 290
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Ljava/lang/String;ILjava/lang/String;)V

    .line 291
    return-void
.end method

.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 2
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 296
    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p0, Lorg/apache/cordova/CordovaChromeClient;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result v0

    return v0
.end method

.method public onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "databaseIdentifier"    # Ljava/lang/String;
    .param p3, "currentQuota"    # J
    .param p5, "estimatedSize"    # J
    .param p7, "totalUsedQuota"    # J
    .param p9, "quotaUpdater"    # Landroid/webkit/WebStorage$QuotaUpdater;

    .prologue
    .line 268
    iget-object v3, p0, Lorg/apache/cordova/CordovaChromeClient;->TAG:Ljava/lang/String;

    const-string v4, "DroidGap:  onExceededDatabaseQuota estimatedSize: %d  currentQuota: %d  totalUsedQuota: %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static/range {p7 .. p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    iget-wide v3, p0, Lorg/apache/cordova/CordovaChromeClient;->MAX_QUOTA:J

    cmp-long v3, p5, v3

    if-gez v3, :cond_0

    .line 273
    move-wide v1, p5

    .line 274
    .local v1, "newQuota":J
    iget-object v3, p0, Lorg/apache/cordova/CordovaChromeClient;->TAG:Ljava/lang/String;

    const-string v4, "calling quotaUpdater.updateQuota newQuota: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 275
    move-object/from16 v0, p9

    invoke-interface {v0, v1, v2}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    .line 283
    .end local v1    # "newQuota":J
    :goto_0
    return-void

    .line 281
    :cond_0
    move-object/from16 v0, p9

    invoke-interface {v0, p3, p4}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    goto :goto_0
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "callback"    # Landroid/webkit/GeolocationPermissions$Callback;

    .prologue
    .line 309
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 310
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 311
    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    const/4 v3, 0x1

    .line 68
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 69
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 70
    const-string v1, "Alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 72
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 73
    const v1, 0x104000a

    new-instance v2, Lorg/apache/cordova/CordovaChromeClient$1;

    invoke-direct {v2, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$1;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 79
    new-instance v1, Lorg/apache/cordova/CordovaChromeClient$2;

    invoke-direct {v1, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$2;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 85
    new-instance v1, Lorg/apache/cordova/CordovaChromeClient$3;

    invoke-direct {v1, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$3;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 97
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 98
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 99
    return v3
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    const/4 v3, 0x1

    .line 112
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 113
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 114
    const-string v1, "Confirm"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 115
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 116
    const v1, 0x104000a

    new-instance v2, Lorg/apache/cordova/CordovaChromeClient$4;

    invoke-direct {v2, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$4;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 122
    const/high16 v1, 0x1040000

    new-instance v2, Lorg/apache/cordova/CordovaChromeClient$5;

    invoke-direct {v2, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$5;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 128
    new-instance v1, Lorg/apache/cordova/CordovaChromeClient$6;

    invoke-direct {v1, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$6;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 134
    new-instance v1, Lorg/apache/cordova/CordovaChromeClient$7;

    invoke-direct {v1, p0, p4}, Lorg/apache/cordova/CordovaChromeClient$7;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 146
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 147
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 148
    return v3
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 14
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "defaultValue"    # Ljava/lang/String;
    .param p5, "result"    # Landroid/webkit/JsPromptResult;

    .prologue
    .line 170
    const/4 v12, 0x0

    .line 171
    .local v12, "reqOk":Z
    const-string v1, "file://"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->baseUrl:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lorg/apache/cordova/DroidGap;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 172
    :cond_0
    const/4 v12, 0x1

    .line 177
    :cond_1
    if-eqz v12, :cond_2

    if-eqz p4, :cond_2

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v5, 0x3

    if-le v1, v5, :cond_2

    const/4 v1, 0x0

    const/4 v5, 0x4

    move-object/from16 v0, p4

    invoke-virtual {v0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v5, "gap:"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 180
    :try_start_0
    new-instance v7, Lorg/json/JSONArray;

    const/4 v1, 0x4

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 181
    .local v7, "array":Lorg/json/JSONArray;
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "service":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 183
    .local v3, "action":Ljava/lang/String;
    const/4 v1, 0x2

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 184
    .local v4, "callbackId":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v6

    .line 185
    .local v6, "async":Z
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    move-object/from16 v5, p3

    invoke-virtual/range {v1 .. v6}, Lorg/apache/cordova/api/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v11

    .line 186
    .local v11, "r":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .end local v2    # "service":Ljava/lang/String;
    .end local v3    # "action":Ljava/lang/String;
    .end local v4    # "callbackId":Ljava/lang/String;
    .end local v6    # "async":Z
    .end local v7    # "array":Lorg/json/JSONArray;
    .end local v11    # "r":Ljava/lang/String;
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 187
    :catch_0
    move-exception v9

    .line 188
    .local v9, "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 193
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_2
    if-eqz v12, :cond_3

    if-eqz p4, :cond_3

    const-string v1, "gap_poll:"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 194
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackServer;->getJavascript()Ljava/lang/String;

    move-result-object v11

    .line 195
    .restart local v11    # "r":Ljava/lang/String;
    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    goto :goto_0

    .line 199
    .end local v11    # "r":Ljava/lang/String;
    :cond_3
    if-eqz v12, :cond_8

    if-eqz p4, :cond_8

    const-string v1, "gap_callbackServer:"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 200
    const-string v11, ""

    .line 201
    .restart local v11    # "r":Ljava/lang/String;
    const-string v1, "usePolling"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v5, v5, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    invoke-virtual {v5}, Lorg/apache/cordova/CallbackServer;->usePolling()Z

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 213
    :cond_4
    :goto_1
    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    goto :goto_0

    .line 204
    :cond_5
    const-string v1, "restartServer"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 205
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackServer;->restartServer()V

    goto :goto_1

    .line 207
    :cond_6
    const-string v1, "getPort"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 208
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackServer;->getPort()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    .line 210
    :cond_7
    const-string v1, "getToken"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 211
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackServer;->getToken()Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    .line 218
    .end local v11    # "r":Ljava/lang/String;
    :cond_8
    if-eqz v12, :cond_9

    if-eqz p4, :cond_9

    const-string v1, "gap_init:"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 219
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v1, v1, Lorg/apache/cordova/DroidGap;->appView:Landroid/webkit/WebView;

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 220
    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v1}, Lorg/apache/cordova/DroidGap;->spinnerStop()V

    .line 221
    const-string v1, "OK"

    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 226
    :cond_9
    move-object/from16 v13, p5

    .line 227
    .local v13, "res":Landroid/webkit/JsPromptResult;
    new-instance v8, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-direct {v8, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 228
    .local v8, "dlg":Landroid/app/AlertDialog$Builder;
    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 229
    new-instance v10, Landroid/widget/EditText;

    iget-object v1, p0, Lorg/apache/cordova/CordovaChromeClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-direct {v10, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 230
    .local v10, "input":Landroid/widget/EditText;
    if-eqz p4, :cond_a

    .line 231
    move-object/from16 v0, p4

    invoke-virtual {v10, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 233
    :cond_a
    invoke-virtual {v8, v10}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 234
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 235
    const v1, 0x104000a

    new-instance v5, Lorg/apache/cordova/CordovaChromeClient$8;

    invoke-direct {v5, p0, v10, v13}, Lorg/apache/cordova/CordovaChromeClient$8;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/widget/EditText;Landroid/webkit/JsPromptResult;)V

    invoke-virtual {v8, v1, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 242
    const/high16 v1, 0x1040000

    new-instance v5, Lorg/apache/cordova/CordovaChromeClient$9;

    invoke-direct {v5, p0, v13}, Lorg/apache/cordova/CordovaChromeClient$9;-><init>(Lorg/apache/cordova/CordovaChromeClient;Landroid/webkit/JsPromptResult;)V

    invoke-virtual {v8, v1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 248
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 249
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0
.end method
