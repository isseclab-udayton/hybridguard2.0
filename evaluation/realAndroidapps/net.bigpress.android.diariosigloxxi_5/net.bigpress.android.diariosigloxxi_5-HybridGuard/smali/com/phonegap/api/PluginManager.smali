.class public Lcom/phonegap/api/PluginManager;
.super Lorg/apache/cordova/api/PluginManager;
.source "PluginManager.java"


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 0
    .param p1, "app"    # Landroid/webkit/WebView;
    .param p2, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/api/PluginManager;-><init>(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)V

    .line 35
    return-void
.end method
