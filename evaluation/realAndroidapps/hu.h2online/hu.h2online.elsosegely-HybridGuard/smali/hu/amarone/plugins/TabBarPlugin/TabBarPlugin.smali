.class public Lhu/amarone/plugins/TabBarPlugin/TabBarPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "TabBarPlugin.java"


# instance fields
.field public tab:Lhu/amarone/plugins/TabBarPlugin/TabBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 20
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callback"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 17
    const-string v1, "showTabBar"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 20
    const/4 v1, 0x0

    :try_start_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    .line 21
    .local v13, "arg":Lorg/json/JSONObject;
    const-string v1, "JSONObject"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    const-string v1, "titlesAsString"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 24
    .local v18, "tempString":Ljava/lang/String;
    const-string v1, ";"

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 25
    .local v4, "titles":[Ljava/lang/String;
    const-string v1, "null"

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 26
    const/4 v4, 0x0

    .line 29
    :cond_0
    const-string v1, "paramsAsString"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 30
    const-string v1, ";"

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 32
    .local v5, "params":[Ljava/lang/String;
    const-string v1, "callbackName"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 33
    .local v6, "callbackName":Ljava/lang/String;
    const-string v1, "buttonSize"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 34
    .local v10, "buttonSize":Ljava/lang/String;
    const-string v1, "buttonTextSize"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 35
    .local v11, "buttonTextSize":Ljava/lang/String;
    const-string v1, "isFullScreen"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    .line 37
    .local v12, "isFullScreen":Z
    const-string v1, "backgroundColor"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 38
    .local v14, "backgroundColorString":[Ljava/lang/String;
    array-length v1, v14

    new-array v7, v1, [I

    .line 39
    .local v7, "backgroundColor":[I
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_0
    array-length v1, v14

    move/from16 v0, v16

    if-ge v0, v1, :cond_1

    .line 40
    aget-object v1, v14, v16

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aput v1, v7, v16

    .line 39
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 42
    :cond_1
    const-string v1, "selectionColor"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 43
    .local v17, "selectionColorString":[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v1, v0

    new-array v8, v1, [I

    .line 44
    .local v8, "selectionColor":[I
    const/16 v16, 0x0

    :goto_1
    move-object/from16 v0, v17

    array-length v1, v0

    move/from16 v0, v16

    if-ge v0, v1, :cond_2

    .line 45
    aget-object v1, v17, v16

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aput v1, v8, v16

    .line 44
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 47
    :cond_2
    const-string v1, "textColor"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\."

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    .line 48
    .local v19, "textColorString":[Ljava/lang/String;
    move-object/from16 v0, v19

    array-length v1, v0

    new-array v9, v1, [I

    .line 49
    .local v9, "textColor":[I
    const/16 v16, 0x0

    :goto_2
    move-object/from16 v0, v19

    array-length v1, v0

    move/from16 v0, v16

    if-ge v0, v1, :cond_3

    .line 50
    aget-object v1, v19, v16

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aput v1, v9, v16

    .line 49
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 53
    :cond_3
    new-instance v1, Lhu/amarone/plugins/TabBarPlugin/TabBar;

    move-object/from16 v0, p0

    iget-object v2, v0, Lhu/amarone/plugins/TabBarPlugin/TabBarPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lhu/amarone/plugins/TabBarPlugin/TabBarPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-direct/range {v1 .. v12}, Lhu/amarone/plugins/TabBarPlugin/TabBar;-><init>(Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[I[I[ILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lhu/amarone/plugins/TabBarPlugin/TabBarPlugin;->tab:Lhu/amarone/plugins/TabBarPlugin/TabBar;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    const/4 v1, 0x1

    .line 67
    .end local v4    # "titles":[Ljava/lang/String;
    .end local v5    # "params":[Ljava/lang/String;
    .end local v6    # "callbackName":Ljava/lang/String;
    .end local v7    # "backgroundColor":[I
    .end local v8    # "selectionColor":[I
    .end local v9    # "textColor":[I
    .end local v10    # "buttonSize":Ljava/lang/String;
    .end local v11    # "buttonTextSize":Ljava/lang/String;
    .end local v12    # "isFullScreen":Z
    .end local v13    # "arg":Lorg/json/JSONObject;
    .end local v14    # "backgroundColorString":[Ljava/lang/String;
    .end local v16    # "i":I
    .end local v17    # "selectionColorString":[Ljava/lang/String;
    .end local v18    # "tempString":Ljava/lang/String;
    .end local v19    # "textColorString":[Ljava/lang/String;
    :goto_3
    return v1

    .line 55
    :catch_0
    move-exception v15

    .line 56
    .local v15, "e":Ljava/lang/Exception;
    invoke-virtual {v15}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 67
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_4
    :goto_4
    const/4 v1, 0x0

    goto :goto_3

    .line 60
    :cond_5
    const-string v1, "hideTabBar"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 62
    :try_start_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lhu/amarone/plugins/TabBarPlugin/TabBarPlugin;->tab:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    invoke-virtual {v1}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->hideTabBar()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 63
    :catch_1
    move-exception v15

    .line 64
    .restart local v15    # "e":Ljava/lang/Exception;
    invoke-virtual {v15}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_4
.end method
