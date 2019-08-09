.class Lhu/amarone/plugins/TabBarPlugin/TabBar$2;
.super Ljava/lang/Object;
.source "TabBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/amarone/plugins/TabBarPlugin/TabBar;-><init>(Landroid/content/Context;Lorg/apache/cordova/CordovaWebView;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[I[I[ILjava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/TabBarPlugin/TabBar;

    .prologue
    .line 132
    iput-object p1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iput-object p2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, -0x1

    .line 135
    iget-object v3, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->val$context:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    const v4, 0x1020002

    invoke-virtual {v2, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v3, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    .line 137
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->val$context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 138
    .local v0, "container":Landroid/widget/LinearLayout;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 139
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 142
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v2, v2, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 143
    .local v1, "tempView":Landroid/view/View;
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v2, v2, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 145
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$2;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v2, v2, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 147
    return-void
.end method
