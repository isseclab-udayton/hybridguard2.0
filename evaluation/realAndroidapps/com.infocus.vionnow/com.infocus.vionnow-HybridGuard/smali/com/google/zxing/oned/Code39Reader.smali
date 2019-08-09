.class public final Lcom/google/zxing/oned/Code39Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code39Reader.java"


# static fields
.field private static final ALPHABET:[C

.field static final ALPHABET_STRING:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

.field private static final ASTERISK_ENCODING:I

.field static final CHARACTER_ENCODINGS:[I


# instance fields
.field private final extendedMode:Z

.field private final usingCheckDigit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 38
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    .line 45
    const/16 v0, 0x2c

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    .line 53
    sget-object v0, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    const/16 v1, 0x27

    aget v0, v0, v1

    sput v0, Lcom/google/zxing/oned/Code39Reader;->ASTERISK_ENCODING:I

    .line 35
    return-void

    .line 45
    :array_0
    .array-data 4
        0x34
        0x121
        0x61
        0x160
        0x31
        0x130
        0x70
        0x25
        0x124
        0x64
        0x109
        0x49
        0x148
        0x19
        0x118
        0x58
        0xd
        0x10c
        0x4c
        0x1c
        0x103
        0x43
        0x142
        0x13
        0x112
        0x52
        0x7
        0x106
        0x46
        0x16
        0x181
        0xc1
        0x1c0
        0x91
        0x190
        0xd0
        0x85
        0x184
        0xc4
        0x94
        0xa8
        0xa2
        0x8a
        0x2a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 63
    iput-boolean v0, p0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    .line 64
    iput-boolean v0, p0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    .line 65
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "usingCheckDigit"    # Z

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 75
    iput-boolean p1, p0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    .line 77
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0
    .param p1, "usingCheckDigit"    # Z
    .param p2, "extendedMode"    # Z

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    .line 90
    iput-boolean p1, p0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    .line 91
    iput-boolean p2, p0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    .line 92
    return-void
.end method

.method private static decodeExtended(Ljava/lang/StringBuffer;)Ljava/lang/String;
    .locals 9
    .param p0, "encoded"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x5a

    const/16 v7, 0x41

    .line 278
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    .line 279
    .local v4, "length":I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 280
    .local v1, "decoded":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 330
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 281
    :cond_0
    invoke-virtual {p0, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v0

    .line 282
    .local v0, "c":C
    const/16 v6, 0x2b

    if-eq v0, v6, :cond_1

    const/16 v6, 0x24

    if-eq v0, v6, :cond_1

    const/16 v6, 0x25

    if-eq v0, v6, :cond_1

    const/16 v6, 0x2f

    if-ne v0, v6, :cond_8

    .line 283
    :cond_1
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v5

    .line 284
    .local v5, "next":C
    const/4 v2, 0x0

    .line 285
    .local v2, "decodedChar":C
    sparse-switch v0, :sswitch_data_0

    .line 323
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 325
    add-int/lit8 v3, v3, 0x1

    .line 280
    .end local v2    # "decodedChar":C
    .end local v5    # "next":C
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 288
    .restart local v2    # "decodedChar":C
    .restart local v5    # "next":C
    :sswitch_0
    if-lt v5, v7, :cond_2

    if-gt v5, v8, :cond_2

    .line 289
    add-int/lit8 v6, v5, 0x20

    int-to-char v2, v6

    goto :goto_1

    .line 291
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 296
    :sswitch_1
    if-lt v5, v7, :cond_3

    if-gt v5, v8, :cond_3

    .line 297
    add-int/lit8 v6, v5, -0x40

    int-to-char v2, v6

    goto :goto_1

    .line 299
    :cond_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 304
    :sswitch_2
    if-lt v5, v7, :cond_4

    const/16 v6, 0x45

    if-gt v5, v6, :cond_4

    .line 305
    add-int/lit8 v6, v5, -0x26

    int-to-char v2, v6

    goto :goto_1

    .line 306
    :cond_4
    const/16 v6, 0x46

    if-lt v5, v6, :cond_5

    const/16 v6, 0x57

    if-gt v5, v6, :cond_5

    .line 307
    add-int/lit8 v6, v5, -0xb

    int-to-char v2, v6

    goto :goto_1

    .line 309
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 314
    :sswitch_3
    if-lt v5, v7, :cond_6

    const/16 v6, 0x4f

    if-gt v5, v6, :cond_6

    .line 315
    add-int/lit8 v6, v5, -0x20

    int-to-char v2, v6

    goto :goto_1

    .line 316
    :cond_6
    if-ne v5, v8, :cond_7

    .line 317
    const/16 v2, 0x3a

    goto :goto_1

    .line 319
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 327
    .end local v2    # "decodedChar":C
    .end local v5    # "next":C
    :cond_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 285
    :sswitch_data_0
    .sparse-switch
        0x24 -> :sswitch_1
        0x25 -> :sswitch_2
        0x2b -> :sswitch_0
        0x2f -> :sswitch_3
    .end sparse-switch
.end method

.method private static findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I
    .locals 14
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 178
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    .line 179
    .local v8, "width":I
    const/4 v7, 0x0

    .line 180
    .local v7, "rowOffset":I
    :goto_0
    if-lt v7, v8, :cond_1

    .line 187
    :cond_0
    const/4 v0, 0x0

    .line 188
    .local v0, "counterPosition":I
    const/16 v12, 0x9

    new-array v1, v12, [I

    .line 189
    .local v1, "counters":[I
    move v5, v7

    .line 190
    .local v5, "patternStart":I
    const/4 v3, 0x0

    .line 191
    .local v3, "isWhite":Z
    array-length v4, v1

    .line 193
    .local v4, "patternLength":I
    move v2, v7

    .local v2, "i":I
    :goto_1
    if-lt v2, v8, :cond_2

    .line 219
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v10

    throw v10

    .line 181
    .end local v0    # "counterPosition":I
    .end local v1    # "counters":[I
    .end local v2    # "i":I
    .end local v3    # "isWhite":Z
    .end local v4    # "patternLength":I
    .end local v5    # "patternStart":I
    :cond_1
    invoke-virtual {p0, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v12

    if-nez v12, :cond_0

    .line 184
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 194
    .restart local v0    # "counterPosition":I
    .restart local v1    # "counters":[I
    .restart local v2    # "i":I
    .restart local v3    # "isWhite":Z
    .restart local v4    # "patternLength":I
    .restart local v5    # "patternStart":I
    :cond_2
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    .line 195
    .local v6, "pixel":Z
    xor-int v12, v6, v3

    if-eqz v12, :cond_3

    .line 196
    aget v12, v1, v0

    add-int/lit8 v12, v12, 0x1

    aput v12, v1, v0

    .line 193
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 198
    :cond_3
    add-int/lit8 v12, v4, -0x1

    if-ne v0, v12, :cond_6

    .line 199
    invoke-static {v1}, Lcom/google/zxing/oned/Code39Reader;->toNarrowWidePattern([I)I

    move-result v12

    sget v13, Lcom/google/zxing/oned/Code39Reader;->ASTERISK_ENCODING:I

    if-ne v12, v13, :cond_4

    .line 201
    sub-int v12, v2, v5

    div-int/lit8 v12, v12, 0x2

    sub-int v12, v5, v12

    invoke-static {v10, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {p0, v12, v5, v10}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 202
    const/4 v12, 0x2

    new-array v12, v12, [I

    aput v5, v12, v10

    aput v2, v12, v11

    return-object v12

    .line 205
    :cond_4
    aget v12, v1, v10

    aget v13, v1, v11

    add-int/2addr v12, v13

    add-int/2addr v5, v12

    .line 206
    const/4 v9, 0x2

    .local v9, "y":I
    :goto_3
    if-lt v9, v4, :cond_5

    .line 209
    add-int/lit8 v12, v4, -0x2

    aput v10, v1, v12

    .line 210
    add-int/lit8 v12, v4, -0x1

    aput v10, v1, v12

    .line 211
    add-int/lit8 v0, v0, -0x1

    .line 215
    .end local v9    # "y":I
    :goto_4
    aput v11, v1, v0

    .line 216
    if-eqz v3, :cond_7

    move v3, v10

    :goto_5
    goto :goto_2

    .line 207
    .restart local v9    # "y":I
    :cond_5
    add-int/lit8 v12, v9, -0x2

    aget v13, v1, v9

    aput v13, v1, v12

    .line 206
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 213
    .end local v9    # "y":I
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_7
    move v3, v11

    .line 216
    goto :goto_5
.end method

.method private static patternToChar(I)C
    .locals 2
    .param p0, "pattern"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 274
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 270
    :cond_0
    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_1

    .line 271
    sget-object v1, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    aget-char v1, v1, v0

    return v1

    .line 269
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static toNarrowWidePattern([I)I
    .locals 12
    .param p0, "counters"    # [I

    .prologue
    const/4 v11, 0x3

    const/4 v8, -0x1

    .line 225
    array-length v4, p0

    .line 226
    .local v4, "numCounters":I
    const/4 v2, 0x0

    .line 229
    .local v2, "maxNarrowCounter":I
    :cond_0
    const v3, 0x7fffffff

    .line 230
    .local v3, "minCounter":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v4, :cond_2

    .line 236
    move v2, v3

    .line 237
    const/4 v7, 0x0

    .line 238
    .local v7, "wideCounters":I
    const/4 v6, 0x0

    .line 239
    .local v6, "totalWideCountersWidth":I
    const/4 v5, 0x0

    .line 240
    .local v5, "pattern":I
    const/4 v1, 0x0

    :goto_1
    if-lt v1, v4, :cond_4

    .line 248
    if-ne v7, v11, :cond_8

    .line 252
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v4, :cond_1

    if-gtz v7, :cond_6

    .line 265
    .end local v5    # "pattern":I
    :cond_1
    :goto_3
    return v5

    .line 231
    .end local v6    # "totalWideCountersWidth":I
    .end local v7    # "wideCounters":I
    :cond_2
    aget v0, p0, v1

    .line 232
    .local v0, "counter":I
    if-ge v0, v3, :cond_3

    if-le v0, v2, :cond_3

    .line 233
    move v3, v0

    .line 230
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 241
    .end local v0    # "counter":I
    .restart local v5    # "pattern":I
    .restart local v6    # "totalWideCountersWidth":I
    .restart local v7    # "wideCounters":I
    :cond_4
    aget v0, p0, v1

    .line 242
    .restart local v0    # "counter":I
    aget v9, p0, v1

    if-le v9, v2, :cond_5

    .line 243
    const/4 v9, 0x1

    add-int/lit8 v10, v4, -0x1

    sub-int/2addr v10, v1

    shl-int/2addr v9, v10

    or-int/2addr v5, v9

    .line 244
    add-int/lit8 v7, v7, 0x1

    .line 245
    add-int/2addr v6, v0

    .line 240
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 253
    .end local v0    # "counter":I
    :cond_6
    aget v0, p0, v1

    .line 254
    .restart local v0    # "counter":I
    aget v9, p0, v1

    if-le v9, v2, :cond_7

    .line 255
    add-int/lit8 v7, v7, -0x1

    .line 257
    shl-int/lit8 v9, v0, 0x1

    if-lt v9, v6, :cond_7

    move v5, v8

    .line 258
    goto :goto_3

    .line 252
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 264
    .end local v0    # "counter":I
    :cond_8
    if-gt v7, v11, :cond_0

    move v5, v8

    .line 265
    goto :goto_3
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Hashtable;)Lcom/google/zxing/Result;
    .locals 26
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .param p3, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-static/range {p2 .. p2}, Lcom/google/zxing/oned/Code39Reader;->findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v17

    .line 98
    .local v17, "start":[I
    const/16 v20, 0x1

    aget v12, v17, v20

    .line 99
    .local v12, "nextStart":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    .line 102
    .local v6, "end":I
    :goto_0
    if-ge v12, v6, :cond_0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 106
    :cond_0
    new-instance v14, Ljava/lang/StringBuffer;

    const/16 v20, 0x14

    move/from16 v0, v20

    invoke-direct {v14, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 107
    .local v14, "result":Ljava/lang/StringBuffer;
    const/16 v20, 0x9

    move/from16 v0, v20

    new-array v4, v0, [I

    .line 111
    .local v4, "counters":[I
    :cond_1
    move-object/from16 v0, p2

    invoke-static {v0, v12, v4}, Lcom/google/zxing/oned/Code39Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 112
    invoke-static {v4}, Lcom/google/zxing/oned/Code39Reader;->toNarrowWidePattern([I)I

    move-result v13

    .line 113
    .local v13, "pattern":I
    if-gez v13, :cond_3

    .line 114
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v20

    throw v20

    .line 103
    .end local v4    # "counters":[I
    .end local v13    # "pattern":I
    .end local v14    # "result":Ljava/lang/StringBuffer;
    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 116
    .restart local v4    # "counters":[I
    .restart local v13    # "pattern":I
    .restart local v14    # "result":Ljava/lang/StringBuffer;
    :cond_3
    invoke-static {v13}, Lcom/google/zxing/oned/Code39Reader;->patternToChar(I)C

    move-result v5

    .line 117
    .local v5, "decodedChar":C
    invoke-virtual {v14, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 118
    move v9, v12

    .line 119
    .local v9, "lastStart":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v20

    if-lt v7, v0, :cond_5

    .line 123
    :goto_2
    if-ge v12, v6, :cond_4

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v20

    if-eqz v20, :cond_6

    .line 126
    :cond_4
    const/16 v20, 0x2a

    move/from16 v0, v20

    if-ne v5, v0, :cond_1

    .line 127
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->length()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 130
    const/4 v8, 0x0

    .line 131
    .local v8, "lastPatternSize":I
    const/4 v7, 0x0

    :goto_3
    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v20

    if-lt v7, v0, :cond_7

    .line 134
    sub-int v20, v12, v9

    sub-int v19, v20, v8

    .line 137
    .local v19, "whiteSpaceAfterEnd":I
    if-eq v12, v6, :cond_8

    div-int/lit8 v20, v19, 0x2

    move/from16 v0, v20

    if-ge v0, v8, :cond_8

    .line 138
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v20

    throw v20

    .line 120
    .end local v8    # "lastPatternSize":I
    .end local v19    # "whiteSpaceAfterEnd":I
    :cond_5
    aget v20, v4, v7

    add-int v12, v12, v20

    .line 119
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 124
    :cond_6
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 132
    .restart local v8    # "lastPatternSize":I
    :cond_7
    aget v20, v4, v7

    add-int v8, v8, v20

    .line 131
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 141
    .restart local v19    # "whiteSpaceAfterEnd":I
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/zxing/oned/Code39Reader;->usingCheckDigit:Z

    move/from16 v20, v0

    if-eqz v20, :cond_b

    .line 142
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->length()I

    move-result v20

    add-int/lit8 v11, v20, -0x1

    .line 143
    .local v11, "max":I
    const/16 v18, 0x0

    .line 144
    .local v18, "total":I
    const/4 v7, 0x0

    :goto_4
    if-lt v7, v11, :cond_9

    .line 147
    invoke-virtual {v14, v11}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v20

    sget-object v21, Lcom/google/zxing/oned/Code39Reader;->ALPHABET:[C

    rem-int/lit8 v22, v18, 0x2b

    aget-char v21, v21, v22

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_a

    .line 148
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v20

    throw v20

    .line 145
    :cond_9
    const-string v20, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->indexOf(I)I

    move-result v20

    add-int v18, v18, v20

    .line 144
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 150
    :cond_a
    invoke-virtual {v14, v11}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 153
    .end local v11    # "max":I
    .end local v18    # "total":I
    :cond_b
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->length()I

    move-result v20

    if-nez v20, :cond_c

    .line 155
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v20

    throw v20

    .line 159
    :cond_c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/zxing/oned/Code39Reader;->extendedMode:Z

    move/from16 v20, v0

    if-eqz v20, :cond_d

    .line 160
    invoke-static {v14}, Lcom/google/zxing/oned/Code39Reader;->decodeExtended(Ljava/lang/StringBuffer;)Ljava/lang/String;

    move-result-object v15

    .line 165
    .local v15, "resultString":Ljava/lang/String;
    :goto_5
    const/16 v20, 0x1

    aget v20, v17, v20

    const/16 v21, 0x0

    aget v21, v17, v21

    add-int v20, v20, v21

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v10, v20, v21

    .line 166
    .local v10, "left":F
    add-int v20, v12, v9

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v16, v20, v21

    .line 167
    .local v16, "right":F
    new-instance v20, Lcom/google/zxing/Result;

    .line 169
    const/16 v21, 0x0

    .line 170
    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    .line 171
    new-instance v24, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v25, v0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-direct {v0, v10, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v24, v22, v23

    const/16 v23, 0x1

    .line 172
    new-instance v24, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v25, v0

    move-object/from16 v0, v24

    move/from16 v1, v16

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v24, v22, v23

    .line 173
    sget-object v23, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    .line 167
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v15, v1, v2, v3}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v20

    .line 162
    .end local v10    # "left":F
    .end local v15    # "resultString":Ljava/lang/String;
    .end local v16    # "right":F
    :cond_d
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .restart local v15    # "resultString":Ljava/lang/String;
    goto :goto_5
.end method
