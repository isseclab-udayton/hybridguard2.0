.class public Lorg/apache/cordova/CallbackServer;
.super Ljava/lang/Object;
.source "CallbackServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "CallbackServer"

.field static final digits:Ljava/lang/String; = "0123456789ABCDEF"


# instance fields
.field private active:Z

.field private empty:Z

.field private javascript:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private port:I

.field private serverThread:Ljava/lang/Thread;

.field private token:Ljava/lang/String;

.field private usePolling:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 99
    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 100
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->empty:Z

    .line 101
    iput v0, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 102
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    .line 103
    return-void
.end method

.method private static convert(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "buf"    # Ljava/lang/StringBuilder;
    .param p2, "enc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 417
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 418
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 419
    const/16 v2, 0x25

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 420
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, v0, v1

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, v0, v1

    and-int/lit8 v3, v3, 0xf

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 418
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 423
    :cond_0
    return-void
.end method

.method public static encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "enc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    .line 381
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 382
    :cond_0
    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    throw v4

    .line 385
    :cond_1
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x10

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 389
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v3, -0x1

    .line 390
    .local v3, "start":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_a

    .line 391
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 392
    .local v1, "ch":C
    const/16 v4, 0x61

    if-lt v1, v4, :cond_2

    const/16 v4, 0x7a

    if-le v1, v4, :cond_5

    :cond_2
    const/16 v4, 0x41

    if-lt v1, v4, :cond_3

    const/16 v4, 0x5a

    if-le v1, v4, :cond_5

    :cond_3
    const/16 v4, 0x30

    if-lt v1, v4, :cond_4

    const/16 v4, 0x39

    if-le v1, v4, :cond_5

    :cond_4
    const-string v4, " .-*_\'(),<>=?@[]{}:~\"\\/;!"

    invoke-virtual {v4, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_9

    .line 395
    :cond_5
    if-ltz v3, :cond_6

    .line 396
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0, p1}, Lorg/apache/cordova/CallbackServer;->convert(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 397
    const/4 v3, -0x1

    .line 399
    :cond_6
    if-eq v1, v6, :cond_8

    .line 400
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 390
    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 402
    :cond_8
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 405
    :cond_9
    if-gez v3, :cond_7

    .line 406
    move v3, v2

    goto :goto_1

    .line 410
    .end local v1    # "ch":C
    :cond_a
    if-ltz v3, :cond_b

    .line 411
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0, p1}, Lorg/apache/cordova/CallbackServer;->convert(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 413
    :cond_b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .prologue
    .line 303
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 304
    return-void
.end method

.method public getJavascript()Ljava/lang/String;
    .locals 3

    .prologue
    .line 324
    monitor-enter p0

    .line 325
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 326
    const/4 v0, 0x0

    monitor-exit p0

    .line 332
    :goto_0
    return-object v0

    .line 328
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 329
    .local v0, "statement":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 330
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->empty:Z

    .line 332
    :cond_1
    monitor-exit p0

    goto :goto_0

    .line 333
    .end local v0    # "statement":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lorg/apache/cordova/CallbackServer;->port:I

    return v0
.end method

.method public getSize()I
    .locals 2

    .prologue
    .line 312
    monitor-enter p0

    .line 313
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v0

    .line 314
    .local v0, "size":I
    monitor-exit p0

    return v0

    .line 315
    .end local v0    # "size":I
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    return-object v0
.end method

.method public init(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 115
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 116
    iput-boolean v2, p0, Lorg/apache/cordova/CallbackServer;->empty:Z

    .line 117
    iput v1, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 118
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    .line 121
    if-eqz p1, :cond_0

    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iput-boolean v2, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 123
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 133
    :goto_0
    return-void

    .line 125
    :cond_0
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 126
    iput-boolean v2, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 127
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    goto :goto_0

    .line 130
    :cond_1
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 131
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->startServer()V

    goto :goto_0
.end method

.method public reinit(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 141
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 142
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CallbackServer;->init(Ljava/lang/String;)V

    .line 143
    return-void
.end method

.method public restartServer()V
    .locals 0

    .prologue
    .line 187
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 190
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->startServer()V

    .line 191
    return-void
.end method

.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 201
    const/4 v9, 0x1

    :try_start_0
    iput-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 203
    new-instance v7, Ljava/net/ServerSocket;

    const/4 v9, 0x0

    invoke-direct {v7, v9}, Ljava/net/ServerSocket;-><init>(I)V

    .line 204
    .local v7, "waitSocket":Ljava/net/ServerSocket;
    invoke-virtual {v7}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v9

    iput v9, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 206
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    .line 209
    :goto_0
    iget-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v9, :cond_3

    .line 211
    invoke-virtual {v7}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 212
    .local v0, "connection":Ljava/net/Socket;
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v10, 0x28

    invoke-direct {v8, v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 213
    .local v8, "xhrReader":Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v3, v9}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 214
    .local v3, "output":Ljava/io/DataOutputStream;
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 215
    .local v4, "request":Ljava/lang/String;
    const-string v6, ""

    .line 217
    .local v6, "response":Ljava/lang/String;
    iget-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v9, :cond_2

    if-eqz v4, :cond_2

    .line 218
    const-string v9, "GET"

    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 221
    const-string v9, " "

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 224
    .local v5, "requestParts":[Ljava/lang/String;
    array-length v9, v5

    const/4 v10, 0x3

    if-ne v9, v10, :cond_6

    const/4 v9, 0x1

    aget-object v9, v5, v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 229
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_1
    :try_start_1
    iget-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->empty:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v9, :cond_0

    .line 232
    const-wide/16 v9, 0x2710

    :try_start_2
    invoke-virtual {p0, v9, v10}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 238
    :cond_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 241
    :try_start_4
    iget-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v9, :cond_5

    .line 244
    iget-boolean v9, p0, Lorg/apache/cordova/CallbackServer;->empty:Z

    if-eqz v9, :cond_4

    .line 246
    const-string v6, "HTTP/1.1 404 NO DATA\r\n\r\n "

    .line 270
    .end local v5    # "requestParts":[Ljava/lang/String;
    :cond_1
    :goto_2
    invoke-virtual {v3, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 271
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V

    .line 273
    :cond_2
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->close()V

    .line 274
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 276
    .end local v0    # "connection":Ljava/net/Socket;
    .end local v3    # "output":Ljava/io/DataOutputStream;
    .end local v4    # "request":Ljava/lang/String;
    .end local v6    # "response":Ljava/lang/String;
    .end local v7    # "waitSocket":Ljava/net/ServerSocket;
    .end local v8    # "xhrReader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 277
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 279
    .end local v1    # "e":Ljava/io/IOException;
    :cond_3
    iput-boolean v11, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 281
    return-void

    .line 238
    .restart local v0    # "connection":Ljava/net/Socket;
    .restart local v3    # "output":Ljava/io/DataOutputStream;
    .restart local v4    # "request":Ljava/lang/String;
    .restart local v5    # "requestParts":[Ljava/lang/String;
    .restart local v6    # "response":Ljava/lang/String;
    .restart local v7    # "waitSocket":Ljava/net/ServerSocket;
    .restart local v8    # "xhrReader":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v9

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v9

    .line 250
    :cond_4
    const-string v6, "HTTP/1.1 200 OK\r\n\r\n"

    .line 251
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->getJavascript()Ljava/lang/String;

    move-result-object v2

    .line 252
    .local v2, "js":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 253
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "UTF-8"

    invoke-static {v2, v10}, Lorg/apache/cordova/CallbackServer;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 258
    .end local v2    # "js":Ljava/lang/String;
    :cond_5
    const-string v6, "HTTP/1.1 503 Service Unavailable\r\n\r\n "

    goto :goto_2

    .line 262
    :cond_6
    const-string v6, "HTTP/1.1 403 Forbidden\r\n\r\n "

    goto :goto_2

    .line 266
    .end local v5    # "requestParts":[Ljava/lang/String;
    :cond_7
    const-string v6, "HTTP/1.1 400 Bad Request\r\n\r\n "
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_2

    .line 235
    .restart local v5    # "requestParts":[Ljava/lang/String;
    :catch_1
    move-exception v9

    goto :goto_1
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 1
    .param p1, "statement"    # Ljava/lang/String;

    .prologue
    .line 342
    monitor-enter p0

    .line 343
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->javascript:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 344
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->empty:Z

    .line 345
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 346
    monitor-exit p0

    .line 347
    return-void

    .line 346
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public startServer()V
    .locals 1

    .prologue
    .line 174
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 177
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/apache/cordova/CallbackServer;->serverThread:Ljava/lang/Thread;

    .line 178
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->serverThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 179
    return-void
.end method

.method public stopServer()V
    .locals 1

    .prologue
    .line 289
    iget-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v0, :cond_0

    .line 290
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 293
    monitor-enter p0

    .line 294
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 295
    monitor-exit p0

    .line 297
    :cond_0
    return-void

    .line 295
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public usePolling()Z
    .locals 1

    .prologue
    .line 150
    iget-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    return v0
.end method
