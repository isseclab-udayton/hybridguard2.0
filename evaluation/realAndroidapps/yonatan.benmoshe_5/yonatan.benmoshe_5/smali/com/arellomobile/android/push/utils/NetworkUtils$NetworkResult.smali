.class public Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arellomobile/android/push/utils/NetworkUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkResult"
.end annotation


# instance fields
.field private mPushwooshCode:I

.field private mResultCode:I

.field private mResultData:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(IILorg/json/JSONObject;)V
    .locals 0
    .param p1, "networkCode"    # I
    .param p2, "pushwooshCode"    # I
    .param p3, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput p1, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultCode:I

    .line 125
    iput p2, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mPushwooshCode:I

    .line 126
    iput-object p3, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultData:Lorg/json/JSONObject;

    .line 127
    return-void
.end method


# virtual methods
.method public getPushwooshCode()I
    .locals 1

    .prologue
    .line 151
    iget v0, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mPushwooshCode:I

    return v0
.end method

.method public getResultCode()I
    .locals 1

    .prologue
    .line 146
    iget v0, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultCode:I

    return v0
.end method

.method public getResultData()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultData:Lorg/json/JSONObject;

    return-object v0
.end method

.method public setCode(I)V
    .locals 0
    .param p1, "code"    # I

    .prologue
    .line 131
    iput p1, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultCode:I

    .line 132
    return-void
.end method

.method public setData(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mResultData:Lorg/json/JSONObject;

    .line 142
    return-void
.end method

.method public setPushwooshCode(I)V
    .locals 0
    .param p1, "code"    # I

    .prologue
    .line 136
    iput p1, p0, Lcom/arellomobile/android/push/utils/NetworkUtils$NetworkResult;->mPushwooshCode:I

    .line 137
    return-void
.end method
