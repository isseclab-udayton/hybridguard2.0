.class Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;
.super Ljava/lang/Object;
.source "LocalNotification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/appplant/cordova/plugin/localnotification/LocalNotification;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

.field private final synthetic val$action:Ljava/lang/String;

.field private final synthetic val$args:Lorg/json/JSONArray;

.field private final synthetic val$command:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iput-object p2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    iput-object p3, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    iput-object p4, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 135
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "schedule"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$0(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V

    .line 137
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "update"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 140
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$1(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V

    .line 141
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 143
    :cond_2
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "cancel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 144
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$2(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V

    .line 145
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 147
    :cond_3
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "cancelAll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 148
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    invoke-static {v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$3(Lde/appplant/cordova/plugin/localnotification/LocalNotification;)V

    .line 149
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 151
    :cond_4
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "clear"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 152
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$4(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;)V

    .line 153
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 155
    :cond_5
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "clearAll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 156
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    invoke-static {v0}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$5(Lde/appplant/cordova/plugin/localnotification/LocalNotification;)V

    .line 157
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 159
    :cond_6
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "isPresent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 160
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optInt(I)I

    move-result v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$6(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 162
    :cond_7
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "isScheduled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 163
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optInt(I)I

    move-result v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$7(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 165
    :cond_8
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "isTriggered"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 166
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optInt(I)I

    move-result v1

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$8(Lde/appplant/cordova/plugin/localnotification/LocalNotification;ILorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 168
    :cond_9
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getAllIds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 169
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$9(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 171
    :cond_a
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getScheduledIds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 172
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$10(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 174
    :cond_b
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getTriggeredIds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 175
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$11(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 177
    :cond_c
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getAll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 178
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$12(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 180
    :cond_d
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getScheduled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 181
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$13(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 183
    :cond_e
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "getTriggered"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 184
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->this$0:Lde/appplant/cordova/plugin/localnotification/LocalNotification;

    iget-object v1, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$args:Lorg/json/JSONArray;

    iget-object v2, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$command:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0, v1, v2}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$14(Lde/appplant/cordova/plugin/localnotification/LocalNotification;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 186
    :cond_f
    iget-object v0, p0, Lde/appplant/cordova/plugin/localnotification/LocalNotification$1;->val$action:Ljava/lang/String;

    const-string v1, "deviceready"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    invoke-static {}, Lde/appplant/cordova/plugin/localnotification/LocalNotification;->access$15()V

    goto/16 :goto_0
.end method
