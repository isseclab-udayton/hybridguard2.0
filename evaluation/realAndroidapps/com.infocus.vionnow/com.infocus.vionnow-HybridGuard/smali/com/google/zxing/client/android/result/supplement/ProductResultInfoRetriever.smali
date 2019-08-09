.class final Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;
.super Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
.source "ProductResultInfoRetriever.java"


# static fields
.field private static final BASE_PRODUCT_URI:Ljava/lang/String;

.field private static final PRODUCT_NAME_PRICE_PATTERN:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final productID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    const-class v0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->TAG:Ljava/lang/String;

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://www.google."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/zxing/client/android/LocaleManager;->getProductSearchCountryTLD()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 44
    const-string v1, "/m/products?ie=utf8&oe=utf8&scoring=p&source=zxing&q="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    sput-object v0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->BASE_PRODUCT_URI:Ljava/lang/String;

    .line 46
    const-string v0, "owb63p\">([^<]+).+zdi3pb\">([^<]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 45
    sput-object v0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->PRODUCT_NAME_PRICE_PATTERN:Ljava/util/regex/Pattern;

    .line 38
    return-void
.end method

.method constructor <init>(Landroid/widget/TextView;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 0
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "productID"    # Ljava/lang/String;
    .param p3, "handler"    # Landroid/os/Handler;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0, p1, p3, p4}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;-><init>(Landroid/widget/TextView;Landroid/os/Handler;Landroid/content/Context;)V

    .line 54
    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->productID:Ljava/lang/String;

    .line 55
    return-void
.end method

.method private static consume(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .locals 9
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 81
    sget-object v6, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->TAG:Ljava/lang/String;

    const-string v7, "Consuming entity"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 83
    .local v4, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 85
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 86
    const/16 v6, 0x400

    new-array v0, v6, [B

    .line 88
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .local v1, "bytesRead":I
    if-gtz v1, :cond_1

    .line 95
    if-eqz v2, :cond_0

    .line 97
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 104
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    :cond_0
    :goto_1
    :try_start_2
    new-instance v6, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v6

    .line 89
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    :cond_1
    const/4 v6, 0x0

    :try_start_3
    invoke-virtual {v4, v0, v6, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 91
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    :catch_0
    move-exception v3

    .line 92
    .local v3, "ioe":Ljava/io/IOException;
    :try_start_4
    sget-object v6, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->TAG:Ljava/lang/String;

    invoke-static {v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 95
    if-eqz v2, :cond_0

    .line 97
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 98
    :catch_1
    move-exception v6

    goto :goto_1

    .line 94
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 95
    if-eqz v2, :cond_2

    .line 97
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 102
    :cond_2
    :goto_2
    throw v6

    .line 105
    :catch_2
    move-exception v5

    .line 107
    .local v5, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 98
    .end local v5    # "uee":Ljava/io/UnsupportedEncodingException;
    :catch_3
    move-exception v7

    goto :goto_2

    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    :catch_4
    move-exception v6

    goto :goto_1
.end method


# virtual methods
.method retrieveSupplementalInfo()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v8, p0, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->productID:Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "encodedProductID":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v9, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->BASE_PRODUCT_URI:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 63
    .local v7, "uri":Ljava/lang/String;
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 64
    .local v3, "head":Lorg/apache/http/client/methods/HttpUriRequest;
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/google/zxing/client/android/AndroidHttpClient;->newInstance(Ljava/lang/String;)Lcom/google/zxing/client/android/AndroidHttpClient;

    move-result-object v0

    .line 65
    .local v0, "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    invoke-virtual {v0, v3}, Lcom/google/zxing/client/android/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 66
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    .line 67
    .local v6, "status":I
    const/16 v8, 0xc8

    if-eq v6, v8, :cond_0

    .line 78
    :goto_0
    return-void

    .line 71
    :cond_0
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->consume(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "content":Ljava/lang/String;
    sget-object v8, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->PRODUCT_NAME_PRICE_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v8, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 73
    .local v4, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 74
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->append(Ljava/lang/String;)V

    .line 75
    const/4 v8, 0x2

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->append(Ljava/lang/String;)V

    .line 77
    :cond_1
    invoke-virtual {p0, v7}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;->setLink(Ljava/lang/String;)V

    goto :goto_0
.end method
