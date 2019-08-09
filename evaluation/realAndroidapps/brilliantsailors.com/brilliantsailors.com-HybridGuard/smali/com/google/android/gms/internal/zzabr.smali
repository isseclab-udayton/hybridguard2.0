.class final Lcom/google/android/gms/internal/zzabr;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zzUG:Lcom/google/android/gms/internal/zzaae;

.field private synthetic zzUH:Lcom/google/android/gms/internal/zzaap;

.field private synthetic zzUI:Lcom/google/android/gms/internal/zzabm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzabm;Lcom/google/android/gms/internal/zzaae;Lcom/google/android/gms/internal/zzaap;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzabr;->zzUI:Lcom/google/android/gms/internal/zzabm;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzabr;->zzUG:Lcom/google/android/gms/internal/zzaae;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzabr;->zzUH:Lcom/google/android/gms/internal/zzaap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzabr;->zzUI:Lcom/google/android/gms/internal/zzabm;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzabr;->zzUG:Lcom/google/android/gms/internal/zzaae;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzabm;->zzc(Lcom/google/android/gms/internal/zzaae;)Lcom/google/android/gms/internal/zzaai;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzaai;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaai;-><init>(I)V

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzabr;->zzUH:Lcom/google/android/gms/internal/zzaap;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzaap;->zza(Lcom/google/android/gms/internal/zzaai;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbD()Lcom/google/android/gms/internal/zzafk;

    move-result-object v2

    const-string v3, "AdRequestServiceImpl.loadAdAsync"

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/internal/zzafk;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    const-string v2, "Could not fetch ad response due to an Exception."

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzafr;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "Fail to forward ad response."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzafr;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
