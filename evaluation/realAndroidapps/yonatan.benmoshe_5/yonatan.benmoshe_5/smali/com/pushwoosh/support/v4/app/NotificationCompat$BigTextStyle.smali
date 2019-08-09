.class public Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;
.super Lcom/pushwoosh/support/v4/app/NotificationCompat$Style;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pushwoosh/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BigTextStyle"
.end annotation


# instance fields
.field mBigText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 710
    invoke-direct {p0}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Style;-><init>()V

    .line 711
    return-void
.end method

.method public constructor <init>(Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;)V
    .locals 0
    .param p1, "builder"    # Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 713
    invoke-direct {p0}, Lcom/pushwoosh/support/v4/app/NotificationCompat$Style;-><init>()V

    .line 714
    invoke-virtual {p0, p1}, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->setBuilder(Lcom/pushwoosh/support/v4/app/NotificationCompat$Builder;)V

    .line 715
    return-void
.end method


# virtual methods
.method public bigText(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;
    .locals 0
    .param p1, "cs"    # Ljava/lang/CharSequence;

    .prologue
    .line 740
    iput-object p1, p0, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    .line 741
    return-object p0
.end method

.method public setBigContentTitle(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;
    .locals 0
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 722
    iput-object p1, p0, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->mBigContentTitle:Ljava/lang/CharSequence;

    .line 723
    return-object p0
.end method

.method public setSummaryText(Ljava/lang/CharSequence;)Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;
    .locals 1
    .param p1, "cs"    # Ljava/lang/CharSequence;

    .prologue
    .line 730
    iput-object p1, p0, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->mSummaryText:Ljava/lang/CharSequence;

    .line 731
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pushwoosh/support/v4/app/NotificationCompat$BigTextStyle;->mSummaryTextSet:Z

    .line 732
    return-object p0
.end method
