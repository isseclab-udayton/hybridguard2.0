.class public Lorg/apache/cordova/api/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# instance fields
.field private final app:Landroid/webkit/WebView;

.field private final ctx:Lorg/apache/cordova/api/CordovaInterface;

.field private plugins:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/api/IPlugin;",
            ">;"
        }
    .end annotation
.end field

.field private services:Ljava/util/HashMap;
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
.method public constructor <init>(Landroid/webkit/WebView;Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 1
    .param p1, "app"    # Landroid/webkit/WebView;
    .param p2, "ctx"    # Lorg/apache/cordova/api/CordovaInterface;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->services:Ljava/util/HashMap;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    .line 60
    iput-object p2, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 61
    iput-object p1, p0, Lorg/apache/cordova/api/PluginManager;->app:Landroid/webkit/WebView;

    .line 62
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->loadPlugins()V

    .line 63
    return-void
.end method

.method private addPlugin(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;
    .locals 6
    .param p1, "pluginName"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 241
    :try_start_0
    invoke-direct {p0, p2}, Lorg/apache/cordova/api/PluginManager;->getClassByName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 242
    .local v0, "c":Ljava/lang/Class;
    invoke-direct {p0, v0}, Lorg/apache/cordova/api/PluginManager;->isCordovaPlugin(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 243
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/api/IPlugin;

    .line 244
    .local v2, "plugin":Lorg/apache/cordova/api/IPlugin;
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v3, p2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2, v3}, Lorg/apache/cordova/api/IPlugin;->setContext(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 246
    iget-object v3, p0, Lorg/apache/cordova/api/PluginManager;->app:Landroid/webkit/WebView;

    invoke-interface {v2, v3}, Lorg/apache/cordova/api/IPlugin;->setView(Landroid/webkit/WebView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v0    # "c":Ljava/lang/Class;
    .end local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :goto_0
    return-object v2

    .line 249
    :catch_0
    move-exception v1

    .line 250
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 251
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error adding plugin "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 253
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
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
    .line 207
    const/4 v0, 0x0

    .line 208
    .local v0, "c":Ljava/lang/Class;
    if-eqz p1, :cond_0

    .line 209
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 211
    :cond_0
    return-object v0
.end method

.method private getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;
    .locals 2
    .param p1, "pluginName"    # Ljava/lang/String;

    .prologue
    .line 265
    iget-object v1, p0, Lorg/apache/cordova/api/PluginManager;->services:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 266
    .local v0, "className":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    iget-object v1, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 269
    :goto_0
    return-object v1

    :cond_0
    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/api/PluginManager;->addPlugin(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v1

    goto :goto_0
.end method

.method private isCordovaPlugin(Ljava/lang/Class;)Z
    .locals 2
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 223
    if-eqz p1, :cond_1

    .line 224
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

    .line 226
    :cond_1
    return v0
.end method

.method private pluginConfigurationMissing()V
    .locals 2

    .prologue
    .line 354
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "====================================================================================="

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 355
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "ERROR: plugin.xml is missing.  Add res/xml/plugins.xml to your project."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 356
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "https://git-wip-us.apache.org/repos/asf?p=incubator-cordova-android.git;a=blob;f=framework/res/xml/plugins.xml"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 357
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "====================================================================================="

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    return-void
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "serviceType"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 281
    iget-object v0, p0, Lorg/apache/cordova/api/PluginManager;->services:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
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
    .line 136
    const/4 v7, 0x0

    .line 137
    .local v7, "cr":Lorg/apache/cordova/api/PluginResult;
    move/from16 v9, p5

    .line 139
    .local v9, "runAsync":Z
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, p4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 140
    .local v4, "args":Lorg/json/JSONArray;
    invoke-direct {p0, p1}, Lorg/apache/cordova/api/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v2

    .line 141
    .local v2, "plugin":Lorg/apache/cordova/api/IPlugin;
    iget-object v6, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 142
    .local v6, "ctx":Lorg/apache/cordova/api/CordovaInterface;
    if-eqz v2, :cond_2

    .line 143
    if-eqz p5, :cond_0

    invoke-interface {v2, p2}, Lorg/apache/cordova/api/IPlugin;->isSynch(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v9, 0x1

    .line 144
    :goto_0
    if-eqz v9, :cond_1

    .line 146
    new-instance v10, Ljava/lang/Thread;

    new-instance v0, Lorg/apache/cordova/api/PluginManager$1;

    move-object v1, p0

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/api/PluginManager$1;-><init>(Lorg/apache/cordova/api/PluginManager;Lorg/apache/cordova/api/IPlugin;Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)V

    invoke-direct {v10, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 172
    .local v10, "thread":Ljava/lang/Thread;
    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 173
    const-string v0, ""

    .line 195
    .end local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .end local v4    # "args":Lorg/json/JSONArray;
    .end local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    .end local v10    # "thread":Ljava/lang/Thread;
    :goto_1
    return-object v0

    .line 143
    .restart local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .restart local v4    # "args":Lorg/json/JSONArray;
    .restart local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :cond_0
    const/4 v9, 0x0

    goto :goto_0

    .line 176
    :cond_1
    invoke-interface {v2, p2, v4, p3}, Lorg/apache/cordova/api/IPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;

    move-result-object v7

    .line 179
    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getStatus()I

    move-result v0

    sget-object v1, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-virtual {v1}, Lorg/apache/cordova/api/PluginResult$Status;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_2

    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getKeepCallback()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 180
    const-string v0, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 184
    .end local v2    # "plugin":Lorg/apache/cordova/api/IPlugin;
    .end local v4    # "args":Lorg/json/JSONArray;
    .end local v6    # "ctx":Lorg/apache/cordova/api/CordovaInterface;
    :catch_0
    move-exception v8

    .line 185
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

    .line 186
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    .end local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    sget-object v0, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 189
    .end local v8    # "e":Lorg/json/JSONException;
    .restart local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    :cond_2
    if-eqz v9, :cond_4

    .line 190
    if-nez v7, :cond_3

    .line 191
    new-instance v7, Lorg/apache/cordova/api/PluginResult;

    .end local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    sget-object v0, Lorg/apache/cordova/api/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v7, v0}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 193
    .restart local v7    # "cr":Lorg/apache/cordova/api/PluginResult;
    :cond_3
    iget-object v0, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v7, p3}, Lorg/apache/cordova/api/PluginResult;->toErrorCallbackString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/cordova/api/CordovaInterface;->sendJavascript(Ljava/lang/String;)V

    .line 195
    :cond_4
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Lorg/apache/cordova/api/PluginResult;->getJSONString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    const-string v0, "{ status: 0, message: \'all good\' }"

    goto :goto_1
.end method

.method public loadPlugins()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 80
    iget-object v7, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/api/CordovaInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "plugins"

    const-string v9, "xml"

    iget-object v10, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/api/CordovaInterface;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 81
    .local v2, "id":I
    if-nez v2, :cond_0

    invoke-direct {p0}, Lorg/apache/cordova/api/PluginManager;->pluginConfigurationMissing()V

    .line 82
    :cond_0
    iget-object v7, p0, Lorg/apache/cordova/api/PluginManager;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/api/CordovaInterface;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v6

    .line 83
    .local v6, "xml":Landroid/content/res/XmlResourceParser;
    const/4 v1, -0x1

    .line 84
    .local v1, "eventType":I
    const-string v3, ""

    .local v3, "pluginClass":Ljava/lang/String;
    const-string v4, ""

    .line 85
    .local v4, "pluginName":Ljava/lang/String;
    :goto_0
    const/4 v7, 0x1

    if-eq v1, v7, :cond_3

    .line 86
    const/4 v7, 0x2

    if-ne v1, v7, :cond_1

    .line 87
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 88
    .local v5, "strNode":Ljava/lang/String;
    const-string v7, "plugin"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 89
    const-string v7, "value"

    invoke-interface {v6, v11, v7}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 90
    const-string v7, "name"

    invoke-interface {v6, v11, v7}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 92
    invoke-virtual {p0, v4, v3}, Lorg/apache/cordova/api/PluginManager;->addService(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v7, "true"

    const-string v8, "onload"

    invoke-interface {v6, v11, v8}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 96
    invoke-direct {p0, v4}, Lorg/apache/cordova/api/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    .line 103
    .end local v5    # "strNode":Ljava/lang/String;
    :cond_1
    :goto_1
    :try_start_0
    invoke-interface {v6}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    goto :goto_0

    .line 98
    .restart local v5    # "strNode":Ljava/lang/String;
    :cond_2
    const-string v7, "url-filter"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 99
    iget-object v7, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    const-string v8, "value"

    invoke-interface {v6, v11, v8}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 104
    .end local v5    # "strNode":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    .line 106
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_1
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 110
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 310
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 311
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    invoke-interface {v1}, Lorg/apache/cordova/api/IPlugin;->onDestroy()V

    goto :goto_0

    .line 313
    .end local v1    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :cond_0
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 331
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 332
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    invoke-interface {v1, p1}, Lorg/apache/cordova/api/IPlugin;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_0

    .line 334
    .end local v1    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :cond_0
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 343
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->urlMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 344
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 345
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 346
    .local v1, "pairs":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 347
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/cordova/api/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/api/IPlugin;

    move-result-object v2

    invoke-interface {v2, p1}, Lorg/apache/cordova/api/IPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v2

    .line 350
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
    .line 290
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 291
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    invoke-interface {v1, p1}, Lorg/apache/cordova/api/IPlugin;->onPause(Z)V

    goto :goto_0

    .line 293
    .end local v1    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :cond_0
    return-void
.end method

.method public onResume(Z)V
    .locals 3
    .param p1, "multitasking"    # Z

    .prologue
    .line 301
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 302
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    invoke-interface {v1, p1}, Lorg/apache/cordova/api/IPlugin;->onResume(Z)V

    goto :goto_0

    .line 304
    .end local v1    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :cond_0
    return-void
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 322
    iget-object v2, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/api/IPlugin;

    .line 323
    .local v1, "plugin":Lorg/apache/cordova/api/IPlugin;
    invoke-interface {v1, p1, p2}, Lorg/apache/cordova/api/IPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 325
    .end local v1    # "plugin":Lorg/apache/cordova/api/IPlugin;
    :cond_0
    return-void
.end method

.method public reinit()V
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/cordova/api/PluginManager;->onPause(Z)V

    .line 72
    invoke-virtual {p0}, Lorg/apache/cordova/api/PluginManager;->onDestroy()V

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/api/PluginManager;->plugins:Ljava/util/HashMap;

    .line 74
    return-void
.end method
