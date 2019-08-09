.class final enum Lorg/pgsqlite/SQLitePlugin$QueryType;
.super Ljava/lang/Enum;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/pgsqlite/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "QueryType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/pgsqlite/SQLitePlugin$QueryType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum begin:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum commit:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum delete:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum insert:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum other:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum rollback:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum select:Lorg/pgsqlite/SQLitePlugin$QueryType;

.field public static final enum update:Lorg/pgsqlite/SQLitePlugin$QueryType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 882
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "update"

    invoke-direct {v0, v1, v3}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->update:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 883
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "insert"

    invoke-direct {v0, v1, v4}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->insert:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 884
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "delete"

    invoke-direct {v0, v1, v5}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->delete:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 885
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "select"

    invoke-direct {v0, v1, v6}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->select:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 886
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "begin"

    invoke-direct {v0, v1, v7}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->begin:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 887
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "commit"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->commit:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 888
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "rollback"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->rollback:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 889
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    const-string v1, "other"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/pgsqlite/SQLitePlugin$QueryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->other:Lorg/pgsqlite/SQLitePlugin$QueryType;

    .line 881
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/pgsqlite/SQLitePlugin$QueryType;

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->update:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->insert:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->delete:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->select:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->begin:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->commit:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->rollback:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->other:Lorg/pgsqlite/SQLitePlugin$QueryType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->$VALUES:[Lorg/pgsqlite/SQLitePlugin$QueryType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 881
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$QueryType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 881
    const-class v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$QueryType;

    return-object v0
.end method

.method public static values()[Lorg/pgsqlite/SQLitePlugin$QueryType;
    .locals 1

    .prologue
    .line 881
    sget-object v0, Lorg/pgsqlite/SQLitePlugin$QueryType;->$VALUES:[Lorg/pgsqlite/SQLitePlugin$QueryType;

    invoke-virtual {v0}, [Lorg/pgsqlite/SQLitePlugin$QueryType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/pgsqlite/SQLitePlugin$QueryType;

    return-object v0
.end method
