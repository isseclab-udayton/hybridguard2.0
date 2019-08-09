.class public Lorg/apache/cordova/vibration/Vibration;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Vibration.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 37
    return-void
.end method


# virtual methods
.method public cancelVibration()V
    .locals 3

    .prologue
    .line 123
    iget-object v1, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 124
    .local v0, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 125
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

    .line 48
    const-string v6, "vibrate"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 49
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    invoke-virtual {p0, v6, v7}, Lorg/apache/cordova/vibration/Vibration;->vibrate(J)V

    .line 70
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    move v4, v5

    .line 72
    :cond_0
    return v4

    .line 51
    :cond_1
    const-string v6, "vibrateWithPattern"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 52
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    .line 53
    .local v1, "pattern":Lorg/json/JSONArray;
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    .line 55
    .local v3, "repeat":I
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    new-array v2, v6, [J

    .line 56
    .local v2, "patternArray":[J
    const-wide/16 v6, 0x0

    aput-wide v6, v2, v4

    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v0, v4, :cond_2

    .line 60
    invoke-virtual {p0, v2, v3}, Lorg/apache/cordova/vibration/Vibration;->vibrateWithPattern([JI)V

    goto :goto_0

    .line 58
    :cond_2
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    aput-wide v6, v2, v4

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 62
    .end local v0    # "i":I
    .end local v1    # "pattern":Lorg/json/JSONArray;
    .end local v2    # "patternArray":[J
    .end local v3    # "repeat":I
    :cond_3
    const-string v6, "cancelVibration"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 63
    invoke-virtual {p0}, Lorg/apache/cordova/vibration/Vibration;->cancelVibration()V

    goto :goto_0
.end method

.method public vibrate(J)V
    .locals 5
    .param p1, "time"    # J

    .prologue
    .line 86
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-nez v1, :cond_0

    .line 87
    const-wide/16 p1, 0x1f4

    .line 89
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 90
    .local v0, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 91
    return-void
.end method

.method public vibrateWithPattern([JI)V
    .locals 3
    .param p1, "pattern"    # [J
    .param p2, "repeat"    # I

    .prologue
    .line 115
    iget-object v1, p0, Lorg/apache/cordova/vibration/Vibration;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 116
    .local v0, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 117
    return-void
.end method
