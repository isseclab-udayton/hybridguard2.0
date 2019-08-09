.class public final Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSSExpandedReader.java"


# static fields
.field private static final EVEN_TOTAL_SUBSET:[I

.field private static final FINDER_PATTERNS:[[I

.field private static final FINDER_PATTERN_SEQUENCES:[[I

.field private static final FINDER_PAT_A:I = 0x0

.field private static final FINDER_PAT_B:I = 0x1

.field private static final FINDER_PAT_C:I = 0x2

.field private static final FINDER_PAT_D:I = 0x3

.field private static final FINDER_PAT_E:I = 0x4

.field private static final FINDER_PAT_F:I = 0x5

.field private static final GSUM:[I

.field private static final LONGEST_SEQUENCE_SIZE:I

.field private static final MAX_PAIRS:I = 0xb

.field private static final SYMBOL_WIDEST:[I

.field private static final WEIGHTS:[[I


# instance fields
.field private final currentSequence:[I

.field private final pairs:Ljava/util/Vector;

.field private final startEnd:[I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x3

    const/4 v6, 0x4

    const/16 v5, 0x8

    .line 49
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    .line 50
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    .line 51
    const/4 v0, 0x5

    new-array v0, v0, [I

    const/16 v1, 0x15c

    aput v1, v0, v8

    const/16 v1, 0x56c

    aput v1, v0, v9

    const/16 v1, 0xb84

    aput v1, v0, v7

    const/16 v1, 0xf94

    aput v1, v0, v6

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    .line 53
    const/4 v0, 0x6

    new-array v0, v0, [[I

    const/4 v1, 0x0

    .line 54
    new-array v2, v6, [I

    fill-array-data v2, :array_2

    aput-object v2, v0, v1

    .line 55
    new-array v1, v6, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v8

    .line 56
    new-array v1, v6, [I

    fill-array-data v1, :array_4

    aput-object v1, v0, v9

    .line 57
    new-array v1, v6, [I

    fill-array-data v1, :array_5

    aput-object v1, v0, v7

    .line 58
    new-array v1, v6, [I

    fill-array-data v1, :array_6

    aput-object v1, v0, v6

    const/4 v1, 0x5

    .line 59
    new-array v2, v6, [I

    fill-array-data v2, :array_7

    aput-object v2, v0, v1

    .line 53
    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    .line 62
    const/16 v0, 0x17

    new-array v0, v0, [[I

    const/4 v1, 0x0

    .line 63
    new-array v2, v5, [I

    fill-array-data v2, :array_8

    aput-object v2, v0, v1

    .line 64
    new-array v1, v5, [I

    fill-array-data v1, :array_9

    aput-object v1, v0, v8

    .line 65
    new-array v1, v5, [I

    fill-array-data v1, :array_a

    aput-object v1, v0, v9

    .line 66
    new-array v1, v5, [I

    fill-array-data v1, :array_b

    aput-object v1, v0, v7

    .line 67
    new-array v1, v5, [I

    fill-array-data v1, :array_c

    aput-object v1, v0, v6

    const/4 v1, 0x5

    .line 68
    new-array v2, v5, [I

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 69
    new-array v2, v5, [I

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 70
    new-array v2, v5, [I

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    .line 71
    new-array v1, v5, [I

    fill-array-data v1, :array_10

    aput-object v1, v0, v5

    const/16 v1, 0x9

    .line 72
    new-array v2, v5, [I

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 73
    new-array v2, v5, [I

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 74
    new-array v2, v5, [I

    fill-array-data v2, :array_13

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 75
    new-array v2, v5, [I

    fill-array-data v2, :array_14

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 76
    new-array v2, v5, [I

    fill-array-data v2, :array_15

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 77
    new-array v2, v5, [I

    fill-array-data v2, :array_16

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 78
    new-array v2, v5, [I

    fill-array-data v2, :array_17

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 79
    new-array v2, v5, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 80
    new-array v2, v5, [I

    fill-array-data v2, :array_19

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 81
    new-array v2, v5, [I

    fill-array-data v2, :array_1a

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 82
    new-array v2, v5, [I

    fill-array-data v2, :array_1b

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 83
    new-array v2, v5, [I

    fill-array-data v2, :array_1c

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 84
    new-array v2, v5, [I

    fill-array-data v2, :array_1d

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 85
    new-array v2, v5, [I

    fill-array-data v2, :array_1e

    aput-object v2, v0, v1

    .line 62
    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    .line 95
    const/16 v0, 0xa

    new-array v0, v0, [[I

    const/4 v1, 0x0

    .line 96
    new-array v2, v9, [I

    aput-object v2, v0, v1

    .line 97
    new-array v1, v7, [I

    aput v8, v1, v8

    aput v8, v1, v9

    aput-object v1, v0, v8

    .line 98
    new-array v1, v6, [I

    aput v9, v1, v8

    aput v8, v1, v9

    aput v7, v1, v7

    aput-object v1, v0, v9

    .line 99
    const/4 v1, 0x5

    new-array v1, v1, [I

    aput v6, v1, v8

    aput v8, v1, v9

    aput v7, v1, v7

    aput v9, v1, v6

    aput-object v1, v0, v7

    .line 100
    const/4 v1, 0x6

    new-array v1, v1, [I

    aput v6, v1, v8

    aput v8, v1, v9

    aput v7, v1, v7

    aput v7, v1, v6

    const/4 v2, 0x5

    const/4 v3, 0x5

    aput v3, v1, v2

    aput-object v1, v0, v6

    const/4 v1, 0x5

    .line 101
    const/4 v2, 0x7

    new-array v2, v2, [I

    aput v6, v2, v8

    aput v8, v2, v9

    aput v7, v2, v7

    aput v6, v2, v6

    const/4 v3, 0x5

    const/4 v4, 0x5

    aput v4, v2, v3

    const/4 v3, 0x6

    const/4 v4, 0x5

    aput v4, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 102
    new-array v2, v5, [I

    aput v8, v2, v9

    aput v8, v2, v7

    aput v9, v2, v6

    const/4 v3, 0x5

    aput v9, v2, v3

    const/4 v3, 0x6

    aput v7, v2, v3

    const/4 v3, 0x7

    aput v7, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 103
    const/16 v2, 0x9

    new-array v2, v2, [I

    aput v8, v2, v9

    aput v8, v2, v7

    aput v9, v2, v6

    const/4 v3, 0x5

    aput v9, v2, v3

    const/4 v3, 0x6

    aput v7, v2, v3

    const/4 v3, 0x7

    aput v6, v2, v3

    aput v6, v2, v5

    aput-object v2, v0, v1

    .line 104
    const/16 v1, 0xa

    new-array v1, v1, [I

    aput v8, v1, v9

    aput v8, v1, v7

    aput v9, v1, v6

    const/4 v2, 0x5

    aput v9, v1, v2

    const/4 v2, 0x6

    aput v7, v1, v2

    const/4 v2, 0x7

    aput v6, v1, v2

    const/4 v2, 0x5

    aput v2, v1, v5

    const/16 v2, 0x9

    const/4 v3, 0x5

    aput v3, v1, v2

    aput-object v1, v0, v5

    const/16 v1, 0x9

    .line 105
    const/16 v2, 0xb

    new-array v2, v2, [I

    aput v8, v2, v9

    aput v8, v2, v7

    aput v9, v2, v6

    const/4 v3, 0x5

    aput v7, v2, v3

    const/4 v3, 0x6

    aput v7, v2, v3

    const/4 v3, 0x7

    aput v6, v2, v3

    aput v6, v2, v5

    const/16 v3, 0x9

    const/4 v4, 0x5

    aput v4, v2, v3

    const/16 v3, 0xa

    const/4 v4, 0x5

    aput v4, v2, v3

    aput-object v2, v0, v1

    .line 95
    sput-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    .line 108
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    sget-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    array-length v0, v0

    sput v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->LONGEST_SEQUENCE_SIZE:I

    .line 47
    return-void

    .line 49
    nop

    :array_0
    .array-data 4
        0x7
        0x5
        0x4
        0x3
        0x1
    .end array-data

    .line 50
    :array_1
    .array-data 4
        0x4
        0x14
        0x34
        0x68
        0xcc
    .end array-data

    .line 54
    :array_2
    .array-data 4
        0x1
        0x8
        0x4
        0x1
    .end array-data

    .line 55
    :array_3
    .array-data 4
        0x3
        0x6
        0x4
        0x1
    .end array-data

    .line 56
    :array_4
    .array-data 4
        0x3
        0x4
        0x6
        0x1
    .end array-data

    .line 57
    :array_5
    .array-data 4
        0x3
        0x2
        0x8
        0x1
    .end array-data

    .line 58
    :array_6
    .array-data 4
        0x2
        0x6
        0x5
        0x1
    .end array-data

    .line 59
    :array_7
    .array-data 4
        0x2
        0x2
        0x9
        0x1
    .end array-data

    .line 63
    :array_8
    .array-data 4
        0x1
        0x3
        0x9
        0x1b
        0x51
        0x20
        0x60
        0x4d
    .end array-data

    .line 64
    :array_9
    .array-data 4
        0x14
        0x3c
        0xb4
        0x76
        0x8f
        0x7
        0x15
        0x3f
    .end array-data

    .line 65
    :array_a
    .array-data 4
        0xbd
        0x91
        0xd
        0x27
        0x75
        0x8c
        0xd1
        0xcd
    .end array-data

    .line 66
    :array_b
    .array-data 4
        0xc1
        0x9d
        0x31
        0x93
        0x13
        0x39
        0xab
        0x5b
    .end array-data

    .line 67
    :array_c
    .array-data 4
        0x3e
        0xba
        0x88
        0xc5
        0xa9
        0x55
        0x2c
        0x84
    .end array-data

    .line 68
    :array_d
    .array-data 4
        0xb9
        0x85
        0xbc
        0x8e
        0x4
        0xc
        0x24
        0x6c
    .end array-data

    .line 69
    :array_e
    .array-data 4
        0x71
        0x80
        0xad
        0x61
        0x50
        0x1d
        0x57
        0x32
    .end array-data

    .line 70
    :array_f
    .array-data 4
        0x96
        0x1c
        0x54
        0x29
        0x7b
        0x9e
        0x34
        0x9c
    .end array-data

    .line 71
    :array_10
    .array-data 4
        0x2e
        0x8a
        0xcb
        0xbb
        0x8b
        0xce
        0xc4
        0xa6
    .end array-data

    .line 72
    :array_11
    .array-data 4
        0x4c
        0x11
        0x33
        0x99
        0x25
        0x6f
        0x7a
        0x9b
    .end array-data

    .line 73
    :array_12
    .array-data 4
        0x2b
        0x81
        0xb0
        0x6a
        0x6b
        0x6e
        0x77
        0x92
    .end array-data

    .line 74
    :array_13
    .array-data 4
        0x10
        0x30
        0x90
        0xa
        0x1e
        0x5a
        0x3b
        0xb1
    .end array-data

    .line 75
    :array_14
    .array-data 4
        0x6d
        0x74
        0x89
        0xc8
        0xb2
        0x70
        0x7d
        0xa4
    .end array-data

    .line 76
    :array_15
    .array-data 4
        0x46
        0xd2
        0xd0
        0xca
        0xb8
        0x82
        0xb3
        0x73
    .end array-data

    .line 77
    :array_16
    .array-data 4
        0x86
        0xbf
        0x97
        0x1f
        0x5d
        0x44
        0xcc
        0xbe
    .end array-data

    .line 78
    :array_17
    .array-data 4
        0x94
        0x16
        0x42
        0xc6
        0xac
        0x5e
        0x47
        0x2
    .end array-data

    .line 79
    :array_18
    .array-data 4
        0x6
        0x12
        0x36
        0xa2
        0x40
        0xc0
        0x9a
        0x28
    .end array-data

    .line 80
    :array_19
    .array-data 4
        0x78
        0x95
        0x19
        0x4b
        0xe
        0x2a
        0x7e
        0xa7
    .end array-data

    .line 81
    :array_1a
    .array-data 4
        0x4f
        0x1a
        0x4e
        0x17
        0x45
        0xcf
        0xc7
        0xaf
    .end array-data

    .line 82
    :array_1b
    .array-data 4
        0x67
        0x62
        0x53
        0x26
        0x72
        0x83
        0xb6
        0x7c
    .end array-data

    .line 83
    :array_1c
    .array-data 4
        0xa1
        0x3d
        0xb7
        0x7f
        0xaa
        0x58
        0x35
        0x9f
    .end array-data

    .line 84
    :array_1d
    .array-data 4
        0x37
        0xa5
        0x49
        0x8
        0x18
        0x48
        0x5
        0xf
    .end array-data

    .line 85
    :array_1e
    .array-data 4
        0x2d
        0x87
        0xc2
        0xa0
        0x3a
        0xae
        0x64
        0x59
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    .line 111
    new-instance v0, Ljava/util/Vector;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    .line 112
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    .line 113
    sget v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->LONGEST_SEQUENCE_SIZE:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->currentSequence:[I

    .line 47
    return-void
.end method

.method private adjustOddEvenCounts(I)V
    .locals 13
    .param p1, "numModules"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/16 v12, 0xd

    const/4 v11, 0x4

    const/4 v2, 0x0

    const/4 v9, 0x1

    .line 490
    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddCounts:[I

    invoke-static {v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v8

    .line 491
    .local v8, "oddSum":I
    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenCounts:[I

    invoke-static {v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v3

    .line 492
    .local v3, "evenSum":I
    add-int v10, v8, v3

    sub-int v6, v10, p1

    .line 493
    .local v6, "mismatch":I
    and-int/lit8 v10, v8, 0x1

    if-ne v10, v9, :cond_3

    move v7, v9

    .line 494
    .local v7, "oddParityBad":Z
    :goto_0
    and-int/lit8 v10, v3, 0x1

    if-nez v10, :cond_0

    move v2, v9

    .line 496
    .local v2, "evenParityBad":Z
    :cond_0
    const/4 v5, 0x0

    .line 497
    .local v5, "incrementOdd":Z
    const/4 v1, 0x0

    .line 499
    .local v1, "decrementOdd":Z
    if-le v8, v12, :cond_4

    .line 500
    const/4 v1, 0x1

    .line 504
    :cond_1
    :goto_1
    const/4 v4, 0x0

    .line 505
    .local v4, "incrementEven":Z
    const/4 v0, 0x0

    .line 506
    .local v0, "decrementEven":Z
    if-le v3, v12, :cond_5

    .line 507
    const/4 v0, 0x1

    .line 512
    :cond_2
    :goto_2
    if-ne v6, v9, :cond_a

    .line 513
    if-eqz v7, :cond_8

    .line 514
    if-eqz v2, :cond_6

    .line 515
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .end local v0    # "decrementEven":Z
    .end local v1    # "decrementOdd":Z
    .end local v2    # "evenParityBad":Z
    .end local v4    # "incrementEven":Z
    .end local v5    # "incrementOdd":Z
    .end local v7    # "oddParityBad":Z
    :cond_3
    move v7, v2

    .line 493
    goto :goto_0

    .line 501
    .restart local v1    # "decrementOdd":Z
    .restart local v2    # "evenParityBad":Z
    .restart local v5    # "incrementOdd":Z
    .restart local v7    # "oddParityBad":Z
    :cond_4
    if-ge v8, v11, :cond_1

    .line 502
    const/4 v5, 0x1

    goto :goto_1

    .line 508
    .restart local v0    # "decrementEven":Z
    .restart local v4    # "incrementEven":Z
    :cond_5
    if-ge v3, v11, :cond_2

    .line 509
    const/4 v4, 0x1

    goto :goto_2

    .line 517
    :cond_6
    const/4 v1, 0x1

    .line 559
    :cond_7
    :goto_3
    if-eqz v5, :cond_14

    .line 560
    if-eqz v1, :cond_13

    .line 561
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 519
    :cond_8
    if-nez v2, :cond_9

    .line 520
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 522
    :cond_9
    const/4 v0, 0x1

    goto :goto_3

    .line 524
    :cond_a
    const/4 v9, -0x1

    if-ne v6, v9, :cond_e

    .line 525
    if-eqz v7, :cond_c

    .line 526
    if-eqz v2, :cond_b

    .line 527
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 529
    :cond_b
    const/4 v5, 0x1

    goto :goto_3

    .line 531
    :cond_c
    if-nez v2, :cond_d

    .line 532
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 534
    :cond_d
    const/4 v4, 0x1

    goto :goto_3

    .line 536
    :cond_e
    if-nez v6, :cond_12

    .line 537
    if-eqz v7, :cond_11

    .line 538
    if-nez v2, :cond_f

    .line 539
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 542
    :cond_f
    if-ge v8, v3, :cond_10

    .line 543
    const/4 v5, 0x1

    .line 544
    const/4 v0, 0x1

    goto :goto_3

    .line 546
    :cond_10
    const/4 v1, 0x1

    .line 547
    const/4 v4, 0x1

    goto :goto_3

    .line 550
    :cond_11
    if-eqz v2, :cond_7

    .line 551
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 556
    :cond_12
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 563
    :cond_13
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddCounts:[I

    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddRoundingErrors:[F

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    .line 565
    :cond_14
    if-eqz v1, :cond_15

    .line 566
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddCounts:[I

    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddRoundingErrors:[F

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 568
    :cond_15
    if-eqz v4, :cond_17

    .line 569
    if-eqz v0, :cond_16

    .line 570
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 572
    :cond_16
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenCounts:[I

    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddRoundingErrors:[F

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    .line 574
    :cond_17
    if-eqz v0, :cond_18

    .line 575
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenCounts:[I

    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenRoundingErrors:[F

    invoke-static {v9, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    .line 577
    :cond_18
    return-void
.end method

.method private checkChecksum()Z
    .locals 10

    .prologue
    const/4 v8, 0x0

    .line 160
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-virtual {v9, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 161
    .local v6, "firstPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1

    .line 162
    .local v1, "checkCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v5

    .line 164
    .local v5, "firstCharacter":Lcom/google/zxing/oned/rss/DataCharacter;
    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v3

    .line 165
    .local v3, "checksum":I
    const/4 v0, 0x2

    .line 167
    .local v0, "S":I
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_0
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-lt v7, v9, :cond_1

    .line 177
    rem-int/lit16 v3, v3, 0xd3

    .line 179
    add-int/lit8 v9, v0, -0x4

    mul-int/lit16 v9, v9, 0xd3

    add-int v2, v9, v3

    .line 181
    .local v2, "checkCharacterValue":I
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v9

    if-ne v2, v9, :cond_0

    const/4 v8, 0x1

    :cond_0
    return v8

    .line 168
    .end local v2    # "checkCharacterValue":I
    :cond_1
    iget-object v9, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-virtual {v9, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 169
    .local v4, "currentPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v3, v9

    .line 170
    add-int/lit8 v0, v0, 0x1

    .line 171
    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 172
    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v3, v9

    .line 173
    add-int/lit8 v0, v0, 0x1

    .line 167
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method private checkPairSequence(Ljava/util/Vector;Lcom/google/zxing/oned/rss/FinderPattern;)Z
    .locals 8
    .param p1, "previousPairs"    # Ljava/util/Vector;
    .param p2, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v5

    add-int/lit8 v0, v5, 0x1

    .line 237
    .local v0, "currentSequenceLength":I
    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->currentSequence:[I

    array-length v5, v5

    if-le v0, v5, :cond_0

    .line 238
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 241
    :cond_0
    const/4 v2, 0x0

    .local v2, "pos":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v5

    if-lt v2, v5, :cond_1

    .line 245
    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->currentSequence:[I

    add-int/lit8 v6, v0, -0x1

    invoke-virtual {p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v7

    aput v7, v5, v6

    .line 247
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    sget-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    array-length v5, v5

    if-lt v1, v5, :cond_2

    .line 264
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    .line 242
    .end local v1    # "i":I
    :cond_1
    iget-object v6, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->currentSequence:[I

    invoke-virtual {p1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v5

    aput v5, v6, v2

    .line 241
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 248
    .restart local v1    # "i":I
    :cond_2
    sget-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    aget-object v4, v5, v1

    .line 249
    .local v4, "validSequence":[I
    array-length v5, v4

    if-lt v5, v0, :cond_6

    .line 250
    const/4 v3, 0x1

    .line 251
    .local v3, "valid":Z
    const/4 v2, 0x0

    :goto_2
    if-lt v2, v0, :cond_3

    .line 258
    :goto_3
    if-eqz v3, :cond_6

    .line 259
    array-length v5, v4

    if-ne v0, v5, :cond_5

    const/4 v5, 0x1

    :goto_4
    return v5

    .line 252
    :cond_3
    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->currentSequence:[I

    aget v5, v5, v2

    aget v6, v4, v2

    if-eq v5, v6, :cond_4

    .line 253
    const/4 v3, 0x0

    .line 254
    goto :goto_3

    .line 251
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 259
    :cond_5
    const/4 v5, 0x0

    goto :goto_4

    .line 247
    .end local v3    # "valid":Z
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static constructResult(Ljava/util/Vector;)Lcom/google/zxing/Result;
    .locals 11
    .param p0, "pairs"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 143
    invoke-static {p0}, Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;->buildBitArray(Ljava/util/Vector;)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    .line 145
    .local v0, "binary":Lcom/google/zxing/common/BitArray;
    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    move-result-object v1

    .line 146
    .local v1, "decoder":Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->parseInformation()Ljava/lang/String;

    move-result-object v4

    .line 148
    .local v4, "resultingString":Ljava/lang/String;
    invoke-virtual {p0, v9}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 149
    .local v2, "firstPoints":[Lcom/google/zxing/ResultPoint;
    invoke-virtual {p0}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 151
    .local v3, "lastPoints":[Lcom/google/zxing/ResultPoint;
    new-instance v5, Lcom/google/zxing/Result;

    .line 153
    const/4 v6, 0x0

    .line 154
    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/zxing/ResultPoint;

    aget-object v8, v2, v9

    aput-object v8, v7, v9

    aget-object v8, v2, v10

    aput-object v8, v7, v10

    const/4 v8, 0x2

    aget-object v9, v3, v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    aget-object v9, v3, v10

    aput-object v9, v7, v8

    .line 155
    sget-object v8, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    .line 151
    invoke-direct {v5, v4, v6, v7, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v5
.end method

.method private findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/Vector;I)V
    .locals 12
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "previousPairs"    # Ljava/util/Vector;
    .param p3, "forcedOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 268
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeFinderCounters:[I

    .line 269
    .local v1, "counters":[I
    const/4 v10, 0x0

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 270
    const/4 v10, 0x1

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 271
    const/4 v10, 0x2

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 272
    const/4 v10, 0x3

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 274
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    .line 277
    .local v8, "width":I
    if-ltz p3, :cond_1

    .line 278
    move v6, p3

    .line 285
    .local v6, "rowOffset":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v10

    rem-int/lit8 v10, v10, 0x2

    if-eqz v10, :cond_3

    const/4 v7, 0x1

    .line 287
    .local v7, "searchingEvenPair":Z
    :goto_1
    const/4 v2, 0x0

    .line 288
    .local v2, "isWhite":Z
    :goto_2
    if-lt v6, v8, :cond_4

    .line 296
    :cond_0
    const/4 v0, 0x0

    .line 297
    .local v0, "counterPosition":I
    move v4, v6

    .line 298
    .local v4, "patternStart":I
    move v9, v6

    .local v9, "x":I
    :goto_3
    if-lt v9, v8, :cond_6

    .line 331
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v10

    throw v10

    .line 279
    .end local v0    # "counterPosition":I
    .end local v2    # "isWhite":Z
    .end local v4    # "patternStart":I
    .end local v6    # "rowOffset":I
    .end local v7    # "searchingEvenPair":Z
    .end local v9    # "x":I
    :cond_1
    invoke-virtual {p2}, Ljava/util/Vector;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 280
    const/4 v6, 0x0

    .restart local v6    # "rowOffset":I
    goto :goto_0

    .line 282
    .end local v6    # "rowOffset":I
    :cond_2
    invoke-virtual {p2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    .line 283
    .local v3, "lastPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v10

    const/4 v11, 0x1

    aget v6, v10, v11

    .restart local v6    # "rowOffset":I
    goto :goto_0

    .line 285
    .end local v3    # "lastPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    :cond_3
    const/4 v7, 0x0

    goto :goto_1

    .line 289
    .restart local v2    # "isWhite":Z
    .restart local v7    # "searchingEvenPair":Z
    :cond_4
    invoke-virtual {p1, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    if-eqz v10, :cond_5

    const/4 v2, 0x0

    .line 290
    :goto_4
    if-eqz v2, :cond_0

    .line 293
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 289
    :cond_5
    const/4 v2, 0x1

    goto :goto_4

    .line 299
    .restart local v0    # "counterPosition":I
    .restart local v4    # "patternStart":I
    .restart local v9    # "x":I
    :cond_6
    invoke-virtual {p1, v9}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    .line 300
    .local v5, "pixel":Z
    xor-int v10, v5, v2

    if-eqz v10, :cond_7

    .line 301
    aget v10, v1, v0

    add-int/lit8 v10, v10, 0x1

    aput v10, v1, v0

    .line 298
    :goto_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 303
    :cond_7
    const/4 v10, 0x3

    if-ne v0, v10, :cond_b

    .line 304
    if-eqz v7, :cond_8

    .line 305
    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 308
    :cond_8
    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isFinderPattern([I)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 309
    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    const/4 v11, 0x0

    aput v4, v10, v11

    .line 310
    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    const/4 v11, 0x1

    aput v9, v10, v11

    .line 311
    return-void

    .line 314
    :cond_9
    if-eqz v7, :cond_a

    .line 315
    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    .line 318
    :cond_a
    const/4 v10, 0x0

    aget v10, v1, v10

    const/4 v11, 0x1

    aget v11, v1, v11

    add-int/2addr v10, v11

    add-int/2addr v4, v10

    .line 319
    const/4 v10, 0x0

    const/4 v11, 0x2

    aget v11, v1, v11

    aput v11, v1, v10

    .line 320
    const/4 v10, 0x1

    const/4 v11, 0x3

    aget v11, v1, v11

    aput v11, v1, v10

    .line 321
    const/4 v10, 0x2

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 322
    const/4 v10, 0x3

    const/4 v11, 0x0

    aput v11, v1, v10

    .line 323
    add-int/lit8 v0, v0, -0x1

    .line 327
    :goto_6
    const/4 v10, 0x1

    aput v10, v1, v0

    .line 328
    if-eqz v2, :cond_c

    const/4 v2, 0x0

    :goto_7
    goto :goto_5

    .line 325
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 328
    :cond_c
    const/4 v2, 0x1

    goto :goto_7
.end method

.method private static getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I
    .locals 3
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "initialPos"    # I

    .prologue
    .line 185
    move v1, p1

    .line 186
    .local v1, "currentPos":I
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    .line 188
    .local v0, "current":Z
    :goto_0
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eq v2, v0, :cond_2

    .line 192
    :cond_0
    if-eqz v0, :cond_3

    const/4 v0, 0x0

    .line 193
    :goto_1
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eq v2, v0, :cond_4

    .line 197
    :cond_1
    return v1

    .line 189
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    :cond_3
    const/4 v0, 0x1

    goto :goto_1

    .line 194
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z
    .locals 1
    .param p0, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p1, "isOddPattern"    # Z
    .param p2, "leftChar"    # Z

    .prologue
    .line 485
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;
    .locals 12
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "rowNumber"    # I
    .param p3, "oddPattern"    # Z

    .prologue
    const/4 v11, 0x1

    const/4 v5, 0x0

    .line 349
    if-eqz p3, :cond_2

    .line 352
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v0, v0, v5

    add-int/lit8 v8, v0, -0x1

    .line 354
    .local v8, "firstElementStart":I
    :goto_0
    if-ltz v8, :cond_0

    invoke-virtual {p1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 358
    :cond_0
    add-int/lit8 v8, v8, 0x1

    .line 359
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v0, v0, v5

    sub-int v7, v0, v8

    .line 360
    .local v7, "firstCounter":I
    move v3, v8

    .line 361
    .local v3, "start":I
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v0, v11

    .line 378
    .local v4, "end":I
    :goto_1
    iget-object v6, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeFinderCounters:[I

    .line 379
    .local v6, "counters":[I
    array-length v0, v6

    add-int/lit8 v9, v0, -0x1

    .local v9, "i":I
    :goto_2
    if-gtz v9, :cond_5

    .line 383
    aput v7, v6, v5

    .line 386
    :try_start_0
    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    invoke-static {v6, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFinderValue([I[[I)I
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 390
    .local v1, "value":I
    new-instance v0, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v2, 0x2

    new-array v2, v2, [I

    aput v3, v2, v5

    aput v4, v2, v11

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    .end local v1    # "value":I
    :goto_3
    return-object v0

    .line 355
    .end local v3    # "start":I
    .end local v4    # "end":I
    .end local v6    # "counters":[I
    .end local v7    # "firstCounter":I
    .end local v9    # "i":I
    :cond_1
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 366
    .end local v8    # "firstElementStart":I
    :cond_2
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v3, v0, v5

    .line 368
    .restart local v3    # "start":I
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v0, v0, v11

    add-int/lit8 v8, v0, 0x1

    .line 369
    .restart local v8    # "firstElementStart":I
    :goto_4
    invoke-virtual {p1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p1, Lcom/google/zxing/common/BitArray;->size:I

    if-lt v8, v0, :cond_4

    .line 373
    :cond_3
    move v4, v8

    .line 374
    .restart local v4    # "end":I
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v0, v0, v11

    sub-int v7, v4, v0

    .restart local v7    # "firstCounter":I
    goto :goto_1

    .line 370
    .end local v4    # "end":I
    .end local v7    # "firstCounter":I
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 380
    .restart local v4    # "end":I
    .restart local v6    # "counters":[I
    .restart local v7    # "firstCounter":I
    .restart local v9    # "i":I
    :cond_5
    add-int/lit8 v0, v9, -0x1

    aget v0, v6, v0

    aput v0, v6, v9

    .line 379
    add-int/lit8 v9, v9, -0x1

    goto :goto_2

    .line 387
    :catch_0
    move-exception v10

    .line 388
    .local v10, "nfe":Lcom/google/zxing/NotFoundException;
    const/4 v0, 0x0

    goto :goto_3
.end method

.method private static reverseCounters([I)V
    .locals 4
    .param p0, "counters"    # [I

    .prologue
    .line 335
    array-length v1, p0

    .line 336
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    div-int/lit8 v3, v1, 0x2

    if-lt v0, v3, :cond_0

    .line 341
    return-void

    .line 337
    :cond_0
    aget v2, p0, v0

    .line 338
    .local v2, "tmp":I
    sub-int v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    aget v3, p0, v3

    aput v3, p0, v0

    .line 339
    sub-int v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    aput v2, p0, v3

    .line 336
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;
    .locals 32
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "pattern"    # Lcom/google/zxing/oned/rss/FinderPattern;
    .param p3, "isOddPattern"    # Z
    .param p4, "leftChar"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 395
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->dataCharacterCounters:[I

    .line 396
    .local v5, "counters":[I
    const/16 v30, 0x0

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 397
    const/16 v30, 0x1

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 398
    const/16 v30, 0x2

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 399
    const/16 v30, 0x3

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 400
    const/16 v30, 0x4

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 401
    const/16 v30, 0x5

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 402
    const/16 v30, 0x6

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 403
    const/16 v30, 0x7

    const/16 v31, 0x0

    aput v31, v5, v30

    .line 405
    if-eqz p4, :cond_2

    .line 406
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v30

    const/16 v31, 0x0

    aget v30, v30, v31

    move-object/from16 v0, p1

    move/from16 v1, v30

    invoke-static {v0, v1, v5}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    .line 417
    :cond_0
    const/16 v16, 0x11

    .line 418
    .local v16, "numModules":I
    invoke-static {v5}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v30

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v31, v0

    div-float v6, v30, v31

    .line 420
    .local v6, "elementWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddCounts:[I

    move-object/from16 v18, v0

    .line 421
    .local v18, "oddCounts":[I
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenCounts:[I

    .line 422
    .local v8, "evenCounts":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->oddRoundingErrors:[F

    move-object/from16 v19, v0

    .line 423
    .local v19, "oddRoundingErrors":[F
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->evenRoundingErrors:[F

    .line 425
    .local v9, "evenRoundingErrors":[F
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    array-length v0, v5

    move/from16 v30, v0

    move/from16 v0, v30

    if-lt v14, v0, :cond_3

    .line 443
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->adjustOddEvenCounts(I)V

    .line 445
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v30

    mul-int/lit8 v31, v30, 0x4

    if-eqz p3, :cond_7

    const/16 v30, 0x0

    :goto_1
    add-int v31, v31, v30

    if-eqz p4, :cond_8

    const/16 v30, 0x0

    :goto_2
    add-int v30, v30, v31

    add-int/lit8 v29, v30, -0x1

    .line 447
    .local v29, "weightRowNumber":I
    const/16 v20, 0x0

    .line 448
    .local v20, "oddSum":I
    const/16 v17, 0x0

    .line 449
    .local v17, "oddChecksumPortion":I
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v30, v0

    add-int/lit8 v14, v30, -0x1

    :goto_3
    if-gez v14, :cond_9

    .line 456
    const/4 v7, 0x0

    .line 457
    .local v7, "evenChecksumPortion":I
    const/4 v10, 0x0

    .line 458
    .local v10, "evenSum":I
    array-length v0, v8

    move/from16 v30, v0

    add-int/lit8 v14, v30, -0x1

    :goto_4
    if-gez v14, :cond_b

    .line 465
    add-int v3, v17, v7

    .line 467
    .local v3, "checksumPortion":I
    and-int/lit8 v30, v20, 0x1

    if-nez v30, :cond_1

    const/16 v30, 0xd

    move/from16 v0, v20

    move/from16 v1, v30

    if-gt v0, v1, :cond_1

    const/16 v30, 0x4

    move/from16 v0, v20

    move/from16 v1, v30

    if-ge v0, v1, :cond_d

    .line 468
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v30

    throw v30

    .line 408
    .end local v3    # "checksumPortion":I
    .end local v6    # "elementWidth":F
    .end local v7    # "evenChecksumPortion":I
    .end local v8    # "evenCounts":[I
    .end local v9    # "evenRoundingErrors":[F
    .end local v10    # "evenSum":I
    .end local v14    # "i":I
    .end local v16    # "numModules":I
    .end local v17    # "oddChecksumPortion":I
    .end local v18    # "oddCounts":[I
    .end local v19    # "oddRoundingErrors":[F
    .end local v20    # "oddSum":I
    .end local v29    # "weightRowNumber":I
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v30

    const/16 v31, 0x1

    aget v30, v30, v31

    add-int/lit8 v30, v30, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    invoke-static {v0, v1, v5}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 410
    const/4 v14, 0x0

    .restart local v14    # "i":I
    array-length v0, v5

    move/from16 v30, v0

    add-int/lit8 v15, v30, -0x1

    .local v15, "j":I
    :goto_5
    if-ge v14, v15, :cond_0

    .line 411
    aget v24, v5, v14

    .line 412
    .local v24, "temp":I
    aget v30, v5, v15

    aput v30, v5, v14

    .line 413
    aput v24, v5, v15

    .line 410
    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v15, v15, -0x1

    goto :goto_5

    .line 426
    .end local v15    # "j":I
    .end local v24    # "temp":I
    .restart local v6    # "elementWidth":F
    .restart local v8    # "evenCounts":[I
    .restart local v9    # "evenRoundingErrors":[F
    .restart local v16    # "numModules":I
    .restart local v18    # "oddCounts":[I
    .restart local v19    # "oddRoundingErrors":[F
    :cond_3
    const/high16 v30, 0x3f800000    # 1.0f

    aget v31, v5, v14

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    mul-float v30, v30, v31

    div-float v27, v30, v6

    .line 427
    .local v27, "value":F
    const/high16 v30, 0x3f000000    # 0.5f

    add-float v30, v30, v27

    move/from16 v0, v30

    float-to-int v4, v0

    .line 428
    .local v4, "count":I
    const/16 v30, 0x1

    move/from16 v0, v30

    if-ge v4, v0, :cond_5

    .line 429
    const/4 v4, 0x1

    .line 433
    :cond_4
    :goto_6
    shr-int/lit8 v22, v14, 0x1

    .line 434
    .local v22, "offset":I
    and-int/lit8 v30, v14, 0x1

    if-nez v30, :cond_6

    .line 435
    aput v4, v18, v22

    .line 436
    int-to-float v0, v4

    move/from16 v30, v0

    sub-float v30, v27, v30

    aput v30, v19, v22

    .line 425
    :goto_7
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_0

    .line 430
    .end local v22    # "offset":I
    :cond_5
    const/16 v30, 0x8

    move/from16 v0, v30

    if-le v4, v0, :cond_4

    .line 431
    const/16 v4, 0x8

    goto :goto_6

    .line 438
    .restart local v22    # "offset":I
    :cond_6
    aput v4, v8, v22

    .line 439
    int-to-float v0, v4

    move/from16 v30, v0

    sub-float v30, v27, v30

    aput v30, v9, v22

    goto :goto_7

    .line 445
    .end local v4    # "count":I
    .end local v22    # "offset":I
    .end local v27    # "value":F
    :cond_7
    const/16 v30, 0x2

    goto/16 :goto_1

    :cond_8
    const/16 v30, 0x1

    goto/16 :goto_2

    .line 450
    .restart local v17    # "oddChecksumPortion":I
    .restart local v20    # "oddSum":I
    .restart local v29    # "weightRowNumber":I
    :cond_9
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v30

    if-eqz v30, :cond_a

    .line 451
    sget-object v30, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v30, v30, v29

    mul-int/lit8 v31, v14, 0x2

    aget v28, v30, v31

    .line 452
    .local v28, "weight":I
    aget v30, v18, v14

    mul-int v30, v30, v28

    add-int v17, v17, v30

    .line 454
    .end local v28    # "weight":I
    :cond_a
    aget v30, v18, v14

    add-int v20, v20, v30

    .line 449
    add-int/lit8 v14, v14, -0x1

    goto/16 :goto_3

    .line 459
    .restart local v7    # "evenChecksumPortion":I
    .restart local v10    # "evenSum":I
    :cond_b
    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v30

    if-eqz v30, :cond_c

    .line 460
    sget-object v30, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v30, v30, v29

    mul-int/lit8 v31, v14, 0x2

    add-int/lit8 v31, v31, 0x1

    aget v28, v30, v31

    .line 461
    .restart local v28    # "weight":I
    aget v30, v8, v14

    mul-int v30, v30, v28

    add-int v7, v7, v30

    .line 463
    .end local v28    # "weight":I
    :cond_c
    aget v30, v8, v14

    add-int v10, v10, v30

    .line 458
    add-int/lit8 v14, v14, -0x1

    goto/16 :goto_4

    .line 471
    .restart local v3    # "checksumPortion":I
    :cond_d
    rsub-int/lit8 v30, v20, 0xd

    div-int/lit8 v13, v30, 0x2

    .line 472
    .local v13, "group":I
    sget-object v30, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    aget v21, v30, v13

    .line 473
    .local v21, "oddWidest":I
    rsub-int/lit8 v11, v21, 0x9

    .line 474
    .local v11, "evenWidest":I
    const/16 v30, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v21

    move/from16 v2, v30

    invoke-static {v0, v1, v2}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v26

    .line 475
    .local v26, "vOdd":I
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-static {v8, v11, v0}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v25

    .line 476
    .local v25, "vEven":I
    sget-object v30, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    aget v23, v30, v13

    .line 477
    .local v23, "tEven":I
    sget-object v30, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    aget v12, v30, v13

    .line 478
    .local v12, "gSum":I
    mul-int v30, v26, v23

    add-int v30, v30, v25

    add-int v27, v30, v12

    .line 480
    .local v27, "value":I
    new-instance v30, Lcom/google/zxing/oned/rss/DataCharacter;

    move-object/from16 v0, v30

    move/from16 v1, v27

    invoke-direct {v0, v1, v3}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v30
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Hashtable;)Lcom/google/zxing/Result;
    .locals 1
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reset()V

    .line 117
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/Vector;

    .line 118
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/Vector;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/Vector;
    .locals 2
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 128
    :cond_0
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-virtual {p0, p2, v1, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/Vector;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    move-result-object v0

    .line 129
    .local v0, "nextPair":Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 131
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->mayBeLast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 132
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 133
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    return-object v1

    .line 135
    :cond_1
    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->mustBeLast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->setSize(I)V

    .line 123
    return-void
.end method

.method retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/Vector;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .locals 11
    .param p1, "row"    # Lcom/google/zxing/common/BitArray;
    .param p2, "previousPairs"    # Ljava/util/Vector;
    .param p3, "rowNumber"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 202
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v10

    rem-int/lit8 v10, v10, 0x2

    if-nez v10, :cond_1

    move v1, v8

    .line 206
    .local v1, "isOddPattern":Z
    :goto_0
    const/4 v2, 0x1

    .line 207
    .local v2, "keepFinding":Z
    const/4 v0, -0x1

    .line 209
    .local v0, "forcedOffset":I
    :cond_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/Vector;I)V

    .line 210
    invoke-direct {p0, p1, p3, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v6

    .line 211
    .local v6, "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    if-nez v6, :cond_2

    .line 212
    iget-object v10, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v10, v10, v9

    invoke-static {p1, v10}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I

    move-result v0

    .line 208
    :goto_1
    if-nez v2, :cond_0

    .line 218
    invoke-direct {p0, p2, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkPairSequence(Ljava/util/Vector;Lcom/google/zxing/oned/rss/FinderPattern;)Z

    move-result v4

    .line 220
    .local v4, "mayBeLast":Z
    invoke-virtual {p0, p1, v6, v1, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v3

    .line 223
    .local v3, "leftChar":Lcom/google/zxing/oned/rss/DataCharacter;
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p0, p1, v6, v1, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 232
    .local v7, "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :goto_2
    new-instance v8, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-direct {v8, v3, v7, v6, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;-><init>(Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/FinderPattern;Z)V

    return-object v8

    .end local v0    # "forcedOffset":I
    .end local v1    # "isOddPattern":Z
    .end local v2    # "keepFinding":Z
    .end local v3    # "leftChar":Lcom/google/zxing/oned/rss/DataCharacter;
    .end local v4    # "mayBeLast":Z
    .end local v6    # "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    .end local v7    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :cond_1
    move v1, v9

    .line 202
    goto :goto_0

    .line 214
    .restart local v0    # "forcedOffset":I
    .restart local v1    # "isOddPattern":Z
    .restart local v2    # "keepFinding":Z
    .restart local v6    # "pattern":Lcom/google/zxing/oned/rss/FinderPattern;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 224
    .restart local v3    # "leftChar":Lcom/google/zxing/oned/rss/DataCharacter;
    .restart local v4    # "mayBeLast":Z
    :catch_0
    move-exception v5

    .line 225
    .local v5, "nfe":Lcom/google/zxing/NotFoundException;
    if-eqz v4, :cond_3

    .line 226
    const/4 v7, 0x0

    .restart local v7    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    goto :goto_2

    .line 228
    .end local v7    # "rightChar":Lcom/google/zxing/oned/rss/DataCharacter;
    :cond_3
    throw v5
.end method
