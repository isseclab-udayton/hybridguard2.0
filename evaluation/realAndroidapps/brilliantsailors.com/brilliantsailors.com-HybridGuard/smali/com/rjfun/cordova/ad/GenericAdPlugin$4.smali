.class Lcom/rjfun/cordova/ad/GenericAdPlugin$4;
.super Ljava/lang/Object;
.source "GenericAdPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;->showBanner(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$argPos:I

.field final synthetic val$argX:I

.field final synthetic val$argY:I


# direct methods
.method constructor <init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;IIILandroid/app/Activity;)V
    .locals 0

    .prologue
    .line 511
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iput p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    iput p3, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argX:I

    iput p4, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argY:I

    iput-object p5, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    .prologue
    .line 514
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-virtual {v14}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getView()Landroid/view/View;

    move-result-object v3

    .line 515
    .local v3, "mainView":Landroid/view/View;
    if-nez v3, :cond_0

    .line 516
    const-string v14, "GenericAdPlugin"

    const-string v15, "Error: could not get main view"

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    :goto_0
    return-void

    .line 520
    :cond_0
    const-string v14, "GenericAdPlugin"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "webview class: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-boolean v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    if-eqz v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-static {v14}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->access$000(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    .line 525
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v14, v15}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getAdViewWidth(Landroid/view/View;)I

    move-result v2

    .line 526
    .local v2, "bw":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v14, v15}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__getAdViewHeight(Landroid/view/View;)I

    move-result v1

    .line 527
    .local v1, "bh":I
    const-string v14, "GenericAdPlugin"

    const-string v15, "show banner: (%d x %d)"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    .line 530
    .local v8, "rootView":Landroid/view/ViewGroup;
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getWidth()I

    move-result v9

    .local v9, "rw":I
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getHeight()I

    move-result v7

    .line 533
    .local v7, "rh":I
    const-string v14, "GenericAdPlugin"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "show banner, overlap:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-boolean v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ", position: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-boolean v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlap:Z

    if-eqz v14, :cond_5

    .line 536
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget v12, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posX:I

    .local v12, "x":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget v13, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->posY:I

    .line 537
    .local v13, "y":I
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v11

    .local v11, "ww":I
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v10

    .line 538
    .local v10, "wh":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    const/4 v15, 0x1

    if-lt v14, v15, :cond_4

    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    const/16 v15, 0x9

    if-gt v14, v15, :cond_4

    .line 539
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    add-int/lit8 v14, v14, -0x1

    rem-int/lit8 v14, v14, 0x3

    packed-switch v14, :pswitch_data_0

    .line 544
    :goto_1
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    add-int/lit8 v14, v14, -0x1

    div-int/lit8 v14, v14, 0x3

    packed-switch v14, :pswitch_data_1

    .line 554
    :cond_2
    :goto_2
    const/4 v14, 0x2

    new-array v4, v14, [I

    fill-array-data v4, :array_0

    .local v4, "offsetRootView":[I
    const/4 v14, 0x2

    new-array v5, v14, [I

    fill-array-data v5, :array_1

    .line 555
    .local v5, "offsetWebView":[I
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 556
    invoke-virtual {v3, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 558
    const/4 v14, 0x0

    aget v14, v5, v14

    const/4 v15, 0x0

    aget v15, v4, v15

    sub-int/2addr v14, v15

    add-int/2addr v12, v14

    .line 559
    const/4 v14, 0x1

    aget v14, v5, v14

    const/4 v15, 0x1

    aget v15, v4, v15

    sub-int/2addr v14, v15

    add-int/2addr v13, v14

    .line 562
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    if-nez v14, :cond_3

    .line 563
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    new-instance v15, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$activity:Landroid/app/Activity;

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v15, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    .line 564
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    invoke-direct/range {v15 .. v17}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v14, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 567
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v14}, Landroid/widget/RelativeLayout;->bringToFront()V

    .line 570
    :cond_3
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 571
    .local v6, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iput v12, v6, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 572
    iput v13, v6, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 574
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v14, v15, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 575
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->overlapLayout:Landroid/widget/RelativeLayout;

    iput-object v15, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    .line 600
    .end local v4    # "offsetRootView":[I
    .end local v5    # "offsetWebView":[I
    .end local v6    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v10    # "wh":I
    .end local v11    # "ww":I
    .end local v12    # "x":I
    .end local v13    # "y":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    invoke-virtual {v14}, Landroid/view/ViewGroup;->bringToFront()V

    .line 601
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    invoke-virtual {v14}, Landroid/view/ViewGroup;->requestLayout()V

    .line 603
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    .line 604
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    const/4 v15, 0x1

    iput-boolean v15, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 606
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v14, v15}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__resumeAdView(Landroid/view/View;)V

    .line 610
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto/16 :goto_0

    .line 540
    .restart local v10    # "wh":I
    .restart local v11    # "ww":I
    .restart local v12    # "x":I
    .restart local v13    # "y":I
    :pswitch_0
    const/4 v12, 0x0

    goto/16 :goto_1

    .line 541
    :pswitch_1
    sub-int v14, v11, v2

    div-int/lit8 v12, v14, 0x2

    goto/16 :goto_1

    .line 542
    :pswitch_2
    sub-int v12, v11, v2

    goto/16 :goto_1

    .line 545
    :pswitch_3
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 546
    :pswitch_4
    sub-int v14, v10, v1

    div-int/lit8 v13, v14, 0x2

    goto/16 :goto_2

    .line 547
    :pswitch_5
    sub-int v13, v10, v1

    goto/16 :goto_2

    .line 549
    :cond_4
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    const/16 v15, 0xa

    if-ne v14, v15, :cond_2

    .line 550
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argX:I

    .line 551
    move-object/from16 v0, p0

    iget v13, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argY:I

    goto/16 :goto_2

    .line 578
    .end local v10    # "wh":I
    .end local v11    # "ww":I
    .end local v12    # "x":I
    .end local v13    # "y":I
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v14

    check-cast v14, Landroid/view/ViewGroup;

    iput-object v14, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    .line 580
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    instance-of v14, v14, Landroid/widget/LinearLayout;

    if-nez v14, :cond_6

    .line 581
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    invoke-virtual {v14, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 583
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    new-instance v15, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v15, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    .line 584
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 585
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    const/16 v18, 0x0

    invoke-direct/range {v15 .. v18}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v14, v15}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 586
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x1

    const/16 v16, -0x1

    const/high16 v17, 0x3f800000    # 1.0f

    invoke-direct/range {v14 .. v17}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v14}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 587
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v14, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 589
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-virtual {v14}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v14, v15}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 590
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->splitLayout:Landroid/widget/LinearLayout;

    iput-object v15, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    .line 593
    :cond_6
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->val$argPos:I

    const/4 v15, 0x3

    if-gt v14, v15, :cond_7

    .line 594
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    const/16 v16, 0x0

    invoke-virtual/range {v14 .. v16}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    goto/16 :goto_3

    .line 596
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v14, v14, Lcom/rjfun/cordova/ad/GenericAdPlugin;->parentView:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v15, v15, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto/16 :goto_3

    .line 539
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 544
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 554
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
