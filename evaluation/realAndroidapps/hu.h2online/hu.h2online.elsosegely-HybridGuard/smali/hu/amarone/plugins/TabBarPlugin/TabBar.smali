.class public Lhu/amarone/plugins/TabBarPlugin/TabBar;
.super Landroid/widget/LinearLayout;
.source "TabBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    }
.end annotation


# instance fields
.field public barCount:I

.field public buttons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;",
            ">;"
        }
    .end annotation
.end field

.field public callbackName:Ljava/lang/String;

.field public container:Landroid/widget/LinearLayout;

.field public ctx:Landroid/content/Context;

.field public frame:Landroid/view/ViewGroup;

.field public localParams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public scrollView:Landroid/widget/HorizontalScrollView;

.field public selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

.field public selectionColor:I

.field public showed:I

.field public webView:Lorg/apache/cordova/CordovaWebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[I[I[ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;
    .param p3, "titles"    # [Ljava/lang/String;
    .param p4, "params"    # [Ljava/lang/String;
    .param p5, "callbackName"    # Ljava/lang/String;
    .param p6, "backgroundColor"    # [I
    .param p7, "selectionColor"    # [I
    .param p8, "textColor"    # [I
    .param p9, "buttonSize"    # Ljava/lang/String;
    .param p10, "buttonTextSize"    # Ljava/lang/String;
    .param p11, "isFullScreen"    # Z

    .prologue
    .line 66
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 41
    const/4 v2, -0x1

    iput v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->showed:I

    .line 67
    iget v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->showed:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_5

    .line 68
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    iput-object p1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->ctx:Landroid/content/Context;

    .line 71
    move-object/from16 v0, p2

    iput-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 72
    move-object/from16 v0, p5

    iput-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->callbackName:Ljava/lang/String;

    .line 74
    new-instance v2, Landroid/widget/HorizontalScrollView;

    invoke-direct {v2, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->scrollView:Landroid/widget/HorizontalScrollView;

    .line 75
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->scrollView:Landroid/widget/HorizontalScrollView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 76
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    .line 77
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 78
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    if-eqz p11, :cond_0

    .line 81
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    move-object/from16 v0, p4

    array-length v3, v0

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    .line 82
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->addView(Landroid/view/View;)V

    .line 89
    :goto_0
    const/4 v2, 0x0

    aget v2, p7, v2

    const/4 v3, 0x1

    aget v3, p7, v3

    const/4 v4, 0x2

    aget v4, p7, v4

    invoke-static {v2, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    iput v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectionColor:I

    .line 91
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    .line 92
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->localParams:Ljava/util/ArrayList;

    .line 94
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    move-object/from16 v0, p4

    array-length v2, v0

    if-ge v10, v2, :cond_2

    .line 97
    if-eqz p3, :cond_1

    .line 98
    const-string v2, "Titles"

    aget-object v3, p3, v10

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    new-instance v1, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    aget-object v5, p3, v10

    aget-object v6, p4, v10

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;-><init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;Ljava/lang/String;[I[I[I)V

    .line 106
    .local v1, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :goto_2
    invoke-virtual {v1, p0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->localParams:Ljava/util/ArrayList;

    aget-object v3, p4, v10

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 94
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 85
    .end local v1    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    .end local v10    # "i":I
    :cond_0
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->scrollView:Landroid/widget/HorizontalScrollView;

    invoke-virtual {p0, v2}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->addView(Landroid/view/View;)V

    .line 86
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->scrollView:Landroid/widget/HorizontalScrollView;

    iget-object v3, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 103
    .restart local v10    # "i":I
    :cond_1
    const-string v2, "Titles"

    const-string v3, "null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    new-instance v1, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    const/4 v5, 0x0

    aget-object v6, p4, v10

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;-><init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;Ljava/lang/String;[I[I[I)V

    .restart local v1    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    goto :goto_2

    .line 112
    .end local v1    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_2
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 113
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    iput-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 114
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    iget v3, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectionColor:I

    invoke-virtual {v2, v3}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    .line 117
    :cond_3
    if-eqz p3, :cond_6

    .line 118
    const-string v2, ","

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 119
    .local v11, "temp":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v11, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    aget-object v3, v11, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move/from16 v0, p11

    invoke-virtual {p0, v2, v3, v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->mySetButtonSize(IIZ)V

    .line 120
    const-string v2, ","

    move-object/from16 v0, p10

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 121
    .local v12, "temp1":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v12, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x1

    aget-object v3, v12, v3

    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lhu/amarone/plugins/TabBarPlugin/TabBar;->mySetTextSize(FLjava/lang/Boolean;)V

    .end local v11    # "temp":[Ljava/lang/String;
    .end local v12    # "temp1":[Ljava/lang/String;
    :cond_4
    move-object v2, p1

    .line 132
    check-cast v2, Landroid/app/Activity;

    new-instance v3, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;

    invoke-direct {v3, p0, p1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;-><init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 149
    const/4 v2, 0x1

    iput v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->showed:I

    .line 151
    .end local v10    # "i":I
    :cond_5
    return-void

    .line 124
    .restart local v10    # "i":I
    :cond_6
    if-eqz p11, :cond_4

    .line 125
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 126
    .local v13, "tempBtn":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v13, v3}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3
.end method


# virtual methods
.method public hideTabBar()V
    .locals 2

    .prologue
    .line 51
    if-eqz p0, :cond_0

    iget v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->showed:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 52
    iget-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->ctx:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;

    invoke-direct {v1, p0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;-><init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 60
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->showed:I

    .line 61
    return-void
.end method

.method public myIsBoldText(Ljava/lang/Boolean;)V
    .locals 5
    .param p1, "isBoldText"    # Ljava/lang/Boolean;

    .prologue
    const/4 v4, 0x0

    .line 312
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 313
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 314
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v4, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_0

    .line 317
    :cond_0
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_0

    .line 320
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_1
    return-void
.end method

.method public mySetBackgroundColor(I)V
    .locals 3
    .param p1, "backgroundColor"    # I

    .prologue
    .line 288
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 289
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-virtual {v0, p1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    goto :goto_0

    .line 291
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_0
    return-void
.end method

.method public mySetButtonSize(IIZ)V
    .locals 8
    .param p1, "height"    # I
    .param p2, "selectionSize"    # I
    .param p3, "isFullScreen"    # Z

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 323
    iget-object v3, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 324
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v4, v6, p2, v6, v6}, Landroid/widget/Button;->setPadding(IIII)V

    .line 325
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 326
    .local v1, "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v1, v6, v6, v6, p2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 327
    if-eqz p3, :cond_0

    .line 328
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v7, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 329
    .local v2, "params1":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v0, v2}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    .end local v2    # "params1":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 333
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    .end local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_1
    return-void
.end method

.method public mySetSelectionColor(I)V
    .locals 3
    .param p1, "selectionColor"    # I

    .prologue
    .line 300
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 301
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-static {v0, p1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$102(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;I)I

    goto :goto_0

    .line 303
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_0
    return-void
.end method

.method public mySetTextColor(I)V
    .locals 3
    .param p1, "textColor"    # I

    .prologue
    .line 294
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 295
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/widget/Button;->setTextColor(I)V

    goto :goto_0

    .line 297
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_0
    return-void
.end method

.method public mySetTextSize(FLjava/lang/Boolean;)V
    .locals 3
    .param p1, "size"    # F
    .param p2, "isBold"    # Ljava/lang/Boolean;

    .prologue
    .line 306
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 307
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-static {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/widget/Button;->setTextSize(F)V

    goto :goto_0

    .line 309
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 268
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 269
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 270
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    invoke-virtual {v1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setUnSelected()V

    .line 271
    :cond_1
    iput-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 272
    invoke-virtual {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setSelected()V

    .line 276
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_2
    return-void
.end method

.method public refreshSize()V
    .locals 3

    .prologue
    .line 280
    const-string v1, "TabBar"

    const-string v2, "TabBar size refreshed!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 282
    .local v0, "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    invoke-virtual {v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->refreshSize()V

    goto :goto_0

    .line 284
    .end local v0    # "button":Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    :cond_0
    return-void
.end method

.method public setSelectedTab(Ljava/lang/String;)V
    .locals 3
    .param p1, "tabName"    # Ljava/lang/String;

    .prologue
    .line 154
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->localParams:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 155
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->localParams:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 156
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    invoke-virtual {v1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setUnSelected()V

    .line 157
    :cond_0
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    iput-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectedButton:Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .line 158
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->buttons:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    iget v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar;->selectionColor:I

    invoke-virtual {v1, v2}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    .line 154
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 161
    :cond_2
    return-void
.end method
