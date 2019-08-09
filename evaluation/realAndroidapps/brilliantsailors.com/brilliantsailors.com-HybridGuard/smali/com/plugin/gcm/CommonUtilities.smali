.class public final Lcom/plugin/gcm/CommonUtilities;
.super Ljava/lang/Object;
.source "CommonUtilities.java"


# static fields
.field static final DISPLAY_MESSAGE_ACTION:Ljava/lang/String; = "com.phonegap.helloworld.DISPLAY_MESSAGE"

.field static final EXTRA_MESSAGE:Ljava/lang/String; = "message"

.field static final SENDER_ID:Ljava/lang/String; = "232424554498"

.field static final SERVER_URL:Ljava/lang/String; = "http://199.38.81.11/aapi/gcm_wapppress/register.php"

.field static final TAG:Ljava/lang/String; = "WappPress"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static displayMessage(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 36
    return-void
.end method
