.class public final Lcom/google/zxing/client/android/history/HistoryManager;
.super Ljava/lang/Object;
.source "HistoryManager.java"


# static fields
.field private static final EXPORT_COL_PROJECTION:[Ljava/lang/String;

.field private static final EXPORT_DATE_TIME_FORMAT:Ljava/text/DateFormat;

.field private static final GET_ITEM_COL_PROJECTION:[Ljava/lang/String;

.field private static final ID_COL_PROJECTION:[Ljava/lang/String;

.field private static final MAX_ITEMS:I = 0x1f4

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Lcom/google/zxing/client/android/CaptureActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 57
    const-class v0, Lcom/google/zxing/client/android/history/HistoryManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    .line 61
    new-array v0, v6, [Ljava/lang/String;

    .line 62
    const-string v1, "text"

    aput-object v1, v0, v2

    .line 63
    const-string v1, "display"

    aput-object v1, v0, v3

    .line 64
    const-string v1, "format"

    aput-object v1, v0, v4

    .line 65
    const-string v1, "timestamp"

    aput-object v1, v0, v5

    .line 61
    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->GET_ITEM_COL_PROJECTION:[Ljava/lang/String;

    .line 67
    new-array v0, v6, [Ljava/lang/String;

    .line 68
    const-string v1, "text"

    aput-object v1, v0, v2

    .line 69
    const-string v1, "display"

    aput-object v1, v0, v3

    .line 70
    const-string v1, "format"

    aput-object v1, v0, v4

    .line 71
    const-string v1, "timestamp"

    aput-object v1, v0, v5

    .line 67
    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_COL_PROJECTION:[Ljava/lang/String;

    .line 73
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "id"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->ID_COL_PROJECTION:[Ljava/lang/String;

    .line 74
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_DATE_TIME_FORMAT:Ljava/text/DateFormat;

    .line 56
    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/client/android/CaptureActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/google/zxing/client/android/CaptureActivity;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    .line 80
    return-void
.end method

.method private deletePrevious(Ljava/lang/String;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v1, v3}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 161
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 167
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string v3, "history"

    const-string v4, "text=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 171
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v2

    .line 163
    .local v2, "sqle":Landroid/database/sqlite/SQLiteException;
    sget-object v3, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v4, "Error while opening database"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 168
    .end local v2    # "sqle":Landroid/database/sqlite/SQLiteException;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v3

    .line 169
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 170
    throw v3
.end method

.method private static massageHistoryField(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 279
    const-string v0, "\""

    const-string v1, "\"\""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static saveHistory(Ljava/lang/String;)Landroid/net/Uri;
    .locals 10
    .param p0, "history"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 252
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    const-string v8, "BarcodeScanner"

    invoke-direct {v0, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 253
    .local v0, "bsRoot":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v7, "History"

    invoke-direct {v2, v0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 254
    .local v2, "historyRoot":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_1

    .line 255
    sget-object v7, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Couldn\'t make dir "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    :cond_0
    :goto_0
    return-object v6

    .line 258
    :cond_1
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "history-"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".csv"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 259
    .local v1, "historyFile":Ljava/io/File;
    const/4 v4, 0x0

    .line 261
    .local v4, "out":Ljava/io/OutputStreamWriter;
    :try_start_0
    new-instance v5, Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v8, "UTF-8"

    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 262
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .local v5, "out":Ljava/io/OutputStreamWriter;
    :try_start_1
    invoke-virtual {v5, p0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 263
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "file://"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v6

    .line 268
    if-eqz v5, :cond_0

    .line 270
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 271
    :catch_0
    move-exception v7

    goto :goto_0

    .line 264
    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    :catch_1
    move-exception v3

    .line 265
    .local v3, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    sget-object v7, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Couldn\'t access file "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " due to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 268
    if-eqz v4, :cond_0

    .line 270
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 271
    :catch_2
    move-exception v7

    goto :goto_0

    .line 267
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 268
    :goto_2
    if-eqz v4, :cond_2

    .line 270
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 275
    :cond_2
    :goto_3
    throw v6

    .line 271
    :catch_3
    move-exception v7

    goto :goto_3

    .line 267
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .restart local v5    # "out":Ljava/io/OutputStreamWriter;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    goto :goto_2

    .line 264
    .end local v4    # "out":Ljava/io/OutputStreamWriter;
    .restart local v5    # "out":Ljava/io/OutputStreamWriter;
    :catch_4
    move-exception v3

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStreamWriter;
    .restart local v4    # "out":Ljava/io/OutputStreamWriter;
    goto :goto_1
.end method


# virtual methods
.method public addHistoryItem(Lcom/google/zxing/Result;Lcom/google/zxing/client/android/result/ResultHandler;)V
    .locals 8
    .param p1, "result"    # Lcom/google/zxing/Result;
    .param p2, "handler"    # Lcom/google/zxing/client/android/result/ResultHandler;

    .prologue
    .line 126
    iget-object v5, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v5}, Lcom/google/zxing/client/android/CaptureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "SAVE_HISTORY"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 127
    invoke-virtual {p2}, Lcom/google/zxing/client/android/result/ResultHandler;->areContentsSecure()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    iget-object v5, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 132
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v5, "preferences_remember_duplicates"

    const/4 v6, 0x0

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_2

    .line 133
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/zxing/client/android/history/HistoryManager;->deletePrevious(Ljava/lang/String;)V

    .line 136
    :cond_2
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v5, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v1, v5}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 139
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 146
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 147
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "text"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string v5, "format"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    const-string v5, "display"

    invoke-virtual {p2}, Lcom/google/zxing/client/android/result/ResultHandler;->getDisplayContents()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v5, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 151
    const-string v5, "history"

    const-string v6, "timestamp"

    invoke-virtual {v0, v5, v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 140
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v4    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v3

    .line 141
    .local v3, "sqle":Landroid/database/sqlite/SQLiteException;
    sget-object v5, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v6, "Error while opening database"

    invoke-static {v5, v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 152
    .end local v3    # "sqle":Landroid/database/sqlite/SQLiteException;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v5

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 154
    throw v5
.end method

.method public buildAlert()Landroid/app/AlertDialog;
    .locals 18

    .prologue
    .line 83
    new-instance v14, Lcom/google/zxing/client/android/history/DBHelper;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v14, v3}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 84
    .local v14, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v15, "items":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/Result;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v12, "dialogItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 87
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v11, 0x0

    .line 89
    .local v11, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v14}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 90
    const-string v2, "history"

    sget-object v3, Lcom/google/zxing/client/android/history/HistoryManager;->GET_ITEM_COL_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 91
    const-string v8, "timestamp DESC"

    .line 90
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 92
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_2

    .line 105
    if-eqz v11, :cond_0

    .line 106
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 108
    :cond_0
    if-eqz v1, :cond_1

    .line 109
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 113
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-virtual {v3}, Lcom/google/zxing/client/android/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    .line 114
    .local v16, "res":Landroid/content/res/Resources;
    sget v3, Lcom/google/zxing/client/android/R$string;->history_send:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    sget v3, Lcom/google/zxing/client/android/R$string;->history_clear_text:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    new-instance v10, Lcom/google/zxing/client/android/history/HistoryClickListener;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v3, v15}, Lcom/google/zxing/client/android/history/HistoryClickListener;-><init>(Lcom/google/zxing/client/android/history/HistoryManager;Lcom/google/zxing/client/android/CaptureActivity;Ljava/util/List;)V

    .line 117
    .local v10, "clickListener":Landroid/content/DialogInterface$OnClickListener;
    new-instance v9, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v9, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 118
    .local v9, "builder":Landroid/app/AlertDialog$Builder;
    sget v3, Lcom/google/zxing/client/android/R$string;->history_title:I

    invoke-virtual {v9, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 119
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v12, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v3, v10}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 120
    invoke-virtual {v9}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    return-object v3

    .line 93
    .end local v9    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v10    # "clickListener":Landroid/content/DialogInterface$OnClickListener;
    .end local v16    # "res":Landroid/content/res/Resources;
    :cond_2
    :try_start_1
    new-instance v2, Lcom/google/zxing/Result;

    const/4 v3, 0x0

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 94
    const/4 v6, 0x2

    invoke-interface {v11, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/zxing/BarcodeFormat;->valueOf(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    move-result-object v6

    const/4 v7, 0x3

    invoke-interface {v11, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 93
    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    .line 95
    .local v2, "result":Lcom/google/zxing/Result;
    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    const/4 v3, 0x1

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 97
    .local v13, "display":Ljava/lang/String;
    if-eqz v13, :cond_3

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_4

    .line 98
    :cond_3
    invoke-virtual {v2}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v13

    .line 100
    :cond_4
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 102
    .end local v2    # "result":Lcom/google/zxing/Result;
    .end local v13    # "display":Ljava/lang/String;
    :catch_0
    move-exception v17

    .line 103
    .local v17, "sqle":Landroid/database/sqlite/SQLiteException;
    :try_start_2
    sget-object v3, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v4, "Error while opening database"

    move-object/from16 v0, v17

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    if-eqz v11, :cond_5

    .line 106
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 108
    :cond_5
    if-eqz v1, :cond_1

    .line 109
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_1

    .line 104
    .end local v17    # "sqle":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v3

    .line 105
    if-eqz v11, :cond_6

    .line 106
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 108
    :cond_6
    if-eqz v1, :cond_7

    .line 109
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 111
    :cond_7
    throw v3
.end method

.method buildHistory()Ljava/lang/CharSequence;
    .locals 15

    .prologue
    .line 218
    new-instance v11, Ljava/lang/StringBuilder;

    const/16 v1, 0x3e8

    invoke-direct {v11, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 219
    .local v11, "historyText":Ljava/lang/StringBuilder;
    new-instance v10, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v10, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 222
    .local v10, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    :try_start_0
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 227
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 229
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "history"

    .line 230
    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_COL_PROJECTION:[Ljava/lang/String;

    .line 231
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 232
    const-string v7, "timestamp DESC"

    .line 229
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 233
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 243
    if-eqz v9, :cond_0

    .line 244
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 246
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 248
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v11    # "historyText":Ljava/lang/StringBuilder;
    :goto_1
    return-object v11

    .line 223
    .restart local v11    # "historyText":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v12

    .line 224
    .local v12, "sqle":Landroid/database/sqlite/SQLiteException;
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v2, "Error while opening database"

    invoke-static {v1, v2, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 225
    const-string v11, ""

    goto :goto_1

    .line 234
    .end local v12    # "sqle":Landroid/database/sqlite/SQLiteException;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_1
    const/4 v8, 0x0

    .local v8, "col":I
    :goto_2
    :try_start_2
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_COL_PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    if-lt v8, v1, :cond_3

    .line 238
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_COL_PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 239
    .local v13, "timestamp":J
    const/16 v1, 0x22

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 240
    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->EXPORT_DATE_TIME_FORMAT:Ljava/text/DateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v13, v14}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 239
    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 240
    const-string v2, "\"\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 242
    .end local v8    # "col":I
    .end local v13    # "timestamp":J
    :catchall_0
    move-exception v1

    .line 243
    if-eqz v9, :cond_2

    .line 244
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 246
    :cond_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 247
    throw v1

    .line 235
    .restart local v8    # "col":I
    :cond_3
    const/16 v1, 0x22

    :try_start_3
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/client/android/history/HistoryManager;->massageHistoryField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 234
    add-int/lit8 v8, v8, 0x1

    goto :goto_2
.end method

.method clearHistory()V
    .locals 6

    .prologue
    .line 283
    new-instance v1, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v3, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v1, v3}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 286
    .local v1, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 292
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    const-string v3, "history"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 294
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 296
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-void

    .line 287
    :catch_0
    move-exception v2

    .line 288
    .local v2, "sqle":Landroid/database/sqlite/SQLiteException;
    sget-object v3, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v4, "Error while opening database"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 293
    .end local v2    # "sqle":Landroid/database/sqlite/SQLiteException;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v3

    .line 294
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 295
    throw v3
.end method

.method public trimHistory()V
    .locals 12

    .prologue
    .line 174
    new-instance v10, Lcom/google/zxing/client/android/history/DBHelper;

    iget-object v1, p0, Lcom/google/zxing/client/android/history/HistoryManager;->activity:Lcom/google/zxing/client/android/CaptureActivity;

    invoke-direct {v10, v1}, Lcom/google/zxing/client/android/history/DBHelper;-><init>(Landroid/content/Context;)V

    .line 177
    .local v10, "helper":Landroid/database/sqlite/SQLiteOpenHelper;
    :try_start_0
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 182
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 184
    .local v9, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "history"

    .line 185
    sget-object v2, Lcom/google/zxing/client/android/history/HistoryManager;->ID_COL_PROJECTION:[Ljava/lang/String;

    .line 186
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 187
    const-string v7, "timestamp DESC"

    .line 184
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 188
    const/4 v8, 0x0

    .line 189
    .local v8, "count":I
    :goto_0
    const/16 v1, 0x1f4

    if-ge v8, v1, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_2

    .line 192
    :cond_0
    :goto_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_3

    .line 196
    if-eqz v9, :cond_1

    .line 197
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 199
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 201
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v8    # "count":I
    .end local v9    # "cursor":Landroid/database/Cursor;
    :goto_2
    return-void

    .line 178
    :catch_0
    move-exception v11

    .line 179
    .local v11, "sqle":Landroid/database/sqlite/SQLiteException;
    sget-object v1, Lcom/google/zxing/client/android/history/HistoryManager;->TAG:Ljava/lang/String;

    const-string v2, "Error while opening database"

    invoke-static {v1, v2, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 190
    .end local v11    # "sqle":Landroid/database/sqlite/SQLiteException;
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v8    # "count":I
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 193
    :cond_3
    :try_start_2
    const-string v1, "history"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 195
    .end local v8    # "count":I
    :catchall_0
    move-exception v1

    .line 196
    if-eqz v9, :cond_4

    .line 197
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 199
    :cond_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 200
    throw v1
.end method
