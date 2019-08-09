.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;
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


# direct methods
.method constructor <init>(Lhu/amarone/plugins/BannerPlugin/BannerPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    .prologue
    .line 103
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    iget-object v1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$3;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget v1, v1, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->height:I

    invoke-virtual {v0, v1}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->doubleSize(I)V

    .line 106
    return-void
.end method
