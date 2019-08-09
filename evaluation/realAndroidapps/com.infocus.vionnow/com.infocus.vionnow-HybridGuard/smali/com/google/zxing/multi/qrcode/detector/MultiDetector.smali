.class public final Lcom/google/zxing/multi/qrcode/detector/MultiDetector;
.super Lcom/google/zxing/qrcode/detector/Detector;
.source "MultiDetector.java"


# static fields
.field private static final EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/common/DetectorResult;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 0
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 42
    return-void
.end method


# virtual methods
.method public detectMulti(Ljava/util/Hashtable;)[Lcom/google/zxing/common/DetectorResult;
    .locals 7
    .param p1, "hints"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    .line 46
    .local v2, "image":Lcom/google/zxing/common/BitMatrix;
    new-instance v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;

    invoke-direct {v0, v2}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    .line 47
    .local v0, "finder":Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
    invoke-virtual {v0, p1}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->findMulti(Ljava/util/Hashtable;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    move-result-object v3

    .line 49
    .local v3, "info":[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    if-eqz v3, :cond_0

    array-length v6, v3

    if-nez v6, :cond_1

    .line 50
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    .line 53
    :cond_1
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 54
    .local v4, "result":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v6, v3

    if-lt v1, v6, :cond_3

    .line 61
    invoke-virtual {v4}, Ljava/util/Vector;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 62
    sget-object v5, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->EMPTY_DETECTOR_RESULTS:[Lcom/google/zxing/common/DetectorResult;

    .line 68
    :cond_2
    return-object v5

    .line 56
    :cond_3
    :try_start_0
    aget-object v6, v3, v1

    invoke-virtual {p0, v6}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    :cond_4
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v5, v6, [Lcom/google/zxing/common/DetectorResult;

    .line 65
    .local v5, "resultArray":[Lcom/google/zxing/common/DetectorResult;
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 66
    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/common/DetectorResult;

    aput-object v6, v5, v1

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 57
    .end local v5    # "resultArray":[Lcom/google/zxing/common/DetectorResult;
    :catch_0
    move-exception v6

    goto :goto_1
.end method
