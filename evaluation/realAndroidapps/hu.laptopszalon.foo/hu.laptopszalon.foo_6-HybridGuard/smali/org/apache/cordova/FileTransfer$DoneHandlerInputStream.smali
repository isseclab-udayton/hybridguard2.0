.class final Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;
.super Lorg/apache/cordova/FileTransfer$TrackingHTTPInputStream;
.source "FileTransfer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/FileTransfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DoneHandlerInputStream"
.end annotation


# instance fields
.field private done:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 185
    invoke-direct {p0, p1}, Lorg/apache/cordova/FileTransfer$TrackingHTTPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 186
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 190
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_0

    move v0, v1

    .line 191
    .local v0, "result":I
    :goto_0
    if-ne v0, v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 192
    return v0

    .line 190
    .end local v0    # "result":I
    :cond_0
    invoke-super {p0}, Lorg/apache/cordova/FileTransfer$TrackingHTTPInputStream;->read()I

    move-result v0

    goto :goto_0

    .line 191
    .restart local v0    # "result":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public read([B)I
    .locals 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 197
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_0

    move v0, v1

    .line 198
    .local v0, "result":I
    :goto_0
    if-ne v0, v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 199
    return v0

    .line 197
    .end local v0    # "result":I
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/cordova/FileTransfer$TrackingHTTPInputStream;->read([B)I

    move-result v0

    goto :goto_0

    .line 198
    .restart local v0    # "result":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public read([BII)I
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 204
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_0

    move v0, v1

    .line 205
    .local v0, "result":I
    :goto_0
    if-ne v0, v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 206
    return v0

    .line 204
    .end local v0    # "result":I
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/FileTransfer$TrackingHTTPInputStream;->read([BII)I

    move-result v0

    goto :goto_0

    .line 205
    .restart local v0    # "result":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method
