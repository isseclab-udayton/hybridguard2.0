.class final Lcom/google/zxing/client/result/optional/NDEFSmartPosterResultParser;
.super Lcom/google/zxing/client/result/optional/AbstractNDEFResultParser;
.source "NDEFSmartPosterResultParser.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/zxing/client/result/optional/AbstractNDEFResultParser;-><init>()V

    return-void
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;
    .locals 15
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v14, 0x0

    const/4 v11, 0x0

    .line 35
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v1

    .line 36
    .local v1, "bytes":[B
    if-nez v1, :cond_1

    .line 78
    :cond_0
    :goto_0
    return-object v11

    .line 39
    :cond_1
    invoke-static {v1, v14}, Lcom/google/zxing/client/result/optional/NDEFRecord;->readRecord([BI)Lcom/google/zxing/client/result/optional/NDEFRecord;

    move-result-object v2

    .line 41
    .local v2, "headerRecord":Lcom/google/zxing/client/result/optional/NDEFRecord;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageBegin()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageEnd()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 44
    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getType()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Sp"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 48
    const/4 v5, 0x0

    .line 49
    .local v5, "offset":I
    const/4 v7, 0x0

    .line 50
    .local v7, "recordNumber":I
    const/4 v4, 0x0

    .line 51
    .local v4, "ndefRecord":Lcom/google/zxing/client/result/optional/NDEFRecord;
    invoke-virtual {v2}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getPayload()[B

    move-result-object v6

    .line 52
    .local v6, "payload":[B
    const/4 v0, -0x1

    .line 53
    .local v0, "action":I
    const/4 v8, 0x0

    .line 54
    .local v8, "title":Ljava/lang/String;
    const/4 v10, 0x0

    .line 56
    .local v10, "uri":Ljava/lang/String;
    :goto_1
    array-length v12, v6

    if-ge v5, v12, :cond_2

    invoke-static {v6, v5}, Lcom/google/zxing/client/result/optional/NDEFRecord;->readRecord([BI)Lcom/google/zxing/client/result/optional/NDEFRecord;

    move-result-object v4

    if-nez v4, :cond_4

    .line 74
    :cond_2
    if-eqz v7, :cond_0

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageEnd()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 78
    :cond_3
    new-instance v11, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;

    invoke-direct {v11, v0, v10, v8}, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 57
    :cond_4
    if-nez v7, :cond_5

    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->isMessageBegin()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 61
    :cond_5
    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getType()Ljava/lang/String;

    move-result-object v9

    .line 62
    .local v9, "type":Ljava/lang/String;
    const-string v12, "T"

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 63
    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getPayload()[B

    move-result-object v12

    invoke-static {v12}, Lcom/google/zxing/client/result/optional/NDEFTextResultParser;->decodeTextPayload([B)[Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "languageText":[Ljava/lang/String;
    const/4 v12, 0x1

    aget-object v8, v3, v12

    .line 70
    .end local v3    # "languageText":[Ljava/lang/String;
    :cond_6
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 71
    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getTotalRecordLength()I

    move-result v12

    add-int/2addr v5, v12

    goto :goto_1

    .line 65
    :cond_7
    const-string v12, "U"

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 66
    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getPayload()[B

    move-result-object v12

    invoke-static {v12}, Lcom/google/zxing/client/result/optional/NDEFURIResultParser;->decodeURIPayload([B)Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    .line 67
    :cond_8
    const-string v12, "act"

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 68
    invoke-virtual {v4}, Lcom/google/zxing/client/result/optional/NDEFRecord;->getPayload()[B

    move-result-object v12

    aget-byte v0, v12, v14

    goto :goto_2
.end method
