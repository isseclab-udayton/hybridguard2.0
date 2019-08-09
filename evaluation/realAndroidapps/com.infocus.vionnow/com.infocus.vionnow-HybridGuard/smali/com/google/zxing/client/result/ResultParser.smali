.class public abstract Lcom/google/zxing/client/result/ResultParser;
.super Ljava/lang/Object;
.source "ResultParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendKeyValue(Ljava/lang/String;IILjava/util/Hashtable;)V
    .locals 4
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "paramStart"    # I
    .param p2, "paramEnd"    # I
    .param p3, "result"    # Ljava/util/Hashtable;

    .prologue
    .line 258
    const/16 v3, 0x3d

    invoke-virtual {p0, v3, p1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 259
    .local v1, "separator":I
    if-ltz v1, :cond_0

    .line 261
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "key":Ljava/lang/String;
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 263
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/zxing/client/result/ResultParser;->urlDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 264
    invoke-virtual {p3, v0, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private static findFirstEscape([C)I
    .locals 4
    .param p0, "escapedArray"    # [C

    .prologue
    .line 179
    array-length v2, p0

    .line 180
    .local v2, "max":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_1

    .line 186
    const/4 v1, -0x1

    .end local v1    # "i":I
    :cond_0
    return v1

    .line 181
    .restart local v1    # "i":I
    :cond_1
    aget-char v0, p0, v1

    .line 182
    .local v0, "c":C
    const/16 v3, 0x2b

    if-eq v0, v3, :cond_0

    const/16 v3, 0x25

    if-eq v0, v3, :cond_0

    .line 180
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected static isStringOfDigits(Ljava/lang/String;I)Z
    .locals 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "length"    # I

    .prologue
    const/4 v3, 0x0

    .line 207
    if-nez p0, :cond_1

    .line 220
    :cond_0
    :goto_0
    return v3

    .line 210
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 211
    .local v2, "stringLength":I
    if-ne p1, v2, :cond_0

    .line 214
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-lt v1, p1, :cond_2

    .line 220
    const/4 v3, 0x1

    goto :goto_0

    .line 215
    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 216
    .local v0, "c":C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_0

    const/16 v4, 0x39

    if-gt v0, v4, :cond_0

    .line 214
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method protected static isSubstringOfDigits(Ljava/lang/String;II)Z
    .locals 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v4, 0x0

    .line 224
    if-nez p0, :cond_1

    .line 238
    :cond_0
    :goto_0
    return v4

    .line 227
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 228
    .local v3, "stringLength":I
    add-int v2, p1, p2

    .line 229
    .local v2, "max":I
    if-lt v3, v2, :cond_0

    .line 232
    move v1, p1

    .local v1, "i":I
    :goto_1
    if-lt v1, v2, :cond_2

    .line 238
    const/4 v4, 0x1

    goto :goto_0

    .line 233
    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 234
    .local v0, "c":C
    const/16 v5, 0x30

    if-lt v0, v5, :cond_0

    const/16 v5, 0x39

    if-gt v0, v5, :cond_0

    .line 232
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method static matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;
    .locals 8
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "endChar"    # C
    .param p3, "trim"    # Z

    .prologue
    .line 270
    const/4 v3, 0x0

    .line 271
    .local v3, "matches":Ljava/util/Vector;
    const/4 v2, 0x0

    .line 272
    .local v2, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 273
    .local v4, "max":I
    :cond_0
    if-lt v2, v4, :cond_3

    .line 305
    :cond_1
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 306
    :cond_2
    const/4 v6, 0x0

    .line 308
    :goto_0
    return-object v6

    .line 274
    :cond_3
    invoke-virtual {p1, p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 275
    if-ltz v2, :cond_1

    .line 278
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v2, v6

    .line 279
    move v5, v2

    .line 280
    .local v5, "start":I
    const/4 v0, 0x0

    .line 281
    .local v0, "done":Z
    :goto_1
    if-nez v0, :cond_0

    .line 282
    invoke-virtual {p1, p2, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 283
    if-gez v2, :cond_4

    .line 285
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 286
    const/4 v0, 0x1

    goto :goto_1

    .line 287
    :cond_4
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5c

    if-ne v6, v7, :cond_5

    .line 289
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 292
    :cond_5
    if-nez v3, :cond_6

    .line 293
    new-instance v3, Ljava/util/Vector;

    .end local v3    # "matches":Ljava/util/Vector;
    const/4 v6, 0x3

    invoke-direct {v3, v6}, Ljava/util/Vector;-><init>(I)V

    .line 295
    .restart local v3    # "matches":Ljava/util/Vector;
    :cond_6
    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/zxing/client/result/ResultParser;->unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 296
    .local v1, "element":Ljava/lang/String;
    if-eqz p3, :cond_7

    .line 297
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 299
    :cond_7
    invoke-virtual {v3, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 300
    add-int/lit8 v2, v2, 0x1

    .line 301
    const/4 v0, 0x1

    goto :goto_1

    .line 308
    .end local v0    # "done":Z
    .end local v1    # "element":Ljava/lang/String;
    .end local v5    # "start":I
    :cond_8
    invoke-static {v3}, Lcom/google/zxing/client/result/ResultParser;->toStringArray(Ljava/util/Vector;)[Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method static matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "rawText"    # Ljava/lang/String;
    .param p2, "endChar"    # C
    .param p3, "trim"    # Z

    .prologue
    .line 312
    invoke-static {p0, p1, p2, p3}, Lcom/google/zxing/client/result/ResultParser;->matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    .line 313
    .local v0, "matches":[Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    goto :goto_0
.end method

.method protected static maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuffer;

    .prologue
    .line 87
    if-eqz p0, :cond_0

    .line 88
    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 89
    invoke-virtual {p1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    :cond_0
    return-void
.end method

.method protected static maybeAppend([Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 2
    .param p0, "value"    # [Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuffer;

    .prologue
    .line 94
    if-eqz p0, :cond_0

    .line 95
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-lt v0, v1, :cond_1

    .line 100
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 96
    .restart local v0    # "i":I
    :cond_1
    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 97
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected static maybeWrap(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 103
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    goto :goto_0
.end method

.method private static parseHexDigit(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 190
    const/16 v0, 0x61

    if-lt p0, v0, :cond_0

    .line 191
    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    .line 192
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    .line 203
    :goto_0
    return v0

    .line 194
    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    .line 195
    const/16 v0, 0x46

    if-gt p0, v0, :cond_2

    .line 196
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 198
    :cond_1
    const/16 v0, 0x30

    if-lt p0, v0, :cond_2

    .line 199
    const/16 v0, 0x39

    if-gt p0, v0, :cond_2

    .line 200
    add-int/lit8 v0, p0, -0x30

    goto :goto_0

    .line 203
    :cond_2
    const/4 v0, -0x1

    goto :goto_0
.end method

.method static parseNameValuePairs(Ljava/lang/String;)Ljava/util/Hashtable;
    .locals 4
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    .line 242
    const/16 v3, 0x3f

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 243
    .local v1, "paramStart":I
    if-gez v1, :cond_0

    .line 244
    const/4 v2, 0x0

    .line 254
    :goto_0
    return-object v2

    .line 246
    :cond_0
    new-instance v2, Ljava/util/Hashtable;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Ljava/util/Hashtable;-><init>(I)V

    .line 247
    .local v2, "result":Ljava/util/Hashtable;
    add-int/lit8 v1, v1, 0x1

    .line 249
    :goto_1
    const/16 v3, 0x26

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .local v0, "paramEnd":I
    if-gez v0, :cond_1

    .line 253
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {p0, v1, v3, v2}, Lcom/google/zxing/client/result/ResultParser;->appendKeyValue(Ljava/lang/String;IILjava/util/Hashtable;)V

    goto :goto_0

    .line 250
    :cond_1
    invoke-static {p0, v1, v0, v2}, Lcom/google/zxing/client/result/ResultParser;->appendKeyValue(Ljava/lang/String;IILjava/util/Hashtable;)V

    .line 251
    add-int/lit8 v1, v0, 0x1

    goto :goto_1
.end method

.method public static parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 4
    .param p0, "theResult"    # Lcom/google/zxing/Result;

    .prologue
    .line 42
    invoke-static {p0}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;

    move-result-object v0

    .local v0, "result":Lcom/google/zxing/client/result/ParsedResult;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 83
    :goto_0
    return-object v1

    .line 44
    :cond_0
    invoke-static {p0}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object v0

    if-eqz v0, :cond_1

    move-object v1, v0

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-static {p0}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;

    move-result-object v0

    if-eqz v0, :cond_2

    move-object v1, v0

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {p0}, Lcom/google/zxing/client/result/AddressBookAUResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object v0

    if-eqz v0, :cond_3

    move-object v1, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_3
    invoke-static {p0}, Lcom/google/zxing/client/result/VCardResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object v0

    if-eqz v0, :cond_4

    move-object v1, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_4
    invoke-static {p0}, Lcom/google/zxing/client/result/BizcardResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;

    move-result-object v0

    if-eqz v0, :cond_5

    move-object v1, v0

    .line 53
    goto :goto_0

    .line 54
    :cond_5
    invoke-static {p0}, Lcom/google/zxing/client/result/VEventResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;

    move-result-object v0

    if-eqz v0, :cond_6

    move-object v1, v0

    .line 55
    goto :goto_0

    .line 56
    :cond_6
    invoke-static {p0}, Lcom/google/zxing/client/result/EmailAddressResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;

    move-result-object v0

    if-eqz v0, :cond_7

    move-object v1, v0

    .line 57
    goto :goto_0

    .line 58
    :cond_7
    invoke-static {p0}, Lcom/google/zxing/client/result/SMTPResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;

    move-result-object v0

    if-eqz v0, :cond_8

    move-object v1, v0

    .line 59
    goto :goto_0

    .line 60
    :cond_8
    invoke-static {p0}, Lcom/google/zxing/client/result/TelResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/TelParsedResult;

    move-result-object v0

    if-eqz v0, :cond_9

    move-object v1, v0

    .line 61
    goto :goto_0

    .line 62
    :cond_9
    invoke-static {p0}, Lcom/google/zxing/client/result/SMSMMSResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;

    move-result-object v0

    if-eqz v0, :cond_a

    move-object v1, v0

    .line 63
    goto :goto_0

    .line 64
    :cond_a
    invoke-static {p0}, Lcom/google/zxing/client/result/SMSTOMMSTOResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;

    move-result-object v0

    if-eqz v0, :cond_b

    move-object v1, v0

    .line 65
    goto :goto_0

    .line 66
    :cond_b
    invoke-static {p0}, Lcom/google/zxing/client/result/GeoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;

    move-result-object v0

    if-eqz v0, :cond_c

    move-object v1, v0

    .line 67
    goto :goto_0

    .line 68
    :cond_c
    invoke-static {p0}, Lcom/google/zxing/client/result/WifiResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;

    move-result-object v0

    if-eqz v0, :cond_d

    move-object v1, v0

    .line 69
    goto :goto_0

    .line 70
    :cond_d
    invoke-static {p0}, Lcom/google/zxing/client/result/URLTOResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;

    move-result-object v0

    if-eqz v0, :cond_e

    move-object v1, v0

    .line 71
    goto :goto_0

    .line 72
    :cond_e
    invoke-static {p0}, Lcom/google/zxing/client/result/URIResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;

    move-result-object v0

    if-eqz v0, :cond_f

    move-object v1, v0

    .line 74
    goto :goto_0

    .line 75
    :cond_f
    invoke-static {p0}, Lcom/google/zxing/client/result/ISBNResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ISBNParsedResult;

    move-result-object v0

    if-eqz v0, :cond_10

    move-object v1, v0

    .line 77
    goto :goto_0

    .line 78
    :cond_10
    invoke-static {p0}, Lcom/google/zxing/client/result/ProductResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ProductParsedResult;

    move-result-object v0

    if-eqz v0, :cond_11

    move-object v1, v0

    .line 79
    goto/16 :goto_0

    .line 80
    :cond_11
    invoke-static {p0}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    move-result-object v0

    if-eqz v0, :cond_12

    move-object v1, v0

    .line 81
    goto/16 :goto_0

    .line 83
    :cond_12
    new-instance v1, Lcom/google/zxing/client/result/TextParsedResult;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/client/result/TextParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method static toStringArray(Ljava/util/Vector;)[Ljava/lang/String;
    .locals 4
    .param p0, "strings"    # Ljava/util/Vector;

    .prologue
    .line 317
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    .line 318
    .local v2, "size":I
    new-array v1, v2, [Ljava/lang/String;

    .line 319
    .local v1, "result":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    if-lt v0, v2, :cond_0

    .line 322
    return-object v1

    .line 320
    :cond_0
    invoke-virtual {p0, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v1, v0

    .line 319
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected static unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "escaped"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x5c

    .line 107
    if-eqz p0, :cond_0

    .line 108
    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 109
    .local v0, "backslash":I
    if-ltz v0, :cond_0

    .line 110
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 111
    .local v3, "max":I
    new-instance v5, Ljava/lang/StringBuffer;

    add-int/lit8 v6, v3, -0x1

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 112
    .local v5, "unescaped":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v0}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 113
    const/4 v4, 0x0

    .line 114
    .local v4, "nextIsEscaped":Z
    move v2, v0

    .local v2, "i":I
    :goto_0
    if-lt v2, v3, :cond_1

    .line 123
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 126
    .end local v0    # "backslash":I
    .end local v2    # "i":I
    .end local v3    # "max":I
    .end local v4    # "nextIsEscaped":Z
    .end local v5    # "unescaped":Ljava/lang/StringBuffer;
    .end local p0    # "escaped":Ljava/lang/String;
    :cond_0
    return-object p0

    .line 115
    .restart local v0    # "backslash":I
    .restart local v2    # "i":I
    .restart local v3    # "max":I
    .restart local v4    # "nextIsEscaped":Z
    .restart local v5    # "unescaped":Ljava/lang/StringBuffer;
    .restart local p0    # "escaped":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 116
    .local v1, "c":C
    if-nez v4, :cond_2

    if-eq v1, v8, :cond_3

    .line 117
    :cond_2
    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 118
    const/4 v4, 0x0

    .line 114
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    :cond_3
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private static urlDecode(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "escaped"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x25

    .line 131
    if-nez p0, :cond_1

    .line 132
    const/4 p0, 0x0

    .line 175
    .end local p0    # "escaped":Ljava/lang/String;
    .local v1, "escapedArray":[C
    .local v2, "first":I
    :cond_0
    :goto_0
    return-object p0

    .line 134
    .end local v1    # "escapedArray":[C
    .end local v2    # "first":I
    .restart local p0    # "escaped":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 136
    .restart local v1    # "escapedArray":[C
    invoke-static {v1}, Lcom/google/zxing/client/result/ResultParser;->findFirstEscape([C)I

    move-result v2

    .line 137
    .restart local v2    # "first":I
    if-ltz v2, :cond_0

    .line 141
    array-length v5, v1

    .line 143
    .local v5, "max":I
    new-instance v7, Ljava/lang/StringBuffer;

    add-int/lit8 v8, v5, -0x2

    invoke-direct {v7, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 145
    .local v7, "unescaped":Ljava/lang/StringBuffer;
    const/4 v8, 0x0

    invoke-virtual {v7, v1, v8, v2}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 147
    move v4, v2

    .local v4, "i":I
    :goto_1
    if-lt v4, v5, :cond_2

    .line 175
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 148
    :cond_2
    aget-char v0, v1, v4

    .line 149
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 171
    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 147
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 152
    :sswitch_0
    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 156
    :sswitch_1
    add-int/lit8 v8, v5, -0x2

    if-lt v4, v8, :cond_3

    .line 157
    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 159
    :cond_3
    add-int/lit8 v4, v4, 0x1

    aget-char v8, v1, v4

    invoke-static {v8}, Lcom/google/zxing/client/result/ResultParser;->parseHexDigit(C)I

    move-result v3

    .line 160
    .local v3, "firstDigitValue":I
    add-int/lit8 v4, v4, 0x1

    aget-char v8, v1, v4

    invoke-static {v8}, Lcom/google/zxing/client/result/ResultParser;->parseHexDigit(C)I

    move-result v6

    .line 161
    .local v6, "secondDigitValue":I
    if-ltz v3, :cond_4

    if-gez v6, :cond_5

    .line 163
    :cond_4
    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 164
    add-int/lit8 v8, v4, -0x1

    aget-char v8, v1, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 165
    aget-char v8, v1, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 167
    :cond_5
    shl-int/lit8 v8, v3, 0x4

    add-int/2addr v8, v6

    int-to-char v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 149
    :sswitch_data_0
    .sparse-switch
        0x25 -> :sswitch_1
        0x2b -> :sswitch_0
    .end sparse-switch
.end method
