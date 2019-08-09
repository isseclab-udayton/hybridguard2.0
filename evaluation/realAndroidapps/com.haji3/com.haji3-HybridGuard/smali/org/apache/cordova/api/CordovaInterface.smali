.class public interface abstract Lorg/apache/cordova/api/CordovaInterface;
.super Ljava/lang/Object;
.source "CordovaInterface.java"


# virtual methods
.method public abstract addService(Ljava/lang/String;Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract backHistory()Z
.end method

.method public abstract bindBackButton(Z)V
.end method

.method public abstract cancelLoadUrl()V
.end method

.method public abstract clearCache()V
.end method

.method public abstract clearHistory()V
.end method

.method public abstract getApplicationContext()Landroid/content/Context;
.end method

.method public abstract getAssets()Landroid/content/res/AssetManager;
.end method

.method public abstract getBaseContext()Landroid/content/Context;
.end method

.method public abstract getContentResolver()Landroid/content/ContentResolver;
.end method

.method public abstract getContext()Landroid/content/Context;
.end method

.method public abstract getPackageName()Ljava/lang/String;
.end method

.method public abstract getResources()Landroid/content/res/Resources;
.end method

.method public abstract getSystemService(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract isBackButtonBound()Z
.end method

.method public abstract loadUrl(Ljava/lang/String;)V
.end method

.method public abstract managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
.end method

.method public abstract postMessage(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
.end method

.method public abstract runOnUiThread(Ljava/lang/Runnable;)V
.end method

.method public abstract sendJavascript(Ljava/lang/String;)V
.end method

.method public abstract setActivityResultCallback(Lorg/apache/cordova/api/IPlugin;)V
.end method

.method public abstract showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract startActivity(Landroid/content/Intent;)V
.end method

.method public abstract startActivityForResult(Lorg/apache/cordova/api/IPlugin;Landroid/content/Intent;I)V
.end method

.method public abstract unregisterReceiver(Landroid/content/BroadcastReceiver;)V
.end method
