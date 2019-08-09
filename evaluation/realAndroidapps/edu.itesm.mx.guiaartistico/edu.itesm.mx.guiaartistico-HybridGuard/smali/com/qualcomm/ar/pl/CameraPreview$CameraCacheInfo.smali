.class public Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
.super Ljava/lang/Object;
.source "CameraPreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/CameraPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CameraCacheInfo"
.end annotation


# instance fields
.field buffer:[[B

.field bufferFormatPL:I

.field bufferHeight:I

.field bufferWidth:I

.field camera:Landroid/hardware/Camera;

.field caps:[I

.field deviceID:I

.field isAutoFocusing:Z

.field overrideFormatAndroid:I

.field overrideHeight:I

.field overrideWidth:I

.field requestFormatAndroid:I

.field requestHeight:I

.field requestWidth:I

.field status:I

.field surface:Lcom/qualcomm/ar/pl/CameraSurface;

.field surfaceTexture:Ljava/lang/Object;

.field final synthetic this$0:Lcom/qualcomm/ar/pl/CameraPreview;


# direct methods
.method public constructor <init>(Lcom/qualcomm/ar/pl/CameraPreview;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->this$0:Lcom/qualcomm/ar/pl/CameraPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
