.class Lorg/apache/cordova/DroidGap$5;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/DroidGap;->showSplashScreen(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/DroidGap;

.field final synthetic val$that:Lorg/apache/cordova/DroidGap;

.field final synthetic val$time:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;I)V
    .locals 0

    .prologue
    .line 1022
    iput-object p1, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    iput-object p2, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    iput p3, p0, Lorg/apache/cordova/DroidGap$5;->val$time:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/16 v8, 0x400

    const/4 v7, -0x1

    .line 1025
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v4}, Lorg/apache/cordova/DroidGap;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 1028
    .local v0, "display":Landroid/view/Display;
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v4}, Lorg/apache/cordova/DroidGap;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1029
    .local v2, "root":Landroid/widget/LinearLayout;
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 1030
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 1031
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1032
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    const-string v5, "backgroundColor"

    const/high16 v6, -0x1000000

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/DroidGap;->getIntegerProperty(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 1033
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    invoke-direct {v4, v7, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1037
    new-instance v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v4}, Lorg/apache/cordova/DroidGap;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1038
    .local v3, "splashscreenView":Landroid/widget/ImageView;
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    iget v4, v4, Lorg/apache/cordova/DroidGap;->splashscreen:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1039
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1040
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1041
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1044
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    new-instance v5, Landroid/app/Dialog;

    iget-object v6, p0, Lorg/apache/cordova/DroidGap$5;->val$that:Lorg/apache/cordova/DroidGap;

    const v7, 0x1030010

    invoke-direct {v5, v6, v7}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v5, v4, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    .line 1046
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v4}, Lorg/apache/cordova/DroidGap;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v4, v4, 0x400

    if-ne v4, v8, :cond_0

    .line 1048
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    iget-object v4, v4, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v8, v8}, Landroid/view/Window;->setFlags(II)V

    .line 1051
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    iget-object v4, v4, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v4, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 1052
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    iget-object v4, v4, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 1053
    iget-object v4, p0, Lorg/apache/cordova/DroidGap$5;->this$0:Lorg/apache/cordova/DroidGap;

    iget-object v4, v4, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    .line 1056
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 1057
    .local v1, "handler":Landroid/os/Handler;
    new-instance v4, Lorg/apache/cordova/DroidGap$5$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/DroidGap$5$1;-><init>(Lorg/apache/cordova/DroidGap$5;)V

    iget v5, p0, Lorg/apache/cordova/DroidGap$5;->val$time:I

    int-to-long v5, v5

    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1062
    return-void
.end method
