.class final Lcom/google/android/gms/internal/zzyr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzrd;


# instance fields
.field private synthetic zzRF:Lcom/google/android/gms/internal/zzyn;

.field private synthetic zzRJ:Lcom/google/android/gms/internal/zznu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzyn;Lcom/google/android/gms/internal/zznu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzyr;->zzRF:Lcom/google/android/gms/internal/zzyn;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzyr;->zzRJ:Lcom/google/android/gms/internal/zznu;

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

    const-string v0, "asset"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzyr;->zzRF:Lcom/google/android/gms/internal/zzyn;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzyr;->zzRJ:Lcom/google/android/gms/internal/zznu;

    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/zzyn;->zza(Lcom/google/android/gms/internal/zzyn;Lcom/google/android/gms/internal/zzpj;Ljava/lang/String;)V

    return-void
.end method
