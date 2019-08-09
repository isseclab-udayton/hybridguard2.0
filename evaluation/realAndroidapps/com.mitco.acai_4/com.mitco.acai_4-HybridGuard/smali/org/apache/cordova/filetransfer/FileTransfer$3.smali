.class Lorg/apache/cordova/filetransfer/FileTransfer$3;
.super Ljava/lang/Object;
.source "FileTransfer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/filetransfer/FileTransfer;->upload(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

.field private final synthetic val$chunkedMode:Z

.field private final synthetic val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

.field private final synthetic val$fileKey:Ljava/lang/String;

.field private final synthetic val$fileName:Ljava/lang/String;

.field private final synthetic val$headers:Lorg/json/JSONObject;

.field private final synthetic val$httpMethod:Ljava/lang/String;

.field private final synthetic val$mimeType:Ljava/lang/String;

.field private final synthetic val$objectId:Ljava/lang/String;

.field private final synthetic val$params:Lorg/json/JSONObject;

.field private final synthetic val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

.field private final synthetic val$source:Ljava/lang/String;

.field private final synthetic val$sourceUri:Landroid/net/Uri;

.field private final synthetic val$target:Ljava/lang/String;

.field private final synthetic val$targetUri:Landroid/net/Uri;

.field private final synthetic val$trustEveryone:Z

