.class Lcom/google/cordova/admob/AdMob$4;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->__showBanner(IIILorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;

.field private final synthetic val$argPos:I

.field private final synthetic val$argX:I

.field private final synthetic val$argY:I

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/google/cordova/admob/AdMob;IIILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iput p2, p0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    iput p3, p0, Lcom/google/cordova/admob/AdMob$4;->val$argX:I

    iput p4, p0, Lcom/google/cordova/admob/AdMob$4;->val$argY:I

    iput-object p5, p0, Lcom/google/cordova/admob/AdMob$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 346
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 349
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/android/gms/ads/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v15

    if-eqz v15, :cond_0

    .line 350
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/android/gms/ads/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v15

    check-cast v15, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 353
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$2(Lcom/google/cordova/admob/AdMob;)I

    move-result v13

    .local v13, "x":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$3(Lcom/google/cordova/admob/AdMob;)I

    move-result v14

    .line 355
    .local v14, "y":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v15, v15, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v15}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 356
    .local v3, "display":Landroid/view/Display;
    new-instance v9, Landroid/graphics/Point;

    invoke-direct {v9}, Landroid/graphics/Point;-><init>()V

    .line 357
    .local v9, "size":Landroid/graphics/Point;
    invoke-virtual {v3, v9}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 358
    iget v8, v9, Landroid/graphics/Point;->x:I

    .line 359
    .local v8, "rw":I
    iget v7, v9, Landroid/graphics/Point;->y:I

    .line 361
    .local v7, "rh":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v15, v15, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v15}, Lorg/apache/cordova/CordovaWebView;->getWidth()I

    move-result v12

    .local v12, "ww":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v15, v15, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v15}, Lorg/apache/cordova/CordovaWebView;->getHeight()I

    move-result v11

    .line 362
    .local v11, "wh":I
    sub-int v5, v8, v12

    .local v5, "offw":I
    sub-int v4, v7, v11

    .line 364
    .local v4, "offh":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/android/gms/ads/AdView;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v10

    .line 365
    .local v10, "sz":Lcom/google/android/gms/ads/AdSize;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v15, v15, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v10, v15}, Lcom/google/android/gms/ads/AdSize;->getWidthInPixels(Landroid/content/Context;)I

    move-result v2

    .local v2, "bw":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v15, v15, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v15}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v15

    invoke-virtual {v10, v15}, Lcom/google/android/gms/ads/AdSize;->getHeightInPixels(Landroid/content/Context;)I

    move-result v1

    .line 367
    .local v1, "bh":I
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    const/16 v16, 0x1

    move/from16 v0, v16

    if-lt v15, v0, :cond_3

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    const/16 v16, 0x9

    move/from16 v0, v16

    if-gt v15, v0, :cond_3

    .line 368
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    add-int/lit8 v15, v15, -0x1

    rem-int/lit8 v15, v15, 0x3

    packed-switch v15, :pswitch_data_0

    .line 373
    :goto_0
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    add-int/lit8 v15, v15, -0x1

    div-int/lit8 v15, v15, 0x3

    packed-switch v15, :pswitch_data_1

    .line 383
    :cond_1
    :goto_1
    add-int/2addr v13, v5

    .line 384
    add-int/2addr v14, v4

    .line 386
    const-string v15, "AdMob"

    const-string v16, "screen (%dx%d), webview (%d x %d)"

    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x2

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    const-string v15, "AdMob"

    const-string v16, "show banner: (%d,%d), (%d x %d)"

    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 390
    .local v6, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iput v13, v6, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 391
    iput v14, v6, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 392
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$10(Lcom/google/cordova/admob/AdMob;)Landroid/widget/RelativeLayout;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 394
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v15}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v15

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/gms/ads/AdView;->setVisibility(I)V

    .line 395
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->this$0:Lcom/google/cordova/admob/AdMob;

    const/16 v16, 0x1

    invoke-static/range {v15 .. v16}, Lcom/google/cordova/admob/AdMob;->access$13(Lcom/google/cordova/admob/AdMob;Z)V

    .line 397
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v15, :cond_2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v15}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 398
    :cond_2
    return-void

    .line 369
    .end local v6    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :pswitch_0
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 370
    :pswitch_1
    sub-int v15, v12, v2

    div-int/lit8 v13, v15, 0x2

    goto/16 :goto_0

    .line 371
    :pswitch_2
    sub-int v13, v12, v2

    goto/16 :goto_0

    .line 374
    :pswitch_3
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 375
    :pswitch_4
    sub-int v15, v11, v1

    div-int/lit8 v14, v15, 0x2

    goto/16 :goto_1

    .line 376
    :pswitch_5
    sub-int v14, v11, v1

    goto/16 :goto_1

    .line 378
    :cond_3
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/cordova/admob/AdMob$4;->val$argPos:I

    const/16 v16, 0xa

    move/from16 v0, v16

    if-ne v15, v0, :cond_1

    .line 379
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/cordova/admob/AdMob$4;->val$argX:I

    .line 380
    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/cordova/admob/AdMob$4;->val$argY:I

    goto/16 :goto_1

    .line 368
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 373
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
