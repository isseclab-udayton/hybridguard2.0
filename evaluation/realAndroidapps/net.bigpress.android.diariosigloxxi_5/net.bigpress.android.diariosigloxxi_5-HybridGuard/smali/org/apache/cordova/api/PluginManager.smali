.class public Lorg/apache/cordova/api/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private final app:Landroid/webkit/WebView;

.field private final ctx:Lorg/apache/cordova/api/CordovaInterface;

.field private final entries:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/api/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private firstRun:Z

.field protected urlMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string v0, "PluginManager"

    sput-object v0, Lorg/apache/cordova/api/PluginManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 1
    .param p1, "app"    # Landroid/webkit/WebView;
    .param p2, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    .line 63
    iput-object p2, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 64
    iput-object p1, p0, Lorg/apache/cordova/api/PluginManager;->app:Landroid/webkit/WebView;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/api/PluginManager;->firstRun:Z

    .line 66
    return-void
.end method

.method private getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;
    .locals 4
    .param p1, "service"    # Ljava/lang/String;

    .prologue
    .line 243
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 244
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    if-nez v0, :cond_1

    .line 245
    const/4 v1, 0x0

    .line 251
    :cond_0
    :goto_0
    return-object v1

    .line 247
    :cond_1
    iget-object v1, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    .line 248
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    if-nez v1, :cond_0

    .line 249
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->app:Landroid/webkit/WebView;

    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/api/PluginEntry;->createPlugin(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v1

    goto :goto_0
.end method

.method private pluginConfigurationMissing()V
    .locals 2

    .prologue
    .line 356
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "====================================================================================="

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 357
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "ERROR: plugin.xml is missing.  Add res/xml/plugins.xml to your project."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "https://git-wip-us.apache.org/repos/asf?p=incubator-cordova-android.git;a=blob;f=framework/res/xml/plugins.xml"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 359
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "====================================================================================="

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 360
    return-void
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 262
    new-instance v0, Lorg/apache/cordova/api/PluginEntry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/cordova/api/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 263
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/api/PluginManager;->addService(Lorg/apache/cordova/api/PluginEntry;)V

    .line 264
    return-void
.end method

.method public addService(Lorg/apache/cordova/api/PluginEntry;)V
    .locals 2
    .param p1, "entry"    # Lorg/apache/cordova/api/PluginEntry;

    .prologue
    .line 273
    iget-object v0, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    iget-object v1, p1, Lorg/apache/cordova/api/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    return-void
.end method

.method public clearPluginObjects()V
    .locals 3

    .prologue
    .line 132
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 133
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    const/4 v2, 0x0

    iput-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    goto :goto_0

    .line 135
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_0
    return-void
.end method

.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 11
    .param p1, "service"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "callbackId"    # Ljava/lang/String;
    .param p4, "jsonArgs"    # Ljava/lang/String;
    .param p5, "async"    # Z

    .prologue
    .line 172
    const/4 v7, 0x0

    .line 173
    .local v7, "cr":Lorg/apache/cordova/api/PluginResult;
    move/from16 v9, p5

    .line 175
    .local v9, "runAsync":Z
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, p4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 176
    .local v4, "args":Lorg/json/JSONArray;
    invoke-direct {p0, p1}, Lorg/apache/cordova/api/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v2

    .line 177
    .local v2, "plugin":Lorg/apache/cordova/api/IPlugin;
    iget-object v6, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 178
    .local v6, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    if-eqz v2, :cond_2

    .line 179
    if-eqz p5, :cond_0

    invoke-interface {v2, p2}, Lorg/apache/cordova/api/IPlugin;->isSynch(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v9, 0x1

    .line 180
    :goto_0
    if-eqz v9, :cond_1

    .line 182
    new-instance v10, Ljava/lang/Thread;

    new-instance v0, Lorg/apache/cordova/api/PluginManager$1;

    move-object v1, p0

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/api/PluginManager$1;-><init>(Lorg/apache/cordova/api/PluginManager;Lorg/apache/cordova/api/IPlugin;Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)V

    invoke-direct {v10, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 208
    .local v10, "thread":Ljava/lang/Thread;
    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 209
    const-string v0, ""

    .line 231
    .end local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .end local v4    # "args":Lorg/json/JSONArray;
    .end local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    .end local v10    # "thread":Ljava/lang/Thread;
    :goto_1
    return-object v0

    .line 179
    .restart local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .restart local v4    # "args":Lorg/json/JSONArray;
    .restart local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :cond_0
    const/4 v9, 0x0

    goto :goto_0

    .line 212
    :cond_1
    invoke-interface {v2, p2, v4, p3}, Lorg/apache/cordova/api/IPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v7

    .line 215
    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v0

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v1}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_2

    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getKeepCallback()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 216
    const-string v0, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 220
    .end local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .end local v4    # "args":Lorg/json/JSONArray;
    .end local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :catch_0
    move-exception v8

    .line 221
    .local v8, "e":Lorg/json/JSONException;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ERROR: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 222
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    .end local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    sget-object v0, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 225
    .end local v8    # "e":Lorg/json/JSONException;
    .restart local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    :cond_2
    if-eqz v9, :cond_4

    .line 226
    if-nez v7, :cond_3

    .line 227
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    .end local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    sget-object v0, Lorg/apache/cordova/api/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 229
    .restart local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    :cond_3
    iget-object v0, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v7, p3}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/cordova/api/CordovaInterface;->sendJavascript(Ljava/lang/String;)V

    .line 231
    :cond_4
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getJSONString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    const-string v0, "{ status: 0, message: \'all good\' }"

    goto :goto_1
.end method

.method public init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 72
    sget-object v0, Lorg/apache/cordova/api/PluginManager;->TAG:Ljava/lang/String;

    const-string v1, "init()"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-boolean v0, p0, Lorg/apache/cordova/api/PluginManager;->firstRun:Z

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->loadPlugins()V

    .line 77
    iput-boolean v2, p0, Lorg/apache/cordova/api/PluginManager;->firstRun:Z

    .line 88
    :goto_0
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->startupPlugins()V

    .line 89
    return-void

    .line 82
    :cond_0
    invoke-virtual {p0, v2}, Lorg/apache/cordova/api/PluginManager;->onPause(Z)V

    .line 83
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->onDestroy()V

    .line 84
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->clearPluginObjects()V

    goto :goto_0
.end method

.method public loadPlugins()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 95
    iget-object v9, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const-string v10, "plugins"

    const-string v11, "xml"

    iget-object v12, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v10, v11, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 96
    .local v3, "id":I
    if-nez v3, :cond_0

    .line 97
    invoke-direct {p0}, Lorg/apache/cordova/api/PluginManager;->pluginConfigurationMissing()V

    .line 99
    :cond_0
    iget-object v9, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v9}, Lorg/apache/cordova/api/CordovaInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v3}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v8

    .line 100
    .local v8, "xml":Landroid/content/res/XmlResourceParser;
    const/4 v2, -0x1

    .line 101
    .local v2, "eventType":I
    const-string v6, ""

    .local v6, "service":Ljava/lang/String;
    const-string v5, ""

    .line 102
    .local v5, "pluginClass":Ljava/lang/String;
    const/4 v4, 0x0

    .line 103
    .local v4, "onload":Z
    const/4 v1, 0x0

    .line 104
    .local v1, "entry":Lorg/apache/cordova/api/PluginEntry;
    :goto_0
    const/4 v9, 0x1

    if-eq v2, v9, :cond_3

    .line 105
    const/4 v9, 0x2

    if-ne v2, v9, :cond_1

    .line 106
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 107
    .local v7, "strNode":Ljava/lang/String;
    const-string v9, "plugin"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 108
    const-string v9, "name"

    invoke-interface {v8, v13, v9}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 109
    const-string v9, "value"

    invoke-interface {v8, v13, v9}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 111
    const-string v9, "true"

    const-string v10, "onload"

    invoke-interface {v8, v13, v10}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 112
    new-instance v1, Lorg/apache/cordova/api/PluginEntry;

    .end local v1    # "entry":Lorg/apache/cordova/api/PluginEntry;
    invoke-direct {v1, v6, v5, v4}, Lorg/apache/cordova/api/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 113
    .restart local v1    # "entry":Lorg/apache/cordova/api/PluginEntry;
    invoke-virtual {p0, v1}, Lorg/apache/cordova/api/PluginManager;->addService(Lorg/apache/cordova/api/PluginEntry;)V

    .line 119
    .end local v7    # "strNode":Ljava/lang/String;
    :cond_1
    :goto_1
    :try_start_0
    invoke-interface {v8}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    goto :goto_0

    .line 114
    .restart local v7    # "strNode":Ljava/lang/String;
    :cond_2
    const-string v9, "url-filter"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 115
    iget-object v9, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    const-string v10, "value"

    invoke-interface {v8, v13, v10}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 120
    .end local v7    # "strNode":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    .line 122
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_1
    move-exception v0

    .line 123
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 126
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 306
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 307
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 308
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2}, Lorg/apache/cordova/api/IPlugin;->onDestroy()V

    goto :goto_0

    .line 311
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 331
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 332
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 333
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_0

    .line 336
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 345
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 346
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 347
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 348
    .local v1, "pairs":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 349
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/cordova/api/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v2

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v2

    .line 352
    .end local v1    # "pairs":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onPause(Z)V
    .locals 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 282
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 283
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 284
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->onPause(Z)V

    goto :goto_0

    .line 287
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method

.method public onResume(Z)V
    .locals 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 295
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 296
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 297
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->onResume(Z)V

    goto :goto_0

    .line 300
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 320
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 321
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    if-eqz v2, :cond_0

    .line 322
    iget-object v2, v0, Lorg/apache/cordova/api/PluginEntry;->plugin:Lorg/apache/cordova/api/IPlugin;

    invoke-interface {v2, p1, p2}, Lorg/apache/cordova/api/IPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 325
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method

.method public startupPlugins()V
    .locals 4

    .prologue
    .line 141
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->entries:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/PluginEntry;

    .line 142
    .local v0, "entry":Lorg/apache/cordova/api/PluginEntry;
    iget-boolean v2, v0, Lorg/apache/cordova/api/PluginEntry;->onload:Z

    if-eqz v2, :cond_0

    .line 143
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->app:Landroid/webkit/WebView;

    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/api/PluginEntry;->createPlugin(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)Lorg/apache/cordova/api/IPlugin;

    goto :goto_0

    .line 146
    .end local v0    # "entry":Lorg/apache/cordova/api/PluginEntry;
    :cond_1
    return-void
.end method
