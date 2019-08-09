.class Lorg/apache/cordova/contacts/ContactManager$3;
.super Ljava/lang/Object;
.source "ContactManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/contacts/ContactManager;->search(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/contacts/ContactManager;

.field final synthetic val$filter:Lorg/json/JSONArray;

.field final synthetic val$options:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/apache/cordova/contacts/ContactManager;Lorg/json/JSONArray;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/contacts/ContactManager;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactManager$3;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    iput-object p2, p0, Lorg/apache/cordova/contacts/ContactManager$3;->val$filter:Lorg/json/JSONArray;

    iput-object p3, p0, Lorg/apache/cordova/contacts/ContactManager$3;->val$options:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 208
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager$3;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    invoke-static {v1}, Lorg/apache/cordova/contacts/ContactManager;->access$000(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/contacts/ContactAccessor;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/contacts/ContactManager$3;->val$filter:Lorg/json/JSONArray;

    iget-object v3, p0, Lorg/apache/cordova/contacts/ContactManager$3;->val$options:Lorg/json/JSONObject;

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/contacts/ContactAccessor;->search(Lorg/json/JSONArray;Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v0

    .line 209
    .local v0, "res":Lorg/json/JSONArray;
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager$3;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    invoke-static {v1}, Lorg/apache/cordova/contacts/ContactManager;->access$100(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 210
    return-void
.end method
