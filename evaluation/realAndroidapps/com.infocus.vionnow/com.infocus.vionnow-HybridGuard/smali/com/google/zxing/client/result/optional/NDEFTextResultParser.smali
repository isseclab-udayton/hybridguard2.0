.class final Lcom/google/zxing/client/result/optional/NDEFTextResultParser;
.super Lcom/google/zxing/client/result/optional/AbstractNDEFResultParser;
.source "NDEFTextResultParser.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/google/zxing/client/result/optional/AbstractNDEFResultParser;-><init>()V

    return-void
.end method

.method static decodeTextPayload([B)[Ljava/lang/String;
    .locals 10
    .param p0, "payload"    # [B

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 47
    aget-byte v4, p0, v7

    .line 48
    .local v4, "statusByte":B
    and-int/lit16 v8, v4, 0x80

    if-eqz v8, :cond_0

    move v1, v6

    .line 49
    .local v1, "isUTF16":Z
    :goto_0
    and-int/lit8 v3, v4, 0x1f

    .line 51
    .local v3, "languageLength":I
    const-string v8, "US-ASCII"

    invoke-static {p0, v6, v3, v8}, Lcom/google/zxing/client/result/optional/NDEFTextResultParser;->bytesToString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "language":Ljava/lang/String;
    if-eqz v1, :cond_1

    const-string v0, "UTF-16"

    .line 53
    .local v0, "encoding":Ljava/lang/String;
    :goto_1
    add-int/lit8 v8, v3, 0x1

    array-length v9, p0

    sub-int/2addr v9, v3

    add-int/lit8 v9, v9, -0x1

    invoke-static {p0, v8, v9, v0}, Lcom/google/zxing/client/result/optional/NDEFTextResultParser;->bytesToString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 54
    .local v5, "text":Ljava/lang/String;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/String;

    aput-object v2, v8, v7

    aput-object v5, v8, v6

    return-object v8

    .end local v0    # "encoding":Ljava/lang/String;
    .end local v1    # "isUTF16":Z
    .end local v2    # "language":Ljava/lang/String;
    .end local v3    # "languageLength":I
    .end local v5    # "text":Ljava/lang/String;
    :cond_0
    move v1, v7

    .line 48
    goto :goto_0

    .line 52
    .restart local v1    # "isUTF16":Z
    .restart local v2    # "language":Ljava/lang/String;
    .restart local v3    # "languageLength":I
    :cond_1
    const-string v0, "UTF8"

    goto :goto_1
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/TextParsedResult;
    .locals 7
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 31
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v0

    .line 32
    .local v0, "bytes":[B
    if-nez v0, :cond_1

    .line 43
    :cond_0
    :goto_0
    return-object v3

    .line 35
    :cond_1
    invoke-static {v0, v6}, Lcom/google/zxing/client/result/optional/NDEFRecord;->readRecord([BI)Lcom/google/zxing/client/result/optional/NDEFRecord;

    move-result-object v2

    .line 36
    .local v2, "ndefRecord":Lcom/google/zxing/client/result/optional/NDEFRecord;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageBegin()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageEnd()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 39
    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "T"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 42
    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getPayload()[B

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/result/optional/NDEFTextResultParser;->decodeTextPayload([B)[Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "languageText":[Ljava/lang/String;
    new-instance v3, Lcom/google/zxing/client/result/TextParsedResult;

    aget-object v4, v1, v6

    const/4 v5, 0x1

    aget-object v5, v1, v5

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/client/result/TextParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
