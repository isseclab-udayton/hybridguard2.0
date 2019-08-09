.class public Lcom/qualcomm/ar/pl/ImageTools;
.super Ljava/lang/Object;
.source "ImageTools.java"


# static fields
.field private static final CAMERA_IMAGE_FORMAT_LUM:I = 0x10001101

.field private static final CAMERA_IMAGE_FORMAT_NV12:I = 0x10001107

.field private static final CAMERA_IMAGE_FORMAT_NV21:I = 0x10001109

.field private static final CAMERA_IMAGE_FORMAT_RGB565:I = 0x10001102

.field private static final MODULENAME:Ljava/lang/String; = "ImageTools"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encodeImage([BIIIII)[B
    .locals 12
    .param p0, "pixels"    # [B
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I
    .param p4, "stride"    # I
    .param p5, "quality"    # I

    .prologue
    .line 54
    const-string v3, "ImageTools"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "encodeImage w: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " h: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " s: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " q: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    if-nez p0, :cond_0

    .line 59
    const-string v3, "ImageTools"

    const-string v4, "encodeImage pixels is null"

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    const/4 v3, 0x0

    .line 116
    :goto_0
    return-object v3

    .line 63
    :cond_0
    const v3, 0x10001109

    if-ne p3, v3, :cond_2

    .line 65
    const-string v3, "ImageTools"

    const-string v4, "Format is YUV"

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    new-instance v1, Landroid/graphics/YuvImage;

    const/16 v3, 0x11

    const/4 v6, 0x0

    move-object v2, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v6}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 68
    .local v1, "yuvImage":Landroid/graphics/YuvImage;
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 69
    .local v9, "encodedBuffer":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    move/from16 v0, p5

    invoke-virtual {v1, v3, v0, v9}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 70
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    goto :goto_0

    .line 72
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 74
    .end local v1    # "yuvImage":Landroid/graphics/YuvImage;
    .end local v9    # "encodedBuffer":Ljava/io/ByteArrayOutputStream;
    :cond_2
    const v3, 0x10001101

    if-ne p3, v3, :cond_5

    .line 76
    const-string v3, "ImageTools"

    const-string v4, "Format is LUM"

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    mul-int v10, p1, p2

    .line 81
    .local v10, "numPixels":I
    new-array v2, v10, [I

    .line 82
    .local v2, "colors":[I
    const/4 v11, 0x0

    .local v11, "p":I
    :goto_1
    if-ge v11, v10, :cond_3

    .line 83
    aget-byte v3, p0, v11

    shl-int/lit8 v3, v3, 0x18

    const v4, 0xffffff

    or-int/2addr v3, v4

    aput v3, v2, v11

    .line 82
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 85
    :cond_3
    const/4 v3, 0x0

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move v4, p1

    move v5, p1

    move v6, p2

    invoke-static/range {v2 .. v7}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 104
    .local v8, "bmp":Landroid/graphics/Bitmap;
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 105
    .restart local v9    # "encodedBuffer":Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move/from16 v0, p5

    invoke-virtual {v8, v3, v0, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 106
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    goto :goto_0

    .line 109
    :cond_4
    const-string v3, "ImageTools"

    const-string v4, "Failed to encode LUM image"

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const/4 v3, 0x0

    goto :goto_0

    .line 115
    .end local v2    # "colors":[I
    .end local v8    # "bmp":Landroid/graphics/Bitmap;
    .end local v9    # "encodedBuffer":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "numPixels":I
    .end local v11    # "p":I
    :cond_5
    const-string v3, "ImageTools"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported image format: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/qualcomm/ar/pl/DebugLog;->LOGD(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    const/4 v3, 0x0

    goto/16 :goto_0
.end method
