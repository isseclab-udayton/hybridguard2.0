.class Lorg/apache/cordova/FileTransfer$4;
.super Ljava/lang/Object;
.source "FileTransfer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/FileTransfer;->download(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/FileTransfer;

.field final synthetic val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

.field final synthetic val$headers:Lorg/json/JSONObject;

.field final synthetic val$objectId:Ljava/lang/String;

.field final synthetic val$source:Ljava/lang/String;

.field final synthetic val$target:Ljava/lang/String;

.field final synthetic val$trustEveryone:Z

.field final synthetic val$url:Ljava/net/URL;

.field final synthetic val$useHttps:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/FileTransfer;Lorg/apache/cordova/FileTransfer$RequestContext;Ljava/lang/String;ZZLjava/net/URL;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 698
    iput-object p1, p0, Lorg/apache/cordova/FileTransfer$4;->this$0:Lorg/apache/cordova/FileTransfer;

    iput-object p2, p0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    iput-object p3, p0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    iput-boolean p4, p0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    iput-boolean p5, p0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    iput-object p6, p0, Lorg/apache/cordova/FileTransfer$4;->val$url:Ljava/net/URL;

    iput-object p7, p0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    iput-object p8, p0, Lorg/apache/cordova/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    iput-object p9, p0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 26

    .prologue
    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$RequestContext;->aborted:Z

    move/from16 v21, v0

    if-eqz v21, :cond_0

    .line 846
    :goto_0
    return-void

    .line 703
    :cond_0
    const/4 v5, 0x0

    .line 704
    .local v5, "connection":Ljava/net/URLConnection;
    const/4 v13, 0x0

    .line 705
    .local v13, "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/4 v14, 0x0

    .line 706
    .local v14, "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v9, 0x0

    .line 707
    .local v9, "file":Ljava/io/File;
    const/16 v19, 0x0

    .line 710
    .local v19, "result":Lorg/apache/cordova/api/PluginResult;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->this$0:Lorg/apache/cordova/FileTransfer;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-static/range {v21 .. v22}, Lorg/apache/cordova/FileTransfer;->access$900(Lorg/apache/cordova/FileTransfer;Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    .line 711
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iput-object v9, v0, Lorg/apache/cordova/FileTransfer$RequestContext;->targetFile:Ljava/io/File;

    .line 713
    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->mkdirs()Z

    .line 717
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_a

    .line 719
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-nez v21, :cond_9

    .line 720
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$000()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$url:Ljava/net/URL;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/squareup/okhttp/OkHttpClient;->open(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v21

    move-object/from16 v0, v21

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v5, v0

    .line 741
    :goto_1
    instance-of v0, v5, Ljava/net/HttpURLConnection;

    move/from16 v21, v0

    if-eqz v21, :cond_1

    .line 742
    move-object v0, v5

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object/from16 v21, v0

    const-string v22, "GET"

    invoke-virtual/range {v21 .. v22}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 746
    :cond_1
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 747
    .local v6, "cookie":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 749
    const-string v21, "cookie"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 753
    :cond_2
    const-string v21, "Accept-Encoding"

    const-string v22, "gzip"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v5, v0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v21, v0

    if-eqz v21, :cond_3

    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v5, v0}, Lorg/apache/cordova/FileTransfer;->access$300(Ljava/net/URLConnection;Lorg/json/JSONObject;)V

    .line 760
    :cond_3
    invoke-virtual {v5}, Ljava/net/URLConnection;->connect()V

    .line 762
    const-string v21, "FileTransfer"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Download file:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$url:Ljava/net/URL;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    new-instance v17, Lorg/apache/cordova/FileProgressResult;

    invoke-direct/range {v17 .. v17}, Lorg/apache/cordova/FileProgressResult;-><init>()V

    .line 765
    .local v17, "progress":Lorg/apache/cordova/FileProgressResult;
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v21

    if-eqz v21, :cond_4

    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v21

    const-string v22, "gzip"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 768
    :cond_4
    const/16 v21, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileProgressResult;->setLengthComputable(Z)V

    .line 769
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentLength()I

    move-result v21

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v21, v0

    move-object/from16 v0, v17

    move-wide/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/FileProgressResult;->setTotal(J)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 772
    :cond_5
    const/4 v15, 0x0

    .line 773
    .local v15, "outputStream":Ljava/io/FileOutputStream;
    const/4 v12, 0x0

    .line 776
    .local v12, "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    :try_start_1
    invoke-static {v5}, Lorg/apache/cordova/FileTransfer;->access$600(Ljava/net/URLConnection;)Lorg/apache/cordova/FileTransfer$TrackingInputStream;

    move-result-object v12

    .line 777
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_a

    .line 778
    .end local v15    # "outputStream":Ljava/io/FileOutputStream;
    .local v16, "outputStream":Ljava/io/FileOutputStream;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v22, v0

    monitor-enter v22
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 779
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$RequestContext;->aborted:Z

    move/from16 v21, v0

    if-eqz v21, :cond_b

    .line 780
    monitor-exit v22
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 797
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lorg/apache/cordova/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 798
    invoke-static {v12}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V

    .line 799
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 824
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_5
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    .line 828
    if-eqz v5, :cond_6

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_6

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .local v11, "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_6
    if-nez v19, :cond_7

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_7
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_8

    if-eqz v9, :cond_8

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    .end local v6    # "cookie":Ljava/lang/String;
    .end local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .end local v16    # "outputStream":Ljava/io/FileOutputStream;
    .end local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    :goto_2
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    goto/16 :goto_0

    .line 726
    :cond_9
    :try_start_6
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$000()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$url:Ljava/net/URL;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/squareup/okhttp/OkHttpClient;->open(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v11

    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 727
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-static {v11}, Lorg/apache/cordova/FileTransfer;->access$100(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v14

    .line 729
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v13

    .line 731
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$200()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 732
    move-object v5, v11

    .line 733
    goto/16 :goto_1

    .line 737
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_a
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$000()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$url:Ljava/net/URL;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/squareup/okhttp/OkHttpClient;->open(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-result-object v5

    goto/16 :goto_1

    .line 782
    .restart local v6    # "cookie":Ljava/lang/String;
    .restart local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .restart local v16    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    :cond_b
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iput-object v12, v0, Lorg/apache/cordova/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 783
    monitor-exit v22
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 786
    const/16 v21, 0x4000

    :try_start_8
    move/from16 v0, v21

    new-array v3, v0, [B

    .line 787
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 788
    .local v4, "bytesRead":I
    :goto_3
    invoke-virtual {v12, v3}, Lorg/apache/cordova/FileTransfer$TrackingInputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_e

    .line 789
    const/16 v21, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v21

    invoke-virtual {v0, v3, v1, v4}, Ljava/io/FileOutputStream;->write([BII)V

    .line 791
    invoke-virtual {v12}, Lorg/apache/cordova/FileTransfer$TrackingInputStream;->getTotalRawBytesRead()J

    move-result-wide v21

    move-object/from16 v0, v17

    move-wide/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/FileProgressResult;->setLoaded(J)V

    .line 792
    new-instance v18, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/FileProgressResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 793
    .local v18, "progressResult":Lorg/apache/cordova/api/PluginResult;
    const/16 v21, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 794
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_3

    .line 797
    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v18    # "progressResult":Lorg/apache/cordova/api/PluginResult;
    :catchall_0
    move-exception v21

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v15    # "outputStream":Ljava/io/FileOutputStream;
    :goto_4
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    iput-object v0, v1, Lorg/apache/cordova/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 798
    invoke-static {v12}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V

    .line 799
    invoke-static {v15}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V

    .line 797
    throw v21
    :try_end_9
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 808
    .end local v6    # "cookie":Ljava/lang/String;
    .end local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .end local v15    # "outputStream":Ljava/io/FileOutputStream;
    .end local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    :catch_0
    move-exception v7

    .line 809
    .local v7, "e":Ljava/io/FileNotFoundException;
    :try_start_a
    sget v21, Lorg/apache/cordova/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v23, v0

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 810
    .local v8, "error":Lorg/json/JSONObject;
    const-string v21, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 811
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 824
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .local v20, "result":Lorg/apache/cordova/api/PluginResult;
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_b
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 828
    if-eqz v5, :cond_c

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_c

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_c
    if-nez v20, :cond_1e

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :goto_5
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_d

    if-eqz v9, :cond_d

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 783
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "error":Lorg/json/JSONObject;
    .restart local v6    # "cookie":Ljava/lang/String;
    .restart local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .restart local v16    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    :catchall_1
    move-exception v21

    :try_start_c
    monitor-exit v22
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    :try_start_d
    throw v21
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 797
    .restart local v3    # "buffer":[B
    .restart local v4    # "bytesRead":I
    :cond_e
    :try_start_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lorg/apache/cordova/FileTransfer$RequestContext;->currentInputStream:Ljava/io/InputStream;

    .line 798
    invoke-static {v12}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V

    .line 799
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/FileTransfer;->access$500(Ljava/io/Closeable;)V

    .line 802
    const-string v21, "FileTransfer"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Saved file: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 805
    invoke-static {v9}, Lorg/apache/cordova/FileUtils;->getEntry(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v10

    .line 807
    .local v10, "fileEntry":Lorg/json/JSONObject;
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v10}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_e
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_e} :catch_0
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_1
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 824
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_f
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 828
    if-eqz v5, :cond_f

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_f

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_f
    if-nez v20, :cond_1a

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :goto_6
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_10

    if-eqz v9, :cond_10

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 812
    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v6    # "cookie":Ljava/lang/String;
    .end local v10    # "fileEntry":Lorg/json/JSONObject;
    .end local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .end local v16    # "outputStream":Ljava/io/FileOutputStream;
    .end local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    :catch_1
    move-exception v7

    .line 813
    .local v7, "e":Ljava/io/IOException;
    :try_start_10
    sget v21, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v23, v0

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 814
    .restart local v8    # "error":Lorg/json/JSONObject;
    const-string v21, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 815
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 824
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_11
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 828
    if-eqz v5, :cond_11

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_11

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_11
    if-nez v20, :cond_1d

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :goto_7
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_12

    if-eqz v9, :cond_12

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 816
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "error":Lorg/json/JSONObject;
    :catch_2
    move-exception v7

    .line 817
    .local v7, "e":Lorg/json/JSONException;
    :try_start_12
    const-string v21, "FileTransfer"

    invoke-virtual {v7}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 818
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct/range {v20 .. v21}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 824
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_13
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    .line 828
    if-eqz v5, :cond_13

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_13

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_13

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_13
    if-nez v20, :cond_1c

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :goto_8
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_14

    if-eqz v9, :cond_14

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 819
    .end local v7    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v7

    .line 820
    .local v7, "e":Ljava/lang/Throwable;
    :try_start_14
    sget v21, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v23, v0

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v8

    .line 821
    .restart local v8    # "error":Lorg/json/JSONObject;
    const-string v21, "FileTransfer"

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 822
    new-instance v20, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v8}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    .line 824
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_15
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    .line 828
    if-eqz v5, :cond_15

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v21, v0

    if-eqz v21, :cond_15

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v21, v0

    if-eqz v21, :cond_15

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_15
    if-nez v20, :cond_1b

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    sget-object v21, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v22, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v24, v0

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :goto_9
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v21

    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_16

    if-eqz v9, :cond_16

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 824
    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v8    # "error":Lorg/json/JSONObject;
    :catchall_2
    move-exception v21

    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v22

    monitor-enter v22

    .line 825
    :try_start_16
    invoke-static {}, Lorg/apache/cordova/FileTransfer;->access$800()Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$objectId:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    monitor-exit v22
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    .line 828
    if-eqz v5, :cond_17

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$trustEveryone:Z

    move/from16 v22, v0

    if-eqz v22, :cond_17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$useHttps:Z

    move/from16 v22, v0

    if-eqz v22, :cond_17

    move-object v11, v5

    .line 831
    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    .line 832
    .restart local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v11, v13}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 833
    invoke-virtual {v11, v14}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 837
    .end local v11    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_17
    if-nez v19, :cond_18

    .line 838
    new-instance v19, Lorg/apache/cordova/api/PluginResult;

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    sget-object v22, Lorg/apache/cordova/api/PluginResult$Status;->ERROR:Lorg/apache/cordova/api/PluginResult$Status;

    sget v23, Lorg/apache/cordova/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$source:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$target:Ljava/lang/String;

    move-object/from16 v25, v0

    move/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2, v5}, Lorg/apache/cordova/FileTransfer;->access$700(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;)Lorg/json/JSONObject;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 841
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_18
    invoke-virtual/range {v19 .. v19}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v22

    sget-object v23, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v23

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_19

    if-eqz v9, :cond_19

    .line 842
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 844
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/FileTransfer$4;->val$context:Lorg/apache/cordova/FileTransfer$RequestContext;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/cordova/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    .line 824
    throw v21

    .line 826
    :catchall_3
    move-exception v21

    :try_start_17
    monitor-exit v22
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    throw v21

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .local v7, "e":Ljava/io/FileNotFoundException;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :catchall_4
    move-exception v21

    :try_start_18
    monitor-exit v22
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    throw v21

    .local v7, "e":Ljava/io/IOException;
    :catchall_5
    move-exception v21

    :try_start_19
    monitor-exit v22
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_5

    throw v21

    .end local v8    # "error":Lorg/json/JSONObject;
    .local v7, "e":Lorg/json/JSONException;
    :catchall_6
    move-exception v21

    :try_start_1a
    monitor-exit v22
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_6

    throw v21

    .local v7, "e":Ljava/lang/Throwable;
    .restart local v8    # "error":Lorg/json/JSONObject;
    :catchall_7
    move-exception v21

    :try_start_1b
    monitor-exit v22
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_7

    throw v21

    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v8    # "error":Lorg/json/JSONObject;
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v6    # "cookie":Ljava/lang/String;
    .restart local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .restart local v16    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :catchall_8
    move-exception v21

    :try_start_1c
    monitor-exit v22
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_8

    throw v21

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v3    # "buffer":[B
    .restart local v4    # "bytesRead":I
    .restart local v10    # "fileEntry":Lorg/json/JSONObject;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :catchall_9
    move-exception v21

    :try_start_1d
    monitor-exit v22
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_9

    throw v21

    .line 797
    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v10    # "fileEntry":Lorg/json/JSONObject;
    .end local v16    # "outputStream":Ljava/io/FileOutputStream;
    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v15    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    :catchall_a
    move-exception v21

    goto/16 :goto_4

    .end local v15    # "outputStream":Ljava/io/FileOutputStream;
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v3    # "buffer":[B
    .restart local v4    # "bytesRead":I
    .restart local v10    # "fileEntry":Lorg/json/JSONObject;
    .restart local v16    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1a
    move-object/from16 v19, v20

    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_6

    .end local v3    # "buffer":[B
    .end local v4    # "bytesRead":I
    .end local v6    # "cookie":Ljava/lang/String;
    .end local v10    # "fileEntry":Lorg/json/JSONObject;
    .end local v12    # "inputStream":Lorg/apache/cordova/FileTransfer$TrackingInputStream;
    .end local v16    # "outputStream":Ljava/io/FileOutputStream;
    .end local v17    # "progress":Lorg/apache/cordova/FileProgressResult;
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v7    # "e":Ljava/lang/Throwable;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1b
    move-object/from16 v19, v20

    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_9

    .end local v8    # "error":Lorg/json/JSONObject;
    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .local v7, "e":Lorg/json/JSONException;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1c
    move-object/from16 v19, v20

    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_8

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .local v7, "e":Ljava/io/IOException;
    .restart local v8    # "error":Lorg/json/JSONObject;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1d
    move-object/from16 v19, v20

    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_7

    .end local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    .local v7, "e":Ljava/io/FileNotFoundException;
    .restart local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    :cond_1e
    move-object/from16 v19, v20

    .end local v20    # "result":Lorg/apache/cordova/api/PluginResult;
    .restart local v19    # "result":Lorg/apache/cordova/api/PluginResult;
    goto/16 :goto_5
.end method
