.class public Lcom/arellomobile/android/push/PushHandlerActivity;
.super Landroid/app/Activity;
.source "PushHandlerActivity.java"


# instance fields
.field private mPushManager:Lcom/arellomobile/android/push/PushManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private handlePush()V
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/arellomobile/android/push/PushHandlerActivity;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    invoke-virtual {v0, p0}, Lcom/arellomobile/android/push/PushManager;->onHandlePush(Landroid/app/Activity;)Z

    .line 32
    invoke-virtual {p0}, Lcom/arellomobile/android/push/PushHandlerActivity;->finish()V

    .line 33
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    new-instance v0, Lcom/arellomobile/android/push/PushManager;

    invoke-direct {v0, p0}, Lcom/arellomobile/android/push/PushManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/arellomobile/android/push/PushHandlerActivity;->mPushManager:Lcom/arellomobile/android/push/PushManager;

    .line 26
    invoke-direct {p0}, Lcom/arellomobile/android/push/PushHandlerActivity;->handlePush()V

    .line 27
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 40
    invoke-virtual {p0, p1}, Lcom/arellomobile/android/push/PushHandlerActivity;->setIntent(Landroid/content/Intent;)V

    .line 41
    invoke-direct {p0}, Lcom/arellomobile/android/push/PushHandlerActivity;->handlePush()V

    .line 42
    return-void
.end method
