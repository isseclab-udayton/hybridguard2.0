.class public Lcom/qualcomm/ar/pl/ARHttpRequest;
.super Ljava/lang/Object;
.source "ARHttpRequest.java"


# static fields
.field private static final MODULENAME:Ljava/lang/String; = "ARHttpRequest"


# instance fields
.field public content:[B

.field public contentEncoding:Ljava/lang/String;

.field public contentPath:Ljava/lang/String;

.field public contentType:Ljava/lang/String;

.field public headers:[Ljava/lang/String;

.field isQuery:Z

.field public method:Ljava/lang/String;

.field public nativeRequestPtr:J

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentType:Ljava/lang/String;

    .line 103
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentEncoding:Ljava/lang/String;

    .line 104
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentPath:Ljava/lang/String;

    .line 106
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->content:[B

    return-void
.end method

.method public static createHttpRequest(Lcom/qualcomm/ar/pl/ARHttpRequest;)Lorg/apache/http/client/methods/HttpUriRequest;
    .locals 8
    .param p0, "arRequest"    # Lcom/qualcomm/ar/pl/ARHttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 31
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->method:Ljava/lang/String;

    const-string v6, "POST"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 33
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->url:Ljava/lang/String;

    invoke-direct {v3, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 36
    .local v3, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    array-length v5, v5

    div-int/lit8 v5, v5, 0x2

    if-ge v4, v5, :cond_0

    .line 39
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    mul-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    iget-object v6, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    mul-int/lit8 v7, v4, 0x2

    add-int/lit8 v7, v7, 0x1

    aget-object v6, v6, v7

    invoke-virtual {v3, v5, v6}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 42
    :cond_0
    iget-boolean v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->isQuery:Z

    if-nez v5, :cond_3

    .line 46
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentPath:Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 49
    new-instance v1, Lorg/apache/http/entity/FileEntity;

    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentPath:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentType:Ljava/lang/String;

    invoke-direct {v1, v5, v6}, Lorg/apache/http/entity/FileEntity;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v3, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 87
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v3    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    :cond_1
    :goto_1
    return-object v3

    .line 52
    .restart local v3    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    :cond_2
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->content:[B

    if-eqz v5, :cond_1

    .line 55
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->content:[B

    invoke-direct {v0, v5}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 56
    .local v0, "bae":Lorg/apache/http/entity/ByteArrayEntity;
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->contentType:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 58
    move-object v1, v0

    .line 59
    .restart local v1    # "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v3, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    goto :goto_1

    .line 70
    .end local v0    # "bae":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    :cond_3
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    const-string v5, ""

    const-string v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .restart local v1    # "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v3, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    goto :goto_1

    .line 76
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v3    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v4    # "i":I
    :cond_4
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->method:Ljava/lang/String;

    const-string v6, "GET"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 78
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->url:Ljava/lang/String;

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 81
    .local v2, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    array-length v5, v5

    div-int/lit8 v5, v5, 0x2

    if-ge v4, v5, :cond_5

    .line 84
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    mul-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    iget-object v6, p0, Lcom/qualcomm/ar/pl/ARHttpRequest;->headers:[Ljava/lang/String;

    mul-int/lit8 v7, v4, 0x2

    add-int/lit8 v7, v7, 0x1

    aget-object v6, v6, v7

    invoke-virtual {v2, v5, v6}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_5
    move-object v3, v2

    .line 87
    goto :goto_1

    .line 90
    .end local v2    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v4    # "i":I
    :cond_6
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    const-string v6, "Attemped to use an unsupported HTTP operation"

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5
.end method
