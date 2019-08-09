.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showWebPage(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iput-object p2, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)Lcom/phonegap/plugins/childBrowser/ChildBrowser;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    return-object v0
.end method

.method private dpToPixels(I)I
    .locals 4
    .param p1, "dipValue"    # I

    .prologue
    .line 225
    const/4 v1, 0x1

    .line 226
    int-to-float v2, p1

    .line 227
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v3, v3, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 225
    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v0, v1

    .line 230
    .local v0, "value":I
    return v0
.end method

.method private loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 395
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v1, v1, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 396
    .local v0, "input":Ljava/io/InputStream;
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/app/Dialog;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v18

    const v19, 0x1030006

    invoke-direct/range {v17 .. v19}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$2(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/app/Dialog;)V

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v16

    const v17, 0x1030002

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    new-instance v17, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual/range {v16 .. v17}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 253
    new-instance v12, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 254
    .local v12, "main":Landroid/widget/LinearLayout;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 257
    new-instance v15, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 258
    .local v15, "toolbar":Landroid/widget/RelativeLayout;
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v17, -0x1

    const/16 v18, 0x2c

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->dpToPixels(I)I

    move-result v18

    invoke-direct/range {v16 .. v18}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 259
    const/16 v16, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->dpToPixels(I)I

    move-result v16

    const/16 v17, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->dpToPixels(I)I

    move-result v17

    const/16 v18, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->dpToPixels(I)I

    move-result v18

    const/16 v19, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->dpToPixels(I)I

    move-result v19

    invoke-virtual/range {v15 .. v19}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 260
    const/16 v16, 0x3

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 261
    const/16 v16, 0x30

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 264
    new-instance v2, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 265
    .local v2, "actionButtonContainer":Landroid/widget/RelativeLayout;
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v17, -0x2

    const/16 v18, -0x2

    invoke-direct/range {v16 .. v18}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 266
    const/16 v16, 0x3

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 267
    const/16 v16, 0x10

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 268
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 271
    new-instance v3, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 272
    .local v3, "back":Landroid/widget/ImageButton;
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v4, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 273
    .local v4, "backLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x5

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 274
    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    const-string v16, "Back Button"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 276
    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 278
    :try_start_0
    const-string v16, "www/childbrowser/icon_arrow_left.png"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    :goto_0
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    new-instance v9, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 290
    .local v9, "forward":Landroid/widget/ImageButton;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 291
    .local v10, "forwardLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x1

    const/16 v17, 0x2

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 292
    invoke-virtual {v9, v10}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    const-string v16, "Forward Button"

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 294
    const/16 v16, 0x3

    move/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 296
    :try_start_1
    const-string v16, "www/childbrowser/icon_arrow_right.png"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 300
    :goto_1
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$7(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/widget/EditText;)V

    .line 308
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 309
    .local v14, "textLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x1

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 310
    const/16 v16, 0x0

    const/16 v17, 0x5

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x4

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setId(I)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x10

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setInputType(I)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x2

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setInputType(I)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    new-instance v17, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 330
    new-instance v6, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 331
    .local v6, "close":Landroid/widget/ImageButton;
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v7, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 332
    .local v7, "closeLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0xb

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 333
    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 334
    const-string v16, "Close Button"

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 335
    const/16 v16, 0x5

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 337
    :try_start_2
    const-string v16, "www/childbrowser/icon_close.png"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 341
    :goto_2
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/webkit/WebView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$11(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/webkit/WebView;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    new-instance v17, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v18, -0x1

    const/16 v19, -0x1

    invoke-direct/range {v17 .. v19}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    new-instance v17, Landroid/webkit/WebChromeClient;

    invoke-direct/range {v17 .. v17}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 351
    new-instance v5, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v5, v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/widget/EditText;)V

    .line 352
    .local v5, "client":Landroid/webkit/WebViewClient;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v13

    .line 354
    .local v13, "settings":Landroid/webkit/WebSettings;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 355
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 356
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 357
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setPluginsEnabled(Z)V

    .line 358
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    const/16 v17, 0x6

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->setId(I)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->requestFocus()Z

    .line 364
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->requestFocusFromTouch()Z

    .line 367
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 368
    invoke-virtual {v2, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 371
    invoke-virtual {v15, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 373
    invoke-virtual {v15, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$13(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 378
    invoke-virtual {v12, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 382
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 384
    new-instance v11, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v11}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 385
    .local v11, "lp":Landroid/view/WindowManager$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 386
    const/16 v16, -0x1

    move/from16 v0, v16

    iput v0, v11, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 387
    const/16 v16, -0x1

    move/from16 v0, v16

    iput v0, v11, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->show()V

    .line 391
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 392
    return-void

    .line 279
    .end local v5    # "client":Landroid/webkit/WebViewClient;
    .end local v6    # "close":Landroid/widget/ImageButton;
    .end local v7    # "closeLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "forward":Landroid/widget/ImageButton;
    .end local v10    # "forwardLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v11    # "lp":Landroid/view/WindowManager$LayoutParams;
    .end local v13    # "settings":Landroid/webkit/WebSettings;
    .end local v14    # "textLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_0
    move-exception v8

    .line 280
    .local v8, "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 297
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v9    # "forward":Landroid/widget/ImageButton;
    .restart local v10    # "forwardLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_1
    move-exception v8

    .line 298
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 338
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "close":Landroid/widget/ImageButton;
    .restart local v7    # "closeLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v14    # "textLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_2
    move-exception v8

    .line 339
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2
.end method
