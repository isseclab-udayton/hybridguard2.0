.class public Lcom/qualcomm/ar/pl/CameraPreview;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    }
.end annotation


# static fields
.field private static final AR_CAMERA_DIRECTION_BACK:I = 0x10002011

.field private static final AR_CAMERA_DIRECTION_FRONT:I = 0x10002012

.field private static final AR_CAMERA_DIRECTION_UNKNOWN:I = 0x10002010

.field private static final AR_CAMERA_EXPOSUREMODE_AUTO:I = 0x30002000

.field private static final AR_CAMERA_EXPOSUREMODE_CONTINUOUSAUTO:I = 0x30004000

.field private static final AR_CAMERA_EXPOSUREMODE_NORMAL:I = 0x30001000

.field private static final AR_CAMERA_FOCUSMODE_AUTO:I = 0x30000020

.field private static final AR_CAMERA_FOCUSMODE_CONTINUOUSAUTO:I = 0x30000040

.field private static final AR_CAMERA_FOCUSMODE_FIXED:I = 0x30000200

.field private static final AR_CAMERA_FOCUSMODE_INFINITY:I = 0x30000100

.field private static final AR_CAMERA_FOCUSMODE_MACRO:I = 0x30000080

.field private static final AR_CAMERA_FOCUSMODE_NORMAL:I = 0x30000010

.field private static final AR_CAMERA_IMAGE_FORMAT_ARGB32:I = 0x10001105

.field private static final AR_CAMERA_IMAGE_FORMAT_ARGB8888:I = 0x10001105

.field private static final AR_CAMERA_IMAGE_FORMAT_BGR24:I = 0x1000110e

.field private static final AR_CAMERA_IMAGE_FORMAT_BGR888:I = 0x1000110e

.field private static final AR_CAMERA_IMAGE_FORMAT_BGRA32:I = 0x10001106

.field private static final AR_CAMERA_IMAGE_FORMAT_BGRA8888:I = 0x10001106

.field private static final AR_CAMERA_IMAGE_FORMAT_LUM:I = 0x10001101

.field private static final AR_CAMERA_IMAGE_FORMAT_NV12:I = 0x10001107

.field private static final AR_CAMERA_IMAGE_FORMAT_NV16:I = 0x10001108

.field private static final AR_CAMERA_IMAGE_FORMAT_NV21:I = 0x10001109

.field private static final AR_CAMERA_IMAGE_FORMAT_RGB24:I = 0x10001103

.field private static final AR_CAMERA_IMAGE_FORMAT_RGB565:I = 0x10001102

.field private static final AR_CAMERA_IMAGE_FORMAT_RGB888:I = 0x10001103

.field private static final AR_CAMERA_IMAGE_FORMAT_RGBA32:I = 0x10001104

.field private static final AR_CAMERA_IMAGE_FORMAT_RGBA4444:I = 0x1000110d

.field private static final AR_CAMERA_IMAGE_FORMAT_RGBA5551:I = 0x1000110c

.field private static final AR_CAMERA_IMAGE_FORMAT_RGBA8888:I = 0x10001104

.field private static final AR_CAMERA_IMAGE_FORMAT_UNKNOWN:I = 0x10001100

.field private static final AR_CAMERA_IMAGE_FORMAT_YV12:I = 0x1000110a

.field private static final AR_CAMERA_IMAGE_FORMAT_YV16:I = 0x1000110b

.field private static final AR_CAMERA_PARAMTYPE_BASE:I = 0x20000000

.field private static final AR_CAMERA_PARAMTYPE_BRIGHTNESSRANGE:I = 0x20010000

.field private static final AR_CAMERA_PARAMTYPE_BRIGHTNESSVALUE:I = 0x20008000

.field private static final AR_CAMERA_PARAMTYPE_CONTRASTRANGE:I = 0x20040000

.field private static final AR_CAMERA_PARAMTYPE_CONTRASTVALUE:I = 0x20020000

.field private static final AR_CAMERA_PARAMTYPE_EXPOSURECOMPENSATIONRANGE:I = 0x20000200

.field private static final AR_CAMERA_PARAMTYPE_EXPOSURECOMPENSATIONVALUE:I = 0x20000100

.field private static final AR_CAMERA_PARAMTYPE_EXPOSUREMODE:I = 0x20000020

.field private static final AR_CAMERA_PARAMTYPE_EXPOSURERANGE:I = 0x20000080

.field private static final AR_CAMERA_PARAMTYPE_EXPOSUREVALUE:I = 0x20000040

.field private static final AR_CAMERA_PARAMTYPE_FOCUSMODE:I = 0x20000002

.field private static final AR_CAMERA_PARAMTYPE_FOCUSRANGE:I = 0x20000008

.field private static final AR_CAMERA_PARAMTYPE_FOCUSREGION:I = 0x20000010

.field private static final AR_CAMERA_PARAMTYPE_FOCUSVALUE:I = 0x20000004

.field private static final AR_CAMERA_PARAMTYPE_ROTATION:I = 0x20080000

.field private static final AR_CAMERA_PARAMTYPE_TORCHMODE:I = 0x20000001

.field private static final AR_CAMERA_PARAMTYPE_WHITEBALANCEMODE:I = 0x20000400

.field private static final AR_CAMERA_PARAMTYPE_WHITEBALANCERANGE:I = 0x20001000

.field private static final AR_CAMERA_PARAMTYPE_WHITEBALANCEVALUE:I = 0x20000800

.field private static final AR_CAMERA_PARAMTYPE_ZOOMRANGE:I = 0x20004000

.field private static final AR_CAMERA_PARAMTYPE_ZOOMVALUE:I = 0x20002000

.field private static final AR_CAMERA_PARAMVALUE_BASE:I = 0x30000000

.field private static final AR_CAMERA_STATUS_CAPTURE_RUNNING:I = 0x10002003

.field private static final AR_CAMERA_STATUS_OPENED:I = 0x10002002

.field private static final AR_CAMERA_STATUS_UNINITIALIZED:I = 0x10002001

.field private static final AR_CAMERA_STATUS_UNKNOWN:I = 0x10002000

.field private static final AR_CAMERA_TORCHMODE_AUTO:I = 0x30000004

.field private static final AR_CAMERA_TORCHMODE_CONTINUOUSAUTO:I = 0x30000008

.field private static final AR_CAMERA_TORCHMODE_OFF:I = 0x30000001

.field private static final AR_CAMERA_TORCHMODE_ON:I = 0x30000002

.field private static final AR_CAMERA_TYPE_MONO:I = 0x10003011

.field private static final AR_CAMERA_TYPE_STEREO:I = 0x10003012

.field private static final AR_CAMERA_TYPE_UNKNOWN:I = 0x10003010

.field private static final AR_CAMERA_WHITEBALANCEMODE_AUTO:I = 0x30020000

.field private static final AR_CAMERA_WHITEBALANCEMODE_CONTINUOUSAUTO:I = 0x30040000

.field private static final AR_CAMERA_WHITEBALANCEMODE_NORMAL:I = 0x30010000

.field private static final CAMERA_CAPSINFO_VALUE_NUM_SUPPORTED_FRAMERATES:I = 0x4

.field private static final CAMERA_CAPSINFO_VALUE_NUM_SUPPORTED_IMAGEFORMATS:I = 0x5

.field private static final CAMERA_CAPSINFO_VALUE_NUM_SUPPORTED_IMAGESIZES:I = 0x3

.field private static final CAMERA_CAPSINFO_VALUE_SUPPORTED_PARAMVALUES:I = 0x2

.field private static final CAMERA_CAPSINFO_VALUE_SUPPORTED_QUERYABLE_PARAMS:I = 0x0

.field private static final CAMERA_CAPSINFO_VALUE_SUPPORTED_SETTABLE_PARAMS:I = 0x1

.field private static final CAMERA_CAPTUREINFO_VALUE_FORMAT:I = 0x2

.field private static final CAMERA_CAPTUREINFO_VALUE_FRAMERATE:I = 0x3

.field private static final CAMERA_CAPTUREINFO_VALUE_HEIGHT:I = 0x1

.field private static final CAMERA_CAPTUREINFO_VALUE_PREVIEWSURFACEENABLED:I = 0x4

.field private static final CAMERA_CAPTUREINFO_VALUE_WIDTH:I = 0x0

.field private static final CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

.field private static CONVERT_FORMAT_TO_ANDROID:Z = false

.field private static CONVERT_FORMAT_TO_PL:Z = false

.field private static final FOCUS_MODE_CONTINUOUS_PICTURE:Ljava/lang/String; = "continuous-picture"

.field private static final FOCUS_MODE_NORMAL:Ljava/lang/String; = "normal"

.field private static final MODULENAME:Ljava/lang/String; = "CameraPreview"

.field private static final NUM_CAPTURE_BUFFERS:I = 0x2

.field private static final NUM_CAPTURE_BUFFERS_TO_ADD:I = 0x2

.field private static final NUM_MAX_CAMERAOPEN_RETRY:I = 0xa

.field private static final TIME_CAMERAOPEN_RETRY_DELAY_MS:I = 0xfa

.field private static final _NUM_CAMERA_CAPSINFO_VALUE_:I = 0x6

.field private static final _NUM_CAMERA_CAPTUREINFO_VALUE_:I = 0x5

