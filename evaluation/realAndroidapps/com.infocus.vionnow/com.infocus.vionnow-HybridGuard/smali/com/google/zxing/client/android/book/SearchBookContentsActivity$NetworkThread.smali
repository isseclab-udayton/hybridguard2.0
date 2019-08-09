.class final Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;
.super Ljava/lang/Thread;
.source "SearchBookContentsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/book/SearchBookContentsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NetworkThread"
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final isbn:Ljava/lang/String;

.field private final query:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0
    .param p1, "isbn"    # Ljava/lang/String;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 245
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 246
    iput-object p1, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->isbn:Ljava/lang/String;

    .line 247
    iput-object p2, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->query:Ljava/lang/String;

    .line 248
    iput-object p3, p0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->handler:Landroid/os/Handler;

    .line 249
    return-void
.end method

.method private static getCookie(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 303
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "cookie":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2

    .line 305
    :cond_0
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$4()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Book Search cookie was missing or expired"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    new-instance v4, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v4, p0}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/lang/String;)V

    .line 307
    .local v4, "head":Lorg/apache/http/client/methods/HttpUriRequest;
    const-string v7, "ZXing (Android)"

    invoke-static {v7}, Lcom/google/zxing/client/android/AndroidHttpClient;->newInstance(Ljava/lang/String;)Lcom/google/zxing/client/android/AndroidHttpClient;

    move-result-object v0

    .line 309
    .local v0, "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    :try_start_0
    invoke-virtual {v0, v4}, Lcom/google/zxing/client/android/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 310
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_1

    .line 311
    const-string v7, "set-cookie"

    invoke-interface {v5, v7}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .line 312
    .local v2, "cookies":[Lorg/apache/http/Header;
    array-length v8, v2

    const/4 v7, 0x0

    :goto_0
    if-lt v7, v8, :cond_3

    .line 315
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 316
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 321
    .end local v2    # "cookies":[Lorg/apache/http/Header;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lcom/google/zxing/client/android/AndroidHttpClient;->close()V

    .line 323
    .end local v0    # "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    .end local v4    # "head":Lorg/apache/http/client/methods/HttpUriRequest;
    :cond_2
    return-object v1

    .line 312
    .restart local v0    # "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    .restart local v2    # "cookies":[Lorg/apache/http/Header;
    .restart local v4    # "head":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v5    # "response":Lorg/apache/http/HttpResponse;
    :cond_3
    :try_start_1
    aget-object v6, v2, v7

    .line 313
    .local v6, "theCookie":Lorg/apache/http/Header;
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v9

    invoke-interface {v6}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, p0, v10}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 312
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 318
    .end local v2    # "cookies":[Lorg/apache/http/Header;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "theCookie":Lorg/apache/http/Header;
    :catch_0
    move-exception v3

    .line 319
    .local v3, "e":Ljava/io/IOException;
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$4()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error setting book search cookie"

    invoke-static {v7, v8, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private static getEncoding(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .locals 1
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 330
    const-string v0, "windows-1252"

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 19

    .prologue
    .line 253
    const/4 v9, 0x0

    .line 259
    .local v9, "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->isbn:Ljava/lang/String;

    const-string v3, "http://google.com/books?id="

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 260
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->isbn:Ljava/lang/String;

    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    .line 261
    .local v12, "equals":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->isbn:Ljava/lang/String;

    add-int/lit8 v3, v12, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 262
    .local v18, "volumeId":Ljava/lang/String;
    new-instance v1, Ljava/net/URI;

    const-string v2, "http"

    const/4 v3, 0x0

    const-string v4, "www.google.com"

    const/4 v5, -0x1

    const-string v6, "/books"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "id="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 263
    const-string v8, "&jscmd=SearchWithinVolume2&q="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->query:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    .line 262
    invoke-direct/range {v1 .. v8}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .end local v12    # "equals":I
    .end local v18    # "volumeId":Ljava/lang/String;
    .local v1, "uri":Ljava/net/URI;
    :goto_0
    new-instance v13, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v13, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    .line 269
    .local v13, "get":Lorg/apache/http/client/methods/HttpUriRequest;
    const-string v2, "cookie"

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v13, v2, v3}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const-string v2, "ZXing (Android)"

    invoke-static {v2}, Lcom/google/zxing/client/android/AndroidHttpClient;->newInstance(Ljava/lang/String;)Lcom/google/zxing/client/android/AndroidHttpClient;

    move-result-object v9

    .line 271
    invoke-virtual {v9, v13}, Lcom/google/zxing/client/android/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v17

    .line 272
    .local v17, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_2

    .line 273
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    .line 274
    .local v11, "entity":Lorg/apache/http/HttpEntity;
    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 275
    .local v15, "jsonHolder":Ljava/io/ByteArrayOutputStream;
    invoke-interface {v11, v15}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 276
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 277
    new-instance v14, Lorg/json/JSONObject;

    invoke-static {v11}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->getEncoding(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v14, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 278
    .local v14, "json":Lorg/json/JSONObject;
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 280
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->handler:Landroid/os/Handler;

    sget v3, Lcom/google/zxing/client/android/R$id;->search_book_contents_succeeded:I

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v16

    .line 281
    .local v16, "message":Landroid/os/Message;
    move-object/from16 v0, v16

    iput-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 282
    invoke-virtual/range {v16 .. v16}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    .end local v11    # "entity":Lorg/apache/http/HttpEntity;
    .end local v14    # "json":Lorg/json/JSONObject;
    .end local v15    # "jsonHolder":Ljava/io/ByteArrayOutputStream;
    :goto_1
    if-eqz v9, :cond_0

    .line 294
    invoke-virtual {v9}, Lcom/google/zxing/client/android/AndroidHttpClient;->close()V

    .line 297
    .end local v1    # "uri":Ljava/net/URI;
    .end local v13    # "get":Lorg/apache/http/client/methods/HttpUriRequest;
    .end local v17    # "response":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_2
    return-void

    .line 265
    .end local v16    # "message":Landroid/os/Message;
    :cond_1
    :try_start_1
    new-instance v1, Ljava/net/URI;

    const-string v2, "http"

    const/4 v3, 0x0

    const-string v4, "www.google.com"

    const/4 v5, -0x1

    const-string v6, "/books"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "vid=isbn"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->isbn:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 266
    const-string v8, "&jscmd=SearchWithinVolume2&q="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->query:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    .line 265
    invoke-direct/range {v1 .. v8}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v1    # "uri":Ljava/net/URI;
    goto/16 :goto_0

    .line 284
    .restart local v13    # "get":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v17    # "response":Lorg/apache/http/HttpResponse;
    :cond_2
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$4()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "HTTP returned "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->handler:Landroid/os/Handler;

    sget v3, Lcom/google/zxing/client/android/R$id;->search_book_contents_failed:I

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v16

    .line 286
    .restart local v16    # "message":Landroid/os/Message;
    invoke-virtual/range {v16 .. v16}, Landroid/os/Message;->sendToTarget()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 288
    .end local v1    # "uri":Ljava/net/URI;
    .end local v13    # "get":Lorg/apache/http/client/methods/HttpUriRequest;
    .end local v16    # "message":Landroid/os/Message;
    .end local v17    # "response":Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v10

    .line 289
    .local v10, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsActivity;->access$4()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Error accessing book search"

    invoke-static {v2, v3, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 290
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/book/SearchBookContentsActivity$NetworkThread;->handler:Landroid/os/Handler;

    sget v3, Lcom/google/zxing/client/android/R$id;->search_book_contents_failed:I

    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v16

    .line 291
    .restart local v16    # "message":Landroid/os/Message;
    invoke-virtual/range {v16 .. v16}, Landroid/os/Message;->sendToTarget()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 293
    if-eqz v9, :cond_0

    .line 294
    invoke-virtual {v9}, Lcom/google/zxing/client/android/AndroidHttpClient;->close()V

    goto/16 :goto_2

    .line 292
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v16    # "message":Landroid/os/Message;
    :catchall_0
    move-exception v2

    .line 293
    if-eqz v9, :cond_3

    .line 294
    invoke-virtual {v9}, Lcom/google/zxing/client/android/AndroidHttpClient;->close()V

    .line 296
    :cond_3
    throw v2
.end method
