.class public Lcom/arellomobile/android/push/DeviceFeature2_5;
.super Ljava/lang/Object;
.source "DeviceFeature2_5.java"


# static fields
.field private static final APP_OPEN:Ljava/lang/String; = "applicationOpen"

.field private static final GET_TAGS:Ljava/lang/String; = "getTags"

.field private static final GOAL_ACHIEVED:Ljava/lang/String; = "applicationEvent"

.field private static final MSG_DELIVERED:Ljava/lang/String; = "messageDeliveryEvent"

.field private static final NEAREST_ZONE:Ljava/lang/String; = "getNearestZone"

.field private static final PACKAGE_REMOVED:Ljava/lang/String; = "androidPackageRemoved"

.field private static final PUSH_STAT:Ljava/lang/String; = "pushStat"

.field private static final TAG:Ljava/lang/String; = "PushWoosh DeviceFeature2_5"

.field private static final TAGS_PATH:Ljava/lang/String; = "setTags"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNearestZone(Landroid/content/Context;Landroid/location/Location;)Lcom/arellomobile/android/push/data/PushZoneLocation;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "location"    # Landroid/location/Location;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v8, 0xc8

    .line 248
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 250
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/request/RequestHelper;->getNearestZoneData(Landroid/content/Context;Landroid/location/Location;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 252
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To Sent Nearest Zone"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 255
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 256
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 277
    :cond_0
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: sent Nearest Zone "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 278
    throw v2

    .line 260
    :cond_1
    :try_start_0
    const-string v5, "getNearestZone"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 261
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 256
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 264
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 267
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send Nearest Zone success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5}, Lcom/arellomobile/android/push/request/RequestHelper;->getPushZoneLocationFromData(Lorg/json/JSONObject;)Lcom/arellomobile/android/push/data/PushZoneLocation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    return-object v5

    .line 271
    :catch_0
    move-exception v1

    .line 273
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_1
.end method

