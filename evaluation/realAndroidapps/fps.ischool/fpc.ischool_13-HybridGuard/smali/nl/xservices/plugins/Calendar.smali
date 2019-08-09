.class public Lnl/xservices/plugins/Calendar;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Calendar.java"


# static fields
.field public static final ACTION_CREATE_EVENT:Ljava/lang/String; = "createEvent"

.field public static final ACTION_DELETE_EVENT:Ljava/lang/String; = "deleteEvent"

.field public static final ACTION_FIND_EVENT:Ljava/lang/String; = "findEvent"

.field public static final ACTION_MODIFY_EVENT:Ljava/lang/String; = "modifyEvent"

.field public static final RESULT_CODE_CREATE:Ljava/lang/Integer;


# instance fields
.field private callback:Lorg/apache/cordova/CallbackContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lnl/xservices/plugins/Calendar;->RESULT_CODE_CREATE:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method private isAllDayEvent(Ljava/util/Date;Ljava/util/Date;)Z
    .locals 1
    .param p1, "startDate"    # Ljava/util/Date;
    .param p2, "endDate"    # Ljava/util/Date;

    .prologue
    .line 63
    invoke-virtual {p1}, Ljava/util/Date;->getHours()I

    move-result v0

    if-nez v0, :cond_0

    .line 64
    invoke-virtual {p1}, Ljava/util/Date;->getMinutes()I

    move-result v0

    if-nez v0, :cond_0

    .line 65
    invoke-virtual {p1}, Ljava/util/Date;->getSeconds()I

    move-result v0

    if-nez v0, :cond_0

    .line 66
    invoke-virtual {p2}, Ljava/util/Date;->getHours()I

    move-result v0

    if-nez v0, :cond_0

    .line 67
    invoke-virtual {p2}, Ljava/util/Date;->getMinutes()I

    move-result v0

    if-nez v0, :cond_0

    .line 68
    invoke-virtual {p2}, Ljava/util/Date;->getSeconds()I

    move-result v0

    if-nez v0, :cond_0

    .line 63
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 10
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 25
    :try_start_0
    const-string v4, "createEvent"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 26
    iput-object p3, p0, Lnl/xservices/plugins/Calendar;->callback:Lorg/apache/cordova/CallbackContext;

    .line 28
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.EDIT"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 29
    const-string v5, "vnd.android.cursor.item/event"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 30
    const-string v5, "title"

    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 31
    const-string v5, "eventLocation"

    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 32
    const-string v5, "description"

    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 33
    const-string v5, "beginTime"

    const/4 v6, 0x3

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v4

    .line 34
    const-string v5, "endTime"

    const/4 v6, 0x4

    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v4

    .line 35
    const-string v5, "allDay"

    new-instance v6, Ljava/util/Date;

    const/4 v7, 0x3

    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v8

    invoke-direct {v6, v8, v9}, Ljava/util/Date;-><init>(J)V

    new-instance v7, Ljava/util/Date;

    const/4 v8, 0x4

    invoke-virtual {p2, v8}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-direct {p0, v6, v7}, Lnl/xservices/plugins/Calendar;->isAllDayEvent(Ljava/util/Date;Ljava/util/Date;)Z

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    .line 37
    .local v0, "calIntent":Landroid/content/Intent;
    iget-object v4, p0, Lnl/xservices/plugins/Calendar;->cordova:Lorg/apache/cordova/CordovaInterface;

    sget-object v5, Lnl/xservices/plugins/Calendar;->RESULT_CODE_CREATE:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v4, p0, v0, v5}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    .line 45
    .end local v0    # "calIntent":Landroid/content/Intent;
    :goto_0
    return v2

    .line 40
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "calendar."

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " is not (yet) supported on Android."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 41
    goto :goto_0

    .line 43
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v2, v3

    .line 45
    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 50
    sget-object v0, Lnl/xservices/plugins/Calendar;->RESULT_CODE_CREATE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 51
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 52
    iget-object v0, p0, Lnl/xservices/plugins/Calendar;->callback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    if-nez p2, :cond_2

    .line 54
    iget-object v0, p0, Lnl/xservices/plugins/Calendar;->callback:Lorg/apache/cordova/CallbackContext;

    const-string v1, "User cancelled"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 56
    :cond_2
    iget-object v0, p0, Lnl/xservices/plugins/Calendar;->callback:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to add event ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method
