.class public Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;
.super Landroid/webkit/WebViewClient;
.source "ChildBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/phonegap/plugins/childBrowser/ChildBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ChildBrowserClient"
.end annotation


# instance fields
.field ctx:Lorg/apache/cordova/api/CordovaInterface;

.field edittext:Landroid/widget/EditText;

.field final synthetic this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;


# direct methods
.method public constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Lorg/apache/cordova/api/CordovaInterface;Landroid/widget/EditText;)V
    .locals 0
    .param p2, "mContext"    # Lorg/apache/cordova/api/CordovaInterface;
    .param p3, "mEditText"    # Landroid/widget/EditText;

    .prologue
    .line 382
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 383
    iput-object p2, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->ctx:Lorg/apache/cordova/api/CordovaInterface;

    .line 384
    iput-object p3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->edittext:Landroid/widget/EditText;

    .line 385
    return-void
.end method


# virtual methods
.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 395
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 397
    const-string v3, "http:"

    invoke-virtual {p2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "https:"

    invoke-virtual {p2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 398
    :cond_0
    move-object v1, p2

    .line 403
    .local v1, "newloc":Ljava/lang/String;
    :goto_0
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->edittext:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 404
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->edittext:Landroid/widget/EditText;

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 408
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 409
    .local v2, "obj":Lorg/json/JSONObject;
    const-string v3, "type"

    invoke-static {}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$1200()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 410
    const-string v3, "location"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 412
    iget-object v3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$ChildBrowserClient;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    const/4 v4, 0x1

    invoke-static {v3, v2, v4}, Lcom/phonegap/plugins/childBrowser/ChildBrowser;->access$200(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Lorg/json/JSONObject;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    .end local v2    # "obj":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 400
    .end local v1    # "newloc":Ljava/lang/String;
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "newloc":Ljava/lang/String;
    goto :goto_0

    .line 413
    :catch_0
    move-exception v0

    .line 414
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "ChildBrowser"

    const-string v4, "This should never happen"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
