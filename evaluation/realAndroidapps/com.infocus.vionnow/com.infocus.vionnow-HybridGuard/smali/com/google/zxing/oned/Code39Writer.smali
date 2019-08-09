.class public final Lcom/google/zxing/oned/Code39Writer;
.super Lcom/google/zxing/oned/UPCEANWriter;
.source "Code39Writer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANWriter;-><init>()V

    return-void
.end method

.method private static toIntArray(I[I)V
    .locals 4
    .param p0, "a"    # I
    .param p1, "toReturn"    # [I

    .prologue
    const/4 v3, 0x1

    .line 76
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0x9

    if-lt v0, v2, :cond_0

    .line 80
    return-void

    .line 77
    :cond_0
    shl-int v2, v3, v0

    and-int v1, p0, v2

    .line 78
    .local v1, "temp":I
    if-nez v1, :cond_1

    move v2, v3

    :goto_1
    aput v2, p1, v0

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    :cond_1
    const/4 v2, 0x2

    goto :goto_1
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
    .line 36
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    if-eq p2, v0, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode CODE_39, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/UPCEANWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Hashtable;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;)[B
    .locals 14
    .param p1, "contents"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x27

    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 44
    .local v4, "length":I
    const/16 v9, 0x50

    if-le v4, v9, :cond_0

    .line 45
    new-instance v9, Ljava/lang/IllegalArgumentException;

    .line 46
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Requested contents should be less than 80 digits long, but got "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 45
    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 49
    :cond_0
    const/16 v9, 0x9

    new-array v8, v9, [I

    .line 50
    .local v8, "widths":[I
    add-int/lit8 v0, v4, 0x19

    .line 51
    .local v0, "codeWidth":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v4, :cond_1

    .line 58
    new-array v7, v0, [B

    .line 59
    .local v7, "result":[B
    sget-object v9, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v9, v9, v13

    invoke-static {v9, v8}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 60
    invoke-static {v7, v12, v8, v11}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([BI[II)I

    move-result v6

    .line 61
    .local v6, "pos":I
    new-array v5, v11, [I

    aput v11, v5, v12

    .line 62
    .local v5, "narrowWhite":[I
    invoke-static {v7, v6, v5, v12}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([BI[II)I

    move-result v9

    add-int/2addr v6, v9

    .line 64
    add-int/lit8 v1, v4, -0x1

    :goto_1
    if-gez v1, :cond_3

    .line 70
    sget-object v9, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v9, v9, v13

    invoke-static {v9, v8}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 71
    invoke-static {v7, v6, v8, v11}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([BI[II)I

    move-result v9

    add-int/2addr v6, v9

    .line 72
    return-object v7

    .line 52
    .end local v5    # "narrowWhite":[I
    .end local v6    # "pos":I
    .end local v7    # "result":[B
    :cond_1
    const-string v9, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 53
    .local v2, "indexInString":I
    sget-object v9, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v9, v9, v2

    invoke-static {v9, v8}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 54
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    array-length v9, v8

    if-lt v3, v9, :cond_2

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 55
    :cond_2
    aget v9, v8, v3

    add-int/2addr v0, v9

    .line 54
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 65
    .end local v2    # "indexInString":I
    .end local v3    # "j":I
    .restart local v5    # "narrowWhite":[I
    .restart local v6    # "pos":I
    .restart local v7    # "result":[B
    :cond_3
    const-string v9, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 66
    .restart local v2    # "indexInString":I
    sget-object v9, Lcom/google/zxing/oned/Code39Reader;->CHARACTER_ENCODINGS:[I

    aget v9, v9, v2

    invoke-static {v9, v8}, Lcom/google/zxing/oned/Code39Writer;->toIntArray(I[I)V

    .line 67
    invoke-static {v7, v6, v8, v11}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([BI[II)I

    move-result v9

    add-int/2addr v6, v9

    .line 68
    invoke-static {v7, v6, v5, v12}, Lcom/google/zxing/oned/Code39Writer;->appendPattern([BI[II)I

    move-result v9

    add-int/2addr v6, v9

    .line 64
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method
