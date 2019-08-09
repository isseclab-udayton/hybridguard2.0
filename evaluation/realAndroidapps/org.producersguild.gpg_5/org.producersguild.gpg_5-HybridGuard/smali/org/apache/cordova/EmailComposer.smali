.class public Lorg/apache/cordova/EmailComposer;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "EmailComposer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    return-void
.end method

.method private sendEmail(Lorg/json/JSONObject;)V
    .locals 22
    .param p1, "parameters"    # Lorg/json/JSONObject;

    .prologue
    .line 50
    new-instance v10, Landroid/content/Intent;

    const-string v19, "android.intent.action.SEND_MULTIPLE"

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 54
    .local v10, "emailIntent":Landroid/content/Intent;
    const/4 v13, 0x0

    .line 56
    .local v13, "isHTML":Z
    :try_start_0
    const-string v19, "bIsHTML"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v13

    .line 61
    :goto_0
    if-eqz v13, :cond_2

    .line 62
    const-string v19, "text/html"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    :goto_1
    :try_start_1
    const-string v19, "subject"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 70
    .local v14, "subject":Ljava/lang/String;
    if-eqz v14, :cond_0

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_0

    .line 71
    const-string v19, "android.intent.extra.SUBJECT"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 79
    .end local v14    # "subject":Ljava/lang/String;
    :cond_0
    :goto_2
    :try_start_2
    const-string v19, "body"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "body":Ljava/lang/String;
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_1

    .line 81
    if-eqz v13, :cond_3

    .line 82
    const-string v19, "android.intent.extra.TEXT"

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 93
    .end local v6    # "body":Ljava/lang/String;
    :cond_1
    :goto_3
    :try_start_3
    const-string v19, "toRecipients"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 94
    .local v16, "toRecipients":Lorg/json/JSONArray;
    if-eqz v16, :cond_5

    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_5

    .line 95
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    new-array v15, v0, [Ljava/lang/String;

    .line 96
    .local v15, "to":[Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_4

    .line 97
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v15, v12
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 96
    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 57
    .end local v12    # "i":I
    .end local v15    # "to":[Ljava/lang/String;
    .end local v16    # "toRecipients":Lorg/json/JSONArray;
    :catch_0
    move-exception v9

    .line 58
    .local v9, "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling isHTML param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 64
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v19, "text/plain"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_1

    .line 73
    :catch_1
    move-exception v9

    .line 74
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling subject param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 84
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v6    # "body":Ljava/lang/String;
    :cond_3
    :try_start_4
    const-string v19, "android.intent.extra.TEXT"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 87
    .end local v6    # "body":Ljava/lang/String;
    :catch_2
    move-exception v9

    .line 88
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling body param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 99
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v12    # "i":I
    .restart local v15    # "to":[Ljava/lang/String;
    .restart local v16    # "toRecipients":Lorg/json/JSONArray;
    :cond_4
    :try_start_5
    const-string v19, "android.intent.extra.EMAIL"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 107
    .end local v12    # "i":I
    .end local v15    # "to":[Ljava/lang/String;
    .end local v16    # "toRecipients":Lorg/json/JSONArray;
    :cond_5
    :goto_5
    :try_start_6
    const-string v19, "ccRecipients"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 108
    .local v8, "ccRecipients":Lorg/json/JSONArray;
    if-eqz v8, :cond_7

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_7

    .line 109
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    new-array v7, v0, [Ljava/lang/String;

    .line 110
    .local v7, "cc":[Ljava/lang/String;
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_6
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_6

    .line 111
    invoke-virtual {v8, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v7, v12
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 110
    add-int/lit8 v12, v12, 0x1

    goto :goto_6

    .line 101
    .end local v7    # "cc":[Ljava/lang/String;
    .end local v8    # "ccRecipients":Lorg/json/JSONArray;
    .end local v12    # "i":I
    :catch_3
    move-exception v9

    .line 102
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling toRecipients param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 113
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v7    # "cc":[Ljava/lang/String;
    .restart local v8    # "ccRecipients":Lorg/json/JSONArray;
    .restart local v12    # "i":I
    :cond_6
    :try_start_7
    const-string v19, "android.intent.extra.CC"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 121
    .end local v7    # "cc":[Ljava/lang/String;
    .end local v8    # "ccRecipients":Lorg/json/JSONArray;
    .end local v12    # "i":I
    :cond_7
    :goto_7
    :try_start_8
    const-string v19, "bccRecipients"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 122
    .local v5, "bccRecipients":Lorg/json/JSONArray;
    if-eqz v5, :cond_9

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_9

    .line 123
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    new-array v4, v0, [Ljava/lang/String;

    .line 124
    .local v4, "bcc":[Ljava/lang/String;
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_8
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_8

    .line 125
    invoke-virtual {v5, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v4, v12
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 124
    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 115
    .end local v4    # "bcc":[Ljava/lang/String;
    .end local v5    # "bccRecipients":Lorg/json/JSONArray;
    .end local v12    # "i":I
    :catch_4
    move-exception v9

    .line 116
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling ccRecipients param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 127
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v4    # "bcc":[Ljava/lang/String;
    .restart local v5    # "bccRecipients":Lorg/json/JSONArray;
    .restart local v12    # "i":I
    :cond_8
    :try_start_9
    const-string v19, "android.intent.extra.BCC"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 135
    .end local v4    # "bcc":[Ljava/lang/String;
    .end local v5    # "bccRecipients":Lorg/json/JSONArray;
    .end local v12    # "i":I
    :cond_9
    :goto_9
    :try_start_a
    const-string v19, "attachments"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 136
    .local v3, "attachments":Lorg/json/JSONArray;
    if-eqz v3, :cond_b

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v19

    if-lez v19, :cond_b

    .line 137
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v18, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_a
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_c

    .line 141
    :try_start_b
    new-instance v11, Ljava/io/File;

    invoke-virtual {v3, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 142
    .local v11, "file":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_a

    .line 143
    invoke-static {v11}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v17

    .line 144
    .local v17, "uri":Landroid/net/Uri;
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    .line 139
    .end local v11    # "file":Ljava/io/File;
    .end local v17    # "uri":Landroid/net/Uri;
    :cond_a
    :goto_b
    add-int/lit8 v12, v12, 0x1

    goto :goto_a

    .line 129
    .end local v3    # "attachments":Lorg/json/JSONArray;
    .end local v12    # "i":I
    .end local v18    # "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :catch_5
    move-exception v9

    .line 130
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling bccRecipients param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 146
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v3    # "attachments":Lorg/json/JSONArray;
    .restart local v12    # "i":I
    .restart local v18    # "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :catch_6
    move-exception v9

    .line 147
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_c
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error adding an attachment: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_7

    goto :goto_b

    .line 154
    .end local v3    # "attachments":Lorg/json/JSONArray;
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v12    # "i":I
    .end local v18    # "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :catch_7
    move-exception v9

    .line 155
    .restart local v9    # "e":Ljava/lang/Exception;
    const-string v19, "EmailComposer"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Error handling attachments param: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_b
    :goto_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/EmailComposer;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, v20

    invoke-interface {v0, v1, v10, v2}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 159
    return-void

    .line 150
    .restart local v3    # "attachments":Lorg/json/JSONArray;
    .restart local v12    # "i":I
    .restart local v18    # "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :cond_c
    :try_start_d
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_b

    .line 151
    const-string v19, "android.intent.extra.STREAM"

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_7

    goto :goto_c
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 32
    const-string v2, "showEmailComposer"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 35
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 36
    .local v0, "parameters":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 37
    invoke-direct {p0, v0}, Lorg/apache/cordova/EmailComposer;->sendEmail(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .end local v0    # "parameters":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    invoke-virtual {p3}, Lorg/apache/cordova/api/CallbackContext;->success()V

    .line 43
    const/4 v1, 0x1

    .line 45
    :cond_1
    return v1

    .line 39
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 164
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/api/CordovaPlugin;->onActivityResult(IILandroid/content/Intent;)V

    .line 165
    const-string v0, "EmailComposer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ResultCode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    return-void
.end method
