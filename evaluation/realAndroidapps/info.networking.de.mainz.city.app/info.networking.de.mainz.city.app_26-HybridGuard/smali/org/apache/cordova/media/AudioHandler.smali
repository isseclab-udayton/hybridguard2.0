.class public Lorg/apache/cordova/media/AudioHandler;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AudioHandler.java"


# static fields
.field public static TAG:Ljava/lang/String;


# instance fields
.field private messageChannel:Lorg/apache/cordova/CallbackContext;

.field private origVolumeStream:I

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
    .line 52
    const-string v0, "AudioHandler"

    sput-object v0, Lorg/apache/cordova/media/AudioHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 55
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    .line 64
    return-void
.end method

.method private getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 212
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 213
    .local v0, "ret":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_1

    .line 214
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 215
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onFirstPlayerCreated()V

    .line 217
    :cond_0
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer;

    .end local v0    # "ret":Lorg/apache/cordova/media/AudioPlayer;
    invoke-direct {v0, p0, p1, p2}, Lorg/apache/cordova/media/AudioPlayer;-><init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .restart local v0    # "ret":Lorg/apache/cordova/media/AudioPlayer;
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :cond_1
    return-object v0
.end method

.method private onFirstPlayerCreated()V
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getVolumeControlStream()I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 383
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 384
    return-void
.end method

.method private onLastPlayerReleased()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 387
    iget v0, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    if-eq v0, v2, :cond_0

    .line 388
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget v1, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 389
    iput v2, p0, Lorg/apache/cordova/media/AudioHandler;->origVolumeStream:I

    .line 391
    :cond_0
    return-void
.end method

