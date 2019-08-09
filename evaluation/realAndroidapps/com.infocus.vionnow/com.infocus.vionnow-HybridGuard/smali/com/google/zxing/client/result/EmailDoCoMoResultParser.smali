.class final Lcom/google/zxing/client/result/EmailDoCoMoResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "EmailDoCoMoResultParser.java"


# static fields
.field private static final ATEXT_SYMBOLS:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/16 v0, 0x15

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    .line 30
    sput-object v0, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->ATEXT_SYMBOLS:[C

    .line 28
    return-void

    .line 31
    :array_0
    .array-data 2
        0x40s
        0x2es
        0x21s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x2as
        0x2bs
        0x2ds
        0x2fs
        0x3ds
        0x3fs
        0x5es
        0x5fs
        0x60s
        0x7bs
        0x7cs
        0x7ds
        0x7es
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method

.method private static isAtextSymbol(C)Z
    .locals 2
    .param p0, "c"    # C

    .prologue
    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->ATEXT_SYMBOLS:[C

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 84
    const/4 v1, 0x0

    :goto_1
    return v1

    .line 80
    :cond_0
    sget-object v1, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->ATEXT_SYMBOLS:[C

    aget-char v1, v1, v0

    if-ne p0, v1, :cond_1

    .line 81
    const/4 v1, 0x1

    goto :goto_1

    .line 79
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static isBasicallyValidEmailAddress(Ljava/lang/String;)Z
    .locals 5
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 58
    if-nez p0, :cond_1

    move v0, v3

    .line 75
    :cond_0
    :goto_0
    return v0

    .line 61
    :cond_1
    const/4 v0, 0x0

    .line 62
    .local v0, "atFound":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 63
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 64
    .local v1, "c":C
    const/16 v4, 0x61

    if-lt v1, v4, :cond_2

    const/16 v4, 0x7a

    if-le v1, v4, :cond_5

    :cond_2
    const/16 v4, 0x41

    if-lt v1, v4, :cond_3

    const/16 v4, 0x5a

    if-le v1, v4, :cond_5

    :cond_3
    const/16 v4, 0x30

    if-lt v1, v4, :cond_4

    const/16 v4, 0x39

    if-le v1, v4, :cond_5

    .line 65
    :cond_4
    invoke-static {v1}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->isAtextSymbol(C)Z

    move-result v4

    if-nez v4, :cond_5

    move v0, v3

    .line 66
    goto :goto_0

    .line 68
    :cond_5
    const/16 v4, 0x40

    if-ne v1, v4, :cond_7

    .line 69
    if-eqz v0, :cond_6

    move v0, v3

    .line 70
    goto :goto_0

    .line 72
    :cond_6
    const/4 v0, 0x1

    .line 62
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    .locals 9
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x0

    .line 34
    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "rawText":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v6, "MATMSG:"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 48
    :cond_0
    :goto_0
    return-object v5

    .line 38
    :cond_1
    const-string v6, "TO:"

    const/4 v7, 0x1

    invoke-static {v6, v1, v7}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v2

    .line 39
    .local v2, "rawTo":[Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 42
    aget-object v4, v2, v8

    .line 43
    .local v4, "to":Ljava/lang/String;
    invoke-static {v4}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->isBasicallyValidEmailAddress(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 46
    const-string v5, "SUB:"

    invoke-static {v5, v1, v8}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "subject":Ljava/lang/String;
    const-string v5, "BODY:"

    invoke-static {v5, v1, v8}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "body":Ljava/lang/String;
    new-instance v5, Lcom/google/zxing/client/result/EmailAddressParsedResult;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "mailto:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v4, v3, v0, v6}, Lcom/google/zxing/client/result/EmailAddressParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
