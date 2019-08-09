.class public Lorg/apache/cordova/FileTransfer;
.super Lorg/apache/cordova/api/Plugin;
.source "FileTransfer.java"


# static fields
.field private static final BOUNDARY:Ljava/lang/String; = "*****"

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
    .line 63
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    .line 64
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/FileTransfer;->INVALID_URL_ERR:I

    .line 65
    const/4 v0, 0x3

    sput v0, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    .line 358
    new-instance v0, Lorg/apache/cordova/FileTransfer$1;

    invoke-direct {v0}, Lorg/apache/cordova/FileTransfer$1;-><init>()V

    sput-object v0, Lorg/apache/cordova/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    .line 67
    iput-object v0, p0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 68
    iput-object v0, p0, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method private createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "errorCode"    # I
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "httpStatus"    # Ljava/lang/Integer;

    .prologue
    .line 422
    const/4 v1, 0x0

    .line 424
    .local v1, "error":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 425
    .end local v1    # "error":Lorg/json/JSONObject;
    .local v2, "error":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, "code"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 426
    const-string v3, "source"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 427
    const-string v3, "target"

    invoke-virtual {v2, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 428
    if-eqz p4, :cond_0

    .line 429
    const-string v3, "http_status"

    invoke-virtual {v2, v3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    move-object v1, v2

    .line 434
    .end local v2    # "error":Lorg/json/JSONObject;
    .restart local v1    # "error":Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 431
    :catch_0
    move-exception v0

    .line 432
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v3, "FileTransfer"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 431
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

.method private createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "errorCode"    # I
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "connection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 403
    const/4 v1, 0x0

    .line 405
    .local v1, "httpStatus":Ljava/lang/Integer;
    if-eqz p4, :cond_0

    .line 407
    :try_start_0
    invoke-virtual {p4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 413
    :cond_0
    :goto_0
    invoke-direct {p0, p1, p2, p3, v1}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "FileTransfer"

    const-string v3, "Error getting HTTP status code from connection."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private download(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 20
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;

    .prologue
    .line 463
    const-string v17, "FileTransfer"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "download "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " to "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    const/4 v7, 0x0

    .line 467
    .local v7, "connection":Ljava/net/HttpURLConnection;
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/cordova/FileTransfer;->getFileFromPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v11

    .line 470
    .local v11, "file":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->mkdirs()Z

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer;->webView:Lorg/apache/cordova/CordovaWebView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 475
    new-instance v16, Ljava/net/URL;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 476
    .local v16, "url":Ljava/net/URL;
    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v17

    move-object/from16 v0, v17

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v7, v0

    .line 477
    const-string v17, "GET"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 480
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 481
    .local v8, "cookie":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 483
    const-string v17, "cookie"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    :cond_0
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->connect()V

    .line 488
    const-string v17, "FileTransfer"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Download file: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->connect()V

    .line 492
    const-string v17, "FileTransfer"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Download file:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 495
    :try_start_1
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v14

    .line 501
    .local v14, "inputStream":Ljava/io/InputStream;
    const/16 v17, 0x400

    :try_start_2
    move/from16 v0, v17

    new-array v5, v0, [B

    .line 502
    .local v5, "buffer":[B
    const/4 v6, 0x0

    .line 504
    .local v6, "bytesRead":I
    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 507
    .local v15, "outputStream":Ljava/io/FileOutputStream;
    :goto_0
    invoke-virtual {v14, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-lez v6, :cond_2

    .line 508
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v15, v5, v0, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 528
    .end local v5    # "buffer":[B
    .end local v6    # "bytesRead":I
    .end local v8    # "cookie":Ljava/lang/String;
    .end local v11    # "file":Ljava/io/File;
    .end local v14    # "inputStream":Ljava/io/InputStream;
    .end local v15    # "outputStream":Ljava/io/FileOutputStream;
    .end local v16    # "url":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 529
    .local v9, "e":Ljava/io/FileNotFoundException;
    :try_start_3
    sget v17, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v7}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v10

    .line 530
    .local v10, "error":Lorg/json/JSONObject;
    const-string v17, "FileTransfer"

    const-string v18, "I got a file not found exception"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    const-string v17, "FileTransfer"

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 532
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v18, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 542
    if-eqz v7, :cond_1

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .end local v9    # "e":Ljava/io/FileNotFoundException;
    .end local v10    # "error":Lorg/json/JSONObject;
    :cond_1
    :goto_1
    return-object v17

    .line 496
    .restart local v8    # "cookie":Ljava/lang/String;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v16    # "url":Ljava/net/URL;
    :catch_1
    move-exception v9

    .line 497
    .restart local v9    # "e":Ljava/io/FileNotFoundException;
    :try_start_4
    const-string v17, "FileTransfer"

    invoke-virtual {v9}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 498
    new-instance v17, Ljava/io/IOException;

    const-string v18, "Received error from server"

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 533
    .end local v8    # "cookie":Ljava/lang/String;
    .end local v9    # "e":Ljava/io/FileNotFoundException;
    .end local v11    # "file":Ljava/io/File;
    .end local v16    # "url":Ljava/net/URL;
    :catch_2
    move-exception v9

    .line 534
    .local v9, "e":Ljava/net/MalformedURLException;
    :try_start_5
    sget v17, Lorg/apache/cordova/FileTransfer;->INVALID_URL_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v7}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v10

    .line 535
    .restart local v10    # "error":Lorg/json/JSONObject;
    const-string v17, "FileTransfer"

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 536
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v18, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 542
    if-eqz v7, :cond_1

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_1

    .line 511
    .end local v9    # "e":Ljava/net/MalformedURLException;
    .end local v10    # "error":Lorg/json/JSONObject;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bytesRead":I
    .restart local v8    # "cookie":Ljava/lang/String;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v14    # "inputStream":Ljava/io/InputStream;
    .restart local v15    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v16    # "url":Ljava/net/URL;
    :cond_2
    :try_start_6
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V

    .line 513
    const-string v17, "FileTransfer"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Saved file: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    new-instance v13, Lorg/apache/cordova/FileUtils;

    invoke-direct {v13}, Lorg/apache/cordova/FileUtils;-><init>()V

    .line 517
    .local v13, "fileUtil":Lorg/apache/cordova/FileUtils;
    invoke-virtual {v13, v11}, Lorg/apache/cordova/FileUtils;->getEntry(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v12

    .line 519
    .local v12, "fileEntry":Lorg/json/JSONObject;
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v18, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v12}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 542
    if-eqz v7, :cond_1

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_1

    .line 523
    .end local v5    # "buffer":[B
    .end local v6    # "bytesRead":I
    .end local v8    # "cookie":Ljava/lang/String;
    .end local v12    # "fileEntry":Lorg/json/JSONObject;
    .end local v13    # "fileUtil":Lorg/apache/cordova/FileUtils;
    .end local v14    # "inputStream":Ljava/io/InputStream;
    .end local v15    # "outputStream":Ljava/io/FileOutputStream;
    .end local v16    # "url":Ljava/net/URL;
    :cond_3
    :try_start_7
    const-string v17, "FileTransfer"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Source URL is not in white list: \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "\'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    sget v17, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    const/16 v18, 0x191

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object v10

    .line 525
    .restart local v10    # "error":Lorg/json/JSONObject;
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v18, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 542
    if-eqz v7, :cond_1

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_1

    .line 537
    .end local v10    # "error":Lorg/json/JSONObject;
    .end local v11    # "file":Ljava/io/File;
    :catch_3
    move-exception v9

    .line 538
    .local v9, "e":Ljava/lang/Exception;
    :try_start_8
    sget v17, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v7}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v10

    .line 539
    .restart local v10    # "error":Lorg/json/JSONObject;
    const-string v17, "FileTransfer"

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 540
    new-instance v17, Lorg/apache/cordova/api/PluginResult;

    sget-object v18, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 542
    if-eqz v7, :cond_1

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_1

    .line 542
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v10    # "error":Lorg/json/JSONObject;
    :catchall_0
    move-exception v17

    if-eqz v7, :cond_4

    .line 543
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_4
    throw v17
.end method

.method private getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "position"    # I
    .param p3, "defaultString"    # Ljava/lang/String;

    .prologue
    .line 445
    move-object v0, p3

    .line 446
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v1, p2, :cond_1

    .line 447
    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    .line 448
    if-eqz v0, :cond_0

    const-string v1, "null"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 449
    :cond_0
    move-object v0, p3

    .line 452
    :cond_1
    return-object v0
.end method

.method private getFileFromPath(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 581
    const-string v1, "file://"

    .line 583
    .local v1, "prefix":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 584
    new-instance v0, Ljava/io/File;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 589
    .local v0, "file":Ljava/io/File;
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 590
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2}, Ljava/io/FileNotFoundException;-><init>()V

    throw v2

    .line 586
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "file":Ljava/io/File;
    goto :goto_0

    .line 593
    :cond_1
    return-object v0
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

    .line 556
    const-string v2, "content:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 557
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 558
    .local v1, "uri":Landroid/net/Uri;
    iget-object v2, p0, Lorg/apache/cordova/FileTransfer;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 569
    .end local v1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v2

    .line 560
    :cond_0
    const-string v2, "file://"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 561
    const-string v2, "?"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 562
    .local v0, "question":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 563
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 565
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 569
    .end local v0    # "question":I
    :cond_2
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private trustAllHosts()V
    .locals 5

    .prologue
    .line 374
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lorg/apache/cordova/FileTransfer$2;

    invoke-direct {v4, p0}, Lorg/apache/cordova/FileTransfer$2;-><init>(Lorg/apache/cordova/FileTransfer;)V

    aput-object v4, v2, v3

    .line 391
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_0
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 393
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 394
    .local v1, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 395
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-static {v3}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    .end local v1    # "sc":Ljavax/net/ssl/SSLContext;
    :goto_0
    return-void

    .line 396
    :catch_0
    move-exception v0

    .line 397
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "FileTransfer"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private upload(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/apache/cordova/api/PluginResult;
    .locals 49
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "args"    # Lorg/json/JSONArray;

    .prologue
    .line 107
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "upload "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    const-string v48, " to "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/4 v9, 0x0

    .line 112
    .local v9, "conn":Ljava/net/HttpURLConnection;
    const/16 v46, 0x2

    :try_start_0
    const-string v47, "file"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v46

    move-object/from16 v3, v47

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 113
    .local v17, "fileKey":Ljava/lang/String;
    const/16 v46, 0x3

    const-string v47, "image.jpg"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v46

    move-object/from16 v3, v47

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 114
    .local v18, "fileName":Ljava/lang/String;
    const/16 v46, 0x4

    const-string v47, "image/jpeg"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v46

    move-object/from16 v3, v47

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/cordova/FileTransfer;->getArgument(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 115
    .local v32, "mimeType":Ljava/lang/String;
    const/16 v46, 0x5

    move-object/from16 v0, p3

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v33

    .line 116
    .local v33, "params":Lorg/json/JSONObject;
    if-nez v33, :cond_0

    new-instance v33, Lorg/json/JSONObject;

    .end local v33    # "params":Lorg/json/JSONObject;
    invoke-direct/range {v33 .. v33}, Lorg/json/JSONObject;-><init>()V

    .line 117
    .restart local v33    # "params":Lorg/json/JSONObject;
    :cond_0
    const/16 v46, 0x6

    move-object/from16 v0, p3

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optBoolean(I)Z

    move-result v43

    .line 118
    .local v43, "trustEveryone":Z
    const/16 v46, 0x7

    move-object/from16 v0, p3

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optBoolean(I)Z

    move-result v46

    if-nez v46, :cond_1

    const/16 v46, 0x7

    move-object/from16 v0, p3

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v46

    if-eqz v46, :cond_6

    :cond_1
    const/4 v8, 0x1

    .line 119
    .local v8, "chunkedMode":Z
    :goto_0
    const/16 v46, 0x8

    move-object/from16 v0, p3

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v23

    .line 121
    .local v23, "headers":Lorg/json/JSONObject;
    if-nez v23, :cond_2

    if-eqz v33, :cond_2

    .line 122
    const-string v46, "headers"

    move-object/from16 v0, v33

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v23

    .line 125
    :cond_2
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "fileKey: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "fileName: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "mimeType: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "params: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "trustEveryone: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "chunkedMode: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "headers: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    new-instance v37, Lorg/apache/cordova/FileUploadResult;

    invoke-direct/range {v37 .. v37}, Lorg/apache/cordova/FileUploadResult;-><init>()V

    .line 137
    .local v37, "result":Lorg/apache/cordova/FileUploadResult;
    invoke-direct/range {p0 .. p1}, Lorg/apache/cordova/FileTransfer;->getPathFromUri(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v16

    check-cast v16, Ljava/io/FileInputStream;

    .line 139
    .local v16, "fileInputStream":Ljava/io/FileInputStream;
    const/4 v11, 0x0

    .line 144
    .local v11, "dos":Ljava/io/DataOutputStream;
    const/16 v30, 0x1fa0

    .line 148
    .local v30, "maxBufferSize":I
    new-instance v44, Ljava/net/URL;

    move-object/from16 v0, v44

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 149
    .local v44, "url":Ljava/net/URL;
    invoke-virtual/range {v44 .. v44}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v46

    const-string v47, "https"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    .line 151
    .local v45, "useHttps":Z
    if-eqz v45, :cond_8

    .line 153
    if-nez v43, :cond_7

    .line 154
    invoke-virtual/range {v44 .. v44}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v46

    move-object/from16 v0, v46

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v9, v0

    .line 175
    :goto_1
    const/16 v46, 0x1

    move/from16 v0, v46

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 178
    const/16 v46, 0x1

    move/from16 v0, v46

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 181
    const/16 v46, 0x0

    move/from16 v0, v46

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 184
    const-string v46, "POST"

    move-object/from16 v0, v46

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 185
    const-string v46, "Connection"

    const-string v47, "Keep-Alive"

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string v46, "Content-Type"

    const-string v47, "multipart/form-data;boundary=*****"

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v46

    move-object/from16 v0, v46

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 190
    .local v10, "cookie":Ljava/lang/String;
    if-eqz v10, :cond_3

    .line 191
    const-string v46, "Cookie"

    move-object/from16 v0, v46

    invoke-virtual {v9, v0, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    :cond_3
    if-eqz v23, :cond_9

    .line 197
    :try_start_1
    invoke-virtual/range {v23 .. v23}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v27

    .local v27, "iter":Ljava/util/Iterator;
    :cond_4
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v46

    if-eqz v46, :cond_9

    .line 198
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v21

    .line 199
    .local v21, "headerKey":Ljava/lang/String;
    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 200
    .local v22, "headerValues":Lorg/json/JSONArray;
    if-nez v22, :cond_5

    .line 201
    new-instance v22, Lorg/json/JSONArray;

    .end local v22    # "headerValues":Lorg/json/JSONArray;
    invoke-direct/range {v22 .. v22}, Lorg/json/JSONArray;-><init>()V

    .line 202
    .restart local v22    # "headerValues":Lorg/json/JSONArray;
    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v22

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 204
    :cond_5
    const/16 v46, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v21

    move-object/from16 v1, v46

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    const/16 v25, 0x1

    .local v25, "i":I
    :goto_2
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v46

    move/from16 v0, v25

    move/from16 v1, v46

    if-ge v0, v1, :cond_4

    .line 206
    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v21

    move-object/from16 v1, v46

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    add-int/lit8 v25, v25, 0x1

    goto :goto_2

    .line 118
    .end local v8    # "chunkedMode":Z
    .end local v10    # "cookie":Ljava/lang/String;
    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v21    # "headerKey":Ljava/lang/String;
    .end local v22    # "headerValues":Lorg/json/JSONArray;
    .end local v23    # "headers":Lorg/json/JSONObject;
    .end local v25    # "i":I
    .end local v27    # "iter":Ljava/util/Iterator;
    .end local v30    # "maxBufferSize":I
    .end local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .end local v44    # "url":Ljava/net/URL;
    .end local v45    # "useHttps":Z
    :cond_6
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 160
    .restart local v8    # "chunkedMode":Z
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v23    # "headers":Lorg/json/JSONObject;
    .restart local v30    # "maxBufferSize":I
    .restart local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .restart local v44    # "url":Ljava/net/URL;
    .restart local v45    # "useHttps":Z
    :cond_7
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/FileTransfer;->trustAllHosts()V

    .line 161
    invoke-virtual/range {v44 .. v44}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v24

    check-cast v24, Ljavax/net/ssl/HttpsURLConnection;

    .line 163
    .local v24, "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual/range {v24 .. v24}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v46

    move-object/from16 v0, v46

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 165
    sget-object v46, Lorg/apache/cordova/FileTransfer;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v0, v24

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 166
    move-object/from16 v9, v24

    .line 167
    goto/16 :goto_1

    .line 171
    .end local v24    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_8
    invoke-virtual/range {v44 .. v44}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v46

    move-object/from16 v0, v46

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v9, v0

    goto/16 :goto_1

    .line 209
    .restart local v10    # "cookie":Ljava/lang/String;
    :catch_0
    move-exception v46

    .line 218
    :cond_9
    const-string v15, ""
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 220
    .local v15, "extraParams":Ljava/lang/String;
    :try_start_3
    invoke-virtual/range {v33 .. v33}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v27

    .restart local v27    # "iter":Ljava/util/Iterator;
    :cond_a
    :goto_3
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v46

    if-eqz v46, :cond_b

    .line 221
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    .line 222
    .local v28, "key":Ljava/lang/Object;
    invoke-static/range {v28 .. v28}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    const-string v47, "headers"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v46

    if-nez v46, :cond_a

    .line 224
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "--*****\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 225
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\";"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 226
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\r\n\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 227
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v33

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 228
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v15

    goto/16 :goto_3

    .line 231
    .end local v27    # "iter":Ljava/util/Iterator;
    .end local v28    # "key":Ljava/lang/Object;
    :catch_1
    move-exception v12

    .line 232
    .local v12, "e":Lorg/json/JSONException;
    :try_start_4
    const-string v46, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 235
    .end local v12    # "e":Lorg/json/JSONException;
    :cond_b
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "--*****\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 236
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v46

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    move-object/from16 v0, v46

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\";"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, " filename=\""

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 237
    const-string v46, "UTF-8"

    move-object/from16 v0, v46

    invoke-virtual {v15, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v14

    .line 239
    .local v14, "extraBytes":[B
    new-instance v46, Ljava/lang/StringBuilder;

    invoke-direct/range {v46 .. v46}, Ljava/lang/StringBuilder;-><init>()V

    const-string v47, "\"\r\nContent-Type: "

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    move-object/from16 v0, v46

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "\r\n"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    .line 240
    .local v31, "midParams":Ljava/lang/String;
    const-string v40, "\r\n--*****--\r\n"

    .line 241
    .local v40, "tailParams":Ljava/lang/String;
    const-string v46, "UTF-8"

    move-object/from16 v0, v18

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v19

    .line 243
    .local v19, "fileNameBytes":[B
    array-length v0, v14

    move/from16 v46, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v47

    add-int v46, v46, v47

    invoke-virtual/range {v40 .. v40}, Ljava/lang/String;->length()I

    move-result v47

    add-int v46, v46, v47

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v47, v0

    add-int v38, v46, v47

    .line 244
    .local v38, "stringLength":I
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "String Length: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v46

    move-wide/from16 v0, v46

    long-to-int v0, v0

    move/from16 v46, v0

    add-int v20, v46, v38

    .line 246
    .local v20, "fixedLength":I
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "Content Length: "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    if-eqz v8, :cond_e

    sget v46, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v47, 0x8

    move/from16 v0, v46

    move/from16 v1, v47

    if-lt v0, v1, :cond_c

    if-eqz v45, :cond_e

    :cond_c
    const/4 v8, 0x1

    .line 252
    :goto_4
    if-eqz v8, :cond_f

    .line 253
    move/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 256
    const-string v46, "Transfer-Encoding"

    const-string v47, "chunked"

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    :goto_5
    new-instance v11, Ljava/io/DataOutputStream;

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-direct {v11, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 263
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    invoke-virtual {v11, v14}, Ljava/io/DataOutputStream;->write([B)V

    .line 264
    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 265
    move-object/from16 v0, v31

    invoke-virtual {v11, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 268
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->available()I

    move-result v6

    .line 269
    .local v6, "bytesAvailable":I
    move/from16 v0, v30

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 270
    .local v5, "bufferSize":I
    new-array v4, v5, [B

    .line 273
    .local v4, "buffer":[B
    const/16 v46, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v46

    invoke-virtual {v0, v4, v1, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v7

    .line 274
    .local v7, "bytesRead":I
    const-wide/16 v41, 0x0

    .line 276
    .local v41, "totalBytes":J
    const-wide/16 v34, 0x0

    .line 277
    .local v34, "prevBytesRead":J
    :goto_6
    if-lez v7, :cond_11

    .line 278
    int-to-long v0, v7

    move-wide/from16 v46, v0

    add-long v41, v41, v46

    .line 279
    move-object/from16 v0, v37

    move-wide/from16 v1, v41

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/FileUploadResult;->setBytesSent(J)V

    .line 280
    const/16 v46, 0x0

    move/from16 v0, v46

    invoke-virtual {v11, v4, v0, v5}, Ljava/io/DataOutputStream;->write([BII)V

    .line 281
    const-wide/32 v46, 0x19000

    add-long v46, v46, v34

    cmp-long v46, v41, v46

    if-lez v46, :cond_d

    .line 282
    move-wide/from16 v34, v41

    .line 283
    const-string v46, "FileTransfer"

    new-instance v47, Ljava/lang/StringBuilder;

    invoke-direct/range {v47 .. v47}, Ljava/lang/StringBuilder;-><init>()V

    const-string v48, "Uploaded "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-wide/from16 v1, v41

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v47

    const-string v48, " of "

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v47

    const-string v48, " bytes"

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    :cond_d
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->available()I

    move-result v6

    .line 286
    move/from16 v0, v30

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 287
    const/16 v46, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v46

    invoke-virtual {v0, v4, v1, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v7

    goto :goto_6

    .line 250
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v34    # "prevBytesRead":J
    .end local v41    # "totalBytes":J
    :cond_e
    const/4 v8, 0x0

    goto/16 :goto_4

    .line 258
    :cond_f
    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_5

    .line 330
    .end local v8    # "chunkedMode":Z
    .end local v10    # "cookie":Ljava/lang/String;
    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .end local v14    # "extraBytes":[B
    .end local v15    # "extraParams":Ljava/lang/String;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "fileKey":Ljava/lang/String;
    .end local v18    # "fileName":Ljava/lang/String;
    .end local v19    # "fileNameBytes":[B
    .end local v20    # "fixedLength":I
    .end local v23    # "headers":Lorg/json/JSONObject;
    .end local v30    # "maxBufferSize":I
    .end local v31    # "midParams":Ljava/lang/String;
    .end local v32    # "mimeType":Ljava/lang/String;
    .end local v33    # "params":Lorg/json/JSONObject;
    .end local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .end local v38    # "stringLength":I
    .end local v40    # "tailParams":Ljava/lang/String;
    .end local v43    # "trustEveryone":Z
    .end local v44    # "url":Ljava/net/URL;
    .end local v45    # "useHttps":Z
    :catch_2
    move-exception v12

    .line 331
    .local v12, "e":Ljava/io/FileNotFoundException;
    :try_start_5
    sget v46, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v46

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v9}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v13

    .line 332
    .local v13, "error":Lorg/json/JSONObject;
    const-string v46, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 333
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .end local v12    # "e":Ljava/io/FileNotFoundException;
    .end local v13    # "error":Lorg/json/JSONObject;
    :cond_10
    :goto_7
    return-object v46

    .line 291
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v6    # "bytesAvailable":I
    .restart local v7    # "bytesRead":I
    .restart local v8    # "chunkedMode":Z
    .restart local v10    # "cookie":Ljava/lang/String;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "extraBytes":[B
    .restart local v15    # "extraParams":Ljava/lang/String;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "fileKey":Ljava/lang/String;
    .restart local v18    # "fileName":Ljava/lang/String;
    .restart local v19    # "fileNameBytes":[B
    .restart local v20    # "fixedLength":I
    .restart local v23    # "headers":Lorg/json/JSONObject;
    .restart local v30    # "maxBufferSize":I
    .restart local v31    # "midParams":Ljava/lang/String;
    .restart local v32    # "mimeType":Ljava/lang/String;
    .restart local v33    # "params":Lorg/json/JSONObject;
    .restart local v34    # "prevBytesRead":J
    .restart local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .restart local v38    # "stringLength":I
    .restart local v40    # "tailParams":Ljava/lang/String;
    .restart local v41    # "totalBytes":J
    .restart local v43    # "trustEveryone":Z
    .restart local v44    # "url":Ljava/net/URL;
    .restart local v45    # "useHttps":Z
    :cond_11
    :try_start_6
    move-object/from16 v0, v40

    invoke-virtual {v11, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 294
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V

    .line 295
    invoke-virtual {v11}, Ljava/io/DataOutputStream;->flush()V

    .line 296
    invoke-virtual {v11}, Ljava/io/DataOutputStream;->close()V

    .line 299
    new-instance v36, Ljava/lang/StringBuffer;

    const-string v46, ""

    move-object/from16 v0, v36

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 302
    .local v36, "responseString":Ljava/lang/StringBuffer;
    :try_start_7
    new-instance v26, Ljava/io/DataInputStream;

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v46

    move-object/from16 v0, v26

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 309
    .local v26, "inStream":Ljava/io/DataInputStream;
    :goto_8
    :try_start_8
    invoke-virtual/range {v26 .. v26}, Ljava/io/DataInputStream;->readLine()Ljava/lang/String;

    move-result-object v29

    .local v29, "line":Ljava/lang/String;
    if-eqz v29, :cond_12

    .line 310
    move-object/from16 v0, v36

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_8

    .line 334
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v8    # "chunkedMode":Z
    .end local v10    # "cookie":Ljava/lang/String;
    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .end local v14    # "extraBytes":[B
    .end local v15    # "extraParams":Ljava/lang/String;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "fileKey":Ljava/lang/String;
    .end local v18    # "fileName":Ljava/lang/String;
    .end local v19    # "fileNameBytes":[B
    .end local v20    # "fixedLength":I
    .end local v23    # "headers":Lorg/json/JSONObject;
    .end local v26    # "inStream":Ljava/io/DataInputStream;
    .end local v29    # "line":Ljava/lang/String;
    .end local v30    # "maxBufferSize":I
    .end local v31    # "midParams":Ljava/lang/String;
    .end local v32    # "mimeType":Ljava/lang/String;
    .end local v33    # "params":Lorg/json/JSONObject;
    .end local v34    # "prevBytesRead":J
    .end local v36    # "responseString":Ljava/lang/StringBuffer;
    .end local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .end local v38    # "stringLength":I
    .end local v40    # "tailParams":Ljava/lang/String;
    .end local v41    # "totalBytes":J
    .end local v43    # "trustEveryone":Z
    .end local v44    # "url":Ljava/net/URL;
    .end local v45    # "useHttps":Z
    :catch_3
    move-exception v12

    .line 335
    .local v12, "e":Ljava/net/MalformedURLException;
    :try_start_9
    sget v46, Lorg/apache/cordova/FileTransfer;->INVALID_URL_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v46

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v9}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v13

    .line 336
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v46, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 337
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_7

    .line 303
    .end local v12    # "e":Ljava/net/MalformedURLException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v6    # "bytesAvailable":I
    .restart local v7    # "bytesRead":I
    .restart local v8    # "chunkedMode":Z
    .restart local v10    # "cookie":Ljava/lang/String;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "extraBytes":[B
    .restart local v15    # "extraParams":Ljava/lang/String;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "fileKey":Ljava/lang/String;
    .restart local v18    # "fileName":Ljava/lang/String;
    .restart local v19    # "fileNameBytes":[B
    .restart local v20    # "fixedLength":I
    .restart local v23    # "headers":Lorg/json/JSONObject;
    .restart local v30    # "maxBufferSize":I
    .restart local v31    # "midParams":Ljava/lang/String;
    .restart local v32    # "mimeType":Ljava/lang/String;
    .restart local v33    # "params":Lorg/json/JSONObject;
    .restart local v34    # "prevBytesRead":J
    .restart local v36    # "responseString":Ljava/lang/StringBuffer;
    .restart local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .restart local v38    # "stringLength":I
    .restart local v40    # "tailParams":Ljava/lang/String;
    .restart local v41    # "totalBytes":J
    .restart local v43    # "trustEveryone":Z
    .restart local v44    # "url":Ljava/net/URL;
    .restart local v45    # "useHttps":Z
    :catch_4
    move-exception v12

    .line 304
    .local v12, "e":Ljava/io/FileNotFoundException;
    :try_start_a
    const-string v46, "FileTransfer"

    invoke-virtual {v12}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 305
    new-instance v46, Ljava/io/IOException;

    const-string v47, "Received error from server"

    invoke-direct/range {v46 .. v47}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v46
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 338
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v8    # "chunkedMode":Z
    .end local v10    # "cookie":Ljava/lang/String;
    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .end local v12    # "e":Ljava/io/FileNotFoundException;
    .end local v14    # "extraBytes":[B
    .end local v15    # "extraParams":Ljava/lang/String;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "fileKey":Ljava/lang/String;
    .end local v18    # "fileName":Ljava/lang/String;
    .end local v19    # "fileNameBytes":[B
    .end local v20    # "fixedLength":I
    .end local v23    # "headers":Lorg/json/JSONObject;
    .end local v30    # "maxBufferSize":I
    .end local v31    # "midParams":Ljava/lang/String;
    .end local v32    # "mimeType":Ljava/lang/String;
    .end local v33    # "params":Lorg/json/JSONObject;
    .end local v34    # "prevBytesRead":J
    .end local v36    # "responseString":Ljava/lang/StringBuffer;
    .end local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .end local v38    # "stringLength":I
    .end local v40    # "tailParams":Ljava/lang/String;
    .end local v41    # "totalBytes":J
    .end local v43    # "trustEveryone":Z
    .end local v44    # "url":Ljava/net/URL;
    .end local v45    # "useHttps":Z
    :catch_5
    move-exception v12

    .line 339
    .local v12, "e":Ljava/io/IOException;
    :try_start_b
    sget v46, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v46

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v9}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v13

    .line 340
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v46, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 341
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_7

    .line 312
    .end local v12    # "e":Ljava/io/IOException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v6    # "bytesAvailable":I
    .restart local v7    # "bytesRead":I
    .restart local v8    # "chunkedMode":Z
    .restart local v10    # "cookie":Ljava/lang/String;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "extraBytes":[B
    .restart local v15    # "extraParams":Ljava/lang/String;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "fileKey":Ljava/lang/String;
    .restart local v18    # "fileName":Ljava/lang/String;
    .restart local v19    # "fileNameBytes":[B
    .restart local v20    # "fixedLength":I
    .restart local v23    # "headers":Lorg/json/JSONObject;
    .restart local v26    # "inStream":Ljava/io/DataInputStream;
    .restart local v29    # "line":Ljava/lang/String;
    .restart local v30    # "maxBufferSize":I
    .restart local v31    # "midParams":Ljava/lang/String;
    .restart local v32    # "mimeType":Ljava/lang/String;
    .restart local v33    # "params":Lorg/json/JSONObject;
    .restart local v34    # "prevBytesRead":J
    .restart local v36    # "responseString":Ljava/lang/StringBuffer;
    .restart local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .restart local v38    # "stringLength":I
    .restart local v40    # "tailParams":Ljava/lang/String;
    .restart local v41    # "totalBytes":J
    .restart local v43    # "trustEveryone":Z
    .restart local v44    # "url":Ljava/net/URL;
    .restart local v45    # "useHttps":Z
    :cond_12
    :try_start_c
    const-string v46, "FileTransfer"

    const-string v47, "got response from server"

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    const-string v46, "FileTransfer"

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v46

    move-object/from16 v0, v37

    move/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileUploadResult;->setResponseCode(I)V

    .line 317
    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v37

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileUploadResult;->setResponse(Ljava/lang/String;)V

    .line 319
    invoke-virtual/range {v26 .. v26}, Ljava/io/DataInputStream;->close()V

    .line 322
    if-eqz v43, :cond_13

    invoke-virtual/range {v44 .. v44}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v46

    const-string v47, "https"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v46

    if-eqz v46, :cond_13

    .line 323
    move-object v0, v9

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer;->defaultHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v47, v0

    invoke-virtual/range {v46 .. v47}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer;->defaultSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    move-object/from16 v46, v0

    invoke-static/range {v46 .. v46}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 327
    :cond_13
    const-string v46, "FileTransfer"

    const-string v47, "****** About to return a result from upload"

    invoke-static/range {v46 .. v47}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v37 .. v37}, Lorg/apache/cordova/FileUploadResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v48

    invoke-direct/range {v46 .. v48}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_c
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_c .. :try_end_c} :catch_3
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_5
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_7

    .line 342
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v8    # "chunkedMode":Z
    .end local v10    # "cookie":Ljava/lang/String;
    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .end local v14    # "extraBytes":[B
    .end local v15    # "extraParams":Ljava/lang/String;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "fileKey":Ljava/lang/String;
    .end local v18    # "fileName":Ljava/lang/String;
    .end local v19    # "fileNameBytes":[B
    .end local v20    # "fixedLength":I
    .end local v23    # "headers":Lorg/json/JSONObject;
    .end local v26    # "inStream":Ljava/io/DataInputStream;
    .end local v29    # "line":Ljava/lang/String;
    .end local v30    # "maxBufferSize":I
    .end local v31    # "midParams":Ljava/lang/String;
    .end local v32    # "mimeType":Ljava/lang/String;
    .end local v33    # "params":Lorg/json/JSONObject;
    .end local v34    # "prevBytesRead":J
    .end local v36    # "responseString":Ljava/lang/StringBuffer;
    .end local v37    # "result":Lorg/apache/cordova/FileUploadResult;
    .end local v38    # "stringLength":I
    .end local v40    # "tailParams":Ljava/lang/String;
    .end local v41    # "totalBytes":J
    .end local v43    # "trustEveryone":Z
    .end local v44    # "url":Ljava/net/URL;
    .end local v45    # "useHttps":Z
    :catch_6
    move-exception v12

    .line 343
    .local v12, "e":Lorg/json/JSONException;
    :try_start_d
    const-string v46, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 344
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct/range {v46 .. v47}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_7

    .line 345
    .end local v12    # "e":Lorg/json/JSONException;
    :catch_7
    move-exception v39

    .line 347
    .local v39, "t":Ljava/lang/Throwable;
    :try_start_e
    sget v46, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    move/from16 v1, v46

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v9}, Lorg/apache/cordova/FileTransfer;->createFileTransferError(ILjava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Lorg/json/JSONObject;

    move-result-object v13

    .line 348
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v46, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    move-object/from16 v2, v39

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 349
    new-instance v46, Lorg/apache/cordova/api/PluginResult;

    sget-object v47, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 351
    if-eqz v9, :cond_10

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_7

    .line 351
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v39    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v46

    if-eqz v9, :cond_14

    .line 352
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_14
    throw v46
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackId"    # Ljava/lang/String;

    .prologue
    .line 75
    const/4 v1, 0x0

    .line 76
    .local v1, "source":Ljava/lang/String;
    const/4 v2, 0x0

    .line 78
    .local v2, "target":Ljava/lang/String;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 79
    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 85
    const-string v3, "upload"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    invoke-static {v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v2, p2}, Lorg/apache/cordova/FileTransfer;->upload(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v3

    .line 90
    :goto_0
    return-object v3

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "FileTransfer"

    const-string v4, "Missing source or target"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    const-string v5, "Missing source or target"

    invoke-direct {v3, v4, v5}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    goto :goto_0

    .line 87
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const-string v3, "download"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 88
    invoke-direct {p0, v1, v2}, Lorg/apache/cordova/FileTransfer;->download(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v3

    goto :goto_0

    .line 90
    :cond_1
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_0
.end method
