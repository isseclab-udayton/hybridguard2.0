.class Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;
.super Ljava/lang/Object;
.source "ARHttpClient.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/ARHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpResponseCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lorg/apache/http/HttpResponse;",
        ">;"
    }
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
    .line 36
    iput-object p1, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->this$0:Lcom/qualcomm/ar/pl/ARHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p2, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arRequest:Lcom/qualcomm/ar/pl/ARHttpRequest;

    .line 38
    iput-object p3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    .line 39
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->call()Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/apache/http/HttpResponse;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    iget-object v3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    iget v3, v3, Lcom/qualcomm/ar/pl/ARHttpParams;->delayedStart_ms:I

    if-eqz v3, :cond_0

    .line 46
    iget-object v3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    iget v3, v3, Lcom/qualcomm/ar/pl/ARHttpParams;->delayedStart_ms:I

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 50
    :cond_0
    iget-object v3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arParams:Lcom/qualcomm/ar/pl/ARHttpParams;

    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpParams;->createHttpParams(Lcom/qualcomm/ar/pl/ARHttpParams;)Lorg/apache/http/params/HttpParams;

    move-result-object v1

    .line 52
    .local v1, "httpParams":Lorg/apache/http/params/HttpParams;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 55
    .local v0, "httpClient":Lorg/apache/http/client/HttpClient;
    iget-object v3, p0, Lcom/qualcomm/ar/pl/ARHttpClient$HttpResponseCallable;->arRequest:Lcom/qualcomm/ar/pl/ARHttpRequest;

    invoke-static {v3}, Lcom/qualcomm/ar/pl/ARHttpRequest;->createHttpRequest(Lcom/qualcomm/ar/pl/ARHttpRequest;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v2

    .line 59
    .local v2, "httpPost":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-interface {v0, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    return-object v3
.end method
