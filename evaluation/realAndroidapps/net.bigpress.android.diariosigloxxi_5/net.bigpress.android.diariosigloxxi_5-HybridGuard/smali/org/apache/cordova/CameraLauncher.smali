.class public Lorg/apache/cordova/CameraLauncher;
.super Lorg/apache/cordova/api/Plugin;
.source "CameraLauncher.java"


# static fields
.field private static final ALLMEDIA:I = 0x2

.field private static final CAMERA:I = 0x1

.field private static final DATA_URL:I = 0x0

.field private static final FILE_URI:I = 0x1

.field private static final GET_All:Ljava/lang/String; = "Get All"

.field private static final GET_PICTURE:Ljava/lang/String; = "Get Picture"

.field private static final GET_VIDEO:Ljava/lang/String; = "Get Video"

.field private static final JPEG:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "CameraLauncher"

.field private static final PHOTOLIBRARY:I = 0x0

.field private static final PICTURE:I = 0x0

.field private static final PNG:I = 0x1

.field private static final SAVEDPHOTOALBUM:I = 0x2

.field private static final VIDEO:I = 0x1


# instance fields
.field public callbackId:Ljava/lang/String;

.field private encodingType:I

.field private imageUri:Landroid/net/Uri;

.field private mQuality:I

.field private mediaType:I

.field private numPics:I

.field private targetHeight:I

.field private targetWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 85
    return-void
.end method

.method private checkForDuplicateImage(I)V
    .locals 8
    .param p1, "type"    # I

    .prologue
    const/4 v7, 0x0

    .line 476
    const/4 v2, 0x1

    .line 477
    .local v2, "diff":I
    invoke-direct {p0}, Lorg/apache/cordova/CameraLauncher;->queryImgDB()Landroid/database/Cursor;

    move-result-object v1

    .line 478
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 480
    .local v0, "currentNumOfImages":I
    const/4 v5, 0x1

    if-ne p1, v5, :cond_0

    .line 481
    const/4 v2, 0x2

    .line 485
    :cond_0
    iget v5, p0, Lorg/apache/cordova/CameraLauncher;->numPics:I

    sub-int v5, v0, v5

    if-ne v5, v2, :cond_1

    .line 486
    invoke-interface {v1}, Landroid/database/Cursor;->moveToLast()Z

    .line 487
    const-string v5, "_id"

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v3, v5, -0x1

    .line 488
    .local v3, "id":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 489
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 491
    .end local v3    # "id":I
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_1
    return-void
.end method

