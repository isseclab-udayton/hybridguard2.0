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

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)Lcom/phonegap/plugins/childBrowser/ChildBrowser;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    return-object v0
.end method

.method private dpToPixels(I)I
    .locals 4
    .param p1, "dipValue"    # I

    .prologue
    .line 224
    const/4 v1, 0x1

    .line 225
    int-to-float v2, p1

    .line 226
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v3, v3, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 224
    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v0, v1

    .line 229
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
    .line 394
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v1, v1, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 395
    .local v0, "input":Ljava/io/InputStream;
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/app/Dialog;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v18

    const v19, 0x1030006

    invoke-direct/range {v17 .. v19}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$2(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/app/Dialog;)V

    .line 235
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

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 238
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

    .line 252
    new-instance v12, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 253
    .local v12, "main":Landroid/widget/LinearLayout;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 256
    new-instance v15, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 257
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

    .line 258
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

    .line 259
    const/16 v16, 0x3

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 260
    const/16 v16, 0x30

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 263
    new-instance v2, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 264
    .local v2, "actionButtonContainer":Landroid/widget/RelativeLayout;
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v17, -0x2

    const/16 v18, -0x2

    invoke-direct/range {v16 .. v18}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    const/16 v16, 0x3

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setHorizontalGravity(I)V

    .line 266
    const/16 v16, 0x10

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setVerticalGravity(I)V

    .line 267
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 270
    new-instance v3, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 271
    .local v3, "back":Landroid/widget/ImageButton;
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v4, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 272
    .local v4, "backLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x5

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 273
    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 274
    const-string v16, "Back Button"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 275
    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 277
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

    .line 281
    :goto_0
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    new-instance v9, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 289
    .local v9, "forward":Landroid/widget/ImageButton;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 290
    .local v10, "forwardLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x1

    const/16 v17, 0x2

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 291
    invoke-virtual {v9, v10}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 292
    const-string v16, "Forward Button"

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 293
    const/16 v16, 0x3

    move/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 295
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

    .line 299
    :goto_1
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$7(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/widget/EditText;)V

    .line 307
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x1

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 308
    .local v14, "textLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0x1

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 309
    const/16 v16, 0x0

    const/16 v17, 0x5

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x4

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setId(I)V

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x10

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setInputType(I)V

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x2

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/EditText;->setInputType(I)V

    .line 317
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

    .line 329
    new-instance v6, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 330
    .local v6, "close":Landroid/widget/ImageButton;
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v16, -0x2

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v7, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 331
    .local v7, "closeLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v16, 0xb

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 332
    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    const-string v16, "Close Button"

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 334
    const/16 v16, 0x5

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setId(I)V

    .line 336
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

    .line 340
    :goto_2
    new-instance v16, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    new-instance v17, Landroid/webkit/WebView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static/range {v16 .. v17}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$11(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/webkit/WebView;)V

    .line 348
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

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    new-instance v17, Landroid/webkit/WebChromeClient;

    invoke-direct/range {v17 .. v17}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 350
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

    .line 351
    .local v5, "client":Landroid/webkit/WebViewClient;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 352
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v13

    .line 353
    .local v13, "settings":Landroid/webkit/WebSettings;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 354
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 355
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 356
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setPluginsEnabled(Z)V

    .line 357
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 358
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    const/16 v17, 0x6

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebView;->setId(I)V

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v16

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->requestFocus()Z

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/webkit/WebView;->requestFocusFromTouch()Z

    .line 366
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 367
    invoke-virtual {v2, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 370
    invoke-virtual {v15, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 372
    invoke-virtual {v15, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$13(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 377
    invoke-virtual {v12, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 381
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$12(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 383
    new-instance v11, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v11}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 384
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

    .line 385
    const/16 v16, -0x1

    move/from16 v0, v16

    iput v0, v11, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 386
    const/16 v16, -0x1

    move/from16 v0, v16

    iput v0, v11, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->show()V

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$3(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 391
    return-void

    .line 278
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

    .line 279
    .local v8, "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 296
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v9    # "forward":Landroid/widget/ImageButton;
    .restart local v10    # "forwardLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_1
    move-exception v8

    .line 297
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 337
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "close":Landroid/widget/ImageButton;
    .restart local v7    # "closeLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v14    # "textLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_2
    move-exception v8

    .line 338
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v16, "ChildBrowser"

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2
.end method
