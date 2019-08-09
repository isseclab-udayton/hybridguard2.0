.class Lde/appplant/cordova/plugin/notification/AssetUtil;
.super Ljava/lang/Object;
.source "AssetUtil.java"


# static fields
.field private static final DEFAULT_SOUND:Ljava/lang/String; = "res://platform_default"

.field private static final STORAGE_FOLDER:Ljava/lang/String; = "/localnotification"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    .line 72
    return-void
.end method

.method private copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 318
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 321
    return-void

    .line 319
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method private extractResourceExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "resPath"    # Ljava/lang/String;

    .prologue
    .line 422
    const-string v0, "png"

    .line 424
    .local v0, "extName":Ljava/lang/String;
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 425
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 428
    :cond_0
    return-object v0
.end method

.method private extractResourceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "resPath"    # Ljava/lang/String;

    .prologue
    .line 402
    move-object v0, p1

    .line 404
    .local v0, "drawable":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 405
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 408
    :cond_0
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 409
    const/4 v1, 0x0

    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 412
    :cond_1
    return-object v0
.end method

.method static getInstance(Landroid/content/Context;)Lde/appplant/cordova/plugin/notification/AssetUtil;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    new-instance v0, Lde/appplant/cordova/plugin/notification/AssetUtil;

    invoke-direct {v0, p0}, Lde/appplant/cordova/plugin/notification/AssetUtil;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private getPkgName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUriForResourcePath(Ljava/lang/String;)Landroid/net/Uri;
    .locals 14
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 202
    iget-object v11, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 204
    .local v0, "dir":Ljava/io/File;
    if-nez v0, :cond_0

    .line 205
    const-string v11, "Asset"

    const-string v12, "Missing external cache dir"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 241
    :goto_0
    return-object v11

    .line 209
    :cond_0
    const-string v11, "res://"

    const-string v12, ""

    invoke-virtual {p1, v11, v12}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 211
    .local v9, "resPath":Ljava/lang/String;
    invoke-virtual {p0, v9}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getResIdForDrawable(Ljava/lang/String;)I

    move-result v7

    .line 213
    .local v7, "resId":I
    if-nez v7, :cond_1

    .line 214
    const-string v11, "Asset"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "File not found: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    goto :goto_0

    .line 218
    :cond_1
    invoke-direct {p0, v9}, Lde/appplant/cordova/plugin/notification/AssetUtil;->extractResourceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 219
    .local v8, "resName":Ljava/lang/String;
    invoke-direct {p0, v9}, Lde/appplant/cordova/plugin/notification/AssetUtil;->extractResourceExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 220
    .local v2, "extName":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "/localnotification"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 221
    .local v10, "storage":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .local v3, "file":Ljava/io/File;
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->mkdir()Z

    .line 227
    :try_start_0
    iget-object v11, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 228
    .local v6, "res":Landroid/content/res/Resources;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 229
    .local v5, "outStream":Ljava/io/FileOutputStream;
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v4

    .line 230
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-direct {p0, v4, v5}, Lde/appplant/cordova/plugin/notification/AssetUtil;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 232
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 233
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 235
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    goto :goto_0

    .line 237
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "outStream":Ljava/io/FileOutputStream;
    .end local v6    # "res":Landroid/content/res/Resources;
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 241
    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    goto/16 :goto_0
.end method

