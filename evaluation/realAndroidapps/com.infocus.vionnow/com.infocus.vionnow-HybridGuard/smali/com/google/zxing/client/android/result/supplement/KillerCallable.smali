.class final Lcom/google/zxing/client/android/result/supplement/KillerCallable;
.super Ljava/lang/Object;
.source "KillerCallable.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final timeout:J

.field private final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)V
    .locals 0
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->future:Ljava/util/concurrent/Future;

    .line 33
    iput-wide p2, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->timeout:J

    .line 34
    iput-object p4, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->unit:Ljava/util/concurrent/TimeUnit;

    .line 35
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
    .line 1
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 39
    :try_start_0
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->future:Ljava/util/concurrent/Future;

    iget-wide v2, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->timeout:J

    iget-object v4, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :goto_0
    const/4 v1, 0x0

    return-object v1

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "te":Ljava/util/concurrent/TimeoutException;
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/KillerCallable;->future:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_0
.end method
