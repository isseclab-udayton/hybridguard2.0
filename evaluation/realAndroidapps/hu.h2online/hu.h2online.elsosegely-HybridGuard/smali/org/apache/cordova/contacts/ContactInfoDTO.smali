.class public Lorg/apache/cordova/contacts/ContactInfoDTO;
.super Ljava/lang/Object;
.source "ContactInfoDTO.java"


# instance fields
.field addresses:Lorg/json/JSONArray;

.field birthday:Ljava/lang/String;

.field desiredFieldsWithVals:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field displayName:Ljava/lang/String;

.field emails:Lorg/json/JSONArray;

.field ims:Lorg/json/JSONArray;

.field name:Lorg/json/JSONObject;

.field nickname:Ljava/lang/String;

.field note:Ljava/lang/String;

.field organizations:Lorg/json/JSONArray;

.field phones:Lorg/json/JSONArray;

.field photos:Lorg/json/JSONArray;

.field websites:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->displayName:Ljava/lang/String;

    .line 46
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->name:Lorg/json/JSONObject;

    .line 47
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->organizations:Lorg/json/JSONArray;

    .line 48
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->addresses:Lorg/json/JSONArray;

    .line 49
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->phones:Lorg/json/JSONArray;

    .line 50
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->emails:Lorg/json/JSONArray;

    .line 51
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->ims:Lorg/json/JSONArray;

    .line 52
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->websites:Lorg/json/JSONArray;

    .line 53
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->photos:Lorg/json/JSONArray;

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->note:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->nickname:Ljava/lang/String;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/contacts/ContactInfoDTO;->desiredFieldsWithVals:Ljava/util/HashMap;

    .line 57
    return-void
.end method
