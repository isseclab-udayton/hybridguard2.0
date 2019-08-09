.class Lhu/amarone/plugins/BannerPlugin/BannerPlugin$8;
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
    .line 207
    iput-object p1, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$8;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin$8;->this$0:Lhu/amarone/plugins/BannerPlugin/BannerPlugin;

    iget-object v0, v0, Lhu/amarone/plugins/BannerPlugin/BannerPlugin;->webView:Lhu/amarone/plugins/BannerPlugin/MyBanner;

    invoke-virtual {v0}, Lhu/amarone/plugins/BannerPlugin/MyBanner;->showWebView()V

    .line 210
    return-void
.end method
