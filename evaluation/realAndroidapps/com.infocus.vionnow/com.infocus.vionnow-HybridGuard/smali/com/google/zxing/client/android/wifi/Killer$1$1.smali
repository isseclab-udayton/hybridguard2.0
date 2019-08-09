.class Lcom/google/zxing/client/android/wifi/Killer$1$1;
.super Ljava/lang/Object;
.source "Killer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/zxing/client/android/wifi/Killer$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/zxing/client/android/wifi/Killer$1;


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/wifi/Killer$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/zxing/client/android/wifi/Killer$1$1;->this$1:Lcom/google/zxing/client/android/wifi/Killer$1;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 72
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/Killer$1$1;->this$1:Lcom/google/zxing/client/android/wifi/Killer$1;

    invoke-static {v0}, Lcom/google/zxing/client/android/wifi/Killer$1;->access$0(Lcom/google/zxing/client/android/wifi/Killer$1;)Lcom/google/zxing/client/android/wifi/Killer;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "http://www.google.com/"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/google/zxing/client/android/wifi/Killer;->launchIntent(Landroid/content/Intent;)V

    .line 73
    return-void
.end method
