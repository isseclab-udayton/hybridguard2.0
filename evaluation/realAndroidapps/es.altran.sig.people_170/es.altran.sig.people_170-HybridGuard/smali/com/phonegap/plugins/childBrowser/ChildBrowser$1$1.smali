.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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
    .line 216
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 219
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 220
    .local v1, "obj":Lorg/json/JSONObject;
    const-string v2, "type"

    invoke-static {}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$100()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 222
    iget-object v2, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1$1;->this$1:Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;

    iget-object v2, v2, Lcom/phonegap/plugins/childBrowser/ChildBrowser$1;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$200(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Lorg/json/JSONObject;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .end local v1    # "obj":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 223
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ChildBrowser"

    const-string v3, "Should never happen"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
