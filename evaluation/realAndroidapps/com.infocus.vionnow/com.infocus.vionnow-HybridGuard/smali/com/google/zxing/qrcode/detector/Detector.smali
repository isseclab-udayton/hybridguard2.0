.class public Lcom/google/zxing/qrcode/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 45
    return-void
.end method

.method private calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .locals 7
    .param p1, "pattern"    # Lcom/google/zxing/ResultPoint;
    .param p2, "otherPattern"    # Lcom/google/zxing/ResultPoint;

    .prologue
    const/high16 v6, 0x40e00000    # 7.0f

    .line 233
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    float-to-int v2, v2

    .line 234
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    float-to-int v3, v3

    .line 235
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    float-to-int v4, v4

    .line 236
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v5, v5

    .line 233
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRunBothWays(IIII)F

    move-result v0

    .line 237
    .local v0, "moduleSizeEst1":F
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    float-to-int v2, v2

    .line 238
    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    float-to-int v3, v3

    .line 239
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    float-to-int v4, v4

    .line 240
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v5, v5

    .line 237
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRunBothWays(IIII)F

    move-result v1

    .line 241
    .local v1, "moduleSizeEst2":F
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 242
    div-float v2, v1, v6

    .line 249
    :goto_0
    return v2

    .line 244
    :cond_0
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 245
    div-float v2, v0, v6

    goto :goto_0

    .line 249
    :cond_1
    add-float v2, v0, v1

    const/high16 v3, 0x41600000    # 14.0f

    div-float/2addr v2, v3

    goto :goto_0
.end method

