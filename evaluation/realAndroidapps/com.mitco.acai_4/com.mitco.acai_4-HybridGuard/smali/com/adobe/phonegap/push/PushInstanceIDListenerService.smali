.class public Lcom/adobe/phonegap/push/PushInstanceIDListenerService;
.super Lcom/google/android/gms/iid/InstanceIDListenerService;
.source "PushInstanceIDListenerService.java"

# interfaces
.implements Lcom/adobe/phonegap/push/PushConstants;


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "PushPlugin_PushInstanceIDListenerService"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;-><init>()V

    return-void
.end method


# virtual methods
.method public onTokenRefresh()V
    .locals 6

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/adobe/phonegap/push/PushInstanceIDListenerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "com.adobe.phonegap.push"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 21
    .local v2, "sharedPref":Landroid/content/SharedPreferences;
    const-string v3, "senderID"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 22
    .local v1, "senderID":Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 23
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/adobe/phonegap/push/RegistrationIntentService;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/adobe/phonegap/push/PushInstanceIDListenerService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 26
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method
