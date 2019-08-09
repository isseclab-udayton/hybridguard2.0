.class public final enum Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
.super Ljava/lang/Enum;
.source "WifiActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/wifi/WifiActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

.field public static final enum NETWORK_INVALID:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

.field public static final enum NETWORK_NOPASS:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

.field public static final enum NETWORK_WEP:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

.field public static final enum NETWORK_WPA:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    const-string v1, "NETWORK_WEP"

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WEP:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    new-instance v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    const-string v1, "NETWORK_WPA"

    invoke-direct {v0, v1, v3}, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WPA:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    new-instance v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    const-string v1, "NETWORK_NOPASS"

    invoke-direct {v0, v1, v4}, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_NOPASS:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    new-instance v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    const-string v1, "NETWORK_INVALID"

    invoke-direct {v0, v1, v5}, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_INVALID:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .line 65
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WEP:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WPA:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_NOPASS:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_INVALID:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->ENUM$VALUES:[Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    return-object v0
.end method

.method public static values()[Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->ENUM$VALUES:[Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    array-length v1, v0

    new-array v2, v1, [Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