.method protected static computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I
    .locals 4
    .param p0, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p1, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "moduleSize"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-static {p0, p1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    div-float/2addr v3, p3

    invoke-static {v3}, Lcom/google/zxing/qrcode/detector/Detector;->round(F)I

    move-result v2

    .line 199
    .local v2, "tltrCentersDimension":I
    invoke-static {p0, p2}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    div-float/2addr v3, p3

    invoke-static {v3}, Lcom/google/zxing/qrcode/detector/Detector;->round(F)I

    move-result v1

    .line 200
    .local v1, "tlblCentersDimension":I
    add-int v3, v2, v1

    shr-int/lit8 v3, v3, 0x1

    add-int/lit8 v0, v3, 0x7

    .line 201
    .local v0, "dimension":I
    and-int/lit8 v3, v0, 0x3

    packed-switch v3, :pswitch_data_0

    .line 212
    :goto_0
    :pswitch_0
    return v0

    .line 203
    :pswitch_1
    add-int/lit8 v0, v0, 0x1

    .line 204
    goto :goto_0

    .line 207
    :pswitch_2
    add-int/lit8 v0, v0, -0x1

    .line 208
    goto :goto_0

    .line 210
    :pswitch_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static createTransform(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/PerspectiveTransform;
    .locals 17
    .param p0, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p1, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "alignmentPattern"    # Lcom/google/zxing/ResultPoint;
    .param p4, "dimension"    # I

    .prologue
    .line 147
    move/from16 v0, p4

    int-to-float v1, v0

    const/high16 v2, 0x40600000    # 3.5f

    sub-float v3, v1, v2

    .line 152
    .local v3, "dimMinusThree":F
    if-eqz p3, :cond_0

    .line 153
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v13

    .line 154
    .local v13, "bottomRightX":F
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v14

    .line 155
    .local v14, "bottomRightY":F
    const/high16 v1, 0x40400000    # 3.0f

    sub-float v6, v3, v1

    .local v6, "sourceBottomRightY":F
    move v5, v6

    .line 164
    .local v5, "sourceBottomRightX":F
    :goto_0
    const/high16 v1, 0x40600000    # 3.5f

    .line 165
    const/high16 v2, 0x40600000    # 3.5f

    .line 167
    const/high16 v4, 0x40600000    # 3.5f

    .line 170
    const/high16 v7, 0x40600000    # 3.5f

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v9

    .line 173
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v10

    .line 174
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    .line 175
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    .line 178
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v15

    .line 179
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    move v8, v3

    .line 163
    invoke-static/range {v1 .. v16}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v1

    return-object v1

    .line 158
    .end local v5    # "sourceBottomRightX":F
    .end local v6    # "sourceBottomRightY":F
    .end local v13    # "bottomRightX":F
    .end local v14    # "bottomRightY":F
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    add-float v13, v1, v2

    .line 159
    .restart local v13    # "bottomRightX":F
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    add-float v14, v1, v2

    .line 160
    .restart local v14    # "bottomRightY":F
    move v6, v3

    .restart local v6    # "sourceBottomRightY":F
    move v5, v3

    .restart local v5    # "sourceBottomRightX":F
    goto :goto_0
.end method

.method private static round(F)I
    .locals 1
    .param p0, "d"    # F

    .prologue
    .line 404
    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr v0, p0

    float-to-int v0, v0

    return v0
.end method

.method private static sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/common/PerspectiveTransform;I)Lcom/google/zxing/common/BitMatrix;
    .locals 2
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "transform"    # Lcom/google/zxing/common/PerspectiveTransform;
    .param p2, "dimension"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 186
    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v0

    .line 187
    .local v0, "sampler":Lcom/google/zxing/common/GridSampler;
    invoke-virtual {v0, p0, p2, p2, p1}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    return-object v1
.end method

.method private sizeOfBlackWhiteBlackRun(IIII)F
    .locals 18
    .param p1, "fromX"    # I
    .param p2, "fromY"    # I
    .param p3, "toX"    # I
    .param p4, "toY"    # I

    .prologue
    .line 298
    sub-int v16, p4, p2

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(I)I

    move-result v16

    sub-int v17, p3, p1

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(I)I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_2

    const/4 v10, 0x1

    .line 299
    .local v10, "steep":Z
    :goto_0
    if-eqz v10, :cond_0

    .line 300
    move/from16 v11, p1

    .line 301
    .local v11, "temp":I
    move/from16 p1, p2

    .line 302
    move/from16 p2, v11

    .line 303
    move/from16 v11, p3

    .line 304
    move/from16 p3, p4

    .line 305
    move/from16 p4, v11

    .line 308
    .end local v11    # "temp":I
    :cond_0
    sub-int v16, p3, p1

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 309
    .local v4, "dx":I
    sub-int v16, p4, p2

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 310
    .local v5, "dy":I
    neg-int v0, v4

    move/from16 v16, v0

    shr-int/lit8 v6, v16, 0x1

    .line 311
    .local v6, "error":I
    move/from16 v0, p1

    move/from16 v1, p3

    if-ge v0, v1, :cond_3

    const/4 v13, 0x1

    .line 312
    .local v13, "xstep":I
    :goto_1
    move/from16 v0, p2

    move/from16 v1, p4

    if-ge v0, v1, :cond_4

    const/4 v15, 0x1

    .line 315
    .local v15, "ystep":I
    :goto_2
    const/4 v9, 0x0

    .line 316
    .local v9, "state":I
    move/from16 v12, p1

    .local v12, "x":I
    move/from16 v14, p2

    .local v14, "y":I
    :goto_3
    move/from16 v0, p3

    if-ne v12, v0, :cond_5

    .line 351
    :cond_1
    sub-int v2, p3, p1

    .line 352
    .local v2, "diffX":I
    sub-int v3, p4, p2

    .line 353
    .local v3, "diffY":I
    mul-int v16, v2, v2

    mul-int v17, v3, v3

    add-int v16, v16, v17

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v16, v0

    :goto_4
    return v16

    .line 298
    .end local v2    # "diffX":I
    .end local v3    # "diffY":I
    .end local v4    # "dx":I
    .end local v5    # "dy":I
    .end local v6    # "error":I
    .end local v9    # "state":I
    .end local v10    # "steep":Z
    .end local v12    # "x":I
    .end local v13    # "xstep":I
    .end local v14    # "y":I
    .end local v15    # "ystep":I
    :cond_2
    const/4 v10, 0x0

    goto :goto_0

    .line 311
    .restart local v4    # "dx":I
    .restart local v5    # "dy":I
    .restart local v6    # "error":I
    .restart local v10    # "steep":Z
    :cond_3
    const/4 v13, -0x1

    goto :goto_1

    .line 312
    .restart local v13    # "xstep":I
    :cond_4
    const/4 v15, -0x1

    goto :goto_2

    .line 317
    .restart local v9    # "state":I
    .restart local v12    # "x":I
    .restart local v14    # "y":I
    .restart local v15    # "ystep":I
    :cond_5
    if-eqz v10, :cond_8

    move v7, v14

    .line 318
    .local v7, "realX":I
    :goto_5
    if-eqz v10, :cond_9

    move v8, v12

    .line 323
    .local v8, "realY":I
    :goto_6
    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v9, v0, :cond_a

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7, v8}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    if-eqz v16, :cond_6

    .line 325
    add-int/lit8 v9, v9, 0x1

    .line 334
    :cond_6
    :goto_7
    const/16 v16, 0x3

    move/from16 v0, v16

    if-ne v9, v0, :cond_b

    .line 335
    sub-int v2, v12, p1

    .line 336
    .restart local v2    # "diffX":I
    sub-int v3, v14, p2

    .line 337
    .restart local v3    # "diffY":I
    if-gez v13, :cond_7

    .line 338
    add-int/lit8 v2, v2, 0x1

    .line 340
    :cond_7
    mul-int v16, v2, v2

    mul-int v17, v3, v3

    add-int v16, v16, v17

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v16, v0

    goto :goto_4

    .end local v2    # "diffX":I
    .end local v3    # "diffY":I
    .end local v7    # "realX":I
    .end local v8    # "realY":I
    :cond_8
    move v7, v12

    .line 317
    goto :goto_5

    .restart local v7    # "realX":I
    :cond_9
    move v8, v14

    .line 318
    goto :goto_6

    .line 328
    .restart local v8    # "realY":I
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7, v8}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    if-nez v16, :cond_6

    .line 329
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 342
    :cond_b
    add-int/2addr v6, v5

    .line 343
    if-lez v6, :cond_c

    .line 344
    move/from16 v0, p4

    if-eq v14, v0, :cond_1

    .line 347
    add-int/2addr v14, v15

    .line 348
    sub-int/2addr v6, v4

    .line 316
    :cond_c
    add-int/2addr v12, v13

    goto/16 :goto_3
