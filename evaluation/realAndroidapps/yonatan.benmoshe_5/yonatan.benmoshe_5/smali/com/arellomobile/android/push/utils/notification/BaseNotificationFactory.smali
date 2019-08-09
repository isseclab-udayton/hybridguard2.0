.class public abstract Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
.super Ljava/lang/Object;
.source "BaseNotificationFactory.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mData:Landroid/os/Bundle;

.field private mHeader:Ljava/lang/String;

.field private mMessage:Ljava/lang/String;

.field private mNotification:Landroid/app/Notification;

.field private mSoundType:Lcom/arellomobile/android/push/preference/SoundType;

.field private mVibrateType:Lcom/arellomobile/android/push/preference/VibrateType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Lcom/arellomobile/android/push/preference/SoundType;Lcom/arellomobile/android/push/preference/VibrateType;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "data"    # Landroid/os/Bundle;
    .param p3, "header"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "soundType"    # Lcom/arellomobile/android/push/preference/SoundType;
    .param p6, "vibrateType"    # Lcom/arellomobile/android/push/preference/VibrateType;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mContext:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mData:Landroid/os/Bundle;

    .line 35
    iput-object p3, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mHeader:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mMessage:Ljava/lang/String;

    .line 37
    iput-object p5, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mSoundType:Lcom/arellomobile/android/push/preference/SoundType;

    .line 38
    iput-object p6, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mVibrateType:Lcom/arellomobile/android/push/preference/VibrateType;

    .line 39
    return-void
.end method

.method private static addPushNotificationSound(Landroid/content/Context;Landroid/app/Notification;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "notification"    # Landroid/app/Notification;
    .param p2, "sound"    # Ljava/lang/String;

    .prologue
    .line 100
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "raw"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 103
    .local v0, "soundId":I
    if-eqz v0, :cond_0

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android.resource://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 113
    .end local v0    # "soundId":I
    :goto_0
    return-void

    .line 112
    :cond_0
    iget v1, p1, Landroid/app/Notification;->defaults:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p1, Landroid/app/Notification;->defaults:I

    goto :goto_0
.end method

.method private static phoneHaveVibratePermission(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 121
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    :try_start_0
    const-string v3, "android.permission.VIBRATE"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 122
    .local v2, "result":I
    if-nez v2, :cond_0

    .line 124
    const/4 v3, 0x1

    .line 131
    .end local v2    # "result":I
    :goto_0
    return v3

    .line 127
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "PushWoosh"

    const-string v4, "error in checking vibrate permission"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addCancel()V
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    iget v1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x10

    iput v1, v0, Landroid/app/Notification;->flags:I

    .line 91
    return-void
.end method

.method public addLED(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 58
    if-nez p1, :cond_0

    .line 68
    :goto_0
    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    const/4 v1, -0x1

    iput v1, v0, Landroid/app/Notification;->ledARGB:I

    .line 65
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    iget v1, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Landroid/app/Notification;->flags:I

    .line 66
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    const/16 v1, 0x64

    iput v1, v0, Landroid/app/Notification;->ledOnMS:I

    .line 67
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    const/16 v1, 0x3e8

    iput v1, v0, Landroid/app/Notification;->ledOffMS:I

    goto :goto_0
.end method

.method public addSoundAndVibrate()V
    .locals 4

    .prologue
    .line 72
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mData:Landroid/os/Bundle;

    const-string v3, "s"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 73
    .local v1, "sound":Ljava/lang/String;
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mContext:Landroid/content/Context;

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 74
    .local v0, "am":Landroid/media/AudioManager;
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mSoundType:Lcom/arellomobile/android/push/preference/SoundType;

    sget-object v3, Lcom/arellomobile/android/push/preference/SoundType;->ALWAYS:Lcom/arellomobile/android/push/preference/SoundType;

    if-eq v2, v3, :cond_0

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mSoundType:Lcom/arellomobile/android/push/preference/SoundType;

    sget-object v3, Lcom/arellomobile/android/push/preference/SoundType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/SoundType;

    if-ne v2, v3, :cond_1

    .line 77
    :cond_0
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    invoke-static {v2, v3, v1}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->addPushNotificationSound(Landroid/content/Context;Landroid/app/Notification;Ljava/lang/String;)V

    .line 79
    :cond_1
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mVibrateType:Lcom/arellomobile/android/push/preference/VibrateType;

    sget-object v3, Lcom/arellomobile/android/push/preference/VibrateType;->ALWAYS:Lcom/arellomobile/android/push/preference/VibrateType;

    if-eq v2, v3, :cond_2

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mVibrateType:Lcom/arellomobile/android/push/preference/VibrateType;

    sget-object v3, Lcom/arellomobile/android/push/preference/VibrateType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

    if-ne v2, v3, :cond_3

    .line 81
    :cond_2
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->phoneHaveVibratePermission(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 83
    iget-object v2, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    iget v3, v2, Landroid/app/Notification;->defaults:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/app/Notification;->defaults:I

    .line 86
    :cond_3
    return-void
.end method

.method public generateNotification()V
    .locals 13

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "new_push_message"

    const-string v2, "string"

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    .line 44
    .local v12, "resId":I
    if-eqz v12, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, "newMessageString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getData()Landroid/os/Bundle;

    move-result-object v2

    iget-object v3, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mHeader:Ljava/lang/String;

    iget-object v4, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mMessage:Ljava/lang/String;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->generateNotificationInner(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v0

    iput-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    .line 52
    .end local v5    # "newMessageString":Ljava/lang/String;
    :goto_0
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->getData()Landroid/os/Bundle;

    move-result-object v8

    iget-object v9, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mHeader:Ljava/lang/String;

    iget-object v10, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mMessage:Ljava/lang/String;

    iget-object v11, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mMessage:Ljava/lang/String;

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->generateNotificationInner(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification;

    move-result-object v0

    iput-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    goto :goto_0
.end method

.method abstract generateNotificationInner(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification;
.end method

.method protected getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method protected getData()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mData:Landroid/os/Bundle;

    return-object v0
.end method

.method public getNotification()Landroid/app/Notification;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mNotification:Landroid/app/Notification;

    return-object v0
.end method

.method protected getSoundType()Lcom/arellomobile/android/push/preference/SoundType;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mSoundType:Lcom/arellomobile/android/push/preference/SoundType;

    return-object v0
.end method

.method protected getVibrateType()Lcom/arellomobile/android/push/preference/VibrateType;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;->mVibrateType:Lcom/arellomobile/android/push/preference/VibrateType;

    return-object v0
.end method
