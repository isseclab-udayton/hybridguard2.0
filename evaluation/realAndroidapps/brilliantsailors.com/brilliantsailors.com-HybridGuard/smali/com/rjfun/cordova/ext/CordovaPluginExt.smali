.class public Lcom/rjfun/cordova/ext/CordovaPluginExt;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CordovaPluginExt.java"

# interfaces
.implements Lcom/rjfun/cordova/ext/PluginAdapterDelegate;


# instance fields
.field protected adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    return-void
.end method


# virtual methods
.method public fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/String;
    .param p2, "eventName"    # Ljava/lang/String;
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 57
    iget-object v1, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    invoke-interface {v1, p1, p2, p3}, Lcom/rjfun/cordova/ext/PluginAdapterDelegate;->fireEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :goto_0
    return-void

    .line 60
    :cond_0
    const-string v1, "window"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "var evt=document.createEvent(\'UIEvents\');evt.initUIEvent(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\',true,false,window,0);window.dispatchEvent(evt);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "js":Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 63
    .end local v0    # "js":Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:cordova.fireDocumentEvent(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 64
    .restart local v0    # "js":Ljava/lang/String;
    if-eqz p3, :cond_2

    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 67
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    invoke-interface {v0}, Lcom/rjfun/cordova/ext/PluginAdapterDelegate;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 52
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0
.end method

.method public getAdapter()Lcom/rjfun/cordova/ext/PluginAdapterDelegate;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 5

    .prologue
    .line 27
    iget-object v2, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    invoke-interface {v2}, Lcom/rjfun/cordova/ext/PluginAdapterDelegate;->getView()Landroid/view/View;

    move-result-object v2

    .line 45
    :goto_0
    return-object v2

    .line 30
    :cond_0
    const-class v2, Landroid/view/View;

    const-class v3, Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 31
    iget-object v2, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->webView:Lorg/apache/cordova/CordovaWebView;

    check-cast v2, Landroid/view/View;

    goto :goto_0

    .line 36
    :cond_1
    :try_start_0
    const-class v3, Lorg/apache/cordova/CordovaWebView;

    const-string v4, "getView"

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 37
    .local v1, "getViewMethod":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_2

    .line 38
    const/4 v2, 0x0

    new-array v0, v2, [Ljava/lang/Object;

    .line 39
    .local v0, "args":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 41
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "getViewMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v2

    .line 45
    :cond_2
    invoke-virtual {p0}, Lcom/rjfun/cordova/ext/CordovaPluginExt;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    const v3, 0x1020002

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    goto :goto_0
.end method

.method public sendPluginResult(Lorg/apache/cordova/PluginResult;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "result"    # Lorg/apache/cordova/PluginResult;
    .param p2, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    invoke-interface {v0, p1, p2}, Lcom/rjfun/cordova/ext/PluginAdapterDelegate;->sendPluginResult(Lorg/apache/cordova/PluginResult;Lorg/apache/cordova/CallbackContext;)V

    .line 79
    :goto_0
    return-void

    .line 77
    :cond_0
    invoke-virtual {p2, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public setAdapter(Lcom/rjfun/cordova/ext/PluginAdapterDelegate;)V
    .locals 0
    .param p1, "theAdapter"    # Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/rjfun/cordova/ext/CordovaPluginExt;->adapter:Lcom/rjfun/cordova/ext/PluginAdapterDelegate;

    .line 19
    return-void
.end method
