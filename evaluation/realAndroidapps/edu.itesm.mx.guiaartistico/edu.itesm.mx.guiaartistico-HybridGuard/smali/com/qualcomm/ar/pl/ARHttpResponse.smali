.class public Lcom/qualcomm/ar/pl/ARHttpResponse;
.super Ljava/lang/Object;
.source "ARHttpResponse.java"


# static fields
.field public static ERROR_CANCELED:I = 0x0

.field public static ERROR_NONE:I = 0x0

.field public static ERROR_OPERATION_FAILED:I = 0x0

.field public static ERROR_TIMEOUT:I = 0x0

.field private static final MODULENAME:Ljava/lang/String; = "ARHttpResponse"


# instance fields
.field public contentBytes:[B

.field public contentEncoding:Ljava/lang/String;

.field public contentType:Ljava/lang/String;

.field public networkStatus:I

.field public statusCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    .line 26
    const/4 v0, 0x1

    sput v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_CANCELED:I

    .line 27
    const/4 v0, 0x2

    sput v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_OPERATION_FAILED:I

    .line 28
    const/4 v0, 0x3

    sput v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_TIMEOUT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;
    .locals 3
    .param p0, "errorReason"    # I

    .prologue
    const/4 v1, 0x0

    .line 32
    if-lez p0, :cond_0

    const/4 v2, 0x4

    if-ge p0, v2, :cond_0

    .line 34
    new-instance v0, Lcom/qualcomm/ar/pl/ARHttpResponse;

    invoke-direct {v0}, Lcom/qualcomm/ar/pl/ARHttpResponse;-><init>()V

    .line 35
    .local v0, "arResponse":Lcom/qualcomm/ar/pl/ARHttpResponse;
    const/4 v2, 0x0

    iput v2, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->statusCode:I

    .line 36
    iput-object v1, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentBytes:[B

    .line 37
    iput-object v1, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentEncoding:Ljava/lang/String;

    .line 38
    iput-object v1, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentType:Ljava/lang/String;

    .line 40
    iput p0, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->networkStatus:I

    .line 44
    .end local v0    # "arResponse":Lcom/qualcomm/ar/pl/ARHttpResponse;
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method public static createARResponse(Lorg/apache/http/HttpResponse;)Lcom/qualcomm/ar/pl/ARHttpResponse;
    .locals 13
    .param p0, "httpResponse"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    new-instance v0, Lcom/qualcomm/ar/pl/ARHttpResponse;

    invoke-direct {v0}, Lcom/qualcomm/ar/pl/ARHttpResponse;-><init>()V

    .line 51
    .local v0, "arResponse":Lcom/qualcomm/ar/pl/ARHttpResponse;
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    .line 52
    .local v7, "status":Lorg/apache/http/StatusLine;
    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    iput v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->statusCode:I

    .line 53
    sget v9, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    iput v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->networkStatus:I

    .line 57
    const-string v9, "Content-Type"

    invoke-interface {p0, v9}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .local v5, "header":Lorg/apache/http/Header;
    if-eqz v5, :cond_0

    .line 59
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentType:Ljava/lang/String;

    .line 62
    :cond_0
    const-string v9, "Content-Encoding"

    invoke-interface {p0, v9}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 64
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentEncoding:Ljava/lang/String;

    .line 68
    :cond_1
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    .line 69
    .local v4, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v4, :cond_3

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-lez v9, :cond_3

    .line 71
    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v9

    long-to-int v9, v9

    new-array v9, v9, [B

    iput-object v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentBytes:[B

    .line 73
    new-instance v6, Ljava/io/DataInputStream;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v6, v9}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 74
    .local v6, "is":Ljava/io/DataInputStream;
    iget-object v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentBytes:[B

    invoke-virtual {v6, v9}, Ljava/io/DataInputStream;->readFully([B)V

    .line 92
    .end local v6    # "is":Ljava/io/DataInputStream;
    :cond_2
    :goto_0
    return-object v0

    .line 76
    :cond_3
    if-eqz v4, :cond_2

    .line 78
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 79
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/DataInputStream;

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v3, v9}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 80
    .local v3, "dis":Ljava/io/DataInputStream;
    const/16 v9, 0x800

    new-array v8, v9, [B

    .line 81
    .local v8, "xfer":[B
    const/4 v2, 0x0

    .line 82
    .local v2, "bytesRead":I
    :goto_1
    invoke-virtual {v3, v8}, Ljava/io/DataInputStream;->read([B)I

    move-result v2

    const/4 v9, -0x1

    if-eq v2, v9, :cond_4

    .line 83
    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 85
    :cond_4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    iput-object v9, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->contentBytes:[B

    goto :goto_0
.end method
