.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# static fields
.field private static final AL:I = 0x1c

.field private static final ALPHA:I = 0x0

.field private static final ALPHA_SHIFT:I = 0x4

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final EXP900:[Ljava/lang/String;

.field private static final LL:I = 0x1b

.field private static final LOWER:I = 0x1

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED:I = 0x2

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT:I = 0x3

.field private static final PUNCT_CHARS:[C

.field private static final PUNCT_SHIFT:I = 0x5

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 54
    const/16 v0, 0x1d

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    .line 58
    const/16 v0, 0x19

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    .line 65
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "000000000000000000000000000000000000000000001"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 66
    const-string v2, "000000000000000000000000000000000000000000900"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 67
    const-string v2, "000000000000000000000000000000000000000810000"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 68
    const-string v2, "000000000000000000000000000000000000729000000"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 69
    const-string v2, "000000000000000000000000000000000656100000000"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 70
    const-string v2, "000000000000000000000000000000590490000000000"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 71
    const-string v2, "000000000000000000000000000531441000000000000"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 72
    const-string v2, "000000000000000000000000478296900000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 73
    const-string v2, "000000000000000000000430467210000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 74
    const-string v2, "000000000000000000387420489000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 75
    const-string v2, "000000000000000348678440100000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 76
    const-string v2, "000000000000313810596090000000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 77
    const-string v2, "000000000282429536481000000000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 78
    const-string v2, "000000254186582832900000000000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 79
    const-string v2, "000228767924549610000000000000000000000000000"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 80
    const-string v2, "205891132094649000000000000000000000000000000"

    aput-object v2, v0, v1

    .line 64
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/lang/String;

    .line 27
    return-void

    .line 54
    nop

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

    .line 58
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
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    return-void
.end method

.method private static add(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuffer;
    .locals 11
    .param p0, "value1"    # Ljava/lang/String;
    .param p1, "value2"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x5

    const/4 v10, 0x0

    .line 589
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 590
    .local v6, "temp1":Ljava/lang/StringBuffer;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 591
    .local v7, "temp2":Ljava/lang/StringBuffer;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-direct {v4, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 592
    .local v4, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-lt v1, v8, :cond_0

    .line 596
    const/4 v0, 0x0

    .line 597
    .local v0, "carry":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v1, v8, -0x3

    :goto_1
    const/4 v8, -0x1

    if-gt v1, v8, :cond_1

    .line 619
    return-object v4

    .line 594
    .end local v0    # "carry":I
    :cond_0
    const/16 v8, 0x30

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 592
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 599
    .restart local v0    # "carry":I
    :cond_1
    invoke-virtual {v6, v10}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 600
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 601
    add-int/lit8 v8, v1, 0x1

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 602
    add-int/lit8 v8, v1, 0x2

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 604
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 605
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 606
    add-int/lit8 v8, v1, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 607
    add-int/lit8 v8, v1, 0x2

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 609
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 610
    .local v2, "intValue1":I
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 612
    .local v3, "intValue2":I
    add-int v8, v2, v3

    add-int/2addr v8, v0

    rem-int/lit16 v5, v8, 0x3e8

    .line 613
    .local v5, "sumval":I
    add-int v8, v2, v3

    add-int/2addr v8, v0

    div-int/lit16 v0, v8, 0x3e8

    .line 615
    add-int/lit8 v8, v1, 0x2

    rem-int/lit8 v9, v5, 0xa

    add-int/lit8 v9, v9, 0x30

    int-to-char v9, v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 616
    add-int/lit8 v8, v1, 0x1

    div-int/lit8 v9, v5, 0xa

    rem-int/lit8 v9, v9, 0xa

    add-int/lit8 v9, v9, 0x30

    int-to-char v9, v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 617
    div-int/lit8 v8, v5, 0x64

    add-int/lit8 v8, v8, 0x30

    int-to-char v8, v8

    invoke-virtual {v4, v1, v8}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 597
    add-int/lit8 v1, v1, -0x3

    goto :goto_1
.end method

.method private static byteCompaction(I[IILjava/lang/StringBuffer;)I
    .locals 15
    .param p0, "mode"    # I
    .param p1, "codewords"    # [I
    .param p2, "codeIndex"    # I
    .param p3, "result"    # Ljava/lang/StringBuffer;

    .prologue
    .line 343
    const/16 v11, 0x385

    if-ne p0, v11, :cond_8

    .line 346
    const/4 v4, 0x0

    .line 347
    .local v4, "count":I
    const-wide/16 v9, 0x0

    .line 348
    .local v9, "value":J
    const/4 v11, 0x6

    new-array v5, v11, [C

    .line 349
    .local v5, "decodedData":[C
    const/4 v11, 0x6

    new-array v1, v11, [I

    .line 350
    .local v1, "byteCompactedCodewords":[I
    const/4 v6, 0x0

    .line 351
    .local v6, "end":Z
    :cond_0
    :goto_0
    const/4 v11, 0x0

    aget v11, p1, v11

    move/from16 v0, p2

    if-ge v0, v11, :cond_1

    if-eqz v6, :cond_3

    .line 384
    :cond_1
    div-int/lit8 v11, v4, 0x5

    mul-int/lit8 v7, v11, 0x5

    .local v7, "i":I
    :goto_1
    if-lt v7, v4, :cond_7

    .line 424
    .end local v1    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v5    # "decodedData":[C
    .end local v6    # "end":Z
    .end local v7    # "i":I
    .end local v9    # "value":J
    :cond_2
    return p2

    .line 352
    .restart local v1    # "byteCompactedCodewords":[I
    .restart local v4    # "count":I
    .restart local v5    # "decodedData":[C
    .restart local v6    # "end":Z
    .restart local v9    # "value":J
    :cond_3
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "codeIndex":I
    .local v3, "codeIndex":I
    aget v2, p1, p2

    .line 353
    .local v2, "code":I
    const/16 v11, 0x384

    if-ge v2, v11, :cond_4

    .line 354
    aput v2, v1, v4

    .line 355
    add-int/lit8 v4, v4, 0x1

    .line 357
    const-wide/16 v11, 0x384

    mul-long/2addr v11, v9

    int-to-long v13, v2

    add-long v9, v11, v13

    move/from16 p2, v3

    .line 370
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    :goto_2
    rem-int/lit8 v11, v4, 0x5

    if-nez v11, :cond_0

    if-lez v4, :cond_0

    .line 373
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_3
    const/4 v11, 0x6

    if-lt v8, v11, :cond_6

    .line 377
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 378
    const/4 v4, 0x0

    goto :goto_0

    .line 359
    .end local v8    # "j":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_4
    const/16 v11, 0x384

    if-eq v2, v11, :cond_5

    .line 360
    const/16 v11, 0x385

    if-eq v2, v11, :cond_5

    .line 361
    const/16 v11, 0x386

    if-eq v2, v11, :cond_5

    .line 362
    const/16 v11, 0x39c

    if-eq v2, v11, :cond_5

    .line 363
    const/16 v11, 0x3a0

    if-eq v2, v11, :cond_5

    .line 364
    const/16 v11, 0x39b

    if-eq v2, v11, :cond_5

    .line 365
    const/16 v11, 0x39a

    if-ne v2, v11, :cond_e

    .line 366
    :cond_5
    add-int/lit8 p2, v3, -0x1

    .line 367
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    const/4 v6, 0x1

    goto :goto_2

    .line 374
    .restart local v8    # "j":I
    :cond_6
    rsub-int/lit8 v11, v8, 0x5

    const-wide/16 v12, 0x100

    rem-long v12, v9, v12

    long-to-int v12, v12

    int-to-char v12, v12

    aput-char v12, v5, v11

    .line 375
    const/16 v11, 0x8

    shr-long/2addr v9, v11

    .line 373
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 385
    .end local v2    # "code":I
    .end local v8    # "j":I
    .restart local v7    # "i":I
    :cond_7
    aget v11, v1, v7

    int-to-char v11, v11

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 384
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 388
    .end local v1    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v5    # "decodedData":[C
    .end local v6    # "end":Z
    .end local v7    # "i":I
    .end local v9    # "value":J
    :cond_8
    const/16 v11, 0x39c

    if-ne p0, v11, :cond_2

    .line 391
    const/4 v4, 0x0

    .line 392
    .restart local v4    # "count":I
    const-wide/16 v9, 0x0

    .line 393
    .restart local v9    # "value":J
    const/4 v6, 0x0

    .line 394
    .restart local v6    # "end":Z
    :cond_9
    :goto_4
    const/4 v11, 0x0

    aget v11, p1, v11

    move/from16 v0, p2

    if-ge v0, v11, :cond_2

    if-nez v6, :cond_2

    .line 395
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v2, p1, p2

    .line 396
    .restart local v2    # "code":I
    const/16 v11, 0x384

    if-ge v2, v11, :cond_a

    .line 397
    add-int/lit8 v4, v4, 0x1

    .line 399
    const-wide/16 v11, 0x384

    mul-long/2addr v11, v9

    int-to-long v13, v2

    add-long v9, v11, v13

    move/from16 p2, v3

    .line 412
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    :goto_5
    rem-int/lit8 v11, v4, 0x5

    if-nez v11, :cond_9

    if-lez v4, :cond_9

    .line 415
    const/4 v11, 0x6

    new-array v5, v11, [C

    .line 416
    .restart local v5    # "decodedData":[C
    const/4 v8, 0x0

    .restart local v8    # "j":I
    :goto_6
    const/4 v11, 0x6

    if-lt v8, v11, :cond_c

    .line 420
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 401
    .end local v5    # "decodedData":[C
    .end local v8    # "j":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_a
    const/16 v11, 0x384

    if-eq v2, v11, :cond_b

    .line 402
    const/16 v11, 0x385

    if-eq v2, v11, :cond_b

    .line 403
    const/16 v11, 0x386

    if-eq v2, v11, :cond_b

    .line 404
    const/16 v11, 0x39c

    if-eq v2, v11, :cond_b

    .line 405
    const/16 v11, 0x3a0

    if-eq v2, v11, :cond_b

    .line 406
    const/16 v11, 0x39b

    if-eq v2, v11, :cond_b

    .line 407
    const/16 v11, 0x39a

    if-ne v2, v11, :cond_d

    .line 408
    :cond_b
    add-int/lit8 p2, v3, -0x1

    .line 409
    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    const/4 v6, 0x1

    goto :goto_5

    .line 417
    .restart local v5    # "decodedData":[C
    .restart local v8    # "j":I
    :cond_c
    rsub-int/lit8 v11, v8, 0x5

    const-wide/16 v12, 0xff

    and-long/2addr v12, v9

    long-to-int v12, v12

    int-to-char v12, v12

    aput-char v12, v5, v11

    .line 418
    const/16 v11, 0x8

    shr-long/2addr v9, v11

    .line 416
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .end local v5    # "decodedData":[C
    .end local v8    # "j":I
    .end local p2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_d
    move/from16 p2, v3

    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    goto :goto_5

    .end local p2    # "codeIndex":I
    .restart local v1    # "byteCompactedCodewords":[I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "decodedData":[C
    :cond_e
    move/from16 p2, v3

    .end local v3    # "codeIndex":I
    .restart local p2    # "codeIndex":I
    goto/16 :goto_2
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

    .line 86
    new-instance v3, Ljava/lang/StringBuffer;

    const/16 v4, 0x64

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 88
    .local v3, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x1

    .line 89
    .local v1, "codeIndex":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "codeIndex":I
    .local v2, "codeIndex":I
    aget v0, p0, v1

    .local v0, "code":I
    move v1, v2

    .line 90
    .end local v2    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :goto_0
    const/4 v4, 0x0

    aget v4, p0, v4

    if-lt v1, v4, :cond_0

    .line 121
    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v6, v5, v6, v6}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/Vector;Ljava/lang/String;)V

    return-object v4

    .line 91
    :cond_0
    sparse-switch v0, :sswitch_data_0

    .line 111
    add-int/lit8 v1, v1, -0x1

    .line 112
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuffer;)I

    move-result v1

    .line 115
    :goto_1
    array-length v4, p0

    if-ge v1, v4, :cond_1

    .line 116
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    aget v0, p0, v1

    move v1, v2

    .end local v2    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    goto :goto_0

    .line 93
    :sswitch_0
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuffer;)I

    move-result v1

    .line 94
    goto :goto_1

    .line 96
    :sswitch_1
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuffer;)I

    move-result v1

    .line 97
    goto :goto_1

    .line 99
    :sswitch_2
    invoke-static {p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuffer;)I

    move-result v1

    .line 100
    goto :goto_1

    .line 102
    :sswitch_3
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuffer;)I

    move-result v1

    .line 103
    goto :goto_1

    .line 105
    :sswitch_4
    invoke-static {v0, p0, v1, v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[IILjava/lang/StringBuffer;)I

    move-result v1

    .line 106
    goto :goto_1

    .line 118
    :cond_1
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    .line 91
    nop

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

    .prologue
    .line 523
    const/4 v0, 0x0

    .line 524
    .local v0, "accum":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, p1, :cond_1

    .line 533
    const/4 v2, 0x0

    .line 536
    .local v2, "result":Ljava/lang/String;
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lt v1, v4, :cond_3

    .line 543
    :goto_2
    if-nez v2, :cond_0

    .line 545
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 547
    :cond_0
    return-object v2

    .line 525
    .end local v2    # "result":Ljava/lang/String;
    :cond_1
    sget-object v4, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/lang/String;

    sub-int v5, p1, v1

    add-int/lit8 v5, v5, -0x1

    aget-object v4, v4, v5

    aget v5, p0, v1

    invoke-static {v4, v5}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->multiply(Ljava/lang/String;I)Ljava/lang/StringBuffer;

    move-result-object v3

    .line 526
    .local v3, "value":Ljava/lang/StringBuffer;
    if-nez v0, :cond_2

    .line 528
    move-object v0, v3

    .line 524
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 530
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->add(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_3

    .line 537
    .end local v3    # "value":Ljava/lang/StringBuffer;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v4

    const/16 v5, 0x31

    if-ne v4, v5, :cond_4

    .line 539
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 540
    goto :goto_2

    .line 536
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuffer;)V
    .locals 11
    .param p0, "textCompactionData"    # [I
    .param p1, "byteCompactionData"    # [I
    .param p2, "length"    # I
    .param p3, "result"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v10, 0x1c

    const/16 v9, 0x1b

    const/16 v8, 0x391

    const/16 v7, 0x1d

    const/16 v6, 0x1a

    .line 209
    const/4 v3, 0x0

    .line 210
    .local v3, "subMode":I
    const/4 v2, 0x0

    .line 211
    .local v2, "priorToShiftMode":I
    const/4 v1, 0x0

    .line 212
    .local v1, "i":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 329
    return-void

    .line 213
    :cond_0
    aget v4, p0, v1

    .line 214
    .local v4, "subModeCh":I
    const/4 v0, 0x0

    .line 215
    .local v0, "ch":C
    packed-switch v3, :pswitch_data_0

    .line 323
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 325
    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 327
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 218
    :pswitch_0
    if-ge v4, v6, :cond_3

    .line 220
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    goto :goto_1

    .line 222
    :cond_3
    if-ne v4, v6, :cond_4

    .line 223
    const/16 v0, 0x20

    goto :goto_1

    .line 224
    :cond_4
    if-ne v4, v9, :cond_5

    .line 225
    const/4 v3, 0x1

    goto :goto_1

    .line 226
    :cond_5
    if-ne v4, v10, :cond_6

    .line 227
    const/4 v3, 0x2

    goto :goto_1

    .line 228
    :cond_6
    if-ne v4, v7, :cond_7

    .line 230
    move v2, v3

    .line 231
    const/4 v3, 0x5

    goto :goto_1

    .line 232
    :cond_7
    if-ne v4, v8, :cond_1

    .line 233
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 240
    :pswitch_1
    if-ge v4, v6, :cond_8

    .line 241
    add-int/lit8 v5, v4, 0x61

    int-to-char v0, v5

    goto :goto_1

    .line 243
    :cond_8
    if-ne v4, v6, :cond_9

    .line 244
    const/16 v0, 0x20

    goto :goto_1

    .line 245
    :cond_9
    if-ne v4, v9, :cond_a

    .line 247
    move v2, v3

    .line 248
    const/4 v3, 0x4

    goto :goto_1

    .line 249
    :cond_a
    if-ne v4, v10, :cond_b

    .line 250
    const/4 v3, 0x2

    goto :goto_1

    .line 251
    :cond_b
    if-ne v4, v7, :cond_c

    .line 253
    move v2, v3

    .line 254
    const/4 v3, 0x5

    goto :goto_1

    .line 255
    :cond_c
    if-ne v4, v8, :cond_1

    .line 256
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 263
    :pswitch_2
    const/16 v5, 0x19

    if-ge v4, v5, :cond_d

    .line 264
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v0, v5, v4

    goto :goto_1

    .line 266
    :cond_d
    const/16 v5, 0x19

    if-ne v4, v5, :cond_e

    .line 267
    const/4 v3, 0x3

    goto :goto_1

    .line 268
    :cond_e
    if-ne v4, v6, :cond_f

    .line 269
    const/16 v0, 0x20

    goto :goto_1

    .line 270
    :cond_f
    if-ne v4, v9, :cond_10

    .line 271
    const/4 v3, 0x1

    goto :goto_1

    .line 272
    :cond_10
    if-ne v4, v10, :cond_11

    .line 273
    const/4 v3, 0x0

    goto :goto_1

    .line 274
    :cond_11
    if-ne v4, v7, :cond_12

    .line 276
    move v2, v3

    .line 277
    const/4 v3, 0x5

    goto :goto_1

    .line 278
    :cond_12
    if-ne v4, v8, :cond_1

    .line 279
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 286
    :pswitch_3
    if-ge v4, v7, :cond_13

    .line 287
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    goto :goto_1

    .line 289
    :cond_13
    if-ne v4, v7, :cond_14

    .line 290
    const/4 v3, 0x0

    goto :goto_1

    .line 291
    :cond_14
    if-ne v4, v8, :cond_1

    .line 292
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_1

    .line 299
    :pswitch_4
    move v3, v2

    .line 300
    if-ge v4, v6, :cond_15

    .line 301
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    goto/16 :goto_1

    .line 303
    :cond_15
    if-ne v4, v6, :cond_1

    .line 304
    const/16 v0, 0x20

    .line 309
    goto/16 :goto_1

    .line 313
    :pswitch_5
    move v3, v2

    .line 314
    if-ge v4, v7, :cond_16

    .line 315
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    goto/16 :goto_1

    .line 317
    :cond_16
    if-ne v4, v7, :cond_1

    .line 318
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 215
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private static multiply(Ljava/lang/String;I)Ljava/lang/StringBuffer;
    .locals 10
    .param p0, "value1"    # Ljava/lang/String;
    .param p1, "value2"    # I

    .prologue
    const/16 v9, 0x30

    .line 558
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 559
    .local v4, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-lt v1, v6, :cond_0

    .line 563
    div-int/lit8 v0, p1, 0x64

    .line 564
    .local v0, "hundreds":I
    div-int/lit8 v6, p1, 0xa

    rem-int/lit8 v5, v6, 0xa

    .line 565
    .local v5, "tens":I
    rem-int/lit8 v3, p1, 0xa

    .line 567
    .local v3, "ones":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    if-lt v2, v3, :cond_1

    .line 571
    const/4 v2, 0x0

    :goto_2
    if-lt v2, v5, :cond_2

    .line 575
    const/4 v2, 0x0

    :goto_3
    if-lt v2, v0, :cond_3

    .line 578
    return-object v4

    .line 561
    .end local v0    # "hundreds":I
    .end local v2    # "j":I
    .end local v3    # "ones":I
    .end local v5    # "tens":I
    :cond_0
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 559
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 568
    .restart local v0    # "hundreds":I
    .restart local v2    # "j":I
    .restart local v3    # "ones":I
    .restart local v5    # "tens":I
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->add(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 567
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 572
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->add(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 571
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 576
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "00"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->add(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    .line 575
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method private static numericCompaction([IILjava/lang/StringBuffer;)I
    .locals 9
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v8, 0x384

    const/4 v7, 0x0

    .line 436
    const/4 v2, 0x0

    .line 437
    .local v2, "count":I
    const/4 v3, 0x0

    .line 439
    .local v3, "end":Z
    const/16 v6, 0xf

    new-array v4, v6, [I

    .line 441
    .local v4, "numericCodewords":[I
    :cond_0
    :goto_0
    aget v6, p0, v7

    if-ge p1, v6, :cond_1

    if-eqz v3, :cond_2

    .line 472
    :cond_1
    return p1

    .line 442
    :cond_2
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v1, "codeIndex":I
    aget v0, p0, p1

    .line 443
    .local v0, "code":I
    aget v6, p0, v7

    if-ne v1, v6, :cond_3

    .line 444
    const/4 v3, 0x1

    .line 446
    :cond_3
    if-ge v0, v8, :cond_5

    .line 447
    aput v0, v4, v2

    .line 448
    add-int/lit8 v2, v2, 0x1

    move p1, v1

    .line 460
    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    :goto_1
    rem-int/lit8 v6, v2, 0xf

    if-eqz v6, :cond_4

    .line 461
    const/16 v6, 0x386

    if-eq v0, v6, :cond_4

    .line 462
    if-eqz v3, :cond_0

    .line 467
    :cond_4
    invoke-static {v4, v2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v5

    .line 468
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 469
    const/4 v2, 0x0

    goto :goto_0

    .line 450
    .end local v5    # "s":Ljava/lang/String;
    .end local p1    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :cond_5
    if-eq v0, v8, :cond_6

    .line 451
    const/16 v6, 0x385

    if-eq v0, v6, :cond_6

    .line 452
    const/16 v6, 0x39c

    if-eq v0, v6, :cond_6

    .line 453
    const/16 v6, 0x3a0

    if-eq v0, v6, :cond_6

    .line 454
    const/16 v6, 0x39b

    if-eq v0, v6, :cond_6

    .line 455
    const/16 v6, 0x39a

    if-ne v0, v6, :cond_7

    .line 456
    :cond_6
    add-int/lit8 p1, v1, -0x1

    .line 457
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

.method private static textCompaction([IILjava/lang/StringBuffer;)I
    .locals 9
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuffer;

    .prologue
    const/4 v8, 0x0

    .line 136
    aget v6, p0, v8

    shl-int/lit8 v6, v6, 0x1

    new-array v5, v6, [I

    .line 138
    .local v5, "textCompactionData":[I
    aget v6, p0, v8

    shl-int/lit8 v6, v6, 0x1

    new-array v0, v6, [I

    .line 140
    .local v0, "byteCompactionData":[I
    const/4 v4, 0x0

    .line 141
    .local v4, "index":I
    const/4 v3, 0x0

    .line 142
    .local v3, "end":Z
    :goto_0
    aget v6, p0, v8

    if-ge p1, v6, :cond_0

    if-eqz v3, :cond_1

    .line 181
    :cond_0
    invoke-static {v5, v0, v4, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuffer;)V

    .line 182
    return p1

    .line 143
    :cond_1
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v2, "codeIndex":I
    aget v1, p0, p1

    .line 144
    .local v1, "code":I
    const/16 v6, 0x384

    if-ge v1, v6, :cond_2

    .line 145
    div-int/lit8 v6, v1, 0x1e

    aput v6, v5, v4

    .line 146
    add-int/lit8 v6, v4, 0x1

    rem-int/lit8 v7, v1, 0x1e

    aput v7, v5, v6

    .line 147
    add-int/lit8 v4, v4, 0x2

    move p1, v2

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_0

    .line 149
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :cond_2
    sparse-switch v1, :sswitch_data_0

    move p1, v2

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_0

    .line 151
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_0
    add-int/lit8 p1, v2, -0x1

    .line 152
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 153
    goto :goto_0

    .line 155
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_1
    add-int/lit8 p1, v2, -0x1

    .line 156
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 157
    goto :goto_0

    .line 159
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_2
    add-int/lit8 p1, v2, -0x1

    .line 160
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 161
    goto :goto_0

    .line 169
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_3
    const/16 v6, 0x391

    aput v6, v5, v4

    .line 170
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    aget v1, p0, v2

    .line 171
    aput v1, v0, v4

    .line 172
    add-int/lit8 v4, v4, 0x1

    .line 173
    goto :goto_0

    .line 175
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_4
    add-int/lit8 p1, v2, -0x1

    .line 176
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    goto :goto_0

    .line 149
    nop

    :sswitch_data_0
    .sparse-switch
        0x384 -> :sswitch_0
        0x385 -> :sswitch_1
        0x386 -> :sswitch_2
        0x391 -> :sswitch_3
        0x39c -> :sswitch_4
    .end sparse-switch
.end method
