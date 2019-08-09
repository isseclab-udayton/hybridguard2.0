.class public final Lcom/google/zxing/client/android/book/SearchBookContentsListItem;
.super Landroid/widget/LinearLayout;
.source "SearchBookContentsListItem.java"


# instance fields
.field private pageNumberView:Landroid/widget/TextView;

.field private snippetView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 49
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 50
    sget v0, Lcom/google/zxing/client/android/R$id;->page_number_view:I

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->pageNumberView:Landroid/widget/TextView;

    .line 51
    sget v0, Lcom/google/zxing/client/android/R$id;->snippet_view:I

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->snippetView:Landroid/widget/TextView;

    .line 52
    return-void
.end method

.method public set(Lcom/google/zxing/client/android/book/SearchBookContentsResult;)V
    .locals 10
    .param p1, "result"    # Lcom/google/zxing/client/android/book/SearchBookContentsResult;

    .prologue
    .line 55
    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->pageNumberView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;->getPageNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    invoke-virtual {p1}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;->getSnippet()Ljava/lang/String;

    move-result-object v6

    .line 57
    .local v6, "snippet":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_2

    .line 58
    invoke-virtual {p1}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;->getValidSnippet()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 59
    invoke-static {}, Lcom/google/zxing/client/android/book/SearchBookContentsResult;->getQuery()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "lowerQuery":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "lowerSnippet":Ljava/lang/String;
    new-instance v7, Landroid/text/SpannableString;

    invoke-direct {v7, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 62
    .local v7, "styledSnippet":Landroid/text/Spannable;
    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v8, 0x1

    invoke-direct {v0, v8}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 63
    .local v0, "boldSpan":Landroid/text/style/StyleSpan;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    .line 64
    .local v5, "queryLength":I
    const/4 v3, 0x0

    .line 66
    .local v3, "offset":I
    :goto_0
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 67
    .local v4, "pos":I
    if-gez v4, :cond_0

    .line 73
    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->snippetView:Landroid/widget/TextView;

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .end local v0    # "boldSpan":Landroid/text/style/StyleSpan;
    .end local v1    # "lowerQuery":Ljava/lang/String;
    .end local v2    # "lowerSnippet":Ljava/lang/String;
    .end local v3    # "offset":I
    .end local v4    # "pos":I
    .end local v5    # "queryLength":I
    .end local v7    # "styledSnippet":Landroid/text/Spannable;
    :goto_1
    return-void

    .line 70
    .restart local v0    # "boldSpan":Landroid/text/style/StyleSpan;
    .restart local v1    # "lowerQuery":Ljava/lang/String;
    .restart local v2    # "lowerSnippet":Ljava/lang/String;
    .restart local v3    # "offset":I
    .restart local v4    # "pos":I
    .restart local v5    # "queryLength":I
    .restart local v7    # "styledSnippet":Landroid/text/Spannable;
    :cond_0
    add-int v8, v4, v5

    const/4 v9, 0x0

    invoke-interface {v7, v0, v4, v8, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 71
    add-int v3, v4, v5

    .line 65
    goto :goto_0

    .line 76
    .end local v0    # "boldSpan":Landroid/text/style/StyleSpan;
    .end local v1    # "lowerQuery":Ljava/lang/String;
    .end local v2    # "lowerSnippet":Ljava/lang/String;
    .end local v3    # "offset":I
    .end local v4    # "pos":I
    .end local v5    # "queryLength":I
    .end local v7    # "styledSnippet":Landroid/text/Spannable;
    :cond_1
    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->snippetView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 79
    :cond_2
    iget-object v8, p0, Lcom/google/zxing/client/android/book/SearchBookContentsListItem;->snippetView:Landroid/widget/TextView;

    const-string v9, ""

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method
