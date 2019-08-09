.class public Lorg/apache/cordova/media/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/media/AudioPlayer$STATE;,
        Lorg/apache/cordova/media/AudioPlayer$MODE;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AudioPlayer"

.field private static MEDIA_DURATION:I

.field private static MEDIA_ERROR:I

.field private static MEDIA_ERR_ABORTED:I

.field private static MEDIA_ERR_NONE_ACTIVE:I

.field private static MEDIA_POSITION:I

.field private static MEDIA_STATE:I


# instance fields
.field private audioFile:Ljava/lang/String;

.field private duration:F

.field private handler:Lorg/apache/cordova/media/AudioHandler;

.field private id:Ljava/lang/String;

.field private mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

.field private player:Landroid/media/MediaPlayer;

.field private prepareOnly:Z

.field private recorder:Landroid/media/MediaRecorder;

.field private seekOnPrepared:I

.field private state:Lorg/apache/cordova/media/AudioPlayer$STATE;

.field private tempFile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 63
    sput v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_STATE:I

    .line 64
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_DURATION:I

    .line 65
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    .line 66
    const/16 v0, 0x9

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERROR:I

    .line 69
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    .line 70
    sput v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/media/AudioHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "handler"    # Lorg/apache/cordova/media/AudioHandler;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->NONE:Lorg/apache/cordova/media/AudioPlayer$MODE;

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    .line 78
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_NONE:Lorg/apache/cordova/media/AudioPlayer$STATE;

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    .line 80
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 81
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    .line 83
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 84
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 97
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    .line 98
    iput-object p2, p0, Lorg/apache/cordova/media/AudioPlayer;->id:Ljava/lang/String;

    .line 99
    iput-object p3, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 100
    new-instance v0, Landroid/media/MediaRecorder;

    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 102
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/tmprecording.3gp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    .line 108
    :goto_0
    return-void

    .line 105
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/data/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/cache/tmprecording.3gp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    goto :goto_0
.end method

