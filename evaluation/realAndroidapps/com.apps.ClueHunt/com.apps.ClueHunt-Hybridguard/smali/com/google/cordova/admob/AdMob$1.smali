.class Lcom/google/cordova/admob/AdMob$1;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->executeCreateBanner(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field private final synthetic val$strAdUnitId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/cordova/admob/AdMob;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    iput-object p2, p0, Lcom/google/cordova/admob/AdMob$1;->val$strAdUnitId:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/cordova/admob/AdMob$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 241
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    if-nez v2, :cond_0

    .line 242
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    new-instance v3, Lcom/google/android/gms/ads/AdView;

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v4, v4, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    invoke-static {v2, v3}, Lcom/google/cordova/admob/AdMob;->access$8(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/AdView;)V

    .line 243
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$1;->val$strAdUnitId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->setAdUnitId(Ljava/lang/String;)V

    .line 244
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v3}, Lcom/google/cordova/admob/AdMob;->access$9(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->setAdSize(Lcom/google/android/gms/ads/AdSize;)V

    .line 245
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    new-instance v3, Lcom/google/cordova/admob/AdMob$BannerListener;

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/google/cordova/admob/AdMob$BannerListener;-><init>(Lcom/google/cordova/admob/AdMob;Lcom/google/cordova/admob/AdMob$BannerListener;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 247
    :cond_0
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 248
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v3}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 251
    :cond_1
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$10(Lcom/google/cordova/admob/AdMob;)Landroid/widget/RelativeLayout;

    move-result-object v2

    if-nez v2, :cond_2

    .line 252
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v4, v4, Lcom/google/cordova/admob/AdMob;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v2, v3}, Lcom/google/cordova/admob/AdMob;->access$11(Lcom/google/cordova/admob/AdMob;Landroid/widget/RelativeLayout;)V

    .line 254
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 257
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v2, v2, Lcom/google/cordova/admob/AdMob;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v2}, Lorg/apache/cordova/CordovaWebView;->getRootView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 258
    .local v1, "rootView":Landroid/view/ViewGroup;
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$10(Lcom/google/cordova/admob/AdMob;)Landroid/widget/RelativeLayout;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$10(Lcom/google/cordova/admob/AdMob;)Landroid/widget/RelativeLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->bringToFront()V

    .line 263
    .end local v0    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v1    # "rootView":Landroid/view/ViewGroup;
    :cond_2
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/google/cordova/admob/AdMob;->access$12(Lcom/google/cordova/admob/AdMob;Z)V

    .line 264
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/google/cordova/admob/AdMob;->access$13(Lcom/google/cordova/admob/AdMob;Z)V

    .line 265
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v3}, Lcom/google/cordova/admob/AdMob;->access$14(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdRequest;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/ads/AdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 267
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v2}, Lcom/google/cordova/admob/AdMob;->access$0(Lcom/google/cordova/admob/AdMob;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 268
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    iget-object v3, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v3}, Lcom/google/cordova/admob/AdMob;->access$1(Lcom/google/cordova/admob/AdMob;)I

    move-result v3

    iget-object v4, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v4}, Lcom/google/cordova/admob/AdMob;->access$2(Lcom/google/cordova/admob/AdMob;)I

    move-result v4

    iget-object v5, p0, Lcom/google/cordova/admob/AdMob$1;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v5}, Lcom/google/cordova/admob/AdMob;->access$3(Lcom/google/cordova/admob/AdMob;)I

    move-result v5

    iget-object v6, p0, Lcom/google/cordova/admob/AdMob$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v2, v3, v4, v5, v6}, Lcom/google/cordova/admob/AdMob;->access$4(Lcom/google/cordova/admob/AdMob;IIILorg/apache/cordova/CallbackContext;)V

    .line 272
    :cond_3
    :goto_0
    return-void

    .line 270
    :cond_4
    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/cordova/admob/AdMob$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0
.end method
