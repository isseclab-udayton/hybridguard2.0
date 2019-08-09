.class public Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;
.super Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;
.source "BannerNotificationFactory.java"


# static fields
.field public static final sNotificationLayout:Ljava/lang/String; = "notification"


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
    .line 26
    invoke-direct/range {p0 .. p6}, Lcom/arellomobile/android/push/utils/notification/BaseNotificationFactory;-><init>(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Lcom/arellomobile/android/push/preference/SoundType;Lcom/arellomobile/android/push/preference/VibrateType;)V

    .line 27
    return-void
.end method


# virtual methods
.method generateNotificationInner(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "data"    # Landroid/os/Bundle;
    .param p3, "header"    # Ljava/lang/String;
    .param p4, "messae"    # Ljava/lang/String;
    .param p5, "tickerTitle"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 33
    new-instance v3, Landroid/app/Notification;

    invoke-direct {v3}, Landroid/app/Notification;-><init>()V

    .line 35
    .local v3, "notification":Landroid/app/Notification;
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "notification"

    const-string v7, "layout"

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 37
    .local v1, "layoutId":I
    if-nez v1, :cond_0

    .line 39
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    .line 42
    :cond_0
    new-instance v4, Landroid/widget/RemoteViews;

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 44
    .local v4, "remoteViews":Landroid/widget/RemoteViews;
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getData()Landroid/os/Bundle;

    move-result-object v5

    const-string v6, "b"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "link":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, -0x1

    invoke-static {v2, v5, v6}, Lcom/arellomobile/android/push/utils/notification/Helper;->tryToGetBitmapFromInternet(Ljava/lang/String;Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 48
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2

    .line 50
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "image"

    const-string v7, "id"

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    const-string v6, "setImageBitmap"

    invoke-virtual {v4, v5, v6, v0}, Landroid/widget/RemoteViews;->setBitmap(ILjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 58
    :goto_0
    iput-object v4, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 59
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_1

    .line 61
    iput-object v4, v3, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    .line 64
    :cond_1
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v5, v6, :cond_3

    .line 66
    iput-object v4, v3, Landroid/app/Notification;->tickerView:Landroid/widget/RemoteViews;

    .line 73
    :goto_1
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getData()Landroid/os/Bundle;

    move-result-object v5

    const-string v6, "i"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arellomobile/android/push/utils/notification/Helper;->tryToGetIconFormStringOrGetFromApplication(Ljava/lang/String;Landroid/content/Context;)I

    move-result v5

    iput v5, v3, Landroid/app/Notification;->icon:I

    .line 75
    return-object v3

    .line 54
    :cond_2
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "image"

    const-string v7, "id"

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    const-string v7, "setImageBitmap"

    .line 55
    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {p0}, Lcom/arellomobile/android/push/utils/notification/BannerNotificationFactory;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    check-cast v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 54
    invoke-virtual {v4, v6, v7, v5}, Landroid/widget/RemoteViews;->setBitmap(ILjava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 70
    :cond_3
    iput-object p5, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    goto :goto_1
.end method
