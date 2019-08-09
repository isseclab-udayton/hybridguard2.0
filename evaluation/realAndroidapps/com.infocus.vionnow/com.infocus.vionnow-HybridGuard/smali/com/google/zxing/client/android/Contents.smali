.class public final Lcom/google/zxing/client/android/Contents;
.super Ljava/lang/Object;
.source "Contents.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/Contents$Type;
    }
.end annotation


# static fields
.field public static final EMAIL_KEYS:[Ljava/lang/String;

.field public static final PHONE_KEYS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    new-array v0, v5, [Ljava/lang/String;

    .line 87
    const-string v1, "phone"

    aput-object v1, v0, v2

    .line 88
    const-string v1, "secondary_phone"

    aput-object v1, v0, v3

    .line 89
    const-string v1, "tertiary_phone"

    aput-object v1, v0, v4

    .line 86
    sput-object v0, Lcom/google/zxing/client/android/Contents;->PHONE_KEYS:[Ljava/lang/String;

    .line 92
    new-array v0, v5, [Ljava/lang/String;

    .line 93
    const-string v1, "email"

    aput-object v1, v0, v2

    .line 94
    const-string v1, "secondary_email"

    aput-object v1, v0, v3

    .line 95
    const-string v1, "tertiary_email"

    aput-object v1, v0, v4

    .line 92
    sput-object v0, Lcom/google/zxing/client/android/Contents;->EMAIL_KEYS:[Ljava/lang/String;

    .line 27
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method
