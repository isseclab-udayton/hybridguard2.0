.class public final Lcom/google/android/gms/internal/zzew;
.super Lcom/google/android/gms/internal/zzez;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field private final zzsi:Lcom/google/android/gms/internal/zzct;

.field private final zzsj:Lcom/google/android/gms/internal/zzcu;

.field private final zzsk:Lcom/google/android/gms/internal/zzcr;

.field private zzsl:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Z)V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzez;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzew;->zzsl:Z

    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/zzct;->zza(Ljava/lang/String;Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzct;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzew;->zzsi:Lcom/google/android/gms/internal/zzct;

    new-instance v0, Lcom/google/android/gms/internal/zzcu;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsi:Lcom/google/android/gms/internal/zzct;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzcu;-><init>(Lcom/google/android/gms/internal/zzcp;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    if-eqz p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzew;->zzsk:Lcom/google/android/gms/internal/zzcr;

    return-void

    :cond_0
    invoke-static {p2}, Lcom/google/android/gms/internal/zzcr;->zzb(Landroid/content/Context;)Lcom/google/android/gms/internal/zzcr;

    move-result-object v0

    goto :goto_0
.end method

.method private final zza(Lcom/google/android/gms/dynamic/IObjectWrapper;Lcom/google/android/gms/dynamic/IObjectWrapper;Z)Lcom/google/android/gms/dynamic/IObjectWrapper;
    .locals 5

    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-eqz p3, :cond_0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v3, v0, v1}, Lcom/google/android/gms/internal/zzcu;->zza(Landroid/net/Uri;Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/dynamic/zzn;->zzw(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    iget-object v3, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v1, v4}, Lcom/google/android/gms/internal/zzcu;->zza(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;)Landroid/net/Uri;
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzcv; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v2

    goto :goto_1
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/dynamic/IObjectWrapper;Lcom/google/android/gms/dynamic/IObjectWrapper;)Lcom/google/android/gms/dynamic/IObjectWrapper;
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzew;->zza(Lcom/google/android/gms/dynamic/IObjectWrapper;Lcom/google/android/gms/dynamic/IObjectWrapper;Z)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Lcom/google/android/gms/dynamic/IObjectWrapper;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsi:Lcom/google/android/gms/internal/zzct;

    invoke-virtual {v1, v0, p2}, Lcom/google/android/gms/internal/zzct;->zza(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Lcom/google/android/gms/dynamic/IObjectWrapper;[B)Ljava/lang/String;
    .locals 3

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsi:Lcom/google/android/gms/internal/zzct;

    invoke-virtual {v1, v0, p2}, Lcom/google/android/gms/internal/zzct;->zza(Landroid/content/Context;[B)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzew;->zzsk:Lcom/google/android/gms/internal/zzcr;

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzew;->zzsl:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzew;->zzsk:Lcom/google/android/gms/internal/zzcr;

    invoke-virtual {v2, v0, p2}, Lcom/google/android/gms/internal/zzcr;->zza(Landroid/content/Context;[B)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzcr;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzew;->zzsl:Z

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method public final zza(Lcom/google/android/gms/dynamic/IObjectWrapper;)Z
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzcu;->zza(Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public final zzaf()Ljava/lang/String;
    .locals 1

    const-string v0, "ms"

    return-object v0
.end method

.method public final zzb(Lcom/google/android/gms/dynamic/IObjectWrapper;Lcom/google/android/gms/dynamic/IObjectWrapper;)Lcom/google/android/gms/dynamic/IObjectWrapper;
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzew;->zza(Lcom/google/android/gms/dynamic/IObjectWrapper;Lcom/google/android/gms/dynamic/IObjectWrapper;Z)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object v0

    return-object v0
.end method

.method public final zzb(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzcu;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/dynamic/IObjectWrapper;)Z
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzcu;->zzc(Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public final zzb(Ljava/lang/String;Z)Z
    .locals 3

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsk:Lcom/google/android/gms/internal/zzcr;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    new-instance v1, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzew;->zzsk:Lcom/google/android/gms/internal/zzcr;

    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/zzcr;->zza(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)V

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzew;->zzsl:Z

    goto :goto_0
.end method

.method public final zzc(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzew;->zza(Lcom/google/android/gms/dynamic/IObjectWrapper;[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzd(Lcom/google/android/gms/dynamic/IObjectWrapper;)V
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zzn;->zzE(Lcom/google/android/gms/dynamic/IObjectWrapper;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MotionEvent;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzcu;->zza(Landroid/view/MotionEvent;)V

    return-void
.end method

.method public final zzk(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzew;->zzsj:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzcu;->zzk(Ljava/lang/String;)V

    return-void
.end method
