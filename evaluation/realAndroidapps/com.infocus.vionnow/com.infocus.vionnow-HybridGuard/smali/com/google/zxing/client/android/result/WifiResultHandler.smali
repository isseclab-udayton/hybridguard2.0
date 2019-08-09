.class public final Lcom/google/zxing/client/android/result/WifiResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "WifiResultHandler.java"


# instance fields
.field private final parent:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 35
    iput-object p1, p0, Lcom/google/zxing/client/android/result/WifiResultHandler;->parent:Landroid/app/Activity;

    .line 36
    return-void
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x1

    return v0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 46
    if-nez p1, :cond_0

    .line 47
    sget v0, Lcom/google/zxing/client/android/R$string;->button_wifi:I

    return v0

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getDisplayContents()Ljava/lang/CharSequence;
    .locals 7

    .prologue
    const/16 v6, 0xa

    .line 64
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/client/result/WifiParsedResult;

    .line 65
    .local v3, "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v4, 0x32

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 66
    .local v0, "contents":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lcom/google/zxing/client/android/result/WifiResultHandler;->parent:Landroid/app/Activity;

    sget v5, Lcom/google/zxing/client/android/R$string;->wifi_ssid_label:I

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "wifiLabel":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/google/zxing/client/result/WifiParsedResult;->getSsid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 68
    iget-object v4, p0, Lcom/google/zxing/client/android/result/WifiResultHandler;->parent:Landroid/app/Activity;

    sget v5, Lcom/google/zxing/client/android/R$string;->wifi_type_label:I

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "typeLabel":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/google/zxing/client/result/WifiParsedResult;->getNetworkEncryption()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 75
    sget v0, Lcom/google/zxing/client/android/R$string;->result_wifi:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/WifiParsedResult;

    .line 56
    .local v0, "wifiResult":Lcom/google/zxing/client/result/WifiParsedResult;
    if-nez p1, :cond_0

    .line 57
    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/WifiResultHandler;->wifiConnect(Lcom/google/zxing/client/result/WifiParsedResult;)V

    .line 59
    :cond_0
    return-void
.end method
