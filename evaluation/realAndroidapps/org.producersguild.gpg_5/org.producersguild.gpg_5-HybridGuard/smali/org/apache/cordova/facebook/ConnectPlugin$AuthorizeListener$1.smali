.class Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->onComplete(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;


# direct methods
.method constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;)V
    .locals 0

    .prologue
    .line 279
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 282
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v2, v2, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lcom/facebook/android/Facebook;

    move-result-object v2

    const-string v3, "/me"

    invoke-virtual {v2, v3}, Lcom/facebook/android/Facebook;->request(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 283
    .local v1, "o":Lorg/json/JSONObject;
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v2, v2, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    const-string v3, "id"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$502(Lorg/apache/cordova/facebook/ConnectPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 284
    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v2, v2, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v3, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v3, v3, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-virtual {v3}, Lorg/apache/cordova/facebook/ConnectPlugin;->getResponse()Lorg/json/JSONObject;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener$1;->this$1:Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v4, v4, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;->fba:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v4}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$400(Lorg/apache/cordova/facebook/ConnectPlugin;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/apache/cordova/facebook/ConnectPlugin;->success(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 295
    .end local v1    # "o":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 285
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_0

    .line 288
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v0

    .line 290
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 291
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 293
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
