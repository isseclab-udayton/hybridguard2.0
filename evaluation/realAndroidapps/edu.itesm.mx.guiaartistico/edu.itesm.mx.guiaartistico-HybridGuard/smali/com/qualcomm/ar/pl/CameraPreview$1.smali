.class Lcom/qualcomm/ar/pl/CameraPreview$1;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/qualcomm/ar/pl/CameraPreview;->setTypedCameraParameter(IILjava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qualcomm/ar/pl/CameraPreview;


# direct methods
.method constructor <init>(Lcom/qualcomm/ar/pl/CameraPreview;)V
    .locals 0

    .prologue
    .line 1933
    iput-object p1, p0, Lcom/qualcomm/ar/pl/CameraPreview$1;->this$0:Lcom/qualcomm/ar/pl/CameraPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 1937
    iget-object v3, p0, Lcom/qualcomm/ar/pl/CameraPreview$1;->this$0:Lcom/qualcomm/ar/pl/CameraPreview;

    invoke-static {v3}, Lcom/qualcomm/ar/pl/CameraPreview;->access$000(Lcom/qualcomm/ar/pl/CameraPreview;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1938
    .local v2, "intObj":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 1961
    .end local v2    # "intObj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 1944
    .restart local v2    # "intObj":Ljava/lang/Object;
    :cond_1
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "intObj":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1948
    .local v0, "cameraCacheInfoIndex":I
    iget-object v3, p0, Lcom/qualcomm/ar/pl/CameraPreview$1;->this$0:Lcom/qualcomm/ar/pl/CameraPreview;

    invoke-static {v3, v0}, Lcom/qualcomm/ar/pl/CameraPreview;->access$100(Lcom/qualcomm/ar/pl/CameraPreview;I)Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    move-result-object v1

    .line 1951
    .local v1, "cci":Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;
    if-eqz v1, :cond_0

    .line 1958
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->isAutoFocusing:Z

    goto :goto_0
.end method
