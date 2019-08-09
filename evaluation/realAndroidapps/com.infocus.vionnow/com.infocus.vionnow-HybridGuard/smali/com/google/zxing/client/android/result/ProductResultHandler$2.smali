.class Lcom/google/zxing/client/android/result/ProductResultHandler$2;
.super Ljava/lang/Object;
.source "ProductResultHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/result/ProductResultHandler;->handleButtonPress(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

.field private final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/result/ProductResultHandler;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    iput p2, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->val$index:I

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 65
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/result/ProductResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/ProductParsedResult;

    .line 66
    .local v0, "productResult":Lcom/google/zxing/client/result/ProductParsedResult;
    iget v1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->val$index:I

    packed-switch v1, :pswitch_data_0

    .line 77
    :goto_0
    return-void

    .line 68
    :pswitch_0
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ProductParsedResult;->getNormalizedProductID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ProductResultHandler;->openProductSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 71
    :pswitch_1
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ProductParsedResult;->getNormalizedProductID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ProductResultHandler;->webSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :pswitch_2
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    iget-object v2, p0, Lcom/google/zxing/client/android/result/ProductResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ProductResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ProductParsedResult;->getNormalizedProductID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/client/android/result/ProductResultHandler;->fillInCustomSearchURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ProductResultHandler;->openURL(Ljava/lang/String;)V

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
