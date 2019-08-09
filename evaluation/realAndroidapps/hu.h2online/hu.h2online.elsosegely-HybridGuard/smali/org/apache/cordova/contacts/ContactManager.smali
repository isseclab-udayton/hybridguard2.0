.class public Lorg/apache/cordova/contacts/ContactManager;
.super Lorg/apache/cordova/CordovaPlugin;
.source "ContactManager.java"


# static fields
.field private static final CONTACT_PICKER_RESULT:I = 0x3e8

.field public static final INVALID_ARGUMENT_ERROR:I = 0x1

.field public static final IO_ERROR:I = 0x4

.field private static final LOG_TAG:Ljava/lang/String; = "Contact Query"

.field public static final NOT_SUPPORTED_ERROR:I = 0x5

.field public static final OPERATION_CANCELLED_ERROR:I = 0x6

.field public static final PENDING_OPERATION_ERROR:I = 0x3

.field public static final PERMISSION_DENIED_ERROR:I = 0x14

.field public static final PICK_REQ_CODE:I = 0x3

.field public static final READ:Ljava/lang/String; = "android.permission.READ_CONTACTS"

.field public static final REMOVE_REQ_CODE:I = 0x2

.field public static final SAVE_REQ_CODE:I = 0x1

.field public static final SEARCH_REQ_CODE:I = 0x0

.field public static final TIMEOUT_ERROR:I = 0x2

.field public static final UNKNOWN_ERROR:I = 0x0

.field public static final WRITE:Ljava/lang/String; = "android.permission.WRITE_CONTACTS"

