.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;


# direct methods
.method constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)V
    .locals 0

    .prologue
    .line 292
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$5;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    iget-object v0, v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-static {v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$800(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)V

    .line 295
    return-void
.end method
