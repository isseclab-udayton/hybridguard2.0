.class public final Lcom/google/android/gms/internal/zzazu;
.super Lcom/google/android/gms/common/internal/safeparcel/zza;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/internal/zzazu;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzazA:Z

.field public final zzazB:Lcom/google/android/gms/internal/aej;

.field public zzazE:Lcom/google/android/gms/internal/zzbak;

.field public zzazF:[B

.field private zzazG:[I

.field private zzazH:[Ljava/lang/String;

.field private zzazI:[I

.field private zzazJ:[[B

.field private zzazK:[Lcom/google/android/gms/internal/zzcqn;

.field public final zzazL:Lcom/google/android/gms/internal/zzazr;

.field public final zzazu:Lcom/google/android/gms/internal/zzazr;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzazv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzazv;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzazu;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzbak;Lcom/google/android/gms/internal/aej;Lcom/google/android/gms/internal/zzazr;Lcom/google/android/gms/internal/zzazr;[I[Ljava/lang/String;[I[[B[Lcom/google/android/gms/internal/zzcqn;Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    iput-boolean p10, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzbak;[B[I[Ljava/lang/String;[I[[BZ[Lcom/google/android/gms/internal/zzcqn;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    iput-object p3, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    iput-object p4, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    iput-object p6, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    iput-object p8, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    iput-boolean p7, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzazu;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/google/android/gms/internal/zzazu;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/zzbe;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/zzbe;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/zzbe;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    invoke-static {v2, v3}, Lcom/google/android/gms/common/internal/zzbe;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    if-eq v2, v3, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public final hashCode()I
    .locals 3

    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LogEventParcelable["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", LogEventBytes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", TestCodes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", MendelPackages: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", LogEvent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazB:Lcom/google/android/gms/internal/aej;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ExtensionProducer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazu:Lcom/google/android/gms/internal/zzazr;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", VeProducer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazL:Lcom/google/android/gms/internal/zzazr;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ExperimentIDs: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ExperimentTokens: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ExperimentTokensParcelables: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", AddPhenotypeExperimentTokens: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>([B)V

    goto/16 :goto_0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zze(Landroid/os/Parcel;)I

    move-result v0

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazE:Lcom/google/android/gms/internal/zzbak;

    invoke-static {p1, v1, v2, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazF:[B

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[BZ)V

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazG:[I

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[IZ)V

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazH:[Ljava/lang/String;

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazI:[I

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[IZ)V

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazJ:[[B

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[[BZ)V

    const/16 v1, 0x8

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazA:Z

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;IZ)V

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/google/android/gms/internal/zzazu;->zzazK:[Lcom/google/android/gms/internal/zzcqn;

    invoke-static {p1, v1, v2, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;IZ)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/zzd;->zzI(Landroid/os/Parcel;I)V

    return-void
.end method
