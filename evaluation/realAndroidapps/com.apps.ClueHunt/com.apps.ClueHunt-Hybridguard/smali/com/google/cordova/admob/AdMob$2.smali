.class Lcom/google/cordova/admob/AdMob$2;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/cordova/admob/AdMob;->executeRemoveBanner(Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/PluginResult;
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
    iput-object p1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    iput-object p2, p0, Lcom/google/cordova/admob/AdMob$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 284
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 285
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 286
    .local v0, "parentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 287
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 289
    :cond_0
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1}, Lcom/google/cordova/admob/AdMob;->access$7(Lcom/google/cordova/admob/AdMob;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdView;->destroy()V

    .line 290
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/google/cordova/admob/AdMob;->access$8(Lcom/google/cordova/admob/AdMob;Lcom/google/android/gms/ads/AdView;)V

    .line 292
    .end local v0    # "parentView":Landroid/view/ViewGroup;
    :cond_1
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1, v3}, Lcom/google/cordova/admob/AdMob;->access$12(Lcom/google/cordova/admob/AdMob;Z)V

    .line 293
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->this$0:Lcom/google/cordova/admob/AdMob;

    invoke-static {v1, v3}, Lcom/google/cordova/admob/AdMob;->access$13(Lcom/google/cordova/admob/AdMob;Z)V

    .line 294
    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/cordova/admob/AdMob$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 295
    :cond_2
    return-void
.end method
