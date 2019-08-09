.class public Lcom/qualcomm/QCAR/QCAR;
.super Ljava/lang/Object;
.source "QCAR.java"


# static fields
.field public static final GL_11:I = 0x1

.field public static final GL_20:I = 0x2

.field public static final INIT_DEVICE_NOT_SUPPORTED:I = -0x2

.field public static final INIT_ERROR:I = -0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native deinit()V
.end method

.method public static init()I
    .locals 1

    .prologue
    .line 24
    invoke-static {}, Lcom/qualcomm/QCAR/QCAR;->progressiveInit()I

    move-result v0

    return v0
.end method

.method public static native isInitialized()Z
.end method

.method public static native onPause()V
.end method

.method public static native onResume()V
.end method

.method public static native onSurfaceChanged(II)V
.end method

.method public static native onSurfaceCreated()V
.end method

.method private static native privateInit()V
.end method

.method private static native privateSetInitParameters(Landroid/app/Activity;I)V
.end method

.method private static native progressiveInit()I
.end method

.method public static native requiresAlpha()Z
.end method

.method public static setInitParameters(Landroid/app/Activity;I)V
    .locals 0
    .param p0, "nActivity"    # Landroid/app/Activity;
    .param p1, "nFlags"    # I

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/qualcomm/QCAR/QCAR;->privateSetInitParameters(Landroid/app/Activity;I)V

    .line 30
    invoke-static {}, Lcom/qualcomm/QCAR/QCAR;->privateInit()V

    .line 31
    return-void
.end method
