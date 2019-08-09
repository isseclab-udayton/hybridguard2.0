.class Lcom/qualcomm/ar/pl/SurfaceManager$1;
.super Ljava/lang/Object;
.source "SurfaceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/qualcomm/ar/pl/SurfaceManager;->addCameraSurface(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qualcomm/ar/pl/SurfaceManager;


# direct methods
.method constructor <init>(Lcom/qualcomm/ar/pl/SurfaceManager;)V
    .locals 0

    .prologue
    .line 266
    iput-object p1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 270
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->addSurfaceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 273
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    invoke-virtual {v1}, Lcom/qualcomm/ar/pl/SurfaceManager;->retrieveGLSurfaceView()Z

    .line 279
    :try_start_0
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v2, v2, Lcom/qualcomm/ar/pl/SurfaceManager;->cciForSurface:Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    invoke-static {v1, v2}, Lcom/qualcomm/ar/pl/SurfaceManager;->access$000(Lcom/qualcomm/ar/pl/SurfaceManager;Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)V

    .line 286
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v0, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->cameraSurfaceParentView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    .line 288
    .local v0, "vg":Landroid/view/ViewGroup;
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->cciForSurface:Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget v2, v2, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceViewChildPosition:I

    add-int/lit8 v2, v2, 0x1

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 290
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->cciForSurface:Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/qualcomm/ar/pl/CameraSurface;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->addSurfaceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 301
    .end local v0    # "vg":Landroid/view/ViewGroup;
    :goto_0
    return-void

    .line 292
    :catch_0
    move-exception v1

    .line 299
    iget-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v1, v1, Lcom/qualcomm/ar/pl/SurfaceManager;->addSurfaceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager$1;->this$0:Lcom/qualcomm/ar/pl/SurfaceManager;

    iget-object v2, v2, Lcom/qualcomm/ar/pl/SurfaceManager;->addSurfaceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
