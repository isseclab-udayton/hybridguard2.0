.class public final Lcom/google/zxing/datamatrix/decoder/Version;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/datamatrix/decoder/Version$ECB;,
        Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;
    }
.end annotation


# static fields
.field private static final VERSIONS:[Lcom/google/zxing/datamatrix/decoder/Version;


# instance fields
.field private final dataRegionSizeColumns:I

.field private final dataRegionSizeRows:I

.field private final ecBlocks:Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

.field private final symbolSizeColumns:I

.field private final symbolSizeRows:I

.field private final totalCodewords:I

.field private final versionNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    invoke-static {}, Lcom/google/zxing/datamatrix/decoder/Version;->buildVersions()[Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/datamatrix/decoder/Version;->VERSIONS:[Lcom/google/zxing/datamatrix/decoder/Version;

    .line 27
    return-void
.end method

.method private constructor <init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V
    .locals 7
    .param p1, "versionNumber"    # I
    .param p2, "symbolSizeRows"    # I
    .param p3, "symbolSizeColumns"    # I
    .param p4, "dataRegionSizeRows"    # I
    .param p5, "dataRegionSizeColumns"    # I
    .param p6, "ecBlocks"    # Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/Version;->versionNumber:I

    .line 46
    iput p2, p0, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeRows:I

    .line 47
    iput p3, p0, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeColumns:I

    .line 48
    iput p4, p0, Lcom/google/zxing/datamatrix/decoder/Version;->dataRegionSizeRows:I

    .line 49
    iput p5, p0, Lcom/google/zxing/datamatrix/decoder/Version;->dataRegionSizeColumns:I

    .line 50
    iput-object p6, p0, Lcom/google/zxing/datamatrix/decoder/Version;->ecBlocks:Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    .line 53
    const/4 v4, 0x0

    .line 54
    .local v4, "total":I
    invoke-virtual {p6}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v1

    .line 55
    .local v1, "ecCodewords":I
    invoke-virtual {p6}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    move-result-object v2

    .line 56
    .local v2, "ecbArray":[Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v2

    if-lt v3, v5, :cond_0

    .line 60
    iput v4, p0, Lcom/google/zxing/datamatrix/decoder/Version;->totalCodewords:I

    .line 61
    return-void

    .line 57
    :cond_0
    aget-object v0, v2, v3

    .line 58
    .local v0, "ecBlock":Lcom/google/zxing/datamatrix/decoder/Version$ECB;
    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getDataCodewords()I

    move-result v6

    add-int/2addr v6, v1

    mul-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 56
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static buildVersions()[Lcom/google/zxing/datamatrix/decoder/Version;
    .locals 15

    .prologue
    .line 178
    const/16 v0, 0x1e

    new-array v7, v0, [Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v8, 0x0

    .line 179
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x1

    const/16 v2, 0xa

    const/16 v3, 0xa

    const/16 v4, 0x8

    const/16 v5, 0x8

    .line 180
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/4 v9, 0x5

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/4 v12, 0x3

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 179
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x1

    .line 181
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x2

    const/16 v2, 0xc

    const/16 v3, 0xc

    const/16 v4, 0xa

    const/16 v5, 0xa

    .line 182
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/4 v9, 0x7

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/4 v12, 0x5

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 181
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x2

    .line 183
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x3

    const/16 v2, 0xe

    const/16 v3, 0xe

    const/16 v4, 0xc

    const/16 v5, 0xc

    .line 184
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0xa

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x8

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 183
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x3

    .line 185
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x4

    const/16 v2, 0x10

    const/16 v3, 0x10

    const/16 v4, 0xe

    const/16 v5, 0xe

    .line 186
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0xc

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0xc

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 185
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x4

    .line 187
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x5

    const/16 v2, 0x12

    const/16 v3, 0x12

    const/16 v4, 0x10

    const/16 v5, 0x10

    .line 188
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0xe

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x12

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 187
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x5

    .line 189
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x6

    const/16 v2, 0x14

    const/16 v3, 0x14

    const/16 v4, 0x12

    const/16 v5, 0x12

    .line 190
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x12

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x16

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 189
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x6

    .line 191
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/4 v1, 0x7

    const/16 v2, 0x16

    const/16 v3, 0x16

    const/16 v4, 0x14

    const/16 v5, 0x14

    .line 192
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x14

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x1e

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 191
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/4 v8, 0x7

    .line 193
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x8

    const/16 v2, 0x18

    const/16 v3, 0x18

    const/16 v4, 0x16

    const/16 v5, 0x16

    .line 194
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x24

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 193
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x8

    .line 195
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x9

    const/16 v2, 0x1a

    const/16 v3, 0x1a

    const/16 v4, 0x18

    const/16 v5, 0x18

    .line 196
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x2c

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 195
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x9

    .line 197
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xa

    const/16 v2, 0x20

    const/16 v3, 0x20

    const/16 v4, 0xe

    const/16 v5, 0xe

    .line 198
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x24

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x3e

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 197
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xa

    .line 199
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xb

    const/16 v2, 0x24

    const/16 v3, 0x24

    const/16 v4, 0x10

    const/16 v5, 0x10

    .line 200
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x2a

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x56

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 199
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xb

    .line 201
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xc

    const/16 v2, 0x28

    const/16 v3, 0x28

    const/16 v4, 0x12

    const/16 v5, 0x12

    .line 202
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x30

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x72

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 201
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xc

    .line 203
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xd

    const/16 v2, 0x2c

    const/16 v3, 0x2c

    const/16 v4, 0x14

    const/16 v5, 0x14

    .line 204
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x38

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x90

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 203
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xd

    .line 205
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xe

    const/16 v2, 0x30

    const/16 v3, 0x30

    const/16 v4, 0x16

    const/16 v5, 0x16

    .line 206
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x44

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0xae

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 205
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xe

    .line 207
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0xf

    const/16 v2, 0x34

    const/16 v3, 0x34

    const/16 v4, 0x18

    const/16 v5, 0x18

    .line 208
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x2a

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x66

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 207
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0xf

    .line 209
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x10

    const/16 v2, 0x40

    const/16 v3, 0x40

    const/16 v4, 0xe

    const/16 v5, 0xe

    .line 210
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x38

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x2

    const/16 v12, 0x8c

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 209
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x10

    .line 211
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x11

    const/16 v2, 0x48

    const/16 v3, 0x48

    const/16 v4, 0x10

    const/16 v5, 0x10

    .line 212
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x24

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x5c

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 211
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x11

    .line 213
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x12

    const/16 v2, 0x50

    const/16 v3, 0x50

    const/16 v4, 0x12

    const/16 v5, 0x12

    .line 214
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x30

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x72

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 213
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x12

    .line 215
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x13

    const/16 v2, 0x58

    const/16 v3, 0x58

    const/16 v4, 0x14

    const/16 v5, 0x14

    .line 216
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x38

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0x90

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 215
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x13

    .line 217
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x14

    const/16 v2, 0x60

    const/16 v3, 0x60

    const/16 v4, 0x16

    const/16 v5, 0x16

    .line 218
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x44

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x4

    const/16 v12, 0xae

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 217
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x14

    .line 219
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x15

    const/16 v2, 0x68

    const/16 v3, 0x68

    const/16 v4, 0x18

    const/16 v5, 0x18

    .line 220
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x38

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0x88

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 219
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x15

    .line 221
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x16

    const/16 v2, 0x78

    const/16 v3, 0x78

    const/16 v4, 0x12

    const/16 v5, 0x12

    .line 222
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x44

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x6

    const/16 v12, 0xaf

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 221
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x16

    .line 223
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x17

    const/16 v2, 0x84

    const/16 v3, 0x84

    const/16 v4, 0x14

    const/16 v5, 0x14

    .line 224
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x3e

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0xa3

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 223
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x17

    .line 225
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x18

    const/16 v2, 0x90

    const/16 v3, 0x90

    const/16 v4, 0x16

    const/16 v5, 0x16

    .line 226
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x3e

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x9c

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    new-instance v11, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v12, 0x2

    const/16 v13, 0x9b

    const/4 v14, 0x0

    invoke-direct {v11, v12, v13, v14}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v12, 0x0

    invoke-direct {v6, v9, v10, v11, v12}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 225
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x18

    .line 227
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x19

    const/16 v2, 0x8

    const/16 v3, 0x12

    const/4 v4, 0x6

    const/16 v5, 0x10

    .line 228
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/4 v9, 0x7

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/4 v12, 0x5

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 227
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x19

    .line 229
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x1a

    const/16 v2, 0x8

    const/16 v3, 0x20

    const/4 v4, 0x6

    const/16 v5, 0xe

    .line 230
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0xb

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0xa

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 229
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1a

    .line 231
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x1b

    const/16 v2, 0xc

    const/16 v3, 0x1a

    const/16 v4, 0xa

    const/16 v5, 0x18

    .line 232
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0xe

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x10

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 231
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1b

    .line 233
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x1c

    const/16 v2, 0xc

    const/16 v3, 0x24

    const/16 v4, 0xa

    const/16 v5, 0x10

    .line 234
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x12

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x16

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 233
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1c

    .line 235
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x1d

    const/16 v2, 0x10

    const/16 v3, 0x24

    const/16 v4, 0xe

    const/16 v5, 0x10

    .line 236
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x18

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x20

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 235
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    const/16 v8, 0x1d

    .line 237
    new-instance v0, Lcom/google/zxing/datamatrix/decoder/Version;

    const/16 v1, 0x1e

    const/16 v2, 0x10

    const/16 v3, 0x30

    const/16 v4, 0xe

    const/16 v5, 0x16

    .line 238
    new-instance v6, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    const/16 v9, 0x1c

    new-instance v10, Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    const/4 v11, 0x1

    const/16 v12, 0x31

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;-><init>(IILcom/google/zxing/datamatrix/decoder/Version$ECB;)V

    const/4 v11, 0x0

    invoke-direct {v6, v9, v10, v11}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;-><init>(ILcom/google/zxing/datamatrix/decoder/Version$ECB;Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    .line 237
    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/datamatrix/decoder/Version;-><init>(IIIIILcom/google/zxing/datamatrix/decoder/Version$ECBlocks;)V

    aput-object v0, v7, v8

    .line 178
    return-object v7
.end method

.method public static getVersionForDimensions(II)Lcom/google/zxing/datamatrix/decoder/Version;
    .locals 4
    .param p0, "numRows"    # I
    .param p1, "numColumns"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 100
    and-int/lit8 v3, p0, 0x1

    if-nez v3, :cond_0

    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_1

    .line 101
    :cond_0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 107
    :cond_1
    sget-object v3, Lcom/google/zxing/datamatrix/decoder/Version;->VERSIONS:[Lcom/google/zxing/datamatrix/decoder/Version;

    array-length v1, v3

    .line 108
    .local v1, "numVersions":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_2

    .line 115
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 109
    :cond_2
    sget-object v3, Lcom/google/zxing/datamatrix/decoder/Version;->VERSIONS:[Lcom/google/zxing/datamatrix/decoder/Version;

    aget-object v2, v3, v0

    .line 110
    .local v2, "version":Lcom/google/zxing/datamatrix/decoder/Version;
    iget v3, v2, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeRows:I

    if-ne v3, p0, :cond_3

    iget v3, v2, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeColumns:I

    if-ne v3, p1, :cond_3

    .line 111
    return-object v2

    .line 108
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getDataRegionSizeColumns()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->dataRegionSizeColumns:I

    return v0
.end method

.method public getDataRegionSizeRows()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->dataRegionSizeRows:I

    return v0
.end method

.method getECBlocks()Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->ecBlocks:Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    return-object v0
.end method

.method public getSymbolSizeColumns()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeColumns:I

    return v0
.end method

.method public getSymbolSizeRows()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->symbolSizeRows:I

    return v0
.end method

.method public getTotalCodewords()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->totalCodewords:I

    return v0
.end method

.method public getVersionNumber()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->versionNumber:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/Version;->versionNumber:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
