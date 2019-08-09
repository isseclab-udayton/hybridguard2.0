.class public Lorg/apache/cordova/media/AudioHandler;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AudioHandler.java"


# static fields
.field public static TAG:Ljava/lang/String;


# instance fields
.field pausedForPhone:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/cordova/media/AudioPlayer;",
            ">;"
        }
    .end annotation
.end field

.field players:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/media/AudioPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-string v0, "AudioHandler"

    sput-object v0, Lorg/apache/cordova/media/AudioHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    .line 59
    return-void
.end method

.method private release(Ljava/lang/String;)Z
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 205
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 206
    const/4 v1, 0x0

    .line 211
    :goto_0
    return v1

    .line 208
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 209
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    .line 211
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 15
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v13, p0, Lorg/apache/cordova/media/AudioHandler;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v13}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v7

    .line 70
    .local v7, "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    sget-object v10, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 71
    .local v10, "status":Lorg/apache/cordova/PluginResult$Status;
    const-string v8, ""

    .line 73
    .local v8, "result":Ljava/lang/String;
    const-string v13, "startRecordingAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 74
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 77
    .local v11, "target":Ljava/lang/String;
    :try_start_0
    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-virtual {v7, v13}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v12

    .line 78
    .local v12, "targetUri":Landroid/net/Uri;
    invoke-virtual {v12}, Landroid/net/Uri;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 82
    .end local v12    # "targetUri":Landroid/net/Uri;
    .local v5, "fileUriStr":Ljava/lang/String;
    :goto_0
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v5}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {p0, v13, v14}, Lorg/apache/cordova/media/AudioHandler;->startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .end local v5    # "fileUriStr":Ljava/lang/String;
    .end local v11    # "target":Ljava/lang/String;
    :goto_1
    new-instance v13, Lorg/apache/cordova/PluginResult;

    invoke-direct {v13, v10, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 139
    const/4 v13, 0x1

    :goto_2
    return v13

    .line 79
    .restart local v11    # "target":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 80
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    move-object v5, v11

    .restart local v5    # "fileUriStr":Ljava/lang/String;
    goto :goto_0

    .line 84
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    .end local v5    # "fileUriStr":Ljava/lang/String;
    .end local v11    # "target":Ljava/lang/String;
    :cond_0
    const-string v13, "stopRecordingAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 85
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13}, Lorg/apache/cordova/media/AudioHandler;->stopRecordingAudio(Ljava/lang/String;)V

    goto :goto_1

    .line 87
    :cond_1
    const-string v13, "startPlayingAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 88
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 91
    .restart local v11    # "target":Ljava/lang/String;
    :try_start_1
    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-virtual {v7, v13}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v12

    .line 92
    .restart local v12    # "targetUri":Landroid/net/Uri;
    invoke-virtual {v12}, Landroid/net/Uri;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 96
    .end local v12    # "targetUri":Landroid/net/Uri;
    .restart local v5    # "fileUriStr":Ljava/lang/String;
    :goto_3
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v5}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {p0, v13, v14}, Lorg/apache/cordova/media/AudioHandler;->startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 93
    .end local v5    # "fileUriStr":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 94
    .restart local v3    # "e":Ljava/lang/IllegalArgumentException;
    move-object v5, v11

    .restart local v5    # "fileUriStr":Ljava/lang/String;
    goto :goto_3

    .line 98
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    .end local v5    # "fileUriStr":Ljava/lang/String;
    .end local v11    # "target":Ljava/lang/String;
    :cond_2
    const-string v13, "seekToAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 99
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/json/JSONArray;->getInt(I)I

    move-result v14

    invoke-virtual {p0, v13, v14}, Lorg/apache/cordova/media/AudioHandler;->seekToAudio(Ljava/lang/String;I)V

    goto :goto_1

    .line 101
    :cond_3
    const-string v13, "pausePlayingAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 102
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13}, Lorg/apache/cordova/media/AudioHandler;->pausePlayingAudio(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 104
    :cond_4
    const-string v13, "stopPlayingAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 105
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13}, Lorg/apache/cordova/media/AudioHandler;->stopPlayingAudio(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 106
    :cond_5
    const-string v13, "setVolume"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 108
    const/4 v13, 0x0

    :try_start_2
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    invoke-virtual {p0, v13, v14}, Lorg/apache/cordova/media/AudioHandler;->setVolume(Ljava/lang/String;F)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 109
    :catch_2
    move-exception v13

    goto/16 :goto_1

    .line 112
    :cond_6
    const-string v13, "getCurrentPositionAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 113
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13}, Lorg/apache/cordova/media/AudioHandler;->getCurrentPositionAudio(Ljava/lang/String;)F

    move-result v4

    .line 114
    .local v4, "f":F
    new-instance v13, Lorg/apache/cordova/PluginResult;

    invoke-direct {v13, v10, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 115
    const/4 v13, 0x1

    goto/16 :goto_2

    .line 117
    .end local v4    # "f":F
    :cond_7
    const-string v13, "getDurationAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 118
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {p0, v13, v14}, Lorg/apache/cordova/media/AudioHandler;->getDurationAudio(Ljava/lang/String;Ljava/lang/String;)F

    move-result v4

    .line 119
    .restart local v4    # "f":F
    new-instance v13, Lorg/apache/cordova/PluginResult;

    invoke-direct {v13, v10, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 120
    const/4 v13, 0x1

    goto/16 :goto_2

    .line 122
    .end local v4    # "f":F
    :cond_8
    const-string v13, "create"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 123
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 124
    .local v6, "id":Ljava/lang/String;
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 125
    .local v9, "src":Ljava/lang/String;
    new-instance v1, Lorg/apache/cordova/media/AudioPlayer;

    invoke-direct {v1, p0, v6, v9}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .local v1, "audio":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v13, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v13, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 128
    .end local v1    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    .end local v6    # "id":Ljava/lang/String;
    .end local v9    # "src":Ljava/lang/String;
    :cond_9
    const-string v13, "release"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 129
    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lorg/apache/cordova/media/AudioHandler;->release(Ljava/lang/String;)Z

    move-result v2

    .line 130
    .local v2, "b":Z
    new-instance v13, Lorg/apache/cordova/PluginResult;

    invoke-direct {v13, v10, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 131
    const/4 v13, 0x1

    goto/16 :goto_2

    .line 134
    .end local v2    # "b":Z
    :cond_a
    const/4 v13, 0x0

    goto/16 :goto_2
.end method

.method public getAudioOutputDevice()I
    .locals 6

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 350
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "audio"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 351
    .local v0, "audiMgr":Landroid/media/AudioManager;
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 358
    :goto_0
    return v1

    .line 354
    :cond_0
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    move v1, v2

    .line 355
    goto :goto_0

    .line 358
    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getCurrentPositionAudio(Ljava/lang/String;)F
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 295
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 296
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 297
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getCurrentPosition()J

    move-result-wide v1

    long-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    .line 299
    :goto_0
    return v1

    :cond_0
    const/high16 v1, -0x40800000    # -1.0f

    goto :goto_0
.end method

.method public getDurationAudio(Ljava/lang/String;Ljava/lang/String;)F
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 311
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 312
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 313
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->getDuration(Ljava/lang/String;)F

    move-result v1

    .line 320
    :goto_0
    return v1

    .line 318
    :cond_0
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer;

    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-direct {v0, p0, p1, p2}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->getDuration(Ljava/lang/String;)F

    move-result v1

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 146
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 147
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    goto :goto_0

    .line 149
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 150
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 170
    const-string v2, "telephone"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 173
    const-string v2, "ringing"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "offhook"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 176
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 177
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getState()I

    move-result v2

    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 178
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    goto :goto_0

    .line 186
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    const-string v2, "idle"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 187
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 188
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, v4}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    goto :goto_1

    .line 190
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 193
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_4
    return-object v4
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 157
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioHandler;->onDestroy()V

    .line 158
    return-void
.end method

.method public pausePlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 271
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    .line 274
    :cond_0
    return-void
.end method

.method public seekToAudio(Ljava/lang/String;I)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "milliseconds"    # I

    .prologue
    .line 259
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 260
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->seekToPlaying(I)V

    .line 263
    :cond_0
    return-void
.end method

.method public setAudioOutputDevice(I)V
    .locals 7
    .param p1, "output"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 331
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 332
    .local v0, "audiMgr":Landroid/media/AudioManager;
    if-ne p1, v6, :cond_0

    .line 333
    invoke-virtual {v0, v4, v6, v3}, Landroid/media/AudioManager;->setRouting(III)V

    .line 341
    :goto_0
    return-void

    .line 335
    :cond_0
    if-ne p1, v5, :cond_1

    .line 336
    invoke-virtual {v0, v4, v5, v3}, Landroid/media/AudioManager;->setRouting(III)V

    goto :goto_0

    .line 339
    :cond_1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "AudioHandler.setAudioOutputDevice() Error: Unknown output device."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setVolume(Ljava/lang/String;F)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "volume"    # F

    .prologue
    .line 369
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 370
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 371
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->setVolume(F)V

    .line 375
    :goto_0
    return-void

    .line 373
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AudioHandler.setVolume() Error: Unknown Audio Player "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 246
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_0

    .line 247
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer;

    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-direct {v0, p0, p1, p2}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    :cond_0
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    .line 251
    return-void
.end method

.method public startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 220
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 221
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_0

    .line 222
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer;

    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-direct {v0, p0, p1, p2}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :cond_0
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startRecording(Ljava/lang/String;)V

    .line 226
    return-void
.end method

.method public stopPlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 281
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 282
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->stopPlaying()V

    .line 287
    :cond_0
    return-void
.end method

.method public stopRecordingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 233
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 234
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 235
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->stopRecording()V

    .line 237
    :cond_0
    return-void
.end method
