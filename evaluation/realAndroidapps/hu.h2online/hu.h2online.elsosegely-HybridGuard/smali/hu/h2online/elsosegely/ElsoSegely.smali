.class public Lhu/h2online/elsosegely/ElsoSegely;
.super Lorg/apache/cordova/CordovaActivity;
.source "ElsoSegely.java"


# static fields
.field public static final PREFS_NAME:Ljava/lang/String; = "AlertPrefs"


# instance fields
.field public alertClicked:Ljava/lang/Boolean;

.field public editor:Landroid/content/SharedPreferences$Editor;

.field public localPref:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 209
    iget-object v1, p0, Lhu/h2online/elsosegely/ElsoSegely;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v1, :cond_1

    .line 211
    iget-object v1, p0, Lhu/h2online/elsosegely/ElsoSegely;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v0

    .line 212
    .local v0, "webview":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 213
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    .line 219
    .end local v0    # "webview":Landroid/view/View;
    :goto_0
    return v1

    .line 216
    .restart local v0    # "webview":Landroid/view/View;
    :cond_0
    const/4 v1, 0x1

    goto :goto_0

    .line 219
    .end local v0    # "webview":Landroid/view/View;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    iget-object v0, p0, Lhu/h2online/elsosegely/ElsoSegely;->launchUrl:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lhu/h2online/elsosegely/ElsoSegely;->loadUrl(Ljava/lang/String;)V

    .line 55
    const-string v0, "AlertPrefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lhu/h2online/elsosegely/ElsoSegely;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lhu/h2online/elsosegely/ElsoSegely;->localPref:Landroid/content/SharedPreferences;

    .line 56
	const/4 v2, 0x1
	invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V 
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 60
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0a0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 68
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 73
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 70
    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 71
    const/4 v0, 0x1

    goto :goto_0

    .line 68
    :pswitch_data_0
    .packed-switch 0x7f0b0002
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 112
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onResume()V

    .line 114
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->localPref:Landroid/content/SharedPreferences;

    const-string v10, "startTime"

    invoke-interface {v9, v10, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    .line 115
    .local v7, "startTime":I
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->localPref:Landroid/content/SharedPreferences;

    const-string v10, "alertClicked"

    invoke-interface {v9, v10, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iput-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    .line 117
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->localPref:Landroid/content/SharedPreferences;

    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    iput-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    .line 119
    add-int/lit8 v7, v7, 0x1

    .line 121
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v10, "startTime"

    invoke-interface {v9, v10, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 122
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 125
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string v10, "type"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "intentType":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 127
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string v10, "message"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 128
    .local v3, "intentMessage":Ljava/lang/String;
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string v10, "hiddenMessage"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "intentHiddenMessage":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 131
    invoke-virtual {p0, v3, v2}, Lhu/h2online/elsosegely/ElsoSegely;->showIntentMessageInAlertView(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .end local v2    # "intentHiddenMessage":Ljava/lang/String;
    .end local v3    # "intentMessage":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 137
    .local v6, "manager":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Lhu/h2online/elsosegely/ElsoSegely;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 138
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->localPref:Landroid/content/SharedPreferences;

    const-string v10, "version"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 140
    .local v8, "version":I
    iget v9, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-eq v8, v9, :cond_1

    .line 141
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v10, "version"

    iget v11, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 142
    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iput-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    .line 143
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v10, "alertClicked"

    iget-object v11, p0, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v8    # "version":I
    :cond_1
    :goto_0
    iget-object v9, p0, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-nez v9, :cond_2

    .line 152
    rem-int/lit8 v9, v7, 0xf

    if-nez v9, :cond_2

    .line 154
    const/4 v9, 0x3

    new-array v5, v9, [Ljava/lang/CharSequence;

    const v9, 0x7f080003

    invoke-virtual {p0, v9}, Lhu/h2online/elsosegely/ElsoSegely;->getString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v12

    const/4 v9, 0x1

    const v10, 0x7f080001

    invoke-virtual {p0, v10}, Lhu/h2online/elsosegely/ElsoSegely;->getString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    const/4 v9, 0x2

    const v10, 0x7f080002

    invoke-virtual {p0, v10}, Lhu/h2online/elsosegely/ElsoSegely;->getString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    .line 155
    .local v5, "items":[Ljava/lang/CharSequence;
    new-instance v9, Landroid/app/AlertDialog$Builder;

    invoke-direct {v9, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v10, 0x7f080004

    .line 156
    invoke-virtual {p0, v10}, Lhu/h2online/elsosegely/ElsoSegely;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    new-instance v10, Lhu/h2online/elsosegely/ElsoSegely$2;

    invoke-direct {v10, p0}, Lhu/h2online/elsosegely/ElsoSegely$2;-><init>(Lhu/h2online/elsosegely/ElsoSegely;)V

    .line 157
    invoke-virtual {v9, v5, v10}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    .line 202
    invoke-virtual {v9}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 205
    .end local v5    # "items":[Ljava/lang/CharSequence;
    :cond_2
    return-void

    .line 146
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public showIntentMessageInAlertView(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "hiddenMessage"    # Ljava/lang/String;

    .prologue
    .line 80
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 81
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 82
    const v2, 0x104000a

    new-instance v3, Lhu/h2online/elsosegely/ElsoSegely$1;

    invoke-direct {v3, p0, p2}, Lhu/h2online/elsosegely/ElsoSegely$1;-><init>(Lhu/h2online/elsosegely/ElsoSegely;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 99
    const-string v2, ""

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 100
    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 101
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v2}, Lhu/h2online/elsosegely/ElsoSegely;->setIntent(Landroid/content/Intent;)V

    .line 104
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 105
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 106
    return-void
.end method
