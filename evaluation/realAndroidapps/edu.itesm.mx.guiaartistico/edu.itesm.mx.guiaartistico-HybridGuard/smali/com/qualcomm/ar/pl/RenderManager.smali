.class public Lcom/qualcomm/ar/pl/RenderManager;
.super Ljava/lang/Object;
.source "RenderManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/ar/pl/RenderManager$1;,
        Lcom/qualcomm/ar/pl/RenderManager$FixedFrameRateRunner;,
        Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;
    }
.end annotation


# static fields
.field private static final AR_RENDERING_MODE_CONTINUOUS:I = 0x1

.field private static final AR_RENDERING_MODE_DISABLED:I = 0x0

.field private static final AR_RENDERING_MODE_WHENDIRTY:I = 0x2

.field private static final MODULENAME:Ljava/lang/String; = "RenderManager"


# instance fields
.field delayMS:J

.field fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field maxMS:J

.field minMS:J

.field renderMode:I

.field renderRequestServiced:Ljava/util/concurrent/atomic/AtomicBoolean;

.field renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field renderRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

.field synchronousMode:Z

.field timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# direct methods
.method public constructor <init>(Lcom/qualcomm/ar/pl/SurfaceManager;)V
    .locals 5
    .param p1, "sm"    # Lcom/qualcomm/ar/pl/SurfaceManager;

    .prologue
    const/4 v4, 0x1

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    .line 39
    iput-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->minMS:J

    .line 40
    iput-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->maxMS:J

    .line 100
    iput-object p1, p0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    .line 103
    iput v4, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderMode:I

    .line 106
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-direct {v0, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 107
    iput-boolean v1, p0, Lcom/qualcomm/ar/pl/RenderManager;->synchronousMode:Z

    .line 108
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestServiced:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 110
    return-void
.end method


# virtual methods
.method public getRenderMode()I
    .locals 1

    .prologue
    .line 168
    iget v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderMode:I

    return v0
.end method

.method public requestRender()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 287
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 288
    return v1
.end method

.method public setRenderFpsLimits(ZII)Z
    .locals 7
    .param p1, "synchronous"    # Z
    .param p2, "minFps"    # I
    .param p3, "maxFps"    # I

    .prologue
    const-wide/16 v5, 0x3e8

    const/4 v4, 0x2

    .line 253
    iput-boolean p1, p0, Lcom/qualcomm/ar/pl/RenderManager;->synchronousMode:Z

    .line 255
    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 257
    :cond_0
    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 259
    const/4 v2, 0x0

    .line 279
    :goto_0
    return v2

    .line 263
    :cond_1
    int-to-long v2, p2

    div-long v2, v5, v2

    iput-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->minMS:J

    .line 264
    int-to-long v2, p3

    div-long v2, v5, v2

    iput-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->maxMS:J

    .line 267
    iget v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderMode:I

    if-ne v2, v4, :cond_2

    .line 269
    iget-boolean v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->synchronousMode:Z

    if-eqz v2, :cond_3

    iget-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->minMS:J

    .line 272
    .local v0, "delayMSTemp":J
    :goto_1
    iget-wide v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2

    .line 274
    iput-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    .line 275
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/RenderManager;->startTimer()V

    .line 279
    .end local v0    # "delayMSTemp":J
    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    .line 269
    :cond_3
    iget-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->maxMS:J

    goto :goto_1
.end method

.method public setRenderMode(I)Z
    .locals 6
    .param p1, "mode"    # I

    .prologue
    const/4 v5, 0x6

    const/4 v3, 0x0

    .line 176
    const/4 v2, 0x0

    .line 178
    .local v2, "result":Z
    iget-object v4, p0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    if-nez v4, :cond_0

    .line 180
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 244
    :goto_0
    return v3

    .line 186
    :cond_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-virtual {v4}, Lcom/qualcomm/ar/pl/SurfaceManager;->retrieveGLSurfaceView()Z

    .line 188
    packed-switch p1, :pswitch_data_0

    .line 226
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 191
    :pswitch_0
    iget-object v4, p0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-virtual {v4, v3}, Lcom/qualcomm/ar/pl/SurfaceManager;->setEnableRenderWhenDirty(Z)Z

    move-result v2

    .line 192
    if-eqz v2, :cond_1

    .line 194
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/RenderManager;->shutdownTimer()V

    .line 231
    :cond_1
    :goto_1
    if-nez v2, :cond_5

    .line 233
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    :goto_2
    move v3, v2

    .line 244
    goto :goto_0

    .line 200
    :pswitch_1
    iget-object v3, p0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/qualcomm/ar/pl/SurfaceManager;->setEnableRenderWhenDirty(Z)Z

    move-result v2

    .line 201
    if-eqz v2, :cond_1

    .line 203
    if-nez p1, :cond_2

    .line 207
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/RenderManager;->shutdownTimer()V

    goto :goto_1

    .line 212
    :cond_2
    iget v3, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderMode:I

    if-ne p1, v3, :cond_3

    iget-object v3, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 214
    :cond_3
    iget-boolean v3, p0, Lcom/qualcomm/ar/pl/RenderManager;->synchronousMode:Z

    if-eqz v3, :cond_4

    iget-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->minMS:J

    .line 215
    .local v0, "delayMSTemp":J
    :goto_3
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-eqz v3, :cond_1

    .line 217
    iput-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    .line 218
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/RenderManager;->startTimer()V

    goto :goto_1

    .line 214
    .end local v0    # "delayMSTemp":J
    :cond_4
    iget-wide v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->maxMS:J

    goto :goto_3

    .line 239
    :cond_5
    iput p1, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderMode:I

    goto :goto_2

    .line 188
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method shutdownTimer()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V

    .line 158
    :cond_0
    return-void
.end method

.method startTimer()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 120
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledFuture;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 127
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledFuture;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 132
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 135
    :cond_2
    iput-object v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    .line 136
    iput-object v2, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;

    .line 148
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;

    invoke-direct {v1, p0, v2}, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;-><init>(Lcom/qualcomm/ar/pl/RenderManager;Lcom/qualcomm/ar/pl/RenderManager$1;)V

    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    const-wide/16 v6, 0x4

    div-long/2addr v4, v6

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestWatcherTask:Ljava/util/concurrent/ScheduledFuture;

    .line 149
    return-void
.end method
