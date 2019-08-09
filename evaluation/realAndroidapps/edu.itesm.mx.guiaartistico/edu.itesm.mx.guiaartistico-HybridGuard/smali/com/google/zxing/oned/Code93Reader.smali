.class public final Lcom/google/zxing/oned/Code93Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code93Reader.java"


# static fields
.field private static final ALPHABET:[C

.field private static final ALPHABET_STRING:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

.field private static final ASTERISK_ENCODING:I

.field private static final CHARACTER_ENCODINGS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    .line 46
    const/16 v0, 0x30

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    .line 54
    sget-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    const/16 v1, 0x2f

    aget v0, v0, v1

    sput v0, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    return-void

    .line 46
    :array_0
    .array-data 4
        0x114
        0x148
        0x144
        0x142
        0x128
        0x124
        0x122
        0x150
        0x112
        0x10a
        0x1a8
        0x1a4
        0x1a2
        0x194
        0x192
        0x18a
        0x168
        0x164
        0x162
        0x134
        0x11a
        0x158
        0x14c
        0x146
        0x12c
        0x116
        0x1b4
        0x1b2
        0x1ac
        0x1a6
        0x196
        0x19a
        0x16c
        0x166
        0x136
        0x13a
        0x12e
        0x1d4
        0x1d2
        0x1ca
        0x16e
        0x176
        0x1ae
        0x126
        0x1da
        0x1d6
        0x132
        0x15e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    return-void
.end method

.method private static checkChecksums(Ljava/lang/CharSequence;)V
    .locals 3
    .param p0, "result"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 243
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 244
    .local v0, "length":I
    add-int/lit8 v1, v0, -0x2

    const/16 v2, 0x14

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    .line 245
    add-int/lit8 v1, v0, -0x1

    const/16 v2, 0xf

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    .line 246
    return-void
.end method

.method private static checkOneChecksum(Ljava/lang/CharSequence;II)V
    .locals 6
    .param p0, "result"    # Ljava/lang/CharSequence;
    .param p1, "checkPosition"    # I
    .param p2, "weightMax"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 250
    const/4 v2, 0x1

    .line 251
    .local v2, "weight":I
    const/4 v1, 0x0

    .line 252
    .local v1, "total":I
    add-int/lit8 v0, p1, -0x1

    .local v0, "i":I
    :goto_0
    if-gez v0, :cond_0

    .line 258
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    sget-object v4, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    rem-int/lit8 v5, v1, 0x2f

    aget-char v4, v4, v5

    if-eq v3, v4, :cond_2

    .line 259
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v3

    throw v3

    .line 253
    :cond_0
    const-string v3, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    mul-int/2addr v3, v2

    add-int/2addr v1, v3

    .line 254
    add-int/lit8 v2, v2, 0x1

    if-le v2, p2, :cond_1

    .line 255
    const/4 v2, 0x1

    .line 252
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 261
    :cond_2
    return-void
.end method

.method private static decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 9
    .param p0, "encoded"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x5a

    const/16 v7, 0x41

    .line 184
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 185
    .local v4, "length":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 186
    .local v1, "decoded":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 239
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 187
    :cond_0
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 188
    .local v0, "c":C
    const/16 v6, 0x61

    if-lt v0, v6, :cond_8

    const/16 v6, 0x64

    if-gt v0, v6, :cond_8

    .line 189
    add-int/lit8 v6, v4, -0x1

    if-lt v3, v6, :cond_1

    .line 190
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 192
    :cond_1
    add-int/lit8 v6, v3, 0x1

    invoke-interface {p0, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    .line 193
    .local v5, "next":C
    const/4 v2, 0x0

    .line 194
    .local v2, "decodedChar":C
    packed-switch v0, :pswitch_data_0

    .line 232
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 234
    add-int/lit8 v3, v3, 0x1

    .line 186
    .end local v2    # "decodedChar":C
    .end local v5    # "next":C
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 197
    .restart local v2    # "decodedChar":C
    .restart local v5    # "next":C
    :pswitch_0
    if-lt v5, v7, :cond_2

    if-gt v5, v8, :cond_2

    .line 198
    add-int/lit8 v6, v5, 0x20

    int-to-char v2, v6

    .line 199
    goto :goto_1

    .line 200
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 205
    :pswitch_1
    if-lt v5, v7, :cond_3

    if-gt v5, v8, :cond_3

    .line 206
    add-int/lit8 v6, v5, -0x40

    int-to-char v2, v6

    .line 207
    goto :goto_1

    .line 208
    :cond_3
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 213
    :pswitch_2
    if-lt v5, v7, :cond_4

    const/16 v6, 0x45

    if-gt v5, v6, :cond_4

    .line 214
    add-int/lit8 v6, v5, -0x26

    int-to-char v2, v6

    .line 215
    goto :goto_1

    :cond_4
    const/16 v6, 0x46

    if-lt v5, v6, :cond_5

    const/16 v6, 0x57

    if-gt v5, v6, :cond_5

    .line 216
    add-int/lit8 v6, v5, -0xb

    int-to-char v2, v6

    .line 217
    goto :goto_1

    .line 218
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 223
    :pswitch_3
    if-lt v5, v7, :cond_6

    const/16 v6, 0x4f

    if-gt v5, v6, :cond_6

    .line 224
    add-int/lit8 v6, v5, -0x20

    int-to-char v2, v6

    .line 225
    goto :goto_1

    :cond_6
    if-ne v5, v8, :cond_7

    .line 226
    const/16 v2, 0x3a

    .line 227
    goto :goto_1

    .line 228
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    .line 236
    .end local v2    # "decodedChar":C
    .end local v5    # "next":C
    :cond_8
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 194
    nop

    :pswitch_data_0
    .packed-switch 0x61
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method private static findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I
    .locals 13
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 115
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    .line 116
    .local v7, "width":I
    invoke-virtual {p0, v8}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v6

    .line 118
    .local v6, "rowOffset":I
    const/4 v0, 0x0

    .line 119
    .local v0, "counterPosition":I
    const/4 v10, 0x6

    new-array v1, v10, [I

    .line 120
    .local v1, "counters":[I
    move v5, v6

    .line 121
    .local v5, "patternStart":I
    const/4 v3, 0x0

    .line 122
    .local v3, "isWhite":Z
    array-length v4, v1

    .line 124
    .local v4, "patternLength":I
    move v2, v6

    .local v2, "i":I
    :goto_0
    if-lt v2, v7, :cond_0

    .line 144
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v8

    throw v8

    .line 125
    :cond_0
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    xor-int/2addr v10, v3

    if-eqz v10, :cond_1

    .line 126
    aget v10, v1, v0

    add-int/lit8 v10, v10, 0x1

    aput v10, v1, v0

    .line 124
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 128
    :cond_1
    add-int/lit8 v10, v4, -0x1

    if-ne v0, v10, :cond_3

    .line 129
    invoke-static {v1}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v10

    sget v11, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    if-ne v10, v11, :cond_2

    .line 130
    new-array v10, v12, [I

    aput v5, v10, v8

    aput v2, v10, v9

    return-object v10

    .line 132
    :cond_2
    aget v10, v1, v8

    aget v11, v1, v9

    add-int/2addr v10, v11

    add-int/2addr v5, v10

    .line 133
    add-int/lit8 v10, v4, -0x2

    invoke-static {v1, v12, v1, v8, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 134
    add-int/lit8 v10, v4, -0x2

    aput v8, v1, v10

    .line 135
    add-int/lit8 v10, v4, -0x1

    aput v8, v1, v10

    .line 136
    add-int/lit8 v0, v0, -0x1

    .line 140
    :goto_2
    aput v9, v1, v0

    .line 141
    if-eqz v3, :cond_4

    move v3, v8

    :goto_3
    goto :goto_1

    .line 138
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    move v3, v9

    .line 141
    goto :goto_3
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
    .line 175
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 180
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 176
    :cond_0
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_1

    .line 177
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    aget-char v1, v1, v0

    return v1

    .line 175
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static toPattern([I)I
    .locals 10
    .param p0, "counters"    # [I

    .prologue
    .line 148
    array-length v3, p0

    .line 149
    .local v3, "max":I
    const/4 v7, 0x0

    .line 150
    .local v7, "sum":I
    array-length v9, p0

    const/4 v8, 0x0

    :goto_0
    if-lt v8, v9, :cond_0

    .line 153
    const/4 v4, 0x0

    .line 154
    .local v4, "pattern":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-lt v1, v3, :cond_1

    .line 171
    .end local v4    # "pattern":I
    :goto_2
    return v4

    .line 150
    .end local v1    # "i":I
    :cond_0
    aget v0, p0, v8

    .line 151
    .local v0, "counter":I
    add-int/2addr v7, v0

    .line 150
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 155
    .end local v0    # "counter":I
    .restart local v1    # "i":I
    .restart local v4    # "pattern":I
    :cond_1
    aget v8, p0, v1

    shl-int/lit8 v8, v8, 0x8

    mul-int/lit8 v8, v8, 0x9

    div-int v5, v8, v7

    .line 156
    .local v5, "scaledShifted":I
    shr-int/lit8 v6, v5, 0x8

    .line 157
    .local v6, "scaledUnshifted":I
    and-int/lit16 v8, v5, 0xff

    const/16 v9, 0x7f

    if-le v8, v9, :cond_2

    .line 158
    add-int/lit8 v6, v6, 0x1

    .line 160
    :cond_2
    const/4 v8, 0x1

    if-lt v6, v8, :cond_3

    const/4 v8, 0x4

    if-le v6, v8, :cond_4

    .line 161
    :cond_3
    const/4 v4, -0x1

    goto :goto_2

    .line 163
    :cond_4
    and-int/lit8 v8, v1, 0x1

    if-nez v8, :cond_6

    .line 164
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_3
    if-lt v2, v6, :cond_5

    .line 154
    .end local v2    # "j":I
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 165
    .restart local v2    # "j":I
    :cond_5
    shl-int/lit8 v8, v4, 0x1

    or-int/lit8 v4, v8, 0x1

    .line 164
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 168
    .end local v2    # "j":I
    :cond_6
    shl-int/2addr v4, v6

    goto :goto_4
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 20
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 60
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-static/range {p2 .. p2}, Lcom/google/zxing/oned/Code93Reader;->findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v13

    .line 62
    .local v13, "start":[I
    const/4 v14, 0x1

    aget v14, v13, v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v8

    .line 63
    .local v8, "nextStart":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    .line 65
    .local v5, "end":I
    new-instance v10, Ljava/lang/StringBuilder;

    const/16 v14, 0x14

    invoke-direct {v10, v14}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 66
    .local v10, "result":Ljava/lang/StringBuilder;
    const/4 v14, 0x6

    new-array v3, v14, [I

    .line 70
    .local v3, "counters":[I
    :cond_0
    move-object/from16 v0, p2

    invoke-static {v0, v8, v3}, Lcom/google/zxing/oned/Code93Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 71
    invoke-static {v3}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v9

    .line 72
    .local v9, "pattern":I
    if-gez v9, :cond_1

    .line 73
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v14

    throw v14

    .line 75
    :cond_1
    invoke-static {v9}, Lcom/google/zxing/oned/Code93Reader;->patternToChar(I)C

    move-result v4

    .line 76
    .local v4, "decodedChar":C
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 77
    move v6, v8

    .line 78
    .local v6, "lastStart":I
    array-length v15, v3

    const/4 v14, 0x0

    :goto_0
    if-lt v14, v15, :cond_3

    .line 82
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v8

    .line 83
    const/16 v14, 0x2a

    if-ne v4, v14, :cond_0

    .line 84
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 87
    if-eq v8, v5, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v14

    if-nez v14, :cond_4

    .line 88
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v14

    throw v14

    .line 78
    :cond_3
    aget v2, v3, v14

    .line 79
    .local v2, "counter":I
    add-int/2addr v8, v2

    .line 78
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 91
    .end local v2    # "counter":I
    :cond_4
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v14

    const/4 v15, 0x2

    if-ge v14, v15, :cond_5

    .line 93
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v14

    throw v14

    .line 96
    :cond_5
    invoke-static {v10}, Lcom/google/zxing/oned/Code93Reader;->checkChecksums(Ljava/lang/CharSequence;)V

    .line 98
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x2

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 100
    invoke-static {v10}, Lcom/google/zxing/oned/Code93Reader;->decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    .line 102
    .local v11, "resultString":Ljava/lang/String;
    const/4 v14, 0x1

    aget v14, v13, v14

    const/4 v15, 0x0

    aget v15, v13, v15

    add-int/2addr v14, v15

    int-to-float v14, v14

    const/high16 v15, 0x40000000    # 2.0f

    div-float v7, v14, v15

    .line 103
    .local v7, "left":F
    add-int v14, v8, v6

    int-to-float v14, v14

    const/high16 v15, 0x40000000    # 2.0f

    div-float v12, v14, v15

    .line 104
    .local v12, "right":F
    new-instance v14, Lcom/google/zxing/Result;

    .line 106
    const/4 v15, 0x0

    .line 107
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    .line 108
    new-instance v18, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v0, v7, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v18, v16, v17

    const/16 v17, 0x1

    .line 109
    new-instance v18, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v0, v12, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v18, v16, v17

    .line 110
    sget-object v17, Lcom/google/zxing/BarcodeFormat;->CODE_93:Lcom/google/zxing/BarcodeFormat;

    .line 104
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v14, v11, v15, v0, v1}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v14
.end method
