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
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    .line 51
    return-void
.end method

.method private doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V
    .locals 24
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .param p2, "hints"    # Ljava/util/Hashtable;
    .param p3, "results"    # Ljava/util/Vector;
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I

    .prologue
    .line 79
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v3, v0, v1}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v19

    .line 83
    .local v19, "result":Lcom/google/zxing/Result;
    const/4 v9, 0x0

    .line 84
    .local v9, "alreadyFound":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt v12, v3, :cond_1

    .line 91
    :goto_1
    if-eqz v9, :cond_3

    .line 143
    .end local v9    # "alreadyFound":Z
    .end local v12    # "i":I
    .end local v19    # "result":Lcom/google/zxing/Result;
    :cond_0
    :goto_2
    return-void

    .line 80
    :catch_0
    move-exception v18

    .line 81
    .local v18, "re":Lcom/google/zxing/ReaderException;
    goto :goto_2

    .line 85
    .end local v18    # "re":Lcom/google/zxing/ReaderException;
    .restart local v9    # "alreadyFound":Z
    .restart local v12    # "i":I
    .restart local v19    # "result":Lcom/google/zxing/Result;
    :cond_1
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/Result;

    .line 86
    .local v10, "existingResult":Lcom/google/zxing/Result;
    invoke-virtual {v10}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 87
    const/4 v9, 0x1

    .line 88
    goto :goto_1

    .line 84
    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 94
    .end local v10    # "existingResult":Lcom/google/zxing/Result;
    :cond_3
    move-object/from16 v0, v19

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v0, v1, v2}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 95
    invoke-virtual/range {v19 .. v19}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v20

    .line 96
    .local v20, "resultPoints":[Lcom/google/zxing/ResultPoint;
    if-eqz v20, :cond_0

    move-object/from16 v0, v20

    array-length v3, v0

    if-eqz v3, :cond_0

    .line 99
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v21

    .line 100
    .local v21, "width":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v11

    .line 101
    .local v11, "height":I
    move/from16 v0, v21

    int-to-float v15, v0

    .line 102
    .local v15, "minX":F
    int-to-float v0, v11

    move/from16 v16, v0

    .line 103
    .local v16, "minY":F
    const/4 v13, 0x0

    .line 104
    .local v13, "maxX":F
    const/4 v14, 0x0

    .line 105
    .local v14, "maxY":F
    const/4 v12, 0x0

    :goto_3
    move-object/from16 v0, v20

    array-length v3, v0

    if-lt v12, v3, :cond_7

    .line 124
    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v3, v15, v3

    if-lez v3, :cond_4

    .line 125
    const/4 v3, 0x0

    const/4 v4, 0x0

    float-to-int v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v11}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V

    .line 129
    :cond_4
    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v3, v16, v3

    if-lez v3, :cond_5

    .line 130
    const/4 v3, 0x0

    const/4 v4, 0x0

    move/from16 v0, v16

    float-to-int v5, v0

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v3, v4, v1, v5}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V

    .line 134
    :cond_5
    add-int/lit8 v3, v21, -0x64

    int-to-float v3, v3

    cmpg-float v3, v13, v3

    if-gez v3, :cond_6

    .line 135
    float-to-int v3, v13

    const/4 v4, 0x0

    float-to-int v5, v13

    sub-int v5, v21, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v11}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    .line 136
    float-to-int v3, v13

    add-int v7, p4, v3

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v8, p5

    .line 135
    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V

    .line 139
    :cond_6
    add-int/lit8 v3, v11, -0x64

    int-to-float v3, v3

    cmpg-float v3, v14, v3

    if-gez v3, :cond_0

    .line 140
    const/4 v3, 0x0

    float-to-int v4, v14

    float-to-int v5, v14

    sub-int v5, v11, v5

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v3, v4, v1, v5}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v4

    .line 141
    float-to-int v3, v14

    add-int v8, p5, v3

    move-object/from16 v3, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    .line 140
    invoke-direct/range {v3 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V

    goto/16 :goto_2

    .line 106
    :cond_7
    aget-object v17, v20, v12

    .line 107
    .local v17, "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v22

    .line 108
    .local v22, "x":F
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v23

    .line 109
    .local v23, "y":F
    cmpg-float v3, v22, v15

    if-gez v3, :cond_8

    .line 110
    move/from16 v15, v22

    .line 112
    :cond_8
    cmpg-float v3, v23, v16

    if-gez v3, :cond_9

    .line 113
    move/from16 v16, v23

    .line 115
    :cond_9
    cmpl-float v3, v22, v13

    if-lez v3, :cond_a

    .line 116
    move/from16 v13, v22

    .line 118
    :cond_a
    cmpl-float v3, v23, v14

    if-lez v3, :cond_b

    .line 119
    move/from16 v14, v23

    .line 105
    :cond_b
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3
.end method

.method private static translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;
    .locals 8
    .param p0, "result"    # Lcom/google/zxing/Result;
    .param p1, "xOffset"    # I
    .param p2, "yOffset"    # I

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 147
    .local v3, "oldResultPoints":[Lcom/google/zxing/ResultPoint;
    array-length v4, v3

    new-array v1, v4, [Lcom/google/zxing/ResultPoint;

    .line 148
    .local v1, "newResultPoints":[Lcom/google/zxing/ResultPoint;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v3

    if-lt v0, v4, :cond_0

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

    return-object v4

    .line 149
    :cond_0
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

    goto :goto_0
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
    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;)[Lcom/google/zxing/Result;
    .locals 9
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;
    .param p2, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 59
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .local v3, "results":Ljava/util/Vector;
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v4

    .line 60
    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;Ljava/util/Vector;II)V

    .line 61
    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    .line 64
    :cond_0
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v7

    .line 65
    .local v7, "numResults":I
    new-array v8, v7, [Lcom/google/zxing/Result;

    .line 66
    .local v8, "resultArray":[Lcom/google/zxing/Result;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-lt v6, v7, :cond_1

    .line 69
    return-object v8

    .line 67
    :cond_1
    invoke-virtual {v3, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/Result;

    aput-object v0, v8, v6

    .line 66
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method