.method public static getTags(Landroid/content/Context;)Ljava/util/Map;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v8, 0xc8

    .line 353
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 355
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0}, Lcom/arellomobile/android/push/request/RequestHelper;->getGetTagsData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 357
    const-string v6, "PushWoosh DeviceFeature2_5"

    const-string v7, "Try To sent AppRemoved"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v6, 0x1f4

    const/4 v7, 0x0

    invoke-direct {v4, v6, v7, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 360
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 361
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v6, 0x5

    if-lt v3, v6, :cond_1

    .line 382
    :cond_0
    const-string v6, "PushWoosh DeviceFeature2_5"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "ERROR: Try To sent getTags "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ". Response = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 385
    :goto_1
    return-object v5

    .line 365
    :cond_1
    :try_start_0
    const-string v6, "getTags"

    invoke-static {v0, v6}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 366
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v6

    if-eq v8, v6, :cond_2

    .line 361
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 369
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v6

    if-ne v8, v6, :cond_0

    .line 372
    const-string v6, "PushWoosh DeviceFeature2_5"

    const-string v7, "Send getTags success"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v6

    invoke-static {v6}, Lcom/arellomobile/android/push/request/RequestHelper;->getTagsFromData(Lorg/json/JSONObject;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 376
    :catch_0
    move-exception v1

    .line 378
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_2
.end method

.method private static jsonObjectFromTagMap(Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 150
    .local v3, "tagsObject":Lorg/json/JSONObject;
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 202
    return-object v3

    .line 150
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 152
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 153
    .local v5, "value":Ljava/lang/Object;
    instance-of v8, v5, Ljava/lang/String;

    if-eqz v8, :cond_2

    move-object v4, v5

    .line 155
    check-cast v4, Ljava/lang/String;

    .line 156
    .local v4, "valString":Ljava/lang/String;
    const-string v8, "#pwinc#"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 158
    const/4 v8, 0x7

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 159
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 160
    .local v0, "intValue":Ljava/lang/Integer;
    invoke-static {v0}, Lcom/arellomobile/android/push/PushManager;->incrementalTag(Ljava/lang/Integer;)Ljava/util/Map;

    move-result-object v8

    invoke-static {v8}, Lcom/arellomobile/android/push/DeviceFeature2_5;->jsonObjectFromTagMap(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v3, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 164
    .end local v0    # "intValue":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 167
    .end local v4    # "valString":Ljava/lang/String;
    :cond_2
    instance-of v8, v5, Ljava/lang/Integer;

    if-eqz v8, :cond_3

    .line 169
    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 171
    :cond_3
    instance-of v8, v5, Ljava/util/List;

    if-eqz v8, :cond_7

    .line 173
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 174
    .local v6, "values":Lorg/json/JSONArray;
    check-cast v5, Ljava/util/List;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_4

    .line 185
    invoke-virtual {v3, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 174
    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 176
    .local v1, "item":Ljava/lang/Object;
    instance-of v9, v1, Ljava/lang/String;

    if-nez v9, :cond_5

    instance-of v9, v1, Ljava/lang/Integer;

    if-eqz v9, :cond_6

    .line 178
    :cond_5
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 182
    :cond_6
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "wrong type for tag: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 187
    .end local v1    # "item":Ljava/lang/Object;
    .end local v6    # "values":Lorg/json/JSONArray;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_7
    instance-of v8, v5, Lorg/json/JSONArray;

    if-eqz v8, :cond_8

    move-object v6, v5

    .line 189
    check-cast v6, Lorg/json/JSONArray;

    .line 190
    .restart local v6    # "values":Lorg/json/JSONArray;
    invoke-virtual {v3, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 192
    .end local v6    # "values":Lorg/json/JSONArray;
    :cond_8
    instance-of v8, v5, Ljava/util/Map;

    if-eqz v8, :cond_9

    .line 194
    check-cast v5, Ljava/util/Map;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-static {v5}, Lcom/arellomobile/android/push/DeviceFeature2_5;->jsonObjectFromTagMap(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v3, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 198
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_9
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "wrong type for tag: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public static sendAppOpen(Landroid/content/Context;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v8, 0xc8

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 116
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0}, Lcom/arellomobile/android/push/request/RequestHelper;->getSendAppOpenData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 118
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To sent AppOpen"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 121
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 122
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 142
    :cond_0
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: Try To sent AppOpen "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 144
    :goto_1
    return-void

    .line 126
    :cond_1
    :try_start_0
    const-string v5, "applicationOpen"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 127
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 122
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 130
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 133
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send AppOpen success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 136
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_2
.end method

.method static sendAppRemovedData(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0xc8

    .line 320
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 322
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/request/RequestHelper;->getAppRemovedData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 324
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To sent AppRemoved"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 327
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 328
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 348
    :cond_0
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: Try To sent AppRemoved "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 350
    :goto_1
    return-void

    .line 332
    :cond_1
    :try_start_0
    const-string v5, "androidPackageRemoved"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 333
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 328
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 336
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 339
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send AppRemoved success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 342
    :catch_0
    move-exception v1

    .line 344
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_2
.end method

.method public static sendGoalAchieved(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "goal"    # Ljava/lang/String;
    .param p2, "count"    # Ljava/lang/Integer;

    .prologue
    const/16 v8, 0xc8

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 82
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1, p2}, Lcom/arellomobile/android/push/request/RequestHelper;->getSendGoalAchievedData(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 84
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To sent Goal"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 87
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 88
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 108
    :cond_0
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: Try To sent PushStat "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    :goto_1
    return-void

    .line 92
    :cond_1
    :try_start_0
    const-string v5, "applicationEvent"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 93
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_2

    .line 88
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 96
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_0

    .line 99
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send Goal success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 102
    :catch_0
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_2
.end method

.method public static sendMessageDeliveryEvent(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0xc8

    .line 283
    if-nez p1, :cond_0

    .line 316
    :goto_0
    return-void

    .line 286
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 288
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/request/RequestHelper;->getSendPushStatData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 290
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To sent MsgDelivered"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 293
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 294
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/4 v5, 0x5

    if-lt v3, v5, :cond_2

    .line 314
    :cond_1
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: Try To sent MsgDelivered "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 298
    :cond_2
    :try_start_0
    const-string v5, "messageDeliveryEvent"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 299
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v5

    if-eq v8, v5, :cond_3

    .line 294
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 302
    :cond_3
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v5

    if-ne v8, v5, :cond_1

    .line 305
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send MsgDelivered success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 308
    :catch_0
    move-exception v1

    .line 310
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_2
.end method

.method public static sendPushStat(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 46
    if-nez p1, :cond_0

    .line 76
    :goto_0
    return-void

    .line 49
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 51
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1}, Lcom/arellomobile/android/push/request/RequestHelper;->getSendPushStatData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 53
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Try To sent PushStat"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 56
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 57
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/4 v5, 0x5

    if-lt v3, v5, :cond_1

    .line 74
    const-string v5, "PushWoosh DeviceFeature2_5"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ERROR: Try To sent PushStat "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Response = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 61
    :cond_1
    :try_start_0
    const-string v5, "pushStat"

    invoke-static {v0, v5}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 62
    const/16 v5, 0xc8

    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v6

    if-ne v5, v6, :cond_2

    .line 64
    const-string v5, "PushWoosh DeviceFeature2_5"

    const-string v6, "Send PushStat success"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 68
    :catch_0
    move-exception v1

    .line 70
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    .line 57
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public static sendTags(Landroid/content/Context;Ljava/util/Map;)Lorg/json/JSONArray;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v10, 0xc8

    .line 207
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 209
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0}, Lcom/arellomobile/android/push/request/RequestHelper;->getSendTagsData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 211
    invoke-static {p1}, Lcom/arellomobile/android/push/DeviceFeature2_5;->jsonObjectFromTagMap(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v6

    .line 212
    .local v6, "tagsObject":Lorg/json/JSONObject;
    const-string v7, "tags"

    invoke-interface {v0, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    const-string v7, "PushWoosh DeviceFeature2_5"

    const-string v8, "Try To sent Tags"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    new-instance v4, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    const/16 v7, 0x1f4

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, v7, v8, v9}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;-><init>(IILorg/json/JSONObject;)V

    .line 217
    .local v4, "res":Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 218
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v7, 0x5

    if-lt v3, v7, :cond_1

    .line 242
    :cond_0
    const-string v7, "PushWoosh DeviceFeature2_5"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "ERROR: sent Tags "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ". Response = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 243
    throw v2

    .line 222
    :cond_1
    :try_start_0
    const-string v7, "setTags"

    invoke-static {v0, v7}, Lcom/arellomobile/android/push/utils/NetworkUtils;->makeRequest(Ljava/util/Map;Ljava/lang/String;)Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;

    move-result-object v4

    .line 223
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultCode()I

    move-result v7

    if-eq v10, v7, :cond_2

    .line 218
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 226
    :cond_2
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getPushwooshCode()I

    move-result v7

    if-ne v10, v7, :cond_0

    .line 229
    const-string v7, "PushWoosh DeviceFeature2_5"

    const-string v8, "Send Tags success"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    invoke-virtual {v4}, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->getResultData()Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "response"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 231
    .local v5, "response":Lorg/json/JSONObject;
    if-nez v5, :cond_3

    .line 232
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 234
    :goto_2
    return-object v7

    :cond_3
    const-string v7, "skipped"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    goto :goto_2

    .line 236
    .end local v5    # "response":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_1
.end method
