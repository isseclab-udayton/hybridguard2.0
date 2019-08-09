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

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iput-object p2, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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
    .line 348
    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v1, v1, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 349
    .local v0, "input":Ljava/io/InputStream;
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 212
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    new-instance v15, Landroid/app/Dialog;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    invoke-static {v14, v15}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$002(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 214
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 215
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 216
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    new-instance v15, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual {v14, v15}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 229
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x2

    invoke-direct {v2, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 230
    .local v2, "backParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x2

    invoke-direct {v9, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 231
    .local v9, "forwardParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x2

    const/high16 v16, 0x3f800000    # 1.0f

    move/from16 v0, v16

    invoke-direct {v7, v14, v15, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 232
    .local v7, "editParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x2

    invoke-direct {v5, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 233
    .local v5, "closeParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x1

    const/4 v15, -0x1

    invoke-direct {v13, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 234
    .local v13, "wvParams":Landroid/widget/LinearLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$300(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 236
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .end local v2    # "backParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, -0x1

    const/4 v15, -0x2

    const/high16 v16, 0x3f800000    # 1.0f

    move/from16 v0, v16

    invoke-direct {v2, v14, v15, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 237
    .restart local v2    # "backParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .end local v9    # "forwardParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, -0x1

    const/4 v15, -0x2

    const/high16 v16, 0x3f800000    # 1.0f

    move/from16 v0, v16

    invoke-direct {v9, v14, v15, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 238
    .restart local v9    # "forwardParams":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .end local v5    # "closeParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, -0x1

    const/4 v15, -0x2

    const/high16 v16, 0x3f800000    # 1.0f

    move/from16 v0, v16

    invoke-direct {v5, v14, v15, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 241
    .restart local v5    # "closeParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    new-instance v11, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v14, v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v11, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 242
    .local v11, "main":Landroid/widget/LinearLayout;
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 244
    new-instance v12, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v14, v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v12, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 245
    .local v12, "toolbar":Landroid/widget/LinearLayout;
    const/4 v14, 0x0

    invoke-virtual {v12, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 247
    new-instance v1, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v14, v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v1, v14}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 248
    .local v1, "back":Landroid/widget/ImageButton;
    new-instance v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$2;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual {v1, v14}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 253
    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Landroid/widget/ImageButton;->setId(I)V

    .line 255
    :try_start_0
    const-string v14, "www/childbrowser/icon_arrow_left.png"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v14

    invoke-virtual {v1, v14}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    new-instance v8, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v14, v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v8, v14}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 262
    .local v8, "forward":Landroid/widget/ImageButton;
    new-instance v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$3;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual {v8, v14}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 267
    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Landroid/widget/ImageButton;->setId(I)V

    .line 269
    :try_start_1
    const-string v14, "www/childbrowser/icon_arrow_right.png"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v14

    invoke-virtual {v8, v14}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 273
    :goto_1
    invoke-virtual {v8, v9}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    new-instance v15, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static {v14, v15}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$602(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 276
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    new-instance v15, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 286
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    const/4 v15, 0x3

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setId(I)V

    .line 287
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 288
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    invoke-virtual {v14, v7}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    new-instance v4, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v14, v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v14}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v14

    invoke-direct {v4, v14}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 292
    .local v4, "close":Landroid/widget/ImageButton;
    new-instance v14, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V

    invoke-virtual {v4, v14}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    const/4 v14, 0x4

    invoke-virtual {v4, v14}, Landroid/widget/ImageButton;->setId(I)V

    .line 299
    :try_start_2
    const-string v14, "www/childbrowser/icon_close.png"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->loadDrawable(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v14

    invoke-virtual {v4, v14}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 303
    :goto_2
    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    new-instance v15, Landroid/webkit/WebView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static {v14, v15}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$902(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Landroid/webkit/WebView;)Landroid/webkit/WebView;

    .line 306
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 307
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 308
    new-instance v3, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iget-object v15, v15, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->ctx:Lorg/apache/cordova/api/LegacyContext;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v3, v14, v15, v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;-><init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Lorg/apache/cordova/api/CordovaInterface;Landroid/widget/EditText;)V

    .line 309
    .local v3, "client":Landroid/webkit/WebViewClient;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 310
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->val$url:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 311
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    const/4 v15, 0x5

    invoke-virtual {v14, v15}, Landroid/webkit/WebView;->setId(I)V

    .line 312
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 313
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14, v13}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->requestFocus()Z

    .line 315
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->requestFocusFromTouch()Z

    .line 316
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 317
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v14}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 318
    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 319
    invoke-virtual {v12, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 320
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 321
    invoke-virtual {v12, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 323
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$1000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 324
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 326
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$900(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/webkit/WebView;

    move-result-object v14

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 328
    new-instance v10, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v10}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 329
    .local v10, "lp":Landroid/view/WindowManager$LayoutParams;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    invoke-virtual {v14}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v14

    invoke-virtual {v10, v14}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 330
    const/4 v14, -0x1

    iput v14, v10, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 331
    const/4 v14, -0x1

    iput v14, v10, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 333
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    invoke-virtual {v14, v11}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 334
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    invoke-virtual {v14}, Landroid/app/Dialog;->show()V

    .line 335
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$000(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/app/Dialog;

    move-result-object v14

    invoke-virtual {v14}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v14

    invoke-virtual {v14, v10}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 337
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$1100(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 338
    const/16 v14, 0x8

    invoke-virtual {v1, v14}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 339
    const/16 v14, 0x8

    invoke-virtual {v8, v14}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 340
    const/16 v14, 0x8

    invoke-virtual {v4, v14}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 342
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$300(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Z

    move-result v14

    if-nez v14, :cond_3

    .line 343
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v14}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$600(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v14

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setVisibility(I)V

    .line 345
    :cond_3
    return-void

    .line 256
    .end local v3    # "client":Landroid/webkit/WebViewClient;
    .end local v4    # "close":Landroid/widget/ImageButton;
    .end local v8    # "forward":Landroid/widget/ImageButton;
    .end local v10    # "lp":Landroid/view/WindowManager$LayoutParams;
    :catch_0
    move-exception v6

    .line 257
    .local v6, "e":Ljava/io/IOException;
    const-string v14, "ChildBrowser"

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 270
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v8    # "forward":Landroid/widget/ImageButton;
    :catch_1
    move-exception v6

    .line 271
    .restart local v6    # "e":Ljava/io/IOException;
    const-string v14, "ChildBrowser"

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 300
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v4    # "close":Landroid/widget/ImageButton;
    :catch_2
    move-exception v6

    .line 301
    .restart local v6    # "e":Ljava/io/IOException;
    const-string v14, "ChildBrowser"

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2
.end method
