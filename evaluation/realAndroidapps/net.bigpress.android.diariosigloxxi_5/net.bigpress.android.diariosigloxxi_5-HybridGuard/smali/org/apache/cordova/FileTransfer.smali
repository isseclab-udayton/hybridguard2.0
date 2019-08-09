.class public Lorg/apache/cordova/FileTransfer;
.super Lorg/apache/cordova/api/Plugin;
.source "FileTransfer.java"


# static fields
.field private static final BOUNDRY:Ljava/lang/String; = "*****"

.field public static CONNECTION_ERR:I = 0x0

.field static final DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

.field public static FILE_NOT_FOUND_ERR:I = 0x0

.field public static INVALID_URL_ERR:I = 0x0

.field private static final LINE_END:Ljava/lang/String; = "\r\n"

.field private static final LINE_START:Ljava/lang/String; = "--"

.field private static final LOG_TAG:Ljava/lang/String; = "FileTransfer"


# instance fields
.field private defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    .line 63
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/FileTransfer;->INVALID_URL_ERR:I

    .line 64
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    .line 132
    new-instance v0, Lorg/apache/cordova/FileTransfer$1;

    invoke-direct {v0}, Lorg/apache/cordova/FileTransfer$1;-><init>()V

    sput-object v0, Lorg/apache/cordova/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 66
    iput-object v0, p0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 67
    iput-object v0, p0, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method private createFileTransferError(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "errorCode"    # I
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "target"    # Ljava/lang/String;

    .prologue
    .line 181
    const/4 v1, 0x0

    .line 183
    .local v1, "error":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .end local v1    # "error":Lorg/json/JSONObject;
    .local v2, "error":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, "code"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 185
    const-string v3, "source"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    const-string v3, "target"

    invoke-virtual {v2, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 190
    .end local v2    # "error":Lorg/json/JSONObject;
    .restart local v1    # "error":Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v3, "FileTransfer"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 187
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "error":Lorg/json/JSONObject;
    .restart local v2    # "error":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "error":Lorg/json/JSONObject;
    .restart local v1    # "error":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method private getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "position"    # I
    .param p3, "defaultString"    # Ljava/lang/String;

    .prologue
    .line 201
    move-object v0, p3

    .line 202
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v1, p2, :cond_1

    .line 203
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    .line 204
    if-eqz v0, :cond_0

    const-string v1, "null"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 205
    :cond_0
    move-object v0, p3

    .line 208
    :cond_1
    return-object v0
.end method

.method private getFileFromPath(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 498
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 499
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x7

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 501
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getPathFromUri(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x7

    .line 474
    const-string v2, "content:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 475
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 476
    .local v1, "uri":Landroid/net/Uri;
    iget-object v2, p0, Lorg/apache/cordova/FileTransfer;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 487
    .end local v1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v2

    .line 478
    :cond_0
    const-string v2, "file://"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 479
    const-string v2, "?"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 480
    .local v0, "question":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 481
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 483
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 487
    .end local v0    # "question":I
    :cond_2
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private trustAllHosts()V
    .locals 5

    .prologue
    .line 148
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lorg/apache/cordova/FileTransfer$2;

    invoke-direct {v4, p0}, Lorg/apache/cordova/FileTransfer$2;-><init>(Lorg/apache/cordova/FileTransfer;)V

    aput-object v4, v2, v3

    .line 165
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_0
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 167
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 168
    .local v1, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 169
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-static {v3}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v1    # "sc":Ljavax/net/ssl/SSLContext;
    :goto_0
    return-void

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "FileTransfer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public download(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 13
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 413
    :try_start_0
    invoke-direct {p0, p2}, Lorg/apache/cordova/FileTransfer;->getFileFromPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 416
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 419
    iget-object v10, p0, Lorg/apache/cordova/FileTransfer;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v10, p1}, Lorg/apache/cordova/api/CordovaInterface;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 421
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 422
    .local v9, "url":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .line 423
    .local v2, "connection":Ljava/net/HttpURLConnection;
    const-string v10, "GET"

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 426
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v10

    invoke-virtual {v10, p1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 427
    .local v3, "cookie":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 429
    const-string v10, "cookie"

    invoke-virtual {v2, v10, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    :cond_0
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 434
    const-string v10, "FileTransfer"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Download file:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 437
    .local v7, "inputStream":Ljava/io/InputStream;
    const/16 v10, 0x400

    new-array v0, v10, [B

    .line 438
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 440
    .local v1, "bytesRead":I
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 443
    .local v8, "outputStream":Ljava/io/FileOutputStream;
    :goto_0
    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_1

    .line 444
    const/4 v10, 0x0

    invoke-virtual {v8, v0, v10, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 460
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "cookie":Ljava/lang/String;
    .end local v5    # "file":Ljava/io/File;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .end local v9    # "url":Ljava/net/URL;
    :catch_0
    move-exception v4

    .line 461
    .local v4, "e":Ljava/lang/Exception;
    const-string v10, "FileTransfer"

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 462
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Error while downloading"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 447
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    .restart local v2    # "connection":Ljava/net/HttpURLConnection;
    .restart local v3    # "cookie":Ljava/lang/String;
    .restart local v5    # "file":Ljava/io/File;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v9    # "url":Ljava/net/URL;
    :cond_1
    :try_start_1
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 449
    const-string v10, "FileTransfer"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Saved file: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    new-instance v6, Lorg/apache/cordova/FileUtils;

    invoke-direct {v6}, Lorg/apache/cordova/FileUtils;-><init>()V

    .line 454
    .local v6, "fileUtil":Lorg/apache/cordova/FileUtils;
    invoke-virtual {v6, v5}, Lorg/apache/cordova/FileUtils;->getEntry(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v10

    return-object v10

    .line 458
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v2    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "cookie":Ljava/lang/String;
    .end local v6    # "fileUtil":Lorg/apache/cordova/FileUtils;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "outputStream":Ljava/io/FileOutputStream;
    .end local v9    # "url":Ljava/net/URL;
    :cond_2
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Error: Unable to connect to domain"

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 15
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 74
    const/4 v2, 0x0

    .line 75
    .local v2, "source":Ljava/lang/String;
    const/4 v3, 0x0

    .line 77
    .local v3, "target":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 78
    const/4 v1, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 86
    :try_start_1
    const-string v1, "upload"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 88
    const/4 v4, 0x0

    .line 89
    .local v4, "fileKey":Ljava/lang/String;
    const/4 v5, 0x0

    .line 90
    .local v5, "fileName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 92
    .local v6, "mimeType":Ljava/lang/String;
    const/4 v1, 0x2

    const-string v13, "file"

    move-object/from16 v0, p2

    invoke-direct {p0, v0, v1, v13}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 93
    const/4 v1, 0x3

    const-string v13, "image.jpg"

    move-object/from16 v0, p2

    invoke-direct {p0, v0, v1, v13}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 94
    const/4 v1, 0x4

    const-string v13, "image/jpeg"

    move-object/from16 v0, p2

    invoke-direct {p0, v0, v1, v13}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 95
    const/4 v1, 0x5

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 96
    .local v7, "params":Lorg/json/JSONObject;
    const/4 v1, 0x6

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optBoolean(I)Z

    move-result v8

    .line 97
    .local v8, "trustEveryone":Z
    const/4 v1, 0x7

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optBoolean(I)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x7

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v9, 0x1

    .local v9, "chunkedMode":Z
    :goto_0
    move-object v1, p0

    .line 98
    invoke-virtual/range {v1 .. v9}, Lorg/apache/cordova/FileTransfer;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;ZZ)Lorg/apache/cordova/FileUploadResult;

    move-result-object v12

    .line 99
    .local v12, "r":Lorg/apache/cordova/FileUploadResult;
    const-string v1, "FileTransfer"

    const-string v13, "****** About to return a result from upload"

    invoke-static {v1, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v12}, Lorg/apache/cordova/FileUploadResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v14

    invoke-direct {v1, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_5

    .line 127
    .end local v4    # "fileKey":Ljava/lang/String;
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v6    # "mimeType":Ljava/lang/String;
    .end local v7    # "params":Lorg/json/JSONObject;
    .end local v8    # "trustEveryone":Z
    .end local v9    # "chunkedMode":Z
    .end local v12    # "r":Lorg/apache/cordova/FileUploadResult;
    :goto_1
    return-object v1

    .line 80
    :catch_0
    move-exception v10

    .line 81
    .local v10, "e":Lorg/json/JSONException;
    const-string v1, "FileTransfer"

    const-string v13, "Missing source or target"

    invoke-static {v1, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v14, "Missing source or target"

    invoke-direct {v1, v13, v14}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_1

    .line 97
    .end local v10    # "e":Lorg/json/JSONException;
    .restart local v4    # "fileKey":Ljava/lang/String;
    .restart local v5    # "fileName":Ljava/lang/String;
    .restart local v6    # "mimeType":Ljava/lang/String;
    .restart local v7    # "params":Lorg/json/JSONObject;
    .restart local v8    # "trustEveryone":Z
    :cond_1
    const/4 v9, 0x0

    goto :goto_0

    .line 101
    .end local v4    # "fileKey":Ljava/lang/String;
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v6    # "mimeType":Ljava/lang/String;
    .end local v7    # "params":Lorg/json/JSONObject;
    .end local v8    # "trustEveryone":Z
    :cond_2
    :try_start_2
    const-string v1, "download"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 102
    invoke-virtual {p0, v2, v3}, Lorg/apache/cordova/FileTransfer;->download(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 103
    .local v12, "r":Lorg/json/JSONObject;
    const-string v1, "FileTransfer"

    const-string v13, "****** About to return a result from download"

    invoke-static {v1, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13, v12}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_5

    goto :goto_1

    .line 108
    .end local v12    # "r":Lorg/json/JSONObject;
    :catch_1
    move-exception v10

    .line 109
    .local v10, "e":Ljava/io/FileNotFoundException;
    const-string v1, "FileTransfer"

    invoke-virtual {v10}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    sget v1, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 111
    .local v11, "error":Lorg/json/JSONObject;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto :goto_1

    .line 106
    .end local v10    # "e":Ljava/io/FileNotFoundException;
    .end local v11    # "error":Lorg/json/JSONObject;
    :cond_3
    :try_start_3
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_5

    goto :goto_1

    .line 112
    :catch_2
    move-exception v10

    .line 113
    .local v10, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "FileTransfer"

    invoke-virtual {v10}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    sget v1, Lorg/apache/cordova/FileTransfer;->INVALID_URL_ERR:I

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 115
    .restart local v11    # "error":Lorg/json/JSONObject;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto :goto_1

    .line 116
    .end local v10    # "e":Ljava/lang/IllegalArgumentException;
    .end local v11    # "error":Lorg/json/JSONObject;
    :catch_3
    move-exception v10

    .line 117
    .local v10, "e":Ljavax/net/ssl/SSLException;
    const-string v1, "FileTransfer"

    invoke-virtual {v10}, Ljavax/net/ssl/SSLException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    const-string v1, "FileTransfer"

    const-string v13, "Got my ssl exception!!!"

    invoke-static {v1, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget v1, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 120
    .restart local v11    # "error":Lorg/json/JSONObject;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 121
    .end local v10    # "e":Ljavax/net/ssl/SSLException;
    .end local v11    # "error":Lorg/json/JSONObject;
    :catch_4
    move-exception v10

    .line 122
    .local v10, "e":Ljava/io/IOException;
    const-string v1, "FileTransfer"

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    sget v1, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 124
    .restart local v11    # "error":Lorg/json/JSONObject;
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13, v11}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 125
    .end local v10    # "e":Ljava/io/IOException;
    .end local v11    # "error":Lorg/json/JSONObject;
    :catch_5
    move-exception v10

    .line 126
    .local v10, "e":Lorg/json/JSONException;
    const-string v1, "FileTransfer"

    invoke-virtual {v10}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v13, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto/16 :goto_1
.end method

.method public upload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;ZZ)Lorg/apache/cordova/FileUploadResult;
    .locals 33
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "server"    # Ljava/lang/String;
    .param p3, "fileKey"    # Ljava/lang/String;
    .param p4, "fileName"    # Ljava/lang/String;
    .param p5, "mimeType"    # Ljava/lang/String;
    .param p6, "params"    # Lorg/json/JSONObject;
    .param p7, "trustEveryone"    # Z
    .param p8, "chunkedMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 225
    new-instance v24, Lorg/apache/cordova/FileUploadResult;

    invoke-direct/range {v24 .. v24}, Lorg/apache/cordova/FileUploadResult;-><init>()V

    .line 228
    .local v24, "result":Lorg/apache/cordova/FileUploadResult;
    invoke-direct/range {p0 .. p1}, Lorg/apache/cordova/FileTransfer;->getPathFromUri(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v12

    check-cast v12, Ljava/io/FileInputStream;

    .line 230
    .local v12, "fileInputStream":Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 231
    .local v7, "conn":Ljava/net/HttpURLConnection;
    const/4 v9, 0x0

    .line 236
    .local v9, "dos":Ljava/io/DataOutputStream;
    const/16 v21, 0x1fa0

    .line 240
    .local v21, "maxBufferSize":I
    new-instance v29, Ljava/net/URL;

    move-object/from16 v0, v29

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 243
    .local v29, "url":Ljava/net/URL;
    invoke-virtual/range {v29 .. v29}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v30

    const-string v31, "https"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_4

    .line 245
    if-nez p7, :cond_3

    .line 246
    invoke-virtual/range {v29 .. v29}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    .end local v7    # "conn":Ljava/net/HttpURLConnection;
    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;

    .line 267
    .restart local v7    # "conn":Ljava/net/HttpURLConnection;
    :goto_0
    const/16 v30, 0x1

    move/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 270
    const/16 v30, 0x1

    move/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 273
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 276
    const-string v30, "POST"

    move-object/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 277
    const-string v30, "Connection"

    const-string v31, "Keep-Alive"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v7, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string v30, "Content-Type"

    const-string v31, "multipart/form-data;boundary=*****"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v7, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    :try_start_0
    const-string v30, "headers"

    move-object/from16 v0, p6

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 283
    .local v15, "headers":Lorg/json/JSONObject;
    invoke-virtual {v15}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v18

    .local v18, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_0

    .line 285
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 286
    .local v14, "headerKey":Ljava/lang/String;
    invoke-virtual {v15, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v7, v14, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 288
    .end local v14    # "headerKey":Ljava/lang/String;
    .end local v15    # "headers":Lorg/json/JSONObject;
    .end local v18    # "iter":Ljava/util/Iterator;
    :catch_0
    move-exception v30

    .line 293
    :cond_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 294
    .local v8, "cookie":Ljava/lang/String;
    if-eqz v8, :cond_1

    .line 295
    const-string v30, "Cookie"

    move-object/from16 v0, v30

    invoke-virtual {v7, v0, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    :cond_1
    const-string v11, ""

    .line 305
    .local v11, "extraParams":Ljava/lang/String;
    :try_start_1
    invoke-virtual/range {p6 .. p6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v18

    .restart local v18    # "iter":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_5

    .line 306
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .line 307
    .local v19, "key":Ljava/lang/Object;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v30

    const-string v31, "headers"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_2

    .line 309
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "--*****\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 310
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 311
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\r\n\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 312
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p6

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 313
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v11

    goto/16 :goto_2

    .line 252
    .end local v8    # "cookie":Ljava/lang/String;
    .end local v11    # "extraParams":Ljava/lang/String;
    .end local v18    # "iter":Ljava/util/Iterator;
    .end local v19    # "key":Ljava/lang/Object;
    :cond_3
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/FileTransfer;->trustAllHosts()V

    .line 253
    invoke-virtual/range {v29 .. v29}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v16

    check-cast v16, Ljavax/net/ssl/HttpsURLConnection;

    .line 255
    .local v16, "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual/range {v16 .. v16}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 257
    sget-object v30, Lorg/apache/cordova/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 258
    move-object/from16 v7, v16

    .line 259
    goto/16 :goto_0

    .line 263
    .end local v16    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_4
    invoke-virtual/range {v29 .. v29}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    .end local v7    # "conn":Ljava/net/HttpURLConnection;
    check-cast v7, Ljava/net/HttpURLConnection;

    .restart local v7    # "conn":Ljava/net/HttpURLConnection;
    goto/16 :goto_0

    .line 316
    .restart local v8    # "cookie":Ljava/lang/String;
    .restart local v11    # "extraParams":Ljava/lang/String;
    :catch_1
    move-exception v10

    .line 317
    .local v10, "e":Lorg/json/JSONException;
    const-string v30, "FileTransfer"

    invoke-virtual {v10}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-static {v0, v1, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 320
    .end local v10    # "e":Lorg/json/JSONException;
    :cond_5
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "--*****\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 321
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " filename=\""

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 323
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "\"\r\nContent-Type: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\r\n"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 324
    .local v22, "midParams":Ljava/lang/String;
    const-string v26, "\r\n--*****--\r\n"

    .line 327
    .local v26, "tailParams":Ljava/lang/String;
    if-eqz p8, :cond_6

    .line 328
    move/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 340
    :goto_3
    new-instance v9, Ljava/io/DataOutputStream;

    .end local v9    # "dos":Ljava/io/DataOutputStream;
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-direct {v9, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 341
    .restart local v9    # "dos":Ljava/io/DataOutputStream;
    invoke-virtual {v9, v11}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 343
    const-string v30, "UTF-8"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 344
    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 347
    invoke-virtual {v12}, Ljava/io/FileInputStream;->available()I

    move-result v5

    .line 348
    .local v5, "bytesAvailable":I
    move/from16 v0, v21

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 349
    .local v4, "bufferSize":I
    new-array v3, v4, [B

    .line 352
    .local v3, "buffer":[B
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v12, v3, v0, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v6

    .line 353
    .local v6, "bytesRead":I
    const-wide/16 v27, 0x0

    .line 355
    .local v27, "totalBytes":J
    :goto_4
    if-lez v6, :cond_7

    .line 356
    int-to-long v0, v6

    move-wide/from16 v30, v0

    add-long v27, v27, v30

    .line 357
    move-object/from16 v0, v24

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/FileUploadResult;->setBytesSent(J)V

    .line 358
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v9, v3, v0, v4}, Ljava/io/DataOutputStream;->write([BII)V

    .line 359
    invoke-virtual {v12}, Ljava/io/FileInputStream;->available()I

    move-result v5

    .line 360
    move/from16 v0, v21

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 361
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v12, v3, v0, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v6

    goto :goto_4

    .line 332
    .end local v3    # "buffer":[B
    .end local v4    # "bufferSize":I
    .end local v5    # "bytesAvailable":I
    .end local v6    # "bytesRead":I
    .end local v27    # "totalBytes":J
    :cond_6
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v30

    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->length()I

    move-result v31

    add-int v30, v30, v31

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v31

    add-int v30, v30, v31

    const-string v31, "UTF-8"

    move-object/from16 v0, p4

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v31

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    add-int v25, v30, v31

    .line 333
    .local v25, "stringLength":I
    const-string v30, "FileTransfer"

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "String Length: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    invoke-virtual {v12}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v30, v0

    add-int v13, v30, v25

    .line 335
    .local v13, "fixedLength":I
    const-string v30, "FileTransfer"

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "Content Length: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    invoke-virtual {v7, v13}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    goto/16 :goto_3

    .line 365
    .end local v13    # "fixedLength":I
    .end local v25    # "stringLength":I
    .restart local v3    # "buffer":[B
    .restart local v4    # "bufferSize":I
    .restart local v5    # "bytesAvailable":I
    .restart local v6    # "bytesRead":I
    .restart local v27    # "totalBytes":J
    :cond_7
    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 368
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V

    .line 369
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->flush()V

    .line 370
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->close()V

    .line 373
    new-instance v23, Ljava/lang/StringBuffer;

    const-string v30, ""

    move-object/from16 v0, v23

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 376
    .local v23, "responseString":Ljava/lang/StringBuffer;
    :try_start_2
    new-instance v17, Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v30

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 382
    .local v17, "inStream":Ljava/io/DataInputStream;
    :goto_5
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataInputStream;->readLine()Ljava/lang/String;

    move-result-object v20

    .local v20, "line":Ljava/lang/String;
    if-eqz v20, :cond_8

    .line 383
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 377
    .end local v17    # "inStream":Ljava/io/DataInputStream;
    .end local v20    # "line":Ljava/lang/String;
    :catch_2
    move-exception v10

    .line 378
    .local v10, "e":Ljava/io/FileNotFoundException;
    new-instance v30, Ljava/io/IOException;

    const-string v31, "Received error from server"

    invoke-direct/range {v30 .. v31}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 385
    .end local v10    # "e":Ljava/io/FileNotFoundException;
    .restart local v17    # "inStream":Ljava/io/DataInputStream;
    .restart local v20    # "line":Ljava/lang/String;
    :cond_8
    const-string v30, "FileTransfer"

    const-string v31, "got response from server"

    invoke-static/range {v30 .. v31}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    const-string v30, "FileTransfer"

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v30

    move-object/from16 v0, v24

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileUploadResult;->setResponseCode(I)V

    .line 390
    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v24

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileUploadResult;->setResponse(Ljava/lang/String;)V

    .line 392
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataInputStream;->close()V

    .line 393
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 396
    if-eqz p7, :cond_9

    invoke-virtual/range {v29 .. v29}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v30

    const-string v31, "https"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_9

    .line 397
    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;

    .end local v7    # "conn":Ljava/net/HttpURLConnection;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v7, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 401
    :cond_9
    return-object v24
.end method
