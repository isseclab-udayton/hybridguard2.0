.class Lorg/pgsqlite/SQLitePlugin$DBRunner;
.super Ljava/lang/Object;
.source "SQLitePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/pgsqlite/SQLitePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DBRunner"
.end annotation


# instance fields
.field final dbname:Ljava/lang/String;

.field mydb:Landroid/database/sqlite/SQLiteDatabase;

.field final openCbc:Lorg/apache/cordova/CallbackContext;

.field final q:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lorg/pgsqlite/SQLitePlugin$DBQuery;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/pgsqlite/SQLitePlugin;


# direct methods
.method constructor <init>(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p2, "dbname"    # Ljava/lang/String;
    .param p3, "cbc"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 771
    iput-object p1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->this$0:Lorg/pgsqlite/SQLitePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 772
    iput-object p2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    .line 773
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    .line 774
    iput-object p3, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->openCbc:Lorg/apache/cordova/CallbackContext;

    .line 775
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 779
    :try_start_0
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->this$0:Lorg/pgsqlite/SQLitePlugin;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    iget-object v3, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->openCbc:Lorg/apache/cordova/CallbackContext;

    invoke-static {v1, v2, v3}, Lorg/pgsqlite/SQLitePlugin;->access$000(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->mydb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 786
    const/4 v7, 0x0

    .line 789
    .local v7, "dbq":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    :try_start_1
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    move-object v7, v0

    .line 791
    :goto_0
    iget-boolean v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->stop:Z

    if-nez v1, :cond_1

    .line 792
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->this$0:Lorg/pgsqlite/SQLitePlugin;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    iget-object v3, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queries:[Ljava/lang/String;

    iget-object v4, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->jsonparams:[Lorg/json/JSONArray;

    iget-object v5, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->queryIDs:[Ljava/lang/String;

    iget-object v6, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-static/range {v1 .. v6}, Lorg/pgsqlite/SQLitePlugin;->access$100(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;[Ljava/lang/String;[Lorg/json/JSONArray;[Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    .line 794
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->q:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lorg/pgsqlite/SQLitePlugin$DBQuery;

    move-object v7, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 780
    .end local v7    # "dbq":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    :catch_0
    move-exception v9

    .line 781
    .local v9, "e":Ljava/lang/Exception;
    const-class v1, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "unexpected error, stopping db thread"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 782
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-void

    .line 796
    .restart local v7    # "dbq":Lorg/pgsqlite/SQLitePlugin$DBQuery;
    :catch_1
    move-exception v9

    .line 797
    .restart local v9    # "e":Ljava/lang/Exception;
    const-class v1, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "unexpected error"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 800
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_1
    if-eqz v7, :cond_0

    iget-boolean v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->close:Z

    if-eqz v1, :cond_0

    .line 802
    :try_start_2
    sget-object v1, Lorg/pgsqlite/SQLitePlugin;->dbrmap:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 804
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->this$0:Lorg/pgsqlite/SQLitePlugin;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/pgsqlite/SQLitePlugin;->access$200(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;)V

    .line 806
    iget-boolean v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->delete:Z

    if-nez v1, :cond_2

    .line 807
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 821
    :catch_2
    move-exception v9

    .line 822
    .restart local v9    # "e":Ljava/lang/Exception;
    const-class v1, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "couldn\'t close database"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 823
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 824
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "couldn\'t close database: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 810
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    iget-object v1, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->this$0:Lorg/pgsqlite/SQLitePlugin;

    iget-object v2, p0, Lorg/pgsqlite/SQLitePlugin$DBRunner;->dbname:Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/pgsqlite/SQLitePlugin;->access$300(Lorg/pgsqlite/SQLitePlugin;Ljava/lang/String;)Z

    move-result v8

    .line 811
    .local v8, "deleteResult":Z
    if-eqz v8, :cond_3

    .line 812
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 816
    .end local v8    # "deleteResult":Z
    :catch_3
    move-exception v9

    .line 817
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_4
    const-class v1, Lorg/pgsqlite/SQLitePlugin;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "couldn\'t delete database"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 818
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "couldn\'t delete database: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1

    .line 814
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v8    # "deleteResult":Z
    :cond_3
    :try_start_5
    iget-object v1, v7, Lorg/pgsqlite/SQLitePlugin$DBQuery;->cbc:Lorg/apache/cordova/CallbackContext;

    const-string v2, "couldn\'t delete database"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_1
.end method
