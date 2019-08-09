.class public final Lcom/google/zxing/client/android/result/ProductResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "ProductResultHandler.java"


# static fields
.field private static final buttons:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    const/4 v0, 0x3

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 36
    sget v2, Lcom/google/zxing/client/android/R$string;->button_product_search:I

    aput v2, v0, v1

    const/4 v1, 0x1

    .line 37
    sget v2, Lcom/google/zxing/client/android/R$string;->button_web_search:I

    aput v2, v0, v1

    const/4 v1, 0x2

    .line 38
    sget v2, Lcom/google/zxing/client/android/R$string;->button_custom_product_search:I

    aput v2, v0, v1

    .line 35
    sput-object v0, Lcom/google/zxing/client/android/result/ProductResultHandler;->buttons:[I

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;
    .param p3, "rawResult"    # Lcom/google/zxing/Result;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;Lcom/google/zxing/Result;)V

    .line 43
    new-instance v0, Lcom/google/zxing/client/android/result/ProductResultHandler$1;

    invoke-direct {v0, p0}, Lcom/google/zxing/client/android/result/ProductResultHandler$1;-><init>(Lcom/google/zxing/client/android/result/ProductResultHandler;)V

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/ProductResultHandler;->showGoogleShopperButton(Landroid/view/View$OnClickListener;)V

    .line 49
    return-void
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/ProductResultHandler;->hasCustomProductSearch()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/zxing/client/android/result/ProductResultHandler;->buttons:[I

    array-length v0, v0

    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/google/zxing/client/android/result/ProductResultHandler;->buttons:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 58
    sget-object v0, Lcom/google/zxing/client/android/result/ProductResultHandler;->buttons:[I

    aget v0, v0, p1

    return v0
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 83
    sget v0, Lcom/google/zxing/client/android/R$string;->result_product:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 63
    new-instance v0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;

    invoke-direct {v0, p0, p1}, Lcom/google/zxing/client/android/result/ProductResultHandler$2;-><init>(Lcom/google/zxing/client/android/result/ProductResultHandler;I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/client/android/result/ProductResultHandler;->showNotOurResults(ILandroid/content/DialogInterface$OnClickListener;)V

    .line 79
    return-void
.end method
