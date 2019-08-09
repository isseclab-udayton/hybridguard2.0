.class Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
.super Landroid/widget/LinearLayout;
.source "TabBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lhu/amarone/plugins/TabBarPlugin/TabBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomButton"
.end annotation


# instance fields
.field private bgColor:I

.field private button:Landroid/widget/Button;

.field private commandParam:Ljava/lang/String;

.field private imageButton:Landroid/widget/ImageButton;

.field private mContext:Landroid/content/Context;

.field private selectionColor:I

.field final synthetic this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

.field private webView:Lorg/apache/cordova/CordovaWebView;


# direct methods
.method public constructor <init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;Ljava/lang/String;[I[I[I)V
    .locals 12
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "webView"    # Lorg/apache/cordova/CordovaWebView;
    .param p4, "text"    # Ljava/lang/String;
    .param p5, "commandParam"    # Ljava/lang/String;
    .param p6, "backgroundColor"    # [I
    .param p7, "selectionColor"    # [I
    .param p8, "textColor"    # [I

    .prologue
    .line 176
    iput-object p1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    .line 177
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 178
    iput-object p2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->mContext:Landroid/content/Context;

    .line 179
    move-object/from16 v0, p5

    iput-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->commandParam:Ljava/lang/String;

    .line 180
    const/4 v7, 0x0

    aget v7, p6, v7

    const/4 v8, 0x1

    aget v8, p6, v8

    const/4 v9, 0x2

    aget v9, p6, v9

    invoke-static {v7, v8, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    iput v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    .line 181
    const/4 v7, 0x0

    aget v7, p7, v7

    const/4 v8, 0x1

    aget v8, p7, v8

    const/4 v9, 0x2

    aget v9, p7, v9

    invoke-static {v7, v8, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    iput v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->selectionColor:I

    .line 182
    iput-object p3, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->webView:Lorg/apache/cordova/CordovaWebView;

    .line 183
    iget v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    invoke-virtual {p0, v7}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    .line 185
    invoke-virtual {p0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->refreshSize()V

    .line 188
    if-eqz p4, :cond_0

    .line 189
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    .line 190
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    iget v8, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 191
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setClickable(Z)V

    .line 192
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    move-object/from16 v0, p4

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 193
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/high16 v8, 0x41400000    # 12.0f

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setTextSize(F)V

    .line 194
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setHorizontallyScrolling(Z)V

    .line 195
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 196
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/4 v8, 0x0

    aget v8, p8, v8

    const/4 v9, 0x1

    aget v9, p8, v9

    const/4 v10, 0x2

    aget v10, p8, v10

    invoke-static {v8, v9, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 197
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    const/4 v8, 0x0

    const/4 v9, 0x5

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/widget/Button;->setPadding(IIII)V

    .line 199
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 200
    .local v6, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x5

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 201
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    invoke-virtual {v7, v6}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 202
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    invoke-virtual {p0, v7}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->addView(Landroid/view/View;)V

    .line 235
    :goto_0
    return-void

    .line 207
    .end local v6    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 208
    .local v5, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x5

    invoke-virtual {v5, v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 210
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 211
    .local v1, "buttonLayout":Landroid/widget/LinearLayout;
    const/4 v7, 0x0

    const/16 v8, 0xf

    const/4 v9, 0x0

    const/16 v10, 0xf

    invoke-virtual {v1, v7, v8, v9, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 212
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    iget v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 214
    const/16 v7, 0x11

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 215
    invoke-virtual {p0, v1}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->addView(Landroid/view/View;)V

    .line 217
    new-instance v7, Landroid/widget/ImageButton;

    invoke-direct {v7, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    .line 218
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    iget v8, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 219
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    const/4 v8, 0x0

    const/4 v9, 0x5

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 220
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 221
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "drawable/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p5

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 222
    .local v3, "imagePath":Ljava/lang/String;
    const-string v7, "ImagePath"

    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    const-string v7, "PackageName"

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    invoke-virtual {p0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v3, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 225
    .local v4, "imageResource":I
    invoke-virtual {p0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 226
    .local v2, "image":Landroid/graphics/drawable/Drawable;
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    sget-object v8, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 227
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    invoke-virtual {v7, v2}, Landroid/widget/ImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 229
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 230
    .restart local v6    # "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    invoke-virtual {v7, v6}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    iget-object v7, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->imageButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;

    .prologue
    .line 165
    iget-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->button:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$102(Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;I)I
    .locals 0
    .param p0, "x0"    # Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;
    .param p1, "x1"    # I

    .prologue
    .line 165
    iput p1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->selectionColor:I

    return p1
.end method


# virtual methods
.method public refreshSize()V
    .locals 7

    .prologue
    .line 238
    iget-object v4, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->mContext:Landroid/content/Context;

    const-string v5, "window"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 239
    .local v2, "w":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 240
    .local v0, "d":Landroid/view/Display;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 241
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 243
    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 244
    .local v3, "widthPixels":I
    const-string v4, "refreshSize"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "widthPixels"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    div-int/lit8 v5, v3, 0x5

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v4}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    return-void
.end method

.method public run(Ljava/lang/String;)V
    .locals 3
    .param p1, "commandParam"    # Ljava/lang/String;

    .prologue
    .line 261
    iget-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v2, v2, Lhu/amarone/plugins/TabBarPlugin/TabBar;->callbackName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 262
    return-void
.end method

.method public setSelected()V
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->selectionColor:I

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    .line 253
    iget-object v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->commandParam:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->run(Ljava/lang/String;)V

    .line 254
    return-void
.end method

.method public setUnSelected()V
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->bgColor:I

    invoke-virtual {p0, v0}, Lhu/amarone/plugins/TabBarPlugin/TabBar$CustomButton;->setBackgroundColor(I)V

    .line 258
    return-void
.end method
