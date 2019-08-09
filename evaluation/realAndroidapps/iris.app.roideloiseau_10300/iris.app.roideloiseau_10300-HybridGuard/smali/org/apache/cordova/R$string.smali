.class public final Lorg/apache/cordova/R$string;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "string"
.end annotation


# static fields
.field public static activity_name:I

.field public static app_name:I

.field public static launcher_name:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const v0, 0x7f040002

    sput v0, Lorg/apache/cordova/R$string;->activity_name:I

    .line 22
    const/high16 v0, 0x7f040000

    sput v0, Lorg/apache/cordova/R$string;->app_name:I

    .line 23
    const v0, 0x7f040001

    sput v0, Lorg/apache/cordova/R$string;->launcher_name:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
