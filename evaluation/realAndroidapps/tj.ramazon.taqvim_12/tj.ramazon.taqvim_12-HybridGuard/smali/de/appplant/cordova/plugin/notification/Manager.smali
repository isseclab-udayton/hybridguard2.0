.class public Lde/appplant/cordova/plugin/notification/Manager;
.super Ljava/lang/Object;
.source "Manager.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lde/appplant/cordova/plugin/notification/Manager;->context:Landroid/content/Context;

    .line 61
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lde/appplant/cordova/plugin/notification/Manager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    new-instance v0, Lde/appplant/cordova/plugin/notification/Manager;

    invoke-direct {v0, p0}, Lde/appplant/cordova/plugin/notification/Manager;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private getNotMgr()Landroid/app/NotificationManager;
    .locals 2

    .prologue
    .line 446
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Manager;->context:Landroid/content/Context;

    .line 447
    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 446
    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method

.method private getPrefs()Landroid/content/SharedPreferences;
    .locals 3

    .prologue
    .line 439
    iget-object v0, p0, Lde/appplant/cordova/plugin/notification/Manager;->context:Landroid/content/Context;

    const-string v1, "LocalNotification"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private mergeJSONObjects(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "obj1"    # Lorg/json/JSONObject;
    .param p2, "obj2"    # Lorg/json/JSONObject;

    .prologue
    .line 420
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 422
    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 432
    return-object p1

    .line 424
    :cond_0
    :try_start_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 426
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 427
    .end local v2    # "key":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 428
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public cancel(I)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 154
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 156
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->cancel()V

    .line 160
    :cond_0
    return-object v0
.end method

.method public cancelAll()V
    .locals 4

    .prologue
    .line 180
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getAll()Ljava/util/List;

    move-result-object v1

    .line 182
    .local v1, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 186
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/NotificationManager;->cancelAll()V

    .line 187
    return-void

    .line 182
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/appplant/cordova/plugin/notification/Notification;

    .line 183
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->cancel()V

    goto :goto_0
.end method

.method public clear(I)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 140
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->clear()V

    .line 144
    :cond_0
    return-object v0
.end method

.method public clearAll()V
    .locals 4

    .prologue
    .line 167
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getAll()Ljava/util/List;

    move-result-object v1

    .line 169
    .local v1, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 173
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getNotMgr()Landroid/app/NotificationManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/NotificationManager;->cancelAll()V

    .line 174
    return-void

    .line 169
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/appplant/cordova/plugin/notification/Notification;

    .line 170
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->clear()V

    goto :goto_0
.end method

.method public exist(I)Z
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 298
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public exist(ILde/appplant/cordova/plugin/notification/Notification$Type;)Z
    .locals 2
    .param p1, "id"    # I
    .param p2, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;

    .prologue
    .line 310
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 312
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->getType()Lde/appplant/cordova/plugin/notification/Notification$Type;

    move-result-object v1

    if-ne v1, p2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public get(I)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 8
    .param p1, "id"    # I

    .prologue
    const/4 v6, 0x0

    .line 390
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 391
    .local v0, "alarms":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    .line 394
    .local v4, "notId":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 408
    :goto_0
    return-object v6

    .line 399
    :cond_0
    :try_start_0
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 400
    .local v3, "json":Ljava/lang/String;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    .local v5, "options":Lorg/json/JSONObject;
    new-instance v1, Lde/appplant/cordova/plugin/notification/Builder;

    iget-object v6, p0, Lde/appplant/cordova/plugin/notification/Manager;->context:Landroid/content/Context;

    invoke-direct {v1, v6, v5}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 408
    .local v1, "builder":Lde/appplant/cordova/plugin/notification/Builder;
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v6

    goto :goto_0

    .line 401
    .end local v1    # "builder":Lde/appplant/cordova/plugin/notification/Builder;
    .end local v3    # "json":Ljava/lang/String;
    .end local v5    # "options":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 402
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public getAll()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lde/appplant/cordova/plugin/notification/Notification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getIds()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/Manager;->getByIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBy(Lde/appplant/cordova/plugin/notification/Notification$Type;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .param p1, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Notification$Type;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lde/appplant/cordova/plugin/notification/Notification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 278
    .local p2, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .local v2, "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 288
    return-object v2

    .line 280
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 281
    .local v0, "id":I
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v1

    .line 283
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Notification;->isScheduled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 284
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getByIds(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lde/appplant/cordova/plugin/notification/Notification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 231
    .local v2, "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 239
    return-object v2

    .line 231
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 232
    .local v0, "id":I
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v1

    .line 234
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v1, :cond_0

    .line 235
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;
    .locals 5
    .param p1, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Notification$Type;",
            ")",
            "Ljava/util/List",
            "<",
            "Lde/appplant/cordova/plugin/notification/Notification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 256
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getAll()Ljava/util/List;

    move-result-object v2

    .line 257
    .local v2, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 259
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 265
    return-object v0

    .line 259
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/appplant/cordova/plugin/notification/Notification;

    .line 260
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Notification;->getType()Lde/appplant/cordova/plugin/notification/Notification$Type;

    move-result-object v4

    if-ne v4, p1, :cond_0

    .line 261
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getIds()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    invoke-direct {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getPrefs()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 194
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 200
    return-object v0

    .line 196
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 197
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getIdsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;
    .locals 5
    .param p1, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Notification$Type;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 210
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getAll()Ljava/util/List;

    move-result-object v2

    .line 211
    .local v2, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 213
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 219
    return-object v0

    .line 213
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/appplant/cordova/plugin/notification/Notification;

    .line 214
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Notification;->getType()Lde/appplant/cordova/plugin/notification/Notification$Type;

    move-result-object v4

    if-ne v4, p1, :cond_0

    .line 215
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Notification;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getOptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    invoke-virtual {p0}, Lde/appplant/cordova/plugin/notification/Manager;->getIds()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/Manager;->getOptionsById(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOptionsBy(Lde/appplant/cordova/plugin/notification/Notification$Type;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .param p1, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Notification$Type;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 371
    .local p2, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 372
    .local v2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    invoke-virtual {p0, p2}, Lde/appplant/cordova/plugin/notification/Manager;->getByIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 374
    .local v1, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 380
    return-object v2

    .line 374
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/appplant/cordova/plugin/notification/Notification;

    .line 375
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->getType()Lde/appplant/cordova/plugin/notification/Notification$Type;

    move-result-object v4

    if-ne v4, p1, :cond_0

    .line 376
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v4

    invoke-virtual {v4}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getOptionsById(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 329
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 331
    .local v2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 339
    return-object v2

    .line 331
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 332
    .local v0, "id":I
    invoke-virtual {p0, v0}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v1

    .line 334
    .local v1, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-eqz v1, :cond_0

    .line 335
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v3

    invoke-virtual {v3}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getOptionsByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;
    .locals 5
    .param p1, "type"    # Lde/appplant/cordova/plugin/notification/Notification$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Notification$Type;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 349
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 350
    .local v2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/json/JSONObject;>;"
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->getByType(Lde/appplant/cordova/plugin/notification/Notification$Type;)Ljava/util/List;

    move-result-object v1

    .line 352
    .local v1, "notifications":Ljava/util/List;, "Ljava/util/List<Lde/appplant/cordova/plugin/notification/Notification;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 356
    return-object v2

    .line 352
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/appplant/cordova/plugin/notification/Notification;

    .line 353
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v4

    invoke-virtual {v4}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public schedule(Lde/appplant/cordova/plugin/notification/Options;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 2
    .param p1, "options"    # Lde/appplant/cordova/plugin/notification/Options;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/appplant/cordova/plugin/notification/Options;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lde/appplant/cordova/plugin/notification/Notification;"
        }
    .end annotation

    .prologue
    .line 94
    .local p2, "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Lde/appplant/cordova/plugin/notification/Builder;

    invoke-direct {v1, p1}, Lde/appplant/cordova/plugin/notification/Builder;-><init>(Lde/appplant/cordova/plugin/notification/Options;)V

    .line 95
    invoke-virtual {v1, p2}, Lde/appplant/cordova/plugin/notification/Builder;->setTriggerReceiver(Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Builder;

    move-result-object v1

    .line 96
    invoke-virtual {v1}, Lde/appplant/cordova/plugin/notification/Builder;->build()Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 98
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->schedule()V

    .line 100
    return-object v0
.end method

.method public schedule(Lorg/json/JSONObject;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 2
    .param p1, "options"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lde/appplant/cordova/plugin/notification/Notification;"
        }
    .end annotation

    .prologue
    .line 82
    .local p2, "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lde/appplant/cordova/plugin/notification/Options;

    iget-object v1, p0, Lde/appplant/cordova/plugin/notification/Manager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lde/appplant/cordova/plugin/notification/Options;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lde/appplant/cordova/plugin/notification/Options;->parse(Lorg/json/JSONObject;)Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lde/appplant/cordova/plugin/notification/Manager;->schedule(Lde/appplant/cordova/plugin/notification/Options;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    return-object v0
.end method

.method public update(ILorg/json/JSONObject;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;
    .locals 6
    .param p1, "id"    # I
    .param p2, "updates"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONObject;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lde/appplant/cordova/plugin/notification/Notification;"
        }
    .end annotation

    .prologue
    .line 114
    .local p3, "receiver":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lde/appplant/cordova/plugin/notification/Manager;->get(I)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v0

    .line 116
    .local v0, "notification":Lde/appplant/cordova/plugin/notification/Notification;
    if-nez v0, :cond_0

    .line 117
    const/4 v2, 0x0

    .line 128
    :goto_0
    return-object v2

    .line 119
    :cond_0
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->cancel()V

    .line 122
    invoke-virtual {v0}, Lde/appplant/cordova/plugin/notification/Notification;->getOptions()Lde/appplant/cordova/plugin/notification/Options;

    move-result-object v2

    invoke-virtual {v2}, Lde/appplant/cordova/plugin/notification/Options;->getDict()Lorg/json/JSONObject;

    move-result-object v2

    .line 121
    invoke-direct {p0, v2, p2}, Lde/appplant/cordova/plugin/notification/Manager;->mergeJSONObjects(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    .line 125
    .local v1, "options":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "updatedAt"

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :goto_1
    invoke-virtual {p0, v1, p3}, Lde/appplant/cordova/plugin/notification/Manager;->schedule(Lorg/json/JSONObject;Ljava/lang/Class;)Lde/appplant/cordova/plugin/notification/Notification;

    move-result-object v2

    goto :goto_0

    .line 126
    :catch_0
    move-exception v2

    goto :goto_1
.end method
