.class public Lcom/arellomobile/android/push/utils/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    }
.end annotation


# static fields
.field private static final BASE_URL:Ljava/lang/String; = "http://cp.pushwoosh.com/json/1.3/"

.field private static final BASE_URL_SECURE:Ljava/lang/String; = "https://cp.pushwoosh.com/json/1.3/"

.field public static final MAX_TRIES:I = 0x5

.field public static final PUSH_VERSION:Ljava/lang/String; = "1.3"

.field private static final TAG:Ljava/lang/String; = "PushWoosh: NetworkUtils"

.field public static useSSL:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    sput-boolean v0, Lcom/arellomobile/android/push/utils/NetworkUtils;->useSSL:Z

    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    .locals 21
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v14, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v18, 0x1f4

    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v14, v0, v1, v2}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 44
    .local v14, "result":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    const/4 v5, 0x0

    .line 45
    .local v5, "connectionOutput":Ljava/io/OutputStream;
    const/4 v8, 0x0

    .line 48
    .local v8, "inputStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "http://cp.pushwoosh.com/json/1.3/"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 49
    .local v17, "urlString":Ljava/lang/String;
    sget-boolean v18, Lcom/arellomobile/android/push/utils/NetworkUtils;->useSSL:Z

    if-eqz v18, :cond_0

    .line 50
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "https://cp.pushwoosh.com/json/1.3/"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 52
    :cond_0
    new-instance v16, Ljava/net/URL;

    invoke-direct/range {v16 .. v17}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 53
    .local v16, "url":Ljava/net/URL;
    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;

    .line 54
    .local v4, "connection":Ljava/net/HttpURLConnection;
    const-string v18, "POST"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 55
    const-string v18, "Content-Type"

    const-string v19, "application/json; charset=utf-8"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v4, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 60
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 62
    .local v7, "innerRequestJson":Lorg/json/JSONObject;
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_3

    .line 67
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 68
    .local v13, "requestJson":Lorg/json/JSONObject;
    const-string v18, "request"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    const-string v18, "Content-Length"

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v4, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    .line 73
    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->getBytes()[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/io/OutputStream;->write([B)V

    .line 74
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 75
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 77
    new-instance v9, Ljava/io/BufferedInputStream;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .local v9, "inputStream":Ljava/io/InputStream;
    :try_start_1
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 82
    .local v6, "dataCache":Ljava/io/ByteArrayOutputStream;
    const/16 v18, 0x400

    move/from16 v0, v18

    new-array v3, v0, [B

    .line 84
    .local v3, "buff":[B
    :goto_1
    invoke-virtual {v9, v3}, Ljava/io/InputStream;->read([B)I

    move-result v12

    .local v12, "len":I
    if-gez v12, :cond_6

    .line 90
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 92
    new-instance v18, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 93
    .local v10, "jsonString":Ljava/lang/String;
    const-string v18, "PushWoosh: NetworkUtils"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "PushWooshResult: "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 97
    .local v15, "resultJSON":Lorg/json/JSONObject;
    invoke-virtual {v14, v15}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->setData(Lorg/json/JSONObject;)V

    .line 98
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->setCode(I)V

    .line 99
    const-string v18, "status_code"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->setPushwooshCode(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 103
    if-eqz v9, :cond_1

    .line 105
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 107
    :cond_1
    if-eqz v5, :cond_2

    .line 109
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 113
    :cond_2
    return-object v14

    .line 62
    .end local v3    # "buff":[B
    .end local v6    # "dataCache":Ljava/io/ByteArrayOutputStream;
    .end local v9    # "inputStream":Ljava/io/InputStream;
    .end local v10    # "jsonString":Ljava/lang/String;
    .end local v12    # "len":I
    .end local v13    # "requestJson":Lorg/json/JSONObject;
    .end local v15    # "resultJSON":Lorg/json/JSONObject;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    :cond_3
    :try_start_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 64
    .local v11, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v7, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 102
    .end local v4    # "connection":Ljava/net/HttpURLConnection;
    .end local v7    # "innerRequestJson":Lorg/json/JSONObject;
    .end local v11    # "key":Ljava/lang/String;
    .end local v16    # "url":Ljava/net/URL;
    .end local v17    # "urlString":Ljava/lang/String;
    :catchall_0
    move-exception v18

    .line 103
    :goto_2
    if-eqz v8, :cond_4

    .line 105
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 107
    :cond_4
    if-eqz v5, :cond_5

    .line 109
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 111
    :cond_5
    throw v18

    .line 86
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "buff":[B
    .restart local v4    # "connection":Ljava/net/HttpURLConnection;
    .restart local v6    # "dataCache":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "innerRequestJson":Lorg/json/JSONObject;
    .restart local v9    # "inputStream":Ljava/io/InputStream;
    .restart local v12    # "len":I
    .restart local v13    # "requestJson":Lorg/json/JSONObject;
    .restart local v16    # "url":Ljava/net/URL;
    .restart local v17    # "urlString":Ljava/lang/String;
    :cond_6
    const/16 v18, 0x0

    :try_start_3
    move/from16 v0, v18

    invoke-virtual {v6, v3, v0, v12}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 102
    .end local v3    # "buff":[B
    .end local v6    # "dataCache":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "len":I
    :catchall_1
    move-exception v18

    move-object v8, v9

    .end local v9    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    goto :goto_2
.end method