.method private getUriFromAsset(Ljava/lang/String;)Landroid/net/Uri;
    .locals 12
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v9, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    .line 159
    .local v1, "dir":Ljava/io/File;
    if-nez v1, :cond_0

    .line 160
    const-string v9, "Asset"

    const-string v10, "Missing external cache dir"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    sget-object v9, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 189
    :goto_0
    return-object v9

    .line 164
    :cond_0
    const-string v9, "file:/"

    const-string v10, "www"

    invoke-virtual {p1, v9, v10}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 165
    .local v7, "resPath":Ljava/lang/String;
    const/16 v9, 0x2f

    invoke-virtual {v7, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 166
    .local v4, "fileName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/localnotification"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 167
    .local v8, "storage":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v8, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .local v3, "file":Ljava/io/File;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->mkdir()Z

    .line 173
    :try_start_0
    iget-object v9, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 174
    .local v0, "assets":Landroid/content/res/AssetManager;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 175
    .local v6, "outStream":Ljava/io/FileOutputStream;
    invoke-virtual {v0, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 177
    .local v5, "inputStream":Ljava/io/InputStream;
    invoke-direct {p0, v5, v6}, Lde/appplant/cordova/plugin/notification/AssetUtil;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 179
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 180
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 182
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    goto :goto_0

    .line 184
    .end local v0    # "assets":Landroid/content/res/AssetManager;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v6    # "outStream":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "Asset"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "File not found: assets/"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 189
    sget-object v9, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    goto :goto_0
.end method

.method private getUriFromPath(Ljava/lang/String;)Landroid/net/Uri;
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 136
    const-string v2, "file://"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "absPath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 139
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 140
    const-string v2, "Asset"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "File not found: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 144
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_0
.end method

.method private getUriFromRemote(Ljava/lang/String;)Landroid/net/Uri;
    .locals 13
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-object v11, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    .line 256
    .local v1, "dir":Ljava/io/File;
    if-nez v1, :cond_0

    .line 257
    const-string v11, "Asset"

    const-string v12, "Missing external cache dir"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 303
    :goto_0
    return-object v11

    .line 261
    :cond_0
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->extractResourceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 262
    .local v8, "resName":Ljava/lang/String;
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->extractResourceExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 263
    .local v3, "extName":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "/localnotification"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 264
    .local v9, "storage":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v4, v9, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .local v4, "file":Ljava/io/File;
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->mkdir()Z

    .line 270
    :try_start_0
    new-instance v10, Ljava/net/URL;

    invoke-direct {v10, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 271
    .local v10, "url":Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 274
    .local v0, "connection":Ljava/net/HttpURLConnection;
    new-instance v11, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v11}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v11}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v11

    invoke-virtual {v11}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v7

    .line 276
    .local v7, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v7}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 278
    const-string v11, "Connection"

    const-string v12, "close"

    invoke-virtual {v0, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const/16 v11, 0x1388

    invoke-virtual {v0, v11}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 280
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 282
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 283
    .local v5, "input":Ljava/io/InputStream;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 285
    .local v6, "outStream":Ljava/io/FileOutputStream;
    invoke-direct {p0, v5, v6}, Lde/appplant/cordova/plugin/notification/AssetUtil;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 287
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 288
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 290
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v11

    goto :goto_0

    .line 292
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local v5    # "input":Ljava/io/InputStream;
    .end local v6    # "outStream":Ljava/io/FileOutputStream;
    .end local v7    # "policy":Landroid/os/StrictMode$ThreadPolicy;
    .end local v10    # "url":Ljava/net/URL;
    :catch_0
    move-exception v2

    .line 293
    .local v2, "e":Ljava/net/MalformedURLException;
    const-string v11, "Asset"

    const-string v12, "Incorrect URL"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 303
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :goto_1
    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    goto/16 :goto_0

    .line 295
    :catch_1
    move-exception v2

    .line 296
    .local v2, "e":Ljava/io/FileNotFoundException;
    const-string v11, "Asset"

    const-string v12, "Failed to create new File from HTTP Content"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 298
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v2

    .line 299
    .local v2, "e":Ljava/io/IOException;
    const-string v11, "Asset"

    const-string v12, "No Input can be created from http Stream"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method getIconFromDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "drawable"    # Ljava/lang/String;

    .prologue
    .line 367
    iget-object v2, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 370
    .local v1, "res":Landroid/content/res/Resources;
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getPkgName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getResIdForDrawable(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 372
    .local v0, "iconId":I
    if-nez v0, :cond_0

    .line 373
    const-string v2, "android"

    invoke-virtual {p0, v2, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getResIdForDrawable(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 376
    :cond_0
    if-nez v0, :cond_1

    .line 377
    const v0, 0x1080041

    .line 380
    :cond_1
    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method getIconFromUri(Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    iget-object v1, p0, Lde/appplant/cordova/plugin/notification/AssetUtil;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .line 392
    .local v0, "input":Ljava/io/InputStream;
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method getResIdForDrawable(Ljava/lang/String;)I
    .locals 2
    .param p1, "resPath"    # Ljava/lang/String;

    .prologue
    .line 330
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getPkgName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getResIdForDrawable(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 332
    .local v0, "resId":I
    if-nez v0, :cond_0

    .line 333
    const-string v1, "android"

    invoke-virtual {p0, v1, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getResIdForDrawable(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 336
    :cond_0
    return v0
.end method

.method getResIdForDrawable(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5
    .param p1, "clsName"    # Ljava/lang/String;
    .param p2, "resPath"    # Ljava/lang/String;

    .prologue
    .line 348
    invoke-direct {p0, p2}, Lde/appplant/cordova/plugin/notification/AssetUtil;->extractResourceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 349
    .local v1, "drawable":Ljava/lang/String;
    const/4 v2, 0x0

    .line 352
    .local v2, "resId":I
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".R$drawable"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 354
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const-class v4, Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 357
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    return v2

    .line 355
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method parse(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 111
    const-string v0, "res:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getUriForResourcePath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 121
    :goto_0
    return-object v0

    .line 113
    :cond_0
    const-string v0, "file:///"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getUriFromPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 115
    :cond_1
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getUriFromAsset(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 117
    :cond_2
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 118
    invoke-direct {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->getUriFromRemote(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 121
    :cond_3
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    goto :goto_0
.end method

.method parseSound(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 92
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    :cond_0
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 100
    :goto_0
    return-object v0

    .line 95
    :cond_1
    const-string v0, "res://platform_default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 96
    const/4 v0, 0x2

    invoke-static {v0}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 100
    :cond_2
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/AssetUtil;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method
