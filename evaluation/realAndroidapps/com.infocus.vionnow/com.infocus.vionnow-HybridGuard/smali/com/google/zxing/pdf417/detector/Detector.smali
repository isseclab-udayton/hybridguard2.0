.class public final Lcom/google/zxing/pdf417/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# static fields
.field private static final MAX_AVG_VARIANCE:I = 0x6b

.field private static final MAX_INDIVIDUAL_VARIANCE:I = 0xcc

.field private static final SKEW_THRESHOLD:I = 0x2

.field private static final START_PATTERN:[I

.field private static final START_PATTERN_REVERSE:[I

.field private static final STOP_PATTERN:[I

.field private static final STOP_PATTERN_REVERSE:[I


# instance fields
.field private final image:Lcom/google/zxing/BinaryBitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/16 v2, 0x9

    const/16 v1, 0x8

    .line 43
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN:[I

    .line 46
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN_REVERSE:[I

    .line 49
    new-array v0, v2, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN:[I

    .line 53
    new-array v0, v2, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN_REVERSE:[I

    .line 35
    return-void

    .line 43
    nop

    :array_0
    .array-data 4
        0x8
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    .line 46
    :array_1
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x8
    .end array-data

    .line 49
    :array_2
    .array-data 4
        0x7
        0x1
        0x1
        0x3
        0x1
        0x1
        0x1
        0x2
        0x1
    .end array-data

    .line 53
    :array_3
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x1
        0x3
        0x1
        0x1
        0x7
    .end array-data
.end method

.method public constructor <init>(Lcom/google/zxing/BinaryBitmap;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/BinaryBitmap;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/google/zxing/pdf417/detector/Detector;->image:Lcom/google/zxing/BinaryBitmap;

    .line 59
    return-void
.end method

.method private static computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I
    .locals 3
    .param p0, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p1, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p4, "moduleWidth"    # F

    .prologue
    .line 358
    invoke-static {p0, p1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v2

    div-float/2addr v2, p4

    invoke-static {v2}, Lcom/google/zxing/pdf417/detector/Detector;->round(F)I

    move-result v1

    .line 359
    .local v1, "topRowDimension":I
    invoke-static {p2, p3}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v2

    div-float/2addr v2, p4

    invoke-static {v2}, Lcom/google/zxing/pdf417/detector/Detector;->round(F)I

    move-result v0

    .line 360
    .local v0, "bottomRowDimension":I
    add-int v2, v1, v0

    shr-int/lit8 v2, v2, 0x1

    add-int/lit8 v2, v2, 0x8

    div-int/lit8 v2, v2, 0x11

    mul-int/lit8 v2, v2, 0x11

    return v2
.end method

.method private static computeModuleWidth([Lcom/google/zxing/ResultPoint;)F
    .locals 8
    .param p0, "vertices"    # [Lcom/google/zxing/ResultPoint;

    .prologue
    .line 336
    const/4 v6, 0x0

    aget-object v6, p0, v6

    const/4 v7, 0x4

    aget-object v7, p0, v7

    invoke-static {v6, v7}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v2

    .line 337
    .local v2, "pixels1":F
    const/4 v6, 0x1

    aget-object v6, p0, v6

    const/4 v7, 0x5

    aget-object v7, p0, v7

    invoke-static {v6, v7}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    .line 338
    .local v3, "pixels2":F
    add-float v6, v2, v3

    const/high16 v7, 0x42080000    # 34.0f

    div-float v0, v6, v7

    .line 339
    .local v0, "moduleWidth1":F
    const/4 v6, 0x6

    aget-object v6, p0, v6

    const/4 v7, 0x2

    aget-object v7, p0, v7

    invoke-static {v6, v7}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v4

    .line 340
    .local v4, "pixels3":F
    const/4 v6, 0x7

    aget-object v6, p0, v6

    const/4 v7, 0x3

    aget-object v7, p0, v7

    invoke-static {v6, v7}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    .line 341
    .local v5, "pixels4":F
    add-float v6, v4, v5

    const/high16 v7, 0x42100000    # 36.0f

    div-float v1, v6, v7

    .line 342
    .local v1, "moduleWidth2":F
    add-float v6, v0, v1

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    return v6
.end method

.method private static correctCodeWordVertices([Lcom/google/zxing/ResultPoint;Z)V
    .locals 13
    .param p0, "vertices"    # [Lcom/google/zxing/ResultPoint;
    .param p1, "upsideDown"    # Z

    .prologue
    const/high16 v12, 0x40000000    # 2.0f

    const/4 v11, 0x7

    const/4 v10, 0x6

    const/4 v9, 0x5

    const/4 v8, 0x4

    .line 279
    aget-object v5, p0, v8

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v10

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v4, v5, v6

    .line 280
    .local v4, "skew":F
    if-eqz p1, :cond_0

    .line 281
    neg-float v4, v4

    .line 283
    :cond_0
    cmpl-float v5, v4, v12

    if-lez v5, :cond_4

    .line 285
    aget-object v5, p0, v8

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v3, v5, v6

    .line 286
    .local v3, "length":F
    aget-object v5, p0, v10

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v1, v5, v6

    .line 287
    .local v1, "deltax":F
    aget-object v5, p0, v10

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v2, v5, v6

    .line 288
    .local v2, "deltay":F
    mul-float v5, v3, v2

    div-float v0, v5, v1

    .line 289
    .local v0, "correction":F
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget-object v6, p0, v8

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    aget-object v7, p0, v8

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    add-float/2addr v7, v0

    invoke-direct {v5, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v5, p0, v8

    .line 299
    .end local v0    # "correction":F
    .end local v1    # "deltax":F
    .end local v2    # "deltay":F
    .end local v3    # "length":F
    :cond_1
    :goto_0
    aget-object v5, p0, v11

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v9

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v4, v5, v6

    .line 300
    if-eqz p1, :cond_2

    .line 301
    neg-float v4, v4

    .line 303
    :cond_2
    cmpl-float v5, v4, v12

    if-lez v5, :cond_5

    .line 305
    aget-object v5, p0, v9

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    const/4 v6, 0x1

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v3, v5, v6

    .line 306
    .restart local v3    # "length":F
    aget-object v5, p0, v11

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    const/4 v6, 0x1

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v1, v5, v6

    .line 307
    .restart local v1    # "deltax":F
    aget-object v5, p0, v11

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    const/4 v6, 0x1

    aget-object v6, p0, v6

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v2, v5, v6

    .line 308
    .restart local v2    # "deltay":F
    mul-float v5, v3, v2

    div-float v0, v5, v1

    .line 309
    .restart local v0    # "correction":F
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget-object v6, p0, v9

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    aget-object v7, p0, v9

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    add-float/2addr v7, v0

    invoke-direct {v5, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v5, p0, v9

    .line 318
    .end local v0    # "correction":F
    .end local v1    # "deltax":F
    .end local v2    # "deltay":F
    .end local v3    # "length":F
    :cond_3
    :goto_1
    return-void

    .line 290
    :cond_4
    neg-float v5, v4

    cmpl-float v5, v5, v12

    if-lez v5, :cond_1

    .line 292
    const/4 v5, 0x2

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    aget-object v6, p0, v10

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v3, v5, v6

    .line 293
    .restart local v3    # "length":F
    const/4 v5, 0x2

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    aget-object v6, p0, v8

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v1, v5, v6

    .line 294
    .restart local v1    # "deltax":F
    const/4 v5, 0x2

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v8

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v2, v5, v6

    .line 295
    .restart local v2    # "deltay":F
    mul-float v5, v3, v2

    div-float v0, v5, v1

    .line 296
    .restart local v0    # "correction":F
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget-object v6, p0, v10

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    aget-object v7, p0, v10

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    sub-float/2addr v7, v0

    invoke-direct {v5, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v5, p0, v10

    goto/16 :goto_0

    .line 310
    .end local v0    # "correction":F
    .end local v1    # "deltax":F
    .end local v2    # "deltay":F
    .end local v3    # "length":F
    :cond_5
    neg-float v5, v4

    cmpl-float v5, v5, v12

    if-lez v5, :cond_3

    .line 312
    const/4 v5, 0x3

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    aget-object v6, p0, v11

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v3, v5, v6

    .line 313
    .restart local v3    # "length":F
    const/4 v5, 0x3

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    aget-object v6, p0, v9

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float v1, v5, v6

    .line 314
    .restart local v1    # "deltax":F
    const/4 v5, 0x3

    aget-object v5, p0, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v9

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float v2, v5, v6

    .line 315
    .restart local v2    # "deltay":F
    mul-float v5, v3, v2

    div-float v0, v5, v1

    .line 316
    .restart local v0    # "correction":F
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget-object v6, p0, v11

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    aget-object v7, p0, v11

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    sub-float/2addr v7, v0

    invoke-direct {v5, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v5, p0, v11

    goto/16 :goto_1
.end method

.method private static findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I
    .locals 10
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "column"    # I
    .param p2, "row"    # I
    .param p3, "width"    # I
    .param p4, "whiteFirst"    # Z
    .param p5, "pattern"    # [I

    .prologue
    .line 420
    array-length v3, p5

    .line 423
    .local v3, "patternLength":I
    new-array v1, v3, [I

    .line 424
    .local v1, "counters":[I
    move v2, p4

    .line 426
    .local v2, "isWhite":Z
    const/4 v0, 0x0

    .line 427
    .local v0, "counterPosition":I
    move v4, p1

    .line 428
    .local v4, "patternStart":I
    move v6, p1

    .local v6, "x":I
    :goto_0
    add-int v8, p1, p3

    if-lt v6, v8, :cond_0

    .line 451
    const/4 v8, 0x0

    :goto_1
    return-object v8

    .line 429
    :cond_0
    invoke-virtual {p0, v6, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    .line 430
    .local v5, "pixel":Z
    xor-int v8, v5, v2

    if-eqz v8, :cond_1

    .line 431
    aget v8, v1, v0

    add-int/lit8 v8, v8, 0x1

    aput v8, v1, v0

    .line 428
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 433
    :cond_1
    add-int/lit8 v8, v3, -0x1

    if-ne v0, v8, :cond_4

    .line 434
    const/16 v8, 0xcc

    invoke-static {v1, p5, v8}, Lcom/google/zxing/pdf417/detector/Detector;->patternMatchVariance([I[II)I

    move-result v8

    const/16 v9, 0x6b

    if-ge v8, v9, :cond_2

    .line 435
    const/4 v8, 0x2

    new-array v8, v8, [I

    const/4 v9, 0x0

    aput v4, v8, v9

    const/4 v9, 0x1

    aput v6, v8, v9

    goto :goto_1

    .line 437
    :cond_2
    const/4 v8, 0x0

    aget v8, v1, v8

    const/4 v9, 0x1

    aget v9, v1, v9

    add-int/2addr v8, v9

    add-int/2addr v4, v8

    .line 438
    const/4 v7, 0x2

    .local v7, "y":I
    :goto_3
    if-lt v7, v3, :cond_3

    .line 441
    add-int/lit8 v8, v3, -0x2

    const/4 v9, 0x0

    aput v9, v1, v8

    .line 442
    add-int/lit8 v8, v3, -0x1

    const/4 v9, 0x0

    aput v9, v1, v8

    .line 443
    add-int/lit8 v0, v0, -0x1

    .line 447
    .end local v7    # "y":I
    :goto_4
    const/4 v8, 0x1

    aput v8, v1, v0

    .line 448
    if-eqz v2, :cond_5

    const/4 v2, 0x0

    :goto_5
    goto :goto_2

    .line 439
    .restart local v7    # "y":I
    :cond_3
    add-int/lit8 v8, v7, -0x2

    aget v9, v1, v7

    aput v9, v1, v8

    .line 438
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 445
    .end local v7    # "y":I
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 448
    :cond_5
    const/4 v2, 0x1

    goto :goto_5
.end method

.method private static findVertices(Lcom/google/zxing/common/BitMatrix;)[Lcom/google/zxing/ResultPoint;
    .locals 12
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    const/4 v11, 0x1

    const/4 v1, 0x0

    .line 133
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    .line 134
    .local v7, "height":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    .line 136
    .local v3, "width":I
    const/16 v0, 0x8

    new-array v9, v0, [Lcom/google/zxing/ResultPoint;

    .line 137
    .local v9, "result":[Lcom/google/zxing/ResultPoint;
    const/4 v6, 0x0

    .line 140
    .local v6, "found":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v7, :cond_3

    .line 150
    :goto_1
    if-eqz v6, :cond_0

    .line 151
    const/4 v6, 0x0

    .line 152
    add-int/lit8 v2, v7, -0x1

    :goto_2
    if-gtz v2, :cond_5

    .line 163
    :cond_0
    :goto_3
    if-eqz v6, :cond_1

    .line 164
    const/4 v6, 0x0

    .line 165
    const/4 v2, 0x0

    :goto_4
    if-lt v2, v7, :cond_7

    .line 176
    :cond_1
    :goto_5
    if-eqz v6, :cond_2

    .line 177
    const/4 v6, 0x0

    .line 178
    add-int/lit8 v2, v7, -0x1

    :goto_6
    if-gtz v2, :cond_9

    .line 188
    :cond_2
    :goto_7
    if-eqz v6, :cond_b

    .end local v9    # "result":[Lcom/google/zxing/ResultPoint;
    :goto_8
    return-object v9

    .line 141
    .restart local v9    # "result":[Lcom/google/zxing/ResultPoint;
    :cond_3
    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN:[I

    move-object v0, p0

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v8

    .line 142
    .local v8, "loc":[I
    if-eqz v8, :cond_4

    .line 143
    new-instance v0, Lcom/google/zxing/ResultPoint;

    aget v4, v8, v1

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v0, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v0, v9, v1

    .line 144
    const/4 v0, 0x4

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v8, v11

    int-to-float v5, v5

    int-to-float v10, v2

    invoke-direct {v4, v5, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 145
    const/4 v6, 0x1

    .line 146
    goto :goto_1

    .line 140
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 153
    .end local v8    # "loc":[I
    :cond_5
    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN:[I

    move-object v0, p0

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v8

    .line 154
    .restart local v8    # "loc":[I
    if-eqz v8, :cond_6

    .line 155
    new-instance v0, Lcom/google/zxing/ResultPoint;

    aget v4, v8, v1

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v0, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v0, v9, v11

    .line 156
    const/4 v0, 0x5

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v8, v11

    int-to-float v5, v5

    int-to-float v10, v2

    invoke-direct {v4, v5, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 157
    const/4 v6, 0x1

    .line 158
    goto :goto_3

    .line 152
    :cond_6
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 166
    .end local v8    # "loc":[I
    :cond_7
    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN:[I

    move-object v0, p0

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v8

    .line 167
    .restart local v8    # "loc":[I
    if-eqz v8, :cond_8

    .line 168
    const/4 v0, 0x2

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v8, v11

    int-to-float v5, v5

    int-to-float v10, v2

    invoke-direct {v4, v5, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 169
    const/4 v0, 0x6

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v8, v1

    int-to-float v5, v5

    int-to-float v10, v2

    invoke-direct {v4, v5, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 170
    const/4 v6, 0x1

    .line 171
    goto :goto_5

    .line 165
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 179
    .end local v8    # "loc":[I
    :cond_9
    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN:[I

    move-object v0, p0

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v8

    .line 180
    .restart local v8    # "loc":[I
    if-eqz v8, :cond_a

    .line 181
    const/4 v0, 0x3

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v8, v11

    int-to-float v5, v5

    int-to-float v10, v2

    invoke-direct {v4, v5, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 182
    const/4 v0, 0x7

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v1, v8, v1

    int-to-float v1, v1

    int-to-float v5, v2

    invoke-direct {v4, v1, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v9, v0

    .line 183
    const/4 v6, 0x1

    .line 184
    goto/16 :goto_7

    .line 178
    :cond_a
    add-int/lit8 v2, v2, -0x1

    goto/16 :goto_6

    .line 188
    .end local v8    # "loc":[I
    :cond_b
    const/4 v9, 0x0

    goto/16 :goto_8
.end method

.method private static findVertices180(Lcom/google/zxing/common/BitMatrix;)[Lcom/google/zxing/ResultPoint;
    .locals 14
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v10

    .line 212
    .local v10, "height":I
    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v13

    .line 213
    .local v13, "width":I
    shr-int/lit8 v1, v13, 0x1

    .line 215
    .local v1, "halfWidth":I
    const/16 v0, 0x8

    new-array v12, v0, [Lcom/google/zxing/ResultPoint;

    .line 216
    .local v12, "result":[Lcom/google/zxing/ResultPoint;
    const/4 v9, 0x0

    .line 219
    .local v9, "found":Z
    add-int/lit8 v2, v10, -0x1

    .local v2, "i":I
    :goto_0
    if-gtz v2, :cond_3

    .line 229
    :goto_1
    if-eqz v9, :cond_0

    .line 230
    const/4 v9, 0x0

    .line 231
    const/4 v2, 0x0

    :goto_2
    if-lt v2, v10, :cond_5

    .line 242
    :cond_0
    :goto_3
    if-eqz v9, :cond_1

    .line 243
    const/4 v9, 0x0

    .line 244
    add-int/lit8 v2, v10, -0x1

    :goto_4
    if-gtz v2, :cond_7

    .line 255
    :cond_1
    :goto_5
    if-eqz v9, :cond_2

    .line 256
    const/4 v9, 0x0

    .line 257
    const/4 v2, 0x0

    :goto_6
    if-lt v2, v10, :cond_9

    .line 267
    :cond_2
    :goto_7
    if-eqz v9, :cond_b

    .end local v12    # "result":[Lcom/google/zxing/ResultPoint;
    :goto_8
    return-object v12

    .line 220
    .restart local v12    # "result":[Lcom/google/zxing/ResultPoint;
    :cond_3
    const/4 v4, 0x1

    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN_REVERSE:[I

    move-object v0, p0

    move v3, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v11

    .line 221
    .local v11, "loc":[I
    if-eqz v11, :cond_4

    .line 222
    const/4 v0, 0x0

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x1

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 223
    const/4 v0, 0x4

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x0

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 224
    const/4 v9, 0x1

    .line 225
    goto :goto_1

    .line 219
    :cond_4
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 232
    .end local v11    # "loc":[I
    :cond_5
    const/4 v4, 0x1

    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN_REVERSE:[I

    move-object v0, p0

    move v3, v1

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v11

    .line 233
    .restart local v11    # "loc":[I
    if-eqz v11, :cond_6

    .line 234
    const/4 v0, 0x1

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x1

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 235
    const/4 v0, 0x5

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x0

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 236
    const/4 v9, 0x1

    .line 237
    goto :goto_3

    .line 231
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 245
    .end local v11    # "loc":[I
    :cond_7
    const/4 v4, 0x0

    const/4 v7, 0x0

    sget-object v8, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN_REVERSE:[I

    move-object v3, p0

    move v5, v2

    move v6, v1

    invoke-static/range {v3 .. v8}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v11

    .line 246
    .restart local v11    # "loc":[I
    if-eqz v11, :cond_8

    .line 247
    const/4 v0, 0x2

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x0

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 248
    const/4 v0, 0x6

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x1

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 249
    const/4 v9, 0x1

    .line 250
    goto/16 :goto_5

    .line 244
    :cond_8
    add-int/lit8 v2, v2, -0x1

    goto/16 :goto_4

    .line 258
    .end local v11    # "loc":[I
    :cond_9
    const/4 v4, 0x0

    const/4 v7, 0x0

    sget-object v8, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN_REVERSE:[I

    move-object v3, p0

    move v5, v2

    move v6, v1

    invoke-static/range {v3 .. v8}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I)[I

    move-result-object v11

    .line 259
    .restart local v11    # "loc":[I
    if-eqz v11, :cond_a

    .line 260
    const/4 v0, 0x3

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x0

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 261
    const/4 v0, 0x7

    new-instance v3, Lcom/google/zxing/ResultPoint;

    const/4 v4, 0x1

    aget v4, v11, v4

    int-to-float v4, v4

    int-to-float v5, v2

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v12, v0

    .line 262
    const/4 v9, 0x1

    .line 263
    goto/16 :goto_7

    .line 257
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 267
    .end local v11    # "loc":[I
    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_8
.end method

.method private static patternMatchVariance([I[II)I
    .locals 12
    .param p0, "counters"    # [I
    .param p1, "pattern"    # [I
    .param p2, "maxIndividualVariance"    # I

    .prologue
    const v10, 0x7fffffff

    .line 470
    array-length v2, p0

    .line 471
    .local v2, "numCounters":I
    const/4 v5, 0x0

    .line 472
    .local v5, "total":I
    const/4 v3, 0x0

    .line 473
    .local v3, "patternLength":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_1

    .line 477
    if-ge v5, v3, :cond_2

    .line 498
    :cond_0
    :goto_1
    return v10

    .line 474
    :cond_1
    aget v11, p0, v1

    add-int/2addr v5, v11

    .line 475
    aget v11, p1, v1

    add-int/2addr v3, v11

    .line 473
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 485
    :cond_2
    shl-int/lit8 v11, v5, 0x8

    div-int v7, v11, v3

    .line 486
    .local v7, "unitBarWidth":I
    mul-int v11, p2, v7

    shr-int/lit8 p2, v11, 0x8

    .line 488
    const/4 v6, 0x0

    .line 489
    .local v6, "totalVariance":I
    const/4 v9, 0x0

    .local v9, "x":I
    :goto_2
    if-lt v9, v2, :cond_3

    .line 498
    div-int v10, v6, v5

    goto :goto_1

    .line 490
    :cond_3
    aget v11, p0, v9

    shl-int/lit8 v0, v11, 0x8

    .line 491
    .local v0, "counter":I
    aget v11, p1, v9

    mul-int v4, v11, v7

    .line 492
    .local v4, "scaledPattern":I
    if-le v0, v4, :cond_4

    sub-int v8, v0, v4

    .line 493
    .local v8, "variance":I
    :goto_3
    if-gt v8, p2, :cond_0

    .line 496
    add-int/2addr v6, v8

    .line 489
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 492
    .end local v8    # "variance":I
    :cond_4
    sub-int v8, v4, v0

    goto :goto_3
.end method

.method private static round(F)I
    .locals 1
    .param p0, "d"    # F

    .prologue
    .line 406
    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr v0, p0

    float-to-int v0, v0

    return v0
.end method

.method private static sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/BitMatrix;
    .locals 21
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p4, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "dimension"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 378
    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v1

    .line 383
    .local v1, "sampler":Lcom/google/zxing/common/GridSampler;
    const/4 v5, 0x0

    .line 384
    const/4 v6, 0x0

    .line 385
    move/from16 v0, p5

    int-to-float v7, v0

    .line 386
    const/4 v8, 0x0

    .line 387
    move/from16 v0, p5

    int-to-float v9, v0

    .line 388
    move/from16 v0, p5

    int-to-float v10, v0

    .line 389
    const/4 v11, 0x0

    .line 390
    move/from16 v0, p5

    int-to-float v12, v0

    .line 391
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v13

    .line 392
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v14

    .line 393
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v15

    .line 394
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    .line 395
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v17

    .line 396
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v18

    .line 397
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v19

    .line 398
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v20

    move-object/from16 v2, p0

    move/from16 v3, p5

    move/from16 v4, p5

    .line 380
    invoke-virtual/range {v1 .. v20}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public detect()Lcom/google/zxing/common/DetectorResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/zxing/pdf417/detector/Detector;->detect(Ljava/util/Hashtable;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v0

    return-object v0
.end method

.method public detect(Ljava/util/Hashtable;)Lcom/google/zxing/common/DetectorResult;
    .locals 14
    .param p1, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x7

    const/4 v12, 0x6

    const/4 v11, 0x5

    const/4 v10, 0x1

    const/4 v9, 0x4

    .line 80
    iget-object v1, p0, Lcom/google/zxing/pdf417/detector/Detector;->image:Lcom/google/zxing/BinaryBitmap;

    invoke-virtual {v1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    .line 83
    .local v0, "matrix":Lcom/google/zxing/common/BitMatrix;
    invoke-static {v0}, Lcom/google/zxing/pdf417/detector/Detector;->findVertices(Lcom/google/zxing/common/BitMatrix;)[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 84
    .local v8, "vertices":[Lcom/google/zxing/ResultPoint;
    if-nez v8, :cond_1

    .line 86
    invoke-static {v0}, Lcom/google/zxing/pdf417/detector/Detector;->findVertices180(Lcom/google/zxing/common/BitMatrix;)[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 87
    if-eqz v8, :cond_0

    .line 88
    invoke-static {v8, v10}, Lcom/google/zxing/pdf417/detector/Detector;->correctCodeWordVertices([Lcom/google/zxing/ResultPoint;Z)V

    .line 94
    :cond_0
    :goto_0
    if-nez v8, :cond_2

    .line 95
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 91
    :cond_1
    const/4 v1, 0x0

    invoke-static {v8, v1}, Lcom/google/zxing/pdf417/detector/Detector;->correctCodeWordVertices([Lcom/google/zxing/ResultPoint;Z)V

    goto :goto_0

    .line 98
    :cond_2
    invoke-static {v8}, Lcom/google/zxing/pdf417/detector/Detector;->computeModuleWidth([Lcom/google/zxing/ResultPoint;)F

    move-result v7

    .line 99
    .local v7, "moduleWidth":F
    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v1, v7, v1

    if-gez v1, :cond_3

    .line 100
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 103
    :cond_3
    aget-object v1, v8, v9

    aget-object v2, v8, v12

    .line 104
    aget-object v3, v8, v11

    aget-object v4, v8, v13

    .line 103
    invoke-static {v1, v2, v3, v4, v7}, Lcom/google/zxing/pdf417/detector/Detector;->computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I

    move-result v5

    .line 105
    .local v5, "dimension":I
    if-ge v5, v10, :cond_4

    .line 106
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    .line 110
    :cond_4
    aget-object v1, v8, v9

    aget-object v2, v8, v11

    .line 111
    aget-object v3, v8, v12

    aget-object v4, v8, v13

    .line 110
    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/BitMatrix;

    move-result-object v6

    .line 112
    .local v6, "bits":Lcom/google/zxing/common/BitMatrix;
    new-instance v1, Lcom/google/zxing/common/DetectorResult;

    new-array v2, v9, [Lcom/google/zxing/ResultPoint;

    const/4 v3, 0x0

    aget-object v4, v8, v9

    aput-object v4, v2, v3

    .line 113
    aget-object v3, v8, v11

    aput-object v3, v2, v10

    const/4 v3, 0x2

    aget-object v4, v8, v12

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aget-object v4, v8, v13

    aput-object v4, v2, v3

    .line 112
    invoke-direct {v1, v6, v2}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    return-object v1
.end method
