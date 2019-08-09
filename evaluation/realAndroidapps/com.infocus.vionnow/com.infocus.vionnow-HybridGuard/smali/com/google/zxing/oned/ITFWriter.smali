.class public final Lcom/google/zxing/oned/ITFWriter;
.super Lcom/google/zxing/oned/UPCEANWriter;
.source "ITFWriter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANWriter;-><init>()V

    return-void
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
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    if-eq p2, v0, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode ITF, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/UPCEANWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Hashtable;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;)[B
    .locals 14
    .param p1, "contents"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0xa

    const/4 v12, 0x1

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 45
    .local v4, "length":I
    const/16 v10, 0x50

    if-le v4, v10, :cond_0

    .line 46
    new-instance v10, Ljava/lang/IllegalArgumentException;

    .line 47
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Requested contents should be less than 80 digits long, but got "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 46
    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 49
    :cond_0
    mul-int/lit8 v10, v4, 0x9

    add-int/lit8 v10, v10, 0x9

    new-array v7, v10, [B

    .line 50
    .local v7, "result":[B
    const/4 v10, 0x4

    new-array v8, v10, [I

    fill-array-data v8, :array_0

    .line 51
    .local v8, "start":[I
    const/4 v10, 0x0

    invoke-static {v7, v10, v8, v12}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([BI[II)I

    move-result v6

    .line 52
    .local v6, "pos":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v4, :cond_1

    .line 62
    const/4 v10, 0x3

    new-array v1, v10, [I

    fill-array-data v1, :array_1

    .line 63
    .local v1, "end":[I
    invoke-static {v7, v6, v1, v12}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([BI[II)I

    move-result v10

    add-int/2addr v6, v10

    .line 65
    return-object v7

    .line 53
    .end local v1    # "end":[I
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10, v13}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    .line 54
    .local v5, "one":I
    add-int/lit8 v10, v2, 0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10, v13}, Ljava/lang/Character;->digit(CI)I

    move-result v9

    .line 55
    .local v9, "two":I
    const/16 v10, 0x12

    new-array v0, v10, [I

    .line 56
    .local v0, "encoding":[I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    const/4 v10, 0x5

    if-lt v3, v10, :cond_2

    .line 60
    invoke-static {v7, v6, v0, v12}, Lcom/google/zxing/oned/ITFWriter;->appendPattern([BI[II)I

    move-result v10

    add-int/2addr v6, v10

    .line 52
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 57
    :cond_2
    shl-int/lit8 v10, v3, 0x1

    sget-object v11, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v11, v11, v5

    aget v11, v11, v3

    aput v11, v0, v10

    .line 58
    shl-int/lit8 v10, v3, 0x1

    add-int/lit8 v10, v10, 0x1

    sget-object v11, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v11, v11, v9

    aget v11, v11, v3

    aput v11, v0, v10

    .line 56
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 50
    nop

    :array_0
    .array-data 4
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 62
    :array_1
    .array-data 4
        0x3
        0x1
        0x1
    .end array-data
.end method
