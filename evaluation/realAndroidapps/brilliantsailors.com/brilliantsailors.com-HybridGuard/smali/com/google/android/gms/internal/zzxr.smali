.class public abstract Lcom/google/android/gms/internal/zzxr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzahp;
.implements Lcom/google/android/gms/internal/zzakf;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzahp",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/google/android/gms/internal/zzakf;"
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final zzJH:Lcom/google/android/gms/internal/zzaka;

.field private zzQP:Lcom/google/android/gms/internal/zzxy;

.field private zzQQ:Lcom/google/android/gms/internal/zzafg;

.field protected zzQR:Lcom/google/android/gms/internal/zzaai;

.field private zzQS:Ljava/lang/Runnable;

.field private zzQT:Ljava/lang/Object;

.field private zzQU:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzafg;Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzxy;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQT:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQU:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzxr;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXY:Lcom/google/android/gms/internal/zzaai;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzxr;->zzJH:Lcom/google/android/gms/internal/zzaka;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzxr;->zzQP:Lcom/google/android/gms/internal/zzxy;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzxr;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQU:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQU:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaka;->stopLoading()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbB()Lcom/google/android/gms/internal/zzahe;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzahe;->zzk(Lcom/google/android/gms/internal/zzaka;)Z

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzxr;->zzr(I)V

    sget-object v0, Lcom/google/android/gms/internal/zzagz;->zzZr:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxr;->zzQS:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzaka;Z)V
    .locals 2

    const/4 v0, 0x0

    const-string v1, "WebView finished loading."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzafr;->zzaC(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxr;->zzQU:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    return-void

    :cond_0
    if-eqz p2, :cond_1

    const/4 v0, -0x2

    :cond_1
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzxr;->zzr(I)V

    sget-object v0, Lcom/google/android/gms/internal/zzagz;->zzZr:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzxr;->zzQS:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method protected abstract zzgo()V
.end method

.method public final synthetic zzgp()Ljava/lang/Object;
    .locals 6

    const-string v0, "Webview render task needs to be called on UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzbo;->zzcz(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzxs;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzxs;-><init>(Lcom/google/android/gms/internal/zzxr;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzxr;->zzQS:Ljava/lang/Runnable;

    sget-object v1, Lcom/google/android/gms/internal/zzagz;->zzZr:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzxr;->zzQS:Ljava/lang/Runnable;

    sget-object v0, Lcom/google/android/gms/internal/zzmo;->zzEL:Lcom/google/android/gms/internal/zzme;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzbs;->zzbL()Lcom/google/android/gms/internal/zzmm;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzmm;->zzd(Lcom/google/android/gms/internal/zzme;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzxr;->zzgo()V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected zzr(I)V
    .locals 41

    const/4 v2, -0x2

    move/from16 v0, p1

    if-eq v0, v2, :cond_0

    new-instance v2, Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v4, v3, Lcom/google/android/gms/internal/zzaai;->zzMg:J

    move/from16 v0, p1

    invoke-direct {v2, v0, v4, v5}, Lcom/google/android/gms/internal/zzaai;-><init>(IJ)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzxr;->zzJH:Lcom/google/android/gms/internal/zzaka;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaka;->zzir()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzxr;->zzQP:Lcom/google/android/gms/internal/zzxy;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v6, v2, Lcom/google/android/gms/internal/zzafg;->zzUj:Lcom/google/android/gms/internal/zzaae;

    new-instance v2, Lcom/google/android/gms/internal/zzaff;

    iget-object v3, v6, Lcom/google/android/gms/internal/zzaae;->zzSz:Lcom/google/android/gms/internal/zzir;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/internal/zzxr;->zzJH:Lcom/google/android/gms/internal/zzaka;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzaai;->zzMa:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v7, v7, Lcom/google/android/gms/internal/zzaai;->zzMb:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v8, v8, Lcom/google/android/gms/internal/zzaai;->zzTq:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget v9, v9, Lcom/google/android/gms/internal/zzaai;->orientation:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v10, v10, Lcom/google/android/gms/internal/zzaai;->zzMg:J

    iget-object v12, v6, Lcom/google/android/gms/internal/zzaae;->zzSC:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-boolean v13, v6, Lcom/google/android/gms/internal/zzaai;->zzTo:Z

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTp:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzafg;->zzvX:Lcom/google/android/gms/internal/zziv;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTn:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzafg;->zzXR:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTs:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTt:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzafg;->zzXL:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTD:Lcom/google/android/gms/internal/zzaee;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTE:Ljava/util/List;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTF:Ljava/util/List;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-boolean v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTG:Z

    move/from16 v34, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTH:Lcom/google/android/gms/internal/zzaak;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzMd:Ljava/util/List;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzaai;->zzTK:Ljava/lang/String;

    move-object/from16 v38, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzxr;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, v6, Lcom/google/android/gms/internal/zzafg;->zzXX:Lcom/google/android/gms/internal/zzig;

    move-object/from16 v39, v0

    move/from16 v6, p1

    invoke-direct/range {v2 .. v39}, Lcom/google/android/gms/internal/zzaff;-><init>(Lcom/google/android/gms/internal/zzir;Lcom/google/android/gms/internal/zzaka;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzua;Lcom/google/android/gms/internal/zzut;Ljava/lang/String;Lcom/google/android/gms/internal/zzub;Lcom/google/android/gms/internal/zzud;JLcom/google/android/gms/internal/zziv;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzoa;Lcom/google/android/gms/internal/zzaee;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/internal/zzaak;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/internal/zzig;)V

    move-object/from16 v0, v40

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzxy;->zzb(Lcom/google/android/gms/internal/zzaff;)V

    return-void
.end method
