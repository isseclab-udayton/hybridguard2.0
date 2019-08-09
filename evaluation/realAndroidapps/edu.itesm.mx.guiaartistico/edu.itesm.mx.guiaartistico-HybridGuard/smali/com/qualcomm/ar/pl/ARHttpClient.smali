.class public Lcom/qualcomm/ar/pl/ARHttpClient;
.super Ljava/lang/Object;
.source "ARHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;,
        Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;
    }
.end annotation


# static fields
.field private static final MODULENAME:Ljava/lang/String; = "ARHttpClient"


# instance fields
.field executor:Ljava/util/concurrent/ExecutorService;

.field private postDSNTimeoutTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private requestTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Lorg/apache/http/HttpResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    .line 175
    iput-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->postDSNTimeoutTask:Ljava/util/concurrent/Future;

    return-void
.end method

.method static synthetic access$000(Lcom/qualcomm/ar/pl/ARHttpClient;)Ljava/util/concurrent/Future;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/ar/pl/ARHttpClient;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    return-object v0
.end method


# virtual methods
.method public cancel()Z
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 166
    iget-object v0, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v0

    .line 169
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public execute(Lcom/qualcomm/ar/pl/ARHttpRequest;Lcom/qualcomm/ar/pl/ARHttpParams;)Z
    .locals 4
    .param p1, "arRequest"    # Lcom/qualcomm/ar/pl/ARHttpRequest;
    .param p2, "arParams"    # Lcom/qualcomm/ar/pl/ARHttpParams;

    .prologue
    const/4 v1, 0x0

    .line 132
    if-nez p1, :cond_0

    .line 158
    :goto_0
    return v1

    .line 147
    :cond_0
    const/4 v2, 0x2

    :try_start_0
    invoke-static {v2}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->executor:Ljava/util/concurrent/ExecutorService;

    .line 148
    iget-object v2, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;

    invoke-direct {v3, p0, p1, p2}, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;-><init>(Lcom/qualcomm/ar/pl/ARHttpClient;Lcom/qualcomm/ar/pl/ARHttpRequest;Lcom/qualcomm/ar/pl/ARHttpParams;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    iput-object v2, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->requestTask:Ljava/util/concurrent/Future;

    .line 149
    iget-object v2, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;

    invoke-direct {v3, p0, p1, p2}, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseWatcher;-><init>(Lcom/qualcomm/ar/pl/ARHttpClient;Lcom/qualcomm/ar/pl/ARHttpRequest;Lcom/qualcomm/ar/pl/ARHttpParams;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v2

    iput-object v2, p0, Lcom/qualcomm/ar/pl/ARHttpClient;->postDSNTimeoutTask:Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    const/4 v1, 0x1

    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public native nativeCallback(Lcom/qualcomm/ar/pl/ARHttpResponse;J)V
.end method
