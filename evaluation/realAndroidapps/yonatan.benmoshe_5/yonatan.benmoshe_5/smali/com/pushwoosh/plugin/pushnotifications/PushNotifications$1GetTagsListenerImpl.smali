.class final Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;
.super Ljava/lang/Object;
.source "PushNotifications.java"

# interfaces
.implements Lcom/arellomobile/android/push/PushManager$GetTagsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "GetTagsListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;


# direct methods
.method constructor <init>(Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;)V
    .locals 0

    .prologue
    .line 566
    iput-object p1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 579
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iget-object v1, v1, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "getTags"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 580
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 585
    :goto_0
    return-void

    .line 583
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    .line 584
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iget-object v1, v1, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "getTags"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public onTagsReceived(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 569
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iget-object v1, v1, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "getTags"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/api/CallbackContext;

    .line 570
    .local v0, "callback":Lorg/apache/cordova/api/CallbackContext;
    if-nez v0, :cond_0

    .line 575
    :goto_0
    return-void

    .line 573
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/api/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 574
    iget-object v1, p0, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications$1GetTagsListenerImpl;->this$0:Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;

    iget-object v1, v1, Lcom/pushwoosh/plugin/pushnotifications/PushNotifications;->callbackIds:Ljava/util/HashMap;

    const-string v2, "getTags"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
