.class final Lcom/google/zxing/client/result/VCardResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "VCardResultParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    .line 34
    return-void
.end method

.method private static decodeQuotedPrintable(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 200
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 201
    .local v4, "length":I
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 202
    .local v7, "result":Ljava/lang/StringBuffer;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 203
    .local v2, "fragmentBuffer":Ljava/io/ByteArrayOutputStream;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 231
    invoke-static {v2, p1, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 232
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 204
    :cond_0
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 205
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 227
    invoke-static {v2, p1, v7}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 228
    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 203
    :cond_1
    :goto_1
    :sswitch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 210
    :sswitch_1
    add-int/lit8 v8, v4, -0x2

    if-ge v3, v8, :cond_1

    .line 211
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 212
    .local v5, "nextChar":C
    const/16 v8, 0xd

    if-eq v5, v8, :cond_1

    const/16 v8, 0xa

    if-eq v5, v8, :cond_1

    .line 215
    add-int/lit8 v8, v3, 0x2

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 217
    .local v6, "nextNextChar":C
    :try_start_0
    invoke-static {v5}, Lcom/google/zxing/client/result/VCardResultParser;->toHexValue(C)I

    move-result v8

    mul-int/lit8 v8, v8, 0x10

    invoke-static {v6}, Lcom/google/zxing/client/result/VCardResultParser;->toHexValue(C)I

    move-result v9

    add-int v1, v8, v9

    .line 218
    .local v1, "encodedByte":I
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v1    # "encodedByte":I
    :goto_2
    add-int/lit8 v3, v3, 0x2

    .line 225
    goto :goto_1

    .line 219
    :catch_0
    move-exception v8

    goto :goto_2

    .line 205
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x3d -> :sswitch_1
    .end sparse-switch
.end method

.method private static formatAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "address"    # Ljava/lang/String;

    .prologue
    .line 292
    if-nez p0, :cond_0

    .line 293
    const/4 v4, 0x0

    .line 305
    :goto_0
    return-object v4

    .line 295
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 296
    .local v2, "length":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 297
    .local v3, "newAddress":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    if-lt v1, v2, :cond_1

    .line 305
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 298
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 299
    .local v0, "c":C
    const/16 v4, 0x3b

    if-ne v0, v4, :cond_2

    .line 300
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 297
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 302
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method private static formatNames([Ljava/lang/String;)V
    .locals 8
    .param p0, "names"    # [Ljava/lang/String;

    .prologue
    .line 315
    if-eqz p0, :cond_0

    .line 316
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v7, p0

    if-lt v3, v7, :cond_1

    .line 337
    .end local v3    # "i":I
    :cond_0
    return-void

    .line 317
    .restart local v3    # "i":I
    :cond_1
    aget-object v4, p0, v3

    .line 318
    .local v4, "name":Ljava/lang/String;
    const/4 v7, 0x5

    new-array v1, v7, [Ljava/lang/String;

    .line 319
    .local v1, "components":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 321
    .local v6, "start":I
    const/4 v0, 0x0

    .line 322
    .local v0, "componentIndex":I
    :goto_1
    const/16 v7, 0x3b

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .local v2, "end":I
    if-gtz v2, :cond_2

    .line 327
    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v0

    .line 328
    new-instance v5, Ljava/lang/StringBuffer;

    const/16 v7, 0x64

    invoke-direct {v5, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 329
    .local v5, "newName":Ljava/lang/StringBuffer;
    const/4 v7, 0x3

    invoke-static {v1, v7, v5}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V

    .line 330
    const/4 v7, 0x1

    invoke-static {v1, v7, v5}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V

    .line 331
    const/4 v7, 0x2

    invoke-static {v1, v7, v5}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V

    .line 332
    const/4 v7, 0x0

    invoke-static {v1, v7, v5}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V

    .line 333
    const/4 v7, 0x4

    invoke-static {v1, v7, v5}, Lcom/google/zxing/client/result/VCardResultParser;->maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V

    .line 334
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    aput-object v7, p0, v3

    .line 316
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 323
    .end local v5    # "newName":Ljava/lang/StringBuffer;
    :cond_2
    invoke-virtual {v4, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v0

    .line 324
    add-int/lit8 v0, v0, 0x1

    .line 325
    add-int/lit8 v6, v2, 0x1

    goto :goto_1
.end method

.method private static isLikeVCardDate(Ljava/lang/String;)Z
    .locals 7
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 273
    if-nez p0, :cond_1

    .line 288
    :cond_0
    :goto_0
    return v0

    .line 278
    :cond_1
    invoke-static {p0, v6}, Lcom/google/zxing/client/result/VCardResultParser;->isStringOfDigits(Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 283
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_2

    .line 284
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_2

    .line 285
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_2

    .line 286
    invoke-static {p0, v1, v5}, Lcom/google/zxing/client/result/VCardResultParser;->isSubstringOfDigits(Ljava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 287
    const/4 v2, 0x5

    invoke-static {p0, v2, v4}, Lcom/google/zxing/client/result/VCardResultParser;->isSubstringOfDigits(Ljava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 288
    invoke-static {p0, v6, v4}, Lcom/google/zxing/client/result/VCardResultParser;->isSubstringOfDigits(Ljava/lang/String;II)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    move v0, v1

    .line 282
    goto :goto_0
.end method

.method static matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z

    .prologue
    .line 268
    invoke-static {p0, p1, p2}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, "values":[Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    goto :goto_0
.end method

.method private static matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 17
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "trim"    # Z

    .prologue
    .line 71
    const/4 v8, 0x0

    .line 72
    .local v8, "matches":Ljava/util/Vector;
    const/4 v4, 0x0

    .line 73
    .local v4, "i":I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v9

    .line 75
    .local v9, "max":I
    :cond_0
    :goto_0
    if-lt v4, v9, :cond_3

    .line 169
    :cond_1
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/util/Vector;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_18

    .line 170
    :cond_2
    const/4 v15, 0x0

    .line 172
    :goto_1
    return-object v15

    .line 77
    :cond_3
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 78
    if-ltz v4, :cond_1

    .line 82
    if-lez v4, :cond_4

    add-int/lit8 v15, v4, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0xa

    move/from16 v0, v16

    if-eq v15, v0, :cond_4

    .line 84
    add-int/lit8 v4, v4, 0x1

    .line 85
    goto :goto_0

    .line 87
    :cond_4
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v4, v15

    .line 88
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3a

    move/from16 v0, v16

    if-eq v15, v0, :cond_5

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3b

    move/from16 v0, v16

    if-ne v15, v0, :cond_0

    .line 92
    :cond_5
    move v11, v4

    .line 93
    .local v11, "metadataStart":I
    :goto_2
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3a

    move/from16 v0, v16

    if-ne v15, v0, :cond_8

    .line 97
    const/4 v12, 0x0

    .line 98
    .local v12, "quotedPrintable":Z
    const/4 v13, 0x0

    .line 99
    .local v13, "quotedPrintableCharset":Ljava/lang/String;
    if-le v4, v11, :cond_6

    .line 101
    add-int/lit8 v5, v11, 0x1

    .line 102
    .local v5, "j":I
    :goto_3
    if-le v5, v4, :cond_9

    .line 123
    .end local v5    # "j":I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 125
    move v7, v4

    .line 127
    .local v7, "matchStart":I
    :goto_4
    const/16 v15, 0xa

    move-object/from16 v0, p1

    invoke-virtual {v0, v15, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-gez v4, :cond_e

    .line 141
    :cond_7
    if-gez v4, :cond_12

    .line 143
    move v4, v9

    goto :goto_0

    .line 94
    .end local v7    # "matchStart":I
    .end local v12    # "quotedPrintable":Z
    .end local v13    # "quotedPrintableCharset":Ljava/lang/String;
    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 103
    .restart local v5    # "j":I
    .restart local v12    # "quotedPrintable":Z
    .restart local v13    # "quotedPrintableCharset":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3b

    move/from16 v0, v16

    if-eq v15, v0, :cond_a

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3a

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    .line 104
    :cond_a
    add-int/lit8 v15, v11, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 105
    .local v10, "metadata":Ljava/lang/String;
    const/16 v15, 0x3d

    invoke-virtual {v10, v15}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 106
    .local v3, "equals":I
    if-ltz v3, :cond_b

    .line 107
    const/4 v15, 0x0

    invoke-virtual {v10, v15, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 108
    .local v6, "key":Ljava/lang/String;
    add-int/lit8 v15, v3, 0x1

    invoke-virtual {v10, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 109
    .local v14, "value":Ljava/lang/String;
    const-string v15, "ENCODING"

    invoke-virtual {v15, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_d

    .line 110
    const-string v15, "QUOTED-PRINTABLE"

    invoke-virtual {v15, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_b

    .line 111
    const/4 v12, 0x1

    .line 117
    .end local v6    # "key":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_b
    :goto_5
    move v11, v5

    .line 119
    .end local v3    # "equals":I
    .end local v10    # "metadata":Ljava/lang/String;
    :cond_c
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 113
    .restart local v3    # "equals":I
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v10    # "metadata":Ljava/lang/String;
    .restart local v14    # "value":Ljava/lang/String;
    :cond_d
    const-string v15, "CHARSET"

    invoke-virtual {v15, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_b

    .line 114
    move-object v13, v14

    goto :goto_5

    .line 128
    .end local v3    # "equals":I
    .end local v5    # "j":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v10    # "metadata":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    .restart local v7    # "matchStart":I
    :cond_e
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    if-ge v4, v15, :cond_10

    .line 129
    add-int/lit8 v15, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x20

    move/from16 v0, v16

    if-eq v15, v0, :cond_f

    .line 130
    add-int/lit8 v15, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x9

    move/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 131
    :cond_f
    add-int/lit8 v4, v4, 0x2

    goto/16 :goto_4

    .line 132
    :cond_10
    if-eqz v12, :cond_7

    .line 133
    add-int/lit8 v15, v4, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3d

    move/from16 v0, v16

    if-eq v15, v0, :cond_11

    .line 134
    add-int/lit8 v15, v4, -0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0x3d

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 135
    :cond_11
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_4

    .line 144
    :cond_12
    if-le v4, v7, :cond_17

    .line 146
    if-nez v8, :cond_13

    .line 147
    new-instance v8, Ljava/util/Vector;

    .end local v8    # "matches":Ljava/util/Vector;
    const/4 v15, 0x1

    invoke-direct {v8, v15}, Ljava/util/Vector;-><init>(I)V

    .line 149
    .restart local v8    # "matches":Ljava/util/Vector;
    :cond_13
    add-int/lit8 v15, v4, -0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v16, 0xd

    move/from16 v0, v16

    if-ne v15, v0, :cond_14

    .line 150
    add-int/lit8 v4, v4, -0x1

    .line 152
    :cond_14
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "element":Ljava/lang/String;
    if-eqz p2, :cond_15

    .line 154
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 156
    :cond_15
    if-eqz v12, :cond_16

    .line 157
    invoke-static {v2, v13}, Lcom/google/zxing/client/result/VCardResultParser;->decodeQuotedPrintable(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 161
    :goto_6
    invoke-virtual {v8, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 162
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 159
    :cond_16
    invoke-static {v2}, Lcom/google/zxing/client/result/VCardResultParser;->stripContinuationCRLF(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    .line 164
    .end local v2    # "element":Ljava/lang/String;
    :cond_17
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 172
    .end local v7    # "matchStart":I
    .end local v11    # "metadataStart":I
    .end local v12    # "quotedPrintable":Z
    .end local v13    # "quotedPrintableCharset":Ljava/lang/String;
    :cond_18
    invoke-static {v8}, Lcom/google/zxing/client/result/VCardResultParser;->toStringArray(Ljava/util/Vector;)[Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_1
.end method

.method private static maybeAppendComponent([Ljava/lang/String;ILjava/lang/StringBuffer;)V
    .locals 1
    .param p0, "components"    # [Ljava/lang/String;
    .param p1, "i"    # I
    .param p2, "newName"    # Ljava/lang/StringBuffer;

    .prologue
    .line 340
    aget-object v0, p0, p1

    if-eqz v0, :cond_0

    .line 341
    const/16 v0, 0x20

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 342
    aget-object v0, p0, p1

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 344
    :cond_0
    return-void
.end method

.method private static maybeAppendFragment(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 4
    .param p0, "fragmentBuffer"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/StringBuffer;

    .prologue
    .line 249
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 250
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 252
    .local v2, "fragmentBytes":[B
    if-nez p1, :cond_1

    .line 253
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 262
    .local v1, "fragment":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 263
    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 265
    .end local v1    # "fragment":Ljava/lang/String;
    .end local v2    # "fragmentBytes":[B
    :cond_0
    return-void

    .line 256
    .restart local v2    # "fragmentBytes":[B
    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v1    # "fragment":Ljava/lang/String;
    goto :goto_0

    .line 257
    .end local v1    # "fragment":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .restart local v1    # "fragment":Ljava/lang/String;
    goto :goto_0
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .locals 15
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v2, 0x0

    const/4 v14, 0x1

    .line 40
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v12

    .line 41
    .local v12, "rawText":Ljava/lang/String;
    if-eqz v12, :cond_0

    const-string v0, "BEGIN:VCARD"

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v2

    .line 66
    :goto_0
    return-object v0

    .line 44
    :cond_1
    const-string v0, "FN"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "names":[Ljava/lang/String;
    if-nez v1, :cond_2

    .line 47
    const-string v0, "N"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 48
    invoke-static {v1}, Lcom/google/zxing/client/result/VCardResultParser;->formatNames([Ljava/lang/String;)V

    .line 50
    :cond_2
    const-string v0, "TEL"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "phoneNumbers":[Ljava/lang/String;
    const-string v0, "EMAIL"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v4

    .line 52
    .local v4, "emails":[Ljava/lang/String;
    const-string v0, "NOTE"

    const/4 v13, 0x0

    invoke-static {v0, v12, v13}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 53
    .local v5, "note":Ljava/lang/String;
    const-string v0, "ADR"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v6

    .line 54
    .local v6, "addresses":[Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 55
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    array-length v0, v6

    if-lt v11, v0, :cond_5

    .line 59
    .end local v11    # "i":I
    :cond_3
    const-string v0, "ORG"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 60
    .local v7, "org":Ljava/lang/String;
    const-string v0, "BDAY"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 61
    .local v8, "birthday":Ljava/lang/String;
    invoke-static {v8}, Lcom/google/zxing/client/result/VCardResultParser;->isLikeVCardDate(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 62
    const/4 v8, 0x0

    .line 64
    :cond_4
    const-string v0, "TITLE"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    .line 65
    .local v9, "title":Ljava/lang/String;
    const-string v0, "URL"

    invoke-static {v0, v12, v14}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    .line 66
    .local v10, "url":Ljava/lang/String;
    new-instance v0, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-direct/range {v0 .. v10}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 56
    .end local v7    # "org":Ljava/lang/String;
    .end local v8    # "birthday":Ljava/lang/String;
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/String;
    .restart local v11    # "i":I
    :cond_5
    aget-object v0, v6, v11

    invoke-static {v0}, Lcom/google/zxing/client/result/VCardResultParser;->formatAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v11

    .line 55
    add-int/lit8 v11, v11, 0x1

    goto :goto_1
.end method

.method private static stripContinuationCRLF(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 177
    .local v3, "length":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 178
    .local v4, "result":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 179
    .local v2, "lastWasLF":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v3, :cond_0

    .line 196
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 180
    :cond_0
    if-eqz v2, :cond_1

    .line 181
    const/4 v2, 0x0

    .line 179
    :goto_1
    :pswitch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 184
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 185
    .local v0, "c":C
    const/4 v2, 0x0

    .line 186
    packed-switch v0, :pswitch_data_0

    .line 193
    :pswitch_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 188
    :pswitch_2
    const/4 v2, 0x1

    .line 189
    goto :goto_1

    .line 186
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static toHexValue(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 236
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 237
    add-int/lit8 v0, p0, -0x30

    .line 241
    :goto_0
    return v0

    .line 238
    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    .line 239
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 240
    :cond_1
    const/16 v0, 0x61

    if-lt p0, v0, :cond_2

    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    .line 241
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 243
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method
