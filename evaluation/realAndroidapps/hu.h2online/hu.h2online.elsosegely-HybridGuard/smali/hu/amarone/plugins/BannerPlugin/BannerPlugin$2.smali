.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;
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


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    .prologue
    .line 85
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iput-object p2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->val$arg:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 88
    :try_start_0
    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v2, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->val$arg:Lorg/json/JSONObject;

    const-string v3, "startx"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->val$arg:Lorg/json/JSONObject;

    const-string v4, "starty"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iget-object v4, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->val$arg:Lorg/json/JSONObject;

    const-string v5, "width"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iget-object v5, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$2;->val$arg:Lorg/json/JSONObject;

    const-string v6, "height"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->resize(IIII)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
