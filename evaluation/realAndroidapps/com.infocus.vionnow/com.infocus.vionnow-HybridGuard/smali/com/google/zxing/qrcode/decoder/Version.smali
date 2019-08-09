.class public final Lcom/google/zxing/qrcode/decoder/Version;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/decoder/Version$ECB;,
        Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    }
.end annotation


# static fields
.field private static final VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

.field private static final VERSION_DECODE_INFO:[I


# instance fields
.field private final alignmentPatternCenters:[I

.field private final ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

.field private final totalCodewords:I

.field private final versionNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/16 v0, 0x22

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    .line 43
    invoke-static {}, Lcom/google/zxing/qrcode/decoder/Version;->buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    .line 27
    return-void

    .line 33
    :array_0
    .array-data 4
        0x7c94
        0x85bc
        0x9a99
        0xa4d3
        0xbbf6
        0xc762
        0xd847
        0xe60d
        0xf928
        0x10b78
        0x1145d
        0x12a17
        0x13532
        0x149a6
        0x15683
        0x168c9
        0x177ec
        0x18ec4
        0x191e1
        0x1afab
        0x1b08e
        0x1cc1a
        0x1d33f
        0x1ed75
        0x1f250
        0x209d5
        0x216f0
        0x228ba
        0x2379f
        0x24b0b
        0x2542e
        0x26a64
        0x27541
        0x28c69
    .end array-data
.end method

.method private constructor <init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V
    .locals 7
    .param p1, "versionNumber"    # I
    .param p2, "alignmentPatternCenters"    # [I
    .param p3, "ecBlocks1"    # Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .param p4, "ecBlocks2"    # Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .param p5, "ecBlocks3"    # Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .param p6, "ecBlocks4"    # Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    .line 57
    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    .line 58
    const/4 v5, 0x4

    new-array v5, v5, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    const/4 v6, 0x2

    aput-object p5, v5, v6

    const/4 v6, 0x3

    aput-object p6, v5, v6

    iput-object v5, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    .line 59
    const/4 v4, 0x0

    .line 60
    .local v4, "total":I
    invoke-virtual {p3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v1

    .line 61
    .local v1, "ecCodewords":I
    invoke-virtual {p3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v2

    .line 62
    .local v2, "ecbArray":[Lcom/google/zxing/qrcode/decoder/Version$ECB;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v2

    if-lt v3, v5, :cond_0

    .line 66
    iput v4, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    .line 67
    return-void

    .line 63
    :cond_0
    aget-object v0, v2, v3

    .line 64
    .local v0, "ecBlock":Lcom/google/zxing/qrcode/decoder/Version$ECB;
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v6

    add-int/2addr v6, v1

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 62
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;
    .locals 14

    .prologue
    .line 254
    const/16 v0, 0x28

    new-array v7, v0, [Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v8, 0x0

    .line 255
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x1

    const/4 v2, 0x0

    new-array v2, v2, [I

    .line 256
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/4 v4, 0x7

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x13

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 257
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0xa

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x10

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 258
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0xd

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0xd

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 259
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x11

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x9

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 255
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x1

    .line 260
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x2

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    .line 261
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0xa

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x22

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 262
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x10

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x1c

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 263
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x16

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 264
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 260
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x2

    .line 265
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x3

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    .line 266
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0xf

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x37

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 267
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x2c

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 268
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x12

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0x11

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 269
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x16

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0xd

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 265
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x3

    .line 270
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x4

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_2

    .line 271
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x14

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x50

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 272
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x12

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x20

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 273
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1a

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 274
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x10

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x9

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 270
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x4

    .line 275
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x5

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_3

    .line 276
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1a

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x6c

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 277
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x18

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x2b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 278
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x12

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0xf

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 279
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 278
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 280
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x16

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0xb

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 281
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x2

    const/16 v13, 0xc

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 280
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 275
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x5

    .line 282
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x6

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_4

    .line 283
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x12

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x44

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 284
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x10

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x1b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 285
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x18

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x13

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 286
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 282
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x6

    .line 287
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v1, 0x7

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_5

    .line 288
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x14

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x4e

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 289
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x12

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x1f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 290
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x12

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0xe

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 291
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 290
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 292
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1a

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xd

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 293
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x1

    const/16 v13, 0xe

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 292
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 287
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x7

    .line 294
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x8

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_6

    .line 295
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x18

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x61

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 296
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x16

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x26

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 297
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0x27

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 296
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 298
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x16

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x12

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 299
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x13

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 298
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 300
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1a

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xe

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 301
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x2

    const/16 v13, 0xf

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 300
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 294
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x8

    .line 302
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x9

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_7

    .line 303
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x74

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 304
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x16

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x3

    const/16 v10, 0x24

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 305
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0x25

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 304
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 306
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x14

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x10

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 307
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x11

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 306
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 308
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xc

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 309
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x4

    const/16 v13, 0xd

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 308
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 302
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x9

    .line 310
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xa

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_8

    .line 311
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x12

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x44

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 312
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x45

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 311
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 313
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x2b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 314
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x2c

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 313
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 315
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x18

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x6

    const/16 v11, 0x13

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 316
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x14

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 315
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 317
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 318
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x2

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 317
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 310
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xa

    .line 319
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xb

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_9

    .line 320
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x14

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x4

    const/16 v9, 0x51

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 321
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1e

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x32

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 322
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x33

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 321
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 323
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1c

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 324
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x17

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 323
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 325
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x3

    const/16 v12, 0xc

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 326
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x8

    const/16 v13, 0xd

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 325
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 319
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xb

    .line 327
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xc

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_a

    .line 328
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x18

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x5c

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 329
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x5d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 328
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 330
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x16

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x6

    const/16 v10, 0x24

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 331
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x2

    const/16 v11, 0x25

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 330
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 332
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1a

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x14

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 333
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0x15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 332
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 334
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    const/16 v12, 0xe

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 335
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x4

    const/16 v13, 0xf

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 334
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 327
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xc

    .line 336
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xd

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_b

    .line 337
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1a

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x4

    const/16 v9, 0x6b

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 338
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x16

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x8

    const/16 v10, 0x25

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 339
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x26

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 338
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 340
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x18

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x8

    const/16 v11, 0x14

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 341
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 340
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 342
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x16

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0xb

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 343
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x4

    const/16 v13, 0xc

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 342
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 336
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xd

    .line 344
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xe

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_c

    .line 345
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x3

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 346
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x74

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 345
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 347
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x18

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x28

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 348
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x5

    const/16 v11, 0x29

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 347
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 349
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x14

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xb

    const/16 v11, 0x10

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 350
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x5

    const/16 v12, 0x11

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 349
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 351
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xc

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 352
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x5

    const/16 v13, 0xd

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 351
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 344
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xe

    .line 353
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0xf

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_d

    .line 354
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x16

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x5

    const/16 v9, 0x57

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 355
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x58

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 354
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 356
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x18

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x5

    const/16 v10, 0x29

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 357
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x5

    const/16 v11, 0x2a

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 356
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 358
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x5

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 359
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 358
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 360
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xc

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 361
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x7

    const/16 v13, 0xd

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 360
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 353
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xf

    .line 362
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x10

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_e

    .line 363
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x18

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x5

    const/16 v9, 0x62

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 364
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x63

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 363
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 365
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x7

    const/16 v10, 0x2d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 366
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x3

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 365
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 367
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x18

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xf

    const/16 v11, 0x13

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 368
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x14

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 367
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 369
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x3

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 370
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 369
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 362
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x10

    .line 371
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x11

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_f

    .line 372
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x1

    const/16 v9, 0x6b

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 373
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x5

    const/16 v10, 0x6c

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 372
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 374
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xa

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 375
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 374
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 376
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1c

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 377
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    const/16 v12, 0x17

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 376
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 378
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0xe

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 379
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v13, 0xf

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 378
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 371
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x11

    .line 380
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x12

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_10

    .line 381
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x5

    const/16 v9, 0x78

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 382
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x79

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 381
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 383
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x9

    const/16 v10, 0x2b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 384
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x2c

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 383
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 385
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1c

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x11

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 386
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x17

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 385
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 387
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0xe

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 388
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v13, 0xf

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 387
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 380
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x12

    .line 389
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x13

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_11

    .line 390
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x3

    const/16 v9, 0x71

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 391
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x72

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 390
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 392
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x3

    const/16 v10, 0x2c

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 393
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xb

    const/16 v11, 0x2d

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 392
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 394
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1a

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x11

    const/16 v11, 0x15

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 395
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x16

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 394
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 396
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1a

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x9

    const/16 v12, 0xd

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 397
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x10

    const/16 v13, 0xe

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 396
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 389
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x13

    .line 398
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x14

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_12

    .line 399
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x3

    const/16 v9, 0x6b

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 400
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x5

    const/16 v10, 0x6c

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 399
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 401
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x3

    const/16 v10, 0x29

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 402
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xd

    const/16 v11, 0x2a

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 401
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 403
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xf

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 404
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x5

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 403
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 405
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 406
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xa

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 405
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 398
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x14

    .line 407
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x15

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_13

    .line 408
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x4

    const/16 v9, 0x74

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 409
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x75

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 408
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 410
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1a

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x11

    const/16 v10, 0x2a

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 411
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1c

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x11

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 412
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0x17

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 411
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 413
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 414
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x6

    const/16 v13, 0x11

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 413
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 407
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x15

    .line 415
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x16

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_14

    .line 416
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x2

    const/16 v9, 0x6f

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 417
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x7

    const/16 v10, 0x70

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 416
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 418
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x11

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 419
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x7

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 420
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 419
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 421
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0xd

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 415
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x16

    .line 422
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x17

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_15

    .line 423
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x4

    const/16 v9, 0x79

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 424
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x5

    const/16 v10, 0x7a

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 423
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 425
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 426
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xe

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 425
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 427
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xb

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 428
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 427
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 429
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 430
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 429
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 422
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x17

    .line 431
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x18

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_16

    .line 432
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x6

    const/16 v9, 0x75

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 433
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x76

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 432
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 434
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x6

    const/16 v10, 0x2d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 435
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xe

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 434
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 436
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xb

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 437
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 436
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 438
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1e

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 439
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x2

    const/16 v13, 0x11

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 438
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 431
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x18

    .line 440
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x19

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_17

    .line 441
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1a

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x8

    const/16 v9, 0x6a

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 442
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x6b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 441
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 443
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x8

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 444
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xd

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 443
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 445
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x7

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 446
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 445
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 447
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 448
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 447
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 440
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x19

    .line 449
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1a

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_18

    .line 450
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1c

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0xa

    const/16 v9, 0x72

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 451
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x73

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 450
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 452
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x13

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 453
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 452
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 454
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1c

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x1c

    const/16 v11, 0x16

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 455
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0x17

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 454
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 456
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x21

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 457
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x4

    const/16 v13, 0x11

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 456
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 449
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1a

    .line 458
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1b

    const/4 v2, 0x5

    new-array v2, v2, [I

    fill-array-data v2, :array_19

    .line 459
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x8

    const/16 v9, 0x7a

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 460
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x7b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 459
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 461
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x16

    const/16 v10, 0x2d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 462
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x3

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 461
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 463
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x8

    const/16 v11, 0x17

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 464
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    const/16 v12, 0x18

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 463
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 465
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 466
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x1c

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 465
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 458
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1b

    .line 467
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1c

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1a

    .line 468
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x3

    const/16 v9, 0x75

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 469
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xa

    const/16 v10, 0x76

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 468
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 470
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x3

    const/16 v10, 0x2d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 471
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x17

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 470
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 472
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x4

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 473
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 472
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 474
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 475
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x1f

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 474
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 467
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1c

    .line 476
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1d

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1b

    .line 477
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x7

    const/16 v9, 0x74

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 478
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x7

    const/16 v10, 0x75

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 477
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 479
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x15

    const/16 v10, 0x2d

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 480
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x7

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 479
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 481
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x1

    const/16 v11, 0x17

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 482
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x25

    const/16 v12, 0x18

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 481
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 483
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 484
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x1a

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 483
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 476
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1d

    .line 485
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1e

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1c

    .line 486
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x5

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 487
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xa

    const/16 v10, 0x74

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 486
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 488
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x13

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 489
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xa

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 488
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 490
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xf

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 491
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x19

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 490
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 492
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 493
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x19

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 492
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 485
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1e

    .line 494
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x1f

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1d

    .line 495
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0xd

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 496
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x3

    const/16 v10, 0x74

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 495
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 497
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x2

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 498
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x1d

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 497
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 499
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x2a

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 500
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 499
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 501
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 502
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x1c

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 501
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 494
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1f

    .line 503
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x20

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1e

    .line 504
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x11

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 505
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xa

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 506
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x17

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 505
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 507
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xa

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 508
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x23

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 507
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 509
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 510
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x23

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 509
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 503
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x20

    .line 511
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x21

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_1f

    .line 512
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x11

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 513
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x1

    const/16 v10, 0x74

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 512
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 514
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xe

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 515
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x15

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 514
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 516
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x1d

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 517
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 516
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 518
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 519
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2e

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 518
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 511
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x21

    .line 520
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x22

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_20

    .line 521
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0xd

    const/16 v9, 0x73

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 522
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x6

    const/16 v10, 0x74

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 521
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 523
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xe

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 524
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x17

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 523
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 525
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x2c

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 526
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 525
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 527
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x3b

    const/16 v12, 0x10

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 528
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x1

    const/16 v13, 0x11

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 527
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 520
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x22

    .line 529
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x23

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_21

    .line 530
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0xc

    const/16 v9, 0x79

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 531
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x7

    const/16 v10, 0x7a

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 530
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 532
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xc

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 533
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x1a

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 532
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 534
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x27

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 535
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 534
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 536
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 537
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x29

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 536
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 529
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x23

    .line 538
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x24

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_22

    .line 539
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x6

    const/16 v9, 0x79

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 540
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xe

    const/16 v10, 0x7a

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 539
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 541
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x6

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 542
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x22

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 541
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 543
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x2e

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 544
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 543
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 545
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 546
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x40

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 545
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 538
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x24

    .line 547
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x25

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_23

    .line 548
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x11

    const/16 v9, 0x7a

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 549
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x7b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 548
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 550
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x1d

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 551
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0xe

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 550
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 552
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x31

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 553
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 552
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 554
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x18

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 555
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2e

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 554
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 547
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x25

    .line 556
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x26

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_24

    .line 557
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v6, 0x4

    const/16 v9, 0x7a

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 558
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x12

    const/16 v10, 0x7b

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 557
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 559
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0xd

    const/16 v10, 0x2e

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 560
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x20

    const/16 v11, 0x2f

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 559
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 561
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x30

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 562
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 561
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 563
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2a

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 564
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x20

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 563
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 556
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x26

    .line 565
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x27

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_25

    .line 566
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x14

    const/16 v9, 0x75

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 567
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x4

    const/16 v10, 0x76

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 566
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 568
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x28

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 569
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v10, 0x7

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 568
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 570
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x2b

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 571
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 570
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 572
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 573
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x43

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 572
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 565
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x27

    .line 574
    new-instance v0, Lcom/google/zxing/qrcode/decoder/Version;

    const/16 v1, 0x28

    const/4 v2, 0x7

    new-array v2, v2, [I

    fill-array-data v2, :array_26

    .line 575
    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v4, 0x1e

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x13

    const/16 v9, 0x76

    invoke-direct {v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 576
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v9, 0x6

    const/16 v10, 0x77

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 575
    invoke-direct {v3, v4, v5, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 577
    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v5, 0x1c

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x12

    const/16 v10, 0x2f

    invoke-direct {v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 578
    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x1f

    const/16 v11, 0x30

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 577
    invoke-direct {v4, v5, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 579
    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v6, 0x1e

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x22

    const/16 v11, 0x18

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 580
    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0x19

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 579
    invoke-direct {v5, v6, v9, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 581
    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/16 v9, 0x1e

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x14

    const/16 v12, 0xf

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 582
    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x3d

    const/16 v13, 0x10

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    .line 581
    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/qrcode/decoder/Version$ECB;Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    .line 574
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[ILcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    .line 254
    return-object v7

    .line 260
    nop

    :array_0
    .array-data 4
        0x6
        0x12
    .end array-data

    .line 265
    :array_1
    .array-data 4
        0x6
        0x16
    .end array-data

    .line 270
    :array_2
    .array-data 4
        0x6
        0x1a
    .end array-data

    .line 275
    :array_3
    .array-data 4
        0x6
        0x1e
    .end array-data

    .line 282
    :array_4
    .array-data 4
        0x6
        0x22
    .end array-data

    .line 287
    :array_5
    .array-data 4
        0x6
        0x16
        0x26
    .end array-data

    .line 294
    :array_6
    .array-data 4
        0x6
        0x18
        0x2a
    .end array-data

    .line 302
    :array_7
    .array-data 4
        0x6
        0x1a
        0x2e
    .end array-data

    .line 310
    :array_8
    .array-data 4
        0x6
        0x1c
        0x32
    .end array-data

    .line 319
    :array_9
    .array-data 4
        0x6
        0x1e
        0x36
    .end array-data

    .line 327
    :array_a
    .array-data 4
        0x6
        0x20
        0x3a
    .end array-data

    .line 336
    :array_b
    .array-data 4
        0x6
        0x22
        0x3e
    .end array-data

    .line 344
    :array_c
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
    .end array-data

    .line 353
    :array_d
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
    .end array-data

    .line 362
    :array_e
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
    .end array-data

    .line 371
    :array_f
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
    .end array-data

    .line 380
    :array_10
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
    .end array-data

    .line 389
    :array_11
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
    .end array-data

    .line 398
    :array_12
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
    .end array-data

    .line 407
    :array_13
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
    .end array-data

    .line 415
    :array_14
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
    .end array-data

    .line 422
    :array_15
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
    .end array-data

    .line 431
    :array_16
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
    .end array-data

    .line 440
    :array_17
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
    .end array-data

    .line 449
    :array_18
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
    .end array-data

    .line 458
    :array_19
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
    .end array-data

    .line 467
    :array_1a
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
    .end array-data

    .line 476
    :array_1b
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
    .end array-data

    .line 485
    :array_1c
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
    .end array-data

    .line 494
    :array_1d
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
    .end array-data

    .line 503
    :array_1e
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
    .end array-data

    .line 511
    :array_1f
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
    .end array-data

    .line 520
    :array_20
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
    .end array-data

    .line 529
    :array_21
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    .line 538
    :array_22
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    .line 547
    :array_23
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    .line 556
    :array_24
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    .line 565
    :array_25
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    .line 574
    :array_26
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data
.end method

.method static decodeVersionInformation(I)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 6
    .param p0, "versionBits"    # I

    .prologue
    .line 115
    const v0, 0x7fffffff

    .line 116
    .local v0, "bestDifference":I
    const/4 v1, 0x0

    .line 117
    .local v1, "bestVersion":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    sget-object v5, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    array-length v5, v5

    if-lt v3, v5, :cond_0

    .line 133
    const/4 v5, 0x3

    if-gt v0, v5, :cond_3

    .line 134
    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v5

    .line 137
    :goto_1
    return-object v5

    .line 118
    :cond_0
    sget-object v5, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    aget v4, v5, v3

    .line 120
    .local v4, "targetVersion":I
    if-ne v4, p0, :cond_1

    .line 121
    add-int/lit8 v5, v3, 0x7

    invoke-static {v5}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v5

    goto :goto_1

    .line 125
    :cond_1
    invoke-static {p0, v4}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->numBitsDiffering(II)I

    move-result v2

    .line 126
    .local v2, "bitsDifference":I
    if-ge v2, v0, :cond_2

    .line 127
    add-int/lit8 v1, v3, 0x7

    .line 128
    move v0, v2

    .line 117
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 137
    .end local v2    # "bitsDifference":I
    .end local v4    # "targetVersion":I
    :cond_3
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public static getProvisionalVersionForDimension(I)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 3
    .param p0, "dimension"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 97
    rem-int/lit8 v1, p0, 0x4

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 98
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    .line 101
    :cond_0
    add-int/lit8 v1, p0, -0x11

    shr-int/lit8 v1, v1, 0x2

    :try_start_0
    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 102
    :catch_0
    move-exception v0

    .line 103
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method public static getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;
    .locals 2
    .param p0, "versionNumber"    # I

    .prologue
    .line 108
    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    const/16 v0, 0x28

    if-le p0, v0, :cond_1

    .line 109
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 111
    :cond_1
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    add-int/lit8 v1, p0, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method


# virtual methods
.method buildFunctionPattern()Lcom/google/zxing/common/BitMatrix;
    .locals 14

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x1

    const/4 v11, 0x6

    const/16 v10, 0x9

    const/4 v9, 0x0

    .line 144
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v1

    .line 145
    .local v1, "dimension":I
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 148
    .local v0, "bitMatrix":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0, v9, v9, v10, v10}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 150
    add-int/lit8 v6, v1, -0x8

    const/16 v7, 0x8

    invoke-virtual {v0, v6, v9, v7, v10}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 152
    add-int/lit8 v6, v1, -0x8

    const/16 v7, 0x8

    invoke-virtual {v0, v9, v6, v10, v7}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 155
    iget-object v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    array-length v3, v6

    .line 156
    .local v3, "max":I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_0
    if-lt v4, v3, :cond_1

    .line 168
    add-int/lit8 v6, v1, -0x11

    invoke-virtual {v0, v11, v10, v12, v6}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 170
    add-int/lit8 v6, v1, -0x11

    invoke-virtual {v0, v10, v11, v6, v12}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 172
    iget v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    if-le v6, v11, :cond_0

    .line 174
    add-int/lit8 v6, v1, -0xb

    invoke-virtual {v0, v6, v9, v13, v11}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 176
    add-int/lit8 v6, v1, -0xb

    invoke-virtual {v0, v9, v6, v11, v13}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 179
    :cond_0
    return-object v0

    .line 157
    :cond_1
    iget-object v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v6, v6, v4

    add-int/lit8 v2, v6, -0x2

    .line 158
    .local v2, "i":I
    const/4 v5, 0x0

    .local v5, "y":I
    :goto_1
    if-lt v5, v3, :cond_2

    .line 156
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 159
    :cond_2
    if-nez v4, :cond_3

    if-eqz v5, :cond_4

    add-int/lit8 v6, v3, -0x1

    if-eq v5, v6, :cond_4

    :cond_3
    add-int/lit8 v6, v3, -0x1

    if-ne v4, v6, :cond_5

    if-nez v5, :cond_5

    .line 158
    :cond_4
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 163
    :cond_5
    iget-object v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v6, v6, v5

    add-int/lit8 v6, v6, -0x2

    const/4 v7, 0x5

    const/4 v8, 0x5

    invoke-virtual {v0, v6, v2, v7, v8}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    goto :goto_2
.end method

.method public getAlignmentPatternCenters()[I
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    return-object v0
.end method

.method public getDimensionForVersion()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x11

    return v0
.end method

.method public getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .locals 2
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getTotalCodewords()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    return v0
.end method

.method public getVersionNumber()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
