.class final Lcom/google/zxing/client/android/history/HistoryClickListener;
.super Ljava/lang/Object;
.source "HistoryClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final activity:Lcom/google/zxing/client/android/CaptureActivity;

.field private final historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/Result;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/zxing/client/android/history/HistoryManager;Lcom/google/zxing/client/android/CaptureActivity;Ljava/util/List;)V
    .locals 0
    .param p1, "historyManager"    # Lcom/google/zxing/client/android/history/HistoryManager;
    .param p2, "activity"    # Lcom/google/zxing/client/android/CaptureActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/client/android/history/HistoryManager;",
            "Lcom/google/zxing/client/android/CaptureActivity;",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/Result;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p3, "items":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    .line 45
    iput-object p2, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    .line 46
    iput-object p3, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->items:Ljava/util/List;

    .line 47
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 50
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->items:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ne p2, v7, :cond_1

    .line 52
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v7}, Lcom/google/zxing/client/android/history/HistoryManager;->buildHistory()Ljava/lang/CharSequence;

    move-result-object v1

    .line 53
    .local v1, "history":Ljava/lang/CharSequence;
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/zxing/client/android/history/HistoryManager;->saveHistory(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 54
    .local v2, "historyFile":Landroid/net/Uri;
    if-nez v2, :cond_0

    .line 55
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget v7, Lcom/google/zxing/client/android/R$string;->msg_unmount_usb:I

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 57
    sget v7, Lcom/google/zxing/client/android/R$string;->button_ok:I

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 58
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 78
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "history":Ljava/lang/CharSequence;
    .end local v2    # "historyFile":Landroid/net/Uri;
    :goto_0
    return-void

    .line 61
    .restart local v1    # "history":Ljava/lang/CharSequence;
    .restart local v2    # "historyFile":Landroid/net/Uri;
    :cond_0
    new-instance v3, Landroid/content/Intent;

    const-string v7, "android.intent.action.SEND"

    const-string v8, "mailto:"

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v3, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 62
    .local v3, "intent":Landroid/content/Intent;
    const/high16 v7, 0x80000

    invoke-virtual {v3, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 63
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v7}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/google/zxing/client/android/R$string;->history_email_title:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 64
    .local v6, "subject":Ljava/lang/String;
    const-string v7, "android.intent.extra.SUBJECT"

    invoke-virtual {v3, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    const-string v7, "android.intent.extra.TEXT"

    invoke-virtual {v3, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    const-string v7, "android.intent.extra.STREAM"

    invoke-virtual {v3, v7, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 67
    const-string v7, "text/csv"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v7, v3}, Lcom/google/zxing/client/android/CaptureActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 69
    .end local v1    # "history":Ljava/lang/CharSequence;
    .end local v2    # "historyFile":Landroid/net/Uri;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v6    # "subject":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->items:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    if-ne p2, v7, :cond_2

    .line 71
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->historyManager:Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v7}, Lcom/google/zxing/client/android/history/HistoryManager;->clearHistory()V

    goto :goto_0

    .line 74
    :cond_2
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->items:Ljava/util/List;

    invoke-interface {v7, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/Result;

    .line 75
    .local v5, "result":Lcom/google/zxing/Result;
    iget-object v7, p0, Lcom/google/zxing/client/android/history/HistoryClickListener;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v7}, Lcom/google/zxing/client/android/CaptureActivity;->getHandler()Landroid/os/Handler;

    move-result-object v7

    sget v8, Lcom/google/zxing/client/android/R$id;->decode_succeeded:I

    invoke-static {v7, v8, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 76
    .local v4, "message":Landroid/os/Message;
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method
