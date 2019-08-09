.class Lorg/apache/cordova/CordovaWebView$3;
.super Ljava/lang/Object;
.source "CordovaWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CordovaWebView;

.field final synthetic val$me:Lorg/apache/cordova/CordovaWebView;

.field final synthetic val$timeoutCheck:Ljava/lang/Runnable;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebView;Ljava/lang/Runnable;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 404
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView$3;->this$0:Lorg/apache/cordova/CordovaWebView;

    iput-object p2, p0, Lorg/apache/cordova/CordovaWebView$3;->val$timeoutCheck:Ljava/lang/Runnable;

    iput-object p3, p0, Lorg/apache/cordova/CordovaWebView$3;->val$me:Lorg/apache/cordova/CordovaWebView;

    iput-object p4, p0, Lorg/apache/cordova/CordovaWebView$3;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 406
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView$3;->val$timeoutCheck:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 407
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 408
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView$3;->val$me:Lorg/apache/cordova/CordovaWebView;

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView$3;->val$url:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/apache/cordova/CordovaWebView;->access$100(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 409
    return-void
.end method
