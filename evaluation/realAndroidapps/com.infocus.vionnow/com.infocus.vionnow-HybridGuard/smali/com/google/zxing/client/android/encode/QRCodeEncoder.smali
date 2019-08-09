.class final Lcom/google/zxing/client/android/encode/QRCodeEncoder;
.super Ljava/lang/Object;
.source "QRCodeEncoder.java"


# static fields
.field private static final BLACK:I = -0x1000000

.field private static final TAG:Ljava/lang/String;

.field private static final WHITE:I = -0x1


# instance fields
.field private final activity:Landroid/app/Activity;

.field private contents:Ljava/lang/String;

.field private final dimension:I

.field private displayContents:Ljava/lang/String;

.field private format:Lcom/google/zxing/BarcodeFormat;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-class v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    .line 51
    return-void
.end method

.method constructor <init>(Landroid/app/Activity;Landroid/content/Intent;I)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "dimension"    # I

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    .line 67
    if-nez p2, :cond_0

    .line 68
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No valid data to encode."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "action":Ljava/lang/String;
    const-string v1, "com.phonegap.plugins.barcodescanner.ENCODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 73
    invoke-direct {p0, p2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromZXingIntent(Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 74
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No valid data to encode."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    :cond_1
    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 77
    invoke-direct {p0, p2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromShareIntent(Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 78
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No valid data to encode."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 82
    :cond_2
    iput p3, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    .line 83
    return-void
.end method

.method private encodeContentsFromShareIntent(Landroid/content/Intent;)Z
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 129
    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromShareIntentPlainText(Landroid/content/Intent;)Z

    move-result v0

    .line 133
    :goto_0
    return v0

    :cond_0
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeContentsFromShareIntentDefault(Landroid/content/Intent;)Z

    move-result v0

    goto :goto_0
.end method

.method private encodeContentsFromShareIntentDefault(Landroid/content/Intent;)Z
    .locals 12
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v9, 0x0

    .line 164
    sget-object v10, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v10, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 166
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v10

    const-string v11, "android.intent.extra.STREAM"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    .line 167
    .local v6, "uri":Landroid/net/Uri;
    iget-object v10, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-virtual {v10, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .line 168
    .local v5, "stream":Ljava/io/InputStream;
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v2

    .line 169
    .local v2, "length":I
    if-gtz v2, :cond_1

    .line 170
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v11, "Content stream is empty"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    .end local v2    # "length":I
    .end local v5    # "stream":Ljava/io/InputStream;
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return v9

    .line 173
    .restart local v2    # "length":I
    .restart local v5    # "stream":Ljava/io/InputStream;
    .restart local v6    # "uri":Landroid/net/Uri;
    :cond_1
    new-array v7, v2, [B

    .line 174
    .local v7, "vcard":[B
    const/4 v10, 0x0

    invoke-virtual {v5, v7, v10, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 175
    .local v0, "bytesRead":I
    if-ge v0, v2, :cond_2

    .line 176
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v11, "Unable to fully read available bytes from content stream"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 192
    .end local v0    # "bytesRead":I
    .end local v2    # "length":I
    .end local v5    # "stream":Ljava/io/InputStream;
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "vcard":[B
    :catch_0
    move-exception v1

    .line 193
    .local v1, "e":Ljava/io/IOException;
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    invoke-static {v10, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 179
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "bytesRead":I
    .restart local v2    # "length":I
    .restart local v5    # "stream":Ljava/io/InputStream;
    .restart local v6    # "uri":Landroid/net/Uri;
    .restart local v7    # "vcard":[B
    :cond_2
    :try_start_1
    new-instance v8, Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "UTF-8"

    invoke-direct {v8, v7, v10, v0, v11}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 180
    .local v8, "vcardString":Ljava/lang/String;
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v11, "Encoding share intent content:"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    new-instance v4, Lcom/google/zxing/Result;

    const/4 v10, 0x0

    sget-object v11, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v4, v8, v7, v10, v11}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    .line 183
    .local v4, "result":Lcom/google/zxing/Result;
    invoke-static {v4}, Lcom/google/zxing/client/result/ResultParser;->parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v3

    .line 184
    .local v3, "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    instance-of v10, v3, Lcom/google/zxing/client/result/AddressBookParsedResult;

    if-nez v10, :cond_3

    .line 185
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v11, "Result was not an address"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 195
    .end local v0    # "bytesRead":I
    .end local v2    # "length":I
    .end local v3    # "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    .end local v4    # "result":Lcom/google/zxing/Result;
    .end local v5    # "stream":Ljava/io/InputStream;
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "vcard":[B
    .end local v8    # "vcardString":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 196
    .local v1, "e":Ljava/lang/NullPointerException;
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    invoke-static {v10, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 188
    .end local v1    # "e":Ljava/lang/NullPointerException;
    .restart local v0    # "bytesRead":I
    .restart local v2    # "length":I
    .restart local v3    # "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    .restart local v4    # "result":Lcom/google/zxing/Result;
    .restart local v5    # "stream":Ljava/io/InputStream;
    .restart local v6    # "uri":Landroid/net/Uri;
    .restart local v7    # "vcard":[B
    .restart local v8    # "vcardString":Ljava/lang/String;
    :cond_3
    :try_start_2
    check-cast v3, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .end local v3    # "parsedResult":Lcom/google/zxing/client/result/ParsedResult;
    invoke-direct {p0, v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeQRCodeContents(Lcom/google/zxing/client/result/AddressBookParsedResult;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 189
    sget-object v10, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->TAG:Ljava/lang/String;

    const-string v11, "Unable to encode contents"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 200
    :cond_4
    iget-object v10, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    if-eqz v10, :cond_0

    iget-object v10, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_0

    const/4 v9, 0x1

    goto :goto_0
.end method

.method private encodeContentsFromShareIntentPlainText(Landroid/content/Intent;)Z
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    .line 138
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 141
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 158
    :cond_0
    :goto_0
    return v0

    .line 144
    :cond_1
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 145
    iget-object v1, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 150
    const-string v0, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 151
    const-string v0, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 157
    :goto_1
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v1, Lcom/google/zxing/client/android/R$string;->contents_text:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    .line 158
    const/4 v0, 0x1

    goto :goto_0

    .line 152
    :cond_2
    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 153
    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    goto :goto_1

    .line 155
    :cond_3
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    goto :goto_1
.end method

.method private encodeContentsFromZXingIntent(Landroid/content/Intent;)Z
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    .line 101
    const-string v5, "ENCODE_FORMAT"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "formatString":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Lcom/google/zxing/BarcodeFormat;->valueOf(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    iput-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    :goto_0
    iget-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    if-eqz v5, :cond_0

    sget-object v5, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iget-object v6, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 109
    :cond_0
    const-string v5, "ENCODE_TYPE"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 110
    .local v3, "type":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_2

    .line 123
    .end local v3    # "type":Ljava/lang/String;
    :cond_1
    :goto_1
    return v4

    .line 104
    :catch_0
    move-exception v2

    .line 106
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    goto :goto_0

    .line 113
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v3    # "type":Ljava/lang/String;
    :cond_2
    sget-object v5, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    iput-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    .line 114
    invoke-direct {p0, p1, v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->encodeQRCodeContents(Landroid/content/Intent;Ljava/lang/String;)V

    .line 123
    .end local v3    # "type":Ljava/lang/String;
    :cond_3
    :goto_2
    iget-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    .line 116
    :cond_4
    const-string v5, "ENCODE_DATA"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "data":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 118
    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 119
    iput-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 120
    iget-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v6, Lcom/google/zxing/client/android/R$string;->contents_text:I

    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto :goto_2
.end method

.method private encodeQRCodeContents(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 13
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 204
    const-string v11, "TEXT_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 205
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 206
    .local v2, "data":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_0

    .line 207
    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 208
    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 209
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_text:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    .line 286
    .end local v2    # "data":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 211
    :cond_1
    const-string v11, "EMAIL_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 212
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 213
    .restart local v2    # "data":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 214
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "mailto:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 215
    iput-object v2, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 216
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_email:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto :goto_0

    .line 218
    .end local v2    # "data":Ljava/lang/String;
    :cond_2
    const-string v11, "PHONE_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 219
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 220
    .restart local v2    # "data":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 221
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "tel:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 222
    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 223
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_phone:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto :goto_0

    .line 225
    .end local v2    # "data":Ljava/lang/String;
    :cond_3
    const-string v11, "SMS_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 226
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 227
    .restart local v2    # "data":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 228
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "sms:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 229
    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 230
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_sms:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_0

    .line 232
    .end local v2    # "data":Ljava/lang/String;
    :cond_4
    const-string v11, "CONTACT_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c

    .line 233
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 234
    .local v1, "bundle":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 235
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v11, 0x64

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 236
    .local v7, "newContents":Ljava/lang/StringBuilder;
    new-instance v8, Ljava/lang/StringBuilder;

    const/16 v11, 0x64

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 237
    .local v8, "newDisplayContents":Ljava/lang/StringBuilder;
    const-string v11, "MECARD:"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    const-string v11, "name"

    invoke-virtual {v1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 239
    .local v6, "name":Ljava/lang/String;
    if-eqz v6, :cond_5

    .line 240
    const-string v11, "N:"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v6}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 241
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    :cond_5
    const-string v11, "postal"

    invoke-virtual {v1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, "address":Ljava/lang/String;
    if-eqz v0, :cond_6

    .line 245
    const-string v11, "ADR:"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v0}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 246
    const/16 v11, 0xa

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    :cond_6
    const/4 v10, 0x0

    .local v10, "x":I
    :goto_1
    sget-object v11, Lcom/google/zxing/client/android/Contents;->PHONE_KEYS:[Ljava/lang/String;

    array-length v11, v11

    if-lt v10, v11, :cond_7

    .line 255
    const/4 v10, 0x0

    :goto_2
    sget-object v11, Lcom/google/zxing/client/android/Contents;->EMAIL_KEYS:[Ljava/lang/String;

    array-length v11, v11

    if-lt v10, v11, :cond_9

    .line 263
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-lez v11, :cond_b

    .line 264
    const/16 v11, 0x3b

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 265
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 266
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 267
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_contact:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_0

    .line 249
    :cond_7
    sget-object v11, Lcom/google/zxing/client/android/Contents;->PHONE_KEYS:[Ljava/lang/String;

    aget-object v11, v11, v10

    invoke-virtual {v1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 250
    .local v9, "phone":Ljava/lang/String;
    if-eqz v9, :cond_8

    .line 251
    const-string v11, "TEL:"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v9}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    const/16 v11, 0xa

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v9}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 256
    .end local v9    # "phone":Ljava/lang/String;
    :cond_9
    sget-object v11, Lcom/google/zxing/client/android/Contents;->EMAIL_KEYS:[Ljava/lang/String;

    aget-object v11, v11, v10

    invoke-virtual {v1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 257
    .local v3, "email":Ljava/lang/String;
    if-eqz v3, :cond_a

    .line 258
    const-string v11, "EMAIL:"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v3}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 259
    const/16 v11, 0xa

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_2

    .line 269
    .end local v3    # "email":Ljava/lang/String;
    :cond_b
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 270
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    goto/16 :goto_0

    .line 273
    .end local v0    # "address":Ljava/lang/String;
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "newContents":Ljava/lang/StringBuilder;
    .end local v8    # "newDisplayContents":Ljava/lang/StringBuilder;
    .end local v10    # "x":I
    :cond_c
    const-string v11, "LOCATION_TYPE"

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 274
    const-string v11, "ENCODE_DATA"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 275
    .restart local v1    # "bundle":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 277
    const-string v11, "LAT"

    const v12, 0x7f7fffff    # Float.MAX_VALUE

    invoke-virtual {v1, v11, v12}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v4

    .line 278
    .local v4, "latitude":F
    const-string v11, "LONG"

    const v12, 0x7f7fffff    # Float.MAX_VALUE

    invoke-virtual {v1, v11, v12}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v5

    .line 279
    .local v5, "longitude":F
    const v11, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v11, v4, v11

    if-eqz v11, :cond_0

    const v11, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v11, v5, v11

    if-eqz v11, :cond_0

    .line 280
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "geo:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x2c

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 281
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, ","

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 282
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_location:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private encodeQRCodeContents(Lcom/google/zxing/client/result/AddressBookParsedResult;)Z
    .locals 15
    .param p1, "contact"    # Lcom/google/zxing/client/result/AddressBookParsedResult;

    .prologue
    .line 289
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v11, 0x64

    invoke-direct {v6, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 290
    .local v6, "newContents":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v11, 0x64

    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 291
    .local v7, "newDisplayContents":Ljava/lang/StringBuilder;
    const-string v11, "MECARD:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v5

    .line 293
    .local v5, "names":[Ljava/lang/String;
    if-eqz v5, :cond_0

    array-length v11, v5

    if-lez v11, :cond_0

    .line 294
    const/4 v11, 0x0

    aget-object v11, v5, v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 295
    .local v4, "name":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 296
    const-string v11, "N:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v4}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 297
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .end local v4    # "name":Ljava/lang/String;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v1

    .line 301
    .local v1, "addresses":[Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 302
    array-length v12, v1

    const/4 v11, 0x0

    :goto_0
    if-lt v11, v12, :cond_5

    .line 310
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v9

    .line 311
    .local v9, "phoneNumbers":[Ljava/lang/String;
    if-eqz v9, :cond_2

    .line 312
    array-length v12, v9

    const/4 v11, 0x0

    :goto_1
    if-lt v11, v12, :cond_7

    .line 320
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v3

    .line 321
    .local v3, "emails":[Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 322
    array-length v12, v3

    const/4 v11, 0x0

    :goto_2
    if-lt v11, v12, :cond_9

    .line 330
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getURL()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 331
    .local v10, "url":Ljava/lang/String;
    if-eqz v10, :cond_4

    .line 332
    const-string v11, "URL:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v10}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    const/16 v11, 0xa

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    :cond_4
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-lez v11, :cond_b

    .line 337
    const/16 v11, 0x3b

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 338
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 339
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 340
    iget-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->activity:Landroid/app/Activity;

    sget v12, Lcom/google/zxing/client/android/R$string;->contents_contact:I

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    .line 341
    const/4 v11, 0x1

    .line 345
    :goto_3
    return v11

    .line 302
    .end local v3    # "emails":[Ljava/lang/String;
    .end local v9    # "phoneNumbers":[Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/String;
    :cond_5
    aget-object v0, v1, v11

    .line 303
    .local v0, "address":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 304
    if-eqz v0, :cond_6

    .line 305
    const-string v13, "ADR:"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v0}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x3b

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 306
    const/16 v13, 0xa

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 312
    .end local v0    # "address":Ljava/lang/String;
    .restart local v9    # "phoneNumbers":[Ljava/lang/String;
    :cond_7
    aget-object v8, v9, v11

    .line 313
    .local v8, "phone":Ljava/lang/String;
    invoke-static {v8}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 314
    if-eqz v8, :cond_8

    .line 315
    const-string v13, "TEL:"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v8}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x3b

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    const/16 v13, 0xa

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    :cond_8
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_1

    .line 322
    .end local v8    # "phone":Ljava/lang/String;
    .restart local v3    # "emails":[Ljava/lang/String;
    :cond_9
    aget-object v2, v3, v11

    .line 323
    .local v2, "email":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 324
    if-eqz v2, :cond_a

    .line 325
    const-string v13, "EMAIL:"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->escapeMECARD(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x3b

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    const/16 v13, 0xa

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    :cond_a
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_2

    .line 343
    .end local v2    # "email":Ljava/lang/String;
    .restart local v10    # "url":Ljava/lang/String;
    :cond_b
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    .line 344
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    .line 345
    const/4 v11, 0x0

    goto/16 :goto_3
.end method

.method private static escapeMECARD(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x3b

    const/16 v5, 0x3a

    .line 393
    if-eqz p0, :cond_0

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_1

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_1

    .line 405
    .end local p0    # "input":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 396
    .restart local p0    # "input":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 397
    .local v2, "length":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 398
    .local v3, "result":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-lt v1, v2, :cond_2

    .line 405
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 399
    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 400
    .local v0, "c":C
    if-eq v0, v5, :cond_3

    if-ne v0, v6, :cond_4

    .line 401
    :cond_3
    const/16 v4, 0x5c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 403
    :cond_4
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 398
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static guessAppropriateEncoding(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .param p0, "contents"    # Ljava/lang/CharSequence;

    .prologue
    .line 376
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 381
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 377
    :cond_0
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0xff

    if-le v1, v2, :cond_1

    .line 378
    const-string v1, "UTF-8"

    goto :goto_1

    .line 376
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static trim(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 385
    if-nez p0, :cond_0

    .line 389
    .end local p0    # "s":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 388
    .restart local p0    # "s":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 389
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    move-object p0, v0

    .end local p0    # "s":Ljava/lang/String;
    :cond_1
    move-object v0, p0

    goto :goto_0
.end method


# virtual methods
.method encodeAsBitmap()Landroid/graphics/Bitmap;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 350
    const/4 v6, 0x0

    .line 351
    .local v6, "hints":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->guessAppropriateEncoding(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v15

    .line 352
    .local v15, "encoding":Ljava/lang/String;
    if-eqz v15, :cond_0

    .line 353
    new-instance v6, Ljava/util/Hashtable;

    .end local v6    # "hints":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    const/4 v2, 0x2

    invoke-direct {v6, v2}, Ljava/util/Hashtable;-><init>(I)V

    .line 354
    .restart local v6    # "hints":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    sget-object v2, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-virtual {v6, v2, v15}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    :cond_0
    new-instance v1, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v1}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    .line 357
    .local v1, "writer":Lcom/google/zxing/MultiFormatWriter;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->format:Lcom/google/zxing/BarcodeFormat;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->dimension:I

    invoke-virtual/range {v1 .. v6}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Hashtable;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v17

    .line 358
    .local v17, "result":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v10

    .line 359
    .local v10, "width":I
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v14

    .line 360
    .local v14, "height":I
    mul-int v2, v10, v14

    new-array v8, v2, [I

    .line 362
    .local v8, "pixels":[I
    const/16 v19, 0x0

    .local v19, "y":I
    :goto_0
    move/from16 v0, v19

    if-lt v0, v14, :cond_1

    .line 369
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v14, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 370
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move v13, v10

    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 371
    return-object v7

    .line 363
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1
    mul-int v16, v19, v10

    .line 364
    .local v16, "offset":I
    const/16 v18, 0x0

    .local v18, "x":I
    :goto_1
    move/from16 v0, v18

    if-lt v0, v10, :cond_2

    .line 362
    add-int/lit8 v19, v19, 0x1

    goto :goto_0

    .line 365
    :cond_2
    add-int v3, v16, v18

    invoke-virtual/range {v17 .. v19}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_3

    const/high16 v2, -0x1000000

    :goto_2
    aput v2, v8, v3

    .line 364
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 365
    :cond_3
    const/4 v2, -0x1

    goto :goto_2
.end method

.method public getContents()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->contents:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayContents()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->displayContents:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/zxing/client/android/encode/QRCodeEncoder;->title:Ljava/lang/String;

    return-object v0
.end method
