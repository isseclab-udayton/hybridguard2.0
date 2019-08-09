.class public abstract Lde/appplant/cordova/plugin/notification/AbstractClickActivity;
.super Landroid/app/Activity;
.source "AbstractClickActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;
.end method

.method public launchApp()V
    .locals 4

    .prologue
    .line 90
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/AbstractClickActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 91
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 94
    .local v2, "pkgName":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 95
    invoke-virtual {v3, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 98
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x20020000

    .line 97
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 100
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 101
    return-void
.end method

.method public abstract onClick(Lde/appplant/cordova/plugin/notification/Notification;)V
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/AbstractClickActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 51
    .local v5, "intent":Landroid/content/Intent;
    invoke-virtual {v5}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 52
    .local v1, "bundle":Landroid/os/Bundle;
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/AbstractClickActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 55
    .local v2, "context":Landroid/content/Context;
    :try_start_0
    const-string v8, "NOTIFICATION_OPTIONS"

    invoke-virtual {v1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "data":Ljava/lang/String;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 59
    .local v7, "options":Lorg/json/JSONObject;
    new-instance v0, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v0, v2, v7}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 62
    .local v0, "builder":Lde/appplant/cordova/plugin/notification/Builder;
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/AbstractClickActivity;->buildNotification(Lde/appplant/cordova/plugin/notification/Builder;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v6

    .line 64
    .local v6, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {p0, v6}, Lde/appplant/cordova/plugin/notification/AbstractClickActivity;->onClick(Lde/appplant/cordova/plugin/notification/Notification;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "builder":Lde/appplant/cordova/plugin/notification/Builder;
    .end local v3    # "data":Ljava/lang/String;
    .end local v6    # "notification":Lde/appplant/cordova/plugin/notification/Notification;
    .end local v7    # "options":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v4

    .line 66
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
