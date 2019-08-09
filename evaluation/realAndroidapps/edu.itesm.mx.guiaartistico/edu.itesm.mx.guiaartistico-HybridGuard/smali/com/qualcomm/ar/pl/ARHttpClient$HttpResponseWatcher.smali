.class Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;
.super Ljava/lang/Object;
.source "ARHttpClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/ARHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpResponseWatcher"
.end annotation


# instance fields
.field private arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

.field private arRequest:Lcom/qualcomm/ar/pl/ARHttpRequest;

.field final synthetic this$0:Lcom/qualcomm/ar/pl/ARHttpClient;


# direct methods
.method public constructor <init>(Lcom/qualcomm/ar/pl/ARHttpClient;Lcom/qualcomm/ar/pl/ARHttpRequest;Lcom/qualcomm/ar/pl/ARHttpParams;)V
    .locals 0
    .param p2, "arRequest"    # Lcom/qualcomm/ar/pl/ARHttpRequest;
    .param p3, "arParams"    # Lcom/qualcomm/ar/pl/ARHttpParams;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    .line 71
    iput-object p2, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->arRequest:Lcom/qualcomm/ar/pl/ARHttpRequest;

    .line 72
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 76
    const/4 v0, 0x0

    .line 77
    .local v0, "arResponse":Lcom/qualcomm/ar/pl/ARHttpResponse;
    sget v3, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    .line 83
    .local v3, "networkStatus":I
    :try_start_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    iget v5, v5, Lcom/qualcomm/ar/pl/ARHttpParams;->delayedStart_ms:I

    iget-object v6, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    iget v6, v6, Lcom/qualcomm/ar/pl/ARHttpParams;->requestTimeout_ms:I

    add-int/2addr v5, v6

    int-to-long v5, v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v6, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/HttpResponse;

    .line 86
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-static {v2}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(Lorg/apache/http/HttpResponse;)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    .line 87
    iget v4, v0, Lcom/qualcomm/ar/pl/ARHttpResponse;->statusCode:I
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v5, 0xc8

    if-eq v4, v5, :cond_0

    .line 114
    :cond_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 116
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 119
    :cond_1
    sget v4, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    if-eq v3, v4, :cond_2

    .line 120
    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    .line 123
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    :cond_2
    :goto_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->arRequest:Lcom/qualcomm/ar/pl/ARHttpRequest;

    iget-wide v5, v5, Lcom/qualcomm/ar/pl/ARHttpRequest;->nativeRequestPtr:J

    invoke-virtual {v4, v0, v5, v6}, Lcom/qualcomm/ar/pl/ARHttpClient;->nativeCallback(Lcom/qualcomm/ar/pl/ARHttpResponse;J)V

    .line 126
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    iget-object v4, v4, Lcom/qualcomm/ar/pl/ARHttpClient;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 127
    return-void

    .line 93
    :catch_0
    move-exception v1

    .line 96
    .local v1, "e":Ljava/util/concurrent/CancellationException;
    :try_start_1
    sget v3, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_CANCELED:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_3

    .line 116
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 119
    :cond_3
    sget v4, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    if-eq v3, v4, :cond_2

    .line 120
    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    goto :goto_0

    .line 99
    .end local v1    # "e":Ljava/util/concurrent/CancellationException;
    :catch_1
    move-exception v1

    .line 102
    .local v1, "e":Ljava/util/concurrent/TimeoutException;
    :try_start_2
    sget v3, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_TIMEOUT:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_4

    .line 116
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 119
    :cond_4
    sget v4, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    if-eq v3, v4, :cond_2

    .line 120
    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    goto :goto_0

    .line 105
    .end local v1    # "e":Ljava/util/concurrent/TimeoutException;
    :catch_2
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    sget v3, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_OPERATION_FAILED:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 114
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_5

    .line 116
    iget-object v4, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v4}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v4

    invoke-interface {v4, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 119
    :cond_5
    sget v4, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    if-eq v3, v4, :cond_2

    .line 120
    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    goto/16 :goto_0

    .line 114
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v5}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v5

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v5}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_6

    .line 116
    iget-object v5, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-static {v5}, Lcom/qualcomm/ar/pl/ARHttpClient;->access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;

    move-result-object v5

    invoke-interface {v5, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 119
    :cond_6
    sget v5, Lcom/qualcomm/ar/pl/ARHttpResponse;->ERROR_NONE:I

    if-eq v3, v5, :cond_7

    .line 120
    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpResponse;->createARResponse(I)Lcom/qualcomm/ar/pl/ARHttpResponse;

    move-result-object v0

    :cond_7
    throw v4
.end method
