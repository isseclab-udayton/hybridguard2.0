.class public interface abstract Lcom/arellomobile/android/push/tags/SendPushTagsCallBack;
.super Ljava/lang/Object;
.source "SendPushTagsCallBack.java"


# virtual methods
.method public abstract onSentTagsError(Lcom/arellomobile/android/push/exception/PushWooshException;)V
.end method

.method public abstract onSentTagsSuccess(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract taskStarted()V
.end method
