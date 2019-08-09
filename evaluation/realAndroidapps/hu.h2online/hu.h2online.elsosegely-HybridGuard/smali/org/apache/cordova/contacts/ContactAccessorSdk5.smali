.class public Lorg/apache/cordova/contacts/ContactAccessorSdk5;
.super Lorg/apache/cordova/contacts/ContactAccessor;
.source "ContactAccessorSdk5.java"


# static fields
.field private static final ASSET_URL_PREFIX:Ljava/lang/String; = "file:///android_asset/"

.field private static final EMAIL_REGEXP:Ljava/lang/String; = ".+@.+\\.+.+"

.field private static final MAX_PHOTO_SIZE:J = 0x100000L

.field private static final dbMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    .line 95
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "id"

    const-string v2, "contact_id"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "displayName"

    const-string v2, "display_name"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.formatted"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.familyName"

    const-string v2, "data3"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.givenName"

    const-string v2, "data2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.middleName"

    const-string v2, "data5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.honorificPrefix"

    const-string v2, "data4"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "name.honorificSuffix"

    const-string v2, "data6"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "nickname"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "phoneNumbers"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "phoneNumbers.value"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "emails"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "emails.value"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.formatted"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.streetAddress"

    const-string v2, "data4"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.locality"

    const-string v2, "data7"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.region"

    const-string v2, "data8"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.postalCode"

    const-string v2, "data9"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "addresses.country"

    const-string v2, "data10"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "ims"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "ims.value"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "organizations"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "organizations.name"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "organizations.department"

    const-string v2, "data5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "organizations.title"

    const-string v2, "data4"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "birthday"

    const-string v2, "vnd.android.cursor.item/contact_event"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "note"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "photos.value"

    const-string v2, "vnd.android.cursor.item/photo"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "urls"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v1, "urls.value"

    const-string v2, "data1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/CordovaInterface;)V
    .locals 0
    .param p1, "context"    # Lorg/apache/cordova/CordovaInterface;

    .prologue
    .line 133
    invoke-direct {p0}, Lorg/apache/cordova/contacts/ContactAccessor;-><init>()V

    .line 134
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    .line 135
    return-void
.end method

