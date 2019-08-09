.class Lorg/apache/cordova/dialogs/Notification$4$3;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/dialogs/Notification$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/dialogs/Notification$4;

.field final synthetic val$promptInput:Landroid/widget/EditText;

.field final synthetic val$result:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/apache/cordova/dialogs/Notification$4;Lorg/json/JSONObject;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/dialogs/Notification$4;

    .prologue
    .line 345
    iput-object p1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->this$1:Lorg/apache/cordova/dialogs/Notification$4;

    iput-object p2, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$result:Lorg/json/JSONObject;

    iput-object p3, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$promptInput:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 347
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 349
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$result:Lorg/json/JSONObject;

    const-string v2, "buttonIndex"

    const/4 v3, 0x3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 350
    iget-object v2, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$result:Lorg/json/JSONObject;

    const-string v3, "input1"

    iget-object v1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$promptInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->this$1:Lorg/apache/cordova/dialogs/Notification$4;

    iget-object v1, v1, Lorg/apache/cordova/dialogs/Notification$4;->val$defaultText:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    :goto_1
    iget-object v1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->this$1:Lorg/apache/cordova/dialogs/Notification$4;

    iget-object v1, v1, Lorg/apache/cordova/dialogs/Notification$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v4, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$result:Lorg/json/JSONObject;

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 355
    return-void

    .line 350
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/cordova/dialogs/Notification$4$3;->val$promptInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_0

    .line 351
    :catch_0
    move-exception v0

    .line 352
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Notification"

    const-string v2, "JSONException on third button."

    invoke-static {v1, v2, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
