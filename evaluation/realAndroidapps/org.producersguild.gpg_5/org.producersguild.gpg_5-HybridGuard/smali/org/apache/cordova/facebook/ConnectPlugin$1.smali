.class Lorg/apache/cordova/facebook/ConnectPlugin$1;
.super Ljava/lang/Object;
.source "ConnectPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/facebook/ConnectPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

.field final synthetic val$me:Lorg/apache/cordova/facebook/ConnectPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iput-object p2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->val$me:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->val$me:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v0}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$100(Lorg/apache/cordova/facebook/ConnectPlugin;)Lcom/facebook/android/Facebook;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v1, v1, Lorg/apache/cordova/facebook/ConnectPlugin;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->val$me:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-static {v2}, Lorg/apache/cordova/facebook/ConnectPlugin;->access$000(Lorg/apache/cordova/facebook/ConnectPlugin;)[Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;

    iget-object v4, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->this$0:Lorg/apache/cordova/facebook/ConnectPlugin;

    iget-object v5, p0, Lorg/apache/cordova/facebook/ConnectPlugin$1;->val$me:Lorg/apache/cordova/facebook/ConnectPlugin;

    invoke-direct {v3, v4, v5}, Lorg/apache/cordova/facebook/ConnectPlugin$AuthorizeListener;-><init>(Lorg/apache/cordova/facebook/ConnectPlugin;Lorg/apache/cordova/facebook/ConnectPlugin;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/android/Facebook;->authorize(Landroid/app/Activity;[Ljava/lang/String;Lcom/facebook/android/Facebook$DialogListener;)V

    .line 105
    return-void
.end method
