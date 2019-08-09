.class Lcom/rjfun/cordova/ad/GenericAdPlugin$1;
.super Ljava/lang/Object;
.source "GenericAdPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rjfun/cordova/ad/GenericAdPlugin;->evalJs(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

.field final synthetic val$js:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/rjfun/cordova/ad/GenericAdPlugin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 313
    iput-object p1, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iput-object p2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;->val$js:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 316
    iget-object v0, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;->this$0:Lcom/rjfun/cordova/ad/GenericAdPlugin;

    iget-object v0, v0, Lcom/rjfun/cordova/ad/GenericAdPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:(function(){try{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/rjfun/cordova/ad/GenericAdPlugin$1;->val$js:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}catch(e){};})();"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 317
    return-void
.end method
