.class Lcom/google/zxing/client/android/result/ISBNResultHandler$2;
.super Ljava/lang/Object;
.source "ISBNResultHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/result/ISBNResultHandler;->handleButtonPress(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

.field private final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/result/ISBNResultHandler;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    iput p2, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->val$index:I

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 66
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/ISBNParsedResult;

    .line 67
    .local v0, "isbnResult":Lcom/google/zxing/client/result/ISBNParsedResult;
    iget v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->val$index:I

    packed-switch v1, :pswitch_data_0

    .line 81
    :goto_0
    return-void

    .line 69
    :pswitch_0
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->openProductSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :pswitch_1
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->openBookSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 75
    :pswitch_2
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->searchBookContents(Ljava/lang/String;)V

    goto :goto_0

    .line 78
    :pswitch_3
    iget-object v1, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    iget-object v2, p0, Lcom/google/zxing/client/android/result/ISBNResultHandler$2;->this$0:Lcom/google/zxing/client/android/result/ISBNResultHandler;

    invoke-virtual {v0}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->fillInCustomSearchURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/zxing/client/android/result/ISBNResultHandler;->openURL(Ljava/lang/String;)V

    goto :goto_0

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
