.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;
.super Ljava/lang/Object;
.source "BannerPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

.field final synthetic val$size:I

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;ILjava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    .prologue
    .line 172
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iput p2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$size:I

    iput-object p3, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 175
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$size:I

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->resize(I)V

    .line 177
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/MyBanner;->mAdView:Lcom/google/android/gms/ads/AdView;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->getAdUnitId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 178
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->loadUrl(Ljava/lang/String;)V

    .line 197
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    invoke-virtual {v0}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->hideWebView()V

    .line 183
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 184
    .local v6, "bnrParent":Landroid/view/ViewGroup;
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 186
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeViewAt(I)V

    .line 187
    iget-object v7, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    new-instance v0, Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget v2, v2, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->startx:I

    iget-object v3, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget v3, v3, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->starty:I

    iget-object v4, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget v4, v4, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->width:I

    iget-object v5, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget v5, v5, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->height:I

    invoke-direct/range {v0 .. v5}, Lhu/amarone/plugins/BannerPlugin/MyBanner;-><init>(Landroid/content/Context;IIII)V

    iput-object v0, v7, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    .line 188
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 190
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 192
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$size:I

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->resize(I)V

    .line 194
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$7;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
