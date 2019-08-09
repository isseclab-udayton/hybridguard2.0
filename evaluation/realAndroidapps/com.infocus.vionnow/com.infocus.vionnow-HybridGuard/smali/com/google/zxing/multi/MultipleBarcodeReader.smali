.class public interface abstract Lcom/google/zxing/multi/MultipleBarcodeReader;
.super Ljava/lang/Object;
.source "MultipleBarcodeReader.java"


# virtual methods
.method public abstract decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public abstract decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Hashtable;)[Lcom/google/zxing/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method
