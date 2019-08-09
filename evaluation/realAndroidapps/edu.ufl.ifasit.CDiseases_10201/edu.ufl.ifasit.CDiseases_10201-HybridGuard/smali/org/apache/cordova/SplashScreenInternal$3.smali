.class Lorg/apache/cordova/SplashScreenInternal$3;
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

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/SplashScreenInternal;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenInternal$3;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iput-object p2, p0, Lorg/apache/cordova/SplashScreenInternal$3;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/SplashScreenInternal$3;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenInternal$3;->this$0:Lorg/apache/cordova/SplashScreenInternal;

    iget-object v1, p0, Lorg/apache/cordova/SplashScreenInternal$3;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/SplashScreenInternal$3;->val$message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/SplashScreenInternal;->access$000(Lorg/apache/cordova/SplashScreenInternal;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    return-void
.end method
