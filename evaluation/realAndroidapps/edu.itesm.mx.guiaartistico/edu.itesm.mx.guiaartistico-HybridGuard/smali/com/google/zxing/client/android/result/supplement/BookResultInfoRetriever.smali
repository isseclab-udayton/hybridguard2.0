.class final Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;
.super Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;
.source "BookResultInfoRetriever.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final isbn:Ljava/lang/String;

.field private final source:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Ljava/lang/String;Lcom/google/zxing/client/android/history/HistoryManager;Landroid/content/Context;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "isbn"    # Ljava/lang/String;
    .param p3, "historyManager"    # Lcom/google/zxing/client/android/history/HistoryManager;
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0, p1, p3}, Lcom/google/zxing/client/android/result/supplement/SupplementalInfoRetriever;-><init>(Landroid/widget/TextView;Lcom/google/zxing/client/android/history/HistoryManager;)V

    .line 47
    iput-object p2, p0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->isbn:Ljava/lang/String;

    .line 48
    sget v0, Lcom/google/zxing/client/android/R$string;->msg_google_books:I

    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->source:Ljava/lang/String;

    .line 49
    iput-object p4, p0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->context:Landroid/content/Context;

    .line 50
    return-void
.end method


# virtual methods
.method retrieveSupplementalInfo()V
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "https://www.googleapis.com/books/v1/volumes?q=isbn:"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->isbn:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 56
    sget-object v22, Lcom/google/zxing/client/android/HttpHelper$ContentType;->JSON:Lcom/google/zxing/client/android/HttpHelper$ContentType;

    .line 55
    invoke-static/range {v21 .. v22}, Lcom/google/zxing/client/android/HttpHelper;->downloadViaHttp(Ljava/lang/String;Lcom/google/zxing/client/android/HttpHelper$ContentType;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 58
    .local v11, "contents":Ljava/lang/CharSequence;
    invoke-interface {v11}, Ljava/lang/CharSequence;->length()I

    move-result v21

    if-nez v21, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    const/4 v6, 0x0

    .line 68
    .local v6, "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :try_start_0
    new-instance v21, Lorg/json/JSONTokener;

    invoke-interface {v11}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/json/JSONObject;

    .line 69
    .local v19, "topLevel":Lorg/json/JSONObject;
    const-string v21, "items"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    .line 70
    .local v15, "items":Lorg/json/JSONArray;
    if-eqz v15, :cond_0

    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v21

    if-nez v21, :cond_0

    .line 74
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/json/JSONObject;

    const-string v22, "volumeInfo"

    invoke-virtual/range {v21 .. v22}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    .line 75
    .local v20, "volumeInfo":Lorg/json/JSONObject;
    if-eqz v20, :cond_0

    .line 79
    const-string v21, "title"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 80
    .local v18, "title":Ljava/lang/String;
    const-string v21, "pageCount"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 82
    .local v17, "pages":Ljava/lang/String;
    const-string v21, "authors"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 83
    .local v8, "authorsArray":Lorg/json/JSONArray;
    if-eqz v8, :cond_2

    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v8, v0}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v21

    if-nez v21, :cond_2

    .line 84
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v21

    move/from16 v0, v21

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local v7, "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    :try_start_1
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v21

    move/from16 v0, v21

    if-lt v14, v0, :cond_6

    move-object v6, v7

    .line 94
    .end local v7    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v14    # "i":I
    .restart local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_2
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v16, "newTexts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz v18, :cond_3

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_3

    .line 97
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_3
    if-eqz v6, :cond_4

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v21

    if-nez v21, :cond_4

    .line 101
    const/4 v13, 0x1

    .line 102
    .local v13, "first":Z
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v9, "authorsText":Ljava/lang/StringBuilder;
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_2
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-nez v22, :cond_7

    .line 111
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 114
    .end local v9    # "authorsText":Ljava/lang/StringBuilder;
    .end local v13    # "first":Z
    :cond_4
    if-eqz v17, :cond_5

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_5

    .line 115
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "pp."

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_5
    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "http://www.google."

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/google/zxing/client/android/LocaleManager;->getBookSearchCountryTLD(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    .line 119
    const-string v22, "/search?tbm=bks&source=zxing&q="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    .line 118
    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 121
    .local v10, "baseBookUri":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->isbn:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->source:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Ljava/lang/String;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->isbn:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v21

    move-object/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/zxing/client/android/result/supplement/BookResultInfoRetriever;->append(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 86
    .end local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v10    # "baseBookUri":Ljava/lang/String;
    .end local v16    # "newTexts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v7    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v14    # "i":I
    :cond_6
    :try_start_2
    invoke-virtual {v8, v14}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 85
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1

    .line 90
    .end local v7    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v8    # "authorsArray":Lorg/json/JSONArray;
    .end local v14    # "i":I
    .end local v15    # "items":Lorg/json/JSONArray;
    .end local v17    # "pages":Ljava/lang/String;
    .end local v18    # "title":Ljava/lang/String;
    .end local v19    # "topLevel":Lorg/json/JSONObject;
    .end local v20    # "volumeInfo":Lorg/json/JSONObject;
    .restart local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :catch_0
    move-exception v12

    .line 91
    .local v12, "e":Lorg/json/JSONException;
    :goto_3
    new-instance v21, Ljava/io/IOException;

    invoke-virtual {v12}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 103
    .end local v12    # "e":Lorg/json/JSONException;
    .restart local v8    # "authorsArray":Lorg/json/JSONArray;
    .restart local v9    # "authorsText":Ljava/lang/StringBuilder;
    .restart local v13    # "first":Z
    .restart local v15    # "items":Lorg/json/JSONArray;
    .restart local v16    # "newTexts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v17    # "pages":Ljava/lang/String;
    .restart local v18    # "title":Ljava/lang/String;
    .restart local v19    # "topLevel":Lorg/json/JSONObject;
    .restart local v20    # "volumeInfo":Lorg/json/JSONObject;
    :cond_7
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 104
    .local v5, "author":Ljava/lang/String;
    if-eqz v13, :cond_8

    .line 105
    const/4 v13, 0x0

    .line 109
    :goto_4
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 107
    :cond_8
    const-string v22, ", "

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 90
    .end local v5    # "author":Ljava/lang/String;
    .end local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v9    # "authorsText":Ljava/lang/StringBuilder;
    .end local v13    # "first":Z
    .end local v16    # "newTexts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v7    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v14    # "i":I
    :catch_1
    move-exception v12

    move-object v6, v7

    .end local v7    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v6    # "authors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    goto :goto_3
.end method
