.class Lorg/apache/cordova/Notification$3$4;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/Notification$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/Notification$3;

.field final synthetic val$result:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/apache/cordova/Notification$3;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 341
    iput-object p1, p0, Lorg/apache/cordova/Notification$3$4;->this$1:Lorg/apache/cordova/Notification$3;

    iput-object p2, p0, Lorg/apache/cordova/Notification$3$4;->val$result:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 344
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 346
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/Notification$3$4;->val$result:Lorg/json/JSONObject;

    const-string v2, "buttonIndex"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 347
    iget-object v1, p0, Lorg/apache/cordova/Notification$3$4;->val$result:Lorg/json/JSONObject;

    const-string v2, "input1"

    iget-object v3, p0, Lorg/apache/cordova/Notification$3$4;->this$1:Lorg/apache/cordova/Notification$3;

    iget-object v3, v3, Lorg/apache/cordova/Notification$3;->val$promptInput:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    :goto_0
    iget-object v1, p0, Lorg/apache/cordova/Notification$3$4;->this$1:Lorg/apache/cordova/Notification$3;

    iget-object v1, v1, Lorg/apache/cordova/Notification$3;->val$callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v3, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    iget-object v4, p0, Lorg/apache/cordova/Notification$3$4;->val$result:Lorg/json/JSONObject;

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    .line 350
    return-void

    .line 348
    :catch_0
    move-exception v0

    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
