.class public Lorg/apache/cordova/PreferenceNode;
.super Ljava/lang/Object;
.source "PreferenceNode.java"


# instance fields
.field public name:Ljava/lang/String;

.field public readonly:Z

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "readonly"    # Z

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/apache/cordova/PreferenceNode;->name:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lorg/apache/cordova/PreferenceNode;->value:Ljava/lang/String;

    .line 32
    iput-boolean p3, p0, Lorg/apache/cordova/PreferenceNode;->readonly:Z

    .line 33
    return-void
.end method
