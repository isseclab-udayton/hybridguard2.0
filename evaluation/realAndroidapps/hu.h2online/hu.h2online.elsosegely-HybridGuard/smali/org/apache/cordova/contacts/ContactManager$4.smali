.class Lorg/apache/cordova/contacts/ContactManager$4;
.super Ljava/lang/Object;
.source "ContactManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/contacts/ContactManager;->pickContactAsync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/contacts/ContactManager;

.field final synthetic val$plugin:Lorg/apache/cordova/CordovaPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/contacts/ContactManager;Lorg/apache/cordova/CordovaPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/contacts/ContactManager;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactManager$4;->this$0:Lorg/apache/cordova/contacts/ContactManager;

    iput-object p2, p0, Lorg/apache/cordova/contacts/ContactManager$4;->val$plugin:Lorg/apache/cordova/CordovaPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 222
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 223
    .local v0, "contactPickerIntent":Landroid/content/Intent;
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager$4;->val$plugin:Lorg/apache/cordova/CordovaPlugin;

    iget-object v1, v1, Lorg/apache/cordova/CordovaPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget-object v2, p0, Lorg/apache/cordova/contacts/ContactManager$4;->val$plugin:Lorg/apache/cordova/CordovaPlugin;

    const/16 v3, 0x3e8

    invoke-interface {v1, v2, v0, v3}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 224
    return-void
.end method
