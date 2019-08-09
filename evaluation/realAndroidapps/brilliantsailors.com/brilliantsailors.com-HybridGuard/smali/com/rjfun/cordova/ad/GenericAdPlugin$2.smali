.class Lcom/rjfun/cordova/ad/GenericAdPlugin$2;
.super Ljava/lang/Object;
.source "GenericAdPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;->createBanner(Ljava/lang/String;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

.field final synthetic val$strAdUnitId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 467
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iput-object p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->val$strAdUnitId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 470
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->val$strAdUnitId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__createAdView(Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 472
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 476
    :goto_0
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, v1, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__loadAdView(Landroid/view/View;)V

    .line 477
    return-void

    .line 474
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-static {v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->access$000(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    goto :goto_0
.end method
