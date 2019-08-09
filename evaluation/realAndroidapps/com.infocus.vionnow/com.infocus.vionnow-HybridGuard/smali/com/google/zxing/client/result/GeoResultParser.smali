.class final Lcom/google/zxing/client/result/GeoResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "GeoResultParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    .line 32
    return-void
.end method

.method public static parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;
    .locals 16
    .param p0, "result"    # Lcom/google/zxing/Result;

    .prologue
    .line 35
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v13

    .line 36
    .local v13, "rawText":Ljava/lang/String;
    if-eqz v13, :cond_0

    const-string v0, "geo:"

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "GEO:"

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 76
    :goto_0
    return-object v0

    .line 40
    :cond_1
    const/16 v0, 0x3f

    const/4 v14, 0x4

    invoke-virtual {v13, v0, v14}, Ljava/lang/String;->indexOf(II)I

    move-result v12

    .line 43
    .local v12, "queryStart":I
    if-gez v12, :cond_2

    .line 44
    const/4 v7, 0x0

    .line 45
    .local v7, "query":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 50
    .local v8, "geoURIWithoutQuery":Ljava/lang/String;
    :goto_1
    const/16 v0, 0x2c

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    .line 51
    .local v9, "latitudeEnd":I
    if-gez v9, :cond_3

    .line 52
    const/4 v0, 0x0

    goto :goto_0

    .line 47
    .end local v7    # "query":Ljava/lang/String;
    .end local v8    # "geoURIWithoutQuery":Ljava/lang/String;
    .end local v9    # "latitudeEnd":I
    :cond_2
    add-int/lit8 v0, v12, 0x1

    invoke-virtual {v13, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 48
    .restart local v7    # "query":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-virtual {v13, v0, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "geoURIWithoutQuery":Ljava/lang/String;
    goto :goto_1

    .line 54
    .restart local v9    # "latitudeEnd":I
    :cond_3
    const/16 v0, 0x2c

    add-int/lit8 v14, v9, 0x1

    invoke-virtual {v8, v0, v14}, Ljava/lang/String;->indexOf(II)I

    move-result v10

    .line 59
    .local v10, "longitudeEnd":I
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v8, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    .line 60
    .local v1, "latitude":D
    const-wide v14, 0x4056800000000000L    # 90.0

    cmpl-double v0, v1, v14

    if-gtz v0, :cond_4

    const-wide v14, -0x3fa9800000000000L    # -90.0

    cmpg-double v0, v1, v14

    if-gez v0, :cond_5

    .line 61
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    .line 63
    :cond_5
    if-gez v10, :cond_7

    .line 64
    add-int/lit8 v0, v9, 0x1

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    .line 65
    .local v3, "longitude":D
    const-wide/16 v5, 0x0

    .line 70
    .local v5, "altitude":D
    :goto_2
    const-wide v14, 0x4066800000000000L    # 180.0

    cmpl-double v0, v3, v14

    if-gtz v0, :cond_6

    const-wide v14, -0x3f99800000000000L    # -180.0

    cmpg-double v0, v3, v14

    if-ltz v0, :cond_6

    const-wide/16 v14, 0x0

    cmpg-double v0, v5, v14

    if-gez v0, :cond_8

    .line 71
    :cond_6
    const/4 v0, 0x0

    goto :goto_0

    .line 67
    .end local v3    # "longitude":D
    .end local v5    # "altitude":D
    :cond_7
    add-int/lit8 v0, v9, 0x1

    invoke-virtual {v8, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    .line 68
    .restart local v3    # "longitude":D
    add-int/lit8 v0, v10, 0x1

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v5

    .restart local v5    # "altitude":D
    goto :goto_2

    .line 73
    .end local v1    # "latitude":D
    .end local v3    # "longitude":D
    .end local v5    # "altitude":D
    :catch_0
    move-exception v11

    .line 74
    .local v11, "nfe":Ljava/lang/NumberFormatException;
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 76
    .end local v11    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v1    # "latitude":D
    .restart local v3    # "longitude":D
    .restart local v5    # "altitude":D
    :cond_8
    new-instance v0, Lcom/google/zxing/client/result/GeoParsedResult;

    invoke-direct/range {v0 .. v7}, Lcom/google/zxing/client/result/GeoParsedResult;-><init>(DDDLjava/lang/String;)V

    goto/16 :goto_0
.end method
