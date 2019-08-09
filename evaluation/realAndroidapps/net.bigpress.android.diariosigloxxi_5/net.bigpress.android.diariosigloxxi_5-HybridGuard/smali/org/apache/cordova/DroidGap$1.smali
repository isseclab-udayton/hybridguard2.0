.class Lorg/apache/cordova/DroidGap$1;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/DroidGap;->loadUrlIntoView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/DroidGap;

.field final synthetic val$me:Lorg/apache/cordova/DroidGap;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 491
    iput-object p1, p0, Lorg/apache/cordova/DroidGap$1;->this$0:Lorg/apache/cordova/DroidGap;

    iput-object p2, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iput-object p3, p0, Lorg/apache/cordova/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 495
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->appView:Landroid/webkit/WebView;

    if-nez v7, :cond_0

    .line 496
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v7}, Lorg/apache/cordova/DroidGap;->init()V

    .line 500
    :cond_0
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-static {v7}, Lorg/apache/cordova/DroidGap;->access$000(Lorg/apache/cordova/DroidGap;)V

    .line 503
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-static {v7}, Lorg/apache/cordova/DroidGap;->access$100(Lorg/apache/cordova/DroidGap;)Ljava/util/Stack;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/cordova/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->appView:Landroid/webkit/WebView;

    invoke-virtual {v7}, Landroid/webkit/WebView;->clearHistory()V

    .line 507
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    if-nez v7, :cond_3

    .line 508
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    new-instance v8, Lorg/apache/cordova/CallbackServer;

    invoke-direct {v8}, Lorg/apache/cordova/CallbackServer;-><init>()V

    iput-object v8, v7, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    .line 509
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    iget-object v8, p0, Lorg/apache/cordova/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/cordova/CallbackServer;->init(Ljava/lang/String;)V

    .line 514
    :goto_0
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginManager;->init()V

    .line 517
    const/4 v2, 0x0

    .line 518
    .local v2, "loading":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-static {v7}, Lorg/apache/cordova/DroidGap;->access$100(Lorg/apache/cordova/DroidGap;)Ljava/util/Stack;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_4

    .line 519
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    const-string v8, "loadingDialog"

    invoke-virtual {v7, v8, v9}, Lorg/apache/cordova/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 524
    :goto_1
    if-eqz v2, :cond_2

    .line 526
    const-string v6, ""

    .line 527
    .local v6, "title":Ljava/lang/String;
    const-string v3, "Loading Application..."

    .line 529
    .local v3, "message":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 530
    const/16 v7, 0x2c

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 531
    .local v0, "comma":I
    if-lez v0, :cond_5

    .line 532
    const/4 v7, 0x0

    invoke-virtual {v2, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 533
    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 540
    .end local v0    # "comma":I
    :cond_1
    :goto_2
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v7, v6, v3}, Lorg/apache/cordova/DroidGap;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .end local v3    # "message":Ljava/lang/String;
    .end local v6    # "title":Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget v1, v7, Lorg/apache/cordova/DroidGap;->loadUrlTimeout:I

    .line 545
    .local v1, "currentLoadUrlTimeout":I
    new-instance v4, Lorg/apache/cordova/DroidGap$1$1;

    invoke-direct {v4, p0, v1}, Lorg/apache/cordova/DroidGap$1$1;-><init>(Lorg/apache/cordova/DroidGap$1;I)V

    .line 563
    .local v4, "runnable":Ljava/lang/Runnable;
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 564
    .local v5, "thread":Ljava/lang/Thread;
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 565
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->appView:Landroid/webkit/WebView;

    iget-object v8, p0, Lorg/apache/cordova/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 566
    return-void

    .line 512
    .end local v1    # "currentLoadUrlTimeout":I
    .end local v2    # "loading":Ljava/lang/String;
    .end local v4    # "runnable":Ljava/lang/Runnable;
    .end local v5    # "thread":Ljava/lang/Thread;
    :cond_3
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    iget-object v7, v7, Lorg/apache/cordova/DroidGap;->callbackServer:Lorg/apache/cordova/CallbackServer;

    iget-object v8, p0, Lorg/apache/cordova/DroidGap$1;->val$url:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/cordova/CallbackServer;->reinit(Ljava/lang/String;)V

    goto :goto_0

    .line 522
    .restart local v2    # "loading":Ljava/lang/String;
    :cond_4
    iget-object v7, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    const-string v8, "loadingPageDialog"

    invoke-virtual {v7, v8, v9}, Lorg/apache/cordova/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 536
    .restart local v0    # "comma":I
    .restart local v3    # "message":Ljava/lang/String;
    .restart local v6    # "title":Ljava/lang/String;
    :cond_5
    const-string v6, ""

    .line 537
    move-object v3, v2

    goto :goto_2
.end method
