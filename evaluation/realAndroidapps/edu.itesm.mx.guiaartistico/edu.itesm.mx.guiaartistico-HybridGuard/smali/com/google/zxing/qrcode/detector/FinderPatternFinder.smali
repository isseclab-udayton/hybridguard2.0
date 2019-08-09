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

.field private final possibleCenters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    .line 65
    const/4 v0, 0x5

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    .line 66
    iput-object p2, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    .line 67
    return-void
.end method

.method private static centerFromEnd([II)F
    .locals 3
    .param p0, "stateCount"    # [I
    .param p1, "end"    # I

    .prologue
    .line 191
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
    .line 315
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 317
    .local v0, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    .line 318
    .local v2, "maxJ":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v3

    .line 320
    .local v3, "stateCount":[I
    move v1, p1

    .line 321
    .local v1, "j":I
    :goto_0
    if-ltz v1, :cond_0

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_1

    .line 325
    :cond_0
    if-gez v1, :cond_3

    .line 326
    const/high16 v5, 0x7fc00000    # Float.NaN

    .line 374
    :goto_1
    return v5

    .line 322
    :cond_1
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 323
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 329
    :cond_2
    const/4 v5, 0x1

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 330
    add-int/lit8 v1, v1, -0x1

    .line 328
    :cond_3
    if-ltz v1, :cond_4

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_2

    .line 332
    :cond_4
    if-ltz v1, :cond_5

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_7

    .line 333
    :cond_5
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 336
    :cond_6
    const/4 v5, 0x0

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 337
    add-int/lit8 v1, v1, -0x1

    .line 335
    :cond_7
    if-ltz v1, :cond_8

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_6

    .line 339
    :cond_8
    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_9

    .line 340
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 343
    :cond_9
    add-int/lit8 v1, p1, 0x1

    .line 344
    :goto_2
    if-ge v1, v2, :cond_a

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_b

    .line 348
    :cond_a
    if-ne v1, v2, :cond_d

    .line 349
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 345
    :cond_b
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 346
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 352
    :cond_c
    const/4 v5, 0x3

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 353
    add-int/lit8 v1, v1, 0x1

    .line 351
    :cond_d
    if-ge v1, v2, :cond_e

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_e

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_c

    .line 355
    :cond_e
    if-eq v1, v2, :cond_f

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_11

    .line 356
    :cond_f
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 359
    :cond_10
    const/4 v5, 0x4

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 360
    add-int/lit8 v1, v1, 0x1

    .line 358
    :cond_11
    if-ge v1, v2, :cond_12

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_12

    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_10

    .line 362
    :cond_12
    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_13

    .line 363
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 368
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

    .line 369
    const/4 v6, 0x4

    aget v6, v3, v6

    .line 368
    add-int v4, v5, v6

    .line 370
    .local v4, "stateCountTotal":I
    sub-int v5, v4, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x5

    if-lt v5, p4, :cond_14

    .line 371
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 374
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
    .line 243
    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    .line 245
    .local v1, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    .line 246
    .local v2, "maxI":I
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->getCrossCheckStateCount()[I

    move-result-object v3

    .line 249
    .local v3, "stateCount":[I
    move v0, p1

    .line 250
    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_1

    .line 254
    :cond_0
    if-gez v0, :cond_3

    .line 255
    const/high16 v5, 0x7fc00000    # Float.NaN

    .line 305
    :goto_1
    return v5

    .line 251
    :cond_1
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 252
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 258
    :cond_2
    const/4 v5, 0x1

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 259
    add-int/lit8 v0, v0, -0x1

    .line 257
    :cond_3
    if-ltz v0, :cond_4

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_2

    .line 262
    :cond_4
    if-ltz v0, :cond_5

    const/4 v5, 0x1

    aget v5, v3, v5

    if-le v5, p3, :cond_7

    .line 263
    :cond_5
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 266
    :cond_6
    const/4 v5, 0x0

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 267
    add-int/lit8 v0, v0, -0x1

    .line 265
    :cond_7
    if-ltz v0, :cond_8

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_6

    .line 269
    :cond_8
    const/4 v5, 0x0

    aget v5, v3, v5

    if-le v5, p3, :cond_9

    .line 270
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 274
    :cond_9
    add-int/lit8 v0, p1, 0x1

    .line 275
    :goto_2
    if-ge v0, v2, :cond_a

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_b

    .line 279
    :cond_a
    if-ne v0, v2, :cond_d

    .line 280
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto :goto_1

    .line 276
    :cond_b
    const/4 v5, 0x2

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 277
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 283
    :cond_c
    const/4 v5, 0x3

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 284
    add-int/lit8 v0, v0, 0x1

    .line 282
    :cond_d
    if-ge v0, v2, :cond_e

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-nez v5, :cond_e

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_c

    .line 286
    :cond_e
    if-eq v0, v2, :cond_f

    const/4 v5, 0x3

    aget v5, v3, v5

    if-lt v5, p3, :cond_11

    .line 287
    :cond_f
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 290
    :cond_10
    const/4 v5, 0x4

    aget v6, v3, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v3, v5

    .line 291
    add-int/lit8 v0, v0, 0x1

    .line 289
    :cond_11
    if-ge v0, v2, :cond_12

    invoke-virtual {v1, p2, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_12

    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_10

    .line 293
    :cond_12
    const/4 v5, 0x4

    aget v5, v3, v5

    if-lt v5, p3, :cond_13

    .line 294
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 299
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

    .line 300
    const/4 v6, 0x4

    aget v6, v3, v6

    .line 299
    add-int v4, v5, v6

    .line 301
    .local v4, "stateCountTotal":I
    sub-int v5, v4, p4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x5

    mul-int/lit8 v6, p4, 0x2

    if-lt v5, v6, :cond_14

    .line 302
    const/high16 v5, 0x7fc00000    # Float.NaN

    goto/16 :goto_1

    .line 305
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

    const/4 v3, 0x0

    .line 433
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 434
    .local v2, "max":I
    if-gt v2, v7, :cond_1

    .line 454
    :cond_0
    :goto_0
    return v3

    .line 437
    :cond_1
    const/4 v1, 0x0

    .line 438
    .local v1, "firstConfirmedCenter":Lcom/google/zxing/qrcode/detector/FinderPattern;
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

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

    .line 442
    goto :goto_1

    .line 448
    :cond_3
    iput-boolean v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    .line 449
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v3

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 450
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v4

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 449
    sub-float/2addr v3, v4

    float-to-int v3, v3

    div-int/lit8 v3, v3, 0x2

    goto :goto_0
.end method

.method protected static foundPatternCross([I)Z
    .locals 9
    .param p0, "stateCount"    # [I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 200
    const/4 v4, 0x0

    .line 201
    .local v4, "totalModuleSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v7, 0x5

    if-lt v1, v7, :cond_1

    .line 208
    const/4 v7, 0x7

    if-ge v4, v7, :cond_2

    .line 214
    :cond_0
    :goto_1
    return v5

    .line 202
    :cond_1
    aget v0, p0, v1

    .line 203
    .local v0, "count":I
    if-eqz v0, :cond_0

    .line 206
    add-int/2addr v4, v0

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 211
    .end local v0    # "count":I
    :cond_2
    shl-int/lit8 v7, v4, 0x8

    div-int/lit8 v3, v7, 0x7

    .line 212
    .local v3, "moduleSize":I
    div-int/lit8 v2, v3, 0x2

    .line 214
    .local v2, "maxVariance":I
    aget v7, p0, v5

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 215
    aget v7, p0, v6

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 216
    mul-int/lit8 v7, v3, 0x3

    const/4 v8, 0x2

    aget v8, p0, v8

    shl-int/lit8 v8, v8, 0x8

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    mul-int/lit8 v8, v2, 0x3

    if-ge v7, v8, :cond_0

    .line 217
    const/4 v7, 0x3

    aget v7, p0, v7

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-ge v7, v2, :cond_0

    .line 218
    const/4 v7, 0x4

    aget v7, p0, v7

    shl-int/lit8 v7, v7, 0x8

    sub-int v7, v3, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 214
    if-ge v7, v2, :cond_0

    move v5, v6

    goto :goto_1
.end method

.method private getCrossCheckStateCount()[I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 222
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    aput v2, v0, v2

    .line 223
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x1

    aput v2, v0, v1

    .line 224
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x2

    aput v2, v0, v1

    .line 225
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x3

    aput v2, v0, v1

    .line 226
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    const/4 v1, 0x4

    aput v2, v0, v1

    .line 227
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckStateCount:[I

    return-object v0
.end method

.method private haveMultiplyConfirmedCenters()Z
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 463
    const/4 v1, 0x0

    .line 464
    .local v1, "confirmedCount":I
    const/4 v5, 0x0

    .line 465
    .local v5, "totalModuleSize":F
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v2

    .line 466
    .local v2, "max":I
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_2

    .line 472
    const/4 v7, 0x3

    if-ge v1, v7, :cond_3

    .line 484
    :cond_1
    :goto_1
    return v6

    .line 466
    :cond_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 467
    .local v3, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getCount()I

    move-result v8

    const/4 v9, 0x2

    if-lt v8, v9, :cond_0

    .line 468
    add-int/lit8 v1, v1, 0x1

    .line 469
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    add-float/2addr v5, v8

    goto :goto_0

    .line 479
    .end local v3    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_3
    int-to-float v7, v2

    div-float v0, v5, v7

    .line 480
    .local v0, "average":F
    const/4 v4, 0x0

    .line 481
    .local v4, "totalDeviation":F
    iget-object v7, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_4

    .line 484
    const v7, 0x3d4ccccd    # 0.05f

    mul-float/2addr v7, v5

    cmpg-float v7, v4, v7

    if-gtz v7, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    .line 481
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 482
    .restart local v3    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v8

    sub-float/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    add-float/2addr v4, v8

    goto :goto_2
.end method

.method private selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 495
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v8

    .line 496
    .local v8, "startSize":I
    const/4 v11, 0x3

    if-ge v8, v11, :cond_0

    .line 498
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v11

    throw v11

    .line 502
    :cond_0
    const/4 v11, 0x3

    if-le v8, v11, :cond_1

    .line 504
    const/4 v10, 0x0

    .line 505
    .local v10, "totalModuleSize":F
    const/4 v7, 0x0

    .line 506
    .local v7, "square":F
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_3

    .line 511
    int-to-float v11, v8

    div-float v0, v10, v11

    .line 512
    .local v0, "average":F
    int-to-float v11, v8

    div-float v11, v7, v11

    mul-float v12, v0, v0

    sub-float/2addr v11, v12

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    double-to-float v9, v11

    .line 514
    .local v9, "stdDev":F
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v12, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;

    const/4 v13, 0x0

    invoke-direct {v12, v0, v13}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator;)V

    invoke-static {v11, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 516
    const v11, 0x3e4ccccd    # 0.2f

    mul-float/2addr v11, v0

    invoke-static {v11, v9}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 518
    .local v3, "limit":F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ge v2, v11, :cond_1

    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    const/4 v12, 0x3

    if-gt v11, v12, :cond_4

    .line 527
    .end local v0    # "average":F
    .end local v2    # "i":I
    .end local v3    # "limit":F
    .end local v7    # "square":F
    .end local v9    # "stdDev":F
    .end local v10    # "totalModuleSize":F
    :cond_1
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    const/4 v12, 0x3

    if-le v11, v12, :cond_2

    .line 530
    const/4 v10, 0x0

    .line 531
    .restart local v10    # "totalModuleSize":F
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_6

    .line 535
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    int-to-float v11, v11

    div-float v0, v10, v11

    .line 537
    .restart local v0    # "average":F
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    new-instance v12, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;

    const/4 v13, 0x0

    invoke-direct {v12, v0, v13}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;-><init>(FLcom/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator;)V

    invoke-static {v11, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 539
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v12, 0x3

    iget-object v13, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-interface {v11, v12, v13}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->clear()V

    .line 542
    .end local v0    # "average":F
    .end local v10    # "totalModuleSize":F
    :cond_2
    const/4 v11, 0x3

    new-array v12, v11, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    const/4 v13, 0x0

    .line 543
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v11, v12, v13

    const/4 v13, 0x1

    .line 544
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v14, 0x1

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v11, v12, v13

    const/4 v13, 0x2

    .line 545
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    const/4 v14, 0x2

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v11, v12, v13

    .line 542
    return-object v12

    .line 506
    .restart local v7    # "square":F
    .restart local v10    # "totalModuleSize":F
    :cond_3
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 507
    .local v1, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v6

    .line 508
    .local v6, "size":F
    add-float/2addr v10, v6

    .line 509
    mul-float v12, v6, v6

    add-float/2addr v7, v12

    goto/16 :goto_0

    .line 519
    .end local v1    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v6    # "size":F
    .restart local v0    # "average":F
    .restart local v2    # "i":I
    .restart local v3    # "limit":F
    .restart local v9    # "stdDev":F
    :cond_4
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 520
    .local v4, "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v11

    sub-float/2addr v11, v0

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v11, v11, v3

    if-lez v11, :cond_5

    .line 521
    iget-object v11, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v11, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 522
    add-int/lit8 v2, v2, -0x1

    .line 518
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 531
    .end local v0    # "average":F
    .end local v2    # "i":I
    .end local v3    # "limit":F
    .end local v4    # "pattern":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v7    # "square":F
    .end local v9    # "stdDev":F
    :cond_6
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 532
    .local v5, "possibleCenter":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v5}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    add-float/2addr v10, v12

    goto/16 :goto_2
.end method


# virtual methods
.method final find(Ljava/util/Map;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    if-eqz p1, :cond_3

    sget-object v12, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    const/4 v11, 0x1

    .line 79
    .local v11, "tryHarder":Z
    :goto_0
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    .line 80
    .local v6, "maxI":I
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v7

    .line 88
    .local v7, "maxJ":I
    mul-int/lit8 v12, v6, 0x3

    div-int/lit16 v4, v12, 0xe4

    .line 89
    .local v4, "iSkip":I
    const/4 v12, 0x3

    if-lt v4, v12, :cond_0

    if-eqz v11, :cond_1

    .line 90
    :cond_0
    const/4 v4, 0x3

    .line 93
    :cond_1
    const/4 v2, 0x0

    .line 94
    .local v2, "done":Z
    const/4 v12, 0x5

    new-array v10, v12, [I

    .line 95
    .local v10, "stateCount":[I
    add-int/lit8 v3, v4, -0x1

    .local v3, "i":I
    :goto_1
    if-ge v3, v6, :cond_2

    if-eqz v2, :cond_4

    .line 180
    :cond_2
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->selectBestPatterns()[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v8

    .line 181
    .local v8, "patternInfo":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v8}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 183
    new-instance v12, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v12, v8}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    return-object v12

    .line 78
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

    .line 97
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

    .line 98
    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 99
    const/4 v12, 0x2

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 100
    const/4 v12, 0x3

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 101
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 102
    const/4 v1, 0x0

    .line 103
    .local v1, "currentState":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-lt v5, v7, :cond_6

    .line 168
    invoke-static {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 169
    invoke-virtual {p0, v10, v3, v7}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v0

    .line 170
    .local v0, "confirmed":Z
    if-eqz v0, :cond_5

    .line 171
    const/4 v12, 0x0

    aget v4, v10, v12

    .line 172
    iget-boolean v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v12, :cond_5

    .line 174
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v2

    .line 95
    .end local v0    # "confirmed":Z
    :cond_5
    add-int/2addr v3, v4

    goto :goto_1

    .line 104
    :cond_6
    iget-object v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v12, v5, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 106
    and-int/lit8 v12, v1, 0x1

    const/4 v13, 0x1

    if-ne v12, v13, :cond_7

    .line 107
    add-int/lit8 v1, v1, 0x1

    .line 109
    :cond_7
    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    .line 103
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 111
    :cond_8
    and-int/lit8 v12, v1, 0x1

    if-nez v12, :cond_e

    .line 112
    const/4 v12, 0x4

    if-ne v1, v12, :cond_d

    .line 113
    invoke-static {v10}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->foundPatternCross([I)Z

    move-result v12

    if-eqz v12, :cond_c

    .line 114
    invoke-virtual {p0, v10, v3, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v0

    .line 115
    .restart local v0    # "confirmed":Z
    if-eqz v0, :cond_b

    .line 118
    const/4 v4, 0x2

    .line 119
    iget-boolean v12, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->hasSkipped:Z

    if-eqz v12, :cond_a

    .line 120
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->haveMultiplyConfirmedCenters()Z

    move-result v2

    .line 146
    :cond_9
    :goto_4
    const/4 v1, 0x0

    .line 147
    const/4 v12, 0x0

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 148
    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 149
    const/4 v12, 0x2

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 150
    const/4 v12, 0x3

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 151
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    goto :goto_3

    .line 122
    :cond_a
    invoke-direct {p0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->findRowSkip()I

    move-result v9

    .line 123
    .local v9, "rowSkip":I
    const/4 v12, 0x2

    aget v12, v10, v12

    if-le v9, v12, :cond_9

    .line 132
    const/4 v12, 0x2

    aget v12, v10, v12

    sub-int v12, v9, v12

    sub-int/2addr v12, v4

    add-int/2addr v3, v12

    .line 133
    add-int/lit8 v5, v7, -0x1

    .line 136
    goto :goto_4

    .line 137
    .end local v9    # "rowSkip":I
    :cond_b
    const/4 v12, 0x0

    const/4 v13, 0x2

    aget v13, v10, v13

    aput v13, v10, v12

    .line 138
    const/4 v12, 0x1

    const/4 v13, 0x3

    aget v13, v10, v13

    aput v13, v10, v12

    .line 139
    const/4 v12, 0x2

    const/4 v13, 0x4

    aget v13, v10, v13

    aput v13, v10, v12

    .line 140
    const/4 v12, 0x3

    const/4 v13, 0x1

    aput v13, v10, v12

    .line 141
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 142
    const/4 v1, 0x3

    .line 143
    goto :goto_3

    .line 153
    .end local v0    # "confirmed":Z
    :cond_c
    const/4 v12, 0x0

    const/4 v13, 0x2

    aget v13, v10, v13

    aput v13, v10, v12

    .line 154
    const/4 v12, 0x1

    const/4 v13, 0x3

    aget v13, v10, v13

    aput v13, v10, v12

    .line 155
    const/4 v12, 0x2

    const/4 v13, 0x4

    aget v13, v10, v13

    aput v13, v10, v12

    .line 156
    const/4 v12, 0x3

    const/4 v13, 0x1

    aput v13, v10, v12

    .line 157
    const/4 v12, 0x4

    const/4 v13, 0x0

    aput v13, v10, v12

    .line 158
    const/4 v1, 0x3

    .line 160
    goto :goto_3

    .line 161
    :cond_d
    add-int/lit8 v1, v1, 0x1

    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    goto/16 :goto_3

    .line 164
    :cond_e
    aget v12, v10, v1

    add-int/lit8 v12, v12, 0x1

    aput v12, v10, v1

    goto/16 :goto_3
.end method

.method protected final getImage()Lcom/google/zxing/common/BitMatrix;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected final getPossibleCenters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/qrcode/detector/FinderPattern;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    return-object v0
.end method

.method protected final handlePossibleCenter([III)Z
    .locals 11
    .param p1, "stateCount"    # [I
    .param p2, "i"    # I
    .param p3, "j"    # I

    .prologue
    .line 394
    const/4 v8, 0x0

    aget v8, p1, v8

    const/4 v9, 0x1

    aget v9, p1, v9

    add-int/2addr v8, v9

    const/4 v9, 0x2

    aget v9, p1, v9

    add-int/2addr v8, v9

    const/4 v9, 0x3

    aget v9, p1, v9

    add-int/2addr v8, v9

    .line 395
    const/4 v9, 0x4

    aget v9, p1, v9

    .line 394
    add-int v7, v8, v9

    .line 396
    .local v7, "stateCountTotal":I
    invoke-static {p1, p3}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->centerFromEnd([II)F

    move-result v2

    .line 397
    .local v2, "centerJ":F
    float-to-int v8, v2

    const/4 v9, 0x2

    aget v9, p1, v9

    invoke-direct {p0, p2, v8, v9, v7}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckVertical(IIII)F

    move-result v1

    .line 398
    .local v1, "centerI":F
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v8

    if-nez v8, :cond_3

    .line 400
    float-to-int v8, v2

    float-to-int v9, v1

    const/4 v10, 0x2

    aget v10, p1, v10

    invoke-direct {p0, v8, v9, v10, v7}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->crossCheckHorizontal(IIII)F

    move-result v2

    .line 401
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v8

    if-nez v8, :cond_3

    .line 402
    int-to-float v8, v7

    const/high16 v9, 0x40e00000    # 7.0f

    div-float v3, v8, v9

    .line 403
    .local v3, "estimatedModuleSize":F
    const/4 v4, 0x0

    .line 404
    .local v4, "found":Z
    const/4 v5, 0x0

    .local v5, "index":I
    :goto_0
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lt v5, v8, :cond_1

    .line 413
    :goto_1
    if-nez v4, :cond_0

    .line 414
    new-instance v6, Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-direct {v6, v2, v1, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;-><init>(FFF)V

    .line 415
    .local v6, "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    if-eqz v8, :cond_0

    .line 417
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-interface {v8, v6}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 420
    .end local v6    # "point":Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_0
    const/4 v8, 0x1

    .line 423
    .end local v3    # "estimatedModuleSize":F
    .end local v4    # "found":Z
    .end local v5    # "index":I
    :goto_2
    return v8

    .line 405
    .restart local v3    # "estimatedModuleSize":F
    .restart local v4    # "found":Z
    .restart local v5    # "index":I
    :cond_1
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 407
    .local v0, "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-virtual {v0, v3, v1, v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->aboutEquals(FFF)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 408
    iget-object v8, p0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->possibleCenters:Ljava/util/List;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->combineEstimate(FFF)Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v9

    invoke-interface {v8, v5, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 409
    const/4 v4, 0x1

    .line 410
    goto :goto_1

    .line 404
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 423
    .end local v0    # "center":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v3    # "estimatedModuleSize":F
    .end local v4    # "found":Z
    .end local v5    # "index":I
    :cond_3
    const/4 v8, 0x0

    goto :goto_2
.end method
