.class Lorg/apache/cordova/CordovaWebViewClient$1$1;
.super Ljava/lang/Object;
.source "CordovaWebViewClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebViewClient$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/CordovaWebViewClient$1;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebViewClient$1;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewClient$1$1;->this$1:Lorg/apache/cordova/CordovaWebViewClient$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient$1$1;->this$1:Lorg/apache/cordova/CordovaWebViewClient$1;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewClient$1;->this$0:Lorg/apache/cordova/CordovaWebViewClient;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewClient;->ctx:Lorg/apache/cordova/DroidGap;

    iget-object v0, v0, Lorg/apache/cordova/DroidGap;->appView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 232
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewClient$1$1;->this$1:Lorg/apache/cordova/CordovaWebViewClient$1;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewClient$1;->this$0:Lorg/apache/cordova/CordovaWebViewClient;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewClient;->ctx:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v0}, Lorg/apache/cordova/DroidGap;->spinnerStop()V

    .line 233
    return-void
.end method
