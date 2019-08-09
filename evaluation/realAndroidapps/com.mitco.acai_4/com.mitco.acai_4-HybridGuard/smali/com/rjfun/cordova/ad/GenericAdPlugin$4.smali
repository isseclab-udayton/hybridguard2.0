.class Lcom/rjfun/cordova/ad/GenericAdPlugin$4;
.super Ljava/lang/Object;
.source "GenericAdPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;->hideBanner()V
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
    .line 478
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 481
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-static {v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->access$000(Lcom/rjfun/cordova/ad/GenericAdPlugin;)V

    .line 483
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$4;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v1, v1, Lcom/rjfun/cordova/ad/GenericAdPlugin;->adView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->__pauseAdView(Landroid/view/View;)V

    .line 484
    return-void
.end method
