.class Lorg/apache/cordova/CordovaWebViewClient$1;
.super Ljava/lang/Object;
.source "CordovaWebViewClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CordovaWebViewClient;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebViewClient;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewClient$1;->this$0:Lorg/apache/cordova/CordovaWebViewClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 229
    const-wide/16 v0, 0x7d0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 230
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient$1;->this$0:Lorg/apache/cordova/CordovaWebViewClient;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewClient;->ctx:Lorg/apache/cordova/DroidGap;

    new-instance v1, Lorg/apache/cordova/CordovaWebViewClient$1$1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/CordovaWebViewClient$1$1;-><init>(Lorg/apache/cordova/CordovaWebViewClient$1;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    :goto_0
    return-void

    .line 239
    :catch_0
    move-exception v0

    goto :goto_0
.end method
