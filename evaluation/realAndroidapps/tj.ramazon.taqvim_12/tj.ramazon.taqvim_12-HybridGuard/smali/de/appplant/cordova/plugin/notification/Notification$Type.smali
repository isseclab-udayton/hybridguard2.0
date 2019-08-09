.class public final enum Lde/appplant/cordova/plugin/notification/Notification$Type;
.super Ljava/lang/Enum;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/appplant/cordova/plugin/notification/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lde/appplant/cordova/plugin/notification/Notification$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lde/appplant/cordova/plugin/notification/Notification$Type;

.field public static final enum SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

.field public static final enum TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 49
    new-instance v0, Lde/appplant/cordova/plugin/notification/Notification$Type;

    const-string v1, "SCHEDULED"

    invoke-direct {v0, v1, v2}, Lde/appplant/cordova/plugin/notification/Notification$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    new-instance v0, Lde/appplant/cordova/plugin/notification/Notification$Type;

    const-string v1, "TRIGGERED"

    invoke-direct {v0, v1, v3}, Lde/appplant/cordova/plugin/notification/Notification$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    .line 48
    const/4 v0, 0x2

    new-array v0, v0, [Lde/appplant/cordova/plugin/notification/Notification$Type;

    sget-object v1, Lde/appplant/cordova/plugin/notification/Notification$Type;->SCHEDULED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    aput-object v1, v0, v2

    sget-object v1, Lde/appplant/cordova/plugin/notification/Notification$Type;->TRIGGERED:Lde/appplant/cordova/plugin/notification/Notification$Type;

    aput-object v1, v0, v3

    sput-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->ENUM$VALUES:[Lde/appplant/cordova/plugin/notification/Notification$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lde/appplant/cordova/plugin/notification/Notification$Type;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lde/appplant/cordova/plugin/notification/Notification$Type;

    return-object v0
.end method

.method public static values()[Lde/appplant/cordova/plugin/notification/Notification$Type;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lde/appplant/cordova/plugin/notification/Notification$Type;->ENUM$VALUES:[Lde/appplant/cordova/plugin/notification/Notification$Type;

    array-length v1, v0

    new-array v2, v1, [Lde/appplant/cordova/plugin/notification/Notification$Type;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
