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
    .line 44
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 8
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 56
    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 57
    .local v4, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v3, ""

    .line 63
    .local v3, "result":Ljava/lang/String;
    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v6, "1."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 64
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V

    .line 98
    :goto_0
    return-object v5

    .line 71
    :cond_0
    iget-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    if-nez v5, :cond_1

    .line 72
    new-instance v5, Lorg/apache/cordova/ContactAccessorSdk5;

    iget-object v6, p0, Lorg/apache/cordova/ContactManager;->webView:Lorg/apache/cordova/CordovaWebView;

    iget-object v7, p0, Lorg/apache/cordova/ContactManager;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v5, v6, v7}, Lorg/apache/cordova/ContactAccessorSdk5;-><init>(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)V

    iput-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    .line 76
    :cond_1
    :try_start_0
    const-string v5, "search"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 77
    iget-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/apache/cordova/ContactAccessor;->search(Lorg/json/JSONArray;Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v2

    .line 78
    .local v2, "res":Lorg/json/JSONArray;
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v5, v4, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    .end local v2    # "res":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "Contact Query"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 98
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v5, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0

    .line 80
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    const-string v5, "save"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 81
    iget-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/cordova/ContactAccessor;->save(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 83
    iget-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    invoke-virtual {v5, v1}, Lorg/apache/cordova/ContactAccessor;->getContactById(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 84
    .local v2, "res":Lorg/json/JSONObject;
    if-eqz v2, :cond_4

    .line 85
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v5, v4, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 89
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "res":Lorg/json/JSONObject;
    :cond_3
    const-string v5, "remove"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 90
    iget-object v5, p0, Lorg/apache/cordova/ContactManager;->contactAccessor:Lorg/apache/cordova/ContactAccessor;

    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/cordova/ContactAccessor;->remove(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 91
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v5, v4, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_4
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;I)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
