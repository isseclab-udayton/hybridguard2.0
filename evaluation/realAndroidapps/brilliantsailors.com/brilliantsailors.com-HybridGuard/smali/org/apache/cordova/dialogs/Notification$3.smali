.class Lorg/apache/cordova/dialogs/Notification$3;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/dialogs/Notification;->confirm(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/dialogs/Notification;

.field final synthetic val$buttonLabels:Lorg/json/JSONArray;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$cordova:Lorg/apache/cordova/CordovaInterface;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/dialogs/Notification;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/dialogs/Notification;

    .prologue
    .line 205
    iput-object p1, p0, Lorg/apache/cordova/dialogs/Notification$3;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iput-object p2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    iput-object p3, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$title:Ljava/lang/String;

    iput-object p5, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    iput-object p6, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 207
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iget-object v3, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-static {v2, v3}, Lorg/apache/cordova/dialogs/Notification;->access$000(Lorg/apache/cordova/dialogs/Notification;Lorg/apache/cordova/CordovaInterface;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 208
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 209
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 210
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 213
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 215
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/dialogs/Notification$3$1;

    invoke-direct {v3, p0}, Lorg/apache/cordova/dialogs/Notification$3$1;-><init>(Lorg/apache/cordova/dialogs/Notification$3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-le v2, v4, :cond_1

    .line 230
    :try_start_1
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/dialogs/Notification$3$2;

    invoke-direct {v3, p0}, Lorg/apache/cordova/dialogs/Notification$3$2;-><init>(Lorg/apache/cordova/dialogs/Notification$3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 243
    :cond_1
    :goto_1
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-le v2, v5, :cond_2

    .line 245
    :try_start_2
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/dialogs/Notification$3$3;

    invoke-direct {v3, p0}, Lorg/apache/cordova/dialogs/Notification$3$3;-><init>(Lorg/apache/cordova/dialogs/Notification$3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 256
    :cond_2
    :goto_2
    new-instance v2, Lorg/apache/cordova/dialogs/Notification$3$4;

    invoke-direct {v2, p0}, Lorg/apache/cordova/dialogs/Notification$3$4;-><init>(Lorg/apache/cordova/dialogs/Notification$3;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 264
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$3;->this$0:Lorg/apache/cordova/dialogs/Notification;

    invoke-static {v2, v0}, Lorg/apache/cordova/dialogs/Notification;->access$100(Lorg/apache/cordova/dialogs/Notification;Landroid/app/AlertDialog$Builder;)V

    .line 265
    return-void

    .line 222
    :catch_0
    move-exception v1

    .line 223
    .local v1, "e":Lorg/json/JSONException;
    const-string v2, "Notification"

    const-string v3, "JSONException on first button."

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 237
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 238
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v2, "Notification"

    const-string v3, "JSONException on second button."

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 252
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v1

    .line 253
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v2, "Notification"

    const-string v3, "JSONException on third button."

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method
