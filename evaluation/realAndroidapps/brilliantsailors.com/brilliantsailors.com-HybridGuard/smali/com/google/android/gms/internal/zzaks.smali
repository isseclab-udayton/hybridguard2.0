.class public final Lcom/google/android/gms/internal/zzaks;
.super Lcom/google/android/gms/internal/zzkt;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private final zzJH:Lcom/google/android/gms/internal/zzaka;

.field private zzacA:F

.field private final zzact:Z

.field private final zzacu:F

.field private zzacv:I

.field private zzacw:Lcom/google/android/gms/internal/zzkv;

.field private zzacx:Z

.field private zzacy:Z

.field private zzacz:F

.field private zzsf:Z

.field private zzsg:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzaka;FZ)V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzkt;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaks;->zzacy:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaks;->zzsf:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaks;->zzJH:Lcom/google/android/gms/internal/zzaka;

    iput p2, p0, Lcom/google/android/gms/internal/zzaks;->zzacu:F

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzaks;->zzact:Z

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaks;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaks;->zzacx:Z

    return p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaks;)Lcom/google/android/gms/internal/zzaka;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaks;->zzJH:Lcom/google/android/gms/internal/zzaka;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzaks;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method private final zzc(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_0
    const-string v1, "action"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbz()Lcom/google/android/gms/internal/zzagz;

    new-instance v1, Lcom/google/android/gms/internal/zzakt;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzakt;-><init>(Lcom/google/android/gms/internal/zzaks;Ljava/util/Map;)V

    invoke-static {v1}, Lcom/google/android/gms/internal/zzagz;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzaks;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacx:Z

    return v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzaks;)Lcom/google/android/gms/internal/zzkv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacw:Lcom/google/android/gms/internal/zzkv;

    return-object v0
.end method


# virtual methods
.method public final getAspectRatio()F
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacA:F

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final getPlaybackState()I
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacv:I

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final isCustomControlsEnabled()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzact:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzsg:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final isMuted()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacy:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final mute(Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "mute"

    :goto_0
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaks;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_0
    const-string v0, "unmute"

    goto :goto_0
.end method

.method public final pause()V
    .locals 2

    const-string v0, "pause"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaks;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public final play()V
    .locals 2

    const-string v0, "play"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaks;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public final zza(FIZF)V
    .locals 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzaks;->zzacz:F

    iget-boolean v4, p0, Lcom/google/android/gms/internal/zzaks;->zzacy:Z

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzaks;->zzacy:Z

    iget v2, p0, Lcom/google/android/gms/internal/zzaks;->zzacv:I

    iput p2, p0, Lcom/google/android/gms/internal/zzaks;->zzacv:I

    iput p4, p0, Lcom/google/android/gms/internal/zzaks;->zzacA:F

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbz()Lcom/google/android/gms/internal/zzagz;

    new-instance v0, Lcom/google/android/gms/internal/zzaku;

    move-object v1, p0

    move v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaku;-><init>(Lcom/google/android/gms/internal/zzaks;IIZZ)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzagz;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzkv;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzaks;->zzacw:Lcom/google/android/gms/internal/zzkv;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final zzb(Lcom/google/android/gms/internal/zzlx;)V
    .locals 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzlx;->zzBJ:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzsf:Z

    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzlx;->zzBK:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaks;->zzsg:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "initialState"

    const-string v3, "muteStart"

    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzlx;->zzBJ:Z

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    const-string v4, "customControlsRequested"

    iget-boolean v1, p1, Lcom/google/android/gms/internal/zzlx;->zzBK:Z

    if-eqz v1, :cond_1

    const-string v1, "1"

    :goto_1
    invoke-static {v3, v0, v4, v1}, Lcom/google/android/gms/common/util/zzf;->zza(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/google/android/gms/internal/zzaks;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_0
    const-string v0, "0"

    goto :goto_0

    :cond_1
    const-string v1, "0"

    goto :goto_1
.end method

.method public final zzdv()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacu:F

    return v0
.end method

.method public final zzdw()F
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaks;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzaks;->zzacz:F

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
