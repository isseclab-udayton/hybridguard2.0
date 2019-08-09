.class public final Lcom/google/zxing/oned/CodaBarWriter;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "CodaBarWriter.java"


# static fields
.field private static final END_CHARS:[C

.field private static final START_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 30
    new-array v0, v1, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/oned/CodaBarWriter;->START_CHARS:[C

    .line 31
    new-array v0, v1, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/zxing/oned/CodaBarWriter;->END_CHARS:[C

    return-void

    .line 30
    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data

    .line 31
    :array_1
    .array-data 2
        0x54s
        0x4es
        0x2as
        0x45s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;)[Z
    .locals 14
    .param p1, "contents"    # Ljava/lang/String;

    .prologue
    .line 40
    sget-object v11, Lcom/google/zxing/oned/CodaBarWriter;->START_CHARS:[C

    const/4 v12, 0x0

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v12

    invoke-static {v11, v12}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v11

    if-nez v11, :cond_0

    .line 41
    new-instance v11, Ljava/lang/IllegalArgumentException;

    .line 42
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Codabar should start with one of the following: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v13, Lcom/google/zxing/oned/CodaBarWriter;->START_CHARS:[C

    invoke-static {v13}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 41
    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 44
    :cond_0
    sget-object v11, Lcom/google/zxing/oned/CodaBarWriter;->END_CHARS:[C

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v12

    invoke-static {v11, v12}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v11

    if-nez v11, :cond_1

    .line 45
    new-instance v11, Ljava/lang/IllegalArgumentException;

    .line 46
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Codabar should end with one of the following: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v13, Lcom/google/zxing/oned/CodaBarWriter;->END_CHARS:[C

    invoke-static {v13}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 45
    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 49
    :cond_1
    const/16 v10, 0x14

    .line 50
    .local v10, "resultLength":I
    const/4 v11, 0x4

    new-array v2, v11, [C

    fill-array-data v2, :array_0

    .line 51
    .local v2, "charsWhichAreTenLengthEachAfterDecoded":[C
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    if-lt v6, v11, :cond_2

    .line 63
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    add-int/2addr v10, v11

    .line 65
    new-array v9, v10, [Z

    .line 66
    .local v9, "result":[Z
    const/4 v8, 0x0

    .line 67
    .local v8, "position":I
    const/4 v7, 0x0

    .local v7, "index":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    if-lt v7, v11, :cond_6

    .line 113
    return-object v9

    .line 52
    .end local v7    # "index":I
    .end local v8    # "position":I
    .end local v9    # "result":[Z
    :cond_2
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->isDigit(C)Z

    move-result v11

    if-nez v11, :cond_3

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2d

    if-eq v11, v12, :cond_3

    .line 53
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x24

    if-ne v11, v12, :cond_4

    .line 54
    :cond_3
    add-int/lit8 v10, v10, 0x9

    .line 51
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 56
    :cond_4
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 55
    invoke-static {v2, v11}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v11

    .line 56
    if-eqz v11, :cond_5

    .line 57
    add-int/lit8 v10, v10, 0xa

    .line 58
    goto :goto_2

    .line 59
    :cond_5
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Cannot encode : \'"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x27

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 68
    .restart local v7    # "index":I
    .restart local v8    # "position":I
    .restart local v9    # "result":[Z
    :cond_6
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .line 69
    .local v1, "c":C
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    if-ne v7, v11, :cond_7

    .line 71
    sparse-switch v1, :sswitch_data_0

    .line 86
    :cond_7
    :goto_3
    const/4 v3, 0x0

    .line 87
    .local v3, "code":I
    const/4 v6, 0x0

    :goto_4
    sget-object v11, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    array-length v11, v11

    if-lt v6, v11, :cond_9

    .line 94
    :goto_5
    const/4 v4, 0x1

    .line 95
    .local v4, "color":Z
    const/4 v5, 0x0

    .line 96
    .local v5, "counter":I
    const/4 v0, 0x0

    .line 97
    .local v0, "bit":I
    :goto_6
    const/4 v11, 0x7

    if-lt v0, v11, :cond_b

    .line 108
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    if-ge v7, v11, :cond_8

    .line 109
    const/4 v11, 0x0

    aput-boolean v11, v9, v8

    .line 110
    add-int/lit8 v8, v8, 0x1

    .line 67
    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 73
    .end local v0    # "bit":I
    .end local v3    # "code":I
    .end local v4    # "color":Z
    .end local v5    # "counter":I
    :sswitch_0
    const/16 v1, 0x41

    .line 74
    goto :goto_3

    .line 76
    :sswitch_1
    const/16 v1, 0x42

    .line 77
    goto :goto_3

    .line 79
    :sswitch_2
    const/16 v1, 0x43

    .line 80
    goto :goto_3

    .line 82
    :sswitch_3
    const/16 v1, 0x44

    goto :goto_3

    .line 89
    .restart local v3    # "code":I
    :cond_9
    sget-object v11, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    aget-char v11, v11, v6

    if-ne v1, v11, :cond_a

    .line 90
    sget-object v11, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    aget v3, v11, v6

    .line 91
    goto :goto_5

    .line 87
    :cond_a
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 98
    .restart local v0    # "bit":I
    .restart local v4    # "color":Z
    .restart local v5    # "counter":I
    :cond_b
    aput-boolean v4, v9, v8

    .line 99
    add-int/lit8 v8, v8, 0x1

    .line 100
    rsub-int/lit8 v11, v0, 0x6

    shr-int v11, v3, v11

    and-int/lit8 v11, v11, 0x1

    if-eqz v11, :cond_c

    const/4 v11, 0x1

    if-ne v5, v11, :cond_e

    .line 101
    :cond_c
    if-eqz v4, :cond_d

    const/4 v4, 0x0

    .line 102
    :goto_7
    add-int/lit8 v0, v0, 0x1

    .line 103
    const/4 v5, 0x0

    .line 104
    goto :goto_6

    .line 101
    :cond_d
    const/4 v4, 0x1

    goto :goto_7

    .line 105
    :cond_e
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 50
    nop

    :array_0
    .array-data 2
        0x2fs
        0x3as
        0x2bs
        0x2es
    .end array-data

    .line 71
    :sswitch_data_0
    .sparse-switch
        0x2a -> :sswitch_2
        0x45 -> :sswitch_3
        0x4e -> :sswitch_1
        0x54 -> :sswitch_0
    .end sparse-switch
.end method
