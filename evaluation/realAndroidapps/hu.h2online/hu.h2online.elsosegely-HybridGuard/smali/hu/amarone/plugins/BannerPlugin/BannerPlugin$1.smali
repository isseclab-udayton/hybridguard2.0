.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;
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

.field final synthetic val$arg:Lorg/json/JSONObject;

.field final synthetic val$callback:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    .prologue
    .line 41
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iput-object p2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    iput-object p3, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$callback:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 44
    :try_start_0
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v2, "height"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->height:I

    .line 45
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v2, "startx"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->startx:I

    .line 46
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v2, "starty"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->starty:I

    .line 47
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v2, "width"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->width:I

    .line 49
    iget-object v9, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    new-instance v0, Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v3, "startx"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v4, "starty"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iget-object v4, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v5, "width"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iget-object v5, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$arg:Lorg/json/JSONObject;

    const-string v10, "height"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-direct/range {v0 .. v5}, Lhu/amarone/plugins/BannerPlugin/MyBanner;-><init>(Landroid/content/Context;IIII)V

    iput-object v0, v9, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    .line 50
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v2, 0x1020002

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    .line 52
    new-instance v7, Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v7, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 53
    .local v7, "container":Landroid/widget/RelativeLayout;
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 55
    .local v6, "cdvWebView":Landroid/view/ViewGroup;
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 56
    invoke-virtual {v7, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 57
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 59
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iput-object v7, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    .line 60
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->frame:Landroid/view/ViewGroup;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->bnrContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 63
    :try_start_1
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    new-instance v1, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;

    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v2, v2, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->promoBanner:Lhu/amarone/plugins/BannerPlugin/MyPromoBanner;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    .end local v6    # "cdvWebView":Landroid/view/ViewGroup;
    .end local v7    # "container":Landroid/widget/RelativeLayout;
    :goto_0
    return-void

    .line 64
    .restart local v6    # "cdvWebView":Landroid/view/ViewGroup;
    .restart local v7    # "container":Landroid/widget/RelativeLayout;
    :catch_0
    move-exception v8

    .line 65
    .local v8, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$1;->val$callback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 68
    .end local v6    # "cdvWebView":Landroid/view/ViewGroup;
    .end local v7    # "container":Landroid/widget/RelativeLayout;
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 70
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
