.class public final Lcom/google/zxing/client/android/wifi/WifiActivity;
.super Landroid/app/Activity;
.source "WifiActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    }
.end annotation


# static fields
.field private static final FAILURE_NO_NETWORK_ID:I = -0x1

.field private static final HEX_DIGITS_64:Ljava/util/regex/Pattern;

.field private static final MAX_ERROR_COUNT:I = 0x3

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private errorCount:I

.field private mWifiStateFilter:Landroid/content/IntentFilter;

.field private networkId:I

.field private receiverRegistered:Z

.field private statusView:Landroid/widget/TextView;

.field private wifiManager:Landroid/net/wifi/WifiManager;

.field private wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lcom/google/zxing/client/android/wifi/WifiActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    .line 46
    const-string v0, "[0-9A-Fa-f]{64}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity;->HEX_DIGITS_64:Ljava/util/regex/Pattern;

    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private changeNetwork(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I
    .locals 2
    .param p1, "setting"    # Lcom/google/zxing/client/android/wifi/NetworkSetting;

    .prologue
    .line 71
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getSsid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getSsid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 72
    :cond_0
    sget v0, Lcom/google/zxing/client/android/R$string;->wifi_ssid_missing:I

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->doError(I)I

    move-result v0

    .line 88
    :goto_0
    return v0

    .line 75
    :cond_1
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_INVALID:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    if-ne v0, v1, :cond_2

    .line 76
    sget v0, Lcom/google/zxing/client/android/R$string;->wifi_type_incorrect:I

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->doError(I)I

    move-result v0

    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getPassword()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getPassword()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    .line 81
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 82
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_NOPASS:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    if-ne v0, v1, :cond_4

    .line 83
    :cond_3
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkUnEncrypted(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I

    move-result v0

    goto :goto_0

    .line 85
    :cond_4
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WPA:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    if-ne v0, v1, :cond_5

    .line 86
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkWPA(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I

    move-result v0

    goto :goto_0

    .line 88
    :cond_5
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkWEP(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I

    move-result v0

    goto :goto_0
.end method

.method private changeNetworkCommon(Lcom/google/zxing/client/android/wifi/NetworkSetting;)Landroid/net/wifi/WifiConfiguration;
    .locals 4
    .param p1, "input"    # Lcom/google/zxing/client/android/wifi/NetworkSetting;

    .prologue
    .line 108
    iget-object v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    sget v2, Lcom/google/zxing/client/android/R$string;->wifi_creating_network:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 109
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Adding new configuration: \nSSID: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getSsid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 110
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getNetworkType()Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 109
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 113
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 114
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 115
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 116
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 117
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 120
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getSsid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/client/android/wifi/NetworkUtil;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 121
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    .line 122
    return-object v0
.end method

.method private changeNetworkUnEncrypted(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I
    .locals 4
    .param p1, "input"    # Lcom/google/zxing/client/android/wifi/NetworkSetting;

    .prologue
    const/4 v3, 0x0

    .line 174
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    const-string v2, "Empty password prompting a simple account setting"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkCommon(Lcom/google/zxing/client/android/wifi/NetworkSetting;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 176
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    const-string v2, ""

    aput-object v2, v1, v3

    .line 177
    iget-object v1, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 178
    iput v3, v0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    .line 179
    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->requestNetworkChange(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    return v1
.end method

.method private changeNetworkWEP(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I
    .locals 6
    .param p1, "input"    # Lcom/google/zxing/client/android/wifi/NetworkSetting;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 132
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkCommon(Lcom/google/zxing/client/android/wifi/NetworkSetting;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 133
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getPassword()Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "pass":Ljava/lang/String;
    invoke-static {v1}, Lcom/google/zxing/client/android/wifi/NetworkUtil;->isHexWepKey(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aput-object v1, v2, v4

    .line 139
    :goto_0
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    .line 140
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 141
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 142
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 143
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    .line 144
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 145
    iput v4, v0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    .line 146
    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->requestNetworkChange(Landroid/net/wifi/WifiConfiguration;)I

    move-result v2

    return v2

    .line 137
    :cond_0
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/android/wifi/NetworkUtil;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    goto :goto_0
.end method

.method private changeNetworkWPA(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I
    .locals 6
    .param p1, "input"    # Lcom/google/zxing/client/android/wifi/NetworkSetting;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 151
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetworkCommon(Lcom/google/zxing/client/android/wifi/NetworkSetting;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 152
    .local v0, "config":Landroid/net/wifi/WifiConfiguration;
    invoke-virtual {p1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;->getPassword()Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "pass":Ljava/lang/String;
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiActivity;->HEX_DIGITS_64:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 155
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    const-string v3, "A 64 bit hex password entered."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    .line 161
    :goto_0
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 163
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->set(I)V

    .line 165
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    .line 166
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 167
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 168
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    .line 169
    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->requestNetworkChange(Landroid/net/wifi/WifiConfiguration;)I

    move-result v2

    return v2

    .line 158
    :cond_0
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    const-string v3, "A normal password entered: I am quoting it."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-static {v1}, Lcom/google/zxing/client/android/wifi/NetworkUtil;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_0
.end method

.method private doError(I)I
    .locals 3
    .param p1, "resource_string"    # I

    .prologue
    const/4 v2, -0x1

    .line 93
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 95
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 96
    iget v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    if-lez v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    iget v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    .line 98
    iput v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    .line 100
    :cond_0
    iget-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    if-eqz v0, :cond_1

    .line 101
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    .line 104
    :cond_1
    return v2
.end method

.method private findNetworkInExistingConfig(Ljava/lang/String;)Landroid/net/wifi/WifiConfiguration;
    .locals 4
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    .line 189
    .local v1, "existingConfigs":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 194
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 189
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiConfiguration;

    .line 190
    .local v0, "existingConfig":Landroid/net/wifi/WifiConfiguration;
    iget-object v3, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0
.end method

.method private requestNetworkChange(Landroid/net/wifi/WifiConfiguration;)I
    .locals 2
    .param p1, "config"    # Landroid/net/wifi/WifiConfiguration;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    sget v1, Lcom/google/zxing/client/android/R$string;->wifi_changing_network:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 127
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->updateNetwork(Landroid/net/wifi/WifiConfiguration;Z)I

    move-result v0

    return v0
.end method

.method private updateNetwork(Landroid/net/wifi/WifiConfiguration;Z)I
    .locals 5
    .param p1, "config"    # Landroid/net/wifi/WifiConfiguration;
    .param p2, "disableOthers"    # Z

    .prologue
    const/4 v1, -0x1

    .line 285
    iget-object v2, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/google/zxing/client/android/wifi/WifiActivity;->findNetworkInExistingConfig(Ljava/lang/String;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 286
    .local v0, "found":Landroid/net/wifi/WifiConfiguration;
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 287
    if-nez v0, :cond_0

    .line 288
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    sget v3, Lcom/google/zxing/client/android/R$string;->wifi_creating_network:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 295
    :goto_0
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2, p1}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v2

    iput v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    .line 296
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Inserted/Modified network "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    iget v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    if-gez v2, :cond_1

    .line 308
    :goto_1
    return v1

    .line 290
    :cond_0
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    sget v3, Lcom/google/zxing/client/android/R$string;->wifi_modifying_network:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 291
    sget-object v2, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Removing network "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    iget v3, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {v2, v3}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    .line 293
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    goto :goto_0

    .line 302
    :cond_1
    iget-object v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    iget v3, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    invoke-virtual {v2, v3, p2}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    move-result v2

    if-nez v2, :cond_2

    .line 303
    iput v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    goto :goto_1

    .line 306
    :cond_2
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    .line 307
    iget-object v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->reassociate()Z

    .line 308
    iget v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->networkId:I

    goto :goto_1
.end method


# virtual methods
.method gotError()V
    .locals 3

    .prologue
    .line 57
    iget v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    .line 58
    sget-object v0, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Encountered another error.  Errorcount = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    const/4 v1, 0x3

    if-le v0, v1, :cond_0

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->errorCount:I

    .line 61
    sget v0, Lcom/google/zxing/client/android/R$string;->wifi_connect_failed:I

    invoke-direct {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->doError(I)I

    .line 63
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    .line 199
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 201
    invoke-virtual {p0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 202
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    const-string v7, "com.google.zxing.client.android.WIFI_CONNECT"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 203
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->finish()V

    .line 246
    :goto_0
    return-void

    .line 207
    :cond_1
    const-string v6, "SSID"

    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 208
    .local v5, "ssid":Ljava/lang/String;
    const-string v6, "PASSWORD"

    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 209
    .local v3, "password":Ljava/lang/String;
    const-string v6, "TYPE"

    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "networkType":Ljava/lang/String;
    sget v6, Lcom/google/zxing/client/android/R$layout;->network:I

    invoke-virtual {p0, v6}, Lcom/google/zxing/client/android/wifi/WifiActivity;->setContentView(I)V

    .line 211
    sget v6, Lcom/google/zxing/client/android/R$id;->networkStatus:I

    invoke-virtual {p0, v6}, Lcom/google/zxing/client/android/wifi/WifiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    .line 214
    const-string v6, "WPA"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 215
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WPA:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .line 225
    .local v1, "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    :goto_1
    const-string v6, "wifi"

    invoke-virtual {p0, v6}, Lcom/google/zxing/client/android/wifi/WifiActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    iput-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 227
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, v9}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 230
    new-instance v6, Lcom/google/zxing/client/android/wifi/WifiReceiver;

    iget-object v7, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    iget-object v8, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->statusView:Landroid/widget/TextView;

    invoke-direct {v6, v7, p0, v8, v5}, Lcom/google/zxing/client/android/wifi/WifiReceiver;-><init>(Landroid/net/wifi/WifiManager;Lcom/google/zxing/client/android/wifi/WifiActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    iput-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    .line 233
    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    .line 234
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    const-string v7, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 235
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 236
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 237
    iget-object v6, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    iget-object v7, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v6, v7}, Lcom/google/zxing/client/android/wifi/WifiActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 238
    iput-boolean v9, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    .line 240
    if-nez v3, :cond_2

    .line 241
    const-string v3, ""

    .line 243
    :cond_2
    sget-object v6, Lcom/google/zxing/client/android/wifi/WifiActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Adding new configuration: \nSSID: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    new-instance v4, Lcom/google/zxing/client/android/wifi/NetworkSetting;

    invoke-direct {v4, v5, v3, v1}, Lcom/google/zxing/client/android/wifi/NetworkSetting;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;)V

    .line 245
    .local v4, "setting":Lcom/google/zxing/client/android/wifi/NetworkSetting;
    invoke-direct {p0, v4}, Lcom/google/zxing/client/android/wifi/WifiActivity;->changeNetwork(Lcom/google/zxing/client/android/wifi/NetworkSetting;)I

    goto/16 :goto_0

    .line 216
    .end local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    .end local v4    # "setting":Lcom/google/zxing/client/android/wifi/NetworkSetting;
    :cond_3
    const-string v6, "WEP"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 217
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_WEP:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .restart local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    goto :goto_1

    .line 218
    .end local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    :cond_4
    const-string v6, "nopass"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 219
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_NOPASS:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .restart local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    goto/16 :goto_1

    .line 221
    .end local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    :cond_5
    sget-object v1, Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;->NETWORK_INVALID:Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;

    .restart local v1    # "networkT":Lcom/google/zxing/client/android/wifi/WifiActivity$NetworkType;
    goto/16 :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    if-eqz v0, :cond_1

    .line 269
    iget-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 271
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    .line 273
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    .line 275
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 276
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 250
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 251
    iget-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/wifi/WifiActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 253
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    .line 255
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 259
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 260
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    if-nez v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->wifiReceiver:Lcom/google/zxing/client/android/wifi/WifiReceiver;

    iget-object v1, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->mWifiStateFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/client/android/wifi/WifiActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 262
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/client/android/wifi/WifiActivity;->receiverRegistered:Z

    .line 264
    :cond_0
    return-void
.end method
