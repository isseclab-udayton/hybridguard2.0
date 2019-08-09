.class Lhu/amarone/plugins/TabBarPlugin/TabBar$1;
.super Ljava/lang/Object;
.source "TabBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/amarone/plugins/TabBarPlugin/TabBar;->hideTabBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/TabBarPlugin/TabBar;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/TabBarPlugin/TabBar;

    .prologue
    .line 52
    iput-object p1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 54
    iget-object v2, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v1, v1, Lhu/amarone/plugins/TabBarPlugin/TabBar;->ctx:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    const v3, 0x1020002

    invoke-virtual {v1, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, v2, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    .line 55
    iget-object v1, p0, Lhu/amarone/plugins/TabBarPlugin/TabBar$1;->this$0:Lhu/amarone/plugins/TabBarPlugin/TabBar;

    iget-object v1, v1, Lhu/amarone/plugins/TabBarPlugin/TabBar;->frame:Landroid/view/ViewGroup;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 56
    .local v0, "container":Landroid/view/ViewGroup;
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 57
    return-void
.end method
