.class public final Lcom/google/zxing/oned/Code128Writer;
.super Lcom/google/zxing/oned/UPCEANWriter;
.source "Code128Writer.java"


# static fields
.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANWriter;-><init>()V

    return-void
.end method

.method private static isDigits(Ljava/lang/String;II)Z
    .locals 4
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "length"    # I

    .prologue
    .line 151
    add-int v1, p1, p2

    .line 152
    .local v1, "end":I
    move v2, p1

    .local v2, "i":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 158
    const/4 v3, 0x1

    :goto_1
    return v3

    .line 153
    :cond_0
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 154
    .local v0, "c":C
    const/16 v3, 0x30

    if-lt v0, v3, :cond_1

    const/16 v3, 0x39

    if-le v0, v3, :cond_2

    .line 155
    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    .line 152
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Hashtable;)Lcom/google/zxing/common/BitMatrix;
    .locals 3
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 45
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    if-eq p2, v0, :cond_0

    .line 46
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode CODE_128, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/UPCEANWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Hashtable;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;)[B
    .locals 21
    .param p1, "contents"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 54
    .local v8, "length":I
    const/16 v18, 0x1

    move/from16 v0, v18

    if-lt v8, v0, :cond_0

    const/16 v18, 0x50

    move/from16 v0, v18

    if-le v8, v0, :cond_1

    .line 55
    :cond_0
    new-instance v18, Ljava/lang/IllegalArgumentException;

    .line 56
    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Contents length should be between 1 and 80 characters, but got "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 55
    invoke-direct/range {v18 .. v19}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 59
    :cond_1
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-lt v7, v8, :cond_4

    .line 66
    new-instance v13, Ljava/util/Vector;

    invoke-direct {v13}, Ljava/util/Vector;-><init>()V

    .line 67
    .local v13, "patterns":Ljava/util/Vector;
    const/4 v3, 0x0

    .line 68
    .local v3, "checkSum":I
    const/4 v4, 0x1

    .line 69
    .local v4, "checkWeight":I
    const/4 v5, 0x0

    .line 70
    .local v5, "codeSet":I
    const/4 v15, 0x0

    .line 72
    .local v15, "position":I
    :cond_2
    :goto_1
    if-lt v15, v8, :cond_7

    .line 122
    rem-int/lit8 v3, v3, 0x67

    .line 123
    sget-object v18, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v18, v18, v3

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 126
    sget-object v18, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    const/16 v19, 0x6a

    aget-object v18, v18, v19

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 129
    const/4 v6, 0x0

    .line 130
    .local v6, "codeWidth":I
    invoke-virtual {v13}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v11

    .line 131
    .local v11, "patternEnumeration":Ljava/util/Enumeration;
    :cond_3
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-nez v18, :cond_e

    .line 139
    new-array v0, v6, [B

    move-object/from16 v17, v0

    .line 140
    .local v17, "result":[B
    invoke-virtual {v13}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v11

    .line 141
    const/4 v14, 0x0

    .line 142
    .local v14, "pos":I
    :goto_2
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-nez v18, :cond_f

    .line 147
    return-object v17

    .line 60
    .end local v3    # "checkSum":I
    .end local v4    # "checkWeight":I
    .end local v5    # "codeSet":I
    .end local v6    # "codeWidth":I
    .end local v11    # "patternEnumeration":Ljava/util/Enumeration;
    .end local v13    # "patterns":Ljava/util/Vector;
    .end local v14    # "pos":I
    .end local v15    # "position":I
    .end local v17    # "result":[B
    :cond_4
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 61
    .local v2, "c":C
    const/16 v18, 0x20

    move/from16 v0, v18

    if-lt v2, v0, :cond_5

    const/16 v18, 0x7e

    move/from16 v0, v18

    if-le v2, v0, :cond_6

    .line 62
    :cond_5
    new-instance v18, Ljava/lang/IllegalArgumentException;

    const-string v19, "Contents should only contain characters between \' \' and \'~\'"

    invoke-direct/range {v18 .. v19}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 59
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 74
    .end local v2    # "c":C
    .restart local v3    # "checkSum":I
    .restart local v4    # "checkWeight":I
    .restart local v5    # "codeSet":I
    .restart local v13    # "patterns":Ljava/util/Vector;
    .restart local v15    # "position":I
    :cond_7
    const/16 v18, 0x63

    move/from16 v0, v18

    if-ne v5, v0, :cond_8

    const/16 v16, 0x2

    .line 76
    .local v16, "requiredDigitCount":I
    :goto_3
    sub-int v18, v8, v15

    move/from16 v0, v18

    move/from16 v1, v16

    if-lt v0, v1, :cond_9

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v15, v1}, Lcom/google/zxing/oned/Code128Writer;->isDigits(Ljava/lang/String;II)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 77
    const/16 v9, 0x63

    .line 84
    .local v9, "newCodeSet":I
    :goto_4
    if-ne v9, v5, :cond_b

    .line 86
    const/16 v18, 0x64

    move/from16 v0, v18

    if-ne v5, v0, :cond_a

    .line 87
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v18

    add-int/lit8 v12, v18, -0x20

    .line 88
    .local v12, "patternIndex":I
    add-int/lit8 v15, v15, 0x1

    .line 112
    :goto_5
    sget-object v18, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v18, v18, v12

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 115
    mul-int v18, v12, v4

    add-int v3, v3, v18

    .line 116
    if-eqz v15, :cond_2

    .line 117
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 74
    .end local v9    # "newCodeSet":I
    .end local v12    # "patternIndex":I
    .end local v16    # "requiredDigitCount":I
    :cond_8
    const/16 v16, 0x4

    goto :goto_3

    .line 79
    .restart local v16    # "requiredDigitCount":I
    :cond_9
    const/16 v9, 0x64

    .restart local v9    # "newCodeSet":I
    goto :goto_4

    .line 90
    :cond_a
    add-int/lit8 v18, v15, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v15, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 91
    .restart local v12    # "patternIndex":I
    add-int/lit8 v15, v15, 0x2

    goto :goto_5

    .line 96
    .end local v12    # "patternIndex":I
    :cond_b
    if-nez v5, :cond_d

    .line 98
    const/16 v18, 0x64

    move/from16 v0, v18

    if-ne v9, v0, :cond_c

    .line 99
    const/16 v12, 0x68

    .line 108
    .restart local v12    # "patternIndex":I
    :goto_6
    move v5, v9

    goto :goto_5

    .line 102
    .end local v12    # "patternIndex":I
    :cond_c
    const/16 v12, 0x69

    .restart local v12    # "patternIndex":I
    goto :goto_6

    .line 106
    .end local v12    # "patternIndex":I
    :cond_d
    move v12, v9

    .restart local v12    # "patternIndex":I
    goto :goto_6

    .line 132
    .end local v9    # "newCodeSet":I
    .end local v12    # "patternIndex":I
    .end local v16    # "requiredDigitCount":I
    .restart local v6    # "codeWidth":I
    .restart local v11    # "patternEnumeration":Ljava/util/Enumeration;
    :cond_e
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [I

    .line 133
    .local v10, "pattern":[I
    const/4 v7, 0x0

    :goto_7
    array-length v0, v10

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v7, v0, :cond_3

    .line 134
    aget v18, v10, v7

    add-int v6, v6, v18

    .line 133
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 143
    .end local v10    # "pattern":[I
    .restart local v14    # "pos":I
    .restart local v17    # "result":[B
    :cond_f
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [I

    .line 144
    .restart local v10    # "pattern":[I
    const/16 v18, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v14, v10, v1}, Lcom/google/zxing/oned/Code128Writer;->appendPattern([BI[II)I

    move-result v18

    add-int v14, v14, v18

    goto/16 :goto_2
.end method
