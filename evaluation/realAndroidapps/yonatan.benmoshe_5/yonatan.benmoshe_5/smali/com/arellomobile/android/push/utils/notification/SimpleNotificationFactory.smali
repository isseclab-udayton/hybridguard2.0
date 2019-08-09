.class public Lcom/arellomobile/android/push/utils/notification/SimpleNotificationFactory;
.super Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
.source "SimpleNotificationFactory.java"


# static fields
.field private static final sImageHeight:I = 0x80


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
    .line 21
    invoke-direct/range {p0 .. p6}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;-><init>(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Lcom/arellomobile/android/push/preference/SoundType;Lcom/arellomobile/android/push/preference/VibrateType;)V

    .line 22
    return-void
.end method


# virtual methods
.method generateNotificationInner(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "data"    # Landroid/os/Bundle;
    .param p3, "header"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "tickerTitle"    # Ljava/lang/String;

    .prologue
    .line 27
    const-string v5, "i"

    invoke-virtual {p2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/arellomobile/android/push/utils/notification/Helper;->tryToGetIconFormStringOrGetFromApplication(Ljava/lang/String;Landroid/content/Context;)I

    move-result v4

    .line 29
    .local v4, "simpleIcon":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 33
    .local v3, "res":Landroid/content/res/Resources;
    const/4 v0, 0x0

    .line 34
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const-string v5, "ci"

    invoke-virtual {p2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "customIcon":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 37
    const/16 v5, 0x80

    invoke-static {v1, p1, v5}, Lcom/arellomobile/android/push/utils/notification/Helper;->tryToGetBitmapFromInternet(Ljava/lang/String;Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 40
    :cond_0
    new-instance v2, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v2, p1}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 41
    .local v2, "notificationBuilder":Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;
    invoke-virtual {v2, p3}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 42
    invoke-virtual {v2, p4}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 43
    invoke-virtual {v2, p5}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setWhen(J)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 46
    new-instance v5, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v5}, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v5, p4}, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setStyle(Lcom/pushwoosh/support/v4/app/NotificationCompat$Style;)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 48
    invoke-virtual {v2, v4}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 50
    if-eqz v0, :cond_1

    .line 52
    invoke-virtual {v2, v0}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .line 55
    :cond_1
    invoke-virtual {v2}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    return-object v5
.end method