.field private static _addCallbackBufferArgs:[Ljava/lang/Object;

.field private static _addCallbackBufferFunc:Ljava/lang/reflect/Method;

.field private static _setPreviewCallbackWithBufferFunc:Ljava/lang/reflect/Method;

.field private static _setPreviewTextureFunc:Ljava/lang/reflect/Method;

.field private static _surfaceTextureConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static _updateTexImage:Ljava/lang/reflect/Method;


# instance fields
.field private cameraCacheInfo:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;",
            ">;"
        }
    .end annotation
.end field

.field private cameraCacheInfoIndexCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/Camera;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 190
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    .line 200
    const/4 v0, 0x1

    sput-boolean v0, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    .line 201
    const/4 v0, 0x0

    sput-boolean v0, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_ANDROID:Z

    return-void

    .line 190
    :array_0
    .array-data 4
        0x10
        0x10001108
        0x11
        0x10001109
        0x4
        0x10001102
        0x32315659
        0x1000110a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    .line 228
    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    .line 229
    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    .line 231
    sput-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferFunc:Ljava/lang/reflect/Method;

    .line 232
    sput-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferArgs:[Ljava/lang/Object;

    .line 233
    sput-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewCallbackWithBufferFunc:Ljava/lang/reflect/Method;

    .line 234
    return-void
.end method

.method private _addCallbackBuffer(Landroid/hardware/Camera;[B)V
    .locals 2
    .param p1, "cam"    # Landroid/hardware/Camera;
    .param p2, "buffer"    # [B

    .prologue
    .line 773
    sget-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferArgs:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 778
    :try_start_0
    sget-object v0, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferFunc:Ljava/lang/reflect/Method;

    sget-object v1, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferArgs:[Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 784
    :goto_0
    return-void

    .line 780
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private _setPreviewCallbackWithBuffer(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V
    .locals 2
    .param p1, "cam"    # Landroid/hardware/Camera;
    .param p2, "previewCB"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 790
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    .line 791
    .local v0, "args":[Ljava/lang/Object;
    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 796
    :try_start_0
    sget-object v1, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewCallbackWithBufferFunc:Ljava/lang/reflect/Method;

    invoke-virtual {v1, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 802
    :goto_0
    return-void

    .line 798
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/qualcomm/ar/pl/CameraPreview;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/ar/pl/CameraPreview;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/qualcomm/ar/pl/CameraPreview;I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/ar/pl/CameraPreview;
    .param p1, "x1"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    return-object v0
.end method

.method private checkPermission()Z
    .locals 5

    .prologue
    .line 248
    :try_start_0
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 249
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 251
    .local v2, "pm":Landroid/content/pm/PackageManager;
    const-string v3, "android.permission.CAMERA"

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 252
    .local v1, "isPermissionGranted":I
    if-nez v1, :cond_0

    .line 255
    const/4 v3, 0x1

    .line 267
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "isPermissionGranted":I
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    :goto_0
    return v3

    .line 262
    :catch_0
    move-exception v3

    .line 267
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    .locals 1
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    .line 387
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 390
    :cond_0
    const/4 v0, 0x0

    .line 394
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    goto :goto_0
.end method

.method private getCameraDeviceIndex(III)I
    .locals 8
    .param p1, "camIndex"    # I
    .param p2, "type"    # I
    .param p3, "direction"    # I

    .prologue
    const/4 v7, 0x2

    const/4 v5, -0x1

    .line 274
    const v6, 0x10003010

    if-eq p2, v6, :cond_0

    .line 282
    :cond_0
    const/16 v6, 0x9

    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 285
    const/4 v0, -0x1

    .line 288
    .local v0, "camInfoDirection":I
    packed-switch p3, :pswitch_data_0

    .line 304
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move v3, v5

    .line 362
    .end local v0    # "camInfoDirection":I
    :cond_1
    :goto_0
    return v3

    .line 295
    .restart local v0    # "camInfoDirection":I
    :pswitch_0
    const/4 v0, 0x0

    .line 310
    :goto_1
    :pswitch_1
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v4

    .line 313
    .local v4, "num":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, v4, :cond_4

    .line 315
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 318
    .local v1, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    :try_start_0
    invoke-static {v3, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    if-ltz v0, :cond_2

    iget v6, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v0, v6, :cond_3

    .line 331
    :cond_2
    if-ltz p1, :cond_1

    if-eq p1, v3, :cond_1

    .line 313
    :cond_3
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 299
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v3    # "i":I
    .end local v4    # "num":I
    :pswitch_2
    const/4 v0, 0x1

    .line 300
    goto :goto_1

    .line 320
    .restart local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .restart local v3    # "i":I
    .restart local v4    # "num":I
    :catch_0
    move-exception v2

    .line 323
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_3

    .line 340
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_4
    const/4 v6, 0x6

    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move v3, v5

    .line 342
    goto :goto_0

    .line 346
    .end local v0    # "camInfoDirection":I
    .end local v3    # "i":I
    .end local v4    # "num":I
    :cond_5
    const v6, 0x10002012

    if-ne p3, v6, :cond_6

    .line 348
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move v3, v5

    .line 350
    goto :goto_0

    .line 355
    :cond_6
    const/4 v6, 0x1

    if-lt p1, v6, :cond_7

    .line 357
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move v3, v5

    .line 359
    goto :goto_0

    .line 362
    :cond_7
    const/4 v3, 0x0

    goto :goto_0

    .line 288
    nop

    :pswitch_data_0
    .packed-switch 0x10002010
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;
    .locals 2
    .param p1, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 369
    const/4 v0, 0x0

    .line 374
    .local v0, "params":Landroid/hardware/Camera$Parameters;
    :try_start_0
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 381
    :goto_0
    return-object v0

    .line 376
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private native newFrameAvailable(IIII[B)V
.end method

.method private setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V
    .locals 7
    .param p1, "cci"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    .param p2, "capsIndex"    # I
    .param p3, "paramType"    # I
    .param p4, "value"    # Z

    .prologue
    const/4 v6, 0x1

    .line 668
    const/4 v0, 0x0

    .line 669
    .local v0, "baseValue":I
    packed-switch p2, :pswitch_data_0

    .line 697
    :goto_0
    return-void

    .line 672
    :pswitch_0
    const/high16 v0, 0x30000000

    .line 685
    :goto_1
    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v2, p3

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    div-double/2addr v2, v4

    double-to-int v1, v2

    .line 689
    .local v1, "index":I
    if-eqz p4, :cond_0

    .line 691
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    aget v3, v2, p2

    shl-int v4, v6, v1

    or-int/2addr v3, v4

    aput v3, v2, p2

    goto :goto_0

    .line 677
    .end local v1    # "index":I
    :pswitch_1
    const/high16 v0, 0x20000000

    .line 678
    goto :goto_1

    .line 695
    .restart local v1    # "index":I
    :cond_0
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    aget v3, v2, p2

    shl-int v4, v6, v1

    xor-int/lit8 v4, v4, -0x1

    and-int/2addr v3, v4

    aput v3, v2, p2

    goto :goto_0

    .line 669
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setCameraCaptureParams(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;Landroid/hardware/Camera$Parameters;[I[I)Z
    .locals 11
    .param p1, "camCacheInfo"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    .param p2, "camParams"    # Landroid/hardware/Camera$Parameters;
    .param p3, "captureInfo"    # [I
    .param p4, "overrideCaptureInfo"    # [I

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 458
    if-nez p3, :cond_0

    if-eqz p4, :cond_1

    .line 460
    :cond_0
    if-eqz p4, :cond_2

    aget v6, p4, v8

    :goto_0
    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideWidth:I

    .line 461
    if-eqz p4, :cond_3

    aget v6, p4, v7

    :goto_1
    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideHeight:I

    .line 462
    if-eqz p4, :cond_4

    aget v6, p4, v10

    :goto_2
    sget-boolean v9, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_ANDROID:Z

    invoke-direct {p0, v6, v9}, Lcom/qualcomm/ar/pl/CameraPreview;->translateImageFormat(IZ)I

    move-result v6

    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideFormatAndroid:I

    .line 469
    :cond_1
    if-nez p3, :cond_5

    move v6, v7

    .line 575
    :goto_3
    return v6

    .line 460
    :cond_2
    aget v6, p3, v8

    goto :goto_0

    .line 461
    :cond_3
    aget v6, p3, v7

    goto :goto_1

    .line 462
    :cond_4
    aget v6, p3, v10

    goto :goto_2

    .line 476
    :cond_5
    aget v6, p3, v8

    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestWidth:I

    .line 477
    aget v6, p3, v7

    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestHeight:I

    .line 478
    aget v6, p3, v10

    sget-boolean v9, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_ANDROID:Z

    invoke-direct {p0, v6, v9}, Lcom/qualcomm/ar/pl/CameraPreview;->translateImageFormat(IZ)I

    move-result v6

    iput v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestFormatAndroid:I

    .line 479
    const/4 v6, 0x3

    aget v2, p3, v6

    .line 489
    .local v2, "framerate":I
    :try_start_0
    iget v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestWidth:I

    if-lez v6, :cond_6

    iget v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestHeight:I

    if-lez v6, :cond_6

    .line 491
    iget v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestWidth:I

    iget v9, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestHeight:I

    invoke-virtual {p2, v6, v9}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 495
    :cond_6
    if-lez v2, :cond_7

    .line 497
    invoke-virtual {p2, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 501
    :cond_7
    iget v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestFormatAndroid:I

    if-eqz v6, :cond_8

    .line 503
    iget v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestFormatAndroid:I

    invoke-virtual {p2, v6}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 513
    :cond_8
    const/4 v6, 0x4

    aget v6, p3, v6

    if-lez v6, :cond_a

    move v3, v7

    .line 516
    .local v3, "previewSurfaceEnabled":Z
    :goto_4
    if-eqz v3, :cond_9

    .line 518
    const/16 v6, 0xb

    invoke-static {v6}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 522
    const/4 v5, -0x1

    .line 525
    .local v5, "textureID":I
    new-array v0, v7, [Ljava/lang/Object;

    .line 526
    .local v0, "argList":[Ljava/lang/Object;
    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v0, v8

    .line 531
    :try_start_1
    sget-object v6, Lcom/qualcomm/ar/pl/CameraPreview;->_surfaceTextureConstructor:Ljava/lang/reflect/Constructor;

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surfaceTexture:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 542
    const/4 v6, 0x0

    :try_start_2
    iget-object v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surfaceTexture:Ljava/lang/Object;

    aput-object v8, v0, v6

    .line 543
    sget-object v6, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewTextureFunc:Ljava/lang/reflect/Method;

    iget-object v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v6, v8, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .end local v0    # "argList":[Ljava/lang/Object;
    .end local v5    # "textureID":I
    :cond_9
    :goto_5
    move v6, v7

    .line 575
    goto :goto_3

    .line 506
    .end local v3    # "previewSurfaceEnabled":Z
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move v6, v8

    .line 509
    goto :goto_3

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_a
    move v3, v8

    .line 513
    goto :goto_4

    .line 533
    .restart local v0    # "argList":[Ljava/lang/Object;
    .restart local v3    # "previewSurfaceEnabled":Z
    .restart local v5    # "textureID":I
    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/Exception;
    move v6, v8

    .line 536
    goto :goto_3

    .line 554
    .end local v0    # "argList":[Ljava/lang/Object;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "textureID":I
    :cond_b
    iget-object v6, p0, Lcom/qualcomm/ar/pl/CameraPreview;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    if-eqz v6, :cond_c

    .line 557
    iget-object v6, p0, Lcom/qualcomm/ar/pl/CameraPreview;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-virtual {v6, p1}, Lcom/qualcomm/ar/pl/SurfaceManager;->addCameraSurface(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)Z

    move-result v4

    .line 558
    .local v4, "result":Z
    if-nez v4, :cond_9

    move v6, v8

    .line 561
    goto/16 :goto_3

    .end local v4    # "result":Z
    :cond_c
    move v6, v8

    .line 569
    goto/16 :goto_3

    .line 545
    .restart local v0    # "argList":[Ljava/lang/Object;
    .restart local v5    # "textureID":I
    :catch_2
    move-exception v6

    goto :goto_5
.end method

.method private setCustomCameraParams(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)Z
    .locals 9
    .param p1, "cameraParams"    # Landroid/hardware/Camera$Parameters;
    .param p2, "customData"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 403
    const/4 v2, 0x0

    .line 406
    .local v2, "jsonObj":Lorg/json/JSONObject;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    .end local v2    # "jsonObj":Lorg/json/JSONObject;
    .local v3, "jsonObj":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 416
    .local v1, "elements":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 418
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 422
    .local v4, "key":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 431
    .local v5, "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Ljava/lang/String;

    if-ne v7, v8, :cond_0

    .line 434
    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v4, v5}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 408
    .end local v1    # "elements":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v3    # "jsonObj":Lorg/json/JSONObject;
    .end local v4    # "key":Ljava/lang/String;
    .restart local v2    # "jsonObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 449
    :goto_1
    return v6

    .line 424
    .end local v2    # "jsonObj":Lorg/json/JSONObject;
    .restart local v1    # "elements":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v3    # "jsonObj":Lorg/json/JSONObject;
    .restart local v4    # "key":Ljava/lang/String;
    :catch_1
    move-exception v0

    .local v0, "e":Lorg/json/JSONException;
    move-object v2, v3

    .line 428
    .end local v3    # "jsonObj":Lorg/json/JSONObject;
    .restart local v2    # "jsonObj":Lorg/json/JSONObject;
    goto :goto_1

    .line 436
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "jsonObj":Lorg/json/JSONObject;
    .restart local v3    # "jsonObj":Lorg/json/JSONObject;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Ljava/lang/Integer;

    if-ne v7, v8, :cond_1

    .line 439
    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p1, v4, v7}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    goto :goto_0

    .restart local v5    # "value":Ljava/lang/Object;
    :cond_1
    move-object v2, v3

    .line 444
    .end local v3    # "jsonObj":Lorg/json/JSONObject;
    .restart local v2    # "jsonObj":Lorg/json/JSONObject;
    goto :goto_1

    .line 449
    .end local v2    # "jsonObj":Lorg/json/JSONObject;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    .restart local v3    # "jsonObj":Lorg/json/JSONObject;
    :cond_2
    const/4 v6, 0x1

    move-object v2, v3

    .end local v3    # "jsonObj":Lorg/json/JSONObject;
    .restart local v2    # "jsonObj":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method private setupPreviewBuffer(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)Z
    .locals 11
    .param p1, "cci"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x0

    .line 582
    iget-object v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v8}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v3

    .line 585
    .local v3, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v3, :cond_0

    .line 662
    :goto_0
    return v7

    .line 591
    :cond_0
    const/4 v1, 0x0

    .line 598
    .local v1, "bufferFormatAndroid":I
    :try_start_0
    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestWidth:I

    iget v9, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideWidth:I

    if-ne v8, v9, :cond_3

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v8

    iget v8, v8, Landroid/hardware/Camera$Size;->width:I

    :goto_1
    iput v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferWidth:I

    .line 599
    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestHeight:I

    iget v9, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideHeight:I

    if-ne v8, v9, :cond_4

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v8

    iget v8, v8, Landroid/hardware/Camera$Size;->height:I

    :goto_2
    iput v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferHeight:I

    .line 601
    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestFormatAndroid:I

    iget v9, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideFormatAndroid:I

    if-ne v8, v9, :cond_5

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v1

    .line 602
    :goto_3
    sget-boolean v8, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    invoke-direct {p0, v1, v8}, Lcom/qualcomm/ar/pl/CameraPreview;->translateImageFormat(IZ)I

    move-result v8

    iput v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferFormatPL:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 612
    const/4 v0, 0x0

    .line 616
    .local v0, "bitsPerPixel":I
    :try_start_1
    new-instance v6, Landroid/graphics/PixelFormat;

    invoke-direct {v6}, Landroid/graphics/PixelFormat;-><init>()V

    .line 618
    .local v6, "pixelFormatInfo":Landroid/graphics/PixelFormat;
    invoke-static {v1, v6}, Landroid/graphics/PixelFormat;->getPixelFormatInfo(ILandroid/graphics/PixelFormat;)V

    .line 619
    iget v0, v6, Landroid/graphics/PixelFormat;->bitsPerPixel:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 639
    .end local v6    # "pixelFormatInfo":Landroid/graphics/PixelFormat;
    :cond_1
    iget v7, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferWidth:I

    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferHeight:I

    mul-int/2addr v7, v8

    mul-int/2addr v7, v0

    div-int/lit8 v7, v7, 0x8

    add-int/lit16 v2, v7, 0x1000

    .line 643
    .local v2, "bufferSize":I
    new-array v7, v10, [[B

    iput-object v7, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->buffer:[[B

    .line 644
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    if-ge v5, v10, :cond_6

    .line 646
    iget-object v7, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->buffer:[[B

    new-array v8, v2, [B

    aput-object v8, v7, v5

    .line 649
    if-ge v5, v10, :cond_2

    .line 651
    iget-object v7, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    iget-object v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->buffer:[[B

    aget-object v8, v8, v5

    invoke-direct {p0, v7, v8}, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBuffer(Landroid/hardware/Camera;[B)V

    .line 644
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 598
    .end local v0    # "bitsPerPixel":I
    .end local v2    # "bufferSize":I
    .end local v5    # "i":I
    :cond_3
    :try_start_2
    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideWidth:I

    goto :goto_1

    .line 599
    :cond_4
    iget v8, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideHeight:I

    goto :goto_2

    .line 601
    :cond_5
    iget v1, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideFormatAndroid:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    .line 604
    :catch_0
    move-exception v4

    .line 608
    .local v4, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 621
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "bitsPerPixel":I
    :catch_1
    move-exception v4

    .line 625
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->getBitsPerPixel(I)I

    move-result v0

    .line 626
    if-nez v0, :cond_1

    goto :goto_0

    .line 656
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v2    # "bufferSize":I
    .restart local v5    # "i":I
    :cond_6
    iget-object v7, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v7, p0}, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewCallbackWithBuffer(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 659
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 662
    const/4 v7, 0x1

    goto :goto_0
.end method

.method private translateImageFormat(IZ)I
    .locals 4
    .param p1, "fromValue"    # I
    .param p2, "conversionMode"    # Z

    .prologue
    .line 702
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    array-length v2, v2

    div-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_3

    .line 704
    sget-boolean v2, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_0

    sget-object v2, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    aget v0, v2, v3

    .line 708
    .local v0, "compareValue":I
    :goto_1
    if-ne p1, v0, :cond_2

    .line 710
    sget-boolean v2, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_1

    sget-object v2, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v2, v2, v3

    .line 716
    .end local v0    # "compareValue":I
    :goto_2
    return v2

    .line 704
    :cond_0
    sget-object v2, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget v0, v2, v3

    goto :goto_1

    .line 710
    .restart local v0    # "compareValue":I
    :cond_1
    sget-object v2, Lcom/qualcomm/ar/pl/CameraPreview;->CAMERA_IMAGE_FORMAT_CONVERSIONTABLE:[I

    mul-int/lit8 v3, v1, 0x2

    aget v2, v2, v3

    goto :goto_2

    .line 702
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 716
    .end local v0    # "compareValue":I
    :cond_3
    sget-boolean v2, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    if-ne p2, v2, :cond_4

    const v2, 0x10001100

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    goto :goto_2
.end method


# virtual methods
.method public close(I)Z
    .locals 5
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    const/4 v2, 0x0

    .line 1244
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    .line 1247
    .local v0, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v0, :cond_0

    .line 1249
    const/4 v2, 0x4

    invoke-static {v2}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1251
    const/4 v1, 0x0

    .line 1280
    :goto_0
    return v1

    .line 1255
    :cond_0
    iget-object v3, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    iget-object v4, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1258
    const/4 v1, 0x0

    .line 1261
    .local v1, "result":Z
    :try_start_0
    iget-object v3, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1262
    const/4 v1, 0x1

    .line 1270
    :goto_1
    iput-object v2, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    .line 1271
    check-cast v2, [[B

    iput-object v2, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->buffer:[[B

    .line 1274
    const v2, 0x10002001

    iput v2, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I

    .line 1277
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_0

    .line 1264
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method getBitsPerPixel(I)I
    .locals 2
    .param p1, "imgFormat"    # I

    .prologue
    const/16 v0, 0x10

    const/16 v1, 0xc

    .line 722
    sparse-switch p1, :sswitch_data_0

    .line 728
    const/4 v0, 0x0

    :goto_0
    :sswitch_0
    return v0

    :sswitch_1
    move v0, v1

    .line 726
    goto :goto_0

    :sswitch_2
    move v0, v1

    .line 727
    goto :goto_0

    .line 722
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x10 -> :sswitch_0
        0x11 -> :sswitch_1
        0x32315659 -> :sswitch_2
    .end sparse-switch
.end method

.method public getCameraCapabilities(I)[I
    .locals 25
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    .line 1289
    invoke-direct/range {p0 .. p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v6

    .line 1292
    .local v6, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v6, :cond_0

    .line 1294
    const/16 v22, 0x4

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1296
    const/16 v22, 0x0

    .line 1429
    :goto_0
    return-object v22

    .line 1302
    :cond_0
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    if-eqz v22, :cond_1

    .line 1304
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    goto :goto_0

    .line 1308
    :cond_1
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v3

    .line 1311
    .local v3, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v3, :cond_2

    .line 1313
    const/16 v22, 0x6

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1315
    const/16 v22, 0x0

    goto :goto_0

    .line 1320
    :cond_2
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v21

    .line 1321
    .local v21, "supportedImageSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFrameRates()Ljava/util/List;

    move-result-object v19

    .line 1322
    .local v19, "supportedFrameRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;

    move-result-object v20

    .line 1323
    .local v20, "supportedImageFormats":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v17

    .line 1324
    .local v17, "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v18

    .line 1326
    .local v18, "supportedFocusModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v21, :cond_a

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v15

    .line 1327
    .local v15, "numSupportedImageSizes":I
    :goto_1
    if-eqz v19, :cond_b

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v13

    .line 1328
    .local v13, "numSupportedFrameRates":I
    :goto_2
    if-eqz v20, :cond_c

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v14

    .line 1331
    .local v14, "numSupportedImageFormats":I
    :goto_3
    mul-int/lit8 v22, v15, 0x2

    add-int/lit8 v22, v22, 0x6

    add-int v22, v22, v13

    add-int v4, v22, v14

    .line 1336
    .local v4, "capsArraySize":I
    new-array v0, v4, [I

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iput-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    .line 1341
    const/4 v5, 0x0

    .line 1342
    .local v5, "capsIndex":I
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/high16 v23, 0x20000000

    aput v23, v22, v5

    .line 1343
    const v23, 0x20000001

    if-eqz v17, :cond_e

    const-string v22, "torch"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_3

    const-string v22, "on"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_d

    :cond_3
    const/16 v22, 0x1

    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1344
    const v22, 0x20000002

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1345
    const v22, 0x20000004

    const/16 v23, 0x8

    invoke-static/range {v23 .. v23}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1346
    const v22, 0x20000100

    const/16 v23, 0x8

    invoke-static/range {v23 .. v23}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1347
    const v22, 0x20000200

    const/16 v23, 0x8

    invoke-static/range {v23 .. v23}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1348
    const v23, 0x20002000

    const/16 v22, 0x8

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v22

    if-eqz v22, :cond_f

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v22

    if-eqz v22, :cond_f

    const/16 v22, 0x1

    :goto_5
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1349
    const v23, 0x20004000

    const/16 v22, 0x8

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v22

    if-eqz v22, :cond_10

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v22

    if-eqz v22, :cond_10

    const/16 v22, 0x1

    :goto_6
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1352
    const/4 v5, 0x1

    .line 1353
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/high16 v23, 0x20000000

    aput v23, v22, v5

    .line 1354
    const v23, 0x20000001

    if-eqz v17, :cond_12

    const-string v22, "torch"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_4

    const-string v22, "on"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_11

    :cond_4
    const/16 v22, 0x1

    :goto_7
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1355
    const v22, 0x20000002

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1356
    const v22, 0x20000100

    const/16 v23, 0x8

    invoke-static/range {v23 .. v23}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1357
    const v23, 0x20002000

    const/16 v22, 0x8

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v22

    if-eqz v22, :cond_13

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v22

    if-eqz v22, :cond_13

    const/16 v22, 0x1

    :goto_8
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1360
    const/4 v5, 0x2

    .line 1361
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/high16 v23, 0x30000000

    aput v23, v22, v5

    .line 1362
    if-eqz v17, :cond_6

    const-string v22, "torch"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    const-string v22, "on"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 1364
    :cond_5
    const v22, 0x30000001

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1365
    const v22, 0x30000002

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1367
    :cond_6
    if-eqz v18, :cond_9

    .line 1369
    const v22, 0x30000010

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1370
    const v22, 0x30000020

    const-string v23, "auto"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1371
    const v23, 0x30000040

    const/16 v22, 0x9

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v22

    if-eqz v22, :cond_7

    const-string v22, "continuous-video"

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_8

    :cond_7
    const/16 v22, 0xe

    invoke-static/range {v22 .. v22}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v22

    if-eqz v22, :cond_14

    const-string v22, "continuous-picture"

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_14

    :cond_8
    const/16 v22, 0x1

    :goto_9
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1377
    const v22, 0x30000080

    const-string v23, "macro"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1378
    const v22, 0x30000100

    const-string v23, "infinity"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1379
    const v22, 0x30000200

    const-string v23, "fixed"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v6, v5, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCapsBit(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;IIZ)V

    .line 1383
    :cond_9
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/16 v23, 0x3

    aput v15, v22, v23

    .line 1384
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/16 v23, 0x4

    aput v13, v22, v23

    .line 1385
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/16 v23, 0x5

    aput v14, v22, v23

    .line 1388
    const/4 v9, 0x6

    .line 1391
    .local v9, "indexOffset":I
    if-lez v15, :cond_15

    .line 1393
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v12

    .line 1394
    .local v12, "iterSizes":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/hardware/Camera$Size;>;"
    :goto_a
    invoke-interface {v12}, Ljava/util/ListIterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_15

    .line 1396
    invoke-interface {v12}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/hardware/Camera$Size;

    .line 1397
    .local v16, "size":Landroid/hardware/Camera$Size;
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    move/from16 v23, v0

    aput v23, v22, v9

    .line 1398
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    add-int/lit8 v23, v9, 0x1

    move-object/from16 v0, v16

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    move/from16 v24, v0

    aput v24, v22, v23

    .line 1399
    add-int/lit8 v9, v9, 0x2

    .line 1400
    goto :goto_a

    .line 1326
    .end local v4    # "capsArraySize":I
    .end local v5    # "capsIndex":I
    .end local v9    # "indexOffset":I
    .end local v12    # "iterSizes":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Landroid/hardware/Camera$Size;>;"
    .end local v13    # "numSupportedFrameRates":I
    .end local v14    # "numSupportedImageFormats":I
    .end local v15    # "numSupportedImageSizes":I
    .end local v16    # "size":Landroid/hardware/Camera$Size;
    :cond_a
    const/4 v15, 0x0

    goto/16 :goto_1

    .line 1327
    .restart local v15    # "numSupportedImageSizes":I
    :cond_b
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 1328
    .restart local v13    # "numSupportedFrameRates":I
    :cond_c
    const/4 v14, 0x0

    goto/16 :goto_3

    .line 1343
    .restart local v4    # "capsArraySize":I
    .restart local v5    # "capsIndex":I
    .restart local v14    # "numSupportedImageFormats":I
    :cond_d
    const/16 v22, 0x0

    goto/16 :goto_4

    :cond_e
    const/16 v22, 0x0

    goto/16 :goto_4

    .line 1348
    :cond_f
    const/16 v22, 0x0

    goto/16 :goto_5

    .line 1349
    :cond_10
    const/16 v22, 0x0

    goto/16 :goto_6

    .line 1354
    :cond_11
    const/16 v22, 0x0

    goto/16 :goto_7

    :cond_12
    const/16 v22, 0x0

    goto/16 :goto_7

    .line 1357
    :cond_13
    const/16 v22, 0x0

    goto/16 :goto_8

    .line 1371
    :cond_14
    const/16 v22, 0x0

    goto/16 :goto_9

    .line 1404
    .restart local v9    # "indexOffset":I
    :cond_15
    if-lez v13, :cond_16

    .line 1406
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v11

    .line 1407
    .local v11, "iterFramerates":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/Integer;>;"
    :goto_b
    invoke-interface {v11}, Ljava/util/ListIterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_16

    .line 1409
    invoke-interface {v11}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 1410
    .local v8, "framerate":I
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    aput v8, v22, v9

    .line 1411
    add-int/lit8 v9, v9, 0x1

    .line 1412
    goto :goto_b

    .line 1416
    .end local v8    # "framerate":I
    .end local v11    # "iterFramerates":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/Integer;>;"
    :cond_16
    if-lez v14, :cond_17

    .line 1418
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v10

    .line 1419
    .local v10, "iterFormats":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/Integer;>;"
    :goto_c
    invoke-interface {v10}, Ljava/util/ListIterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_17

    .line 1421
    invoke-interface {v10}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1422
    .local v7, "format":I
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v7, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->translateImageFormat(IZ)I

    move-result v23

    aput v23, v22, v9

    .line 1423
    add-int/lit8 v9, v9, 0x1

    .line 1424
    goto :goto_c

    .line 1429
    .end local v7    # "format":I
    .end local v10    # "iterFormats":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/Integer;>;"
    :cond_17
    iget-object v0, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    move-object/from16 v22, v0

    goto/16 :goto_0
.end method

.method public getCaptureInfo(I)[I
    .locals 11
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    const/4 v10, 0x6

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1495
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v2

    .line 1498
    .local v2, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v2, :cond_0

    .line 1500
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v1, v4

    .line 1535
    :goto_0
    return-object v1

    .line 1506
    :cond_0
    iget-object v7, v2, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v7}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 1509
    .local v0, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_1

    .line 1511
    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v1, v4

    .line 1513
    goto :goto_0

    .line 1517
    :cond_1
    const/4 v1, 0x0

    .line 1520
    .local v1, "captureInfo":[I
    const/4 v7, 0x5

    :try_start_0
    new-array v1, v7, [I

    .line 1521
    const/4 v7, 0x0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v8

    iget v8, v8, Landroid/hardware/Camera$Size;->width:I

    aput v8, v1, v7

    .line 1522
    const/4 v7, 0x1

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v8

    iget v8, v8, Landroid/hardware/Camera$Size;->height:I

    aput v8, v1, v7

    .line 1523
    const/4 v7, 0x2

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v8

    sget-boolean v9, Lcom/qualcomm/ar/pl/CameraPreview;->CONVERT_FORMAT_TO_PL:Z

    invoke-direct {p0, v8, v9}, Lcom/qualcomm/ar/pl/CameraPreview;->translateImageFormat(IZ)I

    move-result v8

    aput v8, v1, v7

    .line 1524
    const/4 v7, 0x3

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewFrameRate()I

    move-result v8

    aput v8, v1, v7

    .line 1525
    const/4 v7, 0x4

    iget-object v8, v2, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    if-nez v8, :cond_2

    iget-object v8, v2, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surfaceTexture:Ljava/lang/Object;

    if-eqz v8, :cond_3

    :cond_2
    move v5, v6

    :cond_3
    aput v5, v1, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1527
    :catch_0
    move-exception v3

    .line 1529
    .local v3, "e":Ljava/lang/Exception;
    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v1, v4

    .line 1531
    goto :goto_0
.end method

.method public getDeviceID(I)I
    .locals 2
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    .line 1012
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    .line 1015
    .local v0, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v0, :cond_0

    .line 1017
    const/4 v1, 0x4

    invoke-static {v1}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1019
    const/4 v1, -0x1

    .line 1023
    :goto_0
    return v1

    :cond_0
    iget v1, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->deviceID:I

    goto :goto_0
.end method

.method public getDirection(I)I
    .locals 6
    .param p1, "cameraID"    # I

    .prologue
    const v3, 0x10002011

    const/4 v5, 0x6

    const/4 v2, -0x1

    .line 962
    invoke-direct {p0}, Lcom/qualcomm/ar/pl/CameraPreview;->checkPermission()Z

    move-result v4

    if-nez v4, :cond_0

    .line 964
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1002
    :goto_0
    return v2

    .line 969
    :cond_0
    const/16 v4, 0x9

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 971
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 974
    .local v0, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    :try_start_0
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 984
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    packed-switch v2, :pswitch_data_0

    .line 993
    const v2, 0x10002010

    goto :goto_0

    .line 976
    :catch_0
    move-exception v1

    .line 979
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :pswitch_0
    move v2, v3

    .line 987
    goto :goto_0

    .line 990
    :pswitch_1
    const v2, 0x10002012

    goto :goto_0

    .end local v0    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    :cond_1
    move v2, v3

    .line 1002
    goto :goto_0

    .line 984
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getNumberOfCameras()I
    .locals 6

    .prologue
    const/4 v5, 0x6

    const/4 v2, -0x1

    .line 913
    invoke-direct {p0}, Lcom/qualcomm/ar/pl/CameraPreview;->checkPermission()Z

    move-result v4

    if-nez v4, :cond_0

    .line 915
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 953
    :goto_0
    return v2

    .line 920
    :cond_0
    const/16 v4, 0x9

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 924
    :try_start_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 925
    .local v2, "num":I
    goto :goto_0

    .line 927
    .end local v2    # "num":I
    :catch_0
    move-exception v1

    .line 929
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 940
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v0, 0x0

    .line 943
    .local v0, "deviceHasCamera":Z
    :try_start_1
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 944
    .local v3, "pm":Landroid/content/pm/PackageManager;
    const-string v4, "android.hardware.camera"

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .line 953
    if-eqz v0, :cond_2

    const/4 v4, 0x1

    :goto_1
    move v2, v4

    goto :goto_0

    .line 946
    .end local v3    # "pm":Landroid/content/pm/PackageManager;
    :catch_1
    move-exception v1

    .line 948
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 953
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "pm":Landroid/content/pm/PackageManager;
    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method

.method getStatus(I)I
    .locals 2
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    .line 2236
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    .line 2239
    .local v0, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v0, :cond_0

    .line 2241
    const/4 v1, 0x4

    invoke-static {v1}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 2243
    const v1, 0x10002000

    .line 2246
    :goto_0
    return v1

    :cond_0
    iget v1, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I

    goto :goto_0
.end method

.method getTypedCameraParameter(II)Ljava/lang/Object;
    .locals 13
    .param p1, "cameraCacheInfoIndex"    # I
    .param p2, "type"    # I

    .prologue
    const/4 v12, 0x6

    const/4 v9, 0x0

    .line 1988
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v1

    .line 1991
    .local v1, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-eqz v1, :cond_0

    iget-object v10, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    if-nez v10, :cond_1

    .line 1993
    :cond_0
    const/4 v10, 0x4

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2226
    :goto_0
    return-object v7

    .line 1999
    :cond_1
    iget-object v10, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v10}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 2002
    .local v0, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_2

    .line 2004
    invoke-static {v12}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2006
    goto :goto_0

    .line 2011
    :cond_2
    sparse-switch p2, :sswitch_data_0

    move-object v7, v9

    .line 2219
    goto :goto_0

    .line 2014
    :sswitch_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v4

    .line 2015
    .local v4, "flashMode":Ljava/lang/String;
    const-string v10, "torch"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    const-string v10, "on"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 2017
    :cond_3
    const v10, 0x30000002

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_0

    .line 2019
    :cond_4
    const-string v10, "off"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 2021
    const v10, 0x30000001

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_0

    .line 2024
    :cond_5
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2026
    goto :goto_0

    .line 2029
    .end local v4    # "flashMode":Ljava/lang/String;
    :sswitch_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v6

    .line 2030
    .local v6, "focusMode":Ljava/lang/String;
    const-string v10, "auto"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 2032
    iget-boolean v10, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->isAutoFocusing:Z

    if-eqz v10, :cond_6

    const v10, 0x30000020

    :goto_1
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_0

    :cond_6
    const v10, 0x30000010

    goto :goto_1

    .line 2034
    :cond_7
    const/16 v10, 0x9

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_8

    const-string v10, "continuous-video"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9

    :cond_8
    const/16 v10, 0xe

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_a

    const-string v10, "continuous-picture"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 2040
    :cond_9
    const v10, 0x30000040

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2042
    :cond_a
    const-string v10, "infinity"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 2044
    const v10, 0x30000100

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2046
    :cond_b
    const-string v10, "macro"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 2048
    const v10, 0x30000080

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2050
    :cond_c
    const-string v10, "fixed"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 2052
    const v10, 0x30000200

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2055
    :cond_d
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2057
    goto/16 :goto_0

    .line 2060
    .end local v6    # "focusMode":Ljava/lang/String;
    :sswitch_2
    const/16 v10, 0x8

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 2063
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFocalLength()F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    goto/16 :goto_0

    .line 2067
    :cond_e
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2069
    goto/16 :goto_0

    .line 2073
    :sswitch_3
    const/16 v10, 0x9

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 2076
    const/4 v10, 0x3

    new-array v5, v10, [F

    .line 2077
    .local v5, "focusDistances":[F
    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->getFocusDistances([F)V

    .line 2080
    const/4 v10, 0x2

    new-array v7, v10, [F

    .line 2081
    .local v7, "focusValueRange":[F
    const/4 v10, 0x0

    const/4 v11, 0x0

    aget v11, v5, v11

    aput v11, v7, v10

    .line 2082
    const/4 v10, 0x1

    const/4 v11, 0x2

    aget v11, v5, v11

    aput v11, v7, v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 2222
    .end local v5    # "focusDistances":[F
    .end local v7    # "focusValueRange":[F
    :catch_0
    move-exception v2

    .line 2224
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {v12}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2226
    goto/16 :goto_0

    .line 2088
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_f
    const/4 v10, 0x6

    :try_start_1
    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2090
    goto/16 :goto_0

    .line 2094
    :sswitch_4
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2096
    goto/16 :goto_0

    .line 2099
    :sswitch_5
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2101
    goto/16 :goto_0

    .line 2104
    :sswitch_6
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2106
    goto/16 :goto_0

    .line 2109
    :sswitch_7
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2111
    goto/16 :goto_0

    .line 2114
    :sswitch_8
    const/16 v10, 0x8

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 2116
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2120
    :cond_10
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2122
    goto/16 :goto_0

    .line 2126
    :sswitch_9
    const/16 v10, 0x8

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_11

    .line 2129
    const/4 v10, 0x2

    new-array v3, v10, [I

    .line 2130
    .local v3, "exposureCompRange":[I
    const/4 v10, 0x0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v11

    aput v11, v3, v10

    .line 2131
    const/4 v10, 0x1

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v11

    aput v11, v3, v10

    move-object v7, v3

    .line 2133
    goto/16 :goto_0

    .line 2137
    .end local v3    # "exposureCompRange":[I
    :cond_11
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2139
    goto/16 :goto_0

    .line 2143
    :sswitch_a
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2145
    goto/16 :goto_0

    .line 2148
    :sswitch_b
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2150
    goto/16 :goto_0

    .line 2153
    :sswitch_c
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2155
    goto/16 :goto_0

    .line 2158
    :sswitch_d
    const/16 v10, 0x8

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_12

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 2162
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getZoom()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 2166
    :cond_12
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2168
    goto/16 :goto_0

    .line 2172
    :sswitch_e
    const/16 v10, 0x8

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v10

    if-eqz v10, :cond_13

    .line 2175
    const/4 v10, 0x2

    new-array v8, v10, [I

    .line 2178
    .local v8, "zoomRange":[I
    const/4 v10, 0x0

    const/4 v11, 0x0

    aput v11, v8, v10

    .line 2181
    const/4 v10, 0x1

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v11

    aput v11, v8, v10

    move-object v7, v8

    .line 2183
    goto/16 :goto_0

    .line 2187
    .end local v8    # "zoomRange":[I
    :cond_13
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2189
    goto/16 :goto_0

    .line 2193
    :sswitch_f
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2195
    goto/16 :goto_0

    .line 2198
    :sswitch_10
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2200
    goto/16 :goto_0

    .line 2203
    :sswitch_11
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2205
    goto/16 :goto_0

    .line 2208
    :sswitch_12
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    move-object v7, v9

    .line 2210
    goto/16 :goto_0

    .line 2213
    :sswitch_13
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v7, v9

    .line 2215
    goto/16 :goto_0

    .line 2011
    :sswitch_data_0
    .sparse-switch
        0x20000001 -> :sswitch_0
        0x20000002 -> :sswitch_1
        0x20000004 -> :sswitch_2
        0x20000008 -> :sswitch_3
        0x20000010 -> :sswitch_4
        0x20000020 -> :sswitch_5
        0x20000040 -> :sswitch_6
        0x20000080 -> :sswitch_7
        0x20000100 -> :sswitch_8
        0x20000200 -> :sswitch_9
        0x20000400 -> :sswitch_a
        0x20000800 -> :sswitch_b
        0x20001000 -> :sswitch_c
        0x20002000 -> :sswitch_d
        0x20004000 -> :sswitch_e
        0x20008000 -> :sswitch_f
        0x20010000 -> :sswitch_10
        0x20020000 -> :sswitch_11
        0x20040000 -> :sswitch_12
        0x20080000 -> :sswitch_13
    .end sparse-switch
.end method

.method public init()Z
    .locals 12

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 815
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    iput-object v8, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    .line 818
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    iput-object v8, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    .line 822
    const-string v0, "android.hardware.Camera"

    .line 823
    .local v0, "CLASSNAME_CAMERA":Ljava/lang/String;
    const-string v1, "android.graphics.SurfaceTexture"

    .line 827
    .local v1, "CLASSNAME_SURFACETEXTURE":Ljava/lang/String;
    :try_start_0
    const-string v8, "android.hardware.Camera"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 830
    .local v2, "cameraClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x1

    new-array v4, v8, [Ljava/lang/Class;

    .line 831
    .local v4, "partypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    const/4 v9, 0x1

    new-array v9, v9, [B

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v4, v8

    .line 834
    const-string v8, "addCallbackBuffer"

    invoke-static {v2, v8, v4}, Lcom/qualcomm/ar/pl/SystemTools;->retrieveClassMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferFunc:Ljava/lang/reflect/Method;

    .line 835
    sget-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferFunc:Ljava/lang/reflect/Method;

    if-nez v8, :cond_1

    .line 896
    .end local v2    # "cameraClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "partypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_0
    :goto_0
    return v6

    .line 844
    .restart local v2    # "cameraClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "partypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBufferArgs:[Ljava/lang/Object;

    .line 848
    const-string v8, "setPreviewCallbackWithBuffer"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Landroid/hardware/Camera$PreviewCallback;

    aput-object v11, v9, v10

    invoke-static {v2, v8, v9}, Lcom/qualcomm/ar/pl/SystemTools;->retrieveClassMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewCallbackWithBufferFunc:Ljava/lang/reflect/Method;

    .line 849
    sget-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewCallbackWithBufferFunc:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_0

    .line 856
    const/16 v8, 0xb

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 858
    const-string v8, "android.graphics.SurfaceTexture"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 861
    .local v5, "surfaceTextureClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "setPreviewTexture"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    invoke-static {v2, v8, v9}, Lcom/qualcomm/ar/pl/SystemTools;->retrieveClassMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewTextureFunc:Ljava/lang/reflect/Method;

    .line 862
    sget-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_setPreviewTextureFunc:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_0

    .line 869
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    invoke-virtual {v5, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_surfaceTextureConstructor:Ljava/lang/reflect/Constructor;

    .line 870
    sget-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_surfaceTextureConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v8, :cond_0

    .line 877
    const-string v8, "updateTexImage"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-static {v5, v8, v9}, Lcom/qualcomm/ar/pl/SystemTools;->retrieveClassMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    sput-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_updateTexImage:Ljava/lang/reflect/Method;

    .line 878
    sget-object v8, Lcom/qualcomm/ar/pl/CameraPreview;->_updateTexImage:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v8, :cond_0

    .end local v5    # "surfaceTextureClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    move v6, v7

    .line 896
    goto :goto_0

    .line 890
    .end local v2    # "cameraClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "partypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :catch_0
    move-exception v3

    .line 893
    .local v3, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 8
    .param p1, "capturedBuffer"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 738
    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 739
    .local v7, "intObj":Ljava/lang/Object;
    if-nez v7, :cond_1

    .line 764
    .end local v7    # "intObj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 745
    .restart local v7    # "intObj":Ljava/lang/Object;
    :cond_1
    check-cast v7, Ljava/lang/Integer;

    .end local v7    # "intObj":Ljava/lang/Object;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 748
    .local v1, "cameraCacheInfoIndex":I
    invoke-direct {p0, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v6

    .line 751
    .local v6, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-eqz v6, :cond_0

    .line 760
    iget v2, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferWidth:I

    iget v3, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferHeight:I

    iget v4, v6, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferFormatPL:I

    move-object v0, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/qualcomm/ar/pl/CameraPreview;->newFrameAvailable(IIII[B)V

    .line 763
    invoke-direct {p0, p2, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->_addCallbackBuffer(Landroid/hardware/Camera;[B)V

    goto :goto_0
.end method

.method public open(IIILjava/lang/String;[I[I)I
    .locals 19
    .param p1, "camIndex"    # I
    .param p2, "type"    # I
    .param p3, "direction"    # I
    .param p4, "customData"    # Ljava/lang/String;
    .param p5, "captureInfo"    # [I
    .param p6, "overrideCaptureInfo"    # [I

    .prologue
    .line 1032
    invoke-direct/range {p0 .. p0}, Lcom/qualcomm/ar/pl/CameraPreview;->checkPermission()Z

    move-result v16

    if-nez v16, :cond_0

    .line 1034
    const/16 v16, 0x6

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1036
    const/4 v3, -0x1

    .line 1235
    :goto_0
    return v3

    .line 1042
    :cond_0
    invoke-direct/range {p0 .. p3}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraDeviceIndex(III)I

    move-result v5

    .line 1043
    .local v5, "cameraDeviceIndex":I
    if-gez v5, :cond_1

    .line 1046
    const/4 v3, -0x1

    goto :goto_0

    .line 1050
    :cond_1
    const/4 v3, -0x1

    .line 1051
    .local v3, "cameraCacheInfoIndex":I
    const/4 v9, 0x0

    .line 1053
    .local v9, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/Vector;->size()I

    move-result v4

    .line 1054
    .local v4, "cameraCacheInfoSize":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    if-ge v11, v4, :cond_2

    .line 1056
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    check-cast v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .line 1057
    .restart local v9    # "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    iget v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->deviceID:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ne v0, v5, :cond_6

    .line 1059
    move v3, v11

    .line 1065
    :cond_2
    if-gez v3, :cond_3

    .line 1067
    new-instance v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .end local v9    # "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;-><init>(Lcom/qualcomm/ar/pl/CameraPreview;)V

    .line 1068
    .restart local v9    # "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    iput v5, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->deviceID:I

    .line 1069
    const/16 v16, 0x0

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    .line 1070
    const/16 v16, 0x0

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    .line 1071
    const/16 v16, 0x0

    check-cast v16, [[B

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->buffer:[[B

    .line 1072
    const/16 v16, 0x0

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideWidth:I

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestWidth:I

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferWidth:I

    .line 1073
    const/16 v16, 0x0

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideHeight:I

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestHeight:I

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferHeight:I

    .line 1074
    const v16, 0x10001100

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->bufferFormatPL:I

    .line 1075
    const/16 v16, 0x0

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->overrideFormatAndroid:I

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->requestFormatAndroid:I

    .line 1076
    const/16 v16, 0x0

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->caps:[I

    .line 1077
    const v16, 0x10002001

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I

    .line 1078
    const/16 v16, 0x0

    move/from16 v0, v16

    iput-boolean v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->isAutoFocusing:Z

    .line 1083
    :cond_3
    const/4 v13, 0x0

    .line 1084
    .local v13, "resultCameraOpened":Z
    const/16 v6, 0xa

    .local v6, "cameraOpenRetryCount":I
    move v7, v6

    .line 1093
    .end local v6    # "cameraOpenRetryCount":I
    .local v7, "cameraOpenRetryCount":I
    :goto_2
    const/16 v16, 0x9

    :try_start_0
    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 1095
    iget v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->deviceID:I

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    .line 1111
    :cond_4
    :goto_3
    iget-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v16, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v16, :cond_8

    const/4 v13, 0x1

    .line 1119
    :goto_4
    if-nez v13, :cond_5

    .line 1125
    if-lez v7, :cond_5

    .line 1127
    :try_start_1
    monitor-enter p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1129
    const-wide/16 v16, 0xfa

    :try_start_2
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V

    .line 1130
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1139
    :cond_5
    :goto_5
    if-nez v13, :cond_16

    add-int/lit8 v6, v7, -0x1

    .end local v7    # "cameraOpenRetryCount":I
    .restart local v6    # "cameraOpenRetryCount":I
    if-gtz v7, :cond_15

    .line 1142
    :goto_6
    iget-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v16, v0

    if-nez v16, :cond_9

    .line 1145
    const/16 v16, 0x6

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1147
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 1054
    .end local v6    # "cameraOpenRetryCount":I
    .end local v13    # "resultCameraOpened":Z
    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_1

    .line 1099
    .restart local v7    # "cameraOpenRetryCount":I
    .restart local v13    # "resultCameraOpened":Z
    :cond_7
    :try_start_3
    iget v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->deviceID:I

    move/from16 v16, v0

    if-nez v16, :cond_4

    .line 1102
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_3

    .line 1113
    :catch_0
    move-exception v16

    goto :goto_4

    .line 1111
    :cond_8
    const/4 v13, 0x0

    goto :goto_4

    .line 1130
    :catchall_0
    move-exception v16

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v16
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 1133
    :catch_1
    move-exception v16

    goto :goto_5

    .line 1151
    .end local v7    # "cameraOpenRetryCount":I
    .restart local v6    # "cameraOpenRetryCount":I
    :cond_9
    if-eqz p5, :cond_a

    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v16, v0

    if-gtz v16, :cond_b

    :cond_a
    if-eqz p6, :cond_d

    move-object/from16 v0, p6

    array-length v0, v0

    move/from16 v16, v0

    if-lez v16, :cond_d

    :cond_b
    const/4 v14, 0x1

    .line 1152
    .local v14, "setCaptureInfo":Z
    :goto_7
    if-eqz p4, :cond_e

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v16

    if-lez v16, :cond_e

    const/4 v15, 0x1

    .line 1155
    .local v15, "setCustomData":Z
    :goto_8
    if-nez v14, :cond_c

    if-eqz v15, :cond_13

    .line 1158
    :cond_c
    iget-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v8

    .line 1161
    .local v8, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v8, :cond_f

    .line 1163
    const/16 v16, 0x6

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1165
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 1151
    .end local v8    # "cameraParams":Landroid/hardware/Camera$Parameters;
    .end local v14    # "setCaptureInfo":Z
    .end local v15    # "setCustomData":Z
    :cond_d
    const/4 v14, 0x0

    goto :goto_7

    .line 1152
    .restart local v14    # "setCaptureInfo":Z
    :cond_e
    const/4 v15, 0x0

    goto :goto_8

    .line 1169
    .restart local v8    # "cameraParams":Landroid/hardware/Camera$Parameters;
    .restart local v15    # "setCustomData":Z
    :cond_f
    if-eqz v14, :cond_11

    .line 1171
    if-eqz p5, :cond_10

    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x5

    move/from16 v0, v16

    move/from16 v1, v17

    if-eq v0, v1, :cond_10

    .line 1173
    const/16 v16, 0x2

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1175
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 1179
    :cond_10
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-direct {v0, v9, v8, v1, v2}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCaptureParams(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;Landroid/hardware/Camera$Parameters;[I[I)Z

    move-result v12

    .line 1180
    .local v12, "result":Z
    if-nez v12, :cond_11

    .line 1182
    const/16 v16, 0x6

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1184
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 1189
    .end local v12    # "result":Z
    :cond_11
    if-eqz v15, :cond_12

    .line 1192
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v8, v1}, Lcom/qualcomm/ar/pl/CameraPreview;->setCustomCameraParams(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)Z

    move-result v12

    .line 1193
    .restart local v12    # "result":Z
    if-nez v12, :cond_12

    .line 1195
    const/16 v16, 0x2

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1197
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 1204
    .end local v12    # "result":Z
    :cond_12
    :try_start_6
    iget-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 1215
    .end local v8    # "cameraParams":Landroid/hardware/Camera$Parameters;
    :cond_13
    const v16, 0x10002002

    move/from16 v0, v16

    iput v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I

    .line 1217
    if-gez v3, :cond_14

    .line 1223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 1226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfo:Ljava/util/Vector;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/Vector;->size()I

    move-result v16

    add-int/lit8 v3, v16, -0x1

    .line 1232
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/qualcomm/ar/pl/CameraPreview;->cameraCacheInfoIndexCache:Ljava/util/HashMap;

    move-object/from16 v16, v0

    iget-object v0, v9, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    move-object/from16 v17, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v16 .. v18}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1206
    .restart local v8    # "cameraParams":Landroid/hardware/Camera$Parameters;
    :catch_2
    move-exception v10

    .line 1208
    .local v10, "e":Ljava/lang/Exception;
    const/16 v16, 0x6

    invoke-static/range {v16 .. v16}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1210
    const/4 v3, -0x1

    goto/16 :goto_0

    .end local v8    # "cameraParams":Landroid/hardware/Camera$Parameters;
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v14    # "setCaptureInfo":Z
    .end local v15    # "setCustomData":Z
    :cond_15
    move v7, v6

    .end local v6    # "cameraOpenRetryCount":I
    .restart local v7    # "cameraOpenRetryCount":I
    goto/16 :goto_2

    :cond_16
    move v6, v7

    .end local v7    # "cameraOpenRetryCount":I
    .restart local v6    # "cameraOpenRetryCount":I
    goto/16 :goto_6
.end method

.method public setCaptureInfo(I[I[I)Z
    .locals 8
    .param p1, "cameraCacheInfoIndex"    # I
    .param p2, "captureInfo"    # [I
    .param p3, "overrideCaptureInfo"    # [I

    .prologue
    const/4 v7, 0x6

    const/4 v4, 0x0

    .line 1436
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v1

    .line 1439
    .local v1, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v1, :cond_0

    .line 1441
    const/4 v5, 0x4

    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1486
    :goto_0
    return v4

    .line 1446
    :cond_0
    array-length v5, p2

    const/4 v6, 0x5

    if-eq v5, v6, :cond_1

    .line 1448
    const/4 v5, 0x2

    invoke-static {v5}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 1454
    :cond_1
    iget-object v5, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v5}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 1457
    .local v0, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_2

    .line 1459
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 1465
    :cond_2
    invoke-direct {p0, v1, v0, p2, p3}, Lcom/qualcomm/ar/pl/CameraPreview;->setCameraCaptureParams(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;Landroid/hardware/Camera$Parameters;[I[I)Z

    move-result v3

    .line 1466
    .local v3, "result":Z
    if-nez v3, :cond_3

    .line 1468
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 1476
    :cond_3
    :try_start_0
    iget-object v5, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v5, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1486
    const/4 v4, 0x1

    goto :goto_0

    .line 1478
    :catch_0
    move-exception v2

    .line 1480
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {v7}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0
.end method

.method public setSurfaceManager(Lcom/qualcomm/ar/pl/SurfaceManager;)V
    .locals 0
    .param p1, "sm"    # Lcom/qualcomm/ar/pl/SurfaceManager;

    .prologue
    .line 904
    iput-object p1, p0, Lcom/qualcomm/ar/pl/CameraPreview;->surfaceManager:Lcom/qualcomm/ar/pl/SurfaceManager;

    .line 905
    return-void
.end method

.method setTypedCameraParameter(IILjava/lang/Object;)Z
    .locals 10
    .param p1, "cameraCacheInfoIndex"    # I
    .param p2, "type"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1625
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v1

    .line 1628
    .local v1, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-eqz v1, :cond_0

    iget-object v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    if-nez v8, :cond_1

    .line 1630
    :cond_0
    const/4 v8, 0x4

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1632
    const/4 v8, 0x0

    .line 1979
    .end local p3    # "value":Ljava/lang/Object;
    :goto_0
    return v8

    .line 1636
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_1
    iget-object v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-direct {p0, v8}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraParameters(Landroid/hardware/Camera;)Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 1639
    .local v0, "cameraParams":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_2

    .line 1641
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1643
    const/4 v8, 0x0

    goto :goto_0

    .line 1647
    :cond_2
    const/4 v2, 0x0

    .line 1651
    .local v2, "doPostSetAction":Z
    sparse-switch p2, :sswitch_data_0

    .line 1898
    const/4 v8, 0x0

    goto :goto_0

    .line 1655
    :sswitch_0
    :try_start_0
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 1657
    .local v6, "torchMode":I
    packed-switch v6, :pswitch_data_0

    .line 1683
    :pswitch_0
    const/4 v8, 0x3

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1685
    const/4 v8, 0x0

    goto :goto_0

    .line 1661
    :pswitch_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v8

    const-string v9, "torch"

    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1663
    const-string v8, "torch"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1911
    .end local v6    # "torchMode":I
    :goto_1
    :try_start_1
    iget-object v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v8, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1921
    if-eqz v2, :cond_3

    .line 1925
    packed-switch p2, :pswitch_data_1

    .line 1979
    :cond_3
    :goto_2
    const/4 v8, 0x1

    goto :goto_0

    .line 1668
    .restart local v6    # "torchMode":I
    :cond_4
    :try_start_2
    const-string v8, "on"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 1901
    .end local v6    # "torchMode":I
    :catch_0
    move-exception v3

    .line 1903
    .local v3, "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1905
    const/4 v8, 0x0

    goto :goto_0

    .line 1674
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v6    # "torchMode":I
    :pswitch_2
    :try_start_3
    const-string v8, "off"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_1

    .line 1678
    :pswitch_3
    const/4 v8, 0x3

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1680
    const/4 v8, 0x0

    goto :goto_0

    .line 1694
    .end local v6    # "torchMode":I
    .restart local p3    # "value":Ljava/lang/Object;
    :sswitch_1
    iget-object v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v8}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 1696
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 1697
    .local v5, "focusMode":I
    sparse-switch v5, :sswitch_data_1

    .line 1770
    const/4 v8, 0x3

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1772
    const/4 v8, 0x0

    goto :goto_0

    .line 1700
    :sswitch_2
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v8

    const-string v9, "normal"

    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1702
    const-string v8, "normal"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_1

    .line 1710
    :cond_5
    const-string v8, "auto"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 1714
    const/4 v2, 0x1

    .line 1716
    goto :goto_1

    .line 1719
    :sswitch_3
    const-string v8, "auto"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 1723
    const/4 v2, 0x1

    .line 1724
    goto :goto_1

    .line 1727
    :sswitch_4
    const/16 v8, 0xe

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v8

    const-string v9, "continuous-picture"

    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1729
    const-string v8, "continuous-picture"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_1

    .line 1732
    :cond_6
    const/16 v8, 0x9

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1734
    const-string v8, "continuous-video"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_1

    .line 1739
    :cond_7
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1741
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1747
    :sswitch_5
    const-string v8, "macro"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1757
    :sswitch_6
    const-string v8, "infinity"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1766
    :sswitch_7
    const-string v8, "fixed"

    invoke-virtual {v0, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1777
    .end local v5    # "focusMode":I
    .restart local p3    # "value":Ljava/lang/Object;
    :sswitch_8
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1779
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1783
    :sswitch_9
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1785
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1788
    :sswitch_a
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1790
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1793
    :sswitch_b
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1795
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1798
    :sswitch_c
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1800
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1804
    :sswitch_d
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1806
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1809
    :sswitch_e
    const/16 v8, 0x8

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1812
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 1815
    .local v4, "expCompValue":I
    invoke-virtual {v0, v4}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    goto/16 :goto_1

    .line 1819
    .end local v4    # "expCompValue":I
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_8
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1821
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1827
    :sswitch_f
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1829
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1832
    :sswitch_10
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1834
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1837
    :sswitch_11
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1839
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1842
    :sswitch_12
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1844
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1847
    :sswitch_13
    const/16 v8, 0x8

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 1851
    check-cast p3, Ljava/lang/Number;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v7

    .line 1854
    .local v7, "zoomValue":I
    invoke-virtual {v0, v7}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    goto/16 :goto_1

    .line 1858
    .end local v7    # "zoomValue":I
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_9
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1860
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1865
    :sswitch_14
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1867
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1870
    :sswitch_15
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1872
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1875
    :sswitch_16
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1877
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1880
    :sswitch_17
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1882
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1885
    :sswitch_18
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1886
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1892
    :sswitch_19
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1894
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1913
    .end local p3    # "value":Ljava/lang/Object;
    :catch_1
    move-exception v3

    .line 1915
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1917
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1929
    .end local v3    # "e":Ljava/lang/Exception;
    :pswitch_4
    const/4 v8, 0x1

    :try_start_4
    iput-boolean v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->isAutoFocusing:Z

    .line 1932
    iget-object v8, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    new-instance v9, Lcom/qualcomm/ar/pl/CameraPreview$1;

    invoke-direct {v9, p0}, Lcom/qualcomm/ar/pl/CameraPreview$1;-><init>(Lcom/qualcomm/ar/pl/CameraPreview;)V

    invoke-virtual {v8, v9}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_2

    .line 1970
    :catch_2
    move-exception v3

    .line 1972
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v8, 0x6

    invoke-static {v8}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1974
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1651
    :sswitch_data_0
    .sparse-switch
        0x20000001 -> :sswitch_0
        0x20000002 -> :sswitch_1
        0x20000004 -> :sswitch_8
        0x20000008 -> :sswitch_9
        0x20000010 -> :sswitch_a
        0x20000020 -> :sswitch_b
        0x20000040 -> :sswitch_c
        0x20000080 -> :sswitch_d
        0x20000100 -> :sswitch_e
        0x20000200 -> :sswitch_f
        0x20000400 -> :sswitch_10
        0x20000800 -> :sswitch_11
        0x20001000 -> :sswitch_12
        0x20002000 -> :sswitch_13
        0x20004000 -> :sswitch_14
        0x20008000 -> :sswitch_15
        0x20010000 -> :sswitch_16
        0x20020000 -> :sswitch_17
        0x20040000 -> :sswitch_18
        0x20080000 -> :sswitch_19
    .end sparse-switch

    .line 1657
    :pswitch_data_0
    .packed-switch 0x30000001
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch

    .line 1925
    :pswitch_data_1
    .packed-switch 0x20000002
        :pswitch_4
    .end packed-switch

    .line 1697
    :sswitch_data_1
    .sparse-switch
        0x30000010 -> :sswitch_2
        0x30000020 -> :sswitch_3
        0x30000040 -> :sswitch_4
        0x30000080 -> :sswitch_5
        0x30000100 -> :sswitch_6
        0x30000200 -> :sswitch_7
    .end sparse-switch
.end method

.method public start(I)Z
    .locals 5
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    const/4 v4, 0x6

    const/4 v2, 0x0

    .line 1544
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    .line 1547
    .local v0, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v0, :cond_0

    .line 1549
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1580
    :goto_0
    return v2

    .line 1555
    :cond_0
    invoke-direct {p0, v0}, Lcom/qualcomm/ar/pl/CameraPreview;->setupPreviewBuffer(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1557
    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0

    .line 1565
    :cond_1
    :try_start_0
    iget-object v3, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V

    .line 1569
    const v3, 0x10002003

    iput v3, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1572
    const/4 v2, 0x1

    goto :goto_0

    .line 1574
    :catch_0
    move-exception v1

    .line 1576
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0
.end method

.method public stop(I)Z
    .locals 4
    .param p1, "cameraCacheInfoIndex"    # I

    .prologue
    const/4 v2, 0x0

    .line 1589
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/CameraPreview;->getCameraCacheInfo(I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v0

    .line 1592
    .local v0, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-nez v0, :cond_0

    .line 1594
    const/4 v3, 0x4

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    .line 1616
    :goto_0
    return v2

    .line 1602
    :cond_0
    :try_start_0
    iget-object v3, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->stopPreview()V

    .line 1606
    const v3, 0x10002002

    iput v3, v0, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->status:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1608
    const/4 v2, 0x1

    goto :goto_0

    .line 1610
    :catch_0
    move-exception v1

    .line 1612
    .local v1, "e":Ljava/lang/Exception;
    const/4 v3, 0x6

    invoke-static {v3}, Lcom/qualcomm/ar/pl/SystemTools;->setSystemErrorCode(I)V

    goto :goto_0
.end method
