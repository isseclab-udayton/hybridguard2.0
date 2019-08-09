.class public Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;
.super Landroid/widget/LinearLayout;
.source "LinearLayoutSoftKeyboardDetect.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SoftKeyboardDetect"


# instance fields
.field private app:Lorg/apache/cordova/CordovaActivity;

.field private appPlugin:Lorg/apache/cordova/App;

.field private oldHeight:I

.field private oldWidth:I

.field private screenHeight:I

.field private screenWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 31
    iput v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    .line 32
    iput v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    .line 33
    iput v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 34
    iput v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 35
    iput-object v1, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->app:Lorg/apache/cordova/CordovaActivity;

    .line 36
    iput-object v1, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->appPlugin:Lorg/apache/cordova/App;

    .line 40
    iput p2, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 41
    iput p3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 42
    check-cast p1, Lorg/apache/cordova/CordovaActivity;

    .end local p1    # "context":Landroid/content/Context;
    iput-object p1, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->app:Lorg/apache/cordova/CordovaActivity;

    .line 43
    return-void
.end method

.method private sendEvent(Ljava/lang/String;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->appPlugin:Lorg/apache/cordova/App;

    if-nez v0, :cond_0

    .line 103
    iget-object v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->app:Lorg/apache/cordova/CordovaActivity;

    iget-object v0, v0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/PluginManager;

    const-string v1, "App"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/App;

    iput-object v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->appPlugin:Lorg/apache/cordova/App;

    .line 106
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->appPlugin:Lorg/apache/cordova/App;

    if-nez v0, :cond_1

    .line 107
    const-string v0, "SoftKeyboardDetect"

    const-string v1, "Unable to fire event without existing plugin"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    :goto_0
    return-void

    .line 110
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->appPlugin:Lorg/apache/cordova/App;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/App;->fireJavascriptEvent(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 57
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 59
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "We are in our onMeasure method"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 66
    .local v0, "height":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 67
    .local v2, "width":I
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Old Height = %d"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 68
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Height = %d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Old Width = %d"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Width = %d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-eqz v3, :cond_0

    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-ne v3, v0, :cond_2

    .line 75
    :cond_0
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Ignore this event"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    :cond_1
    :goto_0
    iput v0, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    .line 98
    iput v2, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldWidth:I

    .line 99
    return-void

    .line 78
    :cond_2
    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    if-ne v3, v2, :cond_3

    .line 80
    iget v1, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 81
    .local v1, "tmp_var":I
    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    iput v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenHeight:I

    .line 82
    iput v1, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->screenWidth:I

    .line 83
    const-string v3, "SoftKeyboardDetect"

    const-string v4, "Orientation Change"

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 87
    .end local v1    # "tmp_var":I
    :cond_3
    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-le v0, v3, :cond_4

    .line 88
    const-string v3, "hidekeyboard"

    invoke-direct {p0, v3}, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->sendEvent(Ljava/lang/String;)V

    goto :goto_0

    .line 92
    :cond_4
    iget v3, p0, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->oldHeight:I

    if-ge v0, v3, :cond_1

    .line 93
    const-string v3, "showkeyboard"

    invoke-direct {p0, v3}, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;->sendEvent(Ljava/lang/String;)V

    goto :goto_0
.end method