.method private createCaptureFile(I)Ljava/io/File;
    .locals 4
    .param p1, "encodingType"    # I

    .prologue
    .line 176
    const/4 v0, 0x0

    .line 177
    .local v0, "photo":Ljava/io/File;
    if-nez p1, :cond_0

    .line 178
    new-instance v0, Ljava/io/File;

    .end local v0    # "photo":Ljava/io/File;
    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Pic.jpg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .restart local v0    # "photo":Ljava/io/File;
    :goto_0
    return-object v0

    .line 179
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 180
    new-instance v0, Ljava/io/File;

    .end local v0    # "photo":Ljava/io/File;
    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Pic.png"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "photo":Ljava/io/File;
    goto :goto_0

    .line 182
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Encoding Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private queryImgDB()Landroid/database/Cursor;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 460
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 9
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 96
    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 97
    .local v5, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v3, ""

    .line 98
    .local v3, "result":Ljava/lang/String;
    iput-object p3, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    .line 101
    :try_start_0
    const-string v6, "takePicture"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 102
    const/4 v4, 0x1

    .line 103
    .local v4, "srcType":I
    const/4 v0, 0x1

    .line 104
    .local v0, "destType":I
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 105
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 106
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    .line 107
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    .line 108
    const/16 v6, 0x50

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 110
    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 111
    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v0

    .line 112
    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    .line 113
    const/4 v6, 0x3

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 114
    const/4 v6, 0x4

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 115
    const/4 v6, 0x5

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    .line 116
    const/4 v6, 0x6

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    .line 118
    if-ne v4, v7, :cond_1

    .line 119
    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v6}, Lorg/apache/cordova/CameraLauncher;->takePicture(II)V

    .line 124
    :cond_0
    :goto_0
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v2, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 125
    .local v2, "r":Lorg/apache/cordova/api/PluginResult;
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 131
    .end local v0    # "destType":I
    .end local v2    # "r":Lorg/apache/cordova/api/PluginResult;
    .end local v4    # "srcType":I
    :goto_1
    return-object v2

    .line 121
    .restart local v0    # "destType":I
    .restart local v4    # "srcType":I
    :cond_1
    if-eqz v4, :cond_2

    if-ne v4, v8, :cond_0

    .line 122
    :cond_2
    invoke-virtual {p0, v4, v0}, Lorg/apache/cordova/CameraLauncher;->getImage(II)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    .end local v0    # "destType":I
    .end local v4    # "srcType":I
    :catch_0
    move-exception v1

    .line 130
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 131
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v2, v6}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 128
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_3
    :try_start_1
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v2, v5, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public failPicture(Ljava/lang/String;)V
    .locals 2
    .param p1, "err"    # Ljava/lang/String;

    .prologue
    .line 523
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CameraLauncher;->error(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 524
    return-void
.end method

.method public getImage(II)V
    .locals 5
    .param p1, "srcType"    # I
    .param p2, "returnType"    # I

    .prologue
    .line 196
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 197
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "Get Picture"

    .line 198
    .local v1, "title":Ljava/lang/String;
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    if-nez v2, :cond_1

    .line 199
    const-string v2, "image/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 212
    :cond_0
    :goto_0
    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 213
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 214
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    mul-int/lit8 v4, v4, 0x10

    add-int/2addr v4, p2

    add-int/lit8 v4, v4, 0x1

    invoke-interface {v2, p0, v3, v4}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/IPlugin;Landroid/content/Intent;I)V

    .line 216
    return-void

    .line 201
    :cond_1
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 202
    const-string v2, "video/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    const-string v1, "Get Video"

    goto :goto_0

    .line 205
    :cond_2
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 208
    const-string v2, "*/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 209
    const-string v1, "Get All"

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 25
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 273
    div-int/lit8 v2, p1, 0x10

    add-int/lit8 v22, v2, -0x1

    .line 274
    .local v22, "srcType":I
    rem-int/lit8 v2, p1, 0x10

    add-int/lit8 v14, v2, -0x1

    .line 275
    .local v14, "destType":I
    const/16 v21, 0x0

    .line 278
    .local v21, "rotate":I
    new-instance v17, Lorg/apache/cordova/ExifHelper;

    invoke-direct/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;-><init>()V

    .line 280
    .local v17, "exif":Lorg/apache/cordova/ExifHelper;
    :try_start_0
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v2, :cond_0

    .line 281
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/Pic.jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lorg/apache/cordova/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 282
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->readExifData()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :cond_0
    :goto_0
    const/4 v2, 0x1

    move/from16 v0, v22

    if-ne v0, v2, :cond_7

    .line 291
    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_5

    .line 296
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-static {v2, v3}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v12

    .line 303
    .local v12, "bitmap":Landroid/graphics/Bitmap;
    :goto_1
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 306
    if-nez v14, :cond_3

    .line 307
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 308
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V

    .line 345
    :cond_1
    :goto_2
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->recycle()V

    .line 346
    const/4 v12, 0x0

    .line 347
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 349
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 452
    .end local v12    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    :goto_3
    return-void

    .line 284
    :catch_0
    move-exception v15

    .line 285
    .local v15, "e":Ljava/io/IOException;
    invoke-virtual {v15}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 297
    .end local v15    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v15

    .line 298
    .local v15, "e":Ljava/io/FileNotFoundException;
    :try_start_3
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v23

    .line 299
    .local v23, "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    .line 300
    .local v20, "resolver":Landroid/content/ContentResolver;
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v12

    .restart local v12    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_1

    .line 312
    .end local v15    # "e":Ljava/io/FileNotFoundException;
    .end local v20    # "resolver":Landroid/content/ContentResolver;
    .end local v23    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v2, 0x1

    if-ne v14, v2, :cond_1

    .line 315
    new-instance v24, Landroid/content/ContentValues;

    invoke-direct/range {v24 .. v24}, Landroid/content/ContentValues;-><init>()V

    .line 316
    .local v24, "values":Landroid/content/ContentValues;
    const-string v2, "mime_type"

    const-string v3, "image/jpeg"

    move-object/from16 v0, v24

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 317
    const/16 v23, 0x0

    .line 319
    .restart local v23    # "uri":Landroid/net/Uri;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v24

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_4
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v23

    .line 332
    :goto_4
    :try_start_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v19

    .line 333
    .local v19, "os":Ljava/io/OutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    move-object/from16 v0, v19

    invoke-virtual {v12, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 334
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V

    .line 337
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v2, :cond_4

    .line 338
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v0, v23

    invoke-static {v0, v2}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lorg/apache/cordova/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 339
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->writeExifData()V

    .line 343
    :cond_4
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_2

    .line 350
    .end local v12    # "bitmap":Landroid/graphics/Bitmap;
    .end local v19    # "os":Ljava/io/OutputStream;
    .end local v23    # "uri":Landroid/net/Uri;
    .end local v24    # "values":Landroid/content/ContentValues;
    :catch_2
    move-exception v15

    .line 351
    .local v15, "e":Ljava/io/IOException;
    invoke-virtual {v15}, Ljava/io/IOException;->printStackTrace()V

    .line 352
    const-string v2, "Error capturing image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 320
    .end local v15    # "e":Ljava/io/IOException;
    .restart local v12    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v23    # "uri":Landroid/net/Uri;
    .restart local v24    # "values":Landroid/content/ContentValues;
    :catch_3
    move-exception v15

    .line 321
    .local v15, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_6
    const-string v2, "CameraLauncher"

    const-string v3, "Can\'t write to external media storage."

    invoke-static {v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 323
    :try_start_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v24

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_7
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    move-result-object v23

    goto :goto_4

    .line 324
    :catch_4
    move-exception v16

    .line 325
    .local v16, "ex":Ljava/lang/UnsupportedOperationException;
    :try_start_8
    const-string v2, "CameraLauncher"

    const-string v3, "Can\'t write to internal media storage."

    invoke-static {v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    const-string v2, "Error capturing image - no media storage found."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    goto/16 :goto_3

    .line 357
    .end local v12    # "bitmap":Landroid/graphics/Bitmap;
    .end local v15    # "e":Ljava/lang/UnsupportedOperationException;
    .end local v16    # "ex":Ljava/lang/UnsupportedOperationException;
    .end local v23    # "uri":Landroid/net/Uri;
    .end local v24    # "values":Landroid/content/ContentValues;
    :cond_5
    if-nez p2, :cond_6

    .line 358
    const-string v2, "Camera cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 363
    :cond_6
    const-string v2, "Did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 368
    :cond_7
    if-eqz v22, :cond_8

    const/4 v2, 0x2

    move/from16 v0, v22

    if-ne v0, v2, :cond_2

    .line 369
    :cond_8
    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_f

    .line 370
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v23

    .line 371
    .restart local v23    # "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    .line 375
    .restart local v20    # "resolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    if-eqz v2, :cond_9

    .line 376
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 380
    :cond_9
    if-nez v14, :cond_c

    .line 382
    :try_start_9
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 383
    .restart local v12    # "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "orientation"

    aput-object v3, v4, v2

    .line 384
    .local v4, "cols":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 387
    .local v13, "cursor":Landroid/database/Cursor;
    if-eqz v13, :cond_a

    .line 388
    const/4 v2, 0x0

    invoke-interface {v13, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 389
    const/4 v2, 0x0

    invoke-interface {v13, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 390
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 392
    :cond_a
    if-eqz v21, :cond_b

    .line 393
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 394
    .local v10, "matrix":Landroid/graphics/Matrix;
    move/from16 v0, v21

    int-to-float v2, v0

    invoke-virtual {v10, v2}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 395
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    const/4 v11, 0x1

    move-object v5, v12

    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 397
    .end local v10    # "matrix":Landroid/graphics/Matrix;
    :cond_b
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 398
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 399
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->recycle()V

    .line 400
    const/4 v12, 0x0

    .line 401
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_9
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_9} :catch_5

    goto/16 :goto_3

    .line 402
    .end local v4    # "cols":[Ljava/lang/String;
    .end local v12    # "bitmap":Landroid/graphics/Bitmap;
    .end local v13    # "cursor":Landroid/database/Cursor;
    :catch_5
    move-exception v15

    .line 403
    .local v15, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v15}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 404
    const-string v2, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 409
    .end local v15    # "e":Ljava/io/FileNotFoundException;
    :cond_c
    const/4 v2, 0x1

    if-ne v14, v2, :cond_2

    .line 411
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    if-lez v2, :cond_e

    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    if-lez v2, :cond_e

    .line 413
    :try_start_a
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 414
    .restart local v12    # "bitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 416
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/resize.jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 417
    .local v18, "fileName":Ljava/lang/String;
    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 418
    .restart local v19    # "os":Ljava/io/OutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    move-object/from16 v0, v19

    invoke-virtual {v12, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 419
    invoke-virtual/range {v19 .. v19}, Ljava/io/OutputStream;->close()V

    .line 422
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v2, :cond_d

    .line 423
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v0, v23

    invoke-static {v0, v2}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lorg/apache/cordova/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 424
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->writeExifData()V

    .line 427
    :cond_d
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->recycle()V

    .line 428
    const/4 v12, 0x0

    .line 432
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 433
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    goto/16 :goto_3

    .line 434
    .end local v12    # "bitmap":Landroid/graphics/Bitmap;
    .end local v18    # "fileName":Ljava/lang/String;
    .end local v19    # "os":Ljava/io/OutputStream;
    :catch_6
    move-exception v15

    .line 435
    .local v15, "e":Ljava/lang/Exception;
    invoke-virtual {v15}, Ljava/lang/Exception;->printStackTrace()V

    .line 436
    const-string v2, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 440
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_e
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 445
    .end local v20    # "resolver":Landroid/content/ContentResolver;
    .end local v23    # "uri":Landroid/net/Uri;
    :cond_f
    if-nez p2, :cond_10

    .line 446
    const-string v2, "Selection cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 449
    :cond_10
    const-string v2, "Selection did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public processPicture(Landroid/graphics/Bitmap;)V
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 499
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 501
    .local v2, "jpeg_data":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 502
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 503
    .local v0, "code":[B
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v4

    .line 504
    .local v4, "output":[B
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 505
    .local v3, "js_out":Ljava/lang/String;
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v5, v6, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v6, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v5, v6}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    const/4 v3, 0x0

    .line 507
    const/4 v4, 0x0

    .line 514
    .end local v0    # "code":[B
    .end local v3    # "js_out":Ljava/lang/String;
    .end local v4    # "output":[B
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 515
    return-void

    .line 511
    :catch_0
    move-exception v1

    .line 512
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "Error compressing image."

    invoke-virtual {p0, v5}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 225
    iget v3, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 226
    .local v3, "newWidth":I
    iget v0, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 227
    .local v0, "newHeight":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 228
    .local v7, "origWidth":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 231
    .local v4, "origHeight":I
    if-gtz v3, :cond_0

    if-gtz v0, :cond_0

    .line 259
    .end local p1    # "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    return-object p1

    .line 235
    .restart local p1    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    if-lez v3, :cond_2

    if-gtz v0, :cond_2

    .line 236
    mul-int v8, v3, v4

    div-int v0, v8, v7

    .line 259
    :cond_1
    :goto_1
    const/4 v8, 0x1

    invoke-static {p1, v3, v0, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    .line 239
    :cond_2
    if-gtz v3, :cond_3

    if-lez v0, :cond_3

    .line 240
    mul-int v8, v0, v7

    div-int v3, v8, v4

    goto :goto_1

    .line 249
    :cond_3
    int-to-double v8, v3

    int-to-double v10, v0

    div-double v1, v8, v10

    .line 250
    .local v1, "newRatio":D
    int-to-double v8, v7

    int-to-double v10, v4

    div-double v5, v8, v10

    .line 252
    .local v5, "origRatio":D
    cmpl-double v8, v5, v1

    if-lez v8, :cond_4

    .line 253
    mul-int v8, v3, v4

    div-int v0, v8, v7

    goto :goto_1

    .line 254
    :cond_4
    cmpg-double v8, v5, v1

    if-gez v8, :cond_1

    .line 255
    mul-int v8, v0, v7

    div-int v3, v8, v4

    goto :goto_1
.end method

.method public takePicture(II)V
    .locals 4
    .param p1, "returnType"    # I
    .param p2, "encodingType"    # I

    .prologue
    .line 155
    invoke-direct {p0}, Lorg/apache/cordova/CameraLauncher;->queryImgDB()Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/CameraLauncher;->numPics:I

    .line 158
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 162
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, p2}, Lorg/apache/cordova/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v1

    .line 163
    .local v1, "photo":Ljava/io/File;
    const-string v2, "output"

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 164
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 166
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    add-int/lit8 v3, p1, 0x20

    add-int/lit8 v3, v3, 0x1

    invoke-interface {v2, p0, v0, v3}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/IPlugin;Landroid/content/Intent;I)V

    .line 167
    return-void
.end method
