.class Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"

# interfaces
.implements Lorg/apache/cordova/NativeToJsMessageQueue$BridgeMode;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/NativeToJsMessageQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallbackBridgeMode"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/NativeToJsMessageQueue;


# direct methods
.method private constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue;Lorg/apache/cordova/NativeToJsMessageQueue$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/cordova/NativeToJsMessageQueue;
    .param p2, "x1"    # Lorg/apache/cordova/NativeToJsMessageQueue$1;

    .prologue
    .line 163
    invoke-direct {p0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;-><init>(Lorg/apache/cordova/NativeToJsMessageQueue;)V

    return-void
.end method


# virtual methods
.method public onNativeToJsMessageAvailable()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-static {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->access$400(Lorg/apache/cordova/NativeToJsMessageQueue;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->callbackServer:Lorg/apache/cordova/CallbackServer;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-static {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->access$400(Lorg/apache/cordova/NativeToJsMessageQueue;)Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->callbackServer:Lorg/apache/cordova/CallbackServer;

    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$CallbackBridgeMode;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackServer;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V

    .line 168
    :cond_0
    return-void
.end method
