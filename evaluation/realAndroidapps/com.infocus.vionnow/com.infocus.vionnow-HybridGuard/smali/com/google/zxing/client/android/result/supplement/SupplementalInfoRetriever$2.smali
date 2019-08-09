.class Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;
.super Ljava/lang/Object;
.source "SupplementalInfoRetriever.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->append(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

.field private final synthetic val$newText:Ljava/lang/String;

.field private final synthetic val$textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;->this$0:Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;->val$newText:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;->val$textView:Landroid/widget/TextView;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;->val$newText:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    .line 103
    .local v0, "html":Landroid/text/Spanned;
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;->val$textView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 104
    return-void
.end method
