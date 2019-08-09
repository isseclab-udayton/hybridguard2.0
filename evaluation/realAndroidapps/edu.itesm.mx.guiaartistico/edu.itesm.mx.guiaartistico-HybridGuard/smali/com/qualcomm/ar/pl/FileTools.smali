.class public Lcom/qualcomm/ar/pl/FileTools;
.super Ljava/lang/Object;
.source "FileTools.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    }
.end annotation


# static fields
.field private static final AR_FILE_POS_CURRENT:I = 0x1

.field private static final AR_FILE_POS_END:I = 0x2

.field private static final AR_FILE_POS_START:I = 0x0

.field private static final FILE_PATHTYPEINDEX_ABSOLUTE:I = -0x1

.field private static final FILE_PATHTYPEINDEX_ANDROID_ASSETS:I = 0x0

.field private static final FILE_PATHTYPEINDEX_ANDROID_DATALOCAL:I = 0x4

.field private static final FILE_PATHTYPEINDEX_ANDROID_MEDIASTORAGE:I = 0x3

.field private static final FILE_PATHTYPEINDEX_ANDROID_PRIVATEAPPCACHE:I = 0x2

.field private static final FILE_PATHTYPEINDEX_ANDROID_PRIVATEAPPSTORAGE:I = 0x1

