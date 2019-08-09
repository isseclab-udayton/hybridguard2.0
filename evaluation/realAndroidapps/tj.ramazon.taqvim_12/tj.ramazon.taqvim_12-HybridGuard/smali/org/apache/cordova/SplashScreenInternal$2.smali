.class Lorg/apache/cordova/SplashScreenInternal$2;
.super Ljava/lang/Object;
.source "SplashScreenInternal.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenInternal;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/SplashScreenInternal;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$2;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal$2;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v0, v0, Lorg/apache/cordova/SplashScreenInternal;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "splashscreen"

    const-string v2, "show"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    return-void
.end method
