.class public final Lcom/google/zxing/multi/GenericMultipleBarcodeReader;
.super Ljava/lang/Object;
.source "GenericMultipleBarcodeReader.java"

# interfaces
.implements Lcom/google/zxing/multi/MultipleBarcodeReader;


# static fields
.field private static final MIN_DIMENSION_TO_RECUR:I = 0x64


# instance fields
.field private final delegate:Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Reader;)V
    .locals 0
    .param p1, "delegate"    # Lcom/google/zxing/Reader;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    .line 53
    return-void
.end method

.method private doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V
    .locals 23
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/Result;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    .local p3, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v3, v0, v1}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    .line 82
    .local v18, "result":Lcom/google/zxing/Result;
    const/4 v9, 0x0

    .line 83
    .local v9, "alreadyFound":Z
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 89
    :goto_0
    if-eqz v9, :cond_3

    .line 140
    .end local v9    # "alreadyFound":Z
    .end local v18    # "result":Lcom/google/zxing/Result;
    :cond_1
    :goto_1
    return-void

    .line 79
    :catch_0
    move-exception v17

    .line 80
    .local v17, "re":Lcom/google/zxing/ReaderException;
    goto :goto_1

    .line 83
    .end local v17    # "re":Lcom/google/zxing/ReaderException;
    .restart local v9    # "alreadyFound":Z
    .restart local v18    # "result":Lcom/google/zxing/Result;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/Result;

    .line 84
    .local v10, "existingResult":Lcom/google/zxing/Result;
    invoke-virtual {v10}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 85
    const/4 v9, 0x1

    .line 86
    goto :goto_0

    .line 92
    .end local v10    # "existingResult":Lcom/google/zxing/Result;
    :cond_3
    move-object/from16 v0, v18

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v0, v1, v2}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v19

    .line 94
    .local v19, "resultPoints":[Lcom/google/zxing/ResultPoint;
    if-eqz v19, :cond_1

    move-object/from16 v0, v19

    array-length v3, v0

    if-eqz v3, :cond_1

    .line 97
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v20

    .line 98
    .local v20, "width":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v11

    .line 99
    .local v11, "height":I
    move/from16 v0, v20

    int-to-float v14, v0

    .line 100
    .local v14, "minX":F
    int-to-float v15, v11

    .line 101
    .local v15, "minY":F
    const/4 v12, 0x0

    .line 102
    .local v12, "maxX":F
    const/4 v13, 0x0

    .line 103
    .local v13, "maxY":F
    move-object/from16 v0, v19

    array-length v4, v0

    const/4 v3, 0x0

    :goto_2
    if-lt v3, v4, :cond_7

    .line 121
    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v3, v14, v3

    if-lez v3, :cond_4

    .line 122
    const/4 v3, 0x0

    const/4 v4, 0x0

    float-to-int v5, v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v11}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V

    .line 126
    :cond_4
    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v3, v15, v3

    if-lez v3, :cond_5

    .line 127
    const/4 v3, 0x0

    const/4 v4, 0x0

    float-to-int v5, v15

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v3, v4, v1, v5}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V

    .line 131
    :cond_5
    add-int/lit8 v3, v20, -0x64

    int-to-float v3, v3

    cmpg-float v3, v12, v3

    if-gez v3, :cond_6

    .line 132
    float-to-int v3, v12

    const/4 v4, 0x0

    float-to-int v5, v12

    sub-int v5, v20, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v11}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    .line 133
    float-to-int v3, v12

    add-int v7, p4, v3

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v8, p5

    .line 132
    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V

    .line 136
    :cond_6
    add-int/lit8 v3, v11, -0x64

    int-to-float v3, v3

    cmpg-float v3, v13, v3

    if-gez v3, :cond_1

    .line 137
    const/4 v3, 0x0

    float-to-int v4, v13

    float-to-int v5, v13

    sub-int v5, v11, v5

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v3, v4, v1, v5}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    .line 138
    float-to-int v3, v13

    add-int v8, p5, v3

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    .line 137
    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V

    goto/16 :goto_1

    .line 103
    :cond_7
    aget-object v16, v19, v3

    .line 104
    .local v16, "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v21

    .line 105
    .local v21, "x":F
    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v22

    .line 106
    .local v22, "y":F
    cmpg-float v5, v21, v14

    if-gez v5, :cond_8

    .line 107
    move/from16 v14, v21

    .line 109
    :cond_8
    cmpg-float v5, v22, v15

    if-gez v5, :cond_9

    .line 110
    move/from16 v15, v22

    .line 112
    :cond_9
    cmpl-float v5, v21, v12

    if-lez v5, :cond_a

    .line 113
    move/from16 v12, v21

    .line 115
    :cond_a
    cmpl-float v5, v22, v13

    if-lez v5, :cond_b

    .line 116
    move/from16 v13, v22

    .line 103
    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_2
.end method

.method private static translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;
    .locals 8
    .param p0, "result"    # Lcom/google/zxing/Result;
    .param p1, "xOffset"    # I
    .param p2, "yOffset"    # I

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 144
    .local v3, "oldResultPoints":[Lcom/google/zxing/ResultPoint;
    if-nez v3, :cond_0

    .line 152
    .end local p0    # "result":Lcom/google/zxing/Result;
    :goto_0
    return-object p0

    .line 147
    .restart local p0    # "result":Lcom/google/zxing/Result;
    :cond_0
    array-length v4, v3

    new-array v1, v4, [Lcom/google/zxing/ResultPoint;

    .line 148
    .local v1, "newResultPoints":[Lcom/google/zxing/ResultPoint;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, v3

    if-lt v0, v4, :cond_1

    .line 152
    new-instance v4, Lcom/google/zxing/Result;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v6

    .line 153
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v7

    .line 152
    invoke-direct {v4, v5, v6, v1, v7}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    move-object p0, v4

    goto :goto_0

    .line 149
    :cond_1
    aget-object v2, v3, v0

    .line 150
    .local v2, "oldPoint":Lcom/google/zxing/ResultPoint;
    new-instance v4, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    int-to-float v6, p1

    add-float/2addr v5, v6

    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    int-to-float v7, p2

    add-float/2addr v6, v7

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v1, v0

    .line 148
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    .locals 6
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    const/4 v4, 0x0

    .line 63
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .local v3, "results":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v4

    .line 64
    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;II)V

    .line 65
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 68
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/zxing/Result;

    invoke-interface {v3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/zxing/Result;

    return-object v0
.end method
