.class final Lcom/google/zxing/client/android/wifi/Killer;
.super Ljava/lang/Object;
.source "Killer.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final DELAY_MS:J = 0xbb8L


# instance fields
.field private final parent:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "parent"    # Landroid/app/Activity;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/client/android/wifi/Killer;->parent:Landroid/app/Activity;

    .line 44
    return-void
.end method


# virtual methods
.method launchIntent(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 47
    if-eqz p1, :cond_0

    .line 48
    const/high16 v2, 0x80000

    invoke-virtual {p1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 50
    :try_start_0
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/Killer;->parent:Landroid/app/Activity;

    invoke-virtual {v2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 51
    :catch_0
    move-exception v1

    .line 52
    .local v1, "e":Landroid/content/ActivityNotFoundException;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/Killer;->parent:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 53
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget v2, Lcom/google/zxing/client/android/R$string;->app_name:I

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 54
    sget v2, Lcom/google/zxing/client/android/R$string;->msg_intent_failed:I

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 55
    sget v2, Lcom/google/zxing/client/android/R$string;->button_ok:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 56
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public run()V
    .locals 5

    .prologue
    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 63
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 64
    .local v1, "t":Ljava/util/Timer;
    new-instance v2, Lcom/google/zxing/client/android/wifi/Killer$1;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/wifi/Killer$1;-><init>(Lcom/google/zxing/client/android/wifi/Killer;Landroid/os/Handler;)V

    .line 76
    const-wide/16 v3, 0xbb8

    .line 64
    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 77
    return-void
.end method
