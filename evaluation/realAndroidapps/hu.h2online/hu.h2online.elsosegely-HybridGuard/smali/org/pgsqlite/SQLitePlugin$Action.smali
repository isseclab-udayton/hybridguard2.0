.class final enum Lorg/pgsqlite/SQLitePlugin$Action;
.super Ljava/lang/Enum;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/pgsqlite/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/pgsqlite/SQLitePlugin$Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/pgsqlite/SQLitePlugin$Action;

.field public static final enum backgroundExecuteSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

.field public static final enum close:Lorg/pgsqlite/SQLitePlugin$Action;

.field public static final enum delete:Lorg/pgsqlite/SQLitePlugin$Action;

.field public static final enum executeSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

.field public static final enum open:Lorg/pgsqlite/SQLitePlugin$Action;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 874
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$Action;

    const-string v1, "open"

    invoke-direct {v0, v1, v2}, Lorg/pgsqlite/SQLitePlugin$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->open:Lorg/pgsqlite/SQLitePlugin$Action;

    .line 875
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$Action;

    const-string v1, "close"

    invoke-direct {v0, v1, v3}, Lorg/pgsqlite/SQLitePlugin$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->close:Lorg/pgsqlite/SQLitePlugin$Action;

    .line 876
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$Action;

    const-string v1, "delete"

    invoke-direct {v0, v1, v4}, Lorg/pgsqlite/SQLitePlugin$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->delete:Lorg/pgsqlite/SQLitePlugin$Action;

    .line 877
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$Action;

    const-string v1, "executeSqlBatch"

    invoke-direct {v0, v1, v5}, Lorg/pgsqlite/SQLitePlugin$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->executeSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

    .line 878
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$Action;

    const-string v1, "backgroundExecuteSqlBatch"

    invoke-direct {v0, v1, v6}, Lorg/pgsqlite/SQLitePlugin$Action;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->backgroundExecuteSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

    .line 873
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/pgsqlite/SQLitePlugin$Action;

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$Action;->open:Lorg/pgsqlite/SQLitePlugin$Action;

    aput-object v1, v0, v2

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$Action;->close:Lorg/pgsqlite/SQLitePlugin$Action;

    aput-object v1, v0, v3

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$Action;->delete:Lorg/pgsqlite/SQLitePlugin$Action;

    aput-object v1, v0, v4

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$Action;->executeSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

    aput-object v1, v0, v5

    sget-object v1, Lorg/pgsqlite/SQLitePlugin$Action;->backgroundExecuteSqlBatch:Lorg/pgsqlite/SQLitePlugin$Action;

    aput-object v1, v0, v6

    sput-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->$VALUES:[Lorg/pgsqlite/SQLitePlugin$Action;

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
    .line 873
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$Action;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 873
    const-class v0, Lorg/pgsqlite/SQLitePlugin$Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$Action;

    return-object v0
.end method

.method public static values()[Lorg/pgsqlite/SQLitePlugin$Action;
    .locals 1

    .prologue
    .line 873
    sget-object v0, Lorg/pgsqlite/SQLitePlugin$Action;->$VALUES:[Lorg/pgsqlite/SQLitePlugin$Action;

    invoke-virtual {v0}, [Lorg/pgsqlite/SQLitePlugin$Action;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/pgsqlite/SQLitePlugin$Action;

    return-object v0
.end method
