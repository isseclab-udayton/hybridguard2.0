.class final Lcom/google/zxing/client/android/share/BookmarkAdapter;
.super Landroid/widget/BaseAdapter;
.source "BookmarkAdapter.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final cursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->context:Landroid/content/Context;

    .line 44
    iput-object p2, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->cursor:Landroid/database/Cursor;

    .line 45
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 57
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "index"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x0

    .line 62
    if-eqz p2, :cond_0

    instance-of v4, p2, Landroid/widget/LinearLayout;

    if-nez v4, :cond_1

    .line 63
    :cond_0
    iget-object v4, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 64
    .local v0, "factory":Landroid/view/LayoutInflater;
    sget v4, Lcom/google/zxing/client/android/R$layout;->bookmark_picker_list_item:I

    invoke-virtual {v0, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 69
    .end local v0    # "factory":Landroid/view/LayoutInflater;
    .local v1, "layout":Landroid/widget/LinearLayout;
    :goto_0
    iget-object v4, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 70
    iget-object v4, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "title":Ljava/lang/String;
    sget v4, Lcom/google/zxing/client/android/R$id;->bookmark_title:I

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v4, p0, Lcom/google/zxing/client/android/share/BookmarkAdapter;->cursor:Landroid/database/Cursor;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 73
    .local v3, "url":Ljava/lang/String;
    sget v4, Lcom/google/zxing/client/android/R$id;->bookmark_url:I

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    return-object v1

    .end local v1    # "layout":Landroid/widget/LinearLayout;
    .end local v2    # "title":Ljava/lang/String;
    .end local v3    # "url":Ljava/lang/String;
    :cond_1
    move-object v1, p2

    .line 66
    check-cast v1, Landroid/widget/LinearLayout;

    .restart local v1    # "layout":Landroid/widget/LinearLayout;
    goto :goto_0
.end method
