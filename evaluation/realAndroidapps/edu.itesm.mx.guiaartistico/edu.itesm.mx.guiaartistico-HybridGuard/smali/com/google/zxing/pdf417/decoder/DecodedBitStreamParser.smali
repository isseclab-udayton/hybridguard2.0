.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I = null

.field private static final AL:I = 0x1c

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final EXP900:[Ljava/math/BigInteger;

.field private static final LL:I = 0x1b

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT_CHARS:[C

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I
    .locals 3

    .prologue
    .line 29
    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->values()[Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 58
    const/16 v2, 0x1d

    new-array v2, v2, [C

    fill-array-data v2, :array_0

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    .line 63
    const/16 v2, 0x19

    new-array v2, v2, [C

    fill-array-data v2, :array_1

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    .line 74
    const/16 v2, 0x10

    new-array v2, v2, [Ljava/math/BigInteger;

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    .line 75
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v3, 0x0

    sget-object v4, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    aput-object v4, v2, v3

    .line 76
    const-wide/16 v2, 0x384

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 77
    .local v1, "nineHundred":Ljava/math/BigInteger;
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v3, 0x1

    aput-object v1, v2, v3

    .line 78
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_0
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 81
    return-void

    .line 79
    :cond_0
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    add-int/lit8 v4, v0, -0x1

    aget-object v3, v3, v4

    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    aput-object v3, v2, v0

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    :array_0
    .array-data 2
        0x3bs
        0x3cs
        0x3es
        0x40s
        0x5bs
        0x5cs
        0x7ds
        0x5fs
        0x60s
        0x7es
        0x21s
        0xds
        0x9s
        0x2cs
        0x3as
        0xas
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x22s
        0x7cs
        0x2as
        0x28s
        0x29s
        0x3fs
        0x7bs
        0x7ds
        0x27s
    .end array-data

    .line 63
    nop

    :array_1
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x26s
        0xds
        0x9s
        0x2cs
        0x3as
        0x23s
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x2bs
        0x25s
        0x2as
        0x3ds
        0x5es
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    return-void
.end method

.method private static byteCompaction(I[IILjava/lang/StringBuilder;)I
    .locals 17
    .param p0, "mode"    # I
    .param p1, "codewords"    # [I
    .param p2, "codeIndex"    # I
    .param p3, "result"    # Ljava/lang/StringBuilder;

    .prologue
    .line 361
    const/16 v13, 0x385

    move/from16 v0, p0

    if-ne v0, v13, :cond_8

    .line 364
    const/4 v4, 0x0

    .line 365
    .local v4, "count":I
    const-wide/16 v11, 0x0

    .line 366
    .local v11, "value":J
    const/4 v13, 0x6

    new-array v6, v13, [C

    .line 367
    .local v6, "decodedData":[C
    const/4 v13, 0x6

    new-array v1, v13, [I

    .line 368
    .local v1, "byteCompactedCodewords":[I
    const/4 v7, 0x0

    .line 369
    .local v7, "end":Z
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "codeIndex":I
    .local v3, "codeIndex":I
    aget v10, p1, p2

    .local v10, "nextCode":I
    move/from16 p2, v3

    .line 370
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    :goto_0
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p2

    if-ge v0, v13, :cond_0

    if-eqz v7, :cond_3

    .line 400
    :cond_0
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p2

    if-ne v0, v13, :cond_1

    const/16 v13, 0x384

    if-ge v10, v13, :cond_1

    .line 401
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "count":I
    .local v5, "count":I
    aput v10, v1, v4

    move v4, v5

    .line 407
    .end local v5    # "count":I
    .restart local v4    # "count":I
    :cond_1
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-lt v8, v4, :cond_7

    .line 448
    .end local v1    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v6    # "decodedData":[C
    .end local v7    # "end":Z
    .end local v8    # "i":I
    .end local v10    # "nextCode":I
    .end local v11    # "value":J
    :cond_2
    return p2

    .line 371
    .restart local v1    # "byteCompactedCodewords":[I
    .restart local v4    # "count":I
    .restart local v6    # "decodedData":[C
    .restart local v7    # "end":Z
    .restart local v10    # "nextCode":I
    .restart local v11    # "value":J
    :cond_3
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "count":I
    .restart local v5    # "count":I
    aput v10, v1, v4

    .line 373
    const-wide/16 v13, 0x384

    mul-long/2addr v13, v11

    int-to-long v15, v10

    add-long v11, v13, v15

    .line 374
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v10, p1, p2

    .line 376
    const/16 v13, 0x384

    if-eq v10, v13, :cond_4

    .line 377
    const/16 v13, 0x385

    if-eq v10, v13, :cond_4

    .line 378
    const/16 v13, 0x386

    if-eq v10, v13, :cond_4

    .line 379
    const/16 v13, 0x39c

    if-eq v10, v13, :cond_4

    .line 380
    const/16 v13, 0x3a0

    if-eq v10, v13, :cond_4

    .line 381
    const/16 v13, 0x39b

    if-eq v10, v13, :cond_4

    .line 382
    const/16 v13, 0x39a

    if-ne v10, v13, :cond_5

    .line 383
    :cond_4
    add-int/lit8 p2, v3, -0x1

    .line 384
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    const/4 v7, 0x1

    move v4, v5

    .line 385
    .end local v5    # "count":I
    .restart local v4    # "count":I
    goto :goto_0

    .line 386
    .end local v4    # "count":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "count":I
    :cond_5
    rem-int/lit8 v13, v5, 0x5

    if-nez v13, :cond_e

    if-lez v5, :cond_e

    .line 389
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_2
    const/4 v13, 0x6

    if-lt v9, v13, :cond_6

    .line 393
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 394
    const/4 v4, 0x0

    .end local v5    # "count":I
    .restart local v4    # "count":I
    move/from16 p2, v3

    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    goto :goto_0

    .line 390
    .end local v4    # "count":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "count":I
    :cond_6
    rsub-int/lit8 v13, v9, 0x5

    const-wide/16 v14, 0x100

    rem-long v14, v11, v14

    long-to-int v14, v14

    int-to-char v14, v14

    aput-char v14, v6, v13

    .line 391
    const/16 v13, 0x8

    shr-long/2addr v11, v13

    .line 389
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 408
    .end local v3    # "codeIndex":I
    .end local v5    # "count":I
    .end local v9    # "j":I
    .restart local v4    # "count":I
    .restart local v8    # "i":I
    .restart local p2    # "codeIndex":I
    :cond_7
    aget v13, v1, v8

    int-to-char v13, v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 407
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 411
    .end local v1    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v6    # "decodedData":[C
    .end local v7    # "end":Z
    .end local v8    # "i":I
    .end local v10    # "nextCode":I
    .end local v11    # "value":J
    :cond_8
    const/16 v13, 0x39c

    move/from16 v0, p0

    if-ne v0, v13, :cond_2

    .line 414
    const/4 v4, 0x0

    .line 415
    .restart local v4    # "count":I
    const-wide/16 v11, 0x0

    .line 416
    .restart local v11    # "value":J
    const/4 v7, 0x0

    .line 417
    .restart local v7    # "end":Z
    :cond_9
    :goto_3
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p2

    if-ge v0, v13, :cond_2

    if-nez v7, :cond_2

    .line 418
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v2, p1, p2

    .line 419
    .local v2, "code":I
    const/16 v13, 0x384

    if-ge v2, v13, :cond_a

    .line 420
    add-int/lit8 v4, v4, 0x1

    .line 422
    const-wide/16 v13, 0x384

    mul-long/2addr v13, v11

    int-to-long v15, v2

    add-long v11, v13, v15

    move/from16 p2, v3

    .line 435
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    :goto_4
    rem-int/lit8 v13, v4, 0x5

    if-nez v13, :cond_9

    if-lez v4, :cond_9

    .line 438
    const/4 v13, 0x6

    new-array v6, v13, [C

    .line 439
    .restart local v6    # "decodedData":[C
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_5
    const/4 v13, 0x6

    if-lt v9, v13, :cond_c

    .line 443
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 444
    const/4 v4, 0x0

    goto :goto_3

    .line 424
    .end local v6    # "decodedData":[C
    .end local v9    # "j":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_a
    const/16 v13, 0x384

    if-eq v2, v13, :cond_b

    .line 425
    const/16 v13, 0x385

    if-eq v2, v13, :cond_b

    .line 426
    const/16 v13, 0x386

    if-eq v2, v13, :cond_b

    .line 427
    const/16 v13, 0x39c

    if-eq v2, v13, :cond_b

    .line 428
    const/16 v13, 0x3a0

    if-eq v2, v13, :cond_b

    .line 429
    const/16 v13, 0x39b

    if-eq v2, v13, :cond_b

    .line 430
    const/16 v13, 0x39a

    if-ne v2, v13, :cond_d

    .line 431
    :cond_b
    add-int/lit8 p2, v3, -0x1

    .line 432
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    const/4 v7, 0x1

    goto :goto_4

    .line 440
    .restart local v6    # "decodedData":[C
    .restart local v9    # "j":I
    :cond_c
    rsub-int/lit8 v13, v9, 0x5

    const-wide/16 v14, 0xff

    and-long/2addr v14, v11

    long-to-int v14, v14

    int-to-char v14, v14

    aput-char v14, v6, v13

    .line 441
    const/16 v13, 0x8

    shr-long/2addr v11, v13

    .line 439
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .end local v6    # "decodedData":[C
    .end local v9    # "j":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_d
    move/from16 p2, v3

    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    goto :goto_4

    .end local v2    # "code":I
    .end local v4    # "count":I
    .end local p2    # "codeIndex":I
    .restart local v1    # "byteCompactedCodewords":[I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "count":I
    .restart local v6    # "decodedData":[C
    .restart local v10    # "nextCode":I
    :cond_e
    move v4, v5

    .end local v5    # "count":I
    .restart local v4    # "count":I
    move/from16 p2, v3

    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    goto/16 :goto_0
.end method

.method static decode([I)Lcom/google/zxing/common/DecoderResult;
    .locals 7
    .param p0, "codewords"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x64

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 89
    .local v3, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 90
    .local v1, "codeIndex":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "codeIndex":I
    .local v2, "codeIndex":I
    aget v0, p0, v1

    .local v0, "code":I
    move v1, v2

    .line 91
    .end local v2    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :goto_0
    const/4 v4, 0x0

    aget v4, p0, v4

    if-lt v1, v4, :cond_0

    .line 122
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 123
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    .line 92
    :cond_0
    sparse-switch v0, :sswitch_data_0

    .line 112
    add-int/lit8 v1, v1, -0x1

    .line 113
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v1

    .line 116
    :goto_1
    array-length v4, p0

    if-ge v1, v4, :cond_1

    .line 117
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    aget v0, p0, v1

    move v1, v2

    .line 118
    .end local v2    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    goto :goto_0

    .line 94
    :sswitch_0
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v1

    .line 95
    goto :goto_1

    .line 97
    :sswitch_1
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuilder;)I

    move-result v1

    .line 98
    goto :goto_1

    .line 100
    :sswitch_2
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result v1

    .line 101
    goto :goto_1

    .line 103
    :sswitch_3
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuilder;)I

    move-result v1

    .line 104
    goto :goto_1

    .line 106
    :sswitch_4
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuilder;)I

    move-result v1

    .line 107
    goto :goto_1

    .line 119
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    .line 125
    :cond_2
    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v6, v5, v6, v6}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v4

    .line 92
    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_0
        0x385 -> :sswitch_1
        0x386 -> :sswitch_2
        0x391 -> :sswitch_3
        0x39c -> :sswitch_4
    .end sparse-switch
.end method

.method private static decodeBase900toBase10([II)Ljava/lang/String;
    .locals 6
    .param p0, "codewords"    # [I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 543
    sget-object v1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    .line 544
    .local v1, "result":Ljava/math/BigInteger;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p1, :cond_0

    .line 547
    invoke-virtual {v1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v2

    .line 548
    .local v2, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    if-eq v3, v4, :cond_1

    .line 549
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 545
    .end local v2    # "resultString":Ljava/lang/String;
    :cond_0
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sub-int v4, p1, v0

    add-int/lit8 v4, v4, -0x1

    aget-object v3, v3, v4

    aget v4, p0, v0

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 544
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 551
    .restart local v2    # "resultString":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuilder;)V
    .locals 12
    .param p0, "textCompactionData"    # [I
    .param p1, "byteCompactionData"    # [I
    .param p2, "length"    # I
    .param p3, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v11, 0x1b

    const/16 v10, 0x391

    const/16 v9, 0x384

    const/16 v8, 0x1d

    const/16 v7, 0x1a

    .line 213
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 214
    .local v3, "subMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 215
    .local v2, "priorToShiftMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    const/4 v1, 0x0

    .line 216
    .local v1, "i":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 347
    return-void

    .line 217
    :cond_0
    aget v4, p0, v1

    .line 218
    .local v4, "subModeCh":I
    const/4 v0, 0x0

    .local v0, "ch":C
    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I

    move-result-object v5

    .line 219
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 341
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 343
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 222
    :pswitch_0
    if-ge v4, v7, :cond_3

    .line 224
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    .line 225
    goto :goto_1

    .line 226
    :cond_3
    if-ne v4, v7, :cond_4

    .line 227
    const/16 v0, 0x20

    .line 228
    goto :goto_1

    :cond_4
    if-ne v4, v11, :cond_5

    .line 229
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 230
    goto :goto_1

    :cond_5
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_6

    .line 231
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 232
    goto :goto_1

    :cond_6
    if-ne v4, v8, :cond_7

    .line 234
    move-object v2, v3

    .line 235
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 236
    goto :goto_1

    :cond_7
    if-ne v4, v10, :cond_8

    .line 237
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 238
    :cond_8
    if-ne v4, v9, :cond_1

    .line 239
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 242
    goto :goto_1

    .line 246
    :pswitch_1
    if-ge v4, v7, :cond_9

    .line 247
    add-int/lit8 v5, v4, 0x61

    int-to-char v0, v5

    .line 248
    goto :goto_1

    .line 249
    :cond_9
    if-ne v4, v7, :cond_a

    .line 25
    const/16 v0, 0x20

    .line 251
    goto :goto_1

    :cond_a
    if-ne v4, v11, :cond_b

    .line 253
    move-object v2, v3

    .line 254
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 255
    goto :goto_1

    :cond_b
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_c

    .line 256
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 257
    goto :goto_1

    :cond_c
    if-ne v4, v8, :cond_d

    .line 259
    move-object v2, v3

    .line 260
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 261
    goto :goto_1

    :cond_d
    if-ne v4, v10, :cond_e

    .line 262
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 263
    :cond_e
    if-ne v4, v9, :cond_1

    .line 264
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 267
    goto :goto_1

    .line 271
    :pswitch_2
    const/16 v5, 0x19

    if-ge v4, v5, :cond_f

    .line 272
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v0, v5, v4

    .line 273
    goto :goto_1

    .line 274
    :cond_f
    const/16 v5, 0x19

    if-ne v4, v5, :cond_10

    .line 275
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 276
    goto :goto_1

    :cond_10
    if-ne v4, v7, :cond_11

    .line 277
    const/16 v0, 0x20

    .line 278
    goto :goto_1

    :cond_11
    if-ne v4, v11, :cond_12

    .line 279
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 280
    goto :goto_1

    :cond_12
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_13

    .line 281
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 282
    goto :goto_1

    :cond_13
    if-ne v4, v8, :cond_14

    .line 284
    move-object v2, v3

    .line 285
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 286
    goto/16 :goto_1

    :cond_14
    if-ne v4, v10, :cond_15

    .line 287
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 288
    :cond_15
    if-ne v4, v9, :cond_1

    .line 289
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 292
    goto/16 :goto_1

    .line 296
    :pswitch_3
    if-ge v4, v8, :cond_16

    .line 297
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    .line 298
    goto/16 :goto_1

    .line 299
    :cond_16
    if-ne v4, v8, :cond_17

    .line 300
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 301
    goto/16 :goto_1

    :cond_17
    if-ne v4, v10, :cond_18

    .line 302
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 303
    :cond_18
    if-ne v4, v9, :cond_1

    .line 304
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 307
    goto/16 :goto_1

    .line 311
    :pswitch_4
    move-object v3, v2

    .line 312
    if-ge v4, v7, :cond_19

    .line 313
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    .line 314
    goto/16 :goto_1

    .line 315
    :cond_19
    if-ne v4, v7, :cond_1a

    .line 316
    const/16 v0, 0x20

    .line 317
    goto/16 :goto_1

    :cond_1a
    if-ne v4, v9, :cond_1

    .line 318
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 321
    goto/16 :goto_1

    .line 325
    :pswitch_5
    move-object v3, v2

    .line 326
    if-ge v4, v8, :cond_1b

    .line 327
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    .line 328
    goto/16 :goto_1

    .line 329
    :cond_1b
    if-ne v4, v8, :cond_1c

    .line 330
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 331
    goto/16 :goto_1

    :cond_1c
    if-ne v4, v10, :cond_1d

    .line 334
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 335
    :cond_1d
    if-ne v4, v9, :cond_1

    .line 336
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1

    .line 219
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private static numericCompaction([IILjava/lang/StringBuilder;)I
    .locals 9
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x384

    const/4 v7, 0x0

    .line 460
    const/4 v2, 0x0

    .line 461
    .local v2, "count":I
    const/4 v3, 0x0

    .line 463
    .local v3, "end":Z
    const/16 v6, 0xf

    new-array v4, v6, [I

    .line 465
    .local v4, "numericCodewords":[I
    :cond_0
    :goto_0
    aget v6, p0, v7

    if-ge p1, v6, :cond_1

    if-eqz v3, :cond_2

    .line 496
    :cond_1
    return p1

    .line 466
    :cond_2
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v1, "codeIndex":I
    aget v0, p0, p1

    .line 467
    .local v0, "code":I
    aget v6, p0, v7

    if-ne v1, v6, :cond_3

    .line 468
    const/4 v3, 0x1

    .line 470
    :cond_3
    if-ge v0, v8, :cond_5

    .line 471
    aput v0, v4, v2

    .line 472
    add-int/lit8 v2, v2, 0x1

    move p1, v1

    .line 484
    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    :goto_1
    rem-int/lit8 v6, v2, 0xf

    if-eqz v6, :cond_4

    .line 485
    const/16 v6, 0x386

    if-eq v0, v6, :cond_4

    .line 486
    if-eqz v3, :cond_0

    .line 491
    :cond_4
    invoke-static {v4, v2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v5

    .line 492
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    const/4 v2, 0x0

    goto :goto_0

    .line 474
    .end local v5    # "s":Ljava/lang/String;
    .end local p1    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :cond_5
    if-eq v0, v8, :cond_6

    .line 475
    const/16 v6, 0x385

    if-eq v0, v6, :cond_6

    .line 476
    const/16 v6, 0x39c

    if-eq v0, v6, :cond_6

    .line 477
    const/16 v6, 0x3a0

    if-eq v0, v6, :cond_6

    .line 478
    const/16 v6, 0x39b

    if-eq v0, v6, :cond_6

    .line 479
    const/16 v6, 0x39a

    if-ne v0, v6, :cond_7

    .line 480
    :cond_6
    add-int/lit8 p1, v1, -0x1

    .line 481
    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    goto :goto_1

    .end local p1    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :cond_7
    move p1, v1

    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_1
.end method

.method private static textCompaction([IILjava/lang/StringBuilder;)I
    .locals 11
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v10, 0x384

    const/4 v9, 0x0

    .line 140
    aget v7, p0, v9

    shl-int/lit8 v7, v7, 0x1

    new-array v6, v7, [I

    .line 142
    .local v6, "textCompactionData":[I
    aget v7, p0, v9

    shl-int/lit8 v7, v7, 0x1

    new-array v0, v7, [I

    .line 144
    .local v0, "byteCompactionData":[I
    const/4 v4, 0x0

    .line 145
    .local v4, "index":I
    const/4 v3, 0x0

    .line 146
    .local v3, "end":Z
    :goto_0
    aget v7, p0, v9

    if-ge p1, v7, :cond_0

    if-eqz v3, :cond_1

    .line 185
    :cond_0
    invoke-static {v6, v0, v4, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuilder;)V

    .line 186
    return p1

    .line 147
    :cond_1
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v2, "codeIndex":I
    aget v1, p0, p1

    .line 148
    .local v1, "code":I
    if-ge v1, v10, :cond_2

    .line 149
    div-int/lit8 v7, v1, 0x1e

    aput v7, v6, v4

    .line 150
    add-int/lit8 v7, v4, 0x1

    rem-int/lit8 v8, v1, 0x1e

    aput v8, v6, v7

    .line 151
    add-int/lit8 v4, v4, 0x2

    move p1, v2

    .line 152
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_0

    .line 153
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :cond_2
    sparse-switch v1, :sswitch_data_0

    move p1, v2

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_0

    .line 156
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_0
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .local v5, "index":I
    aput v10, v6, v4

    move v4, v5

    .end local v5    # "index":I
    .restart local v4    # "index":I
    move p1, v2

    .line 157
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_0

    .line 159
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_1
    add-int/lit8 p1, v2, -0x1

    .line 160
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 161
    goto :goto_0

    .line 163
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_2
    add-int/lit8 p1, v2, -0x1

    .line 164
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 165
    goto :goto_0

    .line 173
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_3
    const/16 v7, 0x391

    aput v7, v6, v4

    .line 174
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    aget v1, p0, v2

    .line 175
    aput v1, v0, v4

    .line 176
    add-int/lit8 v4, v4, 0x1

    .line 177
    goto :goto_0

    .line 179
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_4
    add-int/lit8 p1, v2, -0x1

    .line 180
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    goto :goto_0

    .line 153
    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_0
        0x385 -> :sswitch_1
        0x386 -> :sswitch_2
        0x391 -> :sswitch_3
        0x39c -> :sswitch_4
    .end sparse-switch
.end method
