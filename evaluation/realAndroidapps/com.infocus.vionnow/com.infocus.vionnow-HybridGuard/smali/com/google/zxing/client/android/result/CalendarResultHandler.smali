.class public final Lcom/google/zxing/client/android/result/CalendarResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "CalendarResultHandler.java"


# static fields
.field private static final DATE_FORMAT:Ljava/text/DateFormat;

.field private static final DATE_TIME_FORMAT:Ljava/text/DateFormat;

.field private static final buttons:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 39
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_FORMAT:Ljava/text/DateFormat;

    .line 40
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd\'T\'HHmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_TIME_FORMAT:Ljava/text/DateFormat;

    .line 42
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 43
    sget v2, Lcom/google/zxing/client/android/R$string;->button_add_calendar:I

    aput v2, v0, v1

    .line 42
    sput-object v0, Lcom/google/zxing/client/android/result/CalendarResultHandler;->buttons:[I

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    .line 48
    return-void
.end method

.method private static appendTime(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .locals 12
    .param p0, "when"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v11, 0x10

    const/16 v10, 0xf

    .line 93
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_0

    .line 96
    sget-object v6, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_FORMAT:Ljava/text/DateFormat;

    monitor-enter v6

    .line 97
    :try_start_0
    sget-object v5, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_FORMAT:Ljava/text/DateFormat;

    new-instance v7, Ljava/text/ParsePosition;

    const/4 v8, 0x0

    invoke-direct {v7, v8}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v5, p0, v7}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v1

    .line 96
    .local v1, "date":Ljava/util/Date;
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v5

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 114
    :goto_0
    return-void

    .line 96
    .end local v1    # "date":Ljava/util/Date;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 103
    :cond_0
    sget-object v6, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_TIME_FORMAT:Ljava/text/DateFormat;

    monitor-enter v6

    .line 104
    :try_start_2
    sget-object v5, Lcom/google/zxing/client/android/result/CalendarResultHandler;->DATE_TIME_FORMAT:Ljava/text/DateFormat;

    const/4 v7, 0x0

    const/16 v8, 0xf

    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/text/ParsePosition;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v5, v7, v8}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v1

    .line 103
    .restart local v1    # "date":Ljava/util/Date;
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 106
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 107
    .local v2, "milliseconds":J
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v5, v11, :cond_1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5a

    if-ne v5, v6, :cond_1

    .line 108
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 109
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v6

    add-int v4, v5, v6

    .line 110
    .local v4, "offset":I
    int-to-long v5, v4

    add-long/2addr v2, v5

    .line 112
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v4    # "offset":I
    :cond_1
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    goto :goto_0

    .line 103
    .end local v1    # "date":Ljava/util/Date;
    .end local v2    # "milliseconds":J
    :catchall_1
    move-exception v5

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/google/zxing/client/android/result/CalendarResultHandler;->buttons:[I

    array-length v0, v0

    return v0
.end method

.method public getButtonText(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 57
    sget-object v0, Lcom/google/zxing/client/android/result/CalendarResultHandler;->buttons:[I

    aget v0, v0, p1

    return v0
.end method

.method public getDisplayContents()Ljava/lang/CharSequence;
    .locals 4

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/CalendarResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/client/result/CalendarParsedResult;

    .line 75
    .local v0, "calResult":Lcom/google/zxing/client/result/CalendarParsedResult;
    new-instance v2, Ljava/lang/StringBuffer;

    const/16 v3, 0x64

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 76
    .local v2, "result":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getSummary()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 77
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getStart()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/zxing/client/android/result/CalendarResultHandler;->appendTime(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 80
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getEnd()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "endString":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 82
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getStart()Ljava/lang/String;

    move-result-object v1

    .line 84
    :cond_0
    invoke-static {v1, v2}, Lcom/google/zxing/client/android/result/CalendarResultHandler;->appendTime(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 86
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getLocation()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 87
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getAttendee()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 88
    invoke-virtual {v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 118
    sget v0, Lcom/google/zxing/client/android/R$string;->result_calendar:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/CalendarResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/client/result/CalendarParsedResult;

    .line 63
    .local v6, "calendarResult":Lcom/google/zxing/client/result/CalendarParsedResult;
    if-nez p1, :cond_0

    .line 64
    invoke-virtual {v6}, Lcom/google/zxing/client/result/CalendarParsedResult;->getSummary()Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-virtual {v6}, Lcom/google/zxing/client/result/CalendarParsedResult;->getStart()Ljava/lang/String;

    move-result-object v2

    .line 66
    invoke-virtual {v6}, Lcom/google/zxing/client/result/CalendarParsedResult;->getEnd()Ljava/lang/String;

    move-result-object v3

    .line 67
    invoke-virtual {v6}, Lcom/google/zxing/client/result/CalendarParsedResult;->getLocation()Ljava/lang/String;

    move-result-object v4

    .line 68
    invoke-virtual {v6}, Lcom/google/zxing/client/result/CalendarParsedResult;->getDescription()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    .line 64
    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/client/android/result/CalendarResultHandler;->addCalendarEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    :cond_0
    return-void
.end method