.field private static final MODULENAME:Ljava/lang/String; = "FileTools"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static asset_close(Ljava/lang/Object;)Z
    .locals 4
    .param p0, "fileObj"    # Ljava/lang/Object;

    .prologue
    .line 244
    :try_start_0
    move-object v0, p0

    check-cast v0, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    move-object v1, v0

    .line 245
    .local v1, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    iget-object v3, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    const/4 v3, 0x1

    .end local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    :goto_0
    return v3

    .line 247
    :catch_0
    move-exception v2

    .line 249
    .local v2, "e":Ljava/lang/Exception;
    const/4 v3, 0x6

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 251
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static asset_exists(Ljava/lang/String;)Z
    .locals 10
    .param p0, "relativePath"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 178
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 179
    .local v0, "am":Landroid/content/res/AssetManager;
    const/4 v5, 0x0

    .line 181
    .local v5, "listOfFiles":[Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 182
    .local v7, "relativePathFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    .line 183
    .local v6, "pathOnly":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 187
    .local v2, "fileNameOnly":Ljava/lang/String;
    if-nez v6, :cond_0

    :try_start_0
    const-string v6, ""

    .end local v6    # "pathOnly":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 196
    if-eqz v5, :cond_2

    array-length v4, v5

    .line 197
    .local v4, "listLength":I
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v4, :cond_1

    .line 199
    aget-object v9, v5, v3

    invoke-virtual {v9, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_3

    .line 202
    const/4 v8, 0x1

    .line 206
    .end local v3    # "i":I
    .end local v4    # "listLength":I
    :cond_1
    :goto_2
    return v8

    .line 189
    :catch_0
    move-exception v1

    .line 191
    .local v1, "e":Ljava/lang/Exception;
    const/4 v9, 0x6

    invoke-static {v9}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_2

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    move v4, v8

    .line 196
    goto :goto_0

    .line 197
    .restart local v3    # "i":I
    .restart local v4    # "listLength":I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public static asset_getPosition(Ljava/lang/Object;)J
    .locals 3
    .param p0, "fileObj"    # Ljava/lang/Object;

    .prologue
    .line 432
    move-object v0, p0

    check-cast v0, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    .line 435
    .local v0, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    iget-wide v1, v0, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    return-wide v1
.end method

.method public static asset_isEOF(Ljava/lang/Object;)Z
    .locals 5
    .param p0, "fileObj"    # Ljava/lang/Object;

    .prologue
    .line 298
    const/4 v3, 0x0

    .line 301
    .local v3, "numBytesAvailable":I
    :try_start_0
    move-object v0, p0

    check-cast v0, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    move-object v1, v0

    .line 302
    .local v1, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    iget-object v4, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->available()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 309
    .end local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    :goto_0
    if-nez v3, :cond_0

    const/4 v4, 0x1

    :goto_1
    return v4

    .line 304
    :catch_0
    move-exception v2

    .line 306
    .local v2, "e":Ljava/lang/Exception;
    const/4 v4, 0x6

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 309
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static asset_open(Ljava/lang/String;)Ljava/lang/Object;
    .locals 7
    .param p0, "relativePath"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 215
    new-instance v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    invoke-direct {v1}, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;-><init>()V

    .line 216
    .local v1, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    iput-object v3, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    .line 217
    iput-object p0, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->relativePath:Ljava/lang/String;

    .line 218
    const-wide/16 v4, 0x0

    iput-wide v4, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    .line 223
    :try_start_0
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 224
    .local v0, "am":Landroid/content/res/AssetManager;
    new-instance v4, Ljava/io/BufferedInputStream;

    const/4 v5, 0x3

    invoke-virtual {v0, p0, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v5

    const/16 v6, 0x2000

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v4, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    .end local v0    # "am":Landroid/content/res/AssetManager;
    .end local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    :goto_0
    return-object v1

    .line 226
    .restart local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    :catch_0
    move-exception v2

    .line 228
    .local v2, "e":Ljava/lang/Exception;
    const/4 v4, 0x6

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v1, v3

    .line 230
    goto :goto_0
.end method

.method public static asset_read(Ljava/lang/Object;I)[B
    .locals 11
    .param p0, "fileObj"    # Ljava/lang/Object;
    .param p1, "bytesToRead"    # I

    .prologue
    .line 262
    const/4 v3, 0x0

    .line 265
    .local v3, "buffer":[B
    :try_start_0
    move-object v0, p0

    check-cast v0, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    move-object v1, v0

    .line 268
    .local v1, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    iget-object v7, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->available()I

    move-result v2

    .line 272
    .local v2, "availableBufferLength":I
    if-ge v2, p1, :cond_0

    move v4, v2

    .line 273
    .local v4, "bufferLengthToRead":I
    :goto_0
    new-array v3, v4, [B

    .line 277
    iget-object v7, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    const/4 v8, 0x0

    invoke-virtual {v7, v3, v8, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    .line 281
    .local v5, "bytesRead":I
    iget-wide v7, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    int-to-long v9, v5

    add-long/2addr v7, v9

    iput-wide v7, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v7, v3

    .line 290
    .end local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    .end local v2    # "availableBufferLength":I
    .end local v4    # "bufferLengthToRead":I
    .end local v5    # "bytesRead":I
    :goto_1
    return-object v7

    .restart local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    .restart local v2    # "availableBufferLength":I
    :cond_0
    move v4, p1

    .line 272
    goto :goto_0

    .line 283
    .end local v1    # "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    .end local v2    # "availableBufferLength":I
    :catch_0
    move-exception v6

    .line 285
    .local v6, "e":Ljava/lang/Exception;
    const/4 v7, 0x6

    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 287
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public static asset_setPosition(Ljava/lang/Object;JI)Z
    .locals 11
    .param p0, "fileObj"    # Ljava/lang/Object;
    .param p1, "offset"    # J
    .param p3, "origin"    # I

    .prologue
    .line 317
    move-object v1, p0

    check-cast v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;

    .line 320
    .local v1, "assetFileInfo":Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
    const-wide/16 v8, 0x0

    cmp-long v8, p1, v8

    if-gez v8, :cond_0

    .line 322
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 324
    const/4 v8, 0x0

    .line 424
    :goto_0
    return v8

    .line 328
    :cond_0
    packed-switch p3, :pswitch_data_0

    .line 393
    const/4 v8, 0x3

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 395
    const/4 v8, 0x0

    goto :goto_0

    .line 334
    :pswitch_0
    :try_start_0
    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 347
    :try_start_1
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 348
    .local v0, "am":Landroid/content/res/AssetManager;
    new-instance v8, Ljava/io/BufferedInputStream;

    iget-object v9, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->relativePath:Ljava/lang/String;

    const/4 v10, 0x3

    invoke-virtual {v0, v9, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v9

    const/16 v10, 0x2000

    invoke-direct {v8, v9, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    .line 349
    const-wide/16 v8, 0x0

    iput-wide v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 398
    .end local v0    # "am":Landroid/content/res/AssetManager;
    :cond_1
    :pswitch_1
    const-wide/16 v8, 0x0

    cmp-long v8, p1, v8

    if-eqz v8, :cond_3

    .line 401
    const-wide/16 v6, 0x0

    .line 406
    .local v6, "skippedTotal":J
    :cond_2
    :try_start_2
    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    sub-long v9, p1, v6

    invoke-virtual {v8, v9, v10}, Ljava/io/BufferedInputStream;->skip(J)J

    move-result-wide v4

    .line 407
    .local v4, "skipped":J
    add-long/2addr v6, v4

    .line 408
    iget-wide v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    add-long/2addr v8, v4

    iput-wide v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    .line 410
    cmp-long v8, v6, p1

    if-gez v8, :cond_3

    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->available()I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v8

    if-nez v8, :cond_2

    .line 424
    .end local v4    # "skipped":J
    .end local v6    # "skippedTotal":J
    :cond_3
    const/4 v8, 0x1

    goto :goto_0

    .line 336
    :catch_0
    move-exception v3

    .line 339
    .local v3, "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 341
    const/4 v8, 0x0

    goto :goto_0

    .line 351
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 354
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 356
    const/4 v8, 0x0

    goto :goto_0

    .line 373
    .end local v3    # "e":Ljava/lang/Exception;
    :pswitch_2
    :try_start_3
    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->available()I

    move-result v2

    .line 374
    .local v2, "bytesAvailable":I
    :goto_1
    if-eqz v2, :cond_1

    .line 376
    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    int-to-long v9, v2

    invoke-virtual {v8, v9, v10}, Ljava/io/BufferedInputStream;->skip(J)J

    move-result-wide v4

    .line 377
    .restart local v4    # "skipped":J
    iget-wide v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    add-long/2addr v8, v4

    iput-wide v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->filePos:J

    .line 380
    iget-object v8, v1, Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;->fileStream:Ljava/io/BufferedInputStream;

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->available()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-result v2

    .line 381
    goto :goto_1

    .line 383
    .end local v2    # "bytesAvailable":I
    .end local v4    # "skipped":J
    :catch_2
    move-exception v3

    .line 385
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 387
    const/4 v8, 0x0

    goto :goto_0

    .line 412
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v6    # "skippedTotal":J
    :catch_3
    move-exception v3

    .line 414
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 417
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 328
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getAbsolutePath(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "pathTypeIndex"    # I
    .param p1, "relativePath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x6

    .line 70
    const/4 v0, 0x0

    .line 71
    .local v0, "basePath":Ljava/lang/String;
    packed-switch p0, :pswitch_data_0

    .line 115
    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 132
    :goto_0
    return-object v4

    .line 75
    :pswitch_0
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 76
    .local v3, "fileDir":Ljava/io/File;
    if-nez v3, :cond_0

    .line 78
    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 83
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 122
    .end local v3    # "fileDir":Ljava/io/File;
    :goto_1
    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2f

    if-eq v4, v5, :cond_1

    .line 126
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    move-object v4, v0

    .line 132
    goto :goto_0

    .line 89
    :pswitch_1
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v1

    .line 90
    .local v1, "cacheDir":Ljava/io/File;
    if-nez v1, :cond_3

    .line 92
    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 97
    :cond_3
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 99
    goto :goto_1

    .line 103
    .end local v1    # "cacheDir":Ljava/io/File;
    :pswitch_2
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    .line 104
    .local v2, "externalStorageDir":Ljava/io/File;
    if-nez v2, :cond_4

    .line 106
    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 110
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 112
    goto :goto_1

    .line 71
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static mediastorage_checkPermission()Z
    .locals 5

    .prologue
    .line 151
    :try_start_0
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 152
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 154
    .local v2, "pm":Landroid/content/pm/PackageManager;
    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 155
    .local v1, "isPermissionGranted":I
    if-nez v1, :cond_0

    .line 158
    const/4 v3, 0x1

    .line 170
    .end local v1    # "isPermissionGranted":I
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :goto_0
    return v3

    .line 165
    :catch_0
    move-exception v3

    .line 170
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static mediastorage_isAvailable()Z
    .locals 2

    .prologue
    .line 140
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "state":Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
