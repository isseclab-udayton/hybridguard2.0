.class public final Lcom/google/zxing/qrcode/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    .line 42
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
    .line 127
    array-length v2, p1

    .line 129
    .local v2, "numCodewords":I
    new-array v0, v2, [I

    .line 130
    .local v0, "codewordsInts":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_0

    .line 133
    array-length v5, p1

    sub-int v3, v5, p2

    .line 135
    .local v3, "numECCodewords":I
    :try_start_0
    iget-object v5, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-virtual {v5, v0, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    const/4 v1, 0x0

    :goto_1
    if-lt v1, p2, :cond_1

    .line 144
    return-void

    .line 131
    .end local v3    # "numECCodewords":I
    :cond_0
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    aput v5, v0, v1

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    .restart local v3    # "numECCodewords":I
    :catch_0
    move-exception v4

    .line 137
    .local v4, "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v5

    throw v5

    .line 142
    .end local v4    # "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    :cond_1
    aget v5, v0, v1

    int-to-byte v5, v5

    aput-byte v5, p1, v1

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .locals 1
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 17
    .param p1, "bits"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitMatrix;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v8, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 88
    .local v8, "parser":Lcom/google/zxing/qrcode/decoder/BitMatrixParser;
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v13

    .line 89
    .local v13, "version":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->getErrorCorrectionLevel()Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    move-result-object v5

    .line 92
    .local v5, "ecLevel":Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    .line 94
    .local v2, "codewords":[B
    invoke-static {v2, v13, v5}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;

    move-result-object v4

    .line 97
    .local v4, "dataBlocks":[Lcom/google/zxing/qrcode/decoder/DataBlock;
    const/4 v12, 0x0

    .line 98
    .local v12, "totalBytes":I
    array-length v15, v4

    const/4 v14, 0x0

    :goto_0
    if-lt v14, v15, :cond_0

    .line 101
    new-array v9, v12, [B

    .line 102
    .local v9, "resultBytes":[B
    const/4 v10, 0x0

    .line 105
    .local v10, "resultOffset":I
    array-length v15, v4

    const/4 v14, 0x0

    :goto_1
    if-lt v14, v15, :cond_1

    .line 115
    move-object/from16 v0, p2

    invoke-static {v9, v13, v5, v0}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decode([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v14

    return-object v14

    .line 98
    .end local v9    # "resultBytes":[B
    .end local v10    # "resultOffset":I
    :cond_0
    aget-object v3, v4, v14

    .line 99
    .local v3, "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v16

    add-int v12, v12, v16

    .line 98
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 105
    .end local v3    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    .restart local v9    # "resultBytes":[B
    .restart local v10    # "resultOffset":I
    :cond_1
    aget-object v3, v4, v14

    .line 106
    .restart local v3    # "dataBlock":Lcom/google/zxing/qrcode/decoder/DataBlock;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getCodewords()[B

    move-result-object v1

    .line 107
    .local v1, "codewordBytes":[B
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v7

    .line 108
    .local v7, "numDataCodewords":I
    move-object/from16 v0, p0

    invoke-direct {v0, v1, v7}, Lcom/google/zxing/qrcode/decoder/Decoder;->correctErrors([BI)V

    .line 109
    const/4 v6, 0x0

    .local v6, "i":I
    move v11, v10

    .end local v10    # "resultOffset":I
    .local v11, "resultOffset":I
    :goto_2
    if-lt v6, v7, :cond_2

    .line 105
    add-int/lit8 v14, v14, 0x1

    move v10, v11

    .end local v11    # "resultOffset":I
    .restart local v10    # "resultOffset":I
    goto :goto_1

    .line 110
    .end local v10    # "resultOffset":I
    .restart local v11    # "resultOffset":I
    :cond_2
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "resultOffset":I
    .restart local v10    # "resultOffset":I
    aget-byte v16, v1, v6

    aput-byte v16, v9, v11

    .line 109
    add-int/lit8 v6, v6, 0x1

    move v11, v10

    .end local v10    # "resultOffset":I
    .restart local v11    # "resultOffset":I
    goto :goto_2
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .locals 1
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .locals 5
    .param p1, "image"    # [[Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[Z",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    array-length v1, p1

    .line 60
    .local v1, "dimension":I
    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    .line 61
    .local v0, "bits":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 68
    invoke-virtual {p0, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v4

    return-object v4

    .line 62
    :cond_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-lt v3, v1, :cond_1

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 63
    :cond_1
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_2

    .line 64
    invoke-virtual {v0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 62
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
