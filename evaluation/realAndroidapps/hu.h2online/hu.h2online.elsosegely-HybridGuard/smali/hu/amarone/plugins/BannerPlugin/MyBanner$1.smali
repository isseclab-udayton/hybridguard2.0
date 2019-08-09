.class Lhu/amarone/plugins/BannerPlugin/MyBanner$1;
.super Ljava/lang/Object;
.source "MyBanner.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/amarone/plugins/BannerPlugin/MyBanner;-><init>(Landroid/content/Context;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/amarone/plugins/BannerPlugin/MyBanner;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/MyBanner;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/MyBanner;

    .prologue
    .line 48
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/MyBanner$1;->this$0:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 51
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 53
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
