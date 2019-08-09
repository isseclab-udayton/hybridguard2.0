.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


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
    .line 1
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 320
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x42

    if-ne p2, v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    invoke-static {v0}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->access$0(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-result-object v0

    iget-object v1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$4;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    invoke-static {v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->access$0(Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;)Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    move-result-object v1

    invoke-static {v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$8(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$9(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;)V

    .line 322
    const/4 v0, 0x1

    .line 324
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
