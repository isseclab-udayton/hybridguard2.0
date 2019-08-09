.class public final Lcom/google/android/gms/internal/zzex;
.super Lcom/google/android/gms/dynamic/zzp;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/zzp",
        "<",
        "Lcom/google/android/gms/internal/zzfb;",
        ">;"
    }
.end annotation


# static fields
.field private static final zzsm:Lcom/google/android/gms/internal/zzex;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzex;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzex;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzex;->zzsm:Lcom/google/android/gms/internal/zzex;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    const-string v0, "com.google.android.gms.ads.adshield.AdShieldCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/zzp;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static zzb(Ljava/lang/String;Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzey;
    .locals 2

    const/4 v1, 0x0

    invoke-static {}, Lcom/google/android/gms/common/zze;->zzoW()Lcom/google/android/gms/common/zze;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/zze;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzex;->zzsm:Lcom/google/android/gms/internal/zzex;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/internal/zzex;->zzc(Ljava/lang/String;Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzey;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzew;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/internal/zzew;-><init>(Ljava/lang/String;Landroid/content/Context;Z)V

    :cond_1
    return-object v0
.end method

.method private final zzc(Ljava/lang/String;Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzey;
    .locals 4

    const/4 v1, 0x0

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zzn;->zzw(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object v2

    if-eqz p3, :cond_0

    :try_start_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzex;->zzaS(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfb;

    invoke-interface {v0, p1, v2}, Lcom/google/android/gms/internal/zzfb;->zza(Ljava/lang/String;Lcom/google/android/gms/dynamic/IObjectWrapper;)Landroid/os/IBinder;

    move-result-object v0

    move-object v2, v0

    :goto_0
    if-nez v2, :cond_1

    move-object v0, v1

    :goto_1
    return-object v0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzex;->zzaS(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfb;

    invoke-interface {v0, p1, v2}, Lcom/google/android/gms/internal/zzfb;->zzb(Ljava/lang/String;Lcom/google/android/gms/dynamic/IObjectWrapper;)Landroid/os/IBinder;

    move-result-object v0

    move-object v2, v0

    goto :goto_0

    :cond_1
    const-string v0, "com.google.android.gms.ads.adshield.internal.IAdShieldClient"

    invoke-interface {v2, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v3, v0, Lcom/google/android/gms/internal/zzey;

    if-eqz v3, :cond_2

    check-cast v0, Lcom/google/android/gms/internal/zzey;

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzfa;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzfa;-><init>(Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/dynamic/zzq; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    move-exception v0

    :goto_2
    move-object v0, v1

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_2
.end method


# virtual methods
.method protected final synthetic zzb(Landroid/os/IBinder;)Ljava/lang/Object;
    .locals 2

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "com.google.android.gms.ads.adshield.internal.IAdShieldCreator"

    invoke-interface {p1, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Lcom/google/android/gms/internal/zzfb;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/google/android/gms/internal/zzfb;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzfc;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzfc;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method
