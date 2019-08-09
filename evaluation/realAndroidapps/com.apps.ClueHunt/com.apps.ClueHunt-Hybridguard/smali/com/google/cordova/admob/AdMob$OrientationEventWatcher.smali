.class Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;
.super Landroid/view/OrientationEventListener;
.source "AdMob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/cordova/admob/AdMob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OrientationEventWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;


# direct methods
.method public constructor <init>(Lcom/google/cordova/admob/AdMob;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 498
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;->this$0:Lcom/google/cordova/admob/AdMob;

    .line 499
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 500
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 504
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$OrientationEventWatcher;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-virtual {v0}, Lcom/google/cordova/admob/AdMob;->__onOrientationChange()V

    .line 505
    return-void
.end method
