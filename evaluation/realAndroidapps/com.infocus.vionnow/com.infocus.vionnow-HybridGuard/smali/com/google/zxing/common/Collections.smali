.class public final Lcom/google/zxing/common/Collections;
.super Ljava/lang/Object;
.source "Collections.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static insertionSort(Ljava/util/Vector;Lcom/google/zxing/common/Comparator;)V
    .locals 6
    .param p0, "vector"    # Ljava/util/Vector;
    .param p1, "comparator"    # Lcom/google/zxing/common/Comparator;

    .prologue
    .line 40
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    .line 41
    .local v2, "max":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-lt v0, v2, :cond_0

    .line 51
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    .line 43
    .local v3, "value":Ljava/lang/Object;
    add-int/lit8 v1, v0, -0x1

    .line 45
    .local v1, "j":I
    :goto_1
    if-ltz v1, :cond_1

    invoke-virtual {p0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    .local v4, "valueB":Ljava/lang/Object;
    invoke-interface {p1, v4, v3}, Lcom/google/zxing/common/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-gtz v5, :cond_2

    .line 49
    .end local v4    # "valueB":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v3, v5}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 46
    .restart local v4    # "valueB":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v4, v5}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 47
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method
