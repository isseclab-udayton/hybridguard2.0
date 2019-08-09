.class public final Lcom/google/android/gms/internal/zzle;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzBb:Lcom/google/android/gms/internal/zzup;

.field private zzBf:Lcom/google/android/gms/ads/Correlator;

.field private zzBg:Lcom/google/android/gms/internal/zzjz;

.field private zzBh:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

.field private zzBl:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

.field private zzBm:Z

.field private zzcS:Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;

.field private final zzrQ:Lcom/google/android/gms/internal/zziu;

.field private zzsw:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

.field private zztV:Ljava/lang/String;

.field private zzuj:Z

.field private zzzL:Lcom/google/android/gms/internal/zzim;

.field private zzzM:Lcom/google/android/gms/ads/AdListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zziu;->zzAr:Lcom/google/android/gms/internal/zziu;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/internal/zzle;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zziu;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zziu;->zzAr:Lcom/google/android/gms/internal/zziu;

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/gms/internal/zzle;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zziu;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zziu;Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzup;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzup;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBb:Lcom/google/android/gms/internal/zzup;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzle;->zzrQ:Lcom/google/android/gms/internal/zziu;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzle;->zzBl:Lcom/google/android/gms/ads/doubleclick/PublisherInterstitialAd;

    return-void
.end method

.method private final zzK(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "The ad unit ID must be set on InterstitialAd before "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is called."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method


# virtual methods
.method public final getAdListener()Lcom/google/android/gms/ads/AdListener;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzzM:Lcom/google/android/gms/ads/AdListener;

    return-object v0
.end method

.method public final getAdUnitId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zztV:Ljava/lang/String;

    return-object v0
.end method

.method public final getAppEventListener()Lcom/google/android/gms/ads/doubleclick/AppEventListener;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzsw:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    return-object v0
.end method

.method public final getMediationAdapterClassName()Ljava/lang/String;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzjz;->zzaI()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "Failed to get the mediation adapter class name."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getOnCustomRenderedAdLoadedListener()Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBh:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    return-object v0
.end method

.method public final isLoaded()Z
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzjz;->isReady()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Failed to check if ad is ready."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final isLoading()Z
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzjz;->isLoading()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Failed to check if ad is loading."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final setAdListener(Lcom/google/android/gms/ads/AdListener;)V
    .locals 2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzzM:Lcom/google/android/gms/ads/AdListener;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzio;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzio;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzjo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set the AdListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final setAdUnitId(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zztV:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The ad unit ID can only be set once on InterstitialAd."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zztV:Ljava/lang/String;

    return-void
.end method

.method public final setAppEventListener(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V
    .locals 2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzsw:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzix;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzix;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzke;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set the AppEventListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final setCorrelator(Lcom/google/android/gms/ads/Correlator;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzBf:Lcom/google/android/gms/ads/Correlator;

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBf:Lcom/google/android/gms/ads/Correlator;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzkk;)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBf:Lcom/google/android/gms/ads/Correlator;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/Correlator;->zzac()Lcom/google/android/gms/internal/zzjj;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set correlator."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final setImmersiveMode(Z)V
    .locals 2

    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzle;->zzuj:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzjz;->setImmersiveMode(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "Failed to set immersive mode"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final setOnCustomRenderedAdLoadedListener(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V
    .locals 2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzBh:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zznk;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zznk;-><init>(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zznh;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set the OnCustomRenderedAdLoadedListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final setRewardedVideoAdListener(Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;)V
    .locals 2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzcS:Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzadi;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzadi;-><init>(Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;)V

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzadd;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set the AdListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final show()V
    .locals 2

    :try_start_0
    const-string v0, "show"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzle;->zzK(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzjz;->showInterstitial()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "Failed to show interstitial."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzim;)V
    .locals 2

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzle;->zzzL:Lcom/google/android/gms/internal/zzim;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzin;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzin;-><init>(Lcom/google/android/gms/internal/zzim;)V

    :goto_0
    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzjl;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to set the AdClickListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final zza(Lcom/google/android/gms/internal/zzla;)V
    .locals 7

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    if-nez v0, :cond_7

    const-string v0, "loadAd"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zztV:Ljava/lang/String;

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzle;->zzK(Ljava/lang/String;)V

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzle;->zzBm:Z

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/google/android/gms/internal/zziv;->zzdk()Lcom/google/android/gms/internal/zziv;

    move-result-object v3

    :goto_0
    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzdt()Lcom/google/android/gms/internal/zziz;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzle;->zztV:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzle;->zzBb:Lcom/google/android/gms/internal/zzup;

    const/4 v6, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzjc;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzjc;-><init>(Lcom/google/android/gms/internal/zziz;Landroid/content/Context;Lcom/google/android/gms/internal/zziv;Ljava/lang/String;Lcom/google/android/gms/internal/zzuq;)V

    invoke-static {v2, v6, v0}, Lcom/google/android/gms/internal/zziz;->zza(Landroid/content/Context;ZLcom/google/android/gms/internal/zziz$zza;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjz;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzzM:Lcom/google/android/gms/ads/AdListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    new-instance v1, Lcom/google/android/gms/internal/zzio;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->zzzM:Lcom/google/android/gms/ads/AdListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzio;-><init>(Lcom/google/android/gms/ads/AdListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzjo;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzzL:Lcom/google/android/gms/internal/zzim;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    new-instance v1, Lcom/google/android/gms/internal/zzin;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->zzzL:Lcom/google/android/gms/internal/zzim;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzin;-><init>(Lcom/google/android/gms/internal/zzim;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzjl;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzsw:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    new-instance v1, Lcom/google/android/gms/internal/zzix;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->zzsw:Lcom/google/android/gms/ads/doubleclick/AppEventListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzix;-><init>(Lcom/google/android/gms/ads/doubleclick/AppEventListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzke;)V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBh:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    new-instance v1, Lcom/google/android/gms/internal/zznk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->zzBh:Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zznk;-><init>(Lcom/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zznh;)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBf:Lcom/google/android/gms/ads/Correlator;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->zzBf:Lcom/google/android/gms/ads/Correlator;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/Correlator;->zzac()Lcom/google/android/gms/internal/zzjj;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzkk;)V

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzcS:Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    new-instance v1, Lcom/google/android/gms/internal/zzadi;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle;->zzcS:Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzadi;-><init>(Lcom/google/android/gms/ads/reward/RewardedVideoAdListener;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzadd;)V

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzle;->zzuj:Z

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->setImmersiveMode(Z)V

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBg:Lcom/google/android/gms/internal/zzjz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/zziu;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzla;)Lcom/google/android/gms/internal/zzir;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzjz;->zza(Lcom/google/android/gms/internal/zzir;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle;->zzBb:Lcom/google/android/gms/internal/zzup;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzla;->zzdz()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzup;->zzg(Ljava/util/Map;)V

    :cond_8
    :goto_1
    return-void

    :cond_9
    new-instance v3, Lcom/google/android/gms/internal/zziv;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zziv;-><init>()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Failed to load ad."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public final zza(Z)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzle;->zzBm:Z

    return-void
.end method
