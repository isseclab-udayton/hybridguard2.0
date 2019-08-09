.class public Lorg/pgsqlite/SQLitePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SQLitePlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/pgsqlite/SQLitePlugin$QueryType;,
        Lorg/pgsqlite/SQLitePlugin$Action;,
        Lorg/pgsqlite/SQLitePlugin$DBQuery;,
        Lorg/pgsqlite/SQLitePlugin$DBRunner;
    }
.end annotation


# static fields
.field private static final DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final FIRST_WORD:Ljava/util/regex/Pattern;

.field private static final UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

.field private static final WHERE_CLAUSE:Ljava/util/regex/Pattern;

.field static dbrmap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/pgsqlite/SQLitePlugin$DBRunner;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 38
    const-string v0, "^\\s*(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->FIRST_WORD:Ljava/util/regex/Pattern;

    .line 41
    const-string v0, "\\s+WHERE\\s+(.+)$"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    .line 44
    const-string v0, "^\\s*UPDATE\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 47
    const-string v0, "^\\s*DELETE\\s+FROM\\s+(\\S+)"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    .line 55
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1
    .param p0, "x0"    # Lorg/pgsqlite/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/pgsqlite/SQLitePlugin;->openDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p0, "x0"    # Lorg/pgsqlite/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Lorg/json/JSONArray;
    .param p4, "x4"    # [Ljava/lang/String;
    .param p5, "x5"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 36
    invoke-direct/range {p0 .. p5}, Lorg/pgsqlite/SQLitePlugin;->executeSqlBatch(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$200(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/pgsqlite/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->closeDatabaseNow(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lorg/pgsqlite/SQLitePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabaseNow(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "myStatement"    # Landroid/database/sqlite/SQLiteStatement;
    .param p2, "sqlArgs"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 628
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 629
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Float;

    if-nez v1, :cond_0

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Double;

    if-eqz v1, :cond_1

    .line 630
    :cond_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 628
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 631
    :cond_1
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 632
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    goto :goto_1

    .line 633
    :cond_2
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 634
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 636
    :cond_3
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_1

    .line 639
    :cond_4
    return-void
.end method

.method private bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 4
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cur"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 722
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getType(I)I

    move-result v0

    .line 724
    .local v0, "curType":I
    packed-switch v0, :pswitch_data_0

    .line 739
    :pswitch_0
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 742
    :goto_0
    return-void

    .line 726
    :pswitch_1
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 729
    :pswitch_2
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 732
    :pswitch_3
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 735
    :pswitch_4
    new-instance v1, Ljava/lang/String;

    invoke-interface {p3, p4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 724
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 6
    .param p1, "row"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 748
    move-object v2, p3

    check-cast v2, Landroid/database/sqlite/SQLiteCursor;

    .line 749
    .local v2, "sqLiteCursor":Landroid/database/sqlite/SQLiteCursor;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v0

    .line 750
    .local v0, "cursorWindow":Landroid/database/CursorWindow;
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    .line 751
    .local v1, "pos":I
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isNull(II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 752
    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 762
    :goto_0
    return-void

    .line 753
    :cond_0
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isLong(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 754
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_0

    .line 755
    :cond_1
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isFloat(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 756
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 757
    :cond_2
    invoke-virtual {v0, v1, p4}, Landroid/database/CursorWindow;->isBlob(II)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 758
    new-instance v3, Ljava/lang/String;

    invoke-interface {p3, p4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 760
    :cond_3
    invoke-interface {p3, p4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method private closeDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 5
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 251
    sget-object v2, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 252
    .local v1, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    if-eqz v1, :cond_2

    .line 254
    :try_start_0
    iget-object v2, v1, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v3, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4, p2}, Lorg/pgsqlite/SQLitePlugin$DBQuery;-><init>(Lorg/pgsqlite/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    :cond_0
    :goto_0
    return-void

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/lang/Exception;
    if-eqz p2, :cond_1

    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "couldn\'t close database"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 259
    :cond_1
    const-class v2, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "couldn\'t close database"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 262
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    if-eqz p2, :cond_0

    .line 263
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0
.end method

.method private closeDatabaseNow(Ljava/lang/String;)V
    .locals 1
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 274
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 276
    .local v0, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 279
    :cond_0
    return-void
.end method

.method private countRowsAffectedCompat(Lorg/pgsqlite/SQLitePlugin$QueryType;Ljava/lang/String;[Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;I)I
    .locals 16
    .param p1, "queryType"    # Lorg/pgsqlite/SQLitePlugin$QueryType;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "jsonparams"    # [Lorg/json/JSONArray;
    .param p4, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p5, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 544
    sget-object v14, Lorg/pgsqlite/SQLitePlugin;->WHERE_CLAUSE:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    .line 546
    .local v13, "whereMatcher":Ljava/util/regex/Matcher;
    const-string v12, ""

    .line 548
    .local v12, "where":Ljava/lang/String;
    const/4 v6, 0x0

    .line 549
    .local v6, "pos":I
    :goto_0
    invoke-virtual {v13, v6}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 550
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " WHERE "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 551
    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Ljava/util/regex/Matcher;->start(I)I

    move-result v6

    goto :goto_0

    .line 557
    :cond_0
    const/4 v4, 0x0

    .line 558
    .local v4, "numQuestionMarks":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-ge v3, v14, :cond_2

    .line 559
    invoke-virtual {v12, v3}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x3f

    if-ne v14, v15, :cond_1

    .line 560
    add-int/lit8 v4, v4, 0x1

    .line 558
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 564
    :cond_2
    const/4 v9, 0x0

    .line 566
    .local v9, "subParams":Lorg/json/JSONArray;
    if-eqz p3, :cond_3

    .line 568
    aget-object v5, p3, p5

    .line 569
    .local v5, "origArray":Lorg/json/JSONArray;
    new-instance v9, Lorg/json/JSONArray;

    .end local v9    # "subParams":Lorg/json/JSONArray;
    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 570
    .restart local v9    # "subParams":Lorg/json/JSONArray;
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    sub-int v7, v14, v4

    .line 571
    .local v7, "startPos":I
    move v3, v7

    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v3, v14, :cond_3

    .line 572
    sub-int v14, v3, v7

    invoke-virtual {v5, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 571
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 576
    .end local v5    # "origArray":Lorg/json/JSONArray;
    .end local v7    # "startPos":I
    :cond_3
    sget-object v14, Lorg/pgsqlite/SQLitePlugin$QueryType;->update:Lorg/pgsqlite/SQLitePlugin$QueryType;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_6

    .line 577
    sget-object v14, Lorg/pgsqlite/SQLitePlugin;->UPDATE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 578
    .local v11, "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 579
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 581
    .local v10, "table":Ljava/lang/String;
    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 584
    .local v8, "statement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz v9, :cond_4

    .line 585
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lorg/pgsqlite/SQLitePlugin;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 588
    :cond_4
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    long-to-int v14, v14

    .line 612
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    .end local v10    # "table":Ljava/lang/String;
    :goto_3
    return v14

    .line 589
    .restart local v10    # "table":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 591
    .local v2, "e":Ljava/lang/Exception;
    const-class v14, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 612
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v10    # "table":Ljava/lang/String;
    :cond_5
    :goto_4
    const/4 v14, 0x0

    goto :goto_3

    .line 595
    .end local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    :cond_6
    sget-object v14, Lorg/pgsqlite/SQLitePlugin;->DELETE_TABLE_NAME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 596
    .restart local v11    # "tableMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 597
    const/4 v14, 0x1

    invoke-virtual {v11, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    .line 599
    .restart local v10    # "table":Ljava/lang/String;
    :try_start_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SELECT count(*) FROM "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    .line 601
    .restart local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lorg/pgsqlite/SQLitePlugin;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V

    .line 603
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v14

    long-to-int v14, v14

    goto :goto_3

    .line 604
    .end local v8    # "statement":Landroid/database/sqlite/SQLiteStatement;
    :catch_1
    move-exception v2

    .line 606
    .restart local v2    # "e":Ljava/lang/Exception;
    const-class v14, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v14}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v14

    const-string v15, "uncaught"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method private deleteDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 6
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 282
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 283
    .local v2, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    if-eqz v2, :cond_1

    .line 285
    :try_start_0
    iget-object v3, v2, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v4, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5, p2}, Lorg/pgsqlite/SQLitePlugin$DBQuery;-><init>(Lorg/pgsqlite/SQLitePlugin;ZLorg/apache/cordova/CallbackContext;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 300
    :goto_0
    return-void

    .line 286
    :catch_0
    move-exception v1

    .line 287
    .local v1, "e":Ljava/lang/Exception;
    if-eqz p2, :cond_0

    .line 288
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "couldn\'t close database"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 290
    :cond_0
    const-class v3, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "couldn\'t close database"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 293
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabaseNow(Ljava/lang/String;)Z

    move-result v0

    .line 294
    .local v0, "deleteResult":Z
    if-eqz v0, :cond_2

    .line 295
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 297
    :cond_2
    const-string v3, "couldn\'t delete database"

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private deleteDatabaseNow(Ljava/lang/String;)Z
    .locals 4
    .param p1, "dbname"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 310
    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/app/Activity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 312
    .local v0, "dbfile":Ljava/io/File;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_0

    .line 315
    :try_start_0
    invoke-static {v0}, Landroid/database/sqlite/SQLiteDatabase;->deleteDatabase(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 322
    :goto_0
    return v2

    .line 316
    :catch_0
    move-exception v1

    .line 317
    .local v1, "e":Ljava/lang/Exception;
    const-class v2, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "couldn\'t delete because old SDK_INT"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 318
    invoke-direct {p0, v0}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabasePreHoneycomb(Ljava/io/File;)Z

    move-result v2

    goto :goto_0

    .line 322
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-direct {p0, v0}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabasePreHoneycomb(Ljava/io/File;)Z

    move-result v2

    goto :goto_0
.end method

.method private deleteDatabasePreHoneycomb(Ljava/io/File;)Z
    .locals 3
    .param p1, "dbfile"    # Ljava/io/File;

    .prologue
    .line 328
    :try_start_0
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Activity;->deleteDatabase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 331
    :goto_0
    return v1

    .line 329
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    const-class v1, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "couldn\'t delete database"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 331
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private executeAndPossiblyThrow(Lorg/pgsqlite/SQLitePlugin$Action;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 21
    .param p1, "action"    # Lorg/pgsqlite/SQLitePlugin$Action;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 93
    const/16 v19, 0x1

    .line 97
    .local v19, "status":Z
    sget-object v3, Lorg/pgsqlite/SQLitePlugin$1;->$SwitchMap$org$pgsqlite$SQLitePlugin$Action:[I

    invoke-virtual/range {p1 .. p1}, Lorg/pgsqlite/SQLitePlugin$Action;->ordinal()I

    move-result v7

    aget v3, v3, v7

    packed-switch v3, :pswitch_data_0

    .line 168
    :goto_0
    return v19

    .line 99
    :pswitch_0
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 100
    .local v16, "o":Lorg/json/JSONObject;
    const-string v3, "name"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 102
    .local v11, "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v11, v1}, Lorg/pgsqlite/SQLitePlugin;->startDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 106
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v16    # "o":Lorg/json/JSONObject;
    :pswitch_1
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 107
    .restart local v16    # "o":Lorg/json/JSONObject;
    const-string v3, "path"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 109
    .restart local v11    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v11, v1}, Lorg/pgsqlite/SQLitePlugin;->closeDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 113
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v16    # "o":Lorg/json/JSONObject;
    :pswitch_2
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 114
    .restart local v16    # "o":Lorg/json/JSONObject;
    const-string v3, "path"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 116
    .restart local v11    # "dbname":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v11, v1}, Lorg/pgsqlite/SQLitePlugin;->deleteDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 122
    .end local v11    # "dbname":Ljava/lang/String;
    .end local v16    # "o":Lorg/json/JSONObject;
    :pswitch_3
    const/4 v4, 0x0

    .line 123
    .local v4, "queries":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 125
    .local v5, "queryIDs":[Ljava/lang/String;
    const/4 v14, 0x0

    .line 126
    .local v14, "jsonArr":Lorg/json/JSONArray;
    const/16 v17, 0x0

    .line 127
    .local v17, "paramLen":I
    const/4 v6, 0x0

    .line 129
    .local v6, "jsonparams":[Lorg/json/JSONArray;
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 130
    .local v9, "allargs":Lorg/json/JSONObject;
    const-string v3, "dbargs"

    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 131
    .local v10, "dbargs":Lorg/json/JSONObject;
    const-string v3, "dbname"

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 132
    .restart local v11    # "dbname":Ljava/lang/String;
    const-string v3, "executes"

    invoke-virtual {v9, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    .line 134
    .local v20, "txargs":Lorg/json/JSONArray;
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 135
    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/String;

    .line 153
    :cond_0
    new-instance v2, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    move-object/from16 v3, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v7}, Lorg/pgsqlite/SQLitePlugin$DBQuery;-><init>(Lorg/pgsqlite/SQLitePlugin;[Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    .line 154
    .local v2, "q":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v11}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 155
    .local v18, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    if-eqz v18, :cond_2

    .line 157
    :try_start_0
    move-object/from16 v0, v18

    iget-object v3, v0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 158
    :catch_0
    move-exception v12

    .line 159
    .local v12, "e":Ljava/lang/Exception;
    const-class v3, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v7, "couldn\'t add to queue"

    invoke-static {v3, v7, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 160
    const-string v3, "couldn\'t add to queue"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 137
    .end local v2    # "q":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v18    # "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    :cond_1
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONArray;->length()I

    move-result v15

    .line 138
    .local v15, "len":I
    new-array v4, v15, [Ljava/lang/String;

    .line 139
    new-array v5, v15, [Ljava/lang/String;

    .line 140
    new-array v6, v15, [Lorg/json/JSONArray;

    .line 142
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    if-ge v13, v15, :cond_0

    .line 143
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 144
    .local v8, "a":Lorg/json/JSONObject;
    const-string v3, "sql"

    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v13

    .line 145
    const-string v3, "qid"

    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v13

    .line 146
    const-string v3, "params"

    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    .line 147
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v17

    .line 148
    aput-object v14, v6, v13

    .line 142
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 163
    .end local v8    # "a":Lorg/json/JSONObject;
    .end local v13    # "i":I
    .end local v15    # "len":I
    .restart local v2    # "q":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    .restart local v18    # "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    :cond_2
    const-string v3, "database not open"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 97
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private executeSqlBatch(Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 26
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "queryarr"    # [Ljava/lang/String;
    .param p3, "jsonparams"    # [Lorg/json/JSONArray;
    .param p4, "queryIDs"    # [Ljava/lang/String;
    .param p5, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 358
    invoke-direct/range {p0 .. p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    .line 360
    .local v6, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    if-nez v6, :cond_0

    .line 362
    const-string v2, "database has been closed"

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 538
    :goto_0
    return-void

    .line 367
    :cond_0
    const-string v4, ""

    .line 368
    .local v4, "query":Ljava/lang/String;
    const-string v20, ""

    .line 369
    .local v20, "query_id":Ljava/lang/String;
    move-object/from16 v0, p2

    array-length v14, v0

    .line 370
    .local v14, "len":I
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .line 372
    .local v8, "batchResults":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    if-ge v7, v14, :cond_b

    .line 373
    const/16 v23, 0x0

    .line 374
    .local v23, "rowsAffectedCompat":I
    const/16 v17, 0x0

    .line 375
    .local v17, "needRowsAffectedCompat":Z
    aget-object v20, p4, v7

    .line 377
    const/16 v18, 0x0

    .line 378
    .local v18, "queryResult":Lorg/json/JSONObject;
    const-string v10, "unknown"

    .line 381
    .local v10, "errorMessage":Ljava/lang/String;
    const/16 v16, 0x1

    .line 383
    .local v16, "needRawQuery":Z
    :try_start_0
    aget-object v4, p2, v7

    .line 385
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/pgsqlite/SQLitePlugin;->getQueryType(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$QueryType;

    move-result-object v3

    .line 387
    .local v3, "queryType":Lorg/pgsqlite/SQLitePlugin$QueryType;
    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->update:Lorg/pgsqlite/SQLitePlugin$QueryType;

    if-eq v3, v2, :cond_1

    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->delete:Lorg/pgsqlite/SQLitePlugin$QueryType;

    if-ne v3, v2, :cond_d

    .line 388
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v2, v5, :cond_8

    .line 389
    invoke-virtual {v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v15

    .line 391
    .local v15, "myStatement":Landroid/database/sqlite/SQLiteStatement;
    if-eqz p3, :cond_2

    .line 392
    aget-object v2, p3, v7

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v2}, Lorg/pgsqlite/SQLitePlugin;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    .line 395
    :cond_2
    const/16 v22, -0x1

    .line 399
    .local v22, "rowsAffected":I
    :try_start_1
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7

    move-result v22

    .line 401
    const/16 v16, 0x0

    .line 413
    :goto_2
    const/4 v2, -0x1

    move/from16 v0, v22

    if-eq v0, v2, :cond_3

    .line 414
    :try_start_2
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 415
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .local v19, "queryResult":Lorg/json/JSONObject;
    :try_start_3
    const-string v2, "rowsAffected"

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :cond_3
    move-object/from16 v19, v18

    .line 424
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v22    # "rowsAffected":I
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :goto_3
    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->insert:Lorg/pgsqlite/SQLitePlugin$QueryType;

    if-ne v3, v2, :cond_4

    if-eqz p3, :cond_4

    .line 425
    const/16 v16, 0x0

    .line 427
    invoke-virtual {v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v15

    .line 429
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    aget-object v2, p3, v7

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v2}, Lorg/pgsqlite/SQLitePlugin;->bindArgsToStatement(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_8

    .line 431
    const-wide/16 v12, -0x1

    .line 434
    .local v12, "insertId":J
    :try_start_4
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v12

    .line 437
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_4
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8

    .line 438
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    const-wide/16 v24, -0x1

    cmp-long v2, v12, v24

    if-eqz v2, :cond_9

    .line 439
    :try_start_5
    const-string v2, "insertId"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 440
    const-string v2, "rowsAffected"

    const/4 v5, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    :goto_4
    move-object/from16 v19, v18

    .line 453
    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_4
    :goto_5
    :try_start_6
    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->begin:Lorg/pgsqlite/SQLitePlugin$QueryType;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    if-ne v3, v2, :cond_5

    .line 454
    const/16 v16, 0x0

    .line 456
    :try_start_7
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 458
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_7
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_8

    .line 459
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_8
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8 .. :try_end_8} :catch_b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    move-object/from16 v19, v18

    .line 467
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_5
    :goto_6
    :try_start_9
    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->commit:Lorg/pgsqlite/SQLitePlugin$QueryType;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    if-ne v3, v2, :cond_6

    .line 468
    const/16 v16, 0x0

    .line 470
    :try_start_a
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 471
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 473
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    .line 474
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_b
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_a
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    move-object/from16 v19, v18

    .line 482
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_6
    :goto_7
    :try_start_c
    sget-object v2, Lorg/pgsqlite/SQLitePlugin$QueryType;->rollback:Lorg/pgsqlite/SQLitePlugin$QueryType;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_8

    if-ne v3, v2, :cond_c

    .line 483
    const/16 v16, 0x0

    .line 485
    :try_start_d
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 487
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_4
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_8

    .line 488
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :try_start_e
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5

    .line 497
    :goto_8
    if-eqz v16, :cond_7

    .line 498
    :try_start_f
    aget-object v2, p3, v7

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v6, v4, v2, v1}, Lorg/pgsqlite/SQLitePlugin;->executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;

    move-result-object v18

    .line 500
    if-eqz v17, :cond_7

    .line 501
    const-string v2, "rowsAffected"

    move-object/from16 v0, v18

    move/from16 v1, v23

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    .line 511
    .end local v3    # "queryType":Lorg/pgsqlite/SQLitePlugin$QueryType;
    :cond_7
    :goto_9
    if-eqz v18, :cond_a

    .line 512
    :try_start_10
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v21}, Lorg/json/JSONObject;-><init>()V

    .line 513
    .local v21, "r":Lorg/json/JSONObject;
    const-string v2, "qid"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 515
    const-string v2, "type"

    const-string v5, "success"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 516
    const-string v2, "result"

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 518
    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_6

    .line 372
    .end local v21    # "r":Lorg/json/JSONObject;
    :goto_a
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 402
    .restart local v3    # "queryType":Lorg/pgsqlite/SQLitePlugin$QueryType;
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v22    # "rowsAffected":I
    :catch_0
    move-exception v11

    .line 404
    .local v11, "ex":Landroid/database/sqlite/SQLiteException;
    :try_start_11
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 405
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 406
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLiteStatement.executeUpdateDelete(): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const/16 v16, 0x0

    .line 411
    goto/16 :goto_2

    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v22    # "rowsAffected":I
    :cond_8
    move-object/from16 v2, p0

    move-object/from16 v5, p3

    .line 418
    invoke-direct/range {v2 .. v7}, Lorg/pgsqlite/SQLitePlugin;->countRowsAffectedCompat(Lorg/pgsqlite/SQLitePlugin$QueryType;Ljava/lang/String;[Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;I)I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_5

    move-result v23

    .line 419
    const/16 v17, 0x1

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_3

    .line 442
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v12    # "insertId":J
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :cond_9
    :try_start_12
    const-string v2, "rowsAffected"

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_12
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_1
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_5

    goto/16 :goto_4

    .line 444
    :catch_1
    move-exception v11

    .line 447
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :goto_b
    :try_start_13
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 448
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 449
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLiteDatabase.executeInsert(): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_5

    .line 460
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    :catch_2
    move-exception v11

    move-object/from16 v18, v19

    .line 461
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_c
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 462
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 463
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLiteDatabase.beginTransaction(): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_6

    .line 475
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_3
    move-exception v11

    move-object/from16 v18, v19

    .line 476
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_d
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 477
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 478
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLiteDatabase.setTransactionSuccessful/endTransaction(): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_7

    .line 489
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_4
    move-exception v11

    move-object/from16 v18, v19

    .line 490
    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    :goto_e
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 491
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 492
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLiteDatabase.endTransaction(): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_5

    goto/16 :goto_8

    .line 504
    .end local v3    # "queryType":Lorg/pgsqlite/SQLitePlugin$QueryType;
    .end local v11    # "ex":Landroid/database/sqlite/SQLiteException;
    :catch_5
    move-exception v11

    .line 505
    .local v11, "ex":Ljava/lang/Exception;
    :goto_f
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    .line 506
    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    .line 507
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLitePlugin.executeSql[Batch](): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 520
    .end local v11    # "ex":Ljava/lang/Exception;
    :cond_a
    :try_start_14
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v21}, Lorg/json/JSONObject;-><init>()V

    .line 521
    .restart local v21    # "r":Lorg/json/JSONObject;
    const-string v2, "qid"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 522
    const-string v2, "type"

    const-string v5, "error"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 524
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 525
    .local v9, "er":Lorg/json/JSONObject;
    const-string v2, "message"

    invoke-virtual {v9, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 526
    const-string v2, "result"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_6

    goto/16 :goto_a

    .line 530
    .end local v9    # "er":Lorg/json/JSONObject;
    .end local v21    # "r":Lorg/json/JSONObject;
    :catch_6
    move-exception v11

    .line 531
    .local v11, "ex":Lorg/json/JSONException;
    invoke-virtual {v11}, Lorg/json/JSONException;->printStackTrace()V

    .line 532
    const-string v2, "executeSqlBatch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SQLitePlugin.executeSql[Batch](): Error="

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v11}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 537
    .end local v10    # "errorMessage":Ljava/lang/String;
    .end local v11    # "ex":Lorg/json/JSONException;
    .end local v16    # "needRawQuery":Z
    .end local v17    # "needRowsAffectedCompat":Z
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v23    # "rowsAffectedCompat":I
    :cond_b
    move-object/from16 v0, p5

    invoke-virtual {v0, v8}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 408
    .restart local v3    # "queryType":Lorg/pgsqlite/SQLitePlugin$QueryType;
    .restart local v10    # "errorMessage":Ljava/lang/String;
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v16    # "needRawQuery":Z
    .restart local v17    # "needRowsAffectedCompat":Z
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v22    # "rowsAffected":I
    .restart local v23    # "rowsAffectedCompat":I
    :catch_7
    move-exception v2

    goto/16 :goto_2

    .line 504
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .end local v22    # "rowsAffected":I
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :catch_8
    move-exception v11

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_f

    .line 489
    :catch_9
    move-exception v11

    goto/16 :goto_e

    .line 475
    :catch_a
    move-exception v11

    goto/16 :goto_d

    .line 460
    :catch_b
    move-exception v11

    goto/16 :goto_c

    .line 444
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v12    # "insertId":J
    .restart local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :catch_c
    move-exception v11

    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_b

    .end local v12    # "insertId":J
    .end local v15    # "myStatement":Landroid/database/sqlite/SQLiteStatement;
    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    :cond_c
    move-object/from16 v18, v19

    .end local v19    # "queryResult":Lorg/json/JSONObject;
    .restart local v18    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_8

    :cond_d
    move-object/from16 v19, v18

    .end local v18    # "queryResult":Lorg/json/JSONObject;
    .restart local v19    # "queryResult":Lorg/json/JSONObject;
    goto/16 :goto_3
.end method

.method private executeSqlStatementQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;
    .locals 17
    .param p1, "mydb"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "paramsAsJson"    # Lorg/json/JSONArray;
    .param p4, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 650
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 652
    .local v13, "rowsResult":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 654
    .local v3, "cur":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 656
    .local v10, "params":[Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    new-array v10, v14, [Ljava/lang/String;

    .line 658
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v8, v14, :cond_1

    .line 659
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 660
    const-string v14, ""

    aput-object v14, v10, v8

    .line 658
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 662
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v10, v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 666
    .end local v8    # "j":I
    :catch_0
    move-exception v6

    .line 667
    .local v6, "ex":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 668
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 669
    .local v5, "errorMessage":Ljava/lang/String;
    const-string v14, "executeSqlBatch"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SQLitePlugin.executeSql[Batch](): Error="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    throw v6

    .line 665
    .end local v5    # "errorMessage":Ljava/lang/String;
    .end local v6    # "ex":Ljava/lang/Exception;
    .restart local v8    # "j":I
    :cond_1
    :try_start_1
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 674
    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 675
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 676
    .local v12, "rowsArrayResult":Lorg/json/JSONArray;
    const-string v9, ""

    .line 677
    .local v9, "key":Ljava/lang/String;
    invoke-interface {v3}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    .line 681
    .local v2, "colCount":I
    :cond_2
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 683
    .local v11, "row":Lorg/json/JSONObject;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v2, :cond_6

    .line 684
    :try_start_2
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v9

    .line 686
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    const/16 v15, 0xb

    if-lt v14, v15, :cond_5

    .line 690
    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lorg/pgsqlite/SQLitePlugin;->bindPostHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 683
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 691
    :catch_1
    move-exception v6

    .line 692
    .restart local v6    # "ex":Ljava/lang/Exception;
    :try_start_4
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lorg/pgsqlite/SQLitePlugin;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 701
    .end local v6    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v4

    .line 702
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 704
    .end local v4    # "e":Lorg/json/JSONException;
    :goto_4
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v14

    if-nez v14, :cond_2

    .line 707
    :try_start_5
    const-string v14, "rows"

    invoke-virtual {v13, v14, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3

    .line 713
    .end local v2    # "colCount":I
    .end local v7    # "i":I
    .end local v9    # "key":Ljava/lang/String;
    .end local v11    # "row":Lorg/json/JSONObject;
    .end local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_3
    :goto_5
    if-eqz v3, :cond_4

    .line 714
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 717
    :cond_4
    return-object v13

    .line 695
    .restart local v2    # "colCount":I
    .restart local v7    # "i":I
    .restart local v9    # "key":Ljava/lang/String;
    .restart local v11    # "row":Lorg/json/JSONObject;
    .restart local v12    # "rowsArrayResult":Lorg/json/JSONArray;
    :cond_5
    :try_start_6
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9, v3, v7}, Lorg/pgsqlite/SQLitePlugin;->bindPreHoneycomb(Lorg/json/JSONObject;Ljava/lang/String;Landroid/database/Cursor;I)V

    goto :goto_3

    .line 699
    :cond_6
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_4

    .line 708
    :catch_3
    move-exception v4

    .line 709
    .restart local v4    # "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5
.end method

.method private getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .param p1, "dbname"    # Ljava/lang/String;

    .prologue
    .line 341
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 342
    .local v0, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->mydb:Landroid/database/sqlite/SQLiteDatabase;

    goto :goto_0
.end method

.method private getQueryType(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$QueryType;
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 616
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->FIRST_WORD:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 617
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 619
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/pgsqlite/SQLitePlugin$QueryType;->valueOf(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$QueryType;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 624
    :goto_0
    return-object v1

    .line 620
    :catch_0
    move-exception v1

    .line 624
    :cond_0
    sget-object v1, Lorg/pgsqlite/SQLitePlugin$QueryType;->other:Lorg/pgsqlite/SQLitePlugin$QueryType;

    goto :goto_0
.end method

.method private openDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 6
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 220
    :try_start_0
    invoke-direct {p0, p1}, Lorg/pgsqlite/SQLitePlugin;->getDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 222
    const-string v3, "database already open"

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 223
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "database already open"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    :catch_0
    move-exception v1

    .line 240
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t open database "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 241
    throw v1

    .line 226
    .end local v1    # "e":Landroid/database/sqlite/SQLiteException;
    :cond_0
    :try_start_1
    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/app/Activity;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 228
    .local v0, "dbfile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 229
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 232
    :cond_1
    const-string v3, "info"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Open sqlite db: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 236
    .local v2, "mydb":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 238
    return-object v2
.end method

.method private startDatabase(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "dbname"    # Ljava/lang/String;
    .param p2, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 199
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 202
    .local v0, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 212
    :goto_0
    return-void

    .line 208
    :cond_0
    new-instance v0, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .end local v0    # "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    invoke-direct {v0, p0, p1, p2}, Lorg/pgsqlite/SQLitePlugin$DBRunner;-><init>(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 209
    .restart local v0    # "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "actionAsString"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v2, 0x0

    .line 74
    :try_start_0
    invoke-static {p1}, Lorg/pgsqlite/SQLitePlugin$Action;->valueOf(Ljava/lang/String;)Lorg/pgsqlite/SQLitePlugin$Action;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 82
    .local v0, "action":Lorg/pgsqlite/SQLitePlugin$Action;
    :try_start_1
    invoke-direct {p0, v0, p2, p3}, Lorg/pgsqlite/SQLitePlugin;->executeAndPossiblyThrow(Lorg/pgsqlite/SQLitePlugin$Action;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    .line 86
    .end local v0    # "action":Lorg/pgsqlite/SQLitePlugin$Action;
    :goto_0
    return v2

    .line 75
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-class v3, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "unexpected error"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 83
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "action":Lorg/pgsqlite/SQLitePlugin$Action;
    :catch_1
    move-exception v1

    .line 85
    .local v1, "e":Lorg/json/JSONException;
    const-class v3, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "unexpected error"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    .line 176
    :goto_0
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 177
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 179
    .local v0, "dbname":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/pgsqlite/SQLitePlugin;->closeDatabaseNow(Ljava/lang/String;)V

    .line 181
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/pgsqlite/SQLitePlugin$DBRunner;

    .line 184
    .local v2, "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    :try_start_0
    iget-object v3, v2, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v4, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    invoke-direct {v4, p0}, Lorg/pgsqlite/SQLitePlugin$DBQuery;-><init>(Lorg/pgsqlite/SQLitePlugin;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    :goto_1
    sget-object v3, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 185
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/Exception;
    const-class v3, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "couldn\'t stop db thread"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 190
    .end local v0    # "dbname":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "r":Lorg/pgsqlite/SQLitePlugin$DBRunner;
    :cond_0
    return-void
.end method
