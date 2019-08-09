.class final Lcom/google/zxing/client/result/BizcardResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "BizcardResultParser.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method

.method private static buildName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "firstName"    # Ljava/lang/String;
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 87
    if-nez p0, :cond_0

    .line 90
    .end local p0    # "firstName":Ljava/lang/String;
    .end local p1    # "lastName":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p0    # "firstName":Ljava/lang/String;
    .restart local p1    # "lastName":Ljava/lang/String;
    :cond_0
    if-nez p1, :cond_1

    .end local p0    # "firstName":Ljava/lang/String;
    :goto_1
    move-object p1, p0

    goto :goto_0

    .restart local p0    # "firstName":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method private static buildPhoneNumbers(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p0, "number1"    # Ljava/lang/String;
    .param p1, "number2"    # Ljava/lang/String;
    .param p2, "number3"    # Ljava/lang/String;

    .prologue
    .line 65
    new-instance v1, Ljava/util/Vector;

    const/4 v4, 0x3

    invoke-direct {v1, v4}, Ljava/util/Vector;-><init>(I)V

    .line 66
    .local v1, "numbers":Ljava/util/Vector;
    if-eqz p0, :cond_0

    .line 67
    invoke-virtual {v1, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 69
    :cond_0
    if-eqz p1, :cond_1

    .line 70
    invoke-virtual {v1, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 72
    :cond_1
    if-eqz p2, :cond_2

    .line 73
    invoke-virtual {v1, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 75
    :cond_2
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v3

    .line 76
    .local v3, "size":I
    if-nez v3, :cond_4

    .line 77
    const/4 v2, 0x0

    .line 83
    :cond_3
    return-object v2

    .line 79
    :cond_4
    new-array v2, v3, [Ljava/lang/String;

    .line 80
    .local v2, "result":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_3

    .line 81
    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    aput-object v4, v2, v0

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    .locals 20
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    .line 37
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v19

    .line 38
    .local v19, "rawText":Ljava/lang/String;
    if-eqz v19, :cond_0

    const-string v1, "BIZCARD:"

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 39
    :cond_0
    const/4 v1, 0x0

    .line 52
    :goto_0
    return-object v1

    .line 41
    :cond_1
    const-string v1, "N:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v13

    .line 42
    .local v13, "firstName":Ljava/lang/String;
    const-string v1, "X:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v15

    .line 43
    .local v15, "lastName":Ljava/lang/String;
    invoke-static {v13, v15}, Lcom/google/zxing/client/result/BizcardResultParser;->buildName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 44
    .local v14, "fullName":Ljava/lang/String;
    const-string v1, "T:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    .line 45
    .local v10, "title":Ljava/lang/String;
    const-string v1, "C:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 46
    .local v8, "org":Ljava/lang/String;
    const-string v1, "A:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v7

    .line 47
    .local v7, "addresses":[Ljava/lang/String;
    const-string v1, "B:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v16

    .line 48
    .local v16, "phoneNumber1":Ljava/lang/String;
    const-string v1, "M:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v17

    .line 49
    .local v17, "phoneNumber2":Ljava/lang/String;
    const-string v1, "F:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v18

    .line 50
    .local v18, "phoneNumber3":Ljava/lang/String;
    const-string v1, "E:"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-static {v1, v0, v2}, Lcom/google/zxing/client/result/BizcardResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v12

    .line 52
    .local v12, "email":Ljava/lang/String;
    new-instance v1, Lcom/google/zxing/client/result/AddressBookParsedResult;

    invoke-static {v14}, Lcom/google/zxing/client/result/BizcardResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 53
    const/4 v3, 0x0

    .line 54
    invoke-static/range {v16 .. v18}, Lcom/google/zxing/client/result/BizcardResultParser;->buildPhoneNumbers(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 55
    invoke-static {v12}, Lcom/google/zxing/client/result/BizcardResultParser;->maybeWrap(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 56
    const/4 v6, 0x0

    .line 59
    const/4 v9, 0x0

    .line 61
    const/4 v11, 0x0

    .line 52
    invoke-direct/range {v1 .. v11}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
