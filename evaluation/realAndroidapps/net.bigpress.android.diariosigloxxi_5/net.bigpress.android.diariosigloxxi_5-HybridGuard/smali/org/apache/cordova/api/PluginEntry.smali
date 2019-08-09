.class public Lorg/apache/cordova/api/PluginEntry;
.super Ljava/lang/Object;
.source "PluginEntry.java"


# instance fields
.field public onload:Z

.field public plugin:Lorg/apache/cordova/api/IPlugin;

.field public pluginClass:Ljava/lang/String;

.field public service:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "pluginClass"    # Ljava/lang/String;
    .param p3, "onload"    # Z

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/api/PluginEntry;->service:Ljava/lang/String;

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/api/PluginEntry;->pluginClass:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/api/PluginEntry;->onload:Z

    .line 58
    iput-object p1, p0, Lorg/apache/cordova/api/PluginEntry;->service:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lorg/apache/cordova/api/PluginEntry;->pluginClass:Ljava/lang/String;

    .line 60
    iput-boolean p3, p0, Lorg/apache/cordova/api/PluginEntry;->onload:Z

    .line 61
    return-void
.end method

.method private getClassByName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p1, "clazz"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 98
    const/4 v0, 0x0

    .line 99
    .local v0, "c":Ljava/lang/Class;
    if-eqz p1, :cond_0

    .line 100
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 102
    :cond_0
    return-object v0
.end method

.method private isCordovaPlugin(Ljava/lang/Class;)Z
    .locals 2
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 114
    if-eqz p1, :cond_1

    .line 115
    const-class v1, Lorg/apache/cordova/api/Plugin;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_0

    const-class v1, Lorg/apache/cordova/api/IPlugin;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 117
    :cond_1
    return v0
.end method


# virtual methods
.method public createPlugin(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)Lorg/apache/cordova/api/IPlugin;
    .locals 5
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 71
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 72
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    .line 86
    :goto_0
    return-object v2

    .line 75
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->pluginClass:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/cordova/api/PluginEntry;->getClassByName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 76
    .local v0, "c":Ljava/lang/Class;
    invoke-direct {p0, v0}, Lorg/apache/cordova/api/PluginEntry;->isCordovaPlugin(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 77
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/api/IPlugin;

    iput-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    .line 78
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p2}, Lorg/apache/cordova/api/IPlugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 79
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->setView(Landroid/webkit/WebView;)V

    .line 80
    iget-object v2, p0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 82
    .end local v0    # "c":Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 84
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error adding plugin "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/api/PluginEntry;->pluginClass:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
