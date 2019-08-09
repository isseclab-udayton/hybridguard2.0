.class final Lcom/google/zxing/client/result/optional/NDEFRecord;
.super Ljava/lang/Object;
.source "NDEFRecord.java"


# static fields
.field public static final ACTION_WELL_KNOWN_TYPE:Ljava/lang/String; = "act"

.field public static final SMART_POSTER_WELL_KNOWN_TYPE:Ljava/lang/String; = "Sp"

.field private static final SUPPORTED_HEADER:I = 0x11

.field private static final SUPPORTED_HEADER_MASK:I = 0x3f

.field public static final TEXT_WELL_KNOWN_TYPE:Ljava/lang/String; = "T"

.field public static final URI_WELL_KNOWN_TYPE:Ljava/lang/String; = "U"


# instance fields
.field private final header:I

.field private final payload:[B

.field private final totalRecordLength:I

.field private final type:Ljava/lang/String;


# direct methods
.method private constructor <init>(ILjava/lang/String;[BI)V
    .locals 0
    .param p1, "header"    # I
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "payload"    # [B
    .param p4, "totalRecordLength"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput p1, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->header:I

    .line 43
    iput-object p2, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->type:Ljava/lang/String;

    .line 44
    iput-object p3, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->payload:[B

    .line 45
    iput p4, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->totalRecordLength:I

    .line 46
    return-void
.end method

.method static readRecord([BI)Lcom/google/zxing/client/result/optional/NDEFRecord;
    .locals 7
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 49
    aget-byte v5, p0, p1

    and-int/lit16 v0, v5, 0xff

    .line 52
    .local v0, "header":I
    xor-int/lit8 v5, v0, 0x11

    and-int/lit8 v5, v5, 0x3f

    if-eqz v5, :cond_0

    .line 53
    const/4 v5, 0x0

    .line 64
    :goto_0
    return-object v5

    .line 55
    :cond_0
    add-int/lit8 v5, p1, 0x1

    aget-byte v5, p0, v5

    and-int/lit16 v4, v5, 0xff

    .line 57
    .local v4, "typeLength":I
    add-int/lit8 v5, p1, 0x2

    aget-byte v5, p0, v5

    and-int/lit16 v2, v5, 0xff

    .line 59
    .local v2, "payloadLength":I
    add-int/lit8 v5, p1, 0x3

    const-string v6, "US-ASCII"

    invoke-static {p0, v5, v4, v6}, Lcom/google/zxing/client/result/optional/AbstractNDEFResultParser;->bytesToString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 61
    .local v3, "type":Ljava/lang/String;
    new-array v1, v2, [B

    .line 62
    .local v1, "payload":[B
    add-int/lit8 v5, p1, 0x3

    add-int/2addr v5, v4

    const/4 v6, 0x0

    invoke-static {p0, v5, v1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    new-instance v5, Lcom/google/zxing/client/result/optional/NDEFRecord;

    add-int/lit8 v6, v4, 0x3

    add-int/2addr v6, v2

    invoke-direct {v5, v0, v3, v1, v6}, Lcom/google/zxing/client/result/optional/NDEFRecord;-><init>(ILjava/lang/String;[BI)V

    goto :goto_0
.end method


# virtual methods
.method getPayload()[B
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->payload:[B

    return-object v0
.end method

.method getTotalRecordLength()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->totalRecordLength:I

    return v0
.end method

.method getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->type:Ljava/lang/String;

    return-object v0
.end method

.method isMessageBegin()Z
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->header:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isMessageEnd()Z
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/google/zxing/client/result/optional/NDEFRecord;->header:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
