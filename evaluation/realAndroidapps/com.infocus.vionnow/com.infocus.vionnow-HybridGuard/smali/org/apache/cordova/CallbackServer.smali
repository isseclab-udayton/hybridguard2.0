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

.field private jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

.field private port:I

.field private serverThread:Ljava/lang/Thread;

.field private token:Ljava/lang/String;

.field private usePolling:Z

.field private waitSocket:Ljava/net/ServerSocket;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 97
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 98
    iput v1, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 99
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
    .line 372
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 373
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 374
    const/16 v2, 0x25

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 375
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, v0, v1

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 376
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, v0, v1

    and-int/lit8 v3, v3, 0xf

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 373
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 378
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

    .line 336
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 337
    :cond_0
    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    throw v4

    .line 340
    :cond_1
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x10

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 344
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v3, -0x1

    .line 345
    .local v3, "start":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_a

    .line 346
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 347
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

    .line 350
    :cond_5
    if-ltz v3, :cond_6

    .line 351
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0, p1}, Lorg/apache/cordova/CallbackServer;->convert(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 352
    const/4 v3, -0x1

    .line 354
    :cond_6
    if-eq v1, v6, :cond_8

    .line 355
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 357
    :cond_8
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 360
    :cond_9
    if-gez v3, :cond_7

    .line 361
    move v3, v2

    goto :goto_1

    .line 365
    .end local v1    # "ch":C
    :cond_a
    if-ltz v3, :cond_b

    .line 366
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0, p1}, Lorg/apache/cordova/CallbackServer;->convert(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 368
    :cond_b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .prologue
    .line 294
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 295
    return-void
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lorg/apache/cordova/CallbackServer;->port:I

    return v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    return-object v0
.end method

.method public init(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 111
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 112
    iput v1, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 115
    if-eqz p1, :cond_0

    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iput-boolean v2, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 117
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 127
    :goto_0
    return-void

    .line 119
    :cond_0
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 120
    iput-boolean v2, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 121
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    goto :goto_0

    .line 124
    :cond_1
    iput-boolean v1, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    .line 125
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->startServer()V

    goto :goto_0
.end method

.method public onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .locals 1
    .param p1, "queue"    # Lorg/apache/cordova/NativeToJsMessageQueue;

    .prologue
    .line 298
    monitor-enter p0

    .line 299
    :try_start_0
    iput-object p1, p0, Lorg/apache/cordova/CallbackServer;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    .line 300
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 301
    monitor-exit p0

    .line 302
    return-void

    .line 301
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public restartServer()V
    .locals 0

    .prologue
    .line 171
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->stopServer()V

    .line 174
    invoke-virtual {p0}, Lorg/apache/cordova/CallbackServer;->startServer()V

    .line 175
    return-void
.end method

.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 185
    const/4 v8, 0x1

    :try_start_0
    iput-boolean v8, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 187
    new-instance v8, Ljava/net/ServerSocket;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v8, p0, Lorg/apache/cordova/CallbackServer;->waitSocket:Ljava/net/ServerSocket;

    .line 188
    iget-object v8, p0, Lorg/apache/cordova/CallbackServer;->waitSocket:Ljava/net/ServerSocket;

    invoke-virtual {v8}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v8

    iput v8, p0, Lorg/apache/cordova/CallbackServer;->port:I

    .line 190
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    .line 193
    :goto_0
    iget-boolean v8, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v8, :cond_2

    .line 195
    iget-object v8, p0, Lorg/apache/cordova/CallbackServer;->waitSocket:Ljava/net/ServerSocket;

    invoke-virtual {v8}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 196
    .local v0, "connection":Ljava/net/Socket;
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v9, 0x28

    invoke-direct {v7, v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 197
    .local v7, "xhrReader":Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-direct {v3, v8}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 198
    .local v3, "output":Ljava/io/DataOutputStream;
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 199
    .local v4, "request":Ljava/lang/String;
    const-string v6, ""

    .line 201
    .local v6, "response":Ljava/lang/String;
    iget-boolean v8, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v8, :cond_1

    if-eqz v4, :cond_1

    .line 202
    const-string v8, "GET"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 205
    const-string v8, " "

    invoke-virtual {v4, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 208
    .local v5, "requestParts":[Ljava/lang/String;
    array-length v8, v5

    const/4 v9, 0x3

    if-ne v8, v9, :cond_6

    const/4 v8, 0x1

    aget-object v8, v5, v8

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/cordova/CallbackServer;->token:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 210
    const/4 v2, 0x0

    .line 214
    .local v2, "js":Ljava/lang/String;
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    :goto_1
    :try_start_1
    iget-boolean v8, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v8, :cond_0

    .line 216
    iget-object v8, p0, Lorg/apache/cordova/CallbackServer;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    if-eqz v8, :cond_3

    .line 218
    iget-object v8, p0, Lorg/apache/cordova/CallbackServer;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v8}, Lorg/apache/cordova/NativeToJsMessageQueue;->pop()Ljava/lang/String;

    move-result-object v2

    .line 219
    if-eqz v2, :cond_3

    .line 230
    :cond_0
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 233
    :try_start_2
    iget-boolean v8, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v8, :cond_5

    .line 236
    if-nez v2, :cond_4

    .line 238
    const-string v6, "HTTP/1.1 404 NO DATA\r\n\r\n "

    .line 259
    .end local v2    # "js":Ljava/lang/String;
    .end local v5    # "requestParts":[Ljava/lang/String;
    :goto_3
    invoke-virtual {v3, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 260
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V

    .line 262
    :cond_1
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->close()V

    .line 263
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 265
    .end local v0    # "connection":Ljava/net/Socket;
    .end local v3    # "output":Ljava/io/DataOutputStream;
    .end local v4    # "request":Ljava/lang/String;
    .end local v6    # "response":Ljava/lang/String;
    .end local v7    # "xhrReader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 266
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 268
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    iput-boolean v10, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 270
    return-void

    .line 224
    .restart local v0    # "connection":Ljava/net/Socket;
    .restart local v2    # "js":Ljava/lang/String;
    .restart local v3    # "output":Ljava/io/DataOutputStream;
    .restart local v4    # "request":Ljava/lang/String;
    .restart local v5    # "requestParts":[Ljava/lang/String;
    .restart local v6    # "response":Ljava/lang/String;
    .restart local v7    # "xhrReader":Ljava/io/BufferedReader;
    :cond_3
    const-wide/16 v8, 0x2710

    :try_start_3
    invoke-virtual {p0, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 227
    :catch_1
    move-exception v8

    goto :goto_1

    .line 230
    :catchall_0
    move-exception v8

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v8

    .line 242
    :cond_4
    const-string v6, "HTTP/1.1 200 OK\r\n\r\n"

    .line 243
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-static {v2, v9}, Lorg/apache/cordova/CallbackServer;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_3

    .line 247
    :cond_5
    const-string v6, "HTTP/1.1 503 Service Unavailable\r\n\r\n "

    goto :goto_3

    .line 251
    .end local v2    # "js":Ljava/lang/String;
    :cond_6
    const-string v6, "HTTP/1.1 403 Forbidden\r\n\r\n "

    goto :goto_3

    .line 255
    .end local v5    # "requestParts":[Ljava/lang/String;
    :cond_7
    const-string v6, "HTTP/1.1 400 Bad Request\r\n\r\n "
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3
.end method

.method public startServer()V
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 161
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/apache/cordova/CallbackServer;->serverThread:Ljava/lang/Thread;

    .line 162
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->serverThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 163
    return-void
.end method

.method public stopServer()V
    .locals 1

    .prologue
    .line 278
    iget-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    if-eqz v0, :cond_0

    .line 279
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->active:Z

    .line 281
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/CallbackServer;->waitSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    :goto_0
    monitor-enter p0

    .line 285
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 286
    monitor-exit p0

    .line 288
    :cond_0
    return-void

    .line 286
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 281
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public usePolling()Z
    .locals 1

    .prologue
    .line 134
    iget-boolean v0, p0, Lorg/apache/cordova/CallbackServer;->usePolling:Z

    return v0
.end method
