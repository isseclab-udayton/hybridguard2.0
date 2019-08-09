.class public interface abstract Lorg/apache/cordova/api/IPlugin;
.super Ljava/lang/Object;
.source "IPlugin.java"


# virtual methods
.method public abstract execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
.end method

.method public abstract isSynch(Ljava/lang/String;)Z
.end method

.method public abstract onActivityResult(IILandroid/content/Intent;)V
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract onNewIntent(Landroid/content/Intent;)V
.end method

.method public abstract onOverrideUrlLoading(Ljava/lang/String;)Z
.end method

.method public abstract onPause(Z)V
.end method

.method public abstract onResume(Z)V
.end method

.method public abstract setContext(Lorg/apache/cordova/api/CordovaInterface;)V
.end method

.method public abstract setView(Lorg/apache/cordova/CordovaWebView;)V
.end method
