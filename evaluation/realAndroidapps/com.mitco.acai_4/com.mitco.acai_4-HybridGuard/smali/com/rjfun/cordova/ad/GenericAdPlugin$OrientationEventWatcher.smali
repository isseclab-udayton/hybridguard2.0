.class Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;
.super Landroid/view/OrientationEventListener;
.source "GenericAdPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OrientationEventWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;


# direct methods
.method public constructor <init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    .line 221
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 222
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 226
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$OrientationEventWatcher;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    invoke-virtual {v0}, Lcom/rjfun/cordova/ad/GenericAdPlugin;->checkOrientationChange()V

    .line 227
    return-void
.end method