.field public static permissions:[Ljava/lang/String;


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

.field private executeArgs:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 77
    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/contacts/ContactAccessor;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/contacts/ContactManager;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

    return-object v0
.end method

.method static synthetic access$100(Lorg/apache/cordova/contacts/ContactManager;)Lorg/apache/cordova/CallbackContext;
    .locals 1
    .param p0, "x0"    # Lorg/apache/cordova/contacts/ContactManager;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method private pickContactAsync()V
    .locals 3

    .prologue
    .line 219
    move-object v0, p0

    .line 220
    .local v0, "plugin":Lorg/apache/cordova/CordovaPlugin;
    new-instance v1, Lorg/apache/cordova/contacts/ContactManager$4;

    invoke-direct {v1, p0, v0}, Lorg/apache/cordova/contacts/ContactManager$4;-><init>(Lorg/apache/cordova/contacts/ContactManager;Lorg/apache/cordova/CordovaPlugin;)V

    .line 226
    .local v1, "worker":Ljava/lang/Runnable;
    iget-object v2, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 227
    return-void
.end method

.method private remove(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 168
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "contactId":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lorg/apache/cordova/contacts/ContactManager$1;

    invoke-direct {v2, p0, v0}, Lorg/apache/cordova/contacts/ContactManager$1;-><init>(Lorg/apache/cordova/contacts/ContactManager;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 178
    return-void
.end method

.method private save(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 181
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 182
    .local v0, "contact":Lorg/json/JSONObject;
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lorg/apache/cordova/contacts/ContactManager$2;

    invoke-direct {v2, p0, v0}, Lorg/apache/cordova/contacts/ContactManager$2;-><init>(Lorg/apache/cordova/contacts/ContactManager;Lorg/json/JSONObject;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 200
    return-void
.end method

.method private search(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "args"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 204
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v0

    .line 205
    .local v0, "filter":Lorg/json/JSONArray;
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v1, 0x0

    .line 206
    .local v1, "options":Lorg/json/JSONObject;
    :goto_0
    iget-object v2, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Lorg/apache/cordova/contacts/ContactManager$3;

    invoke-direct {v3, p0, v0, v1}, Lorg/apache/cordova/contacts/ContactManager$3;-><init>(Lorg/apache/cordova/contacts/ContactManager;Lorg/json/JSONArray;Lorg/json/JSONObject;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 212
    return-void

    .line 205
    .end local v1    # "options":Lorg/json/JSONObject;
    :cond_0
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 4
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 102
    iput-object p3, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 103
    iput-object p2, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    .line 109
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v3, "1."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 164
    :goto_0
    return v0

    .line 118
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/contacts/ContactManager;->contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

    if-nez v2, :cond_1

    .line 119
    new-instance v2, Lorg/apache/cordova/contacts/ContactAccessorSdk5;

    iget-object v3, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-direct {v2, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;-><init>(Lorg/apache/cordova/CordovaInterface;)V

    iput-object v2, p0, Lorg/apache/cordova/contacts/ContactManager;->contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

    .line 122
    :cond_1
    const-string v2, "search"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 123
    const-string v2, "android.permission.READ_CONTACTS"

    invoke-static {p0, v2}, Lorg/apache/cordova/contacts/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 124
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->search(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 128
    :cond_2
    invoke-virtual {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->getReadPermission(I)V

    goto :goto_0

    .line 131
    :cond_3
    const-string v2, "save"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 132
    const-string v1, "android.permission.WRITE_CONTACTS"

    invoke-static {p0, v1}, Lorg/apache/cordova/contacts/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 134
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->save(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 138
    :cond_4
    invoke-virtual {p0, v0}, Lorg/apache/cordova/contacts/ContactManager;->getWritePermission(I)V

    goto :goto_0

    .line 141
    :cond_5
    const-string v2, "remove"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 142
    const-string v1, "android.permission.WRITE_CONTACTS"

    invoke-static {p0, v1}, Lorg/apache/cordova/contacts/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 144
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->remove(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 148
    :cond_6
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->getWritePermission(I)V

    goto :goto_0

    .line 151
    :cond_7
    const-string v2, "pickContact"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 152
    const-string v1, "android.permission.READ_CONTACTS"

    invoke-static {p0, v1}, Lorg/apache/cordova/contacts/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 154
    invoke-direct {p0}, Lorg/apache/cordova/contacts/ContactManager;->pickContactAsync()V

    goto :goto_0

    .line 158
    :cond_8
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->getReadPermission(I)V

    goto :goto_0

    :cond_9
    move v0, v1

    .line 162
    goto :goto_0
.end method

.method protected getReadPermission(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 82
    const-string v0, "android.permission.READ_CONTACTS"

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/contacts/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 83
    return-void
.end method

.method protected getWritePermission(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 88
    const-string v0, "android.permission.WRITE_CONTACTS"

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/contacts/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    .line 89
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    const/4 v11, 0x0

    .line 238
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 239
    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    .line 240
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v8

    .line 243
    .local v8, "contactId":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v11

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "contact_id = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 245
    .local v6, "c":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_1

    .line 246
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v1, "Error occured while retrieving contact raw id"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 266
    .end local v6    # "c":Landroid/database/Cursor;
    .end local v8    # "contactId":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 249
    .restart local v6    # "c":Landroid/database/Cursor;
    .restart local v8    # "contactId":Ljava/lang/String;
    :cond_1
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 250
    .local v10, "id":Ljava/lang/String;
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 253
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

    invoke-virtual {v0, v10}, Lorg/apache/cordova/contacts/ContactAccessor;->getContactById(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 254
    .local v7, "contact":Lorg/json/JSONObject;
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, v7}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 256
    .end local v7    # "contact":Lorg/json/JSONObject;
    :catch_0
    move-exception v9

    .line 257
    .local v9, "e":Lorg/json/JSONException;
    const-string v0, "Contact Query"

    const-string v1, "JSON fail."

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 264
    .end local v6    # "c":Landroid/database/Cursor;
    .end local v8    # "contactId":Ljava/lang/String;
    .end local v9    # "e":Lorg/json/JSONException;
    .end local v10    # "id":Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v11}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 259
    :cond_3
    if-nez p2, :cond_2

    .line 260
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 271
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p3, v1

    .line 273
    .local v0, "r":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 275
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const/16 v4, 0x14

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 294
    .end local v0    # "r":I
    :goto_1
    return-void

    .line 271
    .restart local v0    # "r":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 279
    .end local v0    # "r":I
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 282
    :pswitch_0
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->search(Lorg/json/JSONArray;)V

    goto :goto_1

    .line 285
    :pswitch_1
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->save(Lorg/json/JSONArray;)V

    goto :goto_1

    .line 288
    :pswitch_2
    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->executeArgs:Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactManager;->remove(Lorg/json/JSONArray;)V

    goto :goto_1

    .line 291
    :pswitch_3
    invoke-direct {p0}, Lorg/apache/cordova/contacts/ContactManager;->pickContactAsync()V

    goto :goto_1

    .line 279
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 303
    iput-object p2, p0, Lorg/apache/cordova/contacts/ContactManager;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 304
    new-instance v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;

    iget-object v1, p0, Lorg/apache/cordova/contacts/ContactManager;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;-><init>(Lorg/apache/cordova/CordovaInterface;)V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactManager;->contactAccessor:Lorg/apache/cordova/contacts/ContactAccessor;

    .line 305
    return-void
.end method
