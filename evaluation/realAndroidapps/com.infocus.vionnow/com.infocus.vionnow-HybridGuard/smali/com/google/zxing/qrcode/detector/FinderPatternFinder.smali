.class public Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.super Ljava/lang/Object;
.source "FinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;,
        Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;
    }
.end annotation


# static fields
.field private static final CENTER_QUORUM:I = 0x2

.field private static final INTEGER_MATH_SHIFT:I = 0x8

.field protected static final MAX_MODULES:I = 0x39

.field protected static final MIN_SKIP:I = 0x3


# instance fields
.field private final crossCheckStateCount:[I

.field private hasSkipped:Z

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final possibleCenters:Ljava/util/Vector;

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 62
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    .line 63
    const/4 v0, 0x5

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    .line 64
    iput-object p2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 65
    return-void
.end method

.method private static centerFromEnd([II)F
    .locals 3
    .param p0, "stateCount"    # [I
    .param p1, "end"    # I

    .prologue
    .line 189
    const/4 v0, 0x4

    aget v0, p0, v0

    sub-int v0, p1, v0

    const/4 v1, 0x3

    aget v1, p0, v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private crossCheckHorizontal(IIII)F
    .locals 7
    .param p1, "startJ"    # I
    .param p2, "centerI"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .prologue
    .line 313
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 315
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    .line 316
    .local v2, "maxJ":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v3

    .line 318
    .local v3, "stateCount":[I
    move v1, p1

    .line 319
    .local v1, "j":I
    :goto_0
    if-ltz v1, :cond_0

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_1

    .line 323
    :cond_0
    if-gez v1, :cond_3

    .line 324
    const/high16 v5, 0x7fc00000    # Float.NaN

    .line 372
    :goto_1
    return v5

    .line 320
    :cond_1
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 321
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 327
    :cond_2
    const/4 v5, 0x1

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 328
    add-int/lit8 v1, v1, -0x1

    .line 326
    :cond_3
    if-ltz v1, :cond_4

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_2

    .line 330
    :cond_4
    if-ltz v1, :cond_5

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_7

    .line 331
    :cond_5
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 334
    :cond_6
    const/4 v5, 0x0

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 335
    add-int/lit8 v1, v1, -0x1

    .line 333
    :cond_7
    if-ltz v1, :cond_8

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_6

    .line 337
    :cond_8
    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_9

    .line 338
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 341
    :cond_9
    add-int/lit8 v1, p1, 0x1

    .line 342
    :goto_2
    if-ge v1, v2, :cond_a

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_b

    .line 346
    :cond_a
    if-ne v1, v2, :cond_d

    .line 347
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 343
    :cond_b
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 344
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 350
    :cond_c
    const/4 v5, 0x3

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 351
    add-int/lit8 v1, v1, 0x1

    .line 349
    :cond_d
    if-ge v1, v2, :cond_e

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_e

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_c

    .line 353
    :cond_e
    if-eq v1, v2, :cond_f

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_11

    .line 354
    :cond_f
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 357
    :cond_10
    const/4 v5, 0x4

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 358
    add-int/lit8 v1, v1, 0x1

    .line 356
    :cond_11
    if-ge v1, v2, :cond_12

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_12

    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_10

    .line 360
    :cond_12
    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_13

    .line 361
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 366
    :cond_13
    const/4 v5, 0x0

    aget v5, v3, v5

    const/4 v6, 0x1

    aget v6, v3, v6

    add-int/2addr v5, v6

    const/4 v6, 0x2

    aget v6, v3, v6

    add-int/2addr v5, v6

    const/4 v6, 0x3

    aget v6, v3, v6

    add-int/2addr v5, v6

    .line 367
    const/4 v6, 0x4

    aget v6, v3, v6

    .line 366
    add-int v4, v5, v6

    .line 368
    .local v4, "stateCountTotal":I
    sub-int v5, v4, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x5

    if-lt v5, p4, :cond_14

    .line 369
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 372
    :cond_14
    invoke-static {v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v5

    if-eqz v5, :cond_15

    invoke-static {v3, v1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v5

    goto/16 :goto_1

    :cond_15
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1
.end method

.method private crossCheckVertical(IIII)F
    .locals 7
    .param p1, "startI"    # I
    .param p2, "centerJ"    # I
    .param p3, "maxCount"    # I
    .param p4, "originalStateCountTotal"    # I

    .prologue
    .line 241
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 243
    .local v1, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    .line 244
    .local v2, "maxI":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v3

    .line 247
    .local v3, "stateCount":[I
    move v0, p1

    .line 248
    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_1

    .line 252
    :cond_0
    if-gez v0, :cond_3

    .line 253
    const/high16 v5, 0x7fc00000    # Float.NaN

    .line 303
    :goto_1
    return v5

    .line 249
    :cond_1
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 250
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 256
    :cond_2
    const/4 v5, 0x1

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 257
    add-int/lit8 v0, v0, -0x1

    .line 255
    :cond_3
    if-ltz v0, :cond_4

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_2

    .line 260
    :cond_4
    if-ltz v0, :cond_5

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_7

    .line 261
    :cond_5
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 264
    :cond_6
    const/4 v5, 0x0

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 265
    add-int/lit8 v0, v0, -0x1

    .line 263
    :cond_7
    if-ltz v0, :cond_8

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_6

    .line 267
    :cond_8
    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_9

    .line 268
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 272
    :cond_9
    add-int/lit8 v0, p1, 0x1

    .line 273
    :goto_2
    if-ge v0, v2, :cond_a

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_b

    .line 277
    :cond_a
    if-ne v0, v2, :cond_d

    .line 278
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 274
    :cond_b
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 275
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 281
    :cond_c
    const/4 v5, 0x3

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 282
    add-int/lit8 v0, v0, 0x1

    .line 280
    :cond_d
    if-ge v0, v2, :cond_e

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_e

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_c

    .line 284
    :cond_e
    if-eq v0, v2, :cond_f

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_11

    .line 285
    :cond_f
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 288
    :cond_10
    const/4 v5, 0x4

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 289
    add-int/lit8 v0, v0, 0x1

    .line 287
    :cond_11
    if-ge v0, v2, :cond_12

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_12

    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_10

    .line 291
    :cond_12
    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_13

    .line 292
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 297
    :cond_13
    const/4 v5, 0x0

    aget v5, v3, v5

    const/4 v6, 0x1

    aget v6, v3, v6

    add-int/2addr v5, v6

    const/4 v6, 0x2

    aget v6, v3, v6

    add-int/2addr v5, v6

    const/4 v6, 0x3

    aget v6, v3, v6

    add-int/2addr v5, v6

    .line 298
    const/4 v6, 0x4

    aget v6, v3, v6

    .line 297
    add-int v4, v5, v6

    .line 299
    .local v4, "stateCountTotal":I
    sub-int v5, v4, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x5

    mul-int/lit8 v6, p4, 0x2

    if-lt v5, v6, :cond_14

    .line 300
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 303
    :cond_14
    invoke-static {v3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v5

    if-eqz v5, :cond_15

    invoke-static {v3, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v5

    goto/16 :goto_1

    :cond_15
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1
.end method

.method private findRowSkip()I
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v4, 0x0

    .line 432
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v3

    .line 433
    .local v3, "max":I
    if-gt v3, v7, :cond_1

    .line 454
    :cond_0
    :goto_0
    return v4

    .line 436
    :cond_1
    const/4 v1, 0x0

    .line 437
    .local v1, "firstConfirmedCenter":Lcom/google/zxing/qrcode/detector/FinderPattern;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_0

    .line 438
    iget-object v5, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 439
    .local v0, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v5

    const/4 v6, 0x2

    if-lt v5, v6, :cond_2

    .line 440
    if-nez v1, :cond_3

    .line 441
    move-object v1, v0

    .line 437
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 448
    :cond_3
    iput-boolean v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    .line 449
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v4

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 450
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    .line 449
    sub-float/2addr v4, v5

    float-to-int v4, v4

    div-int/lit8 v4, v4, 0x2

    goto :goto_0
.end method

.method protected static foundPatternCross([I)Z
    .locals 9
    .param p0, "stateCount"    # [I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 198
    const/4 v4, 0x0

    .line 199
    .local v4, "totalModuleSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v7, 0x5

    if-lt v1, v7, :cond_1

    .line 206
    const/4 v7, 0x7

    if-ge v4, v7, :cond_2

    .line 216
    :cond_0
    :goto_1
    return v5

    .line 200
    :cond_1
    aget v0, p0, v1

    .line 201
    .local v0, "count":I
    if-eqz v0, :cond_0

    .line 204
    add-int/2addr v4, v0

    .line 199
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 209
    .end local v0    # "count":I
    :cond_2
    shl-int/lit8 v7, v4, 0x8

    div-int/lit8 v3, v7, 0x7

    .line 210
    .local v3, "moduleSize":I
    div-int/lit8 v2, v3, 0x2

    .line 212
    .local v2, "maxVariance":I
    aget v7, p0, v5

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 213
    aget v7, p0, v6

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 214
    mul-int/lit8 v7, v3, 0x3

    const/4 v8, 0x2

    aget v8, p0, v8

    shl-int/lit8 v8, v8, 0x8

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    mul-int/lit8 v8, v2, 0x3

    if-ge v7, v8, :cond_0

    .line 215
    const/4 v7, 0x3

    aget v7, p0, v7

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 216
    const/4 v7, 0x4

    aget v7, p0, v7

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    move v5, v6

    goto :goto_1
.end method

.method private getCrossCheckStateCount()[I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    aput v2, v0, v2

    .line 221
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 222
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x2

    aput v2, v0, v1

    .line 223
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x3

    aput v2, v0, v1

    .line 224
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x4

    aput v2, v0, v1

    .line 225
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    return-object v0
.end method

.method private haveMultiplyConfirmedCenters()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 463
    const/4 v1, 0x0

    .line 464
    .local v1, "confirmedCount":I
    const/4 v6, 0x0

    .line 465
    .local v6, "totalModuleSize":F
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v3

    .line 466
    .local v3, "max":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v3, :cond_1

    .line 473
    const/4 v8, 0x3

    if-ge v1, v8, :cond_3

    .line 486
    :cond_0
    :goto_1
    return v7

    .line 467
    :cond_1
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v8, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 468
    .local v4, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v8

    const/4 v9, 0x2

    if-lt v8, v9, :cond_2

    .line 469
    add-int/lit8 v1, v1, 0x1

    .line 470
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    add-float/2addr v6, v8

    .line 466
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 480
    .end local v4    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_3
    int-to-float v8, v3

    div-float v0, v6, v8

    .line 481
    .local v0, "average":F
    const/4 v5, 0x0

    .line 482
    .local v5, "totalDeviation":F
    const/4 v2, 0x0

    :goto_2
    if-lt v2, v3, :cond_4

    .line 486
    const v8, 0x3d4ccccd    # 0.05f

    mul-float/2addr v8, v6

    cmpg-float v8, v5, v8

    if-gtz v8, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    .line 483
    :cond_4
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v8, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 484
    .restart local v4    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    sub-float/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v5, v8

    .line 482
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 497
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v6

    .line 498
    .local v6, "startSize":I
    const/4 v9, 0x3

    if-ge v6, v9, :cond_0

    .line 500
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    .line 504
    :cond_0
    const/4 v9, 0x3

    if-le v6, v9, :cond_1

    .line 506
    const/4 v8, 0x0

    .line 507
    .local v8, "totalModuleSize":F
    const/4 v5, 0x0

    .line 508
    .local v5, "square":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v6, :cond_3

    .line 513
    int-to-float v9, v6

    div-float v0, v8, v9

    .line 514
    .local v0, "average":F
    int-to-float v9, v6

    div-float v9, v5, v9

    mul-float v10, v0, v0

    sub-float/2addr v9, v10

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v9

    double-to-float v7, v9

    .line 516
    .local v7, "stdDev":F
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    new-instance v10, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;)V

    invoke-static {v9, v10}, Lcom/google/zxing/common/Collections;->insertionSort(Ljava/util/Vector;Lcom/google/zxing/common/Comparator;)V

    .line 518
    const v9, 0x3e4ccccd    # 0.2f

    mul-float/2addr v9, v0

    invoke-static {v9, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 520
    .local v2, "limit":F
    const/4 v1, 0x0

    :goto_1
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-ge v1, v9, :cond_1

    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    const/4 v10, 0x3

    if-gt v9, v10, :cond_4

    .line 529
    .end local v0    # "average":F
    .end local v1    # "i":I
    .end local v2    # "limit":F
    .end local v5    # "square":F
    .end local v7    # "stdDev":F
    .end local v8    # "totalModuleSize":F
    :cond_1
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    const/4 v10, 0x3

    if-le v9, v10, :cond_2

    .line 532
    const/4 v8, 0x0

    .line 533
    .restart local v8    # "totalModuleSize":F
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-lt v1, v9, :cond_6

    .line 537
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    int-to-float v9, v9

    div-float v0, v8, v9

    .line 539
    .restart local v0    # "average":F
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    new-instance v10, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;)V

    invoke-static {v9, v10}, Lcom/google/zxing/common/Collections;->insertionSort(Ljava/util/Vector;Lcom/google/zxing/common/Comparator;)V

    .line 541
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Ljava/util/Vector;->setSize(I)V

    .line 544
    .end local v0    # "average":F
    .end local v1    # "i":I
    .end local v8    # "totalModuleSize":F
    :cond_2
    const/4 v9, 0x3

    new-array v10, v9, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    const/4 v11, 0x0

    .line 545
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v9, v10, v11

    const/4 v11, 0x1

    .line 546
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v9, v10, v11

    const/4 v11, 0x2

    .line 547
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    const/4 v12, 0x2

    invoke-virtual {v9, v12}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v9, v10, v11

    .line 544
    return-object v10

    .line 509
    .restart local v1    # "i":I
    .restart local v5    # "square":F
    .restart local v8    # "totalModuleSize":F
    :cond_3
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v9}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    .line 510
    .local v4, "size":F
    add-float/2addr v8, v4

    .line 511
    mul-float v9, v4, v4

    add-float/2addr v5, v9

    .line 508
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 521
    .end local v4    # "size":F
    .restart local v0    # "average":F
    .restart local v2    # "limit":F
    .restart local v7    # "stdDev":F
    :cond_4
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 522
    .local v3, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v9

    sub-float/2addr v9, v0

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpl-float v9, v9, v2

    if-lez v9, :cond_5

    .line 523
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 524
    add-int/lit8 v1, v1, -0x1

    .line 520
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 534
    .end local v0    # "average":F
    .end local v2    # "limit":F
    .end local v3    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v5    # "square":F
    .end local v7    # "stdDev":F
    :cond_6
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-virtual {v9}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v9

    add-float/2addr v8, v9

    .line 533
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2
.end method


# virtual methods
.method find(Ljava/util/Hashtable;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .locals 14
    .param p1, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 76
    if-eqz p1, :cond_3

    sget-object v12, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {p1, v12}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    const/4 v11, 0x1

    .line 77
    .local v11, "tryHarder":Z
    :goto_0
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    .line 78
    .local v6, "maxI":I
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v7

    .line 86
    .local v7, "maxJ":I
    mul-int/lit8 v12, v6, 0x3

    div-int/lit16 v4, v12, 0xe4

    .line 87
    .local v4, "iSkip":I
    const/4 v12, 0x3

    if-lt v4, v12, :cond_0

    if-eqz v11, :cond_1

    .line 88
    :cond_0
    const/4 v4, 0x3

    .line 91
    :cond_1
    const/4 v2, 0x0

    .line 92
    .local v2, "done":Z
    const/4 v12, 0x5

    new-array v10, v12, [I

    .line 93
    .local v10, "stateCount":[I
    add-int/lit8 v3, v4, -0x1

    .local v3, "i":I
    :goto_1
    if-ge v3, v6, :cond_2

    if-eqz v2, :cond_4

    .line 178
    :cond_2
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v8

    .line 179
    .local v8, "patternInfo":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v8}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 181
    new-instance v12, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v12, v8}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    return-object v12

    .line 76
    .end local v2    # "done":Z
    .end local v3    # "i":I
    .end local v4    # "iSkip":I
    .end local v6    # "maxI":I
    .end local v7    # "maxJ":I
    .end local v8    # "patternInfo":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v10    # "stateCount":[I
    .end local v11    # "tryHarder":Z
    :cond_3
    const/4 v11, 0x0

    goto :goto_0

    .line 95
    .restart local v2    # "done":Z
    .restart local v3    # "i":I
    .restart local v4    # "iSkip":I
    .restart local v6    # "maxI":I
    .restart local v7    # "maxJ":I
    .restart local v10    # "stateCount":[I
    .restart local v11    # "tryHarder":Z
    :cond_4
    const/4 v12, 0x0

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 96
    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 97
    const/4 v12, 0x2

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 98
    const/4 v12, 0x3

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 99
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 100
    const/4 v1, 0x0

    .line 101
    .local v1, "currentState":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-lt v5, v7, :cond_6

    .line 166
    invoke-static {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 167
    invoke-virtual {p0, v10, v3, v7}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v0

    .line 168
    .local v0, "confirmed":Z
    if-eqz v0, :cond_5

    .line 169
    const/4 v12, 0x0

    aget v4, v10, v12

    .line 170
    iget-boolean v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v12, :cond_5

    .line 172
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v2

    .line 93
    .end local v0    # "confirmed":Z
    :cond_5
    add-int/2addr v3, v4

    goto :goto_1

    .line 102
    :cond_6
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12, v5, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 104
    and-int/lit8 v12, v1, 0x1

    const/4 v13, 0x1

    if-ne v12, v13, :cond_7

    .line 105
    add-int/lit8 v1, v1, 0x1

    .line 107
    :cond_7
    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    .line 101
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 109
    :cond_8
    and-int/lit8 v12, v1, 0x1

    if-nez v12, :cond_e

    .line 110
    const/4 v12, 0x4

    if-ne v1, v12, :cond_d

    .line 111
    invoke-static {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_c

    .line 112
    invoke-virtual {p0, v10, v3, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v0

    .line 113
    .restart local v0    # "confirmed":Z
    if-eqz v0, :cond_b

    .line 116
    const/4 v4, 0x2

    .line 117
    iget-boolean v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v12, :cond_a

    .line 118
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v2

    .line 144
    :cond_9
    :goto_4
    const/4 v1, 0x0

    .line 145
    const/4 v12, 0x0

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 146
    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 147
    const/4 v12, 0x2

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 148
    const/4 v12, 0x3

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 149
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    goto :goto_3

    .line 120
    :cond_a
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->findRowSkip()I

    move-result v9

    .line 121
    .local v9, "rowSkip":I
    const/4 v12, 0x2

    aget v12, v10, v12

    if-le v9, v12, :cond_9

    .line 130
    const/4 v12, 0x2

    aget v12, v10, v12

    sub-int v12, v9, v12

    sub-int/2addr v12, v4

    add-int/2addr v3, v12

    .line 131
    add-int/lit8 v5, v7, -0x1

    goto :goto_4

    .line 135
    .end local v9    # "rowSkip":I
    :cond_b
    const/4 v12, 0x0

    const/4 v13, 0x2

    aget v13, v10, v13

    aput v13, v10, v12

    .line 136
    const/4 v12, 0x1

    const/4 v13, 0x3

    aget v13, v10, v13

    aput v13, v10, v12

    .line 137
    const/4 v12, 0x2

    const/4 v13, 0x4

    aget v13, v10, v13

    aput v13, v10, v12

    .line 138
    const/4 v12, 0x3

    const/4 v13, 0x1

    aput v13, v10, v12

    .line 139
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 140
    const/4 v1, 0x3

    .line 141
    goto :goto_3

    .line 151
    .end local v0    # "confirmed":Z
    :cond_c
    const/4 v12, 0x0

    const/4 v13, 0x2

    aget v13, v10, v13

    aput v13, v10, v12

    .line 152
    const/4 v12, 0x1

    const/4 v13, 0x3

    aget v13, v10, v13

    aput v13, v10, v12

    .line 153
    const/4 v12, 0x2

    const/4 v13, 0x4

    aget v13, v10, v13

    aput v13, v10, v12

    .line 154
    const/4 v12, 0x3

    const/4 v13, 0x1

    aput v13, v10, v12

    .line 155
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 156
    const/4 v1, 0x3

    goto :goto_3

    .line 159
    :cond_d
    add-int/lit8 v1, v1, 0x1

    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    goto/16 :goto_3

    .line 162
    :cond_e
    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    goto/16 :goto_3
.end method

.method protected getImage()Lcom/google/zxing/common/BitMatrix;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected getPossibleCenters()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    return-object v0
.end method

.method protected handlePossibleCenter([III)Z
    .locals 12
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I

    .prologue
    .line 392
    const/4 v9, 0x0

    aget v9, p1, v9

    const/4 v10, 0x1

    aget v10, p1, v10

    add-int/2addr v9, v10

    const/4 v10, 0x2

    aget v10, p1, v10

    add-int/2addr v9, v10

    const/4 v10, 0x3

    aget v10, p1, v10

    add-int/2addr v9, v10

    .line 393
    const/4 v10, 0x4

    aget v10, p1, v10

    .line 392
    add-int v8, v9, v10

    .line 394
    .local v8, "stateCountTotal":I
    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v2

    .line 395
    .local v2, "centerJ":F
    float-to-int v9, v2

    const/4 v10, 0x2

    aget v10, p1, v10

    invoke-direct {p0, p2, v9, v10, v8}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckVertical(IIII)F

    move-result v1

    .line 396
    .local v1, "centerI":F
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-nez v9, :cond_3

    .line 398
    float-to-int v9, v2

    float-to-int v10, v1

    const/4 v11, 0x2

    aget v11, p1, v11

    invoke-direct {p0, v9, v10, v11, v8}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckHorizontal(IIII)F

    move-result v2

    .line 399
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v9

    if-nez v9, :cond_3

    .line 400
    int-to-float v9, v8

    const/high16 v10, 0x40e00000    # 7.0f

    div-float v3, v9, v10

    .line 401
    .local v3, "estimatedModuleSize":F
    const/4 v4, 0x0

    .line 402
    .local v4, "found":Z
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v6

    .line 403
    .local v6, "max":I
    const/4 v5, 0x0

    .local v5, "index":I
    :goto_0
    if-lt v5, v6, :cond_1

    .line 412
    :goto_1
    if-nez v4, :cond_0

    .line 413
    new-instance v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v7, v2, v1, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFF)V

    .line 414
    .local v7, "point":Lcom/google/zxing/ResultPoint;
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 415
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v9, :cond_0

    .line 416
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v9, v7}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 419
    .end local v7    # "point":Lcom/google/zxing/ResultPoint;
    :cond_0
    const/4 v9, 0x1

    .line 422
    .end local v3    # "estimatedModuleSize":F
    .end local v4    # "found":Z
    .end local v5    # "index":I
    .end local v6    # "max":I
    :goto_2
    return v9

    .line 404
    .restart local v3    # "estimatedModuleSize":F
    .restart local v4    # "found":Z
    .restart local v5    # "index":I
    .restart local v6    # "max":I
    :cond_1
    iget-object v9, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/Vector;

    invoke-virtual {v9, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 406
    .local v0, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v0, v3, v1, v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->aboutEquals(FFF)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 407
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->incrementCount()V

    .line 408
    const/4 v4, 0x1

    .line 409
    goto :goto_1

    .line 403
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 422
    .end local v0    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v3    # "estimatedModuleSize":F
    .end local v4    # "found":Z
    .end local v5    # "index":I
    .end local v6    # "max":I
    :cond_3
    const/4 v9, 0x0

    goto :goto_2
.end method
