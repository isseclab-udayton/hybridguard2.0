.class Lorg/apache/cordova/filetransfer/FileTransfer$5;
.super Ljava/lang/Object;
.source "FileTransfer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/filetransfer/FileTransfer;->abort(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

.field final synthetic val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;


# direct methods
.method constructor <init>(Lorg/apache/cordova/filetransfer/FileTransfer;Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;)V
    .locals 0

    .prologue
    .line 866
    iput-object p1, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    iput-object p2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 868
    iget-object v3, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    monitor-enter v3

    .line 869
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iget-object v1, v2, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->targetFile:Ljava/io/File;

    .line 870
    .local v1, "file":Ljava/io/File;
    if-eqz v1, :cond_0

    .line 871
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 874
    :cond_0
    sget v2, Lorg/apache/cordova/filetransfer/FileTransfer;->ABORTED_ERR:I

    iget-object v4, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iget-object v4, v4, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->source:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iget-object v5, v5, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->target:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v2, v4, v5, v6, v7}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object v0

    .line 875
    .local v0, "error":Lorg/json/JSONObject;
    iget-object v2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v4}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 876
    iget-object v2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    const/4 v4, 0x1

    iput-boolean v4, v2, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    .line 877
    iget-object v2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iget-object v2, v2, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_1

    .line 878
    iget-object v2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$5;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iget-object v2, v2, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 880
    :cond_1
    monitor-exit v3

    .line 881
    return-void

    .line 880
    .end local v0    # "error":Lorg/json/JSONObject;
    .end local v1    # "file":Ljava/io/File;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
