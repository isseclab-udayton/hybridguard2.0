.class public Lcom/google/zxing/common/GlobalHistogramBinarizer;
.super Lcom/google/zxing/Binarizer;
.source "GlobalHistogramBinarizer.java"


# static fields
.field private static final LUMINANCE_BITS:I = 0x5

.field private static final LUMINANCE_BUCKETS:I = 0x20

.field private static final LUMINANCE_SHIFT:I = 0x3


# instance fields
.field private buckets:[I

.field private luminances:[B


# direct methods
.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .locals 1
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1}, Lcom/google/zxing/Binarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    .line 40
    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    .line 41
    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 45
    return-void
.end method

.method private static estimateBlackPoint([I)I
    .locals 15
    .param p0, "buckets"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 139
    array-length v7, p0

    .line 140
    .local v7, "numBuckets":I
    const/4 v6, 0x0

    .line 141
    .local v6, "maxBucketCount":I
    const/4 v3, 0x0

    .line 142
    .local v3, "firstPeak":I
    const/4 v4, 0x0

    .line 143
    .local v4, "firstPeakSize":I
    const/4 v12, 0x0

    .local v12, "x":I
    :goto_0
    if-lt v12, v7, :cond_1

    .line 154
    const/4 v9, 0x0

    .line 155
    .local v9, "secondPeak":I
    const/4 v10, 0x0

    .line 156
    .local v10, "secondPeakScore":I
    const/4 v12, 0x0

    :goto_1
    if-lt v12, v7, :cond_4

    .line 167
    if-le v3, v9, :cond_0

    .line 168
    move v11, v3

    .line 169
    .local v11, "temp":I
    move v3, v9

    .line 170
    move v9, v11

    .line 175
    .end local v11    # "temp":I
    :cond_0
    sub-int v13, v9, v3

    shr-int/lit8 v14, v7, 0x4

    if-gt v13, v14, :cond_6

    .line 176
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v13

    throw v13

    .line 144
    .end local v9    # "secondPeak":I
    .end local v10    # "secondPeakScore":I
    :cond_1
    aget v13, p0, v12

    if-le v13, v4, :cond_2

    .line 145
    move v3, v12

    .line 146
    aget v4, p0, v12

    .line 148
    :cond_2
    aget v13, p0, v12

    if-le v13, v6, :cond_3

    .line 149
    aget v6, p0, v12

    .line 143
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 157
    .restart local v9    # "secondPeak":I
    .restart local v10    # "secondPeakScore":I
    :cond_4
    sub-int v2, v12, v3

    .line 159
    .local v2, "distanceToBiggest":I
    aget v13, p0, v12

    mul-int/2addr v13, v2

    mul-int v8, v13, v2

    .line 160
    .local v8, "score":I
    if-le v8, v10, :cond_5

    .line 161
    move v9, v12

    .line 162
    move v10, v8

    .line 156
    :cond_5
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 180
    .end local v2    # "distanceToBiggest":I
    .end local v8    # "score":I
    :cond_6
    add-int/lit8 v0, v9, -0x1

    .line 181
    .local v0, "bestValley":I
    const/4 v1, -0x1

    .line 182
    .local v1, "bestValleyScore":I
    add-int/lit8 v12, v9, -0x1

    :goto_2
    if-gt v12, v3, :cond_7

    .line 191
    shl-int/lit8 v13, v0, 0x3

    return v13

    .line 183
    :cond_7
    sub-int v5, v12, v3

    .line 184
    .local v5, "fromFirst":I
    mul-int v13, v5, v5

    sub-int v14, v9, v12

    mul-int/2addr v13, v14

    aget v14, p0, v12

    sub-int v14, v6, v14

    mul-int v8, v13, v14

    .line 185
    .restart local v8    # "score":I
    if-le v8, v1, :cond_8

    .line 186
    move v0, v12

    .line 187
    move v1, v8

    .line 182
    :cond_8
    add-int/lit8 v12, v12, -0x1

    goto :goto_2
.end method

.method private initArrays(I)V
    .locals 4
    .param p1, "luminanceSize"    # I

    .prologue
    const/16 v3, 0x20

    .line 125
    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    array-length v1, v1

    if-ge v1, p1, :cond_1

    .line 126
    :cond_0
    new-array v1, p1, [B

    iput-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    .line 128
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    if-nez v1, :cond_3

    .line 129
    new-array v1, v3, [I

    iput-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 135
    :cond_2
    return-void

    .line 131
    :cond_3
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_0
    if-ge v0, v3, :cond_2

    .line 132
    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public createBinarizer(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    .locals 1
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .prologue
    .line 121
    new-instance v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getBlackMatrix()Lcom/google/zxing/common/BitMatrix;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v9

    .line 84
    .local v9, "source":Lcom/google/zxing/LuminanceSource;
    invoke-virtual {v9}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v10

    .line 85
    .local v10, "width":I
    invoke-virtual {v9}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v1

    .line 86
    .local v1, "height":I
    new-instance v4, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v4, v10, v1}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 90
    .local v4, "matrix":Lcom/google/zxing/common/BitMatrix;
    invoke-direct {p0, v10}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    .line 91
    iget-object v2, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 92
    .local v2, "localBuckets":[I
    const/4 v12, 0x1

    .local v12, "y":I
    :goto_0
    const/4 v13, 0x5

    if-lt v12, v13, :cond_0

    .line 101
    invoke-static {v2}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v0

    .line 106
    .local v0, "blackPoint":I
    invoke-virtual {v9}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v3

    .line 107
    .local v3, "localLuminances":[B
    const/4 v12, 0x0

    :goto_1
    if-lt v12, v1, :cond_2

    .line 117
    return-object v4

    .line 93
    .end local v0    # "blackPoint":I
    .end local v3    # "localLuminances":[B
    :cond_0
    mul-int v13, v1, v12

    div-int/lit8 v8, v13, 0x5

    .line 94
    .local v8, "row":I
    iget-object v13, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v9, v8, v13}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v3

    .line 95
    .restart local v3    # "localLuminances":[B
    shl-int/lit8 v13, v10, 0x2

    div-int/lit8 v7, v13, 0x5

    .line 96
    .local v7, "right":I
    div-int/lit8 v11, v10, 0x5

    .local v11, "x":I
    :goto_2
    if-lt v11, v7, :cond_1

    .line 92
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 97
    :cond_1
    aget-byte v13, v3, v11

    and-int/lit16 v6, v13, 0xff

    .line 98
    .local v6, "pixel":I
    shr-int/lit8 v13, v6, 0x3

    aget v14, v2, v13

    add-int/lit8 v14, v14, 0x1

    aput v14, v2, v13

    .line 96
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 108
    .end local v6    # "pixel":I
    .end local v7    # "right":I
    .end local v8    # "row":I
    .end local v11    # "x":I
    .restart local v0    # "blackPoint":I
    :cond_2
    mul-int v5, v12, v10

    .line 109
    .local v5, "offset":I
    const/4 v11, 0x0

    .restart local v11    # "x":I
    :goto_3
    if-lt v11, v10, :cond_3

    .line 107
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 110
    :cond_3
    add-int v13, v5, v11

    aget-byte v13, v3, v13

    and-int/lit16 v6, v13, 0xff

    .line 111
    .restart local v6    # "pixel":I
    if-ge v6, v0, :cond_4

    .line 112
    invoke-virtual {v4, v11, v12}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 109
    :cond_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_3
.end method

.method public getBlackRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    .locals 13
    .param p1, "y"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v8

    .line 50
    .local v8, "source":Lcom/google/zxing/LuminanceSource;
    invoke-virtual {v8}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v9

    .line 51
    .local v9, "width":I
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v11

    if-ge v11, v9, :cond_1

    .line 52
    :cond_0
    new-instance p2, Lcom/google/zxing/common/BitArray;

    .end local p2    # "row":Lcom/google/zxing/common/BitArray;
    invoke-direct {p2, v9}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    .line 57
    .restart local p2    # "row":Lcom/google/zxing/common/BitArray;
    :goto_0
    invoke-direct {p0, v9}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    .line 58
    iget-object v11, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v8, p1, v11}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v4

    .line 59
    .local v4, "localLuminances":[B
    iget-object v3, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    .line 60
    .local v3, "localBuckets":[I
    const/4 v10, 0x0

    .local v10, "x":I
    :goto_1
    if-lt v10, v9, :cond_2

    .line 64
    invoke-static {v3}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v0

    .line 66
    .local v0, "blackPoint":I
    const/4 v11, 0x0

    aget-byte v11, v4, v11

    and-int/lit16 v2, v11, 0xff

    .line 67
    .local v2, "left":I
    const/4 v11, 0x1

    aget-byte v11, v4, v11

    and-int/lit16 v1, v11, 0xff

    .line 68
    .local v1, "center":I
    const/4 v10, 0x1

    :goto_2
    add-int/lit8 v11, v9, -0x1

    if-lt v10, v11, :cond_3

    .line 78
    return-object p2

    .line 54
    .end local v0    # "blackPoint":I
    .end local v1    # "center":I
    .end local v2    # "left":I
    .end local v3    # "localBuckets":[I
    .end local v4    # "localLuminances":[B
    .end local v10    # "x":I
    :cond_1
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->clear()V

    goto :goto_0

    .line 61
    .restart local v3    # "localBuckets":[I
    .restart local v4    # "localLuminances":[B
    .restart local v10    # "x":I
    :cond_2
    aget-byte v11, v4, v10

    and-int/lit16 v6, v11, 0xff

    .line 62
    .local v6, "pixel":I
    shr-int/lit8 v11, v6, 0x3

    aget v12, v3, v11

    add-int/lit8 v12, v12, 0x1

    aput v12, v3, v11

    .line 60
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 69
    .end local v6    # "pixel":I
    .restart local v0    # "blackPoint":I
    .restart local v1    # "center":I
    .restart local v2    # "left":I
    :cond_3
    add-int/lit8 v11, v10, 0x1

    aget-byte v11, v4, v11

    and-int/lit16 v7, v11, 0xff

    .line 71
    .local v7, "right":I
    shl-int/lit8 v11, v1, 0x2

    sub-int/2addr v11, v2

    sub-int/2addr v11, v7

    shr-int/lit8 v5, v11, 0x1

    .line 72
    .local v5, "luminance":I
    if-ge v5, v0, :cond_4

    .line 73
    invoke-virtual {p2, v10}, Lcom/google/zxing/common/BitArray;->set(I)V

    .line 75
    :cond_4
    move v2, v1

    .line 76
    move v1, v7

    .line 68
    add-int/lit8 v10, v10, 0x1

    goto :goto_2
.end method
