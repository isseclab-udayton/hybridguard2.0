.class public Lcom/adobe/phonegap/push/PushPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "PushPlugin.java"

# interfaces
.implements Lcom/adobe/phonegap/push/PushConstants;


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "PushPlugin"

.field private static gCachedExtras:Landroid/os/Bundle;

.field private static gForeground:Z

.field private static gWebView:Lorg/apache/cordova/CordovaWebView;

.field private static pushContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gCachedExtras:Landroid/os/Bundle;

    .line 33
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 30
    sput-object p0, Lcom/adobe/phonegap/push/PushPlugin;->pushContext:Lorg/apache/cordova/CallbackContext;

    return-void
.end method

.method static synthetic access$1(Lcom/adobe/phonegap/push/PushPlugin;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/adobe/phonegap/push/PushPlugin;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 253
    invoke-direct {p0, p1, p2}, Lcom/adobe/phonegap/push/PushPlugin;->subscribeToTopics(Lorg/json/JSONArray;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gCachedExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$4(Landroid/os/Bundle;)V
    .locals 0

    .prologue
    .line 32
    sput-object p0, Lcom/adobe/phonegap/push/PushPlugin;->gCachedExtras:Landroid/os/Bundle;

    return-void
.end method

.method static synthetic access$5(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 270
    invoke-direct {p0, p1, p2}, Lcom/adobe/phonegap/push/PushPlugin;->unsubscribeFromTopics(Lorg/json/JSONArray;Ljava/lang/String;)V

    return-void
.end method

.method private static convertBundleToJson(Landroid/os/Bundle;)Lorg/json/JSONObject;
    .locals 12
    .param p0, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 291
    const-string v9, "PushPlugin"

    const-string v10, "convert extras to json"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 294
    .local v4, "json":Lorg/json/JSONObject;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 297
    .local v1, "additionalData":Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 298
    .local v5, "jsonKeySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "title"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, "message"

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string v11, "count"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string v11, "sound"

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-string v11, "image"

    aput-object v11, v9, v10

    invoke-static {v5, v9}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 300
    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 301
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_1

    .line 336
    const-string v9, "additionalData"

    invoke-virtual {v4, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 337
    const-string v9, "PushPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "extrasToJSON: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    .end local v1    # "additionalData":Lorg/json/JSONObject;
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v5    # "jsonKeySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :goto_1
    return-object v4

    .line 302
    .restart local v1    # "additionalData":Lorg/json/JSONObject;
    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v4    # "json":Lorg/json/JSONObject;
    .restart local v5    # "jsonKeySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 303
    .local v6, "key":Ljava/lang/String;
    invoke-virtual {p0, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 305
    .local v8, "value":Ljava/lang/Object;
    const-string v9, "PushPlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "key = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    invoke-virtual {v5, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 308
    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 341
    .end local v1    # "additionalData":Lorg/json/JSONObject;
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v5    # "jsonKeySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 342
    .local v2, "e":Lorg/json/JSONException;
    const-string v9, "PushPlugin"

    const-string v10, "extrasToJSON: JSON exception"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    const/4 v4, 0x0

    goto :goto_1

    .line 310
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v1    # "additionalData":Lorg/json/JSONObject;
    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v4    # "json":Lorg/json/JSONObject;
    .restart local v5    # "jsonKeySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v8    # "value":Ljava/lang/Object;
    :cond_2
    :try_start_1
    const-string v9, "coldstart"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 311
    const-string v9, "coldstart"

    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v1, v6, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    .line 313
    :cond_3
    const-string v9, "foreground"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 314
    const-string v9, "foreground"

    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v1, v6, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    .line 316
    :cond_4
    instance-of v9, v8, Ljava/lang/String;

    if-eqz v9, :cond_0

    .line 317
    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v7, v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 320
    .local v7, "strValue":Ljava/lang/String;
    :try_start_2
    const-string v9, "{"

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 321
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 330
    :catch_1
    move-exception v2

    .line 331
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v1, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 324
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_5
    :try_start_4
    const-string v9, "["

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 325
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 328
    :cond_6
    invoke-virtual {v1, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0
.end method

.method private getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/phonegap/push/PushPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public static isActive()Z
    .locals 1

    .prologue
    .line 352
    sget-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gWebView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isInForeground()Z
    .locals 1

    .prologue
    .line 348
    sget-boolean v0, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    return v0
.end method

.method public static sendError(Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 200
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 201
    .local v0, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 202
    sget-object v1, Lcom/adobe/phonegap/push/PushPlugin;->pushContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 203
    sget-object v1, Lcom/adobe/phonegap/push/PushPlugin;->pushContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 205
    :cond_0
    return-void
.end method

.method public static sendEvent(Lorg/json/JSONObject;)V
    .locals 2
    .param p0, "_json"    # Lorg/json/JSONObject;

    .prologue
    .line 192
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 193
    .local v0, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 194
    sget-object v1, Lcom/adobe/phonegap/push/PushPlugin;->pushContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 195
    sget-object v1, Lcom/adobe/phonegap/push/PushPlugin;->pushContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 197
    :cond_0
    return-void
.end method

.method public static sendExtras(Landroid/os/Bundle;)V
    .locals 2
    .param p0, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 212
    if-eqz p0, :cond_0

    .line 213
    sget-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gWebView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_1

    .line 214
    invoke-static {p0}, Lcom/adobe/phonegap/push/PushPlugin;->convertBundleToJson(Landroid/os/Bundle;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/phonegap/push/PushPlugin;->sendEvent(Lorg/json/JSONObject;)V

    .line 220
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    const-string v0, "PushPlugin"

    const-string v1, "sendExtras: caching extras to send at a later time."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    sput-object p0, Lcom/adobe/phonegap/push/PushPlugin;->gCachedExtras:Landroid/os/Bundle;

    goto :goto_0
.end method

.method private subscribeToTopics(Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 6
    .param p1, "topics"    # Lorg/json/JSONArray;
    .param p2, "registrationToken"    # Ljava/lang/String;

    .prologue
    .line 254
    if-eqz p1, :cond_0

    .line 255
    const/4 v2, 0x0

    .line 256
    .local v2, "topic":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 268
    .end local v1    # "i":I
    .end local v2    # "topic":Ljava/lang/String;
    :cond_0
    return-void

    .line 258
    .restart local v1    # "i":I
    .restart local v2    # "topic":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 259
    if-eqz v2, :cond_2

    .line 260
    const-string v3, "PushPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Subscribing to topic: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    invoke-direct {p0}, Lcom/adobe/phonegap/push/PushPlugin;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/gcm/GcmPubSub;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GcmPubSub;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "/topics/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, p2, v4, v5}, Lcom/google/android/gms/gcm/GcmPubSub;->subscribe(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "PushPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Failed to subscribe to topic: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private unsubscribeFromTopics(Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 6
    .param p1, "topics"    # Lorg/json/JSONArray;
    .param p2, "registrationToken"    # Ljava/lang/String;

    .prologue
    .line 271
    if-eqz p1, :cond_0

    .line 272
    const/4 v2, 0x0

    .line 273
    .local v2, "topic":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 285
    .end local v1    # "i":I
    .end local v2    # "topic":Ljava/lang/String;
    :cond_0
    return-void

    .line 275
    .restart local v1    # "i":I
    .restart local v2    # "topic":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 276
    if-eqz v2, :cond_2

    .line 277
    const-string v3, "PushPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unsubscribing to topic: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    invoke-direct {p0}, Lcom/adobe/phonegap/push/PushPlugin;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/gcm/GcmPubSub;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GcmPubSub;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "/topics/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lcom/google/android/gms/gcm/GcmPubSub;->unsubscribe(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 280
    :catch_0
    move-exception v0

    .line 281
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "PushPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Failed to unsubscribe to topic: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 45
    const-string v0, "PushPlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "execute: action="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    iget-object v0, p0, Lcom/adobe/phonegap/push/PushPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    sput-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gWebView:Lorg/apache/cordova/CordovaWebView;

    .line 48
    const-string v0, "init"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lcom/adobe/phonegap/push/PushPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/phonegap/push/PushPlugin$1;

    invoke-direct {v1, p0, p3, p2}, Lcom/adobe/phonegap/push/PushPlugin$1;-><init>(Lcom/adobe/phonegap/push/PushPlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 188
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 133
    :cond_0
    const-string v0, "unregister"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 134
    iget-object v0, p0, Lcom/adobe/phonegap/push/PushPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/phonegap/push/PushPlugin$2;

    invoke-direct {v1, p0, p2, p3}, Lcom/adobe/phonegap/push/PushPlugin$2;-><init>(Lcom/adobe/phonegap/push/PushPlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 164
    :cond_1
    const-string v0, "finish"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 165
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 166
    :cond_2
    const-string v0, "hasPermission"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 167
    iget-object v0, p0, Lcom/adobe/phonegap/push/PushPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/phonegap/push/PushPlugin$3;

    invoke-direct {v1, p0, p3}, Lcom/adobe/phonegap/push/PushPlugin$3;-><init>(Lcom/adobe/phonegap/push/PushPlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 183
    :cond_3
    const-string v0, "PushPlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid action : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p3, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 185
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 224
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 225
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    .line 226
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 248
    invoke-super {p0}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    .line 249
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    .line 250
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/phonegap/push/PushPlugin;->gWebView:Lorg/apache/cordova/CordovaWebView;

    .line 251
    return-void
.end method

.method public onPause(Z)V
    .locals 5
    .param p1, "multitasking"    # Z

    .prologue
    const/4 v4, 0x0

    .line 230
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    .line 231
    sput-boolean v4, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    .line 233
    invoke-direct {p0}, Lcom/adobe/phonegap/push/PushPlugin;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "com.adobe.phonegap.push"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 234
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "clearNotifications"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 235
    iget-object v2, p0, Lcom/adobe/phonegap/push/PushPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "notification"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 236
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 238
    .end local v0    # "notificationManager":Landroid/app/NotificationManager;
    :cond_0
    return-void
.end method

.method public onResume(Z)V
    .locals 1
    .param p1, "multitasking"    # Z

    .prologue
    .line 242
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    .line 243
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/phonegap/push/PushPlugin;->gForeground:Z

    .line 244
    return-void
.end method
