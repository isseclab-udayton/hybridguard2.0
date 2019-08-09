.class public final Lcom/google/android/gms/internal/zzya;
.super Lcom/google/android/gms/internal/zzafp;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzzn;
.end annotation


# instance fields
.field private final zzQP:Lcom/google/android/gms/internal/zzxy;

.field private final zzQQ:Lcom/google/android/gms/internal/zzafg;

.field private final zzQR:Lcom/google/android/gms/internal/zzaai;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzafg;Lcom/google/android/gms/internal/zzxy;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzafp;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXY:Lcom/google/android/gms/internal/zzaai;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzya;->zzQP:Lcom/google/android/gms/internal/zzxy;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzya;)Lcom/google/android/gms/internal/zzxy;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzya;->zzQP:Lcom/google/android/gms/internal/zzxy;

    return-object v0
.end method


# virtual methods
.method public final onStop()V
    .locals 0

    return-void
.end method

.method public final zzbd()V
    .locals 40

    new-instance v2, Lcom/google/android/gms/internal/zzaff;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzafg;->zzUj:Lcom/google/android/gms/internal/zzaae;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzaae;->zzSz:Lcom/google/android/gms/internal/zzir;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget v9, v9, Lcom/google/android/gms/internal/zzaai;->orientation:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    iget-wide v10, v10, Lcom/google/android/gms/internal/zzaai;->zzMg:J

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    iget-object v12, v12, Lcom/google/android/gms/internal/zzafg;->zzUj:Lcom/google/android/gms/internal/zzaae;

    iget-object v12, v12, Lcom/google/android/gms/internal/zzaae;->zzSC:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTp:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzvX:Lcom/google/android/gms/internal/zziv;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTn:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXR:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTs:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQR:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTt:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXL:Lorg/json/JSONObject;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXY:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTG:Z

    move/from16 v34, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXY:Lcom/google/android/gms/internal/zzaai;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaai;->zzTH:Lcom/google/android/gms/internal/zzaak;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzya;->zzQQ:Lcom/google/android/gms/internal/zzafg;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-object v0, v0, Lcom/google/android/gms/internal/zzafg;->zzXX:Lcom/google/android/gms/internal/zzig;

    move-object/from16 v39, v0

    invoke-direct/range {v2 .. v39}, Lcom/google/android/gms/internal/zzaff;-><init>(Lcom/google/android/gms/internal/zzir;Lcom/google/android/gms/internal/zzaka;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzua;Lcom/google/android/gms/internal/zzut;Ljava/lang/String;Lcom/google/android/gms/internal/zzub;Lcom/google/android/gms/internal/zzud;JLcom/google/android/gms/internal/zziv;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzoa;Lcom/google/android/gms/internal/zzaee;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/internal/zzaak;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/internal/zzig;)V

    sget-object v3, Lcom/google/android/gms/internal/zzagz;->zzZr:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzyb;

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v2}, Lcom/google/android/gms/internal/zzyb;-><init>(Lcom/google/android/gms/internal/zzya;Lcom/google/android/gms/internal/zzaff;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
