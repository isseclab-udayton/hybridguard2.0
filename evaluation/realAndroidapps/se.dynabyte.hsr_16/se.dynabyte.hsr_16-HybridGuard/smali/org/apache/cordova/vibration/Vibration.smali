.class public Lorg/apache/cordova/vibration/Vibration;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Vibration.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 38
    return-void
.end method


# virtual methods
.method public cancelVibration()V
    .locals 3

    .prologue
    .line 130
    iget-object v1, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 131
    .local v0, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 132
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 8
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 49
    const-string v6, "vibrate"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 50
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    invoke-virtual {p0, v6, v7}, Lorg/apache/cordova/vibration/Vibration;->vibrate(J)V

    .line 71
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    move v4, v5

    .line 73
    :cond_0
    return v4

    .line 52
    :cond_1
    const-string v6, "vibrateWithPattern"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 53
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    .line 54
    .local v1, "pattern":Lorg/json/JSONArray;
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    .line 56
    .local v3, "repeat":I
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    new-array v2, v6, [J

    .line 57
    .local v2, "patternArray":[J
    const-wide/16 v6, 0x0

    aput-wide v6, v2, v4

    .line 58
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 59
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    aput-wide v6, v2, v4

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 61
    :cond_2
    invoke-virtual {p0, v2, v3}, Lorg/apache/cordova/vibration/Vibration;->vibrateWithPattern([JI)V

    goto :goto_0

    .line 63
    .end local v0    # "i":I
    .end local v1    # "pattern":Lorg/json/JSONArray;
    .end local v2    # "patternArray":[J
    .end local v3    # "repeat":I
    :cond_3
    const-string v6, "cancelVibration"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 64
    invoke-virtual {p0}, Lorg/apache/cordova/vibration/Vibration;->cancelVibration()V

    goto :goto_0
.end method

.method public vibrate(J)V
    .locals 5
    .param p1, "time"    # J

    .prologue
    .line 87
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 88
    const-wide/16 p1, 0x1f4

    .line 90
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 91
    .local v0, "manager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    if-eqz v2, :cond_1

    .line 92
    iget-object v2, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "vibrator"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    .line 93
    .local v1, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v1, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 95
    .end local v1    # "vibrator":Landroid/os/Vibrator;
    :cond_1
    return-void
.end method

.method public vibrateWithPattern([JI)V
    .locals 4
    .param p1, "pattern"    # [J
    .param p2, "repeat"    # I

    .prologue
    .line 119
    iget-object v2, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 120
    .local v0, "manager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v2

    if-eqz v2, :cond_0

    .line 121
    iget-object v2, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "vibrator"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    .line 122
    .local v1, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v1, p1, p2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 124
    .end local v1    # "vibrator":Landroid/os/Vibrator;
    :cond_0
    return-void
.end method