.field private final synthetic val$useHttps:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/filetransfer/FileTransfer;Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;Ljava/lang/String;ZZLorg/apache/cordova/CordovaResourceApi;Landroid/net/Uri;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ZLjava/lang/String;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    iput-object p2, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    iput-object p3, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    iput-boolean p4, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    iput-boolean p5, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    iput-object p6, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    iput-object p7, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$targetUri:Landroid/net/Uri;

    iput-object p8, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$httpMethod:Ljava/lang/String;

    iput-object p9, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$headers:Lorg/json/JSONObject;

    iput-object p10, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$target:Ljava/lang/String;

    iput-object p11, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$params:Lorg/json/JSONObject;

    iput-object p12, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$fileKey:Ljava/lang/String;

    iput-object p13, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$fileName:Ljava/lang/String;

    iput-object p14, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$mimeType:Ljava/lang/String;

    move-object/from16 v0, p15

    iput-object v0, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$sourceUri:Landroid/net/Uri;

    move/from16 v0, p16

    iput-boolean v0, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$chunkedMode:Z

    move-object/from16 v0, p17

    iput-object v0, p0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$source:Ljava/lang/String;

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 42

    .prologue
    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v37, v0

    if-eqz v37, :cond_1

    .line 572
    :cond_0
    :goto_0
    return-void

    .line 332
    :cond_1
    const/4 v10, 0x0

    .line 333
    .local v10, "conn":Ljava/net/HttpURLConnection;
    const/16 v20, 0x0

    .line 334
    .local v20, "oldHostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/16 v21, 0x0

    .line 335
    .local v21, "oldSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/16 v35, 0x0

    .line 336
    .local v35, "totalBytes":I
    const/4 v14, -0x1

    .line 339
    .local v14, "fixedLength":I
    :try_start_0
    new-instance v30, Lorg/apache/cordova/filetransfer/FileUploadResult;

    invoke-direct/range {v30 .. v30}, Lorg/apache/cordova/filetransfer/FileUploadResult;-><init>()V

    .line 340
    .local v30, "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    new-instance v23, Lorg/apache/cordova/filetransfer/FileProgressResult;

    invoke-direct/range {v23 .. v23}, Lorg/apache/cordova/filetransfer/FileProgressResult;-><init>()V

    .line 344
    .local v23, "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$targetUri:Landroid/net/Uri;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/CordovaResourceApi;->createHttpConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;

    move-result-object v10

    .line 345
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_2

    .line 347
    move-object v0, v10

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v15, v0

    .line 348
    .local v15, "https":Ljavax/net/ssl/HttpsURLConnection;
    invoke-static {v15}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$1(Ljavax/net/ssl/HttpsURLConnection;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v21

    .line 350
    invoke-virtual {v15}, Ljavax/net/ssl/HttpsURLConnection;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v20

    .line 352
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$2()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 356
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_2
    const/16 v37, 0x1

    move/from16 v0, v37

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 359
    const/16 v37, 0x1

    move/from16 v0, v37

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 362
    const/16 v37, 0x0

    move/from16 v0, v37

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 365
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$httpMethod:Ljava/lang/String;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 368
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    if-eqz v37, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    const-string v38, "Content-Type"

    invoke-virtual/range {v37 .. v38}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v37

    if-eqz v37, :cond_a

    const/16 v19, 0x0

    .line 369
    .local v19, "multipartFormUpload":Z
    :goto_1
    if-eqz v19, :cond_3

    .line 370
    const-string v37, "Content-Type"

    const-string v38, "multipart/form-data; boundary=+++++"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->this$0:Lorg/apache/cordova/filetransfer/FileTransfer;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$target:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-static/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$3(Lorg/apache/cordova/filetransfer/FileTransfer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 376
    .local v11, "cookie":Ljava/lang/String;
    if-eqz v11, :cond_4

    .line 377
    const-string v37, "Cookie"

    move-object/from16 v0, v37

    invoke-virtual {v10, v0, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    if-eqz v37, :cond_5

    .line 382
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$headers:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-static {v10, v0}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$4(Ljava/net/URLConnection;Lorg/json/JSONObject;)V

    .line 389
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 391
    .local v4, "beforeData":Ljava/lang/StringBuilder;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$params:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_6
    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    move-result v37

    if-nez v37, :cond_b

    .line 406
    .end local v17    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_3
    :try_start_2
    const-string v37, "--"

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "+++++"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    const-string v37, "Content-Disposition: form-data; name=\""

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$fileKey:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\";"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    const-string v37, " filename=\""

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$fileName:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x22

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    const-string v37, "Content-Type: "

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$mimeType:Ljava/lang/String;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    const-string v38, "UTF-8"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 411
    .local v5, "beforeDataBytes":[B
    const-string v37, "\r\n--+++++--\r\n"

    const-string v38, "UTF-8"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v34

    .line 415
    .local v34, "tailParamsBytes":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$sourceUri:Landroid/net/Uri;

    move-object/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v27

    .line 417
    .local v27, "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    array-length v0, v5

    move/from16 v37, v0

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v38, v0

    add-int v32, v37, v38

    .line 418
    .local v32, "stringLength":I
    move-object/from16 v0, v27

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v38, v0

    const-wide/16 v40, 0x0

    cmp-long v37, v38, v40

    if-ltz v37, :cond_8

    .line 419
    move-object/from16 v0, v27

    iget-wide v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    move-wide/from16 v38, v0

    move-wide/from16 v0, v38

    long-to-int v14, v0

    .line 420
    if-eqz v19, :cond_7

    .line 421
    add-int v14, v14, v32

    .line 422
    :cond_7
    const/16 v37, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLengthComputable(Z)V

    .line 423
    int-to-long v0, v14

    move-wide/from16 v38, v0

    move-object/from16 v0, v23

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setTotal(J)V

    .line 425
    :cond_8
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "Content Length: "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$chunkedMode:Z

    move/from16 v37, v0

    if-eqz v37, :cond_c

    sget v37, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v38, 0x8

    move/from16 v0, v37

    move/from16 v1, v38

    if-lt v0, v1, :cond_9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_c

    :cond_9
    const/16 v36, 0x1

    .line 430
    .local v36, "useChunkedMode":Z
    :goto_4
    if-nez v36, :cond_d

    const/16 v37, -0x1

    move/from16 v0, v37

    if-eq v14, v0, :cond_d

    const/16 v36, 0x0

    .line 432
    :goto_5
    if-eqz v36, :cond_e

    .line 433
    const/16 v37, 0x4000

    move/from16 v0, v37

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 436
    const-string v37, "Transfer-Encoding"

    const-string v38, "chunked"

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    :goto_6
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 443
    const/16 v31, 0x0

    .line 445
    .local v31, "sendStream":Ljava/io/OutputStream;
    :try_start_3
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v31

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 447
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v37, v0

    if-eqz v37, :cond_f

    .line 448
    monitor-exit v38
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 494
    :try_start_5
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    invoke-static/range {v37 .. v37}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 495
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_6
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 368
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v19    # "multipartFormUpload":Z
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    :cond_a
    const/16 v19, 0x1

    goto/16 :goto_1

    .line 392
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v17    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v19    # "multipartFormUpload":Z
    :cond_b
    :try_start_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 393
    .local v18, "key":Ljava/lang/Object;
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v37

    const-string v38, "headers"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-nez v37, :cond_6

    .line 395
    const-string v37, "--"

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "+++++"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    const-string v37, "Content-Disposition: form-data; name=\""

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const/16 v38, 0x22

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 397
    const-string v37, "\r\n"

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "\r\n"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$params:Lorg/json/JSONObject;

    move-object/from16 v37, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    const-string v37, "\r\n"

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto/16 :goto_2

    .line 402
    .end local v17    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v18    # "key":Ljava/lang/Object;
    :catch_0
    move-exception v12

    .line 403
    .local v12, "e":Lorg/json/JSONException;
    :try_start_8
    const-string v37, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    goto/16 :goto_3

    .line 540
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v12    # "e":Lorg/json/JSONException;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    :catch_1
    move-exception v12

    .line 541
    .local v12, "e":Ljava/io/FileNotFoundException;
    :try_start_9
    sget v37, Lorg/apache/cordova/filetransfer/FileTransfer;->FILE_NOT_FOUND_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$source:Ljava/lang/String;

    move-object/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$target:Ljava/lang/String;

    move-object/from16 v39, v0

    move/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v39

    invoke-static {v0, v1, v2, v10, v12}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$7(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 542
    .local v13, "error":Lorg/json/JSONObject;
    const-string v37, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 543
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    new-instance v38, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_a
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_b

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 429
    .end local v12    # "e":Ljava/io/FileNotFoundException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    :cond_c
    const/16 v36, 0x0

    goto/16 :goto_4

    .line 430
    .restart local v36    # "useChunkedMode":Z
    :cond_d
    const/16 v36, 0x1

    goto/16 :goto_5

    .line 438
    :cond_e
    :try_start_b
    invoke-virtual {v10, v14}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_b
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto/16 :goto_6

    .line 544
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    :catch_2
    move-exception v12

    .line 545
    .local v12, "e":Ljava/io/IOException;
    :try_start_c
    sget v37, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$source:Ljava/lang/String;

    move-object/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$target:Ljava/lang/String;

    move-object/from16 v39, v0

    move/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v39

    invoke-static {v0, v1, v2, v10, v12}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$7(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 546
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v37, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 547
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "Failed after uploading "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, " of "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, " bytes."

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    new-instance v38, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_d
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_c

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 558
    .end local v12    # "e":Ljava/io/IOException;
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    .restart local v36    # "useChunkedMode":Z
    :catchall_0
    move-exception v37

    :try_start_e
    monitor-exit v38
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    throw v37

    .line 450
    :cond_f
    :try_start_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iput-object v10, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 446
    monitor-exit v38
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 453
    if-eqz v19, :cond_10

    .line 455
    :try_start_10
    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/io/OutputStream;->write([B)V

    .line 456
    array-length v0, v5

    move/from16 v37, v0

    add-int v35, v35, v37

    .line 460
    :cond_10
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/io/InputStream;->available()I

    move-result v8

    .line 461
    .local v8, "bytesAvailable":I
    const/16 v37, 0x4000

    move/from16 v0, v37

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 462
    .local v7, "bufferSize":I
    new-array v6, v7, [B

    .line 465
    .local v6, "buffer":[B
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v6, v1, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    .line 467
    .local v9, "bytesRead":I
    const-wide/16 v24, 0x0

    .line 468
    .local v24, "prevBytesRead":J
    :goto_7
    if-gtz v9, :cond_12

    .line 487
    if-eqz v19, :cond_11

    .line 489
    move-object/from16 v0, v31

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 490
    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v37, v0

    add-int v35, v35, v37

    .line 492
    :cond_11
    invoke-virtual/range {v31 .. v31}, Ljava/io/OutputStream;->flush()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 494
    :try_start_11
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    invoke-static/range {v37 .. v37}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 495
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_11
    .catch Ljava/io/FileNotFoundException; {:try_start_11 .. :try_end_11} :catch_1
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_2
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_4
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 498
    :try_start_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    const/16 v39, 0x0

    move-object/from16 v0, v39

    move-object/from16 v1, v37

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 497
    monitor-exit v38
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 500
    :try_start_13
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "Sent "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, " of "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v28

    .line 505
    .local v28, "responseCode":I
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "response code: "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "response headers: "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v39

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_13} :catch_1
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_2
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_4
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 507
    const/16 v16, 0x0

    .line 509
    .local v16, "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    :try_start_14
    invoke-static {v10}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$6(Ljava/net/URLConnection;)Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;

    move-result-object v16

    .line 510
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    .line 511
    :try_start_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->aborted:Z

    move/from16 v37, v0

    if-eqz v37, :cond_15

    .line 512
    monitor-exit v38
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    .line 526
    :try_start_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_16
    .catch Ljava/io/FileNotFoundException; {:try_start_16 .. :try_end_16} :catch_1
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_2
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_4
    .catchall {:try_start_16 .. :try_end_16} :catchall_5

    .line 527
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    const/16 v39, 0x0

    move-object/from16 v0, v39

    move-object/from16 v1, v37

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 526
    monitor-exit v38
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_4

    .line 529
    :try_start_18
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V
    :try_end_18
    .catch Ljava/io/FileNotFoundException; {:try_start_18 .. :try_end_18} :catch_1
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_2
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_4
    .catchall {:try_start_18 .. :try_end_18} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_19
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 446
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v24    # "prevBytesRead":J
    .end local v28    # "responseCode":I
    :catchall_1
    move-exception v37

    :try_start_1a
    monitor-exit v38
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1

    :try_start_1b
    throw v37
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    .line 493
    :catchall_2
    move-exception v37

    .line 494
    :try_start_1c
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v38, v0

    invoke-static/range {v38 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 495
    invoke-static/range {v31 .. v31}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 496
    throw v37
    :try_end_1c
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_1c} :catch_1
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_4
    .catchall {:try_start_1c .. :try_end_1c} :catchall_5

    .line 549
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    :catch_3
    move-exception v12

    .line 550
    .local v12, "e":Lorg/json/JSONException;
    :try_start_1d
    const-string v37, "FileTransfer"

    invoke-virtual {v12}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-static {v0, v1, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    new-instance v38, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v38 .. v39}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_1e
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_d

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 469
    .end local v12    # "e":Lorg/json/JSONException;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    .restart local v36    # "useChunkedMode":Z
    :cond_12
    add-int v35, v35, v9

    .line 470
    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v38, v0

    :try_start_1f
    move-object/from16 v0, v30

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setBytesSent(J)V

    .line 471
    const/16 v37, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v37

    invoke-virtual {v0, v6, v1, v9}, Ljava/io/OutputStream;->write([BII)V

    .line 472
    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v38, v0

    const-wide/32 v40, 0x19000

    add-long v40, v40, v24

    cmp-long v37, v38, v40

    if-lez v37, :cond_13

    .line 473
    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v24, v0

    .line 474
    const-string v37, "FileTransfer"

    new-instance v38, Ljava/lang/StringBuilder;

    const-string v39, "Uploaded "

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, " of "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, v38

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, " bytes"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    :cond_13
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/io/InputStream;->available()I

    move-result v8

    .line 477
    const/16 v37, 0x4000

    move/from16 v0, v37

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 478
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, v37

    move/from16 v1, v38

    invoke-virtual {v0, v6, v1, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    .line 481
    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v38, v0

    move-object/from16 v0, v23

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/filetransfer/FileProgressResult;->setLoaded(J)V

    .line 482
    new-instance v26, Lorg/apache/cordova/PluginResult;

    sget-object v37, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v23 .. v23}, Lorg/apache/cordova/filetransfer/FileProgressResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v38

    move-object/from16 v0, v26

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 483
    .local v26, "progressResult":Lorg/apache/cordova/PluginResult;
    const/16 v37, 0x1

    move-object/from16 v0, v26

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_2

    goto/16 :goto_7

    .line 497
    .end local v26    # "progressResult":Lorg/apache/cordova/PluginResult;
    :catchall_3
    move-exception v37

    :try_start_20
    monitor-exit v38
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_3

    :try_start_21
    throw v37
    :try_end_21
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_21} :catch_1
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_21} :catch_2
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_4
    .catchall {:try_start_21 .. :try_end_21} :catchall_5

    .line 552
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    :catch_4
    move-exception v33

    .line 554
    .local v33, "t":Ljava/lang/Throwable;
    :try_start_22
    sget v37, Lorg/apache/cordova/filetransfer/FileTransfer;->CONNECTION_ERR:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$source:Ljava/lang/String;

    move-object/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$target:Ljava/lang/String;

    move-object/from16 v39, v0

    move/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v39

    move-object/from16 v3, v33

    invoke-static {v0, v1, v2, v10, v3}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$7(ILjava/lang/String;Ljava/lang/String;Ljava/net/URLConnection;Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v13

    .line 555
    .restart local v13    # "error":Lorg/json/JSONObject;
    const-string v37, "FileTransfer"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    move-object/from16 v2, v33

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    new-instance v38, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-direct {v0, v1, v13}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_23
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_e

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 526
    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v33    # "t":Ljava/lang/Throwable;
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    .restart local v36    # "useChunkedMode":Z
    :catchall_4
    move-exception v37

    :try_start_24
    monitor-exit v38
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_4

    :try_start_25
    throw v37
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_25 .. :try_end_25} :catch_1
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_25} :catch_2
    .catch Lorg/json/JSONException; {:try_start_25 .. :try_end_25} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_4
    .catchall {:try_start_25 .. :try_end_25} :catchall_5

    .line 557
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v19    # "multipartFormUpload":Z
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v28    # "responseCode":I
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    :catchall_5
    move-exception v37

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_26
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_f

    .line 562
    if-eqz v10, :cond_14

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v38, v0

    if-eqz v38, :cond_14

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v38, v0

    if-eqz v38, :cond_14

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 571
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    :cond_14
    throw v37

    .line 558
    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    .restart local v36    # "useChunkedMode":Z
    :catchall_6
    move-exception v37

    :try_start_27
    monitor-exit v38
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_6

    throw v37

    .line 514
    :cond_15
    :try_start_28
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iput-object v10, v0, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 510
    monitor-exit v38
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_7

    .line 517
    :try_start_29
    new-instance v22, Ljava/io/ByteArrayOutputStream;

    const/16 v37, 0x400

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v38

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->max(II)I

    move-result v37

    move-object/from16 v0, v22

    move/from16 v1, v37

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 518
    .local v22, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v37, 0x400

    move/from16 v0, v37

    new-array v6, v0, [B

    .line 519
    const/4 v9, 0x0

    .line 521
    :goto_8
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;->read([B)I

    move-result v9

    if-gtz v9, :cond_16

    .line 524
    const-string v37, "UTF-8"

    move-object/from16 v0, v22

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_8

    move-result-object v29

    .line 526
    .local v29, "responseString":Ljava/lang/String;
    :try_start_2a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_2a
    .catch Ljava/io/FileNotFoundException; {:try_start_2a .. :try_end_2a} :catch_1
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2a} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_2a} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_4
    .catchall {:try_start_2a .. :try_end_2a} :catchall_5

    .line 527
    :try_start_2b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    const/16 v39, 0x0

    move-object/from16 v0, v39

    move-object/from16 v1, v37

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 526
    monitor-exit v38
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_a

    .line 529
    :try_start_2c
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 532
    const-string v37, "FileTransfer"

    const-string v38, "got response from server"

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    const-string v37, "FileTransfer"

    const/16 v38, 0x0

    const/16 v39, 0x100

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v40

    invoke-static/range {v39 .. v40}, Ljava/lang/Math;->min(II)I

    move-result v39

    move-object/from16 v0, v29

    move/from16 v1, v38

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v38

    invoke-static/range {v37 .. v38}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    move-object/from16 v0, v30

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setResponseCode(I)V

    .line 537
    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/filetransfer/FileUploadResult;->setResponse(Ljava/lang/String;)V

    .line 539
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v37, v0

    new-instance v38, Lorg/apache/cordova/PluginResult;

    sget-object v39, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {v30 .. v30}, Lorg/apache/cordova/filetransfer/FileUploadResult;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v40

    invoke-direct/range {v38 .. v40}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual/range {v37 .. v38}, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_2c
    .catch Ljava/io/FileNotFoundException; {:try_start_2c .. :try_end_2c} :catch_1
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2c} :catch_2
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_2c} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_4
    .catchall {:try_start_2c .. :try_end_2c} :catchall_5

    .line 558
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v38

    monitor-enter v38

    .line 559
    :try_start_2d
    invoke-static {}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$0()Ljava/util/HashMap;

    move-result-object v37

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$objectId:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    monitor-exit v38
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_10

    .line 562
    if-eqz v10, :cond_0

    .line 565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$trustEveryone:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$useHttps:Z

    move/from16 v37, v0

    if-eqz v37, :cond_0

    move-object v15, v10

    .line 566
    check-cast v15, Ljavax/net/ssl/HttpsURLConnection;

    .line 567
    .restart local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 568
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    goto/16 :goto_0

    .line 510
    .end local v15    # "https":Ljavax/net/ssl/HttpsURLConnection;
    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v29    # "responseString":Ljava/lang/String;
    :catchall_7
    move-exception v37

    :try_start_2e
    monitor-exit v38
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_7

    :try_start_2f
    throw v37
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_8

    .line 525
    :catchall_8
    move-exception v37

    .line 526
    :try_start_30
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v38, v0

    monitor-enter v38
    :try_end_30
    .catch Ljava/io/FileNotFoundException; {:try_start_30 .. :try_end_30} :catch_1
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_30} :catch_2
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_30} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_4
    .catchall {:try_start_30 .. :try_end_30} :catchall_5

    .line 527
    :try_start_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/filetransfer/FileTransfer$3;->val$context:Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    move-object/from16 v0, v40

    move-object/from16 v1, v39

    iput-object v0, v1, Lorg/apache/cordova/filetransfer/FileTransfer$RequestContext;->connection:Ljava/net/HttpURLConnection;

    .line 526
    monitor-exit v38
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_9

    .line 529
    :try_start_32
    invoke-static/range {v16 .. v16}, Lorg/apache/cordova/filetransfer/FileTransfer;->access$5(Ljava/io/Closeable;)V

    .line 530
    throw v37
    :try_end_32
    .catch Ljava/io/FileNotFoundException; {:try_start_32 .. :try_end_32} :catch_1
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_32} :catch_2
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_32} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_4
    .catchall {:try_start_32 .. :try_end_32} :catchall_5

    .line 522
    .restart local v22    # "out":Ljava/io/ByteArrayOutputStream;
    :cond_16
    const/16 v37, 0x0

    :try_start_33
    move-object/from16 v0, v22

    move/from16 v1, v37

    invoke-virtual {v0, v6, v1, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_8

    goto/16 :goto_8

    .line 526
    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    :catchall_9
    move-exception v37

    :try_start_34
    monitor-exit v38
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_9

    :try_start_35
    throw v37
    :try_end_35
    .catch Ljava/io/FileNotFoundException; {:try_start_35 .. :try_end_35} :catch_1
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_35} :catch_2
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_35} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_4
    .catchall {:try_start_35 .. :try_end_35} :catchall_5

    .restart local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .restart local v29    # "responseString":Ljava/lang/String;
    :catchall_a
    move-exception v37

    :try_start_36
    monitor-exit v38
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_a

    :try_start_37
    throw v37
    :try_end_37
    .catch Ljava/io/FileNotFoundException; {:try_start_37 .. :try_end_37} :catch_1
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_37} :catch_2
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_37} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_4
    .catchall {:try_start_37 .. :try_end_37} :catchall_5

    .line 558
    .end local v4    # "beforeData":Ljava/lang/StringBuilder;
    .end local v5    # "beforeDataBytes":[B
    .end local v6    # "buffer":[B
    .end local v7    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .end local v19    # "multipartFormUpload":Z
    .end local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .end local v24    # "prevBytesRead":J
    .end local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .end local v28    # "responseCode":I
    .end local v29    # "responseString":Ljava/lang/String;
    .end local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .end local v31    # "sendStream":Ljava/io/OutputStream;
    .end local v32    # "stringLength":I
    .end local v34    # "tailParamsBytes":[B
    .end local v36    # "useChunkedMode":Z
    .local v12, "e":Ljava/io/FileNotFoundException;
    .restart local v13    # "error":Lorg/json/JSONObject;
    :catchall_b
    move-exception v37

    :try_start_38
    monitor-exit v38
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_b

    throw v37

    .local v12, "e":Ljava/io/IOException;
    :catchall_c
    move-exception v37

    :try_start_39
    monitor-exit v38
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_c

    throw v37

    .end local v13    # "error":Lorg/json/JSONObject;
    .local v12, "e":Lorg/json/JSONException;
    :catchall_d
    move-exception v37

    :try_start_3a
    monitor-exit v38
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_d

    throw v37

    .end local v12    # "e":Lorg/json/JSONException;
    .restart local v13    # "error":Lorg/json/JSONObject;
    .restart local v33    # "t":Ljava/lang/Throwable;
    :catchall_e
    move-exception v37

    :try_start_3b
    monitor-exit v38
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_e

    throw v37

    .end local v13    # "error":Lorg/json/JSONObject;
    .end local v33    # "t":Ljava/lang/Throwable;
    :catchall_f
    move-exception v37

    :try_start_3c
    monitor-exit v38
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_f

    throw v37

    .restart local v4    # "beforeData":Ljava/lang/StringBuilder;
    .restart local v5    # "beforeDataBytes":[B
    .restart local v6    # "buffer":[B
    .restart local v7    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v16    # "inStream":Lorg/apache/cordova/filetransfer/FileTransfer$TrackingInputStream;
    .restart local v19    # "multipartFormUpload":Z
    .restart local v22    # "out":Ljava/io/ByteArrayOutputStream;
    .restart local v23    # "progress":Lorg/apache/cordova/filetransfer/FileProgressResult;
    .restart local v24    # "prevBytesRead":J
    .restart local v27    # "readResult":Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .restart local v28    # "responseCode":I
    .restart local v29    # "responseString":Ljava/lang/String;
    .restart local v30    # "result":Lorg/apache/cordova/filetransfer/FileUploadResult;
    .restart local v31    # "sendStream":Ljava/io/OutputStream;
    .restart local v32    # "stringLength":I
    .restart local v34    # "tailParamsBytes":[B
    .restart local v36    # "useChunkedMode":Z
    :catchall_10
    move-exception v37

    :try_start_3d
    monitor-exit v38
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_10

    throw v37
.end method
