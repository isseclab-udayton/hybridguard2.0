.class final Lcom/google/android/gms/internal/zzach;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzrd;


# instance fields
.field private synthetic zzUA:Lcom/google/android/gms/internal/zzabu;

.field private synthetic zzWj:Lcom/google/android/gms/internal/zzacg;

.field private synthetic zztF:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzacg;Landroid/content/Context;Lcom/google/android/gms/internal/zzabu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzach;->zzWj:Lcom/google/android/gms/internal/zzacg;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzach;->zztF:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzach;->zzUA:Lcom/google/android/gms/internal/zzabu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/zzaka;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaka;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzach;->zztF:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbz()Lcom/google/android/gms/internal/zzagz;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/android/gms/internal/zzagz;->zzj(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/zzmo;->zza(Landroid/content/Context;ILorg/json/JSONObject;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzach;->zzWj:Lcom/google/android/gms/internal/zzacg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzacg;->zza(Lcom/google/android/gms/internal/zzacg;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaka;->zziw()Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    const-string v1, "/loadSdkConstants"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/internal/zzakb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzrd;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzach;->zzUA:Lcom/google/android/gms/internal/zzabu;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzacg;->zze(Lcom/google/android/gms/internal/zzabu;)V

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "Unable to save SDK Core Constants."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzafr;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaka;->zziw()Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    const-string v1, "/loadSdkConstants"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/internal/zzakb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzrd;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzach;->zzUA:Lcom/google/android/gms/internal/zzabu;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzacg;->zze(Lcom/google/android/gms/internal/zzabu;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaka;->zziw()Lcom/google/android/gms/internal/zzakb;

    move-result-object v1

    const-string v2, "/loadSdkConstants"

    invoke-virtual {v1, v2, p0}, Lcom/google/android/gms/internal/zzakb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzrd;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzach;->zzUA:Lcom/google/android/gms/internal/zzabu;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzacg;->zze(Lcom/google/android/gms/internal/zzabu;)V

    throw v0
.end method
