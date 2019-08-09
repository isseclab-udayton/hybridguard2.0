.class Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;
.super Ljava/lang/Object;
.source "SupplementalInfoRetriever.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->setLink(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

.field private final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;->this$0:Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;->val$uri:Ljava/lang/String;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 111
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    iget-object v2, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;->val$uri:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 112
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 113
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;->this$0:Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

    invoke-static {v1}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->access$1(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 114
    return-void
.end method
