.class Lhu/h2online/elsosegely/ElsoSegely$1;
.super Ljava/lang/Object;
.source "ElsoSegely.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/h2online/elsosegely/ElsoSegely;->showIntentMessageInAlertView(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/h2online/elsosegely/ElsoSegely;

.field final synthetic val$hiddenMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Lhu/h2online/elsosegely/ElsoSegely;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lhu/h2online/elsosegely/ElsoSegely;

    .prologue
    .line 83
    iput-object p1, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iput-object p2, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->val$hiddenMessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 85
    iget-object v2, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v2, v3}, Lhu/h2online/elsosegely/ElsoSegely;->setIntent(Landroid/content/Intent;)V

    .line 86
    iget-object v2, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->val$hiddenMessage:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 87
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 89
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 90
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "fromAlert"

    const-string v3, "YES"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->val$hiddenMessage:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 94
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lhu/h2online/elsosegely/ElsoSegely$1;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    invoke-virtual {v2, v0}, Lhu/h2online/elsosegely/ElsoSegely;->startActivity(Landroid/content/Intent;)V

    .line 96
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method
