.class public final Lcom/google/zxing/qrcode/detector/FinderPattern;
.super Lcom/google/zxing/ResultPoint;
.source "FinderPattern.java"


# instance fields
.field private count:I

.field private final estimatedModuleSize:F


# direct methods
.method constructor <init>(FFF)V
    .locals 1
    .param p1, "posX"    # F
    .param p2, "posY"    # F
    .param p3, "estimatedModuleSize"    # F

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 35
    iput p3, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    .line 36
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    .line 37
    return-void
.end method


# virtual methods
.method aboutEquals(FFF)Z
    .locals 4
    .param p1, "moduleSize"    # F
    .param p2, "i"    # F
    .param p3, "j"    # F

    .prologue
    const/4 v1, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 56
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v2

    sub-float v2, p2, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, p1

    if-gtz v2, :cond_0

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v2

    sub-float v2, p3, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, p1

    if-gtz v2, :cond_0

    .line 57
    iget v2, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    sub-float v2, p1, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 58
    .local v0, "moduleSizeDiff":F
    cmpg-float v2, v0, v3

    if-lez v2, :cond_1

    iget v2, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    div-float v2, v0, v2

    cmpg-float v2, v2, v3

    if-lez v2, :cond_1

    .line 60
    .end local v0    # "moduleSizeDiff":F
    :cond_0
    :goto_0
    return v1

    .line 58
    .restart local v0    # "moduleSizeDiff":F
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method getCount()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    return v0
.end method

.method public getEstimatedModuleSize()F
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->estimatedModuleSize:F

    return v0
.end method

.method incrementCount()V
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/zxing/qrcode/detector/FinderPattern;->count:I

    .line 49
    return-void
.end method
