.class public Lcom/plugin/gcm/AlertDialogManager;
.super Ljava/lang/Object;
.source "AlertDialogManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public showAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "status"    # Ljava/lang/Boolean;

    .prologue
    .line 13
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 16
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 19
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 21
    if-eqz p4, :cond_0

    .line 23
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f02001d

    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 26
    :cond_0
    const-string v1, "OK"

    new-instance v2, Lcom/plugin/gcm/AlertDialogManager$1;

    invoke-direct {v2, p0}, Lcom/plugin/gcm/AlertDialogManager$1;-><init>(Lcom/plugin/gcm/AlertDialogManager;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 32
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 33
    return-void

    .line 23
    :cond_1
    const v1, 0x7f020013

    goto :goto_0
.end method