.method private addressQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 794
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 796
    .local v0, "address":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "id"

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 797
    const-string v2, "pref"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 798
    const-string v2, "type"

    const-string v3, "data2"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getAddressType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 799
    const-string v2, "formatted"

    const-string v3, "data1"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 800
    const-string v2, "streetAddress"

    const-string v3, "data4"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 801
    const-string v2, "locality"

    const-string v3, "data7"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 802
    const-string v2, "region"

    const-string v3, "data8"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 803
    const-string v2, "postalCode"

    const-string v3, "data9"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 804
    const-string v2, "country"

    const-string v3, "data10"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 808
    :goto_0
    return-object v0

    .line 805
    :catch_0
    move-exception v1

    .line 806
    .local v1, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private buildIdClause(Ljava/util/Set;Ljava/lang/String;Z)Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    .locals 5
    .param p2, "searchTerm"    # Ljava/lang/String;
    .param p3, "hasPhoneNumber"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)",
            "Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "contactIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v2, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;

    invoke-direct {v2, p0}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;-><init>(Lorg/apache/cordova/contacts/ContactAccessor;)V

    .line 496
    .local v2, "options":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    const-string v3, "%"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez p3, :cond_0

    .line 497
    const-string v3, "(contact_id LIKE ? )"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhere(Ljava/lang/String;)V

    .line 498
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {v2, v3}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhereArgs([Ljava/lang/String;)V

    .line 517
    :goto_0
    return-object v2

    .line 503
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 504
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v3, "("

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 506
    .local v0, "buffer":Ljava/lang/StringBuffer;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 507
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 508
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 509
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 512
    :cond_2
    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 514
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "contact_id IN "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhere(Ljava/lang/String;)V

    .line 515
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhereArgs([Ljava/lang/String;)V

    goto :goto_0
.end method

.method private buildWhereClause(Lorg/json/JSONArray;Ljava/lang/String;Z)Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    .locals 11
    .param p1, "fields"    # Lorg/json/JSONArray;
    .param p2, "searchTerm"    # Ljava/lang/String;
    .param p3, "hasPhoneNumber"    # Z

    .prologue
    .line 572
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 573
    .local v6, "where":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 575
    .local v7, "whereArgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;

    invoke-direct {v3, p0}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;-><init>(Lorg/apache/cordova/contacts/ContactAccessor;)V

    .line 580
    .local v3, "options":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    invoke-direct {p0, p1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isWildCardSearch(Lorg/json/JSONArray;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 582
    const-string v8, "%"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    if-nez p3, :cond_0

    .line 583
    const-string v8, "(display_name LIKE ? )"

    invoke-virtual {v3, v8}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhere(Ljava/lang/String;)V

    .line 584
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p2, v8, v9

    invoke-virtual {v3, v8}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhereArgs([Ljava/lang/String;)V

    .line 745
    :goto_0
    return-object v3

    .line 588
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "displayName"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 589
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 590
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "name"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 592
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 593
    const-string v8, "vnd.android.cursor.item/name"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "nickname"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 596
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 597
    const-string v8, "vnd.android.cursor.item/nickname"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 598
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "phoneNumbers"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 601
    const-string v8, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "emails"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 604
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 605
    const-string v8, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 606
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "addresses"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 608
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 609
    const-string v8, "vnd.android.cursor.item/postal-address_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 610
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "ims"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 613
    const-string v8, "vnd.android.cursor.item/im"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 614
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "organizations"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 617
    const-string v8, "vnd.android.cursor.item/organization"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 618
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "note"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 620
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 621
    const-string v8, "vnd.android.cursor.item/note"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 622
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    const-string v10, "urls"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 624
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 625
    const-string v8, "vnd.android.cursor.item/website"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 632
    :cond_1
    const-string v8, "%"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    if-nez p3, :cond_2

    .line 633
    const-string v8, "(display_name LIKE ? )"

    invoke-virtual {v3, v8}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhere(Ljava/lang/String;)V

    .line 634
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    aput-object p2, v8, v9

    invoke-virtual {v3, v8}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhereArgs([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 636
    :cond_2
    const-string v8, "%"

    invoke-virtual {v8, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 640
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v1, v8, :cond_5

    .line 641
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 643
    .local v2, "key":Ljava/lang/String;
    const-string v8, "id"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 644
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 645
    const/4 v8, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p2, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 640
    :cond_3
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 647
    :cond_4
    const-string v8, "displayName"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 648
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 710
    .end local v2    # "key":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 711
    .local v0, "e":Lorg/json/JSONException;
    const-string v8, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 716
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "i":I
    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 717
    .local v4, "selection":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v1, v8, :cond_10

    .line 718
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 719
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-eq v1, v8, :cond_6

    .line 720
    const-string v8, " OR "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 717
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 651
    .end local v4    # "selection":Ljava/lang/StringBuffer;
    .restart local v2    # "key":Ljava/lang/String;
    :cond_7
    :try_start_1
    const-string v8, "name"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 652
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 654
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 655
    const-string v8, "vnd.android.cursor.item/name"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 657
    :cond_8
    const-string v8, "nickname"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 658
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 660
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 661
    const-string v8, "vnd.android.cursor.item/nickname"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 663
    :cond_9
    const-string v8, "phoneNumbers"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 664
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 667
    const-string v8, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 669
    :cond_a
    const-string v8, "emails"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 670
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 672
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    const-string v8, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 675
    :cond_b
    const-string v8, "addresses"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 676
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 678
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 679
    const-string v8, "vnd.android.cursor.item/postal-address_v2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 681
    :cond_c
    const-string v8, "ims"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 682
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 684
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    const-string v8, "vnd.android.cursor.item/im"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 687
    :cond_d
    const-string v8, "organizations"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 688
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 690
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 691
    const-string v8, "vnd.android.cursor.item/organization"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 697
    :cond_e
    const-string v8, "note"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 698
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 700
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 701
    const-string v8, "vnd.android.cursor.item/note"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 703
    :cond_f
    const-string v8, "urls"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 704
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v8, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->dbMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " LIKE ? AND "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "mimetype"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " = ? )"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 706
    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 707
    const-string v8, "vnd.android.cursor.item/website"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 725
    .end local v2    # "key":Ljava/lang/String;
    .restart local v4    # "selection":Ljava/lang/StringBuffer;
    :cond_10
    if-eqz p3, :cond_11

    .line 726
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_12

    .line 727
    const/4 v8, 0x0

    const-string v9, "("

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 728
    const-string v8, ") AND (has_phone_number = ?)"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 729
    const-string v8, "1"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 736
    :cond_11
    :goto_4
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhere(Ljava/lang/String;)V

    .line 739
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v5, v8, [Ljava/lang/String;

    .line 740
    .local v5, "selectionArgs":[Ljava/lang/String;
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v1, v8, :cond_13

    .line 741
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v5, v1

    .line 740
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 731
    .end local v5    # "selectionArgs":[Ljava/lang/String;
    :cond_12
    const-string v8, "(has_phone_number = ?)"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 732
    const-string v8, "1"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 743
    .restart local v5    # "selectionArgs":[Ljava/lang/String;
    :cond_13
    invoke-virtual {v3, v5}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->setWhereArgs([Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private createNewContact(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .param p1, "contact"    # Lorg/json/JSONObject;
    .param p2, "accountType"    # Ljava/lang/String;
    .param p3, "accountName"    # Ljava/lang/String;

    .prologue
    .line 1672
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 1675
    .local v18, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v27, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v27 .. v27}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "account_type"

    .line 1676
    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "account_name"

    .line 1677
    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    .line 1678
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v27

    .line 1675
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1681
    const-string v27, "name"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    .line 1682
    .local v14, "name":Lorg/json/JSONObject;
    const-string v27, "displayName"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1683
    .local v7, "displayName":Ljava/lang/String;
    if-nez v7, :cond_0

    if-eqz v14, :cond_1

    .line 1684
    :cond_0
    sget-object v27, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v27 .. v27}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "raw_contact_id"

    const/16 v29, 0x0

    .line 1685
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "mimetype"

    const-string v29, "vnd.android.cursor.item/name"

    .line 1686
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data1"

    .line 1687
    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v7}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data3"

    const-string v29, "familyName"

    .line 1688
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v14, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data5"

    const-string v29, "middleName"

    .line 1689
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v14, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data2"

    const-string v29, "givenName"

    .line 1690
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v14, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data4"

    const-string v29, "honorificPrefix"

    .line 1691
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v14, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data6"

    const-string v29, "honorificSuffix"

    .line 1692
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v14, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    .line 1693
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v27

    .line 1684
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1699
    :goto_0
    const/16 v22, 0x0

    .line 1701
    .local v22, "phones":Lorg/json/JSONArray;
    :try_start_0
    const-string v27, "phoneNumbers"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 1702
    if-eqz v22, :cond_2

    .line 1703
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_2

    .line 1704
    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/json/JSONObject;

    .line 1705
    .local v21, "phone":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertPhone(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1703
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 1695
    .end local v11    # "i":I
    .end local v21    # "phone":Lorg/json/JSONObject;
    .end local v22    # "phones":Lorg/json/JSONArray;
    :cond_1
    const-string v27, "ContactsAccessor"

    const-string v28, "Both \"name\" and \"displayName\" properties are empty"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1708
    .restart local v22    # "phones":Lorg/json/JSONArray;
    :catch_0
    move-exception v8

    .line 1709
    .local v8, "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get phone numbers"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1713
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_2
    const/4 v10, 0x0

    .line 1715
    .local v10, "emails":Lorg/json/JSONArray;
    :try_start_1
    const-string v27, "emails"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 1716
    if-eqz v10, :cond_3

    .line 1717
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_2
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_3

    .line 1718
    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 1719
    .local v9, "email":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v9}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertEmail(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1717
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 1722
    .end local v9    # "email":Lorg/json/JSONObject;
    .end local v11    # "i":I
    :catch_1
    move-exception v8

    .line 1723
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get emails"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1727
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_3
    const/4 v4, 0x0

    .line 1729
    .local v4, "addresses":Lorg/json/JSONArray;
    :try_start_2
    const-string v27, "addresses"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 1730
    if-eqz v4, :cond_4

    .line 1731
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_3
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_4

    .line 1732
    invoke-virtual {v4, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 1733
    .local v3, "address":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertAddress(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1731
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 1736
    .end local v3    # "address":Lorg/json/JSONObject;
    .end local v11    # "i":I
    :catch_2
    move-exception v8

    .line 1737
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get addresses"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1741
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_4
    const/16 v20, 0x0

    .line 1743
    .local v20, "organizations":Lorg/json/JSONArray;
    :try_start_3
    const-string v27, "organizations"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    .line 1744
    if-eqz v20, :cond_5

    .line 1745
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_4
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_5

    .line 1746
    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/json/JSONObject;

    .line 1747
    .local v19, "org":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertOrganization(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 1745
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 1750
    .end local v11    # "i":I
    .end local v19    # "org":Lorg/json/JSONObject;
    :catch_3
    move-exception v8

    .line 1751
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get organizations"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1755
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_5
    const/4 v13, 0x0

    .line 1757
    .local v13, "ims":Lorg/json/JSONArray;
    :try_start_4
    const-string v27, "ims"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 1758
    if-eqz v13, :cond_6

    .line 1759
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_5
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_6

    .line 1760
    invoke-virtual {v13, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/json/JSONObject;

    .line 1761
    .local v12, "im":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v12}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertIm(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 1759
    add-int/lit8 v11, v11, 0x1

    goto :goto_5

    .line 1764
    .end local v11    # "i":I
    .end local v12    # "im":Lorg/json/JSONObject;
    :catch_4
    move-exception v8

    .line 1765
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get emails"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1769
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_6
    const-string v27, "note"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1770
    .local v17, "note":Ljava/lang/String;
    if-eqz v17, :cond_7

    .line 1771
    sget-object v27, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v27 .. v27}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "raw_contact_id"

    const/16 v29, 0x0

    .line 1772
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "mimetype"

    const-string v29, "vnd.android.cursor.item/note"

    .line 1773
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data1"

    .line 1774
    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    .line 1775
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v27

    .line 1771
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1779
    :cond_7
    const-string v27, "nickname"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1780
    .local v16, "nickname":Ljava/lang/String;
    if-eqz v16, :cond_8

    .line 1781
    sget-object v27, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v27 .. v27}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "raw_contact_id"

    const/16 v29, 0x0

    .line 1782
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "mimetype"

    const-string v29, "vnd.android.cursor.item/nickname"

    .line 1783
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data1"

    .line 1784
    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    .line 1785
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v27

    .line 1781
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1789
    :cond_8
    const/16 v26, 0x0

    .line 1791
    .local v26, "websites":Lorg/json/JSONArray;
    :try_start_5
    const-string v27, "urls"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v26

    .line 1792
    if-eqz v26, :cond_9

    .line 1793
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_6
    invoke-virtual/range {v26 .. v26}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_9

    .line 1794
    move-object/from16 v0, v26

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/json/JSONObject;

    .line 1795
    .local v25, "website":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertWebsite(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 1793
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 1798
    .end local v11    # "i":I
    .end local v25    # "website":Lorg/json/JSONObject;
    :catch_5
    move-exception v8

    .line 1799
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get websites"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1803
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_9
    invoke-direct/range {p0 .. p1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getBirthday(Lorg/json/JSONObject;)Ljava/sql/Date;

    move-result-object v5

    .line 1804
    .local v5, "birthday":Ljava/sql/Date;
    if-eqz v5, :cond_a

    .line 1805
    sget-object v27, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v27 .. v27}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "raw_contact_id"

    const/16 v29, 0x0

    .line 1806
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "mimetype"

    const-string v29, "vnd.android.cursor.item/contact_event"

    .line 1807
    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data2"

    const/16 v29, 0x3

    .line 1808
    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    const-string v28, "data1"

    .line 1809
    invoke-virtual {v5}, Ljava/sql/Date;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v27 .. v29}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v27

    .line 1810
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v27

    .line 1805
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1814
    :cond_a
    const/16 v24, 0x0

    .line 1816
    .local v24, "photos":Lorg/json/JSONArray;
    :try_start_6
    const-string v27, "photos"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v24

    .line 1817
    if-eqz v24, :cond_b

    .line 1818
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_7
    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_b

    .line 1819
    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lorg/json/JSONObject;

    .line 1820
    .local v23, "photo":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->insertPhoto(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_6

    .line 1818
    add-int/lit8 v11, v11, 0x1

    goto :goto_7

    .line 1823
    .end local v11    # "i":I
    .end local v23    # "photo":Lorg/json/JSONObject;
    :catch_6
    move-exception v8

    .line 1824
    .restart local v8    # "e":Lorg/json/JSONException;
    const-string v27, "ContactsAccessor"

    const-string v28, "Could not get photos"

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1827
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_b
    const/4 v15, 0x0

    .line 1830
    .local v15, "newId":Ljava/lang/String;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v27, v0

    invoke-interface/range {v27 .. v27}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v27

    const-string v28, "com.android.contacts"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object v6

    .line 1831
    .local v6, "cpResults":[Landroid/content/ContentProviderResult;
    array-length v0, v6

    move/from16 v27, v0

    if-ltz v27, :cond_c

    .line 1832
    const/16 v27, 0x0

    aget-object v27, v6, v27

    move-object/from16 v0, v27

    iget-object v0, v0, Landroid/content/ContentProviderResult;->uri:Landroid/net/Uri;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Landroid/content/OperationApplicationException; {:try_start_7 .. :try_end_7} :catch_8

    move-result-object v15

    .line 1839
    .end local v6    # "cpResults":[Landroid/content/ContentProviderResult;
    :cond_c
    :goto_8
    return-object v15

    .line 1834
    :catch_7
    move-exception v8

    .line 1835
    .local v8, "e":Landroid/os/RemoteException;
    const-string v27, "ContactsAccessor"

    invoke-virtual {v8}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .line 1836
    .end local v8    # "e":Landroid/os/RemoteException;
    :catch_8
    move-exception v8

    .line 1837
    .local v8, "e":Landroid/content/OperationApplicationException;
    const-string v27, "ContactsAccessor"

    invoke-virtual {v8}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8
.end method

.method private emailQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 884
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 886
    .local v1, "email":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "id"

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 887
    const-string v2, "pref"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 888
    const-string v2, "value"

    const-string v3, "data1"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 889
    const-string v2, "type"

    const-string v3, "data2"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 893
    :goto_0
    return-object v1

    .line 890
    :catch_0
    move-exception v0

    .line 891
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private getAddressType(Ljava/lang/String;)I
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 2170
    const/4 v1, 0x3

    .line 2171
    .local v1, "type":I
    if-eqz p1, :cond_0

    .line 2172
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 2174
    .local v0, "lowerType":Ljava/lang/String;
    const-string v2, "work"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2175
    const/4 v1, 0x2

    .line 2184
    .end local v0    # "lowerType":Ljava/lang/String;
    .end local v1    # "type":I
    :cond_0
    :goto_0
    return v1

    .line 2177
    .restart local v0    # "lowerType":Ljava/lang/String;
    .restart local v1    # "type":I
    :cond_1
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2178
    const/4 v1, 0x3

    goto :goto_0

    .line 2180
    :cond_2
    const-string v2, "home"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2181
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private getAddressType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 2194
    packed-switch p1, :pswitch_data_0

    .line 2203
    const-string v0, "other"

    .line 2206
    .local v0, "stringType":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 2196
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_0
    const-string v0, "home"

    .line 2197
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2199
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_1
    const-string v0, "work"

    .line 2200
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2194
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getBirthday(Landroid/database/Cursor;)Ljava/sql/Date;
    .locals 4
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 1889
    const-string v2, "data1"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 1892
    .local v0, "colBirthday":I
    :try_start_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/sql/Date;->valueOf(Ljava/lang/String;)Ljava/sql/Date;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 1895
    :goto_0
    return-object v2

    .line 1893
    :catch_0
    move-exception v1

    .line 1894
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "ContactsAccessor"

    const-string v3, "Failed to get birthday for contact from cursor"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1895
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getBirthday(Lorg/json/JSONObject;)Ljava/sql/Date;
    .locals 6
    .param p1, "contact"    # Lorg/json/JSONObject;

    .prologue
    .line 1874
    :try_start_0
    const-string v2, "birthday"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 1875
    .local v1, "timestamp":Ljava/lang/Long;
    new-instance v2, Ljava/sql/Date;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/sql/Date;-><init>(J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1878
    .end local v1    # "timestamp":Ljava/lang/Long;
    :goto_0
    return-object v2

    .line 1876
    :catch_0
    move-exception v0

    .line 1877
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    const-string v3, "Could not get birthday from JSON object"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1878
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getContactType(Ljava/lang/String;)I
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 2068
    const/4 v1, 0x3

    .line 2069
    .local v1, "type":I
    if-eqz p1, :cond_0

    .line 2071
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 2073
    .local v0, "lowerType":Ljava/lang/String;
    const-string v2, "home"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2074
    const/4 v1, 0x1

    .line 2089
    .end local v0    # "lowerType":Ljava/lang/String;
    .end local v1    # "type":I
    :cond_0
    :goto_0
    return v1

    .line 2076
    .restart local v0    # "lowerType":Ljava/lang/String;
    .restart local v1    # "type":I
    :cond_1
    const-string v2, "work"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2077
    const/4 v1, 0x2

    goto :goto_0

    .line 2079
    :cond_2
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2080
    const/4 v1, 0x3

    goto :goto_0

    .line 2082
    :cond_3
    const-string v2, "mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2083
    const/4 v1, 0x4

    goto :goto_0

    .line 2085
    :cond_4
    const-string v2, "custom"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2086
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getContactType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 2099
    packed-switch p1, :pswitch_data_0

    .line 2114
    :pswitch_0
    const-string v0, "other"

    .line 2117
    .local v0, "stringType":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 2101
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_1
    const-string v0, "custom"

    .line 2102
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2104
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_2
    const-string v0, "home"

    .line 2105
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2107
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_3
    const-string v0, "work"

    .line 2108
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2110
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_4
    const-string v0, "mobile"

    .line 2111
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2099
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private getImType(Ljava/lang/String;)I
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 2215
    const/4 v1, -0x1

    .line 2216
    .local v1, "type":I
    if-eqz p1, :cond_0

    .line 2217
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 2219
    .local v0, "lowerType":Ljava/lang/String;
    const-string v2, "aim"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2220
    const/4 v1, 0x0

    .line 2247
    .end local v0    # "lowerType":Ljava/lang/String;
    .end local v1    # "type":I
    :cond_0
    :goto_0
    return v1

    .line 2222
    .restart local v0    # "lowerType":Ljava/lang/String;
    .restart local v1    # "type":I
    :cond_1
    const-string v2, "google talk"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2223
    const/4 v1, 0x5

    goto :goto_0

    .line 2225
    :cond_2
    const-string v2, "icq"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2226
    const/4 v1, 0x6

    goto :goto_0

    .line 2228
    :cond_3
    const-string v2, "jabber"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2229
    const/4 v1, 0x7

    goto :goto_0

    .line 2231
    :cond_4
    const-string v2, "msn"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2232
    const/4 v1, 0x1

    goto :goto_0

    .line 2234
    :cond_5
    const-string v2, "netmeeting"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2235
    const/16 v1, 0x8

    goto :goto_0

    .line 2237
    :cond_6
    const-string v2, "qq"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2238
    const/4 v1, 0x4

    goto :goto_0

    .line 2240
    :cond_7
    const-string v2, "skype"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2241
    const/4 v1, 0x3

    goto :goto_0

    .line 2243
    :cond_8
    const-string v2, "yahoo"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2244
    const/4 v1, 0x2

    goto :goto_0
.end method

.method private getImType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 2258
    packed-switch p1, :pswitch_data_0

    .line 2287
    const-string v0, "custom"

    .line 2290
    .local v0, "stringType":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 2260
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_0
    const-string v0, "AIM"

    .line 2261
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2263
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_1
    const-string v0, "Google Talk"

    .line 2264
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2266
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_2
    const-string v0, "ICQ"

    .line 2267
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2269
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_3
    const-string v0, "Jabber"

    .line 2270
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2272
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_4
    const-string v0, "MSN"

    .line 2273
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2275
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_5
    const-string v0, "NetMeeting"

    .line 2276
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2278
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_6
    const-string v0, "QQ"

    .line 2279
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2281
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_7
    const-string v0, "Skype"

    .line 2282
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2284
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_8
    const-string v0, "Yahoo"

    .line 2285
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2258
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_4
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method

.method private getOrgType(Ljava/lang/String;)I
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 2126
    const/4 v1, 0x2

    .line 2127
    .local v1, "type":I
    if-eqz p1, :cond_0

    .line 2128
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 2129
    .local v0, "lowerType":Ljava/lang/String;
    const-string v2, "work"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2130
    const/4 v1, 0x1

    .line 2139
    .end local v0    # "lowerType":Ljava/lang/String;
    .end local v1    # "type":I
    :cond_0
    :goto_0
    return v1

    .line 2132
    .restart local v0    # "lowerType":Ljava/lang/String;
    .restart local v1    # "type":I
    :cond_1
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2133
    const/4 v1, 0x2

    goto :goto_0

    .line 2135
    :cond_2
    const-string v2, "custom"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2136
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getOrgType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 2149
    packed-switch p1, :pswitch_data_0

    .line 2158
    const-string v0, "other"

    .line 2161
    .local v0, "stringType":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 2151
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_0
    const-string v0, "custom"

    .line 2152
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2154
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_1
    const-string v0, "work"

    .line 2155
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getPathFromUri(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 5
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1646
    const-string v3, "content:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1647
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1648
    .local v1, "uri":Landroid/net/Uri;
    iget-object v3, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    .line 1661
    .end local v1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v3

    .line 1651
    :cond_0
    const-string v3, "file:///android_asset/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1652
    const-string v3, "file:///android_asset/"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1653
    .local v0, "assetRelativePath":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_0

    .line 1656
    .end local v0    # "assetRelativePath":Ljava/lang/String;
    :cond_1
    const-string v3, "http:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "https:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "file:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1657
    :cond_2
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1658
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    goto :goto_0

    .line 1661
    .end local v2    # "url":Ljava/net/URL;
    :cond_3
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getPhoneType(Ljava/lang/String;)I
    .locals 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x4

    .line 1913
    const/4 v1, 0x7

    .line 1915
    .local v1, "type":I
    if-eqz p1, :cond_0

    .line 1916
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 1918
    .local v0, "lowerType":Ljava/lang/String;
    const-string v3, "home"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1919
    const/4 v1, 0x1

    .line 1985
    .end local v0    # "lowerType":Ljava/lang/String;
    .end local v1    # "type":I
    :cond_0
    :goto_0
    return v1

    .line 1921
    .restart local v0    # "lowerType":Ljava/lang/String;
    .restart local v1    # "type":I
    :cond_1
    const-string v3, "mobile"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1922
    const/4 v1, 0x2

    goto :goto_0

    .line 1924
    :cond_2
    const-string v3, "work"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1925
    const/4 v1, 0x3

    goto :goto_0

    .line 1927
    :cond_3
    const-string v3, "work fax"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    move v1, v2

    .line 1928
    goto :goto_0

    .line 1930
    :cond_4
    const-string v3, "home fax"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1931
    const/4 v1, 0x5

    goto :goto_0

    .line 1933
    :cond_5
    const-string v3, "fax"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    move v1, v2

    .line 1934
    goto :goto_0

    .line 1936
    :cond_6
    const-string v2, "pager"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1937
    const/4 v1, 0x6

    goto :goto_0

    .line 1939
    :cond_7
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1940
    const/4 v1, 0x7

    goto :goto_0

    .line 1942
    :cond_8
    const-string v2, "car"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1943
    const/16 v1, 0x9

    goto :goto_0

    .line 1945
    :cond_9
    const-string v2, "company main"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1946
    const/16 v1, 0xa

    goto :goto_0

    .line 1948
    :cond_a
    const-string v2, "isdn"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1949
    const/16 v1, 0xb

    goto :goto_0

    .line 1951
    :cond_b
    const-string v2, "main"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1952
    const/16 v1, 0xc

    goto :goto_0

    .line 1954
    :cond_c
    const-string v2, "other fax"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 1955
    const/16 v1, 0xd

    goto :goto_0

    .line 1957
    :cond_d
    const-string v2, "radio"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 1958
    const/16 v1, 0xe

    goto/16 :goto_0

    .line 1960
    :cond_e
    const-string v2, "telex"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1961
    const/16 v1, 0xf

    goto/16 :goto_0

    .line 1963
    :cond_f
    const-string v2, "work mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 1964
    const/16 v1, 0x11

    goto/16 :goto_0

    .line 1966
    :cond_10
    const-string v2, "work pager"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1967
    const/16 v1, 0x12

    goto/16 :goto_0

    .line 1969
    :cond_11
    const-string v2, "assistant"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1970
    const/16 v1, 0x13

    goto/16 :goto_0

    .line 1972
    :cond_12
    const-string v2, "mms"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 1973
    const/16 v1, 0x14

    goto/16 :goto_0

    .line 1975
    :cond_13
    const-string v2, "callback"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 1976
    const/16 v1, 0x8

    goto/16 :goto_0

    .line 1978
    :cond_14
    const-string v2, "tty ttd"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1979
    const/16 v1, 0x10

    goto/16 :goto_0

    .line 1981
    :cond_15
    const-string v2, "custom"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1982
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method private getPhoneType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 1996
    packed-switch p1, :pswitch_data_0

    .line 2056
    :pswitch_0
    const-string v0, "other"

    .line 2059
    .local v0, "stringType":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 1998
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_1
    const-string v0, "custom"

    .line 1999
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2001
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_2
    const-string v0, "home fax"

    .line 2002
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2004
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_3
    const-string v0, "work fax"

    .line 2005
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2007
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_4
    const-string v0, "home"

    .line 2008
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2010
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_5
    const-string v0, "mobile"

    .line 2011
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2013
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_6
    const-string v0, "pager"

    .line 2014
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2016
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_7
    const-string v0, "work"

    .line 2017
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2019
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_8
    const-string v0, "callback"

    .line 2020
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2022
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_9
    const-string v0, "car"

    .line 2023
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2025
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_a
    const-string v0, "company main"

    .line 2026
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2028
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_b
    const-string v0, "other fax"

    .line 2029
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2031
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_c
    const-string v0, "radio"

    .line 2032
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2034
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_d
    const-string v0, "telex"

    .line 2035
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2037
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_e
    const-string v0, "tty tdd"

    .line 2038
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2040
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_f
    const-string v0, "work mobile"

    .line 2041
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2043
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_10
    const-string v0, "work pager"

    .line 2044
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2046
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_11
    const-string v0, "assistant"

    .line 2047
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2049
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_12
    const-string v0, "mms"

    .line 2050
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 2052
    .end local v0    # "stringType":Ljava/lang/String;
    :pswitch_13
    const-string v0, "isdn"

    .line 2053
    .restart local v0    # "stringType":Ljava/lang/String;
    goto :goto_0

    .line 1996
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_3
        :pswitch_2
        :pswitch_6
        :pswitch_0
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_13
        :pswitch_0
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
    .end packed-switch
.end method

.method private getPhotoBytes(Ljava/lang/String;)[B
    .locals 10
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1616
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1618
    .local v0, "buffer":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 1619
    .local v1, "bytesRead":I
    const-wide/16 v6, 0x0

    .line 1620
    .local v6, "totalBytesRead":J
    const/16 v5, 0x2000

    :try_start_0
    new-array v2, v5, [B

    .line 1621
    .local v2, "data":[B
    invoke-direct {p0, p1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPathFromUri(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 1623
    .local v4, "in":Ljava/io/InputStream;
    :goto_0
    const/4 v5, 0x0

    array-length v8, v2

    invoke-virtual {v4, v2, v5, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    const/4 v5, -0x1

    if-eq v1, v5, :cond_0

    const-wide/32 v8, 0x100000

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    .line 1624
    const/4 v5, 0x0

    invoke-virtual {v0, v2, v5, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1625
    int-to-long v8, v1

    add-long/2addr v6, v8

    goto :goto_0

    .line 1628
    :cond_0
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 1629
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1635
    .end local v2    # "data":[B
    .end local v4    # "in":Ljava/io/InputStream;
    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5

    .line 1630
    :catch_0
    move-exception v3

    .line 1631
    .local v3, "e":Ljava/io/FileNotFoundException;
    const-string v5, "ContactsAccessor"

    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1632
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 1633
    .local v3, "e":Ljava/io/IOException;
    const-string v5, "ContactsAccessor"

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private imQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 902
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 904
    .local v1, "im":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "id"

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 905
    const-string v2, "pref"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 906
    const-string v2, "value"

    const-string v3, "data1"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 907
    const-string v2, "type"

    const-string v3, "data5"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getImType(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 911
    :goto_0
    return-object v1

    .line 908
    :catch_0
    move-exception v0

    .line 909
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private insertAddress(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "address"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1546
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1547
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/postal-address_v2"

    .line 1548
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1549
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getAddressType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "formatted"

    .line 1550
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data4"

    const-string v2, "streetAddress"

    .line 1551
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data7"

    const-string v2, "locality"

    .line 1552
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data8"

    const-string v2, "region"

    .line 1553
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data9"

    const-string v2, "postalCode"

    .line 1554
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data10"

    const-string v2, "country"

    .line 1555
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1556
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1546
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1557
    return-void
.end method

.method private insertEmail(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "email"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1567
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1568
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/email_v2"

    .line 1569
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "value"

    .line 1570
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1571
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1572
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1567
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1573
    return-void
.end method

.method private insertIm(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "im"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1512
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1513
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/im"

    .line 1514
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "value"

    .line 1515
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1516
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getImType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1517
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1512
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1518
    return-void
.end method

.method private insertOrganization(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "org"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1528
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1529
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/organization"

    .line 1530
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1531
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getOrgType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data5"

    const-string v2, "department"

    .line 1532
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "name"

    .line 1533
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data4"

    const-string v2, "title"

    .line 1534
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1535
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1528
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1536
    return-void
.end method

.method private insertPhone(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "phone"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1583
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1584
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/phone_v2"

    .line 1585
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "value"

    .line 1586
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1587
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhoneType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1588
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1583
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1589
    return-void
.end method

.method private insertPhoto(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 4
    .param p2, "photo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1599
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    const-string v1, "value"

    invoke-virtual {p0, p2, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhotoBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 1600
    .local v0, "bytes":[B
    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "raw_contact_id"

    const/4 v3, 0x0

    .line 1601
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "is_super_primary"

    const/4 v3, 0x1

    .line 1602
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "mimetype"

    const-string v3, "vnd.android.cursor.item/photo"

    .line 1603
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string v2, "data15"

    .line 1604
    invoke-virtual {v1, v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1605
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v1

    .line 1600
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1606
    return-void
.end method

.method private insertWebsite(Ljava/util/ArrayList;Lorg/json/JSONObject;)V
    .locals 3
    .param p2, "website"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1497
    .local p1, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "raw_contact_id"

    const/4 v2, 0x0

    .line 1498
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/website"

    .line 1499
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data1"

    const-string v2, "value"

    .line 1500
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    const-string v1, "data2"

    const-string v2, "type"

    .line 1501
    invoke-virtual {p0, p2, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1502
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v0

    .line 1497
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1503
    return-void
.end method

.method private isWildCardSearch(Lorg/json/JSONArray;)Z
    .locals 5
    .param p1, "fields"    # Lorg/json/JSONArray;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 756
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 758
    :try_start_0
    const-string v3, "*"

    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 765
    :goto_0
    return v1

    .line 761
    :catch_0
    move-exception v0

    .local v0, "e":Lorg/json/JSONException;
    move v1, v2

    .line 762
    goto :goto_0

    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    move v1, v2

    .line 765
    goto :goto_0
.end method

.method private modifyContact(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 50
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "contact"    # Lorg/json/JSONObject;
    .param p3, "accountType"    # Ljava/lang/String;
    .param p4, "accountName"    # Ljava/lang/String;

    .prologue
    .line 1033
    const-string v44, "rawId"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 1036
    .local v39, "rawId":Ljava/lang/String;
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    .line 1039
    .local v29, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v44, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "account_type"

    .line 1040
    move-object/from16 v0, v44

    move-object/from16 v1, v45

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "account_name"

    .line 1041
    move-object/from16 v0, v44

    move-object/from16 v1, v45

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1042
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1039
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1047
    :try_start_0
    const-string v44, "displayName"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1048
    .local v10, "displayName":Ljava/lang/String;
    const-string v44, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v26

    .line 1049
    .local v26, "name":Lorg/json/JSONObject;
    if-nez v10, :cond_0

    if-eqz v26, :cond_7

    .line 1050
    :cond_0
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object p1, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/name"

    aput-object v48, v46, v47

    .line 1051
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    .line 1055
    .local v7, "builder":Landroid/content/ContentProviderOperation$Builder;
    if-eqz v10, :cond_1

    .line 1056
    const-string v44, "data1"

    move-object/from16 v0, v44

    invoke-virtual {v7, v0, v10}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1059
    :cond_1
    const-string v44, "familyName"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1060
    .local v17, "familyName":Ljava/lang/String;
    if-eqz v17, :cond_2

    .line 1061
    const-string v44, "data3"

    move-object/from16 v0, v44

    move-object/from16 v1, v17

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1063
    :cond_2
    const-string v44, "middleName"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1064
    .local v25, "middleName":Ljava/lang/String;
    if-eqz v25, :cond_3

    .line 1065
    const-string v44, "data5"

    move-object/from16 v0, v44

    move-object/from16 v1, v25

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1067
    :cond_3
    const-string v44, "givenName"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 1068
    .local v18, "givenName":Ljava/lang/String;
    if-eqz v18, :cond_4

    .line 1069
    const-string v44, "data2"

    move-object/from16 v0, v44

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1071
    :cond_4
    const-string v44, "honorificPrefix"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 1072
    .local v19, "honorificPrefix":Ljava/lang/String;
    if-eqz v19, :cond_5

    .line 1073
    const-string v44, "data4"

    move-object/from16 v0, v44

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1075
    :cond_5
    const-string v44, "honorificSuffix"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1076
    .local v20, "honorificSuffix":Ljava/lang/String;
    if-eqz v20, :cond_6

    .line 1077
    const-string v44, "data6"

    move-object/from16 v0, v44

    move-object/from16 v1, v20

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1080
    :cond_6
    invoke-virtual {v7}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1087
    .end local v7    # "builder":Landroid/content/ContentProviderOperation$Builder;
    .end local v10    # "displayName":Ljava/lang/String;
    .end local v17    # "familyName":Ljava/lang/String;
    .end local v18    # "givenName":Ljava/lang/String;
    .end local v19    # "honorificPrefix":Ljava/lang/String;
    .end local v20    # "honorificSuffix":Ljava/lang/String;
    .end local v25    # "middleName":Ljava/lang/String;
    .end local v26    # "name":Lorg/json/JSONObject;
    :cond_7
    :goto_0
    const/16 v35, 0x0

    .line 1089
    .local v35, "phones":Lorg/json/JSONArray;
    :try_start_1
    const-string v44, "phoneNumbers"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v35

    .line 1090
    if-eqz v35, :cond_8

    .line 1092
    invoke-virtual/range {v35 .. v35}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_11

    .line 1093
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/phone_v2"

    aput-object v48, v46, v47

    .line 1094
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1097
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1093
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1133
    :cond_8
    :goto_1
    const/16 v16, 0x0

    .line 1135
    .local v16, "emails":Lorg/json/JSONArray;
    :try_start_2
    const-string v44, "emails"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 1136
    if-eqz v16, :cond_9

    .line 1138
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_13

    .line 1139
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/email_v2"

    aput-object v48, v46, v47

    .line 1140
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1143
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1139
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1188
    :cond_9
    :goto_2
    const/4 v5, 0x0

    .line 1190
    .local v5, "addresses":Lorg/json/JSONArray;
    :try_start_3
    const-string v44, "addresses"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 1191
    if-eqz v5, :cond_a

    .line 1193
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_16

    .line 1194
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/postal-address_v2"

    aput-object v48, v46, v47

    .line 1195
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1198
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1194
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 1244
    :cond_a
    :goto_3
    const/16 v32, 0x0

    .line 1246
    .local v32, "organizations":Lorg/json/JSONArray;
    :try_start_4
    const-string v44, "organizations"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v32

    .line 1247
    if-eqz v32, :cond_b

    .line 1249
    invoke-virtual/range {v32 .. v32}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_18

    .line 1250
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/organization"

    aput-object v48, v46, v47

    .line 1251
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1254
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1250
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 1294
    :cond_b
    :goto_4
    const/16 v24, 0x0

    .line 1296
    .local v24, "ims":Lorg/json/JSONArray;
    :try_start_5
    const-string v44, "ims"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v24

    .line 1297
    if-eqz v24, :cond_c

    .line 1299
    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_1a

    .line 1300
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/im"

    aput-object v48, v46, v47

    .line 1301
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1304
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1300
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 1340
    :cond_c
    :goto_5
    const-string v44, "note"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 1341
    .local v28, "note":Ljava/lang/String;
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object p1, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/note"

    aput-object v48, v46, v47

    .line 1342
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    .line 1345
    move-object/from16 v0, v44

    move-object/from16 v1, v45

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1346
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1341
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1349
    const-string v44, "nickname"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1350
    .local v27, "nickname":Ljava/lang/String;
    if-eqz v27, :cond_d

    .line 1351
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object p1, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/nickname"

    aput-object v48, v46, v47

    .line 1352
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    .line 1355
    move-object/from16 v0, v44

    move-object/from16 v1, v45

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1356
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1351
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1360
    :cond_d
    const/16 v43, 0x0

    .line 1362
    .local v43, "websites":Lorg/json/JSONArray;
    :try_start_6
    const-string v44, "urls"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v43

    .line 1363
    if-eqz v43, :cond_e

    .line 1365
    invoke-virtual/range {v43 .. v43}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_1c

    .line 1366
    const-string v44, "ContactsAccessor"

    const-string v45, "This means we should be deleting all the phone numbers."

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1367
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/website"

    aput-object v48, v46, v47

    .line 1368
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1371
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1367
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_6

    .line 1407
    :cond_e
    :goto_6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getBirthday(Lorg/json/JSONObject;)Ljava/sql/Date;

    move-result-object v6

    .line 1408
    .local v6, "birthday":Ljava/sql/Date;
    if-eqz v6, :cond_f

    .line 1409
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "contact_id=? AND mimetype=? AND data2=?"

    const/16 v46, 0x3

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object p1, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/contact_event"

    aput-object v48, v46, v47

    const/16 v47, 0x2

    const-string v48, "3"

    aput-object v48, v46, v47

    .line 1410
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const/16 v46, 0x3

    .line 1414
    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    .line 1415
    invoke-virtual {v6}, Ljava/sql/Date;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1416
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1409
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1420
    :cond_f
    const/16 v38, 0x0

    .line 1422
    .local v38, "photos":Lorg/json/JSONArray;
    :try_start_7
    const-string v44, "photos"

    move-object/from16 v0, p2

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v38

    .line 1423
    if-eqz v38, :cond_10

    .line 1425
    invoke-virtual/range {v38 .. v38}, Lorg/json/JSONArray;->length()I

    move-result v44

    if-nez v44, :cond_1e

    .line 1426
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "raw_contact_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/photo"

    aput-object v48, v46, v47

    .line 1427
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1430
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1426
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    .line 1466
    :cond_10
    :goto_7
    const/16 v40, 0x1

    .line 1470
    .local v40, "retVal":Z
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    move-object/from16 v44, v0

    invoke-interface/range {v44 .. v44}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v44

    const-string v45, "com.android.contacts"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_8
    .catch Landroid/content/OperationApplicationException; {:try_start_8 .. :try_end_8} :catch_9

    .line 1482
    :goto_8
    if-eqz v40, :cond_20

    .line 1485
    .end local v39    # "rawId":Ljava/lang/String;
    :goto_9
    return-object v39

    .line 1082
    .end local v5    # "addresses":Lorg/json/JSONArray;
    .end local v6    # "birthday":Ljava/sql/Date;
    .end local v16    # "emails":Lorg/json/JSONArray;
    .end local v24    # "ims":Lorg/json/JSONArray;
    .end local v27    # "nickname":Ljava/lang/String;
    .end local v28    # "note":Ljava/lang/String;
    .end local v32    # "organizations":Lorg/json/JSONArray;
    .end local v35    # "phones":Lorg/json/JSONArray;
    .end local v38    # "photos":Lorg/json/JSONArray;
    .end local v40    # "retVal":Z
    .end local v43    # "websites":Lorg/json/JSONArray;
    .restart local v39    # "rawId":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 1083
    .local v12, "e1":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get name"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1101
    .end local v12    # "e1":Lorg/json/JSONException;
    .restart local v35    # "phones":Lorg/json/JSONArray;
    :cond_11
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_a
    :try_start_9
    invoke-virtual/range {v35 .. v35}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_8

    .line 1102
    move-object/from16 v0, v35

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/json/JSONObject;

    .line 1103
    .local v33, "phone":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 1105
    .local v34, "phoneId":Ljava/lang/String;
    if-nez v34, :cond_12

    .line 1106
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1107
    .local v9, "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1108
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/phone_v2"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1109
    const-string v44, "data1"

    const-string v45, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1110
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhoneType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1112
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1113
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1112
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1101
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_b
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_a

    .line 1117
    :cond_12
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v34, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/phone_v2"

    aput-object v48, v46, v47

    .line 1118
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "value"

    .line 1121
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1122
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhoneType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1123
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1117
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_b

    .line 1128
    .end local v21    # "i":I
    .end local v33    # "phone":Lorg/json/JSONObject;
    .end local v34    # "phoneId":Ljava/lang/String;
    :catch_1
    move-exception v11

    .line 1129
    .local v11, "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get phone numbers"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1147
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v16    # "emails":Lorg/json/JSONArray;
    :cond_13
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_c
    :try_start_a
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_9

    .line 1148
    move-object/from16 v0, v16

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/json/JSONObject;

    .line 1149
    .local v13, "email":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1151
    .local v14, "emailId":Ljava/lang/String;
    if-nez v14, :cond_14

    .line 1152
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1153
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1154
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/email_v2"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1155
    const-string v44, "data1"

    const-string v45, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1156
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1158
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1159
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1158
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1147
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_d
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_c

    .line 1163
    :cond_14
    const-string v44, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1164
    .local v15, "emailValue":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v44

    if-nez v44, :cond_15

    .line 1165
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v14, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/email_v2"

    aput-object v48, v46, v47

    .line 1166
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "value"

    .line 1169
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1170
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v13, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1171
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1165
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_2

    goto :goto_d

    .line 1183
    .end local v13    # "email":Lorg/json/JSONObject;
    .end local v14    # "emailId":Ljava/lang/String;
    .end local v15    # "emailValue":Ljava/lang/String;
    .end local v21    # "i":I
    :catch_2
    move-exception v11

    .line 1184
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get emails"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 1173
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v13    # "email":Lorg/json/JSONObject;
    .restart local v14    # "emailId":Ljava/lang/String;
    .restart local v15    # "emailValue":Ljava/lang/String;
    .restart local v21    # "i":I
    :cond_15
    :try_start_b
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v14, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/email_v2"

    aput-object v48, v46, v47

    .line 1174
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1177
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1173
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_2

    goto/16 :goto_d

    .line 1202
    .end local v13    # "email":Lorg/json/JSONObject;
    .end local v14    # "emailId":Ljava/lang/String;
    .end local v15    # "emailValue":Ljava/lang/String;
    .end local v21    # "i":I
    .restart local v5    # "addresses":Lorg/json/JSONArray;
    :cond_16
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_e
    :try_start_c
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_a

    .line 1203
    move/from16 v0, v21

    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 1204
    .local v3, "address":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1206
    .local v4, "addressId":Ljava/lang/String;
    if-nez v4, :cond_17

    .line 1207
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1208
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1209
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/postal-address_v2"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1210
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getAddressType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1211
    const-string v44, "data1"

    const-string v45, "formatted"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1212
    const-string v44, "data4"

    const-string v45, "streetAddress"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1213
    const-string v44, "data7"

    const-string v45, "locality"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1214
    const-string v44, "data8"

    const-string v45, "region"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1215
    const-string v44, "data9"

    const-string v45, "postalCode"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1216
    const-string v44, "data10"

    const-string v45, "country"

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1218
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1219
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1218
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1202
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_f
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_e

    .line 1223
    :cond_17
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v4, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/postal-address_v2"

    aput-object v48, v46, v47

    .line 1224
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1227
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getAddressType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "formatted"

    .line 1228
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data4"

    const-string v46, "streetAddress"

    .line 1229
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data7"

    const-string v46, "locality"

    .line 1230
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data8"

    const-string v46, "region"

    .line 1231
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data9"

    const-string v46, "postalCode"

    .line 1232
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data10"

    const-string v46, "country"

    .line 1233
    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1234
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1223
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_3

    goto/16 :goto_f

    .line 1239
    .end local v3    # "address":Lorg/json/JSONObject;
    .end local v4    # "addressId":Ljava/lang/String;
    .end local v21    # "i":I
    :catch_3
    move-exception v11

    .line 1240
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get addresses"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 1258
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v32    # "organizations":Lorg/json/JSONArray;
    :cond_18
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_10
    :try_start_d
    invoke-virtual/range {v32 .. v32}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_b

    .line 1259
    move-object/from16 v0, v32

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/json/JSONObject;

    .line 1260
    .local v30, "org":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 1262
    .local v31, "orgId":Ljava/lang/String;
    if-nez v31, :cond_19

    .line 1263
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1264
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1265
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/organization"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1266
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getOrgType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1267
    const-string v44, "data5"

    const-string v45, "department"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1268
    const-string v44, "data1"

    const-string v45, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1269
    const-string v44, "data4"

    const-string v45, "title"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1271
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1272
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1271
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1258
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_11
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_10

    .line 1276
    :cond_19
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v31, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/organization"

    aput-object v48, v46, v47

    .line 1277
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1280
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getOrgType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data5"

    const-string v46, "department"

    .line 1281
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "name"

    .line 1282
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data4"

    const-string v46, "title"

    .line 1283
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1284
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1276
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_4

    goto/16 :goto_11

    .line 1289
    .end local v21    # "i":I
    .end local v30    # "org":Lorg/json/JSONObject;
    .end local v31    # "orgId":Ljava/lang/String;
    :catch_4
    move-exception v11

    .line 1290
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get organizations"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    .line 1308
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v24    # "ims":Lorg/json/JSONArray;
    :cond_1a
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_12
    :try_start_e
    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_c

    .line 1309
    move-object/from16 v0, v24

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/json/JSONObject;

    .line 1310
    .local v22, "im":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 1312
    .local v23, "imId":Ljava/lang/String;
    if-nez v23, :cond_1b

    .line 1313
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1314
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/im"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1316
    const-string v44, "data1"

    const-string v45, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1317
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getImType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1319
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1320
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1319
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1308
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_13
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_12

    .line 1324
    :cond_1b
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v23, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/im"

    aput-object v48, v46, v47

    .line 1325
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "value"

    .line 1328
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1329
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1330
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1324
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_5

    goto :goto_13

    .line 1335
    .end local v21    # "i":I
    .end local v22    # "im":Lorg/json/JSONObject;
    .end local v23    # "imId":Ljava/lang/String;
    :catch_5
    move-exception v11

    .line 1336
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get emails"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 1375
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v27    # "nickname":Ljava/lang/String;
    .restart local v28    # "note":Ljava/lang/String;
    .restart local v43    # "websites":Lorg/json/JSONArray;
    :cond_1c
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_14
    :try_start_f
    invoke-virtual/range {v43 .. v43}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_e

    .line 1376
    move-object/from16 v0, v43

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lorg/json/JSONObject;

    .line 1377
    .local v41, "website":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 1379
    .local v42, "websiteId":Ljava/lang/String;
    if-nez v42, :cond_1d

    .line 1380
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1381
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1382
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/website"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1383
    const-string v44, "data1"

    const-string v45, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1384
    const-string v44, "data2"

    const-string v45, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v41

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, p0

    move-object/from16 v1, v45

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v45

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1386
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1387
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1386
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1375
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_15
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_14

    .line 1391
    :cond_1d
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v42, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/website"

    aput-object v48, v46, v47

    .line 1392
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data1"

    const-string v46, "value"

    .line 1395
    move-object/from16 v0, p0

    move-object/from16 v1, v41

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data2"

    const-string v46, "type"

    .line 1396
    move-object/from16 v0, p0

    move-object/from16 v1, v41

    move-object/from16 v2, v46

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(Ljava/lang/String;)I

    move-result v46

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1397
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1391
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_6

    goto :goto_15

    .line 1402
    .end local v21    # "i":I
    .end local v41    # "website":Lorg/json/JSONObject;
    .end local v42    # "websiteId":Ljava/lang/String;
    :catch_6
    move-exception v11

    .line 1403
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get websites"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 1434
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v6    # "birthday":Ljava/sql/Date;
    .restart local v38    # "photos":Lorg/json/JSONArray;
    :cond_1e
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_16
    :try_start_10
    invoke-virtual/range {v38 .. v38}, Lorg/json/JSONArray;->length()I

    move-result v44

    move/from16 v0, v21

    move/from16 v1, v44

    if-ge v0, v1, :cond_10

    .line 1435
    move-object/from16 v0, v38

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Lorg/json/JSONObject;

    .line 1436
    .local v36, "photo":Lorg/json/JSONObject;
    const-string v44, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 1437
    .local v37, "photoId":Ljava/lang/String;
    const-string v44, "value"

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhotoBytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 1439
    .local v8, "bytes":[B
    if-nez v37, :cond_1f

    .line 1440
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1441
    .restart local v9    # "contentValues":Landroid/content/ContentValues;
    const-string v44, "raw_contact_id"

    move-object/from16 v0, v44

    move-object/from16 v1, v39

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1442
    const-string v44, "mimetype"

    const-string v45, "vnd.android.cursor.item/photo"

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1443
    const-string v44, "is_super_primary"

    const/16 v45, 0x1

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v9, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1444
    const-string v44, "data15"

    move-object/from16 v0, v44

    invoke-virtual {v9, v0, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1446
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1447
    move-object/from16 v0, v44

    invoke-virtual {v0, v9}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1446
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1434
    .end local v9    # "contentValues":Landroid/content/ContentValues;
    :goto_17
    add-int/lit8 v21, v21, 0x1

    goto :goto_16

    .line 1451
    :cond_1f
    sget-object v44, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v44 .. v44}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "_id=? AND mimetype=?"

    const/16 v46, 0x2

    move/from16 v0, v46

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x0

    aput-object v37, v46, v47

    const/16 v47, 0x1

    const-string v48, "vnd.android.cursor.item/photo"

    aput-object v48, v46, v47

    .line 1452
    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "is_super_primary"

    const/16 v46, 0x1

    .line 1455
    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v46

    invoke-virtual/range {v44 .. v46}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    const-string v45, "data15"

    .line 1456
    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-virtual {v0, v1, v8}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v44

    .line 1457
    invoke-virtual/range {v44 .. v44}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v44

    .line 1451
    move-object/from16 v0, v29

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_7

    goto :goto_17

    .line 1462
    .end local v8    # "bytes":[B
    .end local v21    # "i":I
    .end local v36    # "photo":Lorg/json/JSONObject;
    .end local v37    # "photoId":Ljava/lang/String;
    :catch_7
    move-exception v11

    .line 1463
    .restart local v11    # "e":Lorg/json/JSONException;
    const-string v44, "ContactsAccessor"

    const-string v45, "Could not get photos"

    invoke-static/range {v44 .. v45}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7

    .line 1471
    .end local v11    # "e":Lorg/json/JSONException;
    .restart local v40    # "retVal":Z
    :catch_8
    move-exception v11

    .line 1472
    .local v11, "e":Landroid/os/RemoteException;
    const-string v44, "ContactsAccessor"

    invoke-virtual {v11}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1473
    const-string v44, "ContactsAccessor"

    invoke-static {v11}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1474
    const/16 v40, 0x0

    .line 1479
    goto/16 :goto_8

    .line 1475
    .end local v11    # "e":Landroid/os/RemoteException;
    :catch_9
    move-exception v11

    .line 1476
    .local v11, "e":Landroid/content/OperationApplicationException;
    const-string v44, "ContactsAccessor"

    invoke-virtual {v11}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1477
    const-string v44, "ContactsAccessor"

    invoke-static {v11}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v44

    move-object/from16 v1, v45

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1478
    const/16 v40, 0x0

    goto/16 :goto_8

    .line 1485
    .end local v11    # "e":Landroid/content/OperationApplicationException;
    :cond_20
    const/16 v39, 0x0

    goto/16 :goto_9
.end method

.method private nameQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 10
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 817
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 819
    .local v0, "contactName":Lorg/json/JSONObject;
    :try_start_0
    const-string v8, "data3"

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 820
    .local v2, "familyName":Ljava/lang/String;
    const-string v8, "data2"

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 821
    .local v4, "givenName":Ljava/lang/String;
    const-string v8, "data5"

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 822
    .local v7, "middleName":Ljava/lang/String;
    const-string v8, "data4"

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 823
    .local v5, "honorificPrefix":Ljava/lang/String;
    const-string v8, "data6"

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 826
    .local v6, "honorificSuffix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v8, ""

    invoke-direct {v3, v8}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 827
    .local v3, "formatted":Ljava/lang/StringBuffer;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 828
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 830
    :cond_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 831
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 833
    :cond_1
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 834
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 836
    :cond_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 837
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 839
    :cond_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 840
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 842
    :cond_4
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 843
    const/4 v3, 0x0

    .line 846
    :cond_5
    const-string v8, "familyName"

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 847
    const-string v8, "givenName"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 848
    const-string v8, "middleName"

    invoke-virtual {v0, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 849
    const-string v8, "honorificPrefix"

    invoke-virtual {v0, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 850
    const-string v8, "honorificSuffix"

    invoke-virtual {v0, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 851
    const-string v8, "formatted"

    invoke-virtual {v0, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 855
    .end local v2    # "familyName":Ljava/lang/String;
    .end local v3    # "formatted":Ljava/lang/StringBuffer;
    .end local v4    # "givenName":Ljava/lang/String;
    .end local v5    # "honorificPrefix":Ljava/lang/String;
    .end local v6    # "honorificSuffix":Ljava/lang/String;
    .end local v7    # "middleName":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 852
    :catch_0
    move-exception v1

    .line 853
    .local v1, "e":Lorg/json/JSONException;
    const-string v8, "ContactsAccessor"

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private organizationQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 774
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 776
    .local v1, "organization":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "id"

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 777
    const-string v2, "pref"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 778
    const-string v2, "type"

    const-string v3, "data2"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getOrgType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 779
    const-string v2, "department"

    const-string v3, "data5"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 780
    const-string v2, "name"

    const-string v3, "data1"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 781
    const-string v2, "title"

    const-string v3, "data4"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 785
    :goto_0
    return-object v1

    .line 782
    :catch_0
    move-exception v0

    .line 783
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private phoneQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 864
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 866
    .local v2, "phoneNumber":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "id"

    const-string v4, "_id"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 867
    const-string v3, "pref"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 868
    const-string v3, "value"

    const-string v4, "data1"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 869
    const-string v3, "type"

    const-string v4, "data2"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-direct {p0, v4}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getPhoneType(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 875
    :goto_0
    return-object v2

    .line 870
    :catch_0
    move-exception v0

    .line 871
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 872
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 873
    .local v1, "excp":Ljava/lang/Exception;
    const-string v3, "ContactsAccessor"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private photoQuery(Landroid/database/Cursor;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 11
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "contactId"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 938
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 939
    .local v8, "photo":Lorg/json/JSONObject;
    const/4 v9, 0x0

    .line 941
    .local v9, "photoCursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    const-string v2, "_id"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 942
    const-string v0, "pref"

    const/4 v2, 0x0

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 943
    const-string v0, "type"

    const-string v2, "url"

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 944
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {p2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v7

    .line 945
    .local v7, "person":Landroid/net/Uri;
    const-string v0, "photo"

    invoke-static {v7, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 946
    .local v1, "photoUri":Landroid/net/Uri;
    const-string v0, "value"

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 949
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "data15"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 950
    if-nez v9, :cond_2

    .line 961
    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_0
    move-object v8, v10

    .line 965
    .end local v1    # "photoUri":Landroid/net/Uri;
    .end local v7    # "person":Landroid/net/Uri;
    .end local v8    # "photo":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-object v8

    .line 951
    .restart local v1    # "photoUri":Landroid/net/Uri;
    .restart local v7    # "person":Landroid/net/Uri;
    .restart local v8    # "photo":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_4

    .line 952
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 961
    if-eqz v9, :cond_3

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v8, v10

    .line 953
    goto :goto_0

    .line 955
    :cond_4
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 961
    if-eqz v9, :cond_1

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 956
    .end local v1    # "photoUri":Landroid/net/Uri;
    .end local v7    # "person":Landroid/net/Uri;
    :catch_0
    move-exception v6

    .line 957
    .local v6, "e":Lorg/json/JSONException;
    :try_start_3
    const-string v0, "ContactsAccessor"

    invoke-virtual {v6}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 961
    if-eqz v9, :cond_1

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 958
    .end local v6    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v6

    .line 959
    .local v6, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_4
    const-string v0, "ContactsAccessor"

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 961
    if-eqz v9, :cond_1

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 961
    .end local v6    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    if-eqz v9, :cond_5

    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_5

    .line 962
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0
.end method

.method private populateContact(Lorg/json/JSONObject;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "contact"    # Lorg/json/JSONObject;
    .param p2, "organizations"    # Lorg/json/JSONArray;
    .param p3, "addresses"    # Lorg/json/JSONArray;
    .param p4, "phones"    # Lorg/json/JSONArray;
    .param p5, "emails"    # Lorg/json/JSONArray;
    .param p6, "ims"    # Lorg/json/JSONArray;
    .param p7, "websites"    # Lorg/json/JSONArray;
    .param p8, "photos"    # Lorg/json/JSONArray;

    .prologue
    .line 537
    :try_start_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 538
    const-string v1, "organizations"

    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 540
    :cond_0
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 541
    const-string v1, "addresses"

    invoke-virtual {p1, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 543
    :cond_1
    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 544
    const-string v1, "phoneNumbers"

    invoke-virtual {p1, v1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 546
    :cond_2
    invoke-virtual {p5}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_3

    .line 547
    const-string v1, "emails"

    invoke-virtual {p1, v1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 549
    :cond_3
    invoke-virtual {p6}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 550
    const-string v1, "ims"

    invoke-virtual {p1, v1, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 552
    :cond_4
    invoke-virtual {p7}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_5

    .line 553
    const-string v1, "urls"

    invoke-virtual {p1, v1, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 555
    :cond_5
    invoke-virtual {p8}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_6

    .line 556
    const-string v1, "photos"

    invoke-virtual {p1, v1, p8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 561
    :cond_6
    :goto_0
    return-object p1

    .line 558
    :catch_0
    move-exception v0

    .line 559
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private populateContactArray(ILjava/util/HashMap;Landroid/database/Cursor;)Lorg/json/JSONArray;
    .locals 40
    .param p1, "limit"    # I
    .param p3, "c"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroid/database/Cursor;",
            ")",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .prologue
    .line 340
    .local p2, "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    const-string v23, ""

    .line 341
    .local v23, "contactId":Ljava/lang/String;
    const-string v35, ""

    .line 342
    .local v35, "rawId":Ljava/lang/String;
    const-string v30, ""

    .line 343
    .local v30, "oldContactId":Ljava/lang/String;
    const/16 v29, 0x1

    .line 344
    .local v29, "newContact":Z
    const-string v28, ""

    .line 346
    .local v28, "mimetype":Ljava/lang/String;
    new-instance v24, Lorg/json/JSONArray;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONArray;-><init>()V

    .line 347
    .local v24, "contacts":Lorg/json/JSONArray;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 348
    .local v5, "contact":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 349
    .local v6, "organizations":Lorg/json/JSONArray;
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 350
    .local v7, "addresses":Lorg/json/JSONArray;
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .line 351
    .local v8, "phones":Lorg/json/JSONArray;
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 352
    .local v9, "emails":Lorg/json/JSONArray;
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    .line 353
    .local v10, "ims":Lorg/json/JSONArray;
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11}, Lorg/json/JSONArray;-><init>()V

    .line 354
    .local v11, "websites":Lorg/json/JSONArray;
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 357
    .local v12, "photos":Lorg/json/JSONArray;
    const-string v4, "contact_id"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 358
    .local v15, "colContactId":I
    const-string v4, "raw_contact_id"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    .line 359
    .local v21, "colRawContactId":I
    const-string v4, "mimetype"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 360
    .local v18, "colMimetype":I
    const-string v4, "data1"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 361
    .local v16, "colDisplayName":I
    const-string v4, "data1"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 362
    .local v20, "colNote":I
    const-string v4, "data1"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v19

    .line 363
    .local v19, "colNickname":I
    const-string v4, "data2"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 365
    .local v17, "colEventType":I
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_10

    .line 366
    :goto_0
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v4

    add-int/lit8 v37, p1, -0x1

    move/from16 v0, v37

    if-gt v4, v0, :cond_f

    .line 368
    :try_start_0
    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 369
    move-object/from16 v0, p3

    move/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    .line 372
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    if-nez v4, :cond_0

    .line 373
    move-object/from16 v30, v23

    .line 378
    :cond_0
    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    move-object/from16 v4, p0

    .line 381
    invoke-direct/range {v4 .. v12}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->populateContact(Lorg/json/JSONObject;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 385
    new-instance v22, Lorg/json/JSONObject;

    invoke-direct/range {v22 .. v22}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    .end local v5    # "contact":Lorg/json/JSONObject;
    .local v22, "contact":Lorg/json/JSONObject;
    :try_start_1
    new-instance v31, Lorg/json/JSONArray;

    invoke-direct/range {v31 .. v31}, Lorg/json/JSONArray;-><init>()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 387
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .local v31, "organizations":Lorg/json/JSONArray;
    :try_start_2
    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 388
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .local v13, "addresses":Lorg/json/JSONArray;
    :try_start_3
    new-instance v32, Lorg/json/JSONArray;

    invoke-direct/range {v32 .. v32}, Lorg/json/JSONArray;-><init>()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 389
    .end local v8    # "phones":Lorg/json/JSONArray;
    .local v32, "phones":Lorg/json/JSONArray;
    :try_start_4
    new-instance v26, Lorg/json/JSONArray;

    invoke-direct/range {v26 .. v26}, Lorg/json/JSONArray;-><init>()V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 390
    .end local v9    # "emails":Lorg/json/JSONArray;
    .local v26, "emails":Lorg/json/JSONArray;
    :try_start_5
    new-instance v27, Lorg/json/JSONArray;

    invoke-direct/range {v27 .. v27}, Lorg/json/JSONArray;-><init>()V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 391
    .end local v10    # "ims":Lorg/json/JSONArray;
    .local v27, "ims":Lorg/json/JSONArray;
    :try_start_6
    new-instance v36, Lorg/json/JSONArray;

    invoke-direct/range {v36 .. v36}, Lorg/json/JSONArray;-><init>()V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_6

    .line 392
    .end local v11    # "websites":Lorg/json/JSONArray;
    .local v36, "websites":Lorg/json/JSONArray;
    :try_start_7
    new-instance v34, Lorg/json/JSONArray;

    invoke-direct/range {v34 .. v34}, Lorg/json/JSONArray;-><init>()V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    .line 395
    .end local v12    # "photos":Lorg/json/JSONArray;
    .local v34, "photos":Lorg/json/JSONArray;
    const/16 v29, 0x1

    move-object/from16 v12, v34

    .end local v34    # "photos":Lorg/json/JSONArray;
    .restart local v12    # "photos":Lorg/json/JSONArray;
    move-object/from16 v11, v36

    .end local v36    # "websites":Lorg/json/JSONArray;
    .restart local v11    # "websites":Lorg/json/JSONArray;
    move-object/from16 v10, v27

    .end local v27    # "ims":Lorg/json/JSONArray;
    .restart local v10    # "ims":Lorg/json/JSONArray;
    move-object/from16 v9, v26

    .end local v26    # "emails":Lorg/json/JSONArray;
    .restart local v9    # "emails":Lorg/json/JSONArray;
    move-object/from16 v8, v32

    .end local v32    # "phones":Lorg/json/JSONArray;
    .restart local v8    # "phones":Lorg/json/JSONArray;
    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .line 400
    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    :cond_1
    if-eqz v29, :cond_2

    .line 401
    const/16 v29, 0x0

    .line 402
    :try_start_8
    const-string v4, "id"

    move-object/from16 v0, v23

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 403
    const-string v4, "rawId"

    move-object/from16 v0, v35

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 407
    :cond_2
    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v28

    .line 409
    const-string v4, "vnd.android.cursor.item/name"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 410
    const-string v4, "displayName"

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 413
    :cond_3
    const-string v4, "vnd.android.cursor.item/name"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "name"

    .line 414
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 415
    const-string v4, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->nameQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 471
    :cond_4
    :goto_1
    move-object/from16 v30, v23

    goto/16 :goto_0

    .line 417
    :cond_5
    const-string v4, "vnd.android.cursor.item/phone_v2"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string v4, "phoneNumbers"

    .line 418
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 419
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->phoneQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v8, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_0

    goto :goto_1

    .line 466
    :catch_0
    move-exception v25

    .line 467
    .local v25, "e":Lorg/json/JSONException;
    :goto_2
    const-string v4, "ContactsAccessor"

    invoke-virtual/range {v25 .. v25}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v25

    invoke-static {v4, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 421
    .end local v25    # "e":Lorg/json/JSONException;
    :cond_6
    :try_start_9
    const-string v4, "vnd.android.cursor.item/email_v2"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    const-string v4, "emails"

    .line 422
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 423
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->emailQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v9, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 425
    :cond_7
    const-string v4, "vnd.android.cursor.item/postal-address_v2"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    const-string v4, "addresses"

    .line 426
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 427
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->addressQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 429
    :cond_8
    const-string v4, "vnd.android.cursor.item/organization"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, "organizations"

    .line 430
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 431
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->organizationQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_1

    .line 433
    :cond_9
    const-string v4, "vnd.android.cursor.item/im"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    const-string v4, "ims"

    .line 434
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 435
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->imQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v10, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_1

    .line 437
    :cond_a
    const-string v4, "vnd.android.cursor.item/note"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    const-string v4, "note"

    .line 438
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 439
    const-string v4, "note"

    move-object/from16 v0, p3

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_1

    .line 441
    :cond_b
    const-string v4, "vnd.android.cursor.item/nickname"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const-string v4, "nickname"

    .line 442
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 443
    const-string v4, "nickname"

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v5, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_1

    .line 445
    :cond_c
    const-string v4, "vnd.android.cursor.item/website"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "urls"

    .line 446
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 447
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->websiteQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v11, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_1

    .line 449
    :cond_d
    const-string v4, "vnd.android.cursor.item/contact_event"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 450
    const-string v4, "birthday"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x3

    .line 451
    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v37

    move/from16 v0, v37

    if-ne v4, v0, :cond_4

    .line 453
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getBirthday(Landroid/database/Cursor;)Ljava/sql/Date;

    move-result-object v14

    .line 454
    .local v14, "birthday":Ljava/sql/Date;
    if-eqz v14, :cond_4

    .line 455
    const-string v4, "birthday"

    invoke-virtual {v14}, Ljava/sql/Date;->getTime()J

    move-result-wide v38

    move-wide/from16 v0, v38

    invoke-virtual {v5, v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto/16 :goto_1

    .line 459
    .end local v14    # "birthday":Ljava/sql/Date;
    :cond_e
    const-string v4, "vnd.android.cursor.item/photo"

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "photos"

    .line 460
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v4, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 461
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->photoQuery(Landroid/database/Cursor;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v33

    .line 462
    .local v33, "photo":Lorg/json/JSONObject;
    if-eqz v33, :cond_4

    .line 463
    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    goto/16 :goto_1

    .line 476
    .end local v33    # "photo":Lorg/json/JSONObject;
    :cond_f
    invoke-virtual/range {v24 .. v24}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, p1

    if-ge v4, v0, :cond_10

    move-object/from16 v4, p0

    .line 477
    invoke-direct/range {v4 .. v12}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->populateContact(Lorg/json/JSONObject;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 481
    :cond_10
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->close()V

    .line 482
    return-object v24

    .line 466
    .end local v5    # "contact":Lorg/json/JSONObject;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    :catch_1
    move-exception v25

    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    :catch_2
    move-exception v25

    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .restart local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    :catch_3
    move-exception v25

    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .end local v8    # "phones":Lorg/json/JSONArray;
    .restart local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v32    # "phones":Lorg/json/JSONArray;
    :catch_4
    move-exception v25

    move-object/from16 v8, v32

    .end local v32    # "phones":Lorg/json/JSONArray;
    .restart local v8    # "phones":Lorg/json/JSONArray;
    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .end local v8    # "phones":Lorg/json/JSONArray;
    .end local v9    # "emails":Lorg/json/JSONArray;
    .restart local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v26    # "emails":Lorg/json/JSONArray;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v32    # "phones":Lorg/json/JSONArray;
    :catch_5
    move-exception v25

    move-object/from16 v9, v26

    .end local v26    # "emails":Lorg/json/JSONArray;
    .restart local v9    # "emails":Lorg/json/JSONArray;
    move-object/from16 v8, v32

    .end local v32    # "phones":Lorg/json/JSONArray;
    .restart local v8    # "phones":Lorg/json/JSONArray;
    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .end local v8    # "phones":Lorg/json/JSONArray;
    .end local v9    # "emails":Lorg/json/JSONArray;
    .end local v10    # "ims":Lorg/json/JSONArray;
    .restart local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v26    # "emails":Lorg/json/JSONArray;
    .restart local v27    # "ims":Lorg/json/JSONArray;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v32    # "phones":Lorg/json/JSONArray;
    :catch_6
    move-exception v25

    move-object/from16 v10, v27

    .end local v27    # "ims":Lorg/json/JSONArray;
    .restart local v10    # "ims":Lorg/json/JSONArray;
    move-object/from16 v9, v26

    .end local v26    # "emails":Lorg/json/JSONArray;
    .restart local v9    # "emails":Lorg/json/JSONArray;
    move-object/from16 v8, v32

    .end local v32    # "phones":Lorg/json/JSONArray;
    .restart local v8    # "phones":Lorg/json/JSONArray;
    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2

    .end local v5    # "contact":Lorg/json/JSONObject;
    .end local v6    # "organizations":Lorg/json/JSONArray;
    .end local v7    # "addresses":Lorg/json/JSONArray;
    .end local v8    # "phones":Lorg/json/JSONArray;
    .end local v9    # "emails":Lorg/json/JSONArray;
    .end local v10    # "ims":Lorg/json/JSONArray;
    .end local v11    # "websites":Lorg/json/JSONArray;
    .restart local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v22    # "contact":Lorg/json/JSONObject;
    .restart local v26    # "emails":Lorg/json/JSONArray;
    .restart local v27    # "ims":Lorg/json/JSONArray;
    .restart local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v32    # "phones":Lorg/json/JSONArray;
    .restart local v36    # "websites":Lorg/json/JSONArray;
    :catch_7
    move-exception v25

    move-object/from16 v11, v36

    .end local v36    # "websites":Lorg/json/JSONArray;
    .restart local v11    # "websites":Lorg/json/JSONArray;
    move-object/from16 v10, v27

    .end local v27    # "ims":Lorg/json/JSONArray;
    .restart local v10    # "ims":Lorg/json/JSONArray;
    move-object/from16 v9, v26

    .end local v26    # "emails":Lorg/json/JSONArray;
    .restart local v9    # "emails":Lorg/json/JSONArray;
    move-object/from16 v8, v32

    .end local v32    # "phones":Lorg/json/JSONArray;
    .restart local v8    # "phones":Lorg/json/JSONArray;
    move-object v7, v13

    .end local v13    # "addresses":Lorg/json/JSONArray;
    .restart local v7    # "addresses":Lorg/json/JSONArray;
    move-object/from16 v6, v31

    .end local v31    # "organizations":Lorg/json/JSONArray;
    .restart local v6    # "organizations":Lorg/json/JSONArray;
    move-object/from16 v5, v22

    .end local v22    # "contact":Lorg/json/JSONObject;
    .restart local v5    # "contact":Lorg/json/JSONObject;
    goto/16 :goto_2
.end method

.method private websiteQuery(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 920
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 922
    .local v1, "website":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "id"

    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 923
    const-string v2, "pref"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 924
    const-string v2, "value"

    const-string v3, "data1"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 925
    const-string v2, "type"

    const-string v3, "data2"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-direct {p0, v3}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 929
    :goto_0
    return-object v1

    .line 926
    :catch_0
    move-exception v0

    .line 927
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "ContactsAccessor"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public getContactById(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 299
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getContactById(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public getContactById(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "desiredFields"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 305
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "raw_contact_id = ? "

    new-array v4, v9, [Ljava/lang/String;

    aput-object p1, v4, v10

    const-string v5, "raw_contact_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 312
    .local v6, "c":Landroid/database/Cursor;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "desiredFields"

    .line 313
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 312
    invoke-virtual {p0, v0}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->buildPopulationSet(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v8

    .line 316
    .local v8, "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-direct {p0, v9, v8, v6}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->populateContactArray(ILjava/util/HashMap;Landroid/database/Cursor;)Lorg/json/JSONArray;

    move-result-object v7

    .line 318
    .local v7, "contacts":Lorg/json/JSONArray;
    invoke-interface {v6}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 319
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 322
    :cond_0
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ne v0, v9, :cond_1

    .line 323
    invoke-virtual {v7, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 325
    :cond_1
    return-object v2
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 12
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v2, 0x0

    .line 1848
    const/4 v8, 0x0

    .line 1849
    .local v8, "result":I
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "_id = ?"

    new-array v4, v10, [Ljava/lang/String;

    aput-object p1, v4, v11

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1854
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ne v0, v10, :cond_0

    .line 1855
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1856
    const-string v0, "lookup"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1857
    .local v7, "lookupKey":Ljava/lang/String;
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_LOOKUP_URI:Landroid/net/Uri;

    invoke-static {v0, v7}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 1858
    .local v9, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v9, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v8

    .line 1863
    .end local v7    # "lookupKey":Ljava/lang/String;
    .end local v9    # "uri":Landroid/net/Uri;
    :goto_0
    if-lez v8, :cond_1

    move v0, v10

    :goto_1
    return v0

    .line 1860
    :cond_0
    const-string v0, "ContactsAccessor"

    const-string v1, "Could not find contact with ID"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    move v0, v11

    .line 1863
    goto :goto_1
.end method

.method public save(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 11
    .param p1, "contact"    # Lorg/json/JSONObject;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 976
    iget-object v7, p0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v5

    .line 977
    .local v5, "mgr":Landroid/accounts/AccountManager;
    invoke-virtual {v5}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v3

    .line 978
    .local v3, "accounts":[Landroid/accounts/Account;
    const/4 v1, 0x0

    .line 979
    .local v1, "accountName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 981
    .local v2, "accountType":Ljava/lang/String;
    array-length v7, v3

    if-ne v7, v8, :cond_1

    .line 982
    aget-object v7, v3, v6

    iget-object v1, v7, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 983
    aget-object v6, v3, v6

    iget-object v2, v6, Landroid/accounts/Account;->type:Ljava/lang/String;

    .line 1013
    :cond_0
    :goto_0
    const-string v6, "id"

    invoke-virtual {p0, p1, v6}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->getJsonString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1014
    .local v4, "id":Ljava/lang/String;
    if-nez v4, :cond_7

    .line 1016
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->createNewContact(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1019
    :goto_1
    return-object v6

    .line 985
    .end local v4    # "id":Ljava/lang/String;
    :cond_1
    array-length v7, v3

    if-le v7, v8, :cond_0

    .line 986
    array-length v8, v3

    move v7, v6

    :goto_2
    if-ge v7, v8, :cond_2

    aget-object v0, v3, v7

    .line 987
    .local v0, "a":Landroid/accounts/Account;
    iget-object v9, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string v10, "eas"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    iget-object v9, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    const-string v10, ".+@.+\\.+.+"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 988
    iget-object v1, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 989
    iget-object v2, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    .line 993
    .end local v0    # "a":Landroid/accounts/Account;
    :cond_2
    if-nez v1, :cond_3

    .line 994
    array-length v8, v3

    move v7, v6

    :goto_3
    if-ge v7, v8, :cond_3

    aget-object v0, v3, v7

    .line 995
    .restart local v0    # "a":Landroid/accounts/Account;
    iget-object v9, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string v10, "com.google"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5

    iget-object v9, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    const-string v10, ".+@.+\\.+.+"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 996
    iget-object v1, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 997
    iget-object v2, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    .line 1002
    .end local v0    # "a":Landroid/accounts/Account;
    :cond_3
    if-nez v1, :cond_0

    .line 1003
    array-length v7, v3

    :goto_4
    if-ge v6, v7, :cond_0

    aget-object v0, v3, v6

    .line 1004
    .restart local v0    # "a":Landroid/accounts/Account;
    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    const-string v9, ".+@.+\\.+.+"

    invoke-virtual {v8, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1005
    iget-object v1, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 1006
    iget-object v2, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    .line 1007
    goto :goto_0

    .line 986
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 994
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1003
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1019
    .end local v0    # "a":Landroid/accounts/Account;
    .restart local v4    # "id":Ljava/lang/String;
    :cond_7
    invoke-direct {p0, v4, p1, v2, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->modifyContact(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1
.end method

.method public search(Lorg/json/JSONArray;Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .locals 23
    .param p1, "fields"    # Lorg/json/JSONArray;
    .param p2, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 147
    const-string v21, ""

    .line 148
    .local v21, "searchTerm":Ljava/lang/String;
    const v18, 0x7fffffff

    .line 149
    .local v18, "limit":I
    const/16 v19, 0x1

    .line 150
    .local v19, "multiple":Z
    const/4 v14, 0x0

    .line 152
    .local v14, "hasPhoneNumber":Z
    if-eqz p2, :cond_3

    .line 153
    const-string v3, "filter"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 154
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 155
    const-string v21, "%"

    .line 162
    :goto_0
    :try_start_0
    const-string v3, "multiple"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v19

    .line 163
    if-nez v19, :cond_0

    .line 164
    const/16 v18, 0x1

    .line 172
    :cond_0
    :goto_1
    :try_start_1
    const-string v3, "hasPhoneNumber"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v14

    .line 182
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->buildPopulationSet(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v20

    .line 185
    .local v20, "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2, v14}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->buildWhereClause(Lorg/json/JSONArray;Ljava/lang/String;Z)Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;

    move-result-object v22

    .line 188
    .local v22, "whereOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "contact_id"

    aput-object v7, v5, v6

    .line 190
    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->getWhere()Ljava/lang/String;

    move-result-object v6

    .line 191
    invoke-virtual/range {v22 .. v22}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->getWhereArgs()[Ljava/lang/String;

    move-result-object v7

    const-string v8, "contact_id ASC"

    .line 188
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v16

    .line 195
    .local v16, "idCursor":Landroid/database/Cursor;
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    .line 196
    .local v11, "contactIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v15, -0x1

    .line 197
    .local v15, "idColumn":I
    :goto_3
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 198
    if-gez v15, :cond_1

    .line 199
    const-string v3, "contact_id"

    move-object/from16 v0, v16

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 201
    :cond_1
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v11, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 158
    .end local v11    # "contactIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v15    # "idColumn":I
    .end local v16    # "idCursor":Landroid/database/Cursor;
    .end local v20    # "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    .end local v22    # "whereOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    goto/16 :goto_0

    .line 166
    :catch_0
    move-exception v13

    .line 168
    .local v13, "e":Lorg/json/JSONException;
    const-string v3, "ContactsAccessor"

    invoke-virtual {v13}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 178
    .end local v13    # "e":Lorg/json/JSONException;
    :cond_3
    const-string v21, "%"

    goto/16 :goto_2

    .line 203
    .restart local v11    # "contactIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v15    # "idColumn":I
    .restart local v16    # "idCursor":Landroid/database/Cursor;
    .restart local v20    # "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    .restart local v22    # "whereOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    :cond_4
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->close()V

    .line 206
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v11, v1, v14}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->buildIdClause(Ljava/util/Set;Ljava/lang/String;Z)Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;

    move-result-object v17

    .line 209
    .local v17, "idOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 210
    .local v10, "columnsToFetch":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const-string v3, "contact_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 211
    const-string v3, "raw_contact_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 212
    const-string v3, "mimetype"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 214
    const-string v3, "displayName"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 215
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 217
    :cond_5
    const-string v3, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 218
    const-string v3, "data3"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 219
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 220
    const-string v3, "data5"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 221
    const-string v3, "data4"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 222
    const-string v3, "data6"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_6
    const-string v3, "phoneNumbers"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 225
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 226
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 227
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_7
    const-string v3, "emails"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 230
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 231
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 232
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 234
    :cond_8
    const-string v3, "addresses"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 235
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 236
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 237
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 238
    const-string v3, "data4"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 239
    const-string v3, "data7"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 240
    const-string v3, "data8"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 241
    const-string v3, "data9"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 242
    const-string v3, "data10"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_9
    const-string v3, "organizations"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 245
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 246
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 247
    const-string v3, "data5"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 248
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 249
    const-string v3, "data4"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 251
    :cond_a
    const-string v3, "ims"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 252
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 253
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 254
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_b
    const-string v3, "note"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 257
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_c
    const-string v3, "nickname"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 260
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_d
    const-string v3, "urls"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 263
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 264
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 265
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 267
    :cond_e
    const-string v3, "birthday"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 268
    const-string v3, "data1"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 269
    const-string v3, "data2"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 271
    :cond_f
    const-string v3, "photos"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->isRequired(Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 272
    const-string v3, "_id"

    invoke-virtual {v10, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 276
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->mApp:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    .line 277
    invoke-virtual {v10, v5}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 278
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->getWhere()Ljava/lang/String;

    move-result-object v6

    .line 279
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->getWhereArgs()[Ljava/lang/String;

    move-result-object v7

    const-string v8, "contact_id ASC"

    .line 276
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 282
    .local v9, "c":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2, v9}, Lorg/apache/cordova/contacts/ContactAccessorSdk5;->populateContactArray(ILjava/util/HashMap;Landroid/database/Cursor;)Lorg/json/JSONArray;

    move-result-object v12

    .line 284
    .local v12, "contacts":Lorg/json/JSONArray;
    invoke-interface {v9}, Landroid/database/Cursor;->isClosed()Z

    move-result v3

    if-nez v3, :cond_11

    .line 285
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 287
    :cond_11
    return-object v12

    .line 173
    .end local v9    # "c":Landroid/database/Cursor;
    .end local v10    # "columnsToFetch":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v11    # "contactIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v12    # "contacts":Lorg/json/JSONArray;
    .end local v15    # "idColumn":I
    .end local v16    # "idCursor":Landroid/database/Cursor;
    .end local v17    # "idOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    .end local v20    # "populate":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    .end local v22    # "whereOptions":Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
    :catch_1
    move-exception v3

    goto/16 :goto_2
.end method
