.class public final Lcom/google/zxing/aztec/AztecReader;
.super Ljava/lang/Object;
.source "AztecReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/aztec/AztecReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 11
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
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
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 60
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v8, Lcom/google/zxing/aztec/detector/Detector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/google/zxing/aztec/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v8}, Lcom/google/zxing/aztec/detector/Detector;->detect()Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v2

    .line 61
    .local v2, "detectorResult":Lcom/google/zxing/aztec/AztecDetectorResult;
    invoke-virtual {v2}, Lcom/google/zxing/aztec/AztecDetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 63
    .local v5, "points":[Lcom/google/zxing/ResultPoint;
    if-eqz p2, :cond_0

    .line 64
    sget-object v8, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/ResultPointCallback;

    .line 65
    .local v7, "rpcb":Lcom/google/zxing/ResultPointCallback;
    if-eqz v7, :cond_0

    .line 66
    array-length v9, v5

    const/4 v8, 0x0

    :goto_0
    if-lt v8, v9, :cond_3

    .line 72
    .end local v7    # "rpcb":Lcom/google/zxing/ResultPointCallback;
    :cond_0
    new-instance v8, Lcom/google/zxing/aztec/decoder/Decoder;

    invoke-direct {v8}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    invoke-virtual {v8, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1

    .line 74
    .local v1, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    new-instance v6, Lcom/google/zxing/Result;

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v9

    sget-object v10, Lcom/google/zxing/BarcodeFormat;->AZTEC:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v6, v8, v9, v5, v10}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 76
    .local v6, "result":Lcom/google/zxing/Result;
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v0

    .line 77
    .local v0, "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    if-eqz v0, :cond_1

    .line 78
    sget-object v8, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v6, v8, v0}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 80
    :cond_1
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "ecLevel":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 82
    sget-object v8, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v6, v8, v3}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 85
    :cond_2
    return-object v6

    .line 66
    .end local v0    # "byteSegments":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v1    # "decoderResult":Lcom/google/zxing/common/DecoderResult;
    .end local v3    # "ecLevel":Ljava/lang/String;
    .end local v6    # "result":Lcom/google/zxing/Result;
    .restart local v7    # "rpcb":Lcom/google/zxing/ResultPointCallback;
    :cond_3
    aget-object v4, v5, v8

    .line 67
    .local v4, "point":Lcom/google/zxing/ResultPoint;
    invoke-interface {v7, v4}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 66
    add-int/lit8 v8, v8, 0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 91
    return-void
.end method
