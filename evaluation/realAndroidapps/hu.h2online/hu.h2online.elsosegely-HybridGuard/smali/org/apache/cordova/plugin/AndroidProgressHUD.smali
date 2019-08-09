.class public Lorg/apache/cordova/plugin/AndroidProgressHUD;
.super Landroid/app/Dialog;
.source "AndroidProgressHUD.java"


# instance fields
.field context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 18
    iput-object p1, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 23
    iput-object p1, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    .line 24
    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Lorg/apache/cordova/plugin/AndroidProgressHUD;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "indeterminate"    # Z
    .param p3, "cancelable"    # Z
    .param p4, "cancelListener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    .line 45
    new-instance v0, Lorg/apache/cordova/plugin/AndroidProgressHUD;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "ProgressHUD"

    const-string v5, "style"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v0, p0, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;-><init>(Landroid/content/Context;I)V

    .line 46
    .local v0, "dialog":Lorg/apache/cordova/plugin/AndroidProgressHUD;
    const-string v3, ""

    invoke-virtual {v0, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->setTitle(Ljava/lang/CharSequence;)V

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "progress_hud"

    const-string v5, "layout"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->setContentView(I)V

    .line 48
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 49
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "message"

    const-string v5, "id"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 54
    :goto_0
    invoke-virtual {v0, p3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->setCancelable(Z)V

    .line 55
    invoke-virtual {v0, p4}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 56
    invoke-virtual {v0}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    const/16 v4, 0x11

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 57
    invoke-virtual {v0}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 58
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    const v3, 0x3e4ccccd    # 0.2f

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 59
    invoke-virtual {v0}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 61
    invoke-virtual {v0}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->show()V

    .line 62
    return-object v0

    .line 51
    .end local v1    # "lp":Landroid/view/WindowManager$LayoutParams;
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "message"

    const-string v5, "id"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 52
    .local v2, "txt":Landroid/widget/TextView;
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public onWindowFocusChanged(Z)V
    .locals 6
    .param p1, "hasFocus"    # Z

    .prologue
    .line 28
    iget-object v2, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "spinnerImageView"

    const-string v4, "id"

    iget-object v5, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 29
    .local v0, "imageView":Landroid/widget/ImageView;
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 30
    .local v1, "spinner":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 31
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .locals 5
    .param p1, "message"    # Ljava/lang/CharSequence;

    .prologue
    .line 34
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 35
    iget-object v1, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "message"

    const-string v3, "id"

    iget-object v4, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 36
    iget-object v1, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "message"

    const-string v3, "id"

    iget-object v4, p0, Lorg/apache/cordova/plugin/AndroidProgressHUD;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 37
    .local v0, "txt":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {v0}, Landroid/widget/TextView;->invalidate()V

    .line 40
    .end local v0    # "txt":Landroid/widget/TextView;
    :cond_0
    return-void
.end method
