.class public Lorg/apache/cordova/ContactManager;
.super Lorg/apache/cordova/api/Plugin;
.source "ContactManager.java"


# static fields
.field public static final INVALID_ARGUMENT_ERROR:I = 0x1

.field public static final IO_ERROR:I = 0x4

.field private static final LOG_TAG:Ljava/lang/String; = "Contact Query"

.field public static final NOT_SUPPORTED_ERROR:I = 0x5

.field public static final PENDING_OPERATION_ERROR:I = 0x3

.field public static final PERMISSION_DENIED_ERROR:I = 0x14

.field public static final TIMEOUT_ERROR:I = 0x2

.field public static final UNKNOWN_ERROR:I


# instance fields
.field private contactAccessor:Lorg/apache/cordova/ContactAccessor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 46
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 10
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 57
    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 58
    .local v6, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v5, ""

    .line 64
    .local v5, "result":Ljava/lang/String;
    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v8, "1."

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 65
    const/4 v3, 0x0

    .line 67
    .local v3, "res":Lorg/json/JSONObject;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v3    # "res":Lorg/json/JSONObject;
    .local v4, "res":Lorg/json/JSONObject;
    :try_start_1
    const-string v7, "code"

    const/4 v8, 0x5

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 69
    const-string v7, "message"

    const-string v8, "Contacts are not supported in Android 1.X devices"

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v3, v4

    .line 74
    .end local v4    # "res":Lorg/json/JSONObject;
    .restart local v3    # "res":Lorg/json/JSONObject;
    :goto_0
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    sget-object v8, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v8, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 110
    .end local v3    # "res":Lorg/json/JSONObject;
    :goto_1
    return-object v7

    .line 70
    .restart local v3    # "res":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Lorg/json/JSONException;
    :goto_2
    const-string v7, "Contact Query"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 81
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v3    # "res":Lorg/json/JSONObject;
    :cond_0
    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    if-nez v7, :cond_1

    .line 82
    new-instance v7, Lorg/apache/cordova/ContactAccessorSdk5;

    iget-object v8, p0, Lorg/apache/cordova/ContactManager;->webView:Landroid/webkit/WebView;

    iget-object v9, p0, Lorg/apache/cordova/ContactManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/cordova/ContactAccessorSdk5;-><init>(Landroid/webkit/WebView;Landroid/content/Context;)V

    iput-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    .line 86
    :cond_1
    :try_start_2
    const-string v7, "search"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 87
    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {p2, v9}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/apache/cordova/ContactAccessor;->search(Lorg/json/JSONArray;Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v3

    .line 88
    .local v3, "res":Lorg/json/JSONArray;
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v7, v6, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 108
    .end local v3    # "res":Lorg/json/JSONArray;
    :catch_1
    move-exception v0

    .line 109
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v7, "Contact Query"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    sget-object v8, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v8}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 90
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_3
    const-string v7, "save"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 91
    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/cordova/ContactAccessor;->save(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 93
    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    invoke-virtual {v7, v1}, Lorg/apache/cordova/ContactAccessor;->getContactById(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 94
    .local v3, "res":Lorg/json/JSONObject;
    if-eqz v3, :cond_4

    .line 95
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v7, v6, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto :goto_1

    .line 99
    .end local v1    # "id":Ljava/lang/String;
    .end local v3    # "res":Lorg/json/JSONObject;
    :cond_3
    const-string v7, "remove"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 100
    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/cordova/ContactAccessor;->remove(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 101
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v7, v6, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 105
    :cond_4
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 106
    .local v2, "r":Lorg/json/JSONObject;
    const-string v7, "code"

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    sget-object v8, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v8, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 70
    .end local v2    # "r":Lorg/json/JSONObject;
    .restart local v4    # "res":Lorg/json/JSONObject;
    :catch_2
    move-exception v0

    move-object v3, v4

    .end local v4    # "res":Lorg/json/JSONObject;
    .restart local v3    # "res":Lorg/json/JSONObject;
    goto/16 :goto_2
.end method
