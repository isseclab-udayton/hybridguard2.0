.class final Lcom/google/zxing/client/result/URIResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "URIResultParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    .line 29
    return-void
.end method

.method static isBasicallyValidURI(Ljava/lang/String;)Z
    .locals 6
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 52
    if-eqz p0, :cond_0

    const/16 v5, 0x20

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_0

    const/16 v5, 0xa

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ltz v5, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v4

    .line 57
    :cond_1
    const/16 v5, 0x2e

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 58
    .local v3, "period":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    if-ge v3, v5, :cond_0

    .line 61
    const/16 v5, 0x3a

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 62
    .local v1, "colon":I
    if-gez v3, :cond_2

    if-ltz v1, :cond_0

    .line 65
    :cond_2
    if-ltz v1, :cond_4

    .line 66
    if-ltz v3, :cond_3

    if-le v3, v1, :cond_8

    .line 68
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-lt v2, v1, :cond_5

    .line 87
    .end local v2    # "i":I
    :cond_4
    const/4 v4, 0x1

    goto :goto_0

    .line 69
    .restart local v2    # "i":I
    :cond_5
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 70
    .local v0, "c":C
    const/16 v5, 0x61

    if-lt v0, v5, :cond_6

    const/16 v5, 0x7a

    if-le v0, v5, :cond_7

    :cond_6
    const/16 v5, 0x41

    if-lt v0, v5, :cond_0

    const/16 v5, 0x5a

    if-gt v0, v5, :cond_0

    .line 68
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 76
    .end local v0    # "c":C
    .end local v2    # "i":I
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    if-ge v1, v5, :cond_0

    .line 79
    add-int/lit8 v2, v1, 0x1

    .restart local v2    # "i":I
    :goto_2
    add-int/lit8 v5, v1, 0x3

    if-ge v2, v5, :cond_4

    .line 80
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 81
    .restart local v0    # "c":C
    const/16 v5, 0x30

    if-lt v0, v5, :cond_0

    const/16 v5, 0x39

    if-gt v0, v5, :cond_0

    .line 79
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    .locals 3
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "rawText":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "URL:"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 35
    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 37
    :cond_0
    if-eqz v0, :cond_1

    .line 38
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 40
    :cond_1
    invoke-static {v0}, Lcom/google/zxing/client/result/URIResultParser;->isBasicallyValidURI(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 43
    :goto_0
    return-object v1

    :cond_2
    new-instance v2, Lcom/google/zxing/client/result/URIParsedResult;

    invoke-direct {v2, v0, v1}, Lcom/google/zxing/client/result/URIParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    goto :goto_0
.end method
