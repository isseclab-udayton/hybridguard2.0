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
    .line 85
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 86
    return-void
.end method

.method private checkForDuplicateImage(I)V
    .locals 8
    .param p1, "type"    # I

    .prologue
    const/4 v7, 0x0

    .line 451
    const/4 v2, 0x1

    .line 452
    .local v2, "diff":I
    invoke-direct {p0}, Lorg/apache/cordova/CameraLauncher;->queryImgDB()Landroid/database/Cursor;

    move-result-object v1

    .line 453
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 455
    .local v0, "currentNumOfImages":I
    const/4 v5, 0x1

    if-ne p1, v5, :cond_0

    .line 456
    const/4 v2, 0x2

    .line 460
    :cond_0
    iget v5, p0, Lorg/apache/cordova/CameraLauncher;->numPics:I

    sub-int v5, v0, v5

    if-ne v5, v2, :cond_1

    .line 461
    invoke-interface {v1}, Landroid/database/Cursor;->moveToLast()Z

    .line 462
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

    .line 463
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

    .line 464
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 466
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

    .line 435
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

    .line 97
    sget-object v5, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 98
    .local v5, "status":Lorg/apache/cordova/api/PluginResult$Status;
    const-string v3, ""

    .line 99
    .local v3, "result":Ljava/lang/String;
    iput-object p3, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    .line 102
    :try_start_0
    const-string v6, "takePicture"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 103
    const/4 v4, 0x1

    .line 104
    .local v4, "srcType":I
    const/4 v0, 0x1

    .line 105
    .local v0, "destType":I
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 106
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 107
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    .line 108
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    .line 109
    const/16 v6, 0x50

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 111
    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 112
    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v0

    .line 113
    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    .line 114
    const/4 v6, 0x3

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 115
    const/4 v6, 0x4

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 116
    const/4 v6, 0x5

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

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
    .line 498
    new-instance v0, Lorg/apache/cordova/api/PluginResult;

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CameraLauncher;->error(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 499
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
    .locals 17
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 273
    div-int/lit8 v12, p1, 0x10

    add-int/lit8 v9, v12, -0x1

    .line 274
    .local v9, "srcType":I
    rem-int/lit8 v12, p1, 0x10

    add-int/lit8 v2, v12, -0x1

    .line 277
    .local v2, "destType":I
    const/4 v12, 0x1

    if-ne v9, v12, :cond_7

    .line 279
    const/4 v12, -0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_5

    .line 282
    :try_start_0
    new-instance v5, Lorg/apache/cordova/ExifHelper;

    invoke-direct {v5}, Lorg/apache/cordova/ExifHelper;-><init>()V

    .line 283
    .local v5, "exif":Lorg/apache/cordova/ExifHelper;
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v12, :cond_0

    .line 284
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/Pic.jpg"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Lorg/apache/cordova/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v5}, Lorg/apache/cordova/ExifHelper;->readExifData()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 291
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-static {v12, v13}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 298
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 301
    if-nez v2, :cond_3

    .line 302
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 303
    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V

    .line 340
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 341
    const/4 v1, 0x0

    .line 342
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 344
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V

    .line 427
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "exif":Lorg/apache/cordova/ExifHelper;
    :cond_2
    :goto_2
    return-void

    .line 292
    .restart local v5    # "exif":Lorg/apache/cordova/ExifHelper;
    :catch_0
    move-exception v3

    .line 293
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    .line 294
    .local v10, "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 295
    .local v8, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 307
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "resolver":Landroid/content/ContentResolver;
    .end local v10    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v12, 0x1

    if-ne v2, v12, :cond_1

    .line 310
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 311
    .local v11, "values":Landroid/content/ContentValues;
    const-string v12, "mime_type"

    const-string v13, "image/jpeg"

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 312
    const/4 v10, 0x0

    .line 314
    .restart local v10    # "uri":Landroid/net/Uri;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_3
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v10

    .line 327
    :goto_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-virtual {v12, v10}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v7

    .line 328
    .local v7, "os":Ljava/io/OutputStream;
    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    invoke-virtual {v1, v12, v13, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 329
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 332
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v12, :cond_4

    .line 333
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {v10, v12}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Lorg/apache/cordova/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 334
    invoke-virtual {v5}, Lorg/apache/cordova/ExifHelper;->writeExifData()V

    .line 338
    :cond_4
    new-instance v12, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1

    .line 345
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "exif":Lorg/apache/cordova/ExifHelper;
    .end local v7    # "os":Ljava/io/OutputStream;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v3

    .line 346
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 347
    const-string v12, "Error capturing image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 315
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "exif":Lorg/apache/cordova/ExifHelper;
    .restart local v10    # "uri":Landroid/net/Uri;
    .restart local v11    # "values":Landroid/content/ContentValues;
    :catch_2
    move-exception v3

    .line 316
    .local v3, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_5
    const-string v12, "CameraLauncher"

    const-string v13, "Can\'t write to external media storage."

    invoke-static {v12, v13}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 318
    :try_start_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_6
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v10

    goto :goto_3

    .line 319
    :catch_3
    move-exception v4

    .line 320
    .local v4, "ex":Ljava/lang/UnsupportedOperationException;
    :try_start_7
    const-string v12, "CameraLauncher"

    const-string v13, "Can\'t write to internal media storage."

    invoke-static {v12, v13}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    const-string v12, "Error capturing image - no media storage found."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_2

    .line 352
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "e":Ljava/lang/UnsupportedOperationException;
    .end local v4    # "ex":Ljava/lang/UnsupportedOperationException;
    .end local v5    # "exif":Lorg/apache/cordova/ExifHelper;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_5
    if-nez p2, :cond_6

    .line 353
    const-string v12, "Camera cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 358
    :cond_6
    const-string v12, "Did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 363
    :cond_7
    if-eqz v9, :cond_8

    const/4 v12, 0x2

    if-ne v9, v12, :cond_2

    .line 364
    :cond_8
    const/4 v12, -0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_c

    .line 365
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    .line 366
    .restart local v10    # "uri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 370
    .restart local v8    # "resolver":Landroid/content/ContentResolver;
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    if-eqz v12, :cond_9

    .line 371
    new-instance v12, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 375
    :cond_9
    if-nez v2, :cond_a

    .line 377
    :try_start_8
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 378
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 379
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 380
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 381
    const/4 v1, 0x0

    .line 382
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_4

    goto/16 :goto_2

    .line 383
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    :catch_4
    move-exception v3

    .line 384
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 385
    const-string v12, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 390
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_a
    const/4 v12, 0x1

    if-ne v2, v12, :cond_2

    .line 392
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    if-lez v12, :cond_b

    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    if-lez v12, :cond_b

    .line 394
    :try_start_9
    invoke-virtual {v8, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 395
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CameraLauncher;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 397
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/resize.jpg"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 398
    .local v6, "fileName":Ljava/lang/String;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 399
    .restart local v7    # "os":Ljava/io/OutputStream;
    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    invoke-virtual {v1, v12, v13, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 400
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 402
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 403
    const/4 v1, 0x0

    .line 407
    new-instance v12, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "file://"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "?"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 408
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    goto/16 :goto_2

    .line 409
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v7    # "os":Ljava/io/OutputStream;
    :catch_5
    move-exception v3

    .line 410
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 411
    const-string v12, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 415
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_b
    new-instance v12, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 420
    .end local v8    # "resolver":Landroid/content/ContentResolver;
    .end local v10    # "uri":Landroid/net/Uri;
    :cond_c
    if-nez p2, :cond_d

    .line 421
    const-string v12, "Selection cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 424
    :cond_d
    const-string v12, "Selection did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public processPicture(Landroid/graphics/Bitmap;)V
    .locals 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 474
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 476
    .local v2, "jpeg_data":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 477
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 478
    .local v0, "code":[B
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v4

    .line 479
    .local v4, "output":[B
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 480
    .local v3, "js_out":Ljava/lang/String;
    new-instance v5, Lorg/apache/cordova/api/PluginResult;

    sget-object v6, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v5, v6, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    iget-object v6, p0, Lorg/apache/cordova/CameraLauncher;->callbackId:Ljava/lang/String;

    invoke-virtual {p0, v5, v6}, Lorg/apache/cordova/CameraLauncher;->success(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    const/4 v3, 0x0

    .line 482
    const/4 v4, 0x0

    .line 489
    .end local v0    # "code":[B
    .end local v3    # "js_out":Ljava/lang/String;
    .end local v4    # "output":[B
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 490
    return-void

    .line 486
    :catch_0
    move-exception v1

    .line 487
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
