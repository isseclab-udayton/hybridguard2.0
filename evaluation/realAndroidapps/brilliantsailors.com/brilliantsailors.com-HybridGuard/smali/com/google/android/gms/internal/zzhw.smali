.class final Lcom/google/android/gms/internal/zzhw;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/zzg;


# instance fields
.field private synthetic zzzs:Lcom/google/android/gms/internal/zzhs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhs;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhs;->zzc(Lcom/google/android/gms/internal/zzhs;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzhs;->zza(Lcom/google/android/gms/internal/zzhs;Lcom/google/android/gms/internal/zzid;)Lcom/google/android/gms/internal/zzid;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhs;->zzd(Lcom/google/android/gms/internal/zzhs;)Lcom/google/android/gms/internal/zzhz;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzhs;->zza(Lcom/google/android/gms/internal/zzhs;Lcom/google/android/gms/internal/zzhz;)Lcom/google/android/gms/internal/zzhz;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzs:Lcom/google/android/gms/internal/zzhs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhs;->zzc(Lcom/google/android/gms/internal/zzhs;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
