.class public final Lcom/google/zxing/datamatrix/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 39
    return-void
.end method

.method private correctErrors([BI)V
    .locals 6
    .param p1, "codewordBytes"    # [B
    .param p2, "numDataCodewords"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 117
    array-length v2, p1

    .line 119
    .local v2, "numCodewords":I
    new-array v0, v2, [I

    .line 120
    .local v0, "codewordsInts":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_0

    .line 123
    array-length v5, p1

    sub-int v3, v5, p2

    .line 125
    .local v3, "numECCodewords":I
    :try_start_0
    iget-object v5, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-virtual {v5, v0, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    const/4 v1, 0x0

    :goto_1
    if-lt v1, p2, :cond_1

    .line 134
    return-void

    .line 121
    .end local v3    # "numECCodewords":I
    :cond_0
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    aput v5, v0, v1

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 126
    .restart local v3    # "numECCodewords":I
    :catch_0
    move-exception v4

    .line 127
    .local v4, "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v5

    throw v5

    .line 132
    .end local v4    # "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    :cond_1
    aget v5, v0, v1

    int-to-byte v5, v5

    aput-byte v5, p1, v1

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .locals 14
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v8, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;

    invoke-direct {v8, p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 76
    .local v8, "parser":Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;
    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->getVersion()Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v11

    .line 79
    .local v11, "version":Lcom/google/zxing/datamatrix/decoder/Version;
    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v1

    .line 81
    .local v1, "codewords":[B
    invoke-static {v1, v11}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;

    move-result-object v3

    .line 83
    .local v3, "dataBlocks":[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    array-length v4, v3

    .line 86
    .local v4, "dataBlocksCount":I
    const/4 v10, 0x0

    .line 87
    .local v10, "totalBytes":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-lt v5, v4, :cond_0

    .line 90
    new-array v9, v10, [B

    .line 93
    .local v9, "resultBytes":[B
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    if-lt v6, v4, :cond_1

    .line 105
    invoke-static {v9}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decode([B)Lcom/google/zxing/common/DecoderResult;

    move-result-object v12

    return-object v12

    .line 88
    .end local v6    # "j":I
    .end local v9    # "resultBytes":[B
    :cond_0
    aget-object v12, v3, v5

    invoke-virtual {v12}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v12

    add-int/2addr v10, v12

    .line 87
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 94
    .restart local v6    # "j":I
    .restart local v9    # "resultBytes":[B
    :cond_1
    aget-object v2, v3, v6

    .line 95
    .local v2, "dataBlock":Lcom/google/zxing/datamatrix/decoder/DataBlock;
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getCodewords()[B

    move-result-object v0

    .line 96
    .local v0, "codewordBytes":[B
    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v7

    .line 97
    .local v7, "numDataCodewords":I
    invoke-direct {p0, v0, v7}, Lcom/google/zxing/datamatrix/decoder/Decoder;->correctErrors([BI)V

    .line 98
    const/4 v5, 0x0

    :goto_2
    if-lt v5, v7, :cond_2

    .line 93
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 100
    :cond_2
    mul-int v12, v5, v4

    add-int/2addr v12, v6

    aget-byte v13, v0, v5

    aput-byte v13, v9, v12

    .line 98
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .locals 5
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 51
    array-length v1, p1

    .line 52
    .local v1, "dimension":I
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 53
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 60
    invoke-virtual {p0, v0}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v4

    return-object v4

    .line 54
    :cond_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-lt v3, v1, :cond_1

    .line 53
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 55
    :cond_1
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_2

    .line 56
    invoke-virtual {v0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 54
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
