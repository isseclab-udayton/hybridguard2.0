.class final Lcom/google/zxing/client/android/wifi/NetworkSetting;
.super Ljava/lang/Object;
.source "NetworkSetting.java"


# instance fields
.field private final networkType:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

.field private final password:Ljava/lang/String;

.field private final ssid:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;)V
    .locals 0
    .param p1, "ssid"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "networkType"    # Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->ssid:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->password:Ljava/lang/String;

    .line 44
    iput-object p3, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->networkType:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .line 45
    return-void
.end method


# virtual methods
.method getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->networkType:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    return-object v0
.end method

.method getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->password:Ljava/lang/String;

    return-object v0
.end method

.method getSsid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/NetworkSetting;->ssid:Ljava/lang/String;

    return-object v0
.end method
