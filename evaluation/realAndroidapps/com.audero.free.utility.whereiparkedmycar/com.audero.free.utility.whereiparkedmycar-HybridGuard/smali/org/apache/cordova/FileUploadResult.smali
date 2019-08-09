.class public Lorg/apache/cordova/FileUploadResult;
.super Ljava/lang/Object;
.source "FileUploadResult.java"


# instance fields
.field private bytesSent:J

.field private response:Ljava/lang/String;

.field private responseCode:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/FileUploadResult;->bytesSent:J

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/cordova/FileUploadResult;->responseCode:I

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/FileUploadResult;->response:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBytesSent()J
    .locals 2

    .prologue
    .line 34
    iget-wide v0, p0, Lorg/apache/cordova/FileUploadResult;->bytesSent:J

    return-wide v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lorg/apache/cordova/FileUploadResult;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lorg/apache/cordova/FileUploadResult;->responseCode:I

    return v0
.end method

.method public setBytesSent(J)V
    .locals 0
    .param p1, "bytes"    # J

    .prologue
    .line 38
    iput-wide p1, p0, Lorg/apache/cordova/FileUploadResult;->bytesSent:J

    .line 39
    return-void
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/apache/cordova/FileUploadResult;->response:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setResponseCode(I)V
    .locals 0
    .param p1, "responseCode"    # I

    .prologue
    .line 46
    iput p1, p0, Lorg/apache/cordova/FileUploadResult;->responseCode:I

    .line 47
    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Lorg/json/JSONObject;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{bytesSent:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/apache/cordova/FileUploadResult;->bytesSent:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",responseCode:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/cordova/FileUploadResult;->responseCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",response:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/FileUploadResult;->response:Ljava/lang/String;

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
