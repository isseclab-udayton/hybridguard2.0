.class Lorg/apache/cordova/file/FileUtils$9;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/file/FileUtils;

    .prologue
    .line 347
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$9;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/json/JSONArray;)V
    .locals 10
    .param p1, "args"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .prologue
    .line 349
    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 350
    .local v1, "fname":Ljava/lang/String;
    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "data":Ljava/lang/String;
    const/4 v6, 0x2

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v5

    .line 352
    .local v5, "offset":I
    const/4 v6, 0x3

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 356
    .local v4, "isBinary":Ljava/lang/Boolean;
    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v6, v6, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    .line 357
    invoke-static {v6}, Lorg/apache/cordova/file/FileUtils;->access$000(Lorg/apache/cordova/file/FileUtils;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 358
    :cond_0
    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v6, v1, v0, v5, v7}, Lorg/apache/cordova/file/FileUtils;->write(Ljava/lang/String;Ljava/lang/String;IZ)J

    move-result-wide v2

    .line 359
    .local v2, "fileSize":J
    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v7, Lorg/apache/cordova/PluginResult;

    sget-object v8, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    long-to-float v9, v2

    invoke-direct {v7, v8, v9}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;F)V

    invoke-virtual {v6, v7}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 365
    .end local v2    # "fileSize":J
    :goto_0
    return-void

    .line 362
    :cond_1
    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$9;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v6}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;)V

    goto :goto_0
.end method
