.class Lcom/rjfun/cordova/ad/GenericAdPlugin$2;
.super Ljava/lang/Object;
.source "GenericAdPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;->removeBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;


# direct methods
.method constructor <init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V
    .locals 0

    .prologue
    .line 331
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->hideBanner()V

    .line 336
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, v1, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__destroyAdView(Landroid/view/View;)V

    .line 337
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$2;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->bannerVisible:Z

    .line 340
    return-void
.end method
