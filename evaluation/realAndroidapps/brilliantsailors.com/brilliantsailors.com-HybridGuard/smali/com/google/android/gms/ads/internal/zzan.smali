.class final Lcom/google/android/gms/ads/internal/zzan;
.super Lcom/google/android/gms/internal/zzafp;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field final synthetic zzun:Lcom/google/android/gms/ads/internal/zzal;

.field private final zzuo:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/zzal;I)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzafp;-><init>()V

    iput p2, p0, Lcom/google/android/gms/ads/internal/zzan;->zzuo:I

    return-void
.end method


# virtual methods
.method public final onStop()V
    .locals 0

    return-void
.end method

.method public final zzbd()V
    .locals 10

    const/4 v7, -0x1

    new-instance v0, Lcom/google/android/gms/ads/internal/zzap;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/zzbt;->zzur:Z

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zzal;->zzba()Z

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/zzal;->zza(Lcom/google/android/gms/ads/internal/zzal;)Z

    move-result v3

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    invoke-static {v4}, Lcom/google/android/gms/ads/internal/zzal;->zzb(Lcom/google/android/gms/ads/internal/zzal;)F

    move-result v4

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-boolean v5, v5, Lcom/google/android/gms/ads/internal/zzbt;->zzur:Z

    if-eqz v5, :cond_1

    iget v5, p0, Lcom/google/android/gms/ads/internal/zzan;->zzuo:I

    :goto_0
    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    invoke-static {v6}, Lcom/google/android/gms/ads/internal/zzal;->zzc(Lcom/google/android/gms/ads/internal/zzal;)Z

    move-result v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/ads/internal/zzap;-><init>(ZZZFIZ)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzbt;->zzvY:Lcom/google/android/gms/internal/zzaff;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzaff;->zzPg:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaka;->getRequestedOrientation()I

    move-result v6

    if-ne v6, v7, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzbt;->zzvY:Lcom/google/android/gms/internal/zzaff;

    iget v6, v1, Lcom/google/android/gms/internal/zzaff;->orientation:I

    :cond_0
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzbt;->zzvY:Lcom/google/android/gms/internal/zzaff;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzaff;->zzPg:Lcom/google/android/gms/internal/zzaka;

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/zzbt;->zzvT:Lcom/google/android/gms/internal/zzaje;

    iget-object v8, p0, Lcom/google/android/gms/ads/internal/zzan;->zzun:Lcom/google/android/gms/ads/internal/zzal;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/zzal;->zzsP:Lcom/google/android/gms/ads/internal/zzbt;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/zzbt;->zzvY:Lcom/google/android/gms/internal/zzaff;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzaff;->zzTt:Ljava/lang/String;

    move-object v9, v0

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/internal/zzim;Lcom/google/android/gms/ads/internal/overlay/zzw;Lcom/google/android/gms/ads/internal/overlay/zzag;Lcom/google/android/gms/internal/zzaka;ILcom/google/android/gms/internal/zzaje;Ljava/lang/String;Lcom/google/android/gms/ads/internal/zzap;)V

    sget-object v0, Lcom/google/android/gms/internal/zzagz;->zzZr:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/ads/internal/zzao;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/ads/internal/zzao;-><init>(Lcom/google/android/gms/ads/internal/zzan;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    move v5, v7

    goto :goto_0
.end method
