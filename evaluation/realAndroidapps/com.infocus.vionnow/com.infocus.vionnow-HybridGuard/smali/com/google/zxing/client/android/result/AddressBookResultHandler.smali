.class public final Lcom/google/zxing/client/android/result/AddressBookResultHandler;
.super Lcom/google/zxing/client/android/result/ResultHandler;
.source "AddressBookResultHandler.java"


# static fields
.field private static final DATE_FORMATS:[Ljava/text/DateFormat;


# instance fields
.field private buttonCount:I

.field private final fields:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 41
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/text/DateFormat;

    const/4 v1, 0x0

    .line 42
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMdd"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 43
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMdd\'T\'HHmmss"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 44
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 45
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ss"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    .line 41
    sput-object v0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->DATE_FORMATS:[Ljava/text/DateFormat;

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V
    .locals 12
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "result"    # Lcom/google/zxing/client/result/ParsedResult;

    .prologue
    const/4 v11, 0x4

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/client/android/result/ResultHandler;-><init>(Landroid/app/Activity;Lcom/google/zxing/client/result/ParsedResult;)V

    move-object v0, p2

    .line 70
    check-cast v0, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 71
    .local v0, "addressResult":Lcom/google/zxing/client/result/AddressBookParsedResult;
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "addresses":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v10, v1

    if-lez v10, :cond_0

    aget-object v10, v1, v9

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_0

    move v3, v8

    .line 73
    .local v3, "hasAddress":Z
    :goto_0
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v6

    .line 74
    .local v6, "phoneNumbers":[Ljava/lang/String;
    if-eqz v6, :cond_1

    array-length v10, v6

    if-lez v10, :cond_1

    move v5, v8

    .line 75
    .local v5, "hasPhoneNumber":Z
    :goto_1
    invoke-virtual {v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "emails":[Ljava/lang/String;
    if-eqz v2, :cond_2

    array-length v10, v2

    if-lez v10, :cond_2

    move v4, v8

    .line 78
    .local v4, "hasEmailAddress":Z
    :goto_2
    new-array v10, v11, [Z

    iput-object v10, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    .line 79
    iget-object v10, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aput-boolean v8, v10, v9

    .line 80
    iget-object v10, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aput-boolean v3, v10, v8

    .line 81
    iget-object v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    const/4 v10, 0x2

    aput-boolean v5, v8, v10

    .line 82
    iget-object v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    const/4 v10, 0x3

    aput-boolean v4, v8, v10

    .line 84
    iput v9, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    .line 85
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_3
    if-lt v7, v11, :cond_3

    .line 90
    return-void

    .end local v2    # "emails":[Ljava/lang/String;
    .end local v3    # "hasAddress":Z
    .end local v4    # "hasEmailAddress":Z
    .end local v5    # "hasPhoneNumber":Z
    .end local v6    # "phoneNumbers":[Ljava/lang/String;
    .end local v7    # "x":I
    :cond_0
    move v3, v9

    .line 72
    goto :goto_0

    .restart local v3    # "hasAddress":Z
    .restart local v6    # "phoneNumbers":[Ljava/lang/String;
    :cond_1
    move v5, v9

    .line 74
    goto :goto_1

    .restart local v2    # "emails":[Ljava/lang/String;
    .restart local v5    # "hasPhoneNumber":Z
    :cond_2
    move v4, v9

    .line 76
    goto :goto_2

    .line 86
    .restart local v4    # "hasEmailAddress":Z
    .restart local v7    # "x":I
    :cond_3
    iget-object v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aget-boolean v8, v8, v7

    if-eqz v8, :cond_4

    .line 87
    iget v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    .line 85
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_3
.end method

.method private mapIndexToAction(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 54
    iget v2, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    if-ge p1, v2, :cond_0

    .line 55
    const/4 v0, -0x1

    .line 56
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "x":I
    :goto_0
    const/4 v2, 0x4

    if-lt v1, v2, :cond_2

    .line 65
    .end local v0    # "count":I
    .end local v1    # "x":I
    :cond_0
    const/4 v1, -0x1

    :cond_1
    return v1

    .line 57
    .restart local v0    # "count":I
    .restart local v1    # "x":I
    :cond_2
    iget-object v2, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->fields:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_3

    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 60
    :cond_3
    if-eq v0, p1, :cond_1

    .line 56
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 144
    sget-object v3, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->DATE_FORMATS:[Ljava/text/DateFormat;

    array-length v4, v3

    :goto_0
    if-lt v2, v4, :cond_0

    .line 153
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 144
    :cond_0
    aget-object v0, v3, v2

    .line 145
    .local v0, "currentFomat":Ljava/text/DateFormat;
    monitor-enter v0

    .line 146
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v0, v5}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 147
    new-instance v5, Ljava/text/ParsePosition;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v0, p0, v5}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v1

    .line 148
    .local v1, "result":Ljava/util/Date;
    if-eqz v1, :cond_1

    .line 149
    monitor-exit v0

    goto :goto_1

    .line 145
    .end local v1    # "result":Ljava/util/Date;
    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "result":Ljava/util/Date;
    :cond_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getButtonCount()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->buttonCount:I

    return v0
.end method

.method public getButtonText(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->mapIndexToAction(I)I

    move-result v0

    .line 100
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 110
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 102
    :pswitch_0
    sget v1, Lcom/google/zxing/client/android/R$string;->button_add_contact:I

    .line 108
    :goto_0
    return v1

    .line 104
    :pswitch_1
    sget v1, Lcom/google/zxing/client/android/R$string;->button_show_map:I

    goto :goto_0

    .line 106
    :pswitch_2
    sget v1, Lcom/google/zxing/client/android/R$string;->button_dial:I

    goto :goto_0

    .line 108
    :pswitch_3
    sget v1, Lcom/google/zxing/client/android/R$string;->button_email:I

    goto :goto_0

    .line 100
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getDisplayContents()Ljava/lang/CharSequence;
    .locals 13

    .prologue
    const/4 v10, 0x0

    .line 159
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 160
    .local v7, "result":Lcom/google/zxing/client/result/AddressBookParsedResult;
    new-instance v1, Ljava/lang/StringBuffer;

    const/16 v9, 0x64

    invoke-direct {v1, v9}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 161
    .local v1, "contents":Ljava/lang/StringBuffer;
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 162
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    .line 164
    .local v3, "namesLength":I
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPronunciation()Ljava/lang/String;

    move-result-object v6

    .line 165
    .local v6, "pronunciation":Ljava/lang/String;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_0

    .line 166
    const-string v9, "\n("

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 168
    const/16 v9, 0x29

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 171
    :cond_0
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getTitle()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 172
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getOrg()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 173
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 174
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v5

    .line 175
    .local v5, "numbers":[Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 176
    array-length v11, v5

    move v9, v10

    :goto_0
    if-lt v9, v11, :cond_3

    .line 180
    :cond_1
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 181
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getURL()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 183
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getBirthday()Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "birthday":Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 185
    invoke-static {v0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 186
    .local v2, "date":Ljava/util/Date;
    if-eqz v2, :cond_2

    .line 187
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v9

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 190
    .end local v2    # "date":Ljava/util/Date;
    :cond_2
    invoke-virtual {v7}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNote()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 192
    if-lez v3, :cond_4

    .line 194
    new-instance v8, Landroid/text/SpannableString;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 195
    .local v8, "styled":Landroid/text/Spannable;
    new-instance v9, Landroid/text/style/StyleSpan;

    const/4 v11, 0x1

    invoke-direct {v9, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-interface {v8, v9, v10, v3, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 198
    .end local v8    # "styled":Landroid/text/Spannable;
    :goto_1
    return-object v8

    .line 176
    .end local v0    # "birthday":Ljava/lang/String;
    :cond_3
    aget-object v4, v5, v9

    .line 177
    .local v4, "number":Ljava/lang/String;
    invoke-static {v4}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v1}, Lcom/google/zxing/client/result/ParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 176
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 198
    .end local v4    # "number":Ljava/lang/String;
    .restart local v0    # "birthday":Ljava/lang/String;
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1
.end method

.method public getDisplayTitle()I
    .locals 1

    .prologue
    .line 204
    sget v0, Lcom/google/zxing/client/android/R$string;->result_address_book:I

    return v0
.end method

.method public handleButtonPress(I)V
    .locals 13
    .param p1, "index"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 116
    invoke-virtual {p0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->getResult()Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v9

    check-cast v9, Lcom/google/zxing/client/result/AddressBookParsedResult;

    .line 117
    .local v9, "addressResult":Lcom/google/zxing/client/result/AddressBookParsedResult;
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getAddresses()[Ljava/lang/String;

    move-result-object v10

    .line 118
    .local v10, "addresses":[Ljava/lang/String;
    if-eqz v10, :cond_0

    array-length v1, v10

    const/4 v2, 0x1

    if-ge v1, v2, :cond_1

    :cond_0
    move-object v5, v0

    .line 119
    .local v5, "address1":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->mapIndexToAction(I)I

    move-result v8

    .line 120
    .local v8, "action":I
    packed-switch v8, :pswitch_data_0

    .line 141
    :goto_1
    return-void

    .line 118
    .end local v5    # "address1":Ljava/lang/String;
    .end local v8    # "action":I
    :cond_1
    aget-object v5, v10, v3

    goto :goto_0

    .line 122
    .restart local v5    # "address1":Ljava/lang/String;
    .restart local v8    # "action":I
    :pswitch_0
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v2

    .line 123
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNote()Ljava/lang/String;

    move-result-object v4

    .line 124
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getOrg()Ljava/lang/String;

    move-result-object v6

    .line 125
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getTitle()Ljava/lang/String;

    move-result-object v7

    move-object v0, p0

    .line 122
    invoke-virtual/range {v0 .. v7}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->addContact([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 128
    :pswitch_1
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getNames()[Ljava/lang/String;

    move-result-object v11

    .line 129
    .local v11, "names":[Ljava/lang/String;
    if-eqz v11, :cond_2

    aget-object v12, v11, v3

    .line 130
    .local v12, "title":Ljava/lang/String;
    :goto_2
    invoke-virtual {p0, v5, v12}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->searchMap(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .end local v12    # "title":Ljava/lang/String;
    :cond_2
    move-object v12, v0

    .line 129
    goto :goto_2

    .line 133
    .end local v11    # "names":[Ljava/lang/String;
    :pswitch_2
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getPhoneNumbers()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-virtual {p0, v0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->dialPhone(Ljava/lang/String;)V

    goto :goto_1

    .line 136
    :pswitch_3
    invoke-virtual {v9}, Lcom/google/zxing/client/result/AddressBookParsedResult;->getEmails()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    invoke-virtual {p0, v1, v0, v0}, Lcom/google/zxing/client/android/result/AddressBookResultHandler;->sendEmail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 120
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
