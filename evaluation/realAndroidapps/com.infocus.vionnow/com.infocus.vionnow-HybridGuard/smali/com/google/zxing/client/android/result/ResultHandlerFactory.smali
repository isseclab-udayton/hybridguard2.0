.class public final Lcom/google/zxing/client/android/result/ResultHandlerFactory;
.super Ljava/lang/Object;
.source "ResultHandlerFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static makeResultHandler(Landroid/app/Activity;Lcom/google/zxing/Result;)Lcom/google/zxing/client/android/result/ResultHandler;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "rawResult"    # Lcom/google/zxing/Result;

    .prologue
    .line 36
    invoke-static {p1}, Lcom/google/zxing/client/android/result/ResultHandlerFactory;->parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    .line 37
    .local v0, "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/ParsedResult;->getType()Lcom/google/zxing/client/result/ParsedResultType;

    move-result-object v1

    .line 38
    .local v1, "type":Lcom/google/zxing/client/result/ParsedResultType;
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->ADDRESSBOOK:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 39
    new-instance v2, Lcom/google/zxing/client/android/result/AddressBookResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 62
    :goto_0
    return-object v2

    .line 40
    :cond_0
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->EMAIL_ADDRESS:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 41
    new-instance v2, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/EmailAddressResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 42
    :cond_1
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->PRODUCT:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 43
    new-instance v2, Lcom/google/zxing/client/android/result/ProductResultHandler;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/zxing/client/android/result/ProductResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V

    goto :goto_0

    .line 44
    :cond_2
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->URI:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 45
    new-instance v2, Lcom/google/zxing/client/android/result/URIResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/URIResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 46
    :cond_3
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->WIFI:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 47
    new-instance v2, Lcom/google/zxing/client/android/result/WifiResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/WifiResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 48
    :cond_4
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->TEXT:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 49
    new-instance v2, Lcom/google/zxing/client/android/result/TextResultHandler;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/zxing/client/android/result/TextResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V

    goto :goto_0

    .line 50
    :cond_5
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->GEO:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 51
    new-instance v2, Lcom/google/zxing/client/android/result/GeoResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/GeoResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 52
    :cond_6
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->TEL:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 53
    new-instance v2, Lcom/google/zxing/client/android/result/TelResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/TelResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 54
    :cond_7
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->SMS:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 55
    new-instance v2, Lcom/google/zxing/client/android/result/SMSResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/SMSResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 56
    :cond_8
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->CALENDAR:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 57
    new-instance v2, Lcom/google/zxing/client/android/result/CalendarResultHandler;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/result/CalendarResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    goto :goto_0

    .line 58
    :cond_9
    sget-object v2, Lcom/google/zxing/client/result/ParsedResultType;->ISBN:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 59
    new-instance v2, Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/zxing/client/android/result/ISBNResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V

    goto/16 :goto_0

    .line 62
    :cond_a
    new-instance v2, Lcom/google/zxing/client/android/result/TextResultHandler;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/zxing/client/android/result/TextResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V

    goto/16 :goto_0
.end method

.method private static parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .locals 1
    .param p0, "rawResult"    # Lcom/google/zxing/Result;

    .prologue
    .line 67
    invoke-static {p0}, Lcom/google/zxing/client/result/ResultParser;->parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    return-object v0
.end method
