.class public Lcom/arellomobile/android/push/utils/notification/Helper;
.super Ljava/lang/Object;
.source "Helper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getScaleBitmap(Landroid/graphics/Bitmap;ILandroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "srcBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "outHeightSimple"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    int-to-float v1, p1

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 109
    .local v0, "outHeight":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    mul-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/2addr v1, v2

    const/4 v2, 0x1

    invoke-static {p0, v1, v0, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static tryToGetBitmapFromInternet(Ljava/lang/String;Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 12
    .param p0, "bitmapUrl"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "imageSize"    # I

    .prologue
    const/4 v11, -0x1

    .line 39
    if-eqz p0, :cond_4

    .line 41
    const/4 v3, 0x0

    .line 44
    .local v3, "inputStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 46
    .local v8, "url":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 48
    .local v2, "connection":Ljava/net/URLConnection;
    invoke-virtual {v2}, Ljava/net/URLConnection;->connect()V

    .line 50
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 51
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 52
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v9, 0x400

    new-array v0, v9, [B

    .line 55
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .local v7, "read":I
    if-ne v7, v11, :cond_2

    .line 59
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 60
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 62
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 64
    new-instance v6, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v6}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 65
    .local v6, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v9, 0x1

    iput-boolean v9, v6, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 67
    const/4 v9, 0x0

    array-length v10, v0

    invoke-static {v0, v9, v10, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 69
    iget v9, v6, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v10, v6, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 70
    .local v4, "maxSize":I
    const/high16 v5, 0x3f800000    # 1.0f

    .line 71
    .local v5, "newImageScale":F
    if-eq v11, p2, :cond_0

    .line 73
    int-to-float v9, v4

    int-to-float v10, p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v11, v11, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v10, v11

    div-float v5, v9, v10

    .line 76
    :cond_0
    const/4 v9, 0x0

    iput-boolean v9, v6, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 77
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v9

    iput v9, v6, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 79
    const/4 v9, 0x0

    array-length v10, v0

    invoke-static {v0, v9, v10, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 87
    if-eqz v3, :cond_1

    .line 91
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    :goto_1
    const/4 v3, 0x0

    .line 99
    :cond_1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 103
    .end local v0    # "buffer":[B
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "connection":Ljava/net/URLConnection;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "maxSize":I
    .end local v5    # "newImageScale":F
    .end local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v7    # "read":I
    .end local v8    # "url":Ljava/net/URL;
    :goto_2
    return-object v9

    .line 57
    .restart local v0    # "buffer":[B
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "connection":Ljava/net/URLConnection;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "read":I
    .restart local v8    # "url":Ljava/net/URL;
    :cond_2
    const/4 v9, 0x0

    :try_start_2
    invoke-virtual {v1, v0, v9, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 81
    .end local v0    # "buffer":[B
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "connection":Ljava/net/URLConnection;
    .end local v7    # "read":I
    .end local v8    # "url":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 87
    if-eqz v3, :cond_3

    .line 91
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 97
    :goto_3
    const/4 v3, 0x0

    .line 99
    :cond_3
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 103
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :cond_4
    const/4 v9, 0x0

    goto :goto_2

    .line 86
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    :catchall_0
    move-exception v9

    .line 87
    if-eqz v3, :cond_5

    .line 91
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 97
    :goto_4
    const/4 v3, 0x0

    .line 99
    :cond_5
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 100
    throw v9

    .line 93
    .restart local v0    # "buffer":[B
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "connection":Ljava/net/URLConnection;
    .restart local v4    # "maxSize":I
    .restart local v5    # "newImageScale":F
    .restart local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v7    # "read":I
    .restart local v8    # "url":Ljava/net/URL;
    :catch_1
    move-exception v10

    goto :goto_1

    .end local v0    # "buffer":[B
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "connection":Ljava/net/URLConnection;
    .end local v4    # "maxSize":I
    .end local v5    # "newImageScale":F
    .end local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v7    # "read":I
    .end local v8    # "url":Ljava/net/URL;
    :catch_2
    move-exception v9

    goto :goto_3

    :catch_3
    move-exception v10

    goto :goto_4
.end method

.method public static tryToGetIconFormStringOrGetFromApplication(Ljava/lang/String;Landroid/content/Context;)I
    .locals 5
    .param p0, "iconName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v1, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 25
    .local v1, "iconId":I
    if-eqz p0, :cond_0

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 28
    .local v0, "customId":I
    if-eqz v0, :cond_0

    .line 30
    move v1, v0

    .line 34
    .end local v0    # "customId":I
    :cond_0
    return v1
.end method
