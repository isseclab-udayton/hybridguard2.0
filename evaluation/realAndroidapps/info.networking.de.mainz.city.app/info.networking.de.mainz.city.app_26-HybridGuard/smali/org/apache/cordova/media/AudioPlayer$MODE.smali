.class public final enum Lorg/apache/cordova/media/AudioPlayer$MODE;
.super Ljava/lang/Enum;
.source "AudioPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/media/AudioPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MODE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/apache/cordova/media/AudioPlayer$MODE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/apache/cordova/media/AudioPlayer$MODE;

.field public static final enum NONE:Lorg/apache/cordova/media/AudioPlayer$MODE;

.field public static final enum PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

.field public static final enum RECORD:Lorg/apache/cordova/media/AudioPlayer$MODE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 49
    new-instance v0, Lorg/apache/cordova/media/AudioPlayer$MODE;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/media/AudioPlayer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->NONE:Lorg/apache/cordova/media/AudioPlayer$MODE;

    new-instance v0, Lorg/apache/cordova/media/AudioPlayer$MODE;

    const-string v1, "PLAY"

    invoke-direct {v0, v1, v3}, Lorg/apache/cordova/media/AudioPlayer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    new-instance v0, Lorg/apache/cordova/media/AudioPlayer$MODE;

    const-string v1, "RECORD"

    invoke-direct {v0, v1, v4}, Lorg/apache/cordova/media/AudioPlayer$MODE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->RECORD:Lorg/apache/cordova/media/AudioPlayer$MODE;

    const/4 v0, 0x3

    new-array v0, v0, [Lorg/apache/cordova/media/AudioPlayer$MODE;

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$MODE;->NONE:Lorg/apache/cordova/media/AudioPlayer$MODE;

    aput-object v1, v0, v2

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$MODE;->PLAY:Lorg/apache/cordova/media/AudioPlayer$MODE;

    aput-object v1, v0, v3

    sget-object v1, Lorg/apache/cordova/media/AudioPlayer$MODE;->RECORD:Lorg/apache/cordova/media/AudioPlayer$MODE;

    aput-object v1, v0, v4

    sput-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->ENUM$VALUES:[Lorg/apache/cordova/media/AudioPlayer$MODE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/cordova/media/AudioPlayer$MODE;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/media/AudioPlayer$MODE;

    return-object v0
.end method

.method public static values()[Lorg/apache/cordova/media/AudioPlayer$MODE;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/apache/cordova/media/AudioPlayer$MODE;->ENUM$VALUES:[Lorg/apache/cordova/media/AudioPlayer$MODE;

    array-length v1, v0

    new-array v2, v1, [Lorg/apache/cordova/media/AudioPlayer$MODE;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
