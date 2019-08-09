.class public Lhu/amarone/plugins/BannerPlugin/BannerPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "BannerPlugin.java"


# instance fields
.field public bnrContainer:Landroid/widget/RelativeLayout;

.field public currentUrl:Ljava/lang/String;

.field public frame:Landroid/view/ViewGroup;

.field public height:I

.field public promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

.field public startx:I

.field public starty:I

.field public webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 8
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callback"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 36
    const-string v7, "createWebView"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 38
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 39
    .local v0, "arg":Lorg/json/JSONObject;
    const-string v6, "JSONObject"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;

    invoke-direct {v7, p0, v0, p3}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    .end local v0    # "arg":Lorg/json/JSONObject;
    :goto_0
    return v5

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 80
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v7, "resize"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 82
    const/4 v6, 0x0

    :try_start_1
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 83
    .restart local v0    # "arg":Lorg/json/JSONObject;
    const-string v6, "JSONObject"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;

    invoke-direct {v7, p0, v0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Lorg/json/JSONObject;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 96
    .end local v0    # "arg":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 97
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 101
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const-string v7, "doubleSize"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 103
    :try_start_2
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;

    invoke-direct {v7, p0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 108
    :catch_2
    move-exception v1

    .line 109
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 113
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v7, "singleSize"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 115
    :try_start_3
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$4;

    invoke-direct {v7, p0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$4;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 120
    :catch_3
    move-exception v1

    .line 121
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 125
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    const-string v7, "loadPromoBanner"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 127
    const/4 v6, 0x0

    :try_start_4
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 129
    .restart local v0    # "arg":Lorg/json/JSONObject;
    const-string v6, "adunitid"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 130
    .local v4, "url":Ljava/lang/String;
    iput-object v4, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->currentUrl:Ljava/lang/String;

    .line 132
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;

    invoke-direct {v7, p0, v4}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$5;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    .line 145
    .end local v0    # "arg":Lorg/json/JSONObject;
    .end local v4    # "url":Ljava/lang/String;
    :catch_4
    move-exception v1

    .line 146
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 150
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    const-string v7, "showPromoBanner"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 152
    :try_start_5
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$6;

    invoke-direct {v7, p0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$6;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_0

    .line 157
    :catch_5
    move-exception v1

    .line 158
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 162
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5
    const-string v7, "loadUrl"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 165
    const/4 v6, 0x0

    :try_start_6
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 167
    .restart local v0    # "arg":Lorg/json/JSONObject;
    const-string v6, "url"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 168
    .restart local v4    # "url":Ljava/lang/String;
    const-string v6, "isWebPage"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 169
    .local v2, "isWebPage":Ljava/lang/String;
    const-string v6, "size"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 170
    .local v3, "size":I
    iput-object v4, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->currentUrl:Ljava/lang/String;

    .line 172
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;

    invoke-direct {v7, p0, v3, v4}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;ILjava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto/16 :goto_0

    .line 200
    .end local v0    # "arg":Lorg/json/JSONObject;
    .end local v2    # "isWebPage":Ljava/lang/String;
    .end local v3    # "size":I
    .end local v4    # "url":Ljava/lang/String;
    :catch_6
    move-exception v1

    .line 201
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 205
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6
    const-string v7, "showWebView"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 207
    :try_start_7
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$8;

    invoke-direct {v7, p0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$8;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    goto/16 :goto_0

    .line 212
    :catch_7
    move-exception v1

    .line 213
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 217
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_7
    const-string v7, "hideWebView"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 219
    :try_start_8
    iget-object v6, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$9;

    invoke-direct {v7, p0}, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$9;-><init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    goto/16 :goto_0

    .line 224
    :catch_8
    move-exception v1

    .line 225
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_8
    move v5, v6

    .line 229
    goto/16 :goto_0
.end method
