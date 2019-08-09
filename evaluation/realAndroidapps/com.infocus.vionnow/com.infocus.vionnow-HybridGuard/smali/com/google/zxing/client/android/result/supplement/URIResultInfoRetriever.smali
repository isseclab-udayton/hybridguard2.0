.class final Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;
.super Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
.source "URIResultInfoRetriever.java"


# static fields
.field private static final REDIRECTOR_HOSTS:[Ljava/lang/String;


# instance fields
.field private final redirectString:Ljava/lang/String;

.field private final result:Lcom/google/zxing/client/result/URIParsedResult;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 34
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 35
    const-string v2, "http://bit.ly/"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 36
    const-string v2, "http://tinyurl.com/"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 37
    const-string v2, "http://tr.im/"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 38
    const-string v2, "http://goo.gl/"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 39
    const-string v2, "http://ow.ly/"

    aput-object v2, v0, v1

    .line 34
    sput-object v0, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->REDIRECTOR_HOSTS:[Ljava/lang/String;

    .line 32
    return-void
.end method

.method constructor <init>(Landroid/widget/TextView;Lcom/google/zxing/client/result/URIParsedResult;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "result"    # Lcom/google/zxing/client/result/URIParsedResult;
    .param p3, "handler"    # Landroid/os/Handler;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1, p3, p4}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;-><init>(Landroid/widget/TextView;Landroid/os/Handler;Landroid/content/Context;)V

    .line 48
    sget v0, Lcom/google/zxing/client/android/R$string;->msg_redirect:I

    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->redirectString:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->result:Lcom/google/zxing/client/result/URIParsedResult;

    .line 50
    return-void
.end method

.method private static isRedirector(Ljava/lang/String;)Z
    .locals 6
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 87
    sget-object v3, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->REDIRECTOR_HOSTS:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-lt v2, v4, :cond_0

    .line 92
    :goto_1
    return v1

    .line 87
    :cond_0
    aget-object v0, v3, v2

    .line 88
    .local v0, "redirectorHost":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 89
    const/4 v1, 0x1

    goto :goto_1

    .line 87
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static unredirect(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->isRedirector(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 83
    .end local p0    # "uri":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 70
    .restart local p0    # "uri":Ljava/lang/String;
    :cond_1
    new-instance v1, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v1, p0}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/lang/String;)V

    .line 71
    .local v1, "head":Lorg/apache/http/client/methods/HttpUriRequest;
    const/4 v6, 0x0

    invoke-static {v6}, Lcom/google/zxing/client/android/AndroidHttpClient;->newInstance(Ljava/lang/String;)Lcom/google/zxing/client/android/AndroidHttpClient;

    move-result-object v0

    .line 72
    .local v0, "client":Lcom/google/zxing/client/android/AndroidHttpClient;
    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 73
    .local v4, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    .line 74
    .local v5, "status":I
    const/16 v6, 0x12d

    if-eq v5, v6, :cond_2

    const/16 v6, 0x12e

    if-ne v5, v6, :cond_0

    .line 75
    :cond_2
    const-string v6, "Location"

    invoke-interface {v4, v6}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 76
    .local v3, "redirect":Lorg/apache/http/Header;
    if-eqz v3, :cond_0

    .line 77
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "location":Ljava/lang/String;
    if-eqz v2, :cond_0

    move-object p0, v2

    .line 79
    goto :goto_0
.end method


# virtual methods
.method retrieveSupplementalInfo()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v3, p0, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->result:Lcom/google/zxing/client/result/URIParsedResult;

    invoke-virtual {v3}, Lcom/google/zxing/client/result/URIParsedResult;->getURI()Ljava/lang/String;

    move-result-object v2

    .line 55
    .local v2, "oldURI":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->unredirect(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "newURI":Ljava/lang/String;
    const/4 v0, 0x0

    .line 57
    .local v0, "count":I
    :goto_0
    const/4 v3, 0x3

    if-ge v0, v3, :cond_0

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 63
    :cond_0
    invoke-virtual {p0, v1}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->setLink(Ljava/lang/String;)V

    .line 64
    return-void

    .line 58
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->redirectString:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->append(Ljava/lang/String;)V

    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    move-object v2, v1

    .line 61
    invoke-static {v1}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;->unredirect(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
