.class final Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;
.super Ljava/lang/Object;
.source "RenderManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/RenderManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RenderRequestWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qualcomm/ar/pl/RenderManager;


# direct methods
.method private constructor <init>(Lcom/qualcomm/ar/pl/RenderManager;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/qualcomm/ar/pl/RenderManager;Lcom/qualcomm/ar/pl/RenderManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/qualcomm/ar/pl/RenderManager;
    .param p2, "x1"    # Lcom/qualcomm/ar/pl/RenderManager$1;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;-><init>(Lcom/qualcomm/ar/pl/RenderManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v2, 0x1

    .line 52
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-virtual {v0}, Lcom/qualcomm/ar/pl/SurfaceManager;->requestRender()V

    .line 58
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->renderRequestServiced:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 60
    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    if-nez v0, :cond_0

    .line 63
    iget-object v7, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-object v0, v0, Lcom/qualcomm/ar/pl/RenderManager;->timer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lcom/qualcomm/ar/pl/RenderManager$FixedFrameRateRunner;

    iget-object v2, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/qualcomm/ar/pl/RenderManager$FixedFrameRateRunner;-><init>(Lcom/qualcomm/ar/pl/RenderManager;Lcom/qualcomm/ar/pl/RenderManager$1;)V

    const-wide/16 v2, 0x0

    iget-object v4, p0, Lcom/qualcomm/ar/pl/RenderManager$RenderRequestWatcher;->this$0:Lcom/qualcomm/ar/pl/RenderManager;

    iget-wide v4, v4, Lcom/qualcomm/ar/pl/RenderManager;->delayMS:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, v7, Lcom/qualcomm/ar/pl/RenderManager;->fixedFrameRateRunnerTask:Ljava/util/concurrent/ScheduledFuture;

    .line 66
    :cond_0
    return-void
.end method