.method private release(Ljava/lang/String;)Z
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 229
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-nez v0, :cond_0

    .line 230
    const/4 v1, 0x0

    .line 236
    :goto_0
    return v1

    .line 232
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 233
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onLastPlayerReleased()V

    .line 235
    :cond_1
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    .line 236
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 14
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v12, p0, Lorg/apache/cordova/media/AudioHandler;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v12}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v6

    .line 75
    .local v6, "resourceApi":Lorg/apache/cordova/CordovaResourceApi;
    sget-object v9, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    .line 76
    .local v9, "status":Lorg/apache/cordova/PluginResult$Status;
    const-string v7, ""

    .line 78
    .local v7, "result":Ljava/lang/String;
    const-string v12, "startRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 79
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 82
    .local v10, "target":Ljava/lang/String;
    :try_start_0
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v6, v12}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v11

    .line 83
    .local v11, "targetUri":Landroid/net/Uri;
    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 87
    .end local v11    # "targetUri":Landroid/net/Uri;
    .local v4, "fileUriStr":Ljava/lang/String;
    :goto_0
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v4}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .end local v4    # "fileUriStr":Ljava/lang/String;
    .end local v10    # "target":Ljava/lang/String;
    :goto_1
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v7}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 147
    const/4 v12, 0x1

    :goto_2
    return v12

    .line 84
    .restart local v10    # "target":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 85
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    move-object v4, v10

    .restart local v4    # "fileUriStr":Ljava/lang/String;
    goto :goto_0

    .line 89
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v4    # "fileUriStr":Ljava/lang/String;
    .end local v10    # "target":Ljava/lang/String;
    :cond_0
    const-string v12, "stopRecordingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 90
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->stopRecordingAudio(Ljava/lang/String;)V

    goto :goto_1

    .line 92
    :cond_1
    const-string v12, "startPlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 93
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 96
    .restart local v10    # "target":Ljava/lang/String;
    :try_start_1
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v6, v12}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v11

    .line 97
    .restart local v11    # "targetUri":Landroid/net/Uri;
    invoke-virtual {v11}, Landroid/net/Uri;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 101
    .end local v11    # "targetUri":Landroid/net/Uri;
    .restart local v4    # "fileUriStr":Ljava/lang/String;
    :goto_3
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v4}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 98
    .end local v4    # "fileUriStr":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 99
    .restart local v2    # "e":Ljava/lang/IllegalArgumentException;
    move-object v4, v10

    .restart local v4    # "fileUriStr":Ljava/lang/String;
    goto :goto_3

    .line 103
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v4    # "fileUriStr":Ljava/lang/String;
    .end local v10    # "target":Ljava/lang/String;
    :cond_2
    const-string v12, "seekToAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 104
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getInt(I)I

    move-result v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->seekToAudio(Ljava/lang/String;I)V

    goto :goto_1

    .line 106
    :cond_3
    const-string v12, "pausePlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 107
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->pausePlayingAudio(Ljava/lang/String;)V

    goto :goto_1

    .line 109
    :cond_4
    const-string v12, "stopPlayingAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 110
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->stopPlayingAudio(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 111
    :cond_5
    const-string v12, "setVolume"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 113
    const/4 v12, 0x0

    :try_start_2
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->setVolume(Ljava/lang/String;F)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 114
    :catch_2
    move-exception v12

    goto/16 :goto_1

    .line 117
    :cond_6
    const-string v12, "getCurrentPositionAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 118
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->getCurrentPositionAudio(Ljava/lang/String;)F

    move-result v3

    .line 119
    .local v3, "f":F
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 120
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 122
    .end local v3    # "f":F
    :cond_7
    const-string v12, "getDurationAudio"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 123
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v12, v13}, Lorg/apache/cordova/media/AudioHandler;->getDurationAudio(Ljava/lang/String;Ljava/lang/String;)F

    move-result v3

    .line 124
    .restart local v3    # "f":F
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 125
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 127
    .end local v3    # "f":F
    :cond_8
    const-string v12, "create"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 128
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 129
    .local v5, "id":Ljava/lang/String;
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/cordova/media/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 130
    .local v8, "src":Ljava/lang/String;
    invoke-direct {p0, v5, v8}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    goto/16 :goto_1

    .line 132
    .end local v5    # "id":Ljava/lang/String;
    .end local v8    # "src":Ljava/lang/String;
    :cond_9
    const-string v12, "release"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 133
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {p0, v12}, Lorg/apache/cordova/media/AudioHandler;->release(Ljava/lang/String;)Z

    move-result v1

    .line 134
    .local v1, "b":Z
    new-instance v12, Lorg/apache/cordova/PluginResult;

    invoke-direct {v12, v9, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 135
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 137
    .end local v1    # "b":Z
    :cond_a
    const-string v12, "messageChannel"

    invoke-virtual {p1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 138
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    .line 139
    const/4 v12, 0x1

    goto/16 :goto_2

    .line 142
    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_2
.end method

.method public getAudioOutputDevice()I
    .locals 6

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 354
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "audio"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 355
    .local v0, "audiMgr":Landroid/media/AudioManager;
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 362
    :goto_0
    return v1

    .line 358
    :cond_0
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    move v1, v2

    .line 359
    goto :goto_0

    .line 362
    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getCurrentPositionAudio(Ljava/lang/String;)F
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 310
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 311
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 312
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getCurrentPosition()J

    move-result-wide v1

    long-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    .line 314
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
    .line 324
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 325
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->getDuration(Ljava/lang/String;)F

    move-result v1

    return v1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 154
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 155
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioHandler;->onLastPlayerReleased()V

    .line 157
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 160
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 161
    return-void

    .line 157
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 158
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->destroy()V

    goto :goto_0
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 181
    const-string v1, "telephone"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 184
    const-string v1, "ringing"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "offhook"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 187
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 204
    :cond_2
    :goto_1
    return-object v4

    .line 187
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 188
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->getState()I

    move-result v2

    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 189
    iget-object v2, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    goto :goto_0

    .line 197
    .end local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    :cond_4
    const-string v1, "idle"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 198
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_5

    .line 201
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->pausedForPhone:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    goto :goto_1

    .line 198
    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 199
    .restart local v0    # "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, v4}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 168
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioHandler;->onDestroy()V

    .line 169
    return-void
.end method

.method public pausePlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 287
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 288
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->pausePlaying()V

    .line 291
    :cond_0
    return-void
.end method

.method public seekToAudio(Ljava/lang/String;I)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "milliseconds"    # I

    .prologue
    .line 276
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 277
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 278
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->seekToPlaying(I)V

    .line 280
    :cond_0
    return-void
.end method

.method sendEventMessage(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "actionData"    # Lorg/json/JSONObject;

    .prologue
    .line 394
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 396
    .local v1, "message":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "action"

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 397
    if-eqz p2, :cond_0

    .line 398
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    :cond_0
    :goto_0
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 405
    .local v2, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 406
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_1

    .line 407
    iget-object v3, p0, Lorg/apache/cordova/media/AudioHandler;->messageChannel:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 409
    :cond_1
    return-void

    .line 400
    .end local v2    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v0

    .line 401
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lorg/apache/cordova/media/AudioHandler;->TAG:Ljava/lang/String;

    const-string v4, "Failed to create event message"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public setAudioOutputDevice(I)V
    .locals 7
    .param p1, "output"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 335
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 336
    .local v0, "audiMgr":Landroid/media/AudioManager;
    if-ne p1, v6, :cond_0

    .line 337
    invoke-virtual {v0, v4, v6, v3}, Landroid/media/AudioManager;->setRouting(III)V

    .line 345
    :goto_0
    return-void

    .line 339
    :cond_0
    if-ne p1, v5, :cond_1

    .line 340
    invoke-virtual {v0, v4, v5, v3}, Landroid/media/AudioManager;->setRouting(III)V

    goto :goto_0

    .line 343
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
    .line 373
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 374
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 375
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->setVolume(F)V

    .line 379
    :goto_0
    return-void

    .line 377
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "AudioHandler.setVolume() Error: Unknown Audio Player "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public startPlayingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 266
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 267
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    .line 268
    return-void
.end method

.method public startRecordingAudio(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/lang/String;

    .prologue
    .line 245
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/media/AudioHandler;->getOrCreatePlayer(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer;

    move-result-object v0

    .line 246
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    invoke-virtual {v0, p2}, Lorg/apache/cordova/media/AudioPlayer;->startRecording(Ljava/lang/String;)V

    .line 247
    return-void
.end method

.method public stopPlayingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 298
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 299
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 300
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->stopPlaying()V

    .line 302
    :cond_0
    return-void
.end method

.method public stopRecordingAudio(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-object v1, p0, Lorg/apache/cordova/media/AudioHandler;->players:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer;

    .line 255
    .local v0, "audio":Lorg/apache/cordova/media/AudioPlayer;
    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer;->stopRecording()V

    .line 258
    :cond_0
    return-void
.end method
