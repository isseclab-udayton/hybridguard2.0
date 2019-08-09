.class Lorg/apache/cordova/contacts/ContactManager$1;
.super Ljava/lang/Object;
.source "ContactManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/contacts/ContactManager;->remove(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/contacts/ContactManager;

.field final synthetic val$contactId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/contacts/ContactManager;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/contacts/ContactManager;

    .prologue
    .line 169
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactManager$1;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    iput-object p2, p0, Lorg/apache/cordova/contacts/ContactManager$1;->val$contactId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager$1;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    invoke-static {v0}, Lorg/apache/cordova/contacts/ContactManager;->access$000(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/contacts/ContactAccessor;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager$1;->val$contactId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessor;->remove(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager$1;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    invoke-static {v0}, Lorg/apache/cordova/contacts/ContactManager;->access$100(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 176
    :goto_0
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager$1;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    invoke-static {v0}, Lorg/apache/cordova/contacts/ContactManager;->access$100(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method
