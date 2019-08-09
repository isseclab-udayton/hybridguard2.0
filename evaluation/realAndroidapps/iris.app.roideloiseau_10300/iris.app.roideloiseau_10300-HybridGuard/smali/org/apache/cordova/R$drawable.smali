.class public final Lorg/apache/cordova/R$drawable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "drawable"
.end annotation


# static fields
.field public static ic_action_next_item:I

.field public static ic_action_previous_item:I

.field public static ic_action_remove:I

.field public static icon:I

.field public static screen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/high16 v0, 0x7f020000

    sput v0, Lorg/apache/cordova/R$drawable;->ic_action_next_item:I

    .line 15
    const v0, 0x7f020001

    sput v0, Lorg/apache/cordova/R$drawable;->ic_action_previous_item:I

    .line 16
    const v0, 0x7f020002

    sput v0, Lorg/apache/cordova/R$drawable;->ic_action_remove:I

    .line 17
    const v0, 0x7f020003

    sput v0, Lorg/apache/cordova/R$drawable;->icon:I

    .line 18
    const v0, 0x7f020004

    sput v0, Lorg/apache/cordova/R$drawable;->screen:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
