.class final Lorg/pgsqlite/SQLitePlugin$DBQuery;
.super Ljava/lang/Object;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/pgsqlite/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DBQuery"
.end annotation


# instance fields
.field final cbc:Lorg/apache/cordova/CallbackContext;

.field final close:Z

.field final delete:Z

.field final jsonparams:[Lorg/json/JSONArray;

.field final queries:[Ljava/lang/String;

.field final queryIDs:[Ljava/lang/String;

.field final stop:Z

.field final synthetic this$0:Lorg/pgsqlite/SQLitePlugin;


# direct methods
.method constructor <init>(Lorg/pgsqlite/SQLitePlugin;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 862
    iput-object p1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->this$0:Lorg/pgsqlite/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 863
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->stop:Z

    .line 864
    iput-boolean v2, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->close:Z

    .line 865
    iput-boolean v2, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->delete:Z

    .line 866
    iput-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 867
    iput-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 868
    iput-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 869
    iput-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 870
    return-void
.end method

.method constructor <init>(Lorg/pgsqlite/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p2, "delete"    # Z
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 851
    iput-object p1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->this$0:Lorg/pgsqlite/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 852
    iput-boolean v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->stop:Z

    .line 853
    iput-boolean v1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->close:Z

    .line 854
    iput-boolean p2, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->delete:Z

    .line 855
    iput-object v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 856
    iput-object v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 857
    iput-object v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 858
    iput-object p3, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 859
    return-void
.end method

.method constructor <init>(Lorg/pgsqlite/SQLitePlugin;[Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p2, "myqueries"    # [Ljava/lang/String;
    .param p3, "qids"    # [Ljava/lang/String;
    .param p4, "params"    # [Lorg/json/JSONArray;
    .param p5, "c"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v0, 0x0

    .line 841
    iput-object p1, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->this$0:Lorg/pgsqlite/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 842
    iput-boolean v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->stop:Z

    .line 843
    iput-boolean v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->close:Z

    .line 844
    iput-boolean v0, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->delete:Z

    .line 845
    iput-object p2, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    .line 846
    iput-object p3, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    .line 847
    iput-object p4, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    .line 848
    iput-object p5, p0, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    .line 849
    return-void
.end method
