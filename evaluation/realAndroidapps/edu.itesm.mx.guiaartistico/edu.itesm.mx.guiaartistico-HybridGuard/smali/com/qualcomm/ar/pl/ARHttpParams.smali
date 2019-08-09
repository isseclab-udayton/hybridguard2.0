.class public Lcom/qualcomm/ar/pl/ARHttpParams;
.super Ljava/lang/Object;
.source "ARHttpParams.java"


# instance fields
.field delayedStart_ms:I

.field requestTimeout_ms:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createHttpParams(Lcom/qualcomm/ar/pl/ARHttpParams;)Lorg/apache/http/params/HttpParams;
    .locals 2
    .param p0, "arParams"    # Lcom/qualcomm/ar/pl/ARHttpParams;

    .prologue
    .line 20
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 22
    .local v0, "httpParams":Lorg/apache/http/params/HttpParams;
    iget v1, p0, Lcom/qualcomm/ar/pl/ARHttpParams;->requestTimeout_ms:I

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 23
    iget v1, p0, Lcom/qualcomm/ar/pl/ARHttpParams;->requestTimeout_ms:I

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 25
    return-object v0
.end method
