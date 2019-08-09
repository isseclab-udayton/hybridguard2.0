.class public Lorg/apache/cordova/facebook/ConnectPlugin;
.super Lorg/apache/cordova/api/Plugin;
.source "ConnectPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;,
        Lorg/apache/cordova/facebook/ConnectPlugin$UIDialogListener;
    }
.end annotation


# static fields
.field public static final SINGLE_SIGN_ON_DISABLED:Ljava/lang/String; = "service_disabled"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private callbackId:Ljava/lang/String;

.field private facebook:Lcom/facebook/android/Facebook;

.field private method:Ljava/lang/String;

.field private paramBundle:Landroid/os/Bundle;

.field private permissions:[Ljava/lang/String;

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 27
    const-string v0, "ConnectPlugin"

    iput-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->TAG:Ljava/lang/String;

    .line 32
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->permissions:[Ljava/lang/String;

    .line 259
    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 24
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->permissions:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lcom/facebook/android/Facebook;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 24
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 24
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->method:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lorg/apache/cordova/facebook/ConnectPlugin;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 24
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->paramBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;

    .prologue
    .line 24
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->callbackId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lorg/apache/cordova/facebook/ConnectPlugin;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/apache/cordova/facebook/ConnectPlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->userId:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 24
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 39
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 40
    .local v17, "pr":Lorg/apache/cordova/api/PluginResult;
    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 42
    const-string v20, "init"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 44
    const/16 v20, 0x0

    :try_start_0
    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 46
    .local v5, "appId":Ljava/lang/String;
    new-instance v20, Lcom/facebook/android/Facebook;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Lcom/facebook/android/Facebook;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    .line 48
    const-string v20, "ConnectPlugin"

    const-string v21, "init: Initializing plugin."

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v18

    .line 51
    .local v18, "prefs":Landroid/content/SharedPreferences;
    const-string v20, "access_token"

    const/16 v21, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 52
    .local v4, "access_token":Ljava/lang/String;
    const-string v20, "access_expires"

    const-wide/16 v21, -0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 54
    .local v9, "expires":Ljava/lang/Long;
    if-eqz v4, :cond_0

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    const-wide/16 v22, -0x1

    cmp-long v20, v20, v22

    if-eqz v20, :cond_0

    .line 55
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/facebook/android/Facebook;->setAccessToken(Ljava/lang/String;)V

    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v21

    invoke-virtual/range {v20 .. v22}, Lcom/facebook/android/Facebook;->setAccessExpires(J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 58
    :try_start_1
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    const-string v21, "/me"

    invoke-virtual/range {v20 .. v21}, Lcom/facebook/android/Facebook;->request(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 59
    .local v14, "o":Lorg/json/JSONObject;
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->userId:Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3

    .line 72
    .end local v14    # "o":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/facebook/android/Facebook;->isSessionValid()Z

    move-result v20

    if-eqz v20, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->userId:Ljava/lang/String;

    move-object/from16 v20, v0

    if-eqz v20, :cond_1

    .line 73
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/cordova/facebook/ConnectPlugin;->getResponse()Lorg/json/JSONObject;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 189
    .end local v4    # "access_token":Ljava/lang/String;
    .end local v5    # "appId":Ljava/lang/String;
    .end local v9    # "expires":Ljava/lang/Long;
    .end local v18    # "prefs":Landroid/content/SharedPreferences;
    :goto_1
    return-object v20

    .line 60
    .restart local v4    # "access_token":Ljava/lang/String;
    .restart local v5    # "appId":Ljava/lang/String;
    .restart local v9    # "expires":Ljava/lang/Long;
    .restart local v18    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v7

    .line 62
    .local v7, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 78
    .end local v4    # "access_token":Ljava/lang/String;
    .end local v5    # "appId":Ljava/lang/String;
    .end local v7    # "e":Ljava/net/MalformedURLException;
    .end local v9    # "expires":Ljava/lang/Long;
    .end local v18    # "prefs":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v7

    .line 80
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 81
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v22, "Invalid JSON args used. expected a string as the first arg."

    invoke-direct/range {v20 .. v22}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_1

    .line 63
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v4    # "access_token":Ljava/lang/String;
    .restart local v5    # "appId":Ljava/lang/String;
    .restart local v9    # "expires":Ljava/lang/Long;
    .restart local v18    # "prefs":Landroid/content/SharedPreferences;
    :catch_2
    move-exception v7

    .line 65
    .local v7, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 66
    .end local v7    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v7

    .line 68
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 76
    .end local v7    # "e":Lorg/json/JSONException;
    :cond_1
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct/range {v20 .. v21}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 85
    .end local v4    # "access_token":Ljava/lang/String;
    .end local v5    # "appId":Ljava/lang/String;
    .end local v9    # "expires":Ljava/lang/Long;
    .end local v18    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    const-string v20, "login"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_6

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    if-eqz v20, :cond_5

    .line 87
    move-object/from16 v13, p0

    .line 88
    .local v13, "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 90
    .local v16, "permissions":[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2
    :try_start_4
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v10, v0, :cond_3

    .line 91
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v10
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 90
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 93
    :catch_4
    move-exception v8

    .line 95
    .local v8, "e1":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    .line 96
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v22, "Invalid JSON args used. Expected a string array of permissions."

    invoke-direct/range {v20 .. v22}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_1

    .line 98
    .end local v8    # "e1":Lorg/json/JSONException;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lorg/apache/cordova/api/CordovaInterface;->setActivityResultCallback(Lorg/apache/cordova/api/CordovaPlugin;)V

    .line 100
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->permissions:[Ljava/lang/String;

    .line 101
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->callbackId:Ljava/lang/String;

    .line 102
    new-instance v19, Lorg/apache/cordova/facebook/ConnectPlugin$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/facebook/ConnectPlugin$1;-><init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V

    .line 107
    .local v19, "runnable":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .end local v10    # "i":I
    .end local v13    # "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    .end local v16    # "permissions":[Ljava/lang/String;
    .end local v19    # "runnable":Ljava/lang/Runnable;
    :cond_4
    :goto_3
    move-object/from16 v20, v17

    .line 189
    goto/16 :goto_1

    .line 110
    :cond_5
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Must call init before login."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto :goto_3

    .line 114
    :cond_6
    const-string v20, "logout"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    if-eqz v20, :cond_7

    .line 117
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Lcom/facebook/android/Facebook;->logout(Landroid/content/Context;)Ljava/lang/String;

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v18

    .line 120
    .restart local v18    # "prefs":Landroid/content/SharedPreferences;
    invoke-interface/range {v18 .. v18}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v20

    const-string v21, "access_expires"

    const-wide/16 v22, -0x1

    invoke-interface/range {v20 .. v23}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 121
    invoke-interface/range {v18 .. v18}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v20

    const-string v21, "access_token"

    const/16 v22, 0x0

    invoke-interface/range {v20 .. v22}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6

    .line 131
    .end local v18    # "prefs":Landroid/content/SharedPreferences;
    :goto_4
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/cordova/facebook/ConnectPlugin;->getResponse()Lorg/json/JSONObject;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto :goto_3

    .line 122
    :catch_5
    move-exception v7

    .line 124
    .local v7, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 125
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->MALFORMED_URL_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Error logging out."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 130
    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto :goto_4

    .line 126
    .end local v7    # "e":Ljava/net/MalformedURLException;
    :catch_6
    move-exception v7

    .line 128
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .line 129
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Error logging out."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto :goto_4

    .line 133
    .end local v7    # "e":Ljava/io/IOException;
    :cond_7
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Must call init before logout."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_3

    .line 137
    :cond_8
    const-string v20, "getLoginStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_a

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    if-eqz v20, :cond_9

    .line 139
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/cordova/facebook/ConnectPlugin;->getResponse()Lorg/json/JSONObject;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_3

    .line 141
    :cond_9
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Must call init before getLoginStatus."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_3

    .line 145
    :cond_a
    const-string v20, "showDialog"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    move-object/from16 v20, v0

    if-eqz v20, :cond_d

    .line 147
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 148
    .local v6, "collect":Landroid/os/Bundle;
    const/4 v15, 0x0

    .line 150
    .local v15, "params":Lorg/json/JSONObject;
    const/16 v20, 0x0

    :try_start_6
    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_8

    move-result-object v15

    .line 155
    :goto_5
    move-object/from16 v13, p0

    .line 156
    .restart local v13    # "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    invoke-virtual {v15}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v11

    .line 157
    .local v11, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_c

    .line 158
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 159
    .local v12, "key":Ljava/lang/String;
    const-string v20, "method"

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_b

    .line 161
    :try_start_7
    invoke-virtual {v15, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->method:Ljava/lang/String;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_6

    .line 162
    :catch_7
    move-exception v7

    .line 163
    .local v7, "e":Lorg/json/JSONException;
    const-string v20, "ConnectPlugin"

    const-string v21, "Nonstring method parameter provided to dialog"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 151
    .end local v7    # "e":Lorg/json/JSONException;
    .end local v11    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    :catch_8
    move-exception v7

    .line 152
    .restart local v7    # "e":Lorg/json/JSONException;
    new-instance v15, Lorg/json/JSONObject;

    .end local v15    # "params":Lorg/json/JSONObject;
    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    .restart local v15    # "params":Lorg/json/JSONObject;
    goto :goto_5

    .line 167
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v11    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v12    # "key":Ljava/lang/String;
    .restart local v13    # "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    :cond_b
    :try_start_8
    invoke-virtual {v15, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v6, v12, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_9

    goto :goto_6

    .line 168
    :catch_9
    move-exception v7

    .line 170
    .restart local v7    # "e":Lorg/json/JSONException;
    const-string v20, "ConnectPlugin"

    const-string v21, "Nonstring parameter provided to dialog discarded"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 174
    .end local v7    # "e":Lorg/json/JSONException;
    .end local v12    # "key":Ljava/lang/String;
    :cond_c
    new-instance v20, Landroid/os/Bundle;

    move-object/from16 v0, v20

    invoke-direct {v0, v6}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->paramBundle:Landroid/os/Bundle;

    .line 175
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->callbackId:Ljava/lang/String;

    .line 176
    new-instance v19, Lorg/apache/cordova/facebook/ConnectPlugin$2;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/facebook/ConnectPlugin$2;-><init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V

    .line 181
    .restart local v19    # "runnable":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_3

    .line 184
    .end local v6    # "collect":Landroid/os/Bundle;
    .end local v11    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v13    # "me":Lorg/apache/cordova/facebook/ConnectPlugin;
    .end local v15    # "params":Lorg/json/JSONObject;
    .end local v19    # "runnable":Ljava/lang/Runnable;
    :cond_d
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    .end local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    sget-object v20, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v21, "Must call init before showDialog."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .restart local v17    # "pr":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_3
.end method

.method public getResponse()Lorg/json/JSONObject;
    .locals 10

    .prologue
    const-wide/16 v1, 0x0

    .line 201
    iget-object v6, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    invoke-virtual {v6}, Lcom/facebook/android/Facebook;->isSessionValid()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 202
    iget-object v6, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    invoke-virtual {v6}, Lcom/facebook/android/Facebook;->getAccessExpires()J

    move-result-wide v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v3, v6, v8

    .line 203
    .local v3, "expiresTimeInterval":J
    cmp-long v6, v3, v1

    if-lez v6, :cond_0

    move-wide v1, v3

    .line 204
    .local v1, "expiresIn":J
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "{\"status\": \"connected\",\"authResponse\": {\"accessToken\": \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    invoke-virtual {v7}, Lcom/facebook/android/Facebook;->getAccessToken()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\"expiresIn\": \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\"session_key\": true,"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\"sig\": \"...\","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\"userId\": \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->userId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 221
    .end local v1    # "expiresIn":J
    .end local v3    # "expiresTimeInterval":J
    .local v5, "response":Ljava/lang/String;
    :goto_0
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :goto_1
    return-object v6

    .line 215
    .end local v5    # "response":Ljava/lang/String;
    :cond_1
    const-string v5, "{\"status\": \"unknown\"}"

    .restart local v5    # "response":Ljava/lang/String;
    goto :goto_0

    .line 222
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 226
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    goto :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 194
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/api/Plugin;->onActivityResult(IILandroid/content/Intent;)V

    .line 196
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin;->facebook:Lcom/facebook/android/Facebook;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/android/Facebook;->authorizeCallback(IILandroid/content/Intent;)V

    .line 197
    return-void
.end method
