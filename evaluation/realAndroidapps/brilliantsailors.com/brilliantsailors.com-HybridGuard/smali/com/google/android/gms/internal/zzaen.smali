.class final Lcom/google/android/gms/internal/zzaen;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;


# instance fields
.field final synthetic zzXk:Lcom/google/android/gms/internal/zzajg;

.field final synthetic zzXl:Ljava/util/Set;

.field final synthetic zzXm:Lcom/google/android/gms/internal/zzael;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzael;Ljava/util/Set;Lcom/google/android/gms/internal/zzajg;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaen;->zzXm:Lcom/google/android/gms/internal/zzael;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaen;->zzXl:Ljava/util/Set;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaen;->zzXk:Lcom/google/android/gms/internal/zzajg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 6
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaen;->zzXm:Lcom/google/android/gms/internal/zzael;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzael;->zzb(Lcom/google/android/gms/internal/zzael;)Ljava/util/Timer;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzaeo;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzaeo;-><init>(Lcom/google/android/gms/internal/zzaen;)V

    sget-object v0, Lcom/google/android/gms/internal/zzmo;->zzGd:Lcom/google/android/gms/internal/zzme;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbL()Lcom/google/android/gms/internal/zzmm;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzmm;->zzd(Lcom/google/android/gms/internal/zzme;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "Cannot schedule thread: "

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzaes;->zzaC(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public final onConnectionSuspended(I)V
    .locals 0

    return-void
.end method
