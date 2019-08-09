.class final Lcom/google/zxing/client/result/TelResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "TelResultParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    .line 29
    return-void
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/TelParsedResult;
    .locals 8
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x4

    .line 32
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    .line 33
    .local v2, "rawText":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string v4, "tel:"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "TEL:"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    move-object v4, v5

    .line 41
    :goto_0
    return-object v4

    .line 37
    :cond_1
    const-string v4, "TEL:"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "tel:"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 39
    .local v3, "telURI":Ljava/lang/String;
    :goto_1
    const/16 v4, 0x3f

    invoke-virtual {v2, v4, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 40
    .local v1, "queryStart":I
    if-gez v1, :cond_3

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "number":Ljava/lang/String;
    :goto_2
    new-instance v4, Lcom/google/zxing/client/result/TelParsedResult;

    invoke-direct {v4, v0, v3, v5}, Lcom/google/zxing/client/result/TelParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .end local v0    # "number":Ljava/lang/String;
    .end local v1    # "queryStart":I
    .end local v3    # "telURI":Ljava/lang/String;
    :cond_2
    move-object v3, v2

    .line 37
    goto :goto_1

    .line 40
    .restart local v1    # "queryStart":I
    .restart local v3    # "telURI":Ljava/lang/String;
    :cond_3
    invoke-virtual {v2, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method
