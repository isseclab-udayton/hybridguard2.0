.class final Lcom/google/zxing/client/result/AddressBookAUResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "AddressBookAUResultParser.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;
    .locals 5
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "max"    # I
    .param p2, "rawText"    # Ljava/lang/String;
    .param p3, "trim"    # Z

    .prologue
    .line 56
    const/4 v2, 0x0

    .line 57
    .local v2, "values":Ljava/util/Vector;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-le v0, p1, :cond_1

    .line 67
    :cond_0
    if-nez v2, :cond_3

    .line 68
    const/4 v3, 0x0

    .line 70
    :goto_1
    return-object v3

    .line 58
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xd

    invoke-static {v3, p2, v4, p3}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 62
    if-nez v2, :cond_2

    .line 63
    new-instance v2, Ljava/util/Vector;

    .end local v2    # "values":Ljava/util/Vector;
    invoke-direct {v2, p1}, Ljava/util/Vector;-><init>(I)V

    .line 65
    .restart local v2    # "values":Ljava/util/Vector;
    :cond_2
    invoke-virtual {v2, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "value":Ljava/lang/String;
    :cond_3
    invoke-static {v2}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->toStringArray(Ljava/util/Vector;)[Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .locals 14
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x0

    const/16 v8, 0xd

    const/4 v7, 0x0

    const/4 v1, 0x1

    .line 34
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v13

    .line 36
    .local v13, "rawText":Ljava/lang/String;
    if-eqz v13, :cond_0

    const-string v0, "MEMORY"

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    const-string v0, "\r\n"

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1

    :cond_0
    move-object v0, v7

    .line 50
    :goto_0
    return-object v0

    .line 42
    :cond_1
    const-string v0, "NAME1:"

    invoke-static {v0, v13, v8, v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v12

    .line 43
    .local v12, "name":Ljava/lang/String;
    const-string v0, "NAME2:"

    invoke-static {v0, v13, v8, v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "pronunciation":Ljava/lang/String;
    const-string v0, "TEL"

    invoke-static {v0, v10, v13, v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "phoneNumbers":[Ljava/lang/String;
    const-string v0, "MAIL"

    invoke-static {v0, v10, v13, v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchMultipleValuePrefix(Ljava/lang/String;ILjava/lang/String;Z)[Ljava/lang/String;

    move-result-object v4

    .line 47
    .local v4, "emails":[Ljava/lang/String;
    const-string v0, "MEMORY:"

    invoke-static {v0, v13, v8, v9}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v5

    .line 48
    .local v5, "note":Ljava/lang/String;
    const-string v0, "ADD:"

    invoke-static {v0, v13, v8, v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;

    move-result-object v11

    .line 49
    .local v11, "address":Ljava/lang/String;
    if-nez v11, :cond_2

    move-object v6, v7

    .line 50
    .local v6, "addresses":[Ljava/lang/String;
    :goto_1
    new-instance v0, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v12}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    move-object v8, v7

    move-object v9, v7

    move-object v10, v7

    invoke-direct/range {v0 .. v10}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 49
    .end local v6    # "addresses":[Ljava/lang/String;
    :cond_2
    new-array v6, v1, [Ljava/lang/String;

    aput-object v11, v6, v9

    goto :goto_1
.end method
