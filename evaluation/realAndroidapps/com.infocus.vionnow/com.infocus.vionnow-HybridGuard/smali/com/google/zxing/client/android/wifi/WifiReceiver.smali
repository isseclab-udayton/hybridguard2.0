.class final Lcom/google/zxing/client/android/wifi/WifiReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WifiReceiver.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mWifiManager:Landroid/net/wifi/WifiManager;

.field private final parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

.field private final statusView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/google/zxing/client/android/wifi/WifiReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->TAG:Ljava/lang/String;

    .line 34
    return-void
.end method

.method constructor <init>(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/android/wifi/WifiActivity;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .param p1, "wifiManager"    # Landroid/net/wifi/WifiManager;
    .param p2, "wifiActivity"    # Lcom/google/zxing/client/android/wifi/WifiActivity;
    .param p3, "statusView"    # Landroid/widget/TextView;
    .param p4, "ssid"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    .line 46
    iput-object p3, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->statusView:Landroid/widget/TextView;

    .line 47
    iput-object p1, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 48
    return-void
.end method

.method private handleChange(Landroid/net/wifi/SupplicantState;Z)V
    .locals 2
    .param p1, "state"    # Landroid/net/wifi/SupplicantState;
    .param p2, "hasError"    # Z

    .prologue
    .line 93
    if-nez p2, :cond_0

    sget-object v0, Landroid/net/wifi/SupplicantState;->INACTIVE:Landroid/net/wifi/SupplicantState;

    if-ne p1, v0, :cond_1

    .line 94
    :cond_0
    sget-object v0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->TAG:Ljava/lang/String;

    const-string v1, "Found an error"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->gotError()V

    .line 97
    :cond_1
    return-void
.end method

.method private handleNetworkStateChanged(Landroid/net/NetworkInfo;)V
    .locals 3
    .param p1, "networkInfo"    # Landroid/net/NetworkInfo;

    .prologue
    .line 85
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    .line 86
    .local v0, "state":Landroid/net/NetworkInfo$DetailedState;
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->FAILED:Landroid/net/NetworkInfo$DetailedState;

    if-ne v0, v1, :cond_0

    .line 87
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiReceiver;->TAG:Ljava/lang/String;

    const-string v2, "Detailed Network state failed"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iget-object v1, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->gotError()V

    .line 90
    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 52
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 54
    const-string v7, "newState"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/SupplicantState;

    .line 55
    const-string v8, "supplicantError"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v8

    .line 53
    invoke-direct {p0, v7, v8}, Lcom/google/zxing/client/android/wifi/WifiReceiver;->handleChange(Landroid/net/wifi/SupplicantState;Z)V

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 58
    const-string v7, "networkInfo"

    .line 57
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Landroid/net/NetworkInfo;

    invoke-direct {p0, v7}, Lcom/google/zxing/client/android/wifi/WifiReceiver;->handleNetworkStateChanged(Landroid/net/NetworkInfo;)V

    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 60
    iget-object v7, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    .line 61
    const-string v8, "connectivity"

    .line 60
    invoke-virtual {v7, v8}, Lcom/google/zxing/client/android/wifi/WifiActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 62
    .local v0, "con":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v4

    .line 63
    .local v4, "s":[Landroid/net/NetworkInfo;
    array-length v8, v4

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v8, :cond_0

    aget-object v2, v4, v7

    .line 64
    .local v2, "i":Landroid/net/NetworkInfo;
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "WIFI"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 65
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    .line 66
    .local v6, "state":Landroid/net/NetworkInfo$State;
    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v9}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v5

    .line 68
    .local v5, "ssid":Ljava/lang/String;
    sget-object v9, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v6, v9, :cond_3

    if-eqz v5, :cond_3

    .line 69
    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v9}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 70
    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    sget v10, Lcom/google/zxing/client/android/R$string;->wifi_connected:I

    invoke-virtual {v9, v10}, Lcom/google/zxing/client/android/wifi/WifiActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 71
    .local v3, "label":Ljava/lang/String;
    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->statusView:Landroid/widget/TextView;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v11, 0xa

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    new-instance v1, Lcom/google/zxing/client/android/wifi/Killer;

    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    invoke-direct {v1, v9}, Lcom/google/zxing/client/android/wifi/Killer;-><init>(Landroid/app/Activity;)V

    .line 73
    .local v1, "delayKill":Ljava/lang/Runnable;
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 75
    .end local v1    # "delayKill":Ljava/lang/Runnable;
    .end local v3    # "label":Ljava/lang/String;
    :cond_3
    sget-object v9, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v6, v9, :cond_4

    .line 76
    sget-object v9, Lcom/google/zxing/client/android/wifi/WifiReceiver;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Got state Disconnected for ssid: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v9, p0, Lcom/google/zxing/client/android/wifi/WifiReceiver;->parent:Lcom/google/zxing/client/android/wifi/WifiActivity;

    invoke-virtual {v9}, Lcom/google/zxing/client/android/wifi/WifiActivity;->gotError()V

    .line 63
    .end local v5    # "ssid":Ljava/lang/String;
    .end local v6    # "state":Landroid/net/NetworkInfo$State;
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1
.end method
