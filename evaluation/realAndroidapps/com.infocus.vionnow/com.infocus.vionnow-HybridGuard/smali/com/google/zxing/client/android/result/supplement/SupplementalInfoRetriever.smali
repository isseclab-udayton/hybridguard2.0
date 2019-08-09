.class public abstract Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
.super Ljava/lang/Object;
.source "SupplementalInfoRetriever.java"

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


# static fields
.field private static executorInstance:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final context:Landroid/content/Context;

.field private final handler:Landroid/os/Handler;

.field private final textViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executorInstance:Ljava/util/concurrent/ExecutorService;

    .line 41
    return-void
.end method

.method constructor <init>(Landroid/widget/TextView;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->textViewRef:Ljava/lang/ref/WeakReference;

    .line 84
    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->handler:Landroid/os/Handler;

    .line 85
    iput-object p3, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->context:Landroid/content/Context;

    .line 86
    return-void
.end method

.method static synthetic access$1(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->context:Landroid/content/Context;

    return-object v0
.end method

.method private static declared-synchronized getExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .prologue
    .line 46
    const-class v1, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executorInstance:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$1;

    invoke-direct {v0}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$1;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executorInstance:Ljava/util/concurrent/ExecutorService;

    .line 55
    :cond_0
    sget-object v0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->executorInstance:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static maybeInvokeRetrieval(Landroid/widget/TextView;Lcom/google/zxing/client/result/ParsedResult;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 7
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "result"    # Lcom/google/zxing/client/result/ParsedResult;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    const/4 v2, 0x0

    .line 61
    .local v2, "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    instance-of v3, p1, Lcom/google/zxing/client/result/URIParsedResult;

    if-eqz v3, :cond_2

    .line 62
    new-instance v2, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;

    .end local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    check-cast p1, Lcom/google/zxing/client/result/URIParsedResult;

    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-direct {v2, p0, p1, p2, p3}, Lcom/google/zxing/client/android/result/supplement/URIResultInfoRetriever;-><init>(Landroid/widget/TextView;Lcom/google/zxing/client/result/URIParsedResult;Landroid/os/Handler;Landroid/content/Context;)V

    .line 70
    .restart local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 71
    invoke-static {}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 72
    .local v0, "executor":Ljava/util/concurrent/ExecutorService;
    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 74
    .local v1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    new-instance v3, Lcom/google/zxing/client/android/result/supplement/KillerCallable;

    const-wide/16 v4, 0xa

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v3, v1, v4, v5, v6}, Lcom/google/zxing/client/android/result/supplement/KillerCallable;-><init>(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 76
    .end local v0    # "executor":Ljava/util/concurrent/ExecutorService;
    .end local v1    # "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :cond_1
    return-void

    .line 63
    .restart local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :cond_2
    instance-of v3, p1, Lcom/google/zxing/client/result/ProductParsedResult;

    if-eqz v3, :cond_3

    .line 64
    new-instance v2, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;

    .line 65
    .end local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    check-cast p1, Lcom/google/zxing/client/result/ProductParsedResult;

    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-virtual {p1}, Lcom/google/zxing/client/result/ProductParsedResult;->getProductID()Ljava/lang/String;

    move-result-object v3

    .line 64
    invoke-direct {v2, p0, v3, p2, p3}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;-><init>(Landroid/widget/TextView;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V

    .restart local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    goto :goto_0

    .line 66
    .restart local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    :cond_3
    instance-of v3, p1, Lcom/google/zxing/client/result/ISBNParsedResult;

    if-eqz v3, :cond_0

    .line 67
    new-instance v2, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;

    .end local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    check-cast p1, Lcom/google/zxing/client/result/ISBNParsedResult;

    .end local p1    # "result":Lcom/google/zxing/client/result/ParsedResult;
    invoke-virtual {p1}, Lcom/google/zxing/client/result/ISBNParsedResult;->getISBN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3, p2, p3}, Lcom/google/zxing/client/android/result/supplement/ProductResultInfoRetriever;-><init>(Landroid/widget/TextView;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V

    .restart local v2    # "retriever":Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
    goto :goto_0
.end method


# virtual methods
.method final append(Ljava/lang/String;)V
    .locals 3
    .param p1, "newText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->textViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 97
    .local v0, "textView":Landroid/widget/TextView;
    if-nez v0, :cond_0

    .line 98
    new-instance v1, Ljava/lang/InterruptedException;

    invoke-direct {v1}, Ljava/lang/InterruptedException;-><init>()V

    throw v1

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$2;-><init>(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;Ljava/lang/String;Landroid/widget/TextView;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 106
    return-void
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public final call()Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->retrieveSupplementalInfo()V

    .line 90
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract retrieveSupplementalInfo()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method final setLink(Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;->textViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    new-instance v1, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;

    invoke-direct {v1, p0, p1}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever$3;-><init>(Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    return-void
.end method
