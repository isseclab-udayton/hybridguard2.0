.class final Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
.super Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.source "MultiFinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;
    }
.end annotation


# static fields
.field private static final DIFF_MODSIZE_CUTOFF:F = 0.5f

.field private static final DIFF_MODSIZE_CUTOFF_PERCENT:F = 0.05f

.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

.field private static final MAX_MODULE_COUNT_PER_EDGE:F = 180.0f

.field private static final MIN_MODULE_COUNT_PER_EDGE:F = 9.0f


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    .line 47
    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 92
    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p2, "resultPointCallback"    # Lcom/google/zxing/ResultPointCallback;

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    .line 96
    return-void
.end method

.method private selectBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getPossibleCenters()Ljava/util/Vector;

    move-result-object v15

    .line 106
    .local v15, "possibleCenters":Ljava/util/Vector;
    invoke-virtual {v15}, Ljava/util/Vector;->size()I

    move-result v18

    .line 108
    .local v18, "size":I
    const/16 v26, 0x3

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_0

    .line 110
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v26

    throw v26

    .line 116
    :cond_0
    const/16 v26, 0x3

    move/from16 v0, v18

    move/from16 v1, v26

    if-ne v0, v1, :cond_2

    .line 117
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-object/from16 v16, v0

    const/16 v27, 0x0

    .line 118
    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    .line 119
    const/16 v26, 0x0

    move/from16 v0, v26

    invoke-virtual {v15, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v26, v28, v29

    const/16 v29, 0x1

    .line 120
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v15, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v26, v28, v29

    const/16 v29, 0x2

    .line 121
    const/16 v26, 0x2

    move/from16 v0, v26

    invoke-virtual {v15, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v26, v28, v29

    aput-object v28, v16, v27

    .line 226
    :cond_1
    return-object v16

    .line 127
    :cond_2
    new-instance v26, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;

    const/16 v27, 0x0

    invoke-direct/range {v26 .. v27}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;-><init>(Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;)V

    move-object/from16 v0, v26

    invoke-static {v15, v0}, Lcom/google/zxing/common/Collections;->insertionSort(Ljava/util/Vector;Lcom/google/zxing/common/Comparator;)V

    .line 144
    new-instance v17, Ljava/util/Vector;

    invoke-direct/range {v17 .. v17}, Ljava/util/Vector;-><init>()V

    .line 146
    .local v17, "results":Ljava/util/Vector;
    const/4 v8, 0x0

    .local v8, "i1":I
    :goto_0
    add-int/lit8 v26, v18, -0x2

    move/from16 v0, v26

    if-lt v8, v0, :cond_3

    .line 221
    invoke-virtual/range {v17 .. v17}, Ljava/util/Vector;->isEmpty()Z

    move-result v26

    if-nez v26, :cond_c

    .line 222
    invoke-virtual/range {v17 .. v17}, Ljava/util/Vector;->size()I

    move-result v26

    move/from16 v0, v26

    new-array v0, v0, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-object/from16 v16, v0

    .line 223
    .local v16, "resultArray":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual/range {v17 .. v17}, Ljava/util/Vector;->size()I

    move-result v26

    move/from16 v0, v26

    if-ge v7, v0, :cond_1

    .line 224
    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v26, v16, v7

    .line 223
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 147
    .end local v7    # "i":I
    .end local v16    # "resultArray":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_3
    invoke-virtual {v15, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 148
    .local v12, "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v12, :cond_5

    .line 146
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 152
    :cond_5
    add-int/lit8 v9, v8, 0x1

    .local v9, "i2":I
    :goto_2
    add-int/lit8 v26, v18, -0x1

    move/from16 v0, v26

    if-ge v9, v0, :cond_4

    .line 153
    invoke-virtual {v15, v9}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 154
    .local v13, "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v13, :cond_7

    .line 152
    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 159
    :cond_7
    invoke-virtual {v12}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v26

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    sub-float v26, v26, v27

    .line 160
    invoke-virtual {v12}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v28

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->min(FF)F

    move-result v27

    .line 159
    div-float v21, v26, v27

    .line 161
    .local v21, "vModSize12":F
    invoke-virtual {v12}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v26

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v22

    .line 162
    .local v22, "vModSize12A":F
    const/high16 v26, 0x3f000000    # 0.5f

    cmpl-float v26, v22, v26

    if-lez v26, :cond_8

    const v26, 0x3d4ccccd    # 0.05f

    cmpl-float v26, v21, v26

    if-gez v26, :cond_4

    .line 168
    :cond_8
    add-int/lit8 v10, v9, 0x1

    .local v10, "i3":I
    :goto_3
    move/from16 v0, v18

    if-ge v10, v0, :cond_6

    .line 169
    invoke-virtual {v15, v10}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/zxing/qrcode/detector/FinderPattern;

    .line 170
    .local v14, "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    if-nez v14, :cond_a

    .line 168
    :cond_9
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 175
    :cond_a
    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v26

    invoke-virtual {v14}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    sub-float v26, v26, v27

    .line 176
    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    invoke-virtual {v14}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v28

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->min(FF)F

    move-result v27

    .line 175
    div-float v23, v26, v27

    .line 177
    .local v23, "vModSize23":F
    invoke-virtual {v13}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v26

    invoke-virtual {v14}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v24

    .line 178
    .local v24, "vModSize23A":F
    const/high16 v26, 0x3f000000    # 0.5f

    cmpl-float v26, v24, v26

    if-lez v26, :cond_b

    const v26, 0x3d4ccccd    # 0.05f

    cmpl-float v26, v23, v26

    if-gez v26, :cond_6

    .line 184
    :cond_b
    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-object/from16 v19, v0

    const/16 v26, 0x0

    aput-object v12, v19, v26

    const/16 v26, 0x1

    aput-object v13, v19, v26

    const/16 v26, 0x2

    aput-object v14, v19, v26

    .line 185
    .local v19, "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static/range {v19 .. v19}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 188
    new-instance v11, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    .line 189
    .local v11, "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v26

    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v2

    .line 190
    .local v2, "dA":F
    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v26

    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v4

    .line 191
    .local v4, "dC":F
    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v26

    invoke-virtual {v11}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v3

    .line 194
    .local v3, "dB":F
    add-float v26, v2, v3

    invoke-virtual {v12}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v27

    const/high16 v28, 0x40000000    # 2.0f

    mul-float v27, v27, v28

    div-float v6, v26, v27

    .line 195
    .local v6, "estimatedModuleCount":F
    const/high16 v26, 0x43340000    # 180.0f

    cmpl-float v26, v6, v26

    if-gtz v26, :cond_9

    .line 196
    const/high16 v26, 0x41100000    # 9.0f

    cmpg-float v26, v6, v26

    if-ltz v26, :cond_9

    .line 201
    sub-float v26, v2, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v27

    div-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v20

    .line 202
    .local v20, "vABBC":F
    const v26, 0x3dcccccd    # 0.1f

    cmpl-float v26, v20, v26

    if-gez v26, :cond_9

    .line 207
    mul-float v26, v2, v2

    mul-float v27, v3, v3

    add-float v26, v26, v27

    move/from16 v0, v26

    float-to-double v0, v0

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-float v5, v0

    .line 209
    .local v5, "dCpy":F
    sub-float v26, v4, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v27

    div-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v25

    .line 211
    .local v25, "vPyC":F
    const v26, 0x3dcccccd    # 0.1f

    cmpl-float v26, v25, v26

    if-gez v26, :cond_9

    .line 216
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 230
    .end local v2    # "dA":F
    .end local v3    # "dB":F
    .end local v4    # "dC":F
    .end local v5    # "dCpy":F
    .end local v6    # "estimatedModuleCount":F
    .end local v9    # "i2":I
    .end local v10    # "i3":I
    .end local v11    # "info":Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .end local v12    # "p1":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v13    # "p2":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v14    # "p3":Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v19    # "test":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v20    # "vABBC":F
    .end local v21    # "vModSize12":F
    .end local v22    # "vModSize12A":F
    .end local v23    # "vModSize23":F
    .end local v24    # "vModSize23A":F
    .end local v25    # "vPyC":F
    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v26

    throw v26
.end method


# virtual methods
.method public findMulti(Ljava/util/Hashtable;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .locals 17
    .param p1, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 234
    if-eqz p1, :cond_3

    sget-object v15, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    const/4 v14, 0x1

    .line 235
    .local v14, "tryHarder":Z
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    .line 236
    .local v5, "image":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual {v5}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    .line 237
    .local v7, "maxI":I
    invoke-virtual {v5}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v8

    .line 245
    .local v8, "maxJ":I
    int-to-float v15, v7

    const/high16 v16, 0x43640000    # 228.0f

    div-float v15, v15, v16

    const/high16 v16, 0x40400000    # 3.0f

    mul-float v15, v15, v16

    float-to-int v4, v15

    .line 246
    .local v4, "iSkip":I
    const/4 v15, 0x3

    if-lt v4, v15, :cond_0

    if-eqz v14, :cond_1

    .line 247
    :cond_0
    const/4 v4, 0x3

    .line 250
    :cond_1
    const/4 v15, 0x5

    new-array v13, v15, [I

    .line 251
    .local v13, "stateCount":[I
    add-int/lit8 v3, v4, -0x1

    .local v3, "i":I
    :goto_1
    if-lt v3, v7, :cond_4

    .line 305
    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->selectBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v10

    .line 306
    .local v10, "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    new-instance v11, Ljava/util/Vector;

    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    .line 307
    .local v11, "result":Ljava/util/Vector;
    const/4 v3, 0x0

    :goto_2
    array-length v15, v10

    if-lt v3, v15, :cond_f

    .line 313
    invoke-virtual {v11}, Ljava/util/Vector;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_10

    .line 314
    sget-object v12, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    .line 320
    :cond_2
    return-object v12

    .line 234
    .end local v3    # "i":I
    .end local v4    # "iSkip":I
    .end local v5    # "image":Lcom/google/zxing/common/BitMatrix;
    .end local v7    # "maxI":I
    .end local v8    # "maxJ":I
    .end local v10    # "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .end local v11    # "result":Ljava/util/Vector;
    .end local v13    # "stateCount":[I
    .end local v14    # "tryHarder":Z
    :cond_3
    const/4 v14, 0x0

    goto :goto_0

    .line 253
    .restart local v3    # "i":I
    .restart local v4    # "iSkip":I
    .restart local v5    # "image":Lcom/google/zxing/common/BitMatrix;
    .restart local v7    # "maxI":I
    .restart local v8    # "maxJ":I
    .restart local v13    # "stateCount":[I
    .restart local v14    # "tryHarder":Z
    :cond_4
    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 254
    const/4 v15, 0x1

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 255
    const/4 v15, 0x2

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 256
    const/4 v15, 0x3

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 257
    const/4 v15, 0x4

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 258
    const/4 v2, 0x0

    .line 259
    .local v2, "currentState":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_3
    if-lt v6, v8, :cond_6

    .line 301
    invoke-static {v13}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 302
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v3, v8}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([III)Z

    .line 251
    :cond_5
    add-int/2addr v3, v4

    goto :goto_1

    .line 260
    :cond_6
    invoke-virtual {v5, v6, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 262
    and-int/lit8 v15, v2, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 263
    add-int/lit8 v2, v2, 0x1

    .line 265
    :cond_7
    aget v15, v13, v2

    add-int/lit8 v15, v15, 0x1

    aput v15, v13, v2

    .line 259
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 267
    :cond_8
    and-int/lit8 v15, v2, 0x1

    if-nez v15, :cond_e

    .line 268
    const/4 v15, 0x4

    if-ne v2, v15, :cond_d

    .line 269
    invoke-static {v13}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 270
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v3, v6}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([III)Z

    move-result v1

    .line 271
    .local v1, "confirmed":Z
    if-nez v1, :cond_b

    .line 273
    :cond_9
    add-int/lit8 v6, v6, 0x1

    .line 274
    if-ge v6, v8, :cond_a

    invoke-virtual {v5, v6, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v15

    .line 272
    if-eqz v15, :cond_9

    .line 275
    :cond_a
    add-int/lit8 v6, v6, -0x1

    .line 278
    :cond_b
    const/4 v2, 0x0

    .line 279
    const/4 v15, 0x0

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 280
    const/4 v15, 0x1

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 281
    const/4 v15, 0x2

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 282
    const/4 v15, 0x3

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 283
    const/4 v15, 0x4

    const/16 v16, 0x0

    aput v16, v13, v15

    goto :goto_4

    .line 285
    .end local v1    # "confirmed":Z
    :cond_c
    const/4 v15, 0x0

    const/16 v16, 0x2

    aget v16, v13, v16

    aput v16, v13, v15

    .line 286
    const/4 v15, 0x1

    const/16 v16, 0x3

    aget v16, v13, v16

    aput v16, v13, v15

    .line 287
    const/4 v15, 0x2

    const/16 v16, 0x4

    aget v16, v13, v16

    aput v16, v13, v15

    .line 288
    const/4 v15, 0x3

    const/16 v16, 0x1

    aput v16, v13, v15

    .line 289
    const/4 v15, 0x4

    const/16 v16, 0x0

    aput v16, v13, v15

    .line 290
    const/4 v2, 0x3

    goto :goto_4

    .line 293
    :cond_d
    add-int/lit8 v2, v2, 0x1

    aget v15, v13, v2

    add-int/lit8 v15, v15, 0x1

    aput v15, v13, v2

    goto :goto_4

    .line 296
    :cond_e
    aget v15, v13, v2

    add-int/lit8 v15, v15, 0x1

    aput v15, v13, v2

    goto :goto_4

    .line 308
    .end local v2    # "currentState":I
    .end local v6    # "j":I
    .restart local v10    # "patternInfo":[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .restart local v11    # "result":Ljava/util/Vector;
    :cond_f
    aget-object v9, v10, v3

    .line 309
    .local v9, "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    invoke-static {v9}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    .line 310
    new-instance v15, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v15, v9}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    invoke-virtual {v11, v15}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 307
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_2

    .line 316
    .end local v9    # "pattern":[Lcom/google/zxing/qrcode/detector/FinderPattern;
    :cond_10
    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v15

    new-array v12, v15, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    .line 317
    .local v12, "resultArray":[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    const/4 v3, 0x0

    :goto_5
    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v15

    if-ge v3, v15, :cond_2

    .line 318
    invoke-virtual {v11, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    aput-object v15, v12, v3

    .line 317
    add-int/lit8 v3, v3, 0x1

    goto :goto_5
.end method
