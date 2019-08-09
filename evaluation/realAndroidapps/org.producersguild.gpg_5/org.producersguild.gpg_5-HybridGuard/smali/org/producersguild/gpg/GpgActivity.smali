.class public Lorg/producersguild/gpg/GpgActivity;
.super Lorg/apache/cordova/DroidGap;
.source "GpgActivity.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "GPG"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/apache/cordova/DroidGap;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 19
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 19
    invoke-super/range {p0 .. p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 21
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .line 22
    .local v2, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual/range {p0 .. p0}, Lorg/producersguild/gpg/GpgActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v15

    invoke-virtual {v15, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 23
    iget v10, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 24
    .local v10, "width":I
    iget v4, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 26
    .local v4, "height":I
    const-string v15, "GPG"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "x"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    invoke-virtual/range {p0 .. p0}, Lorg/producersguild/gpg/GpgActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 29
    .local v1, "display":Landroid/view/Display;
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v5

    .line 31
    .local v5, "rotation":I
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    .line 32
    .local v8, "size":Landroid/graphics/Point;
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v9

    .line 33
    .local v9, "w":I
    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v3

    .line 34
    .local v3, "h":I
    invoke-virtual {v8, v9, v3}, Landroid/graphics/Point;->set(II)V

    .line 37
    invoke-virtual/range {p0 .. p0}, Lorg/producersguild/gpg/GpgActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v15

    invoke-virtual {v15, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 38
    iget v15, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v15, v15

    iget v0, v2, Landroid/util/DisplayMetrics;->xdpi:F

    move/from16 v16, v0

    div-float v15, v15, v16

    float-to-double v15, v15

    const-wide/high16 v17, 0x4000000000000000L    # 2.0

    invoke-static/range {v15 .. v18}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    .line 39
    .local v11, "x":D
    iget v15, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v15, v15

    iget v0, v2, Landroid/util/DisplayMetrics;->ydpi:F

    move/from16 v16, v0

    div-float v15, v15, v16

    float-to-double v15, v15

    const-wide/high16 v17, 0x4000000000000000L    # 2.0

    invoke-static/range {v15 .. v18}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    .line 40
    .local v13, "y":D
    add-double v15, v11, v13

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 41
    .local v6, "screenInches":D
    const-string v15, "GPG"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Screen inches : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const-wide/high16 v15, 0x401e000000000000L    # 7.5

    cmpg-double v15, v6, v15

    if-gtz v15, :cond_0

    .line 44
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/producersguild/gpg/GpgActivity;->setRequestedOrientation(I)V

    .line 101
    :cond_0
    const-string v15, "file:///android_asset/www/index.html"

    move-object/from16 v0, p0

    invoke-super {v0, v15}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    .line 102
    return-void
.end method
