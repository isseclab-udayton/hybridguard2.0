.class Lorg/apache/cordova/plugin/ActivityIndicator$1;
.super Ljava/lang/Object;
.source "ActivityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/plugin/ActivityIndicator;->show(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/plugin/ActivityIndicator;


# direct methods
.method constructor <init>(Lorg/apache/cordova/plugin/ActivityIndicator;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/plugin/ActivityIndicator;

    .prologue
    .line 37
    iput-object p1, p0, Lorg/apache/cordova/plugin/ActivityIndicator$1;->this$0:Lorg/apache/cordova/plugin/ActivityIndicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 39
    iget-object v0, p0, Lorg/apache/cordova/plugin/ActivityIndicator$1;->this$0:Lorg/apache/cordova/plugin/ActivityIndicator;

    iget-object v1, p0, Lorg/apache/cordova/plugin/ActivityIndicator$1;->this$0:Lorg/apache/cordova/plugin/ActivityIndicator;

    iget-object v1, v1, Lorg/apache/cordova/plugin/ActivityIndicator;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/plugin/ActivityIndicator$1;->this$0:Lorg/apache/cordova/plugin/ActivityIndicator;

    invoke-static {v2}, Lorg/apache/cordova/plugin/ActivityIndicator;->access$100(Lorg/apache/cordova/plugin/ActivityIndicator;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v4, v4, v3}, Lorg/apache/cordova/plugin/AndroidProgressHUD;->show(Landroid/content/Context;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Lorg/apache/cordova/plugin/AndroidProgressHUD;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/plugin/ActivityIndicator;->access$002(Lorg/apache/cordova/plugin/ActivityIndicator;Lorg/apache/cordova/plugin/AndroidProgressHUD;)Lorg/apache/cordova/plugin/AndroidProgressHUD;

    .line 40
    return-void
.end method