.method private getDurationInSeconds()F
    .locals 2

    .prologue
    .line 378
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private loadAudioFile(Ljava/lang/String;)V
    .locals 10
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 538
    invoke-virtual {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->isStreaming(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 539
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 540
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 542
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V

    .line 543
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 544
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 545
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 571
    :goto_0
    return-void

    .line 548
    :cond_0
    const-string v0, "/android_asset/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 549
    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 550
    .local v6, "f":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    iget-object v0, v0, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    .line 551
    .local v7, "fd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 564
    .end local v6    # "f":Ljava/lang/String;
    .end local v7    # "fd":Landroid/content/res/AssetFileDescriptor;
    :goto_1
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 565
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 566
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 569
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->getDurationInSeconds()F

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0

    .line 554
    :cond_1
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 555
    .local v9, "fp":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 556
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 557
    .local v8, "fileInputStream":Ljava/io/FileInputStream;
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v8}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 558
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    goto :goto_1

    .line 561
    .end local v8    # "fileInputStream":Ljava/io/FileInputStream;
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private playMode()Z
    .locals 2

    .prologue
    .line 449
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$MODE:[I

    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-virtual {v1}, Lorg/apache/cordova/media/AudioPlayer$MODE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 460
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 451
    :pswitch_1
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V

    goto :goto_0

    .line 456
    :pswitch_2
    const-string v0, "AudioPlayer"

    const-string v1, "AudioPlayer Error: Can\'t play in record mode."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 458
    const/4 v0, 0x0

    goto :goto_1

    .line 449
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private readyPlayer(Ljava/lang/String;)Z
    .locals 5
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 469
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->playMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 470
    sget-object v3, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$STATE:[I

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v4}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 523
    const-string v2, "AudioPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioPlayer Error: startPlaying() called during invalid state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 527
    :cond_0
    :goto_0
    return v1

    .line 472
    :pswitch_0
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-nez v2, :cond_1

    .line 473
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 476
    :cond_1
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 477
    :catch_0
    move-exception v0

    .line 478
    .local v0, "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 483
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_1
    const-string v2, "AudioPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AudioPlayer Loading: startPlaying() called during media preparation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v4}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    goto :goto_0

    :pswitch_2
    move v1, v2

    .line 489
    goto :goto_0

    .line 492
    :pswitch_3
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_3

    .line 494
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-nez v3, :cond_2

    .line 495
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 496
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 499
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 500
    :catch_1
    move-exception v0

    .line 501
    .restart local v0    # "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 507
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v3, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 508
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->pause()V

    move v1, v2

    .line 509
    goto :goto_0

    .line 513
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->reset()V

    .line 515
    :try_start_2
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->loadAudioFile(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 516
    :catch_2
    move-exception v0

    .line 517
    .restart local v0    # "e":Ljava/lang/Exception;
    sget v2, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 470
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private sendErrorStatus(I)V
    .locals 3
    .param p1, "errorCode"    # I

    .prologue
    .line 574
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERROR:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 575
    return-void
.end method

.method private sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V
    .locals 6
    .param p1, "messageType"    # I
    .param p2, "additionalCode"    # Ljava/lang/Integer;
    .param p3, "value"    # Ljava/lang/Float;

    .prologue
    .line 579
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 580
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Only one of additionalCode or value can be specified, not both"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 583
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 585
    .local v2, "statusDetails":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "id"

    iget-object v4, p0, Lorg/apache/cordova/media/AudioPlayer;->id:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 586
    const-string v3, "msgType"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 587
    if-eqz p2, :cond_2

    .line 588
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 589
    .local v0, "code":Lorg/json/JSONObject;
    const-string v3, "code"

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 590
    const-string v3, "value"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 599
    .end local v0    # "code":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    const-string v4, "status"

    invoke-virtual {v3, v4, v2}, Lorg/apache/cordova/media/AudioHandler;->sendEventMessage(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 600
    return-void

    .line 592
    :cond_2
    if-eqz p3, :cond_1

    .line 593
    :try_start_1
    const-string v3, "value"

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 595
    :catch_0
    move-exception v1

    .line 596
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "AudioPlayer"

    const-string v4, "Failed to create status details"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private setMode(Lorg/apache/cordova/media/AudioPlayer$MODE;)V
    .locals 1
    .param p1, "mode"    # Lorg/apache/cordova/media/AudioPlayer$MODE;

    .prologue
    .line 419
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    if-eq v0, p1, :cond_0

    .line 423
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    .line 424
    return-void
.end method

.method private setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V
    .locals 3
    .param p1, "state"    # Lorg/apache/cordova/media/AudioPlayer$STATE;

    .prologue
    .line 407
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, p1, :cond_0

    .line 408
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_STATE:I

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 410
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    .line 411
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 115
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 116
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_1

    .line 117
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 118
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 120
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 121
    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    .line 123
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_3

    .line 124
    invoke-virtual {p0}, Lorg/apache/cordova/media/AudioPlayer;->stopRecording()V

    .line 125
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 126
    iput-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    .line 128
    :cond_3
    return-void
.end method

.method public getCurrentPosition()J
    .locals 5

    .prologue
    .line 288
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v1, v2, :cond_1

    .line 289
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 290
    .local v0, "curPos":I
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    const/4 v2, 0x0

    int-to-float v3, v0

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 291
    int-to-long v2, v0

    .line 294
    .end local v0    # "curPos":I
    :goto_0
    return-wide v2

    :cond_1
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public getDuration(Ljava/lang/String;)F
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 326
    const/high16 v0, -0x40000000    # -2.0f

    .line 341
    :goto_0
    return v0

    .line 330
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 331
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0

    .line 336
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 337
    invoke-virtual {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->startPlaying(Ljava/lang/String;)V

    .line 341
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    goto :goto_0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 432
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v0

    return v0
.end method

.method public isStreaming(Ljava/lang/String;)Z
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 306
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "rtsp://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 307
    :cond_0
    const/4 v0, 0x1

    .line 310
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public moveFile(Ljava/lang/String;)V
    .locals 5
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 173
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    .local v0, "f":Ljava/io/File;
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 176
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mounted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 183
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "renaming "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "logMsg":Ljava/lang/String;
    const-string v2, "AudioPlayer"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "AudioPlayer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FAILED "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    :cond_1
    return-void

    .line 179
    .end local v1    # "logMsg":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/cordova/media/AudioPlayer;->handler:Lorg/apache/cordova/media/AudioHandler;

    iget-object v3, v3, Lorg/apache/cordova/media/AudioHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "player"    # Landroid/media/MediaPlayer;

    .prologue
    .line 278
    const-string v0, "AudioPlayer"

    const-string v1, "on completion is calling stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 280
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I

    .prologue
    .line 390
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer.onError("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 394
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 397
    invoke-direct {p0, p2}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    .line 398
    const/4 v0, 0x0

    return v0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "player"    # Landroid/media/MediaPlayer;

    .prologue
    .line 352
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 354
    iget v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    invoke-virtual {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->seekToPlaying(I)V

    .line 356
    iget-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    if-nez v0, :cond_0

    .line 357
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 358
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 359
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 364
    :goto_0
    invoke-direct {p0}, Lorg/apache/cordova/media/AudioPlayer;->getDurationInSeconds()F

    move-result v0

    iput v0, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    .line 366
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    .line 369
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_DURATION:I

    const/4 v1, 0x0

    iget v2, p0, Lorg/apache/cordova/media/AudioPlayer;->duration:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 370
    return-void

    .line 361
    :cond_0
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STARTING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    goto :goto_0
.end method

.method public pausePlaying()V
    .locals 3

    .prologue
    .line 246
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 248
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 254
    :goto_0
    return-void

    .line 251
    :cond_0
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer Error: pausePlaying() called during invalid state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0
.end method

.method public seekToPlaying(I)V
    .locals 4
    .param p1, "milliseconds"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->readyPlayer(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 232
    const-string v0, "AudioPlayer"

    const-string v1, "Send a onStatus update for the new seek"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_POSITION:I

    const/4 v1, 0x0

    int-to-float v2, p1

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer;->sendStatusChange(ILjava/lang/Integer;Ljava/lang/Float;)V

    .line 238
    :goto_0
    return-void

    .line 236
    :cond_0
    iput p1, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    goto :goto_0
.end method

.method public setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 441
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 442
    return-void
.end method

.method public startPlaying(Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 217
    invoke-direct {p0, p1}, Lorg/apache/cordova/media/AudioPlayer;->readyPlayer(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 218
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 219
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 220
    iput v1, p0, Lorg/apache/cordova/media/AudioPlayer;->seekOnPrepared:I

    .line 224
    :goto_0
    return-void

    .line 222
    :cond_0
    iput-boolean v1, p0, Lorg/apache/cordova/media/AudioPlayer;->prepareOnly:Z

    goto :goto_0
.end method

.method public startRecording(Ljava/lang/String;)V
    .locals 4
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 136
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$1;->$SwitchMap$org$apache$cordova$media$AudioPlayer$MODE:[I

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->mode:Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$MODE;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 164
    :goto_0
    return-void

    .line 138
    :pswitch_0
    const-string v1, "AudioPlayer"

    const-string v2, "AudioPlayer Error: Can\'t record in play mode."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 142
    :pswitch_1
    iput-object p1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    .line 143
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 144
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, v3}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 145
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, v3}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 146
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->tempFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 148
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->prepare()V

    .line 149
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 150
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 158
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_1
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 154
    :catch_1
    move-exception v0

    .line 155
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 161
    .end local v0    # "e":Ljava/io/IOException;
    :pswitch_2
    const-string v1, "AudioPlayer"

    const-string v2, "AudioPlayer Error: Already recording."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    sget v1, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_ABORTED:I

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0

    .line 136
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public stopPlaying()V
    .locals 3

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_PAUSED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v0, v1, :cond_1

    .line 261
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 262
    iget-object v0, p0, Lorg/apache/cordova/media/AudioPlayer;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 263
    const-string v0, "AudioPlayer"

    const-string v1, "stopPlaying is calling stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 270
    :goto_0
    return-void

    .line 267
    :cond_1
    const-string v0, "AudioPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AudioPlayer Error: stopPlaying() called during invalid state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-virtual {v2}, Lorg/apache/cordova/media/AudioPlayer$STATE;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    sget v0, Lorg/apache/cordova/media/AudioPlayer;->MEDIA_ERR_NONE_ACTIVE:I

    invoke-direct {p0, v0}, Lorg/apache/cordova/media/AudioPlayer;->sendErrorStatus(I)V

    goto :goto_0
.end method

.method public stopRecording()V
    .locals 3

    .prologue
    .line 192
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_1

    .line 194
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->state:Lorg/apache/cordova/media/AudioPlayer$STATE;

    sget-object v2, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_RUNNING:Lorg/apache/cordova/media/AudioPlayer$STATE;

    if-ne v1, v2, :cond_0

    .line 195
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->stop()V

    .line 196
    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$STATE;->MEDIA_STOPPED:Lorg/apache/cordova/media/AudioPlayer$STATE;

    invoke-direct {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->setState(Lorg/apache/cordova/media/AudioPlayer$STATE;)V

    .line 198
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 199
    iget-object v1, p0, Lorg/apache/cordova/media/AudioPlayer;->audioFile:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/apache/cordova/media/AudioPlayer;->moveFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    :cond_1
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
