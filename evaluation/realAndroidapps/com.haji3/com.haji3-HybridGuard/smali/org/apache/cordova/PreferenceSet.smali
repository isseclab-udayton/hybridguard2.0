.class public Lorg/apache/cordova/PreferenceSet;
.super Ljava/lang/Object;
.source "PreferenceSet.java"


# instance fields
.field private innerSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/apache/cordova/PreferenceNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/PreferenceSet;->innerSet:Ljava/util/HashSet;

    .line 31
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/cordova/PreferenceNode;)V
    .locals 1
    .param p1, "node"    # Lorg/apache/cordova/PreferenceNode;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/apache/cordova/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 35
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/cordova/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 43
    return-void
.end method

.method public pref(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "prefName"    # Ljava/lang/String;

    .prologue
    .line 46
    iget-object v2, p0, Lorg/apache/cordova/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/PreferenceNode;

    .line 47
    .local v1, "n":Lorg/apache/cordova/PreferenceNode;
    iget-object v2, v1, Lorg/apache/cordova/PreferenceNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 48
    iget-object v2, v1, Lorg/apache/cordova/PreferenceNode;->value:Ljava/lang/String;

    .line 50
    .end local v1    # "n":Lorg/apache/cordova/PreferenceNode;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public prefMatches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "prefName"    # Ljava/lang/String;
    .param p2, "prefValue"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/cordova/PreferenceSet;->pref(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 57
    const/4 v1, 0x0

    .line 59
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lorg/apache/cordova/PreferenceSet;->innerSet:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    return v0
.end method