.end method

.method private sizeOfBlackWhiteBlackRunBothWays(IIII)F
    .locals 6
    .param p1, "fromX"    # I
    .param p2, "fromY"    # I
    .param p3, "toX"    # I
    .param p4, "toY"    # I

    .prologue
    .line 259
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRun(IIII)F

    move-result v2

    .line 262
    .local v2, "result":F
    const/high16 v3, 0x3f800000    # 1.0f

    .line 263
    .local v3, "scale":F
    sub-int v4, p3, p1

    sub-int v0, p1, v4

    .line 264
    .local v0, "otherToX":I
    if-gez v0, :cond_2

    .line 265
    int-to-float v4, p1

    sub-int v5, p1, v0

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 266
    const/4 v0, 0x0

    .line 271
    :cond_0
    :goto_0
    int-to-float v4, p2

    sub-int v5, p4, p2

    int-to-float v5, v5

    mul-float/2addr v5, v3

    sub-float/2addr v4, v5

    float-to-int v1, v4

    .line 273
    .local v1, "otherToY":I
    const/high16 v3, 0x3f800000    # 1.0f

    .line 274
    if-gez v1, :cond_3

    .line 275
    int-to-float v4, p2

    sub-int v5, p2, v1

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 276
    const/4 v1, 0x0

    .line 281
    :cond_1
    :goto_1
    int-to-float v4, p1

    sub-int v5, v0, p1

    int-to-float v5, v5

    mul-float/2addr v5, v3

    add-float/2addr v4, v5

    float-to-int v0, v4

    .line 283
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRun(IIII)F

    move-result v4

    add-float/2addr v2, v4

    .line 284
    return v2

    .line 267
    .end local v1    # "otherToY":I
    :cond_2
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v4

    if-le v0, v4, :cond_0

    .line 268
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v4

    sub-int/2addr v4, p1

    int-to-float v4, v4

    sub-int v5, v0, p1

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 269
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    goto :goto_0

    .line 277
    .restart local v1    # "otherToY":I
    :cond_3
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    if-le v1, v4, :cond_1

    .line 278
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    sub-int/2addr v4, p2

    int-to-float v4, v4

    sub-int v5, v1, p2

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 279
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    goto :goto_1
.end method


