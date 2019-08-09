.class public Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "BarcodeScanner.java"


# static fields
.field private static final CANCELLED:Ljava/lang/String; = "cancelled"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final EMAIL_TYPE:Ljava/lang/String; = "EMAIL_TYPE"

.field private static final ENCODE:Ljava/lang/String; = "encode"

.field private static final ENCODE_DATA:Ljava/lang/String; = "ENCODE_DATA"

.field private static final ENCODE_INTENT:Ljava/lang/String; = "com.phonegap.plugins.barcodescanner.ENCODE"

.field private static final ENCODE_TYPE:Ljava/lang/String; = "ENCODE_TYPE"

.field private static final FORMAT:Ljava/lang/String; = "format"

.field private static final PHONE_TYPE:Ljava/lang/String; = "PHONE_TYPE"

.field public static final REQUEST_CODE:I = 0xba7c0de

.field private static final SCAN:Ljava/lang/String; = "scan"

.field private static final SCAN_INTENT:Ljava/lang/String; = "com.phonegap.plugins.barcodescanner.SCAN"

.field private static final SMS_TYPE:Ljava/lang/String; = "SMS_TYPE"

.field private static final TEXT:Ljava/lang/String; = "text"

.field private static final TEXT_TYPE:Ljava/lang/String; = "TEXT_TYPE"

.field private static final TYPE:Ljava/lang/String; = "type"


# instance fields
.field public callback:Ljava/lang/String;

.field private cbContext:Lorg/apache/cordova/api/CallbackContext;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    .line 50
    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 159
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.phonegap.plugins.barcodescanner.ENCODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 160
    .local v0, "intentEncode":Landroid/content/Intent;
    const-string v1, "ENCODE_TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 161
    const-string v1, "ENCODE_DATA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 163
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 164
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    const/4 v3, 0x0

    .line 62
    iput-object p3, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cbContext:Lorg/apache/cordova/api/CallbackContext;

    .line 64
    const-string v4, "encode"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 65
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 66
    .local v1, "obj":Lorg/json/JSONObject;
    if-eqz v1, :cond_2

    .line 67
    const-string v4, "type"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "type":Ljava/lang/String;
    const-string v4, "data"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "data":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 72
    const-string v2, "TEXT_TYPE"

    .line 75
    :cond_0
    if-nez v0, :cond_1

    .line 76
    const-string v4, "User did not specify data to encode"

    invoke-virtual {p3, v4}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    .line 98
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v2    # "type":Ljava/lang/String;
    :goto_0
    return v3

    .line 81
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v1    # "obj":Lorg/json/JSONObject;
    .restart local v2    # "type":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v2, v0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->encode(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "obj":Lorg/json/JSONObject;
    .end local v2    # "type":Ljava/lang/String;
    :goto_1
    const/4 v3, 0x1

    goto :goto_0

    .line 83
    .restart local v1    # "obj":Lorg/json/JSONObject;
    :cond_2
    const-string v4, "User did not specify data to encode"

    invoke-virtual {p3, v4}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 88
    .end local v1    # "obj":Lorg/json/JSONObject;
    :cond_3
    const-string v4, "scan"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 90
    invoke-virtual {p0}, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->scan()V

    goto :goto_1

    .line 93
    :cond_4
    const-string v4, "Invalid Action"

    invoke-virtual {p3, v4}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 120
    const v1, 0xba7c0de

    if-ne p1, v1, :cond_0

    .line 121
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 122
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 124
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "text"

    const-string v2, "SCAN_RESULT"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    const-string v1, "format"

    const-string v2, "SCAN_RESULT_FORMAT"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    const-string v1, "cancelled"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 131
    :goto_0
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cbContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/api/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 151
    .end local v0    # "obj":Lorg/json/JSONObject;
    :cond_0
    :goto_1
    return-void

    .line 133
    :cond_1
    if-nez p2, :cond_2

    .line 134
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 136
    .restart local v0    # "obj":Lorg/json/JSONObject;
    :try_start_1
    const-string v1, "text"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 137
    const-string v1, "format"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 138
    const-string v1, "cancelled"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 143
    :goto_2
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cbContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/api/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 147
    .end local v0    # "obj":Lorg/json/JSONObject;
    :cond_2
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cbContext:Lorg/apache/cordova/api/CallbackContext;

    const-string v2, "Invalid Activity"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 139
    .restart local v0    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    goto :goto_2

    .line 127
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public scan()V
    .locals 3

    .prologue
    .line 105
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.phonegap.plugins.barcodescanner.SCAN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 106
    .local v0, "intentScan":Landroid/content/Intent;
    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    iget-object v1, p0, Lcom/phonegap/plugins/barcodescanner/BarcodeScanner;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    const v2, 0xba7c0de

    invoke-interface {v1, p0, v0, v2}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 109
    return-void
.end method
