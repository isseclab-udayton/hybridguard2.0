.class public final enum Lcom/arellomobile/android/push/preference/VibrateType;
.super Ljava/lang/Enum;
.source "VibrateType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/arellomobile/android/push/preference/VibrateType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ALWAYS:Lcom/arellomobile/android/push/preference/VibrateType;

.field public static final enum DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

.field private static final synthetic ENUM$VALUES:[Lcom/arellomobile/android/push/preference/VibrateType;

.field public static final enum NO_VIBRATE:Lcom/arellomobile/android/push/preference/VibrateType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/arellomobile/android/push/preference/VibrateType;

    const-string v1, "DEFAULT_MODE"

    invoke-direct {v0, v1, v2, v2}, Lcom/arellomobile/android/push/preference/VibrateType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

    new-instance v0, Lcom/arellomobile/android/push/preference/VibrateType;

    const-string v1, "NO_VIBRATE"

    invoke-direct {v0, v1, v3, v3}, Lcom/arellomobile/android/push/preference/VibrateType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->NO_VIBRATE:Lcom/arellomobile/android/push/preference/VibrateType;

    new-instance v0, Lcom/arellomobile/android/push/preference/VibrateType;

    const-string v1, "ALWAYS"

    invoke-direct {v0, v1, v4, v4}, Lcom/arellomobile/android/push/preference/VibrateType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->ALWAYS:Lcom/arellomobile/android/push/preference/VibrateType;

    .line 15
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/arellomobile/android/push/preference/VibrateType;

    sget-object v1, Lcom/arellomobile/android/push/preference/VibrateType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/arellomobile/android/push/preference/VibrateType;->NO_VIBRATE:Lcom/arellomobile/android/push/preference/VibrateType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/arellomobile/android/push/preference/VibrateType;->ALWAYS:Lcom/arellomobile/android/push/preference/VibrateType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->ENUM$VALUES:[Lcom/arellomobile/android/push/preference/VibrateType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 21
    iput p3, p0, Lcom/arellomobile/android/push/preference/VibrateType;->value:I

    .line 22
    return-void
.end method

.method public static fromInt(I)Lcom/arellomobile/android/push/preference/VibrateType;
    .locals 1
    .param p0, "x"    # I

    .prologue
    .line 29
    packed-switch p0, :pswitch_data_0

    .line 37
    sget-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

    :goto_0
    return-object v0

    .line 31
    :pswitch_0
    sget-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->DEFAULT_MODE:Lcom/arellomobile/android/push/preference/VibrateType;

    goto :goto_0

    .line 33
    :pswitch_1
    sget-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->NO_VIBRATE:Lcom/arellomobile/android/push/preference/VibrateType;

    goto :goto_0

    .line 35
    :pswitch_2
    sget-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->ALWAYS:Lcom/arellomobile/android/push/preference/VibrateType;

    goto :goto_0

    .line 29
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/arellomobile/android/push/preference/VibrateType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/arellomobile/android/push/preference/VibrateType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/arellomobile/android/push/preference/VibrateType;

    return-object v0
.end method

.method public static values()[Lcom/arellomobile/android/push/preference/VibrateType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/arellomobile/android/push/preference/VibrateType;->ENUM$VALUES:[Lcom/arellomobile/android/push/preference/VibrateType;

    array-length v1, v0

    new-array v2, v1, [Lcom/arellomobile/android/push/preference/VibrateType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/arellomobile/android/push/preference/VibrateType;->value:I

    return v0
.end method
