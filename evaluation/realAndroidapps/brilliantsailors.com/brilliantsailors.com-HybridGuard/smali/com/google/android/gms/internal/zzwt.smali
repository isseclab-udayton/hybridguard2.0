.class public final Lcom/google/android/gms/internal/zzwt;
.super Lcom/google/android/gms/internal/zzwu;

# interfaces
.implements Lcom/google/android/gms/internal/zzrd;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzJH:Lcom/google/android/gms/internal/zzaka;

.field private final zzNW:Lcom/google/android/gms/internal/zzlz;

.field private zzNX:F

.field private zzNY:I

.field private zzNZ:I

.field private zzOa:I

.field private zzOb:I

.field private zzOc:I

.field private zzOd:I

.field private zzOe:I

.field private final zzwR:Landroid/view/WindowManager;

.field private zzxF:Landroid/util/DisplayMetrics;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzaka;Landroid/content/Context;Lcom/google/android/gms/internal/zzlz;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzwu;-><init>(Lcom/google/android/gms/internal/zzaka;)V

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNY:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNZ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOb:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOc:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOd:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOe:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzwt;->zzNW:Lcom/google/android/gms/internal/zzlz;

    const-string v0, "window"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzwR:Landroid/view/WindowManager;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/zzaka;Ljava/util/Map;)V
    .locals 10
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

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzwR:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNX:F

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOa:I

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNY:I

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNZ:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaka;->zzis()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_2

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNY:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOb:I

    iget v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNZ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOc:I

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaka;->zzam()Lcom/google/android/gms/internal/zziv;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zziv;->zzAt:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNY:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOd:I

    iget v0, p0, Lcom/google/android/gms/internal/zzwt;->zzNZ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOe:I

    :goto_1
    iget v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNY:I

    iget v2, p0, Lcom/google/android/gms/internal/zzwt;->zzNZ:I

    iget v3, p0, Lcom/google/android/gms/internal/zzwt;->zzOb:I

    iget v4, p0, Lcom/google/android/gms/internal/zzwt;->zzOc:I

    iget v5, p0, Lcom/google/android/gms/internal/zzwt;->zzNX:F

    iget v6, p0, Lcom/google/android/gms/internal/zzwt;->zzOa:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzwt;->zza(IIIIFI)V

    new-instance v0, Lcom/google/android/gms/internal/zzws;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzws;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNW:Lcom/google/android/gms/internal/zzlz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlz;->zzdE()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzws;->zzm(Z)Lcom/google/android/gms/internal/zzws;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNW:Lcom/google/android/gms/internal/zzlz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlz;->zzdF()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzws;->zzl(Z)Lcom/google/android/gms/internal/zzws;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNW:Lcom/google/android/gms/internal/zzlz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlz;->zzdH()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzws;->zzn(Z)Lcom/google/android/gms/internal/zzws;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzNW:Lcom/google/android/gms/internal/zzlz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlz;->zzdG()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzws;->zzo(Z)Lcom/google/android/gms/internal/zzws;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/google/android/gms/internal/zzws;->zzp(Z)Lcom/google/android/gms/internal/zzws;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzwq;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/zzwq;-><init>(Lcom/google/android/gms/internal/zzws;Lcom/google/android/gms/internal/zzwr;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    const-string v2, "onDeviceFeaturesReceived"

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzwq;->toJson()Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lcom/google/android/gms/internal/zzaka;->zzb(Ljava/lang/String;Lorg/json/JSONObject;)V

    new-array v0, v9, [I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzaka;->getLocationOnScreen([I)V

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    aget v2, v0, v7

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zzd(Landroid/content/Context;I)I

    move-result v1

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    aget v0, v0, v8

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzaiy;->zzd(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzwt;->zzc(II)V

    invoke-static {v9}, Lcom/google/android/gms/internal/zzafr;->zzz(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "Dispatching Ready Event."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzafr;->zzaS(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaka;->zziz()Lcom/google/android/gms/internal/zzaje;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaje;->zzaP:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzwt;->zzao(Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbz()Lcom/google/android/gms/internal/zzagz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzagz;->zzf(Landroid/app/Activity;)[I

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    aget v2, v0, v7

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzwt;->zzOb:I

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzxF:Landroid/util/DisplayMetrics;

    aget v0, v0, v8

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzaiy;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzwt;->zzOc:I

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0, v7, v7}, Lcom/google/android/gms/internal/zzaka;->measure(II)V

    goto/16 :goto_1
.end method

.method public final zzc(II)V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbz()Lcom/google/android/gms/internal/zzagz;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzagz;->zzh(Landroid/app/Activity;)[I

    move-result-object v0

    aget v0, v0, v1

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaka;->zzam()Lcom/google/android/gms/internal/zziv;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaka;->zzam()Lcom/google/android/gms/internal/zziv;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/internal/zziv;->zzAt:Z

    if-nez v1, :cond_1

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaka;->getWidth()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zzd(Landroid/content/Context;I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzwt;->zzOd:I

    invoke-static {}, Lcom/google/android/gms/internal/zzji;->zzds()Lcom/google/android/gms/internal/zzaiy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzwt;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaka;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zzd(Landroid/content/Context;I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzwt;->zzOe:I

    :cond_1
    sub-int v0, p2, v0

    iget v1, p0, Lcom/google/android/gms/internal/zzwt;->zzOd:I

    iget v2, p0, Lcom/google/android/gms/internal/zzwt;->zzOe:I

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzwt;->zzc(IIII)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzwt;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaka;->zziw()Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzakb;->zzb(II)V

    return-void

    :cond_2
    move v0, v1

    goto :goto_0
.end method