# virtual methods
.method protected calculateModuleSize(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .locals 2
    .param p1, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p3, "bottomLeft"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 223
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    .line 224
    invoke-direct {p0, p1, p3}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    .line 223
    add-float/2addr v0, v1

    .line 224
    const/high16 v1, 0x40000000    # 2.0f

    .line 223
    div-float/2addr v0, v1

    return v0
.end method

.method public detect()Lcom/google/zxing/common/DetectorResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/zxing/qrcode/detector/Detector;->detect(Ljava/util/Hashtable;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v0

    return-object v0
.end method

.method public detect(Ljava/util/Hashtable;)Lcom/google/zxing/common/DetectorResult;
    .locals 4
    .param p1, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 75
    if-nez p1, :cond_0

    const/4 v2, 0x0

    :goto_0
    iput-object v2, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 78
    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-direct {v0, v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 79
    .local v0, "finder":Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
    invoke-virtual {v0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->find(Ljava/util/Hashtable;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    move-result-object v1

    .line 81
    .local v1, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    invoke-virtual {p0, v1}, Lcom/google/zxing/qrcode/detector/Detector;->processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v2

    return-object v2

    .line 76
    .end local v0    # "finder":Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
    .end local v1    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    :cond_0
    sget-object v2, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {p1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/ResultPointCallback;

    goto :goto_0
.end method

.method protected findAlignmentInRegion(FIIF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .locals 11
    .param p1, "overallEstModuleSize"    # F
    .param p2, "estAlignmentX"    # I
    .param p3, "estAlignmentY"    # I
    .param p4, "allowanceFactor"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/high16 v5, 0x40400000    # 3.0f

    .line 374
    mul-float v1, p4, p1

    float-to-int v10, v1

    .line 375
    .local v10, "allowance":I
    sub-int v1, p2, v10

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 376
    .local v2, "alignmentAreaLeftX":I
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int v4, p2, v10

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 377
    .local v9, "alignmentAreaRightX":I
    sub-int v1, v9, v2

    int-to-float v1, v1

    mul-float v4, p1, v5

    cmpg-float v1, v1, v4

    if-gez v1, :cond_0

    .line 378
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 381
    :cond_0
    sub-int v1, p3, v10

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 382
    .local v3, "alignmentAreaTopY":I
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int v4, p3, v10

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 383
    .local v8, "alignmentAreaBottomY":I
    sub-int v1, v8, v3

    int-to-float v1, v1

    mul-float v4, p1, v5

    cmpg-float v1, v1, v4

    if-gez v1, :cond_1

    .line 384
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 388
    :cond_1
    new-instance v0, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;

    .line 389
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 392
    sub-int v4, v9, v2

    .line 393
    sub-int v5, v8, v3

    .line 395
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    move v6, p1

    .line 388
    invoke-direct/range {v0 .. v7}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;IIIIFLcom/google/zxing/ResultPointCallback;)V

    .line 396
    .local v0, "alignmentFinder":Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->find()Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v1

    return-object v1
.end method

.method protected getImage()Lcom/google/zxing/common/BitMatrix;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected getResultPointCallback()Lcom/google/zxing/ResultPointCallback;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    return-object v0
.end method

.method protected processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;
    .locals 23
    .param p1, "info"    # Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v17

    .line 88
    .local v17, "topLeft":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v18

    .line 89
    .local v18, "topRight":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v5

    .line 91
    .local v5, "bottomLeft":Lcom/google/zxing/qrcode/detector/FinderPattern;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2, v5}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSize(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v13

    .line 92
    .local v13, "moduleSize":F
    const/high16 v20, 0x3f800000    # 1.0f

    cmpg-float v20, v13, v20

    if-gez v20, :cond_0

    .line 93
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v20

    throw v20

    .line 95
    :cond_0
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v5, v13}, Lcom/google/zxing/qrcode/detector/Detector;->computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I

    move-result v9

    .line 96
    .local v9, "dimension":I
    invoke-static {v9}, Lcom/google/zxing/qrcode/decoder/Version;->getProvisionalVersionForDimension(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v16

    .line 97
    .local v16, "provisionalVersion":Lcom/google/zxing/qrcode/decoder/Version;
    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v20

    add-int/lit8 v14, v20, -0x7

    .line 99
    .local v14, "modulesBetweenFPCenters":I
    const/4 v3, 0x0

    .line 101
    .local v3, "alignmentPattern":Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/qrcode/decoder/Version;->getAlignmentPatternCenters()[I

    move-result-object v20

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    if-lez v20, :cond_1

    .line 104
    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v20

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v21

    sub-float v20, v20, v21

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v21

    add-float v6, v20, v21

    .line 105
    .local v6, "bottomRightX":F
    invoke-virtual/range {v18 .. v18}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v20

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v21

    sub-float v20, v20, v21

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v21

    add-float v7, v20, v21

    .line 109
    .local v7, "bottomRightY":F
    const/high16 v20, 0x3f800000    # 1.0f

    const/high16 v21, 0x40400000    # 3.0f

    int-to-float v0, v14

    move/from16 v22, v0

    div-float v21, v21, v22

    sub-float v8, v20, v21

    .line 110
    .local v8, "correctionToTopLeft":F
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v20

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v21

    sub-float v21, v6, v21

    mul-float v21, v21, v8

    add-float v20, v20, v21

    move/from16 v0, v20

    float-to-int v10, v0

    .line 111
    .local v10, "estAlignmentX":I
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v20

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v21

    sub-float v21, v7, v21

    mul-float v21, v21, v8

    add-float v20, v20, v21

    move/from16 v0, v20

    float-to-int v11, v0

    .line 114
    .local v11, "estAlignmentY":I
    const/4 v12, 0x4

    .local v12, "i":I
    :goto_0
    const/16 v20, 0x10

    move/from16 v0, v20

    if-le v12, v0, :cond_2

    .line 129
    .end local v6    # "bottomRightX":F
    .end local v7    # "bottomRightY":F
    .end local v8    # "correctionToTopLeft":F
    .end local v10    # "estAlignmentX":I
    .end local v11    # "estAlignmentY":I
    .end local v12    # "i":I
    :cond_1
    :goto_1
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v5, v3, v9}, Lcom/google/zxing/qrcode/detector/Detector;->createTransform(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v19

    .line 131
    .local v19, "transform":Lcom/google/zxing/common/PerspectiveTransform;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1, v9}, Lcom/google/zxing/qrcode/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/common/PerspectiveTransform;I)Lcom/google/zxing/common/BitMatrix;

    move-result-object v4

    .line 134
    .local v4, "bits":Lcom/google/zxing/common/BitMatrix;
    if-nez v3, :cond_3

    .line 135
    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v15, v0, [Lcom/google/zxing/ResultPoint;

    const/16 v20, 0x0

    aput-object v5, v15, v20

    const/16 v20, 0x1

    aput-object v17, v15, v20

    const/16 v20, 0x2

    aput-object v18, v15, v20

    .line 139
    .local v15, "points":[Lcom/google/zxing/ResultPoint;
    :goto_2
    new-instance v20, Lcom/google/zxing/common/DetectorResult;

    move-object/from16 v0, v20

    invoke-direct {v0, v4, v15}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    return-object v20

    .line 119
    .end local v4    # "bits":Lcom/google/zxing/common/BitMatrix;
    .end local v15    # "points":[Lcom/google/zxing/ResultPoint;
    .end local v19    # "transform":Lcom/google/zxing/common/PerspectiveTransform;
    .restart local v6    # "bottomRightX":F
    .restart local v7    # "bottomRightY":F
    .restart local v8    # "correctionToTopLeft":F
    .restart local v10    # "estAlignmentX":I
    .restart local v11    # "estAlignmentY":I
    .restart local v12    # "i":I
    :cond_2
    int-to-float v0, v12

    move/from16 v20, v0

    .line 116
    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v13, v10, v11, v1}, Lcom/google/zxing/qrcode/detector/Detector;->findAlignmentInRegion(FIIF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_1

    .line 121
    :catch_0
    move-exception v20

    .line 114
    shl-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 137
    .end local v6    # "bottomRightX":F
    .end local v7    # "bottomRightY":F
    .end local v8    # "correctionToTopLeft":F
    .end local v10    # "estAlignmentX":I
    .end local v11    # "estAlignmentY":I
    .end local v12    # "i":I
    .restart local v4    # "bits":Lcom/google/zxing/common/BitMatrix;
    .restart local v19    # "transform":Lcom/google/zxing/common/PerspectiveTransform;
    :cond_3
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v15, v0, [Lcom/google/zxing/ResultPoint;

    const/16 v20, 0x0

    aput-object v5, v15, v20

    const/16 v20, 0x1

    aput-object v17, v15, v20

    const/16 v20, 0x2

    aput-object v18, v15, v20

    const/16 v20, 0x3

    aput-object v3, v15, v20

    .restart local v15    # "points":[Lcom/google/zxing/ResultPoint;
    goto :goto_2
.end method
