.class public Lcom/arellomobile/android/push/data/PushZoneLocation;
.super Ljava/lang/Object;
.source "PushZoneLocation.java"


# instance fields
.field private mDistanceTo:J

.field private mLat:D

.field private mLng:D

.field private mName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDistanceTo()J
    .locals 2

    .prologue
    .line 19
    iget-wide v0, p0, Lcom/arellomobile/android/push/data/PushZoneLocation;->mDistanceTo:J

    return-wide v0
.end method

.method public setDistanceTo(J)V
    .locals 0
    .param p1, "distanceTo"    # J

    .prologue
    .line 39
    iput-wide p1, p0, Lcom/arellomobile/android/push/data/PushZoneLocation;->mDistanceTo:J

    .line 40
    return-void
.end method

.method public setLat(D)V
    .locals 0
    .param p1, "lat"    # D

    .prologue
    .line 29
    iput-wide p1, p0, Lcom/arellomobile/android/push/data/PushZoneLocation;->mLat:D

    .line 30
    return-void
.end method

.method public setLng(D)V
    .locals 0
    .param p1, "lng"    # D

    .prologue
    .line 34
    iput-wide p1, p0, Lcom/arellomobile/android/push/data/PushZoneLocation;->mLng:D

    .line 35
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/arellomobile/android/push/data/PushZoneLocation;->mName:Ljava/lang/String;

    .line 25
    return-void
.end method
