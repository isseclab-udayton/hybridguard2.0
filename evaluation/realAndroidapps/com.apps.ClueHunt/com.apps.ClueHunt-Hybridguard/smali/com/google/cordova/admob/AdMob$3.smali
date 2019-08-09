.class Lcom/google/cordova/admob/AdMob$3;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->executeHideBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/cordova/admob/AdMob;

.field private final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/google/cordova/admob/AdMob;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$3;->this$0:Lcom/google/cordova/admob/AdMob;

    iput-object p2, p0, Lcom/google/cordova/admob/AdMob$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$3;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v0}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/AdView;->setVisibility(I)V

    .line 337
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$3;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/cordova/admob/AdMob;->access$13(Lcom/google/cordova/admob/AdMob;Z)V

    .line 339
    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/cordova/admob/AdMob$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 340
    :cond_0
    return-void
.end method
