.class public Lcom/qualcomm/ar/pl/SurfaceManager;
.super Ljava/lang/Object;
.source "SurfaceManager.java"


# static fields
.field private static final MODULENAME:Ljava/lang/String; = "SurfaceManager"


# instance fields
.field addSurfaceLock:Ljava/util/concurrent/locks/Lock;

.field cameraSurfaceParentView:Landroid/view/View;

.field cciForSurface:Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

.field glSurfaceView:Landroid/opengl/GLSurfaceView;

.field glSurfaceViewChildPosition:I

.field renderWhenDirtyEnabled:Z

.field viewLock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-boolean v0, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->renderWhenDirtyEnabled:Z

    .line 50
    iput-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 51
    iput v0, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceViewChildPosition:I

    .line 52
    iput-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->cameraSurfaceParentView:Landroid/view/View;

    .line 54
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->viewLock:Ljava/util/concurrent/locks/Lock;

    .line 55
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->addSurfaceLock:Ljava/util/concurrent/locks/Lock;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/qualcomm/ar/pl/SurfaceManager;Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/ar/pl/SurfaceManager;
    .param p1, "x1"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/qualcomm/ar/pl/SurfaceManager;->setupCameraSurface(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)V

    return-void
.end method

.method private applyRenderWhenDirty()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 109
    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v2, :cond_1

    .line 112
    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    iget-boolean v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->renderWhenDirtyEnabled:Z

    if-eqz v3, :cond_0

    :goto_0
    invoke-virtual {v2, v0}, Landroid/opengl/GLSurfaceView;->setRenderMode(I)V

    .line 116
    :goto_1
    return v1

    :cond_0
    move v0, v1

    .line 112
    goto :goto_0

    :cond_1
    move v1, v0

    .line 116
    goto :goto_1
.end method

.method private searchForGLSurfaceView(Landroid/view/View;)Landroid/opengl/GLSurfaceView;
    .locals 8
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 68
    const/4 v5, 0x0

    .line 69
    .local v5, "result":Landroid/opengl/GLSurfaceView;
    const/4 v7, 0x0

    iput v7, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceViewChildPosition:I

    .line 73
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    move-object v6, v0

    .line 75
    .local v6, "rootViewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 76
    .local v4, "numChildren":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 78
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 80
    .local v1, "childView":Landroid/view/View;
    instance-of v7, v1, Landroid/opengl/GLSurfaceView;

    if-eqz v7, :cond_1

    .line 82
    move-object v0, v1

    check-cast v0, Landroid/opengl/GLSurfaceView;

    move-object v5, v0

    .line 83
    iput v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceViewChildPosition:I

    .end local v1    # "childView":Landroid/view/View;
    :cond_0
    move-object v7, v5

    .line 101
    .end local v3    # "i":I
    .end local v4    # "numChildren":I
    .end local v6    # "rootViewGroup":Landroid/view/ViewGroup;
    :goto_1
    return-object v7

    .line 86
    .restart local v1    # "childView":Landroid/view/View;
    .restart local v3    # "i":I
    .restart local v4    # "numChildren":I
    .restart local v6    # "rootViewGroup":Landroid/view/ViewGroup;
    :cond_1
    instance-of v7, v1, Landroid/view/ViewGroup;

    if-eqz v7, :cond_2

    .line 88
    invoke-direct {p0, v1}, Lcom/qualcomm/ar/pl/SurfaceManager;->searchForGLSurfaceView(Landroid/view/View;)Landroid/opengl/GLSurfaceView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 89
    if-nez v5, :cond_0

    .line 76
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "childView":Landroid/view/View;
    .end local v3    # "i":I
    .end local v4    # "numChildren":I
    .end local v6    # "rootViewGroup":Landroid/view/ViewGroup;
    :catch_0
    move-exception v2

    .line 98
    .local v2, "e":Ljava/lang/Exception;
    const/4 v7, 0x0

    goto :goto_1
.end method

.method private setupCameraSurface(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)V
    .locals 4
    .param p1, "cci"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .prologue
    .line 124
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    if-nez v2, :cond_1

    .line 127
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 128
    .local v0, "a":Landroid/app/Activity;
    new-instance v2, Lcom/qualcomm/ar/pl/CameraSurface;

    invoke-direct {v2, v0}, Lcom/qualcomm/ar/pl/CameraSurface;-><init>(Landroid/content/Context;)V

    iput-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    .line 147
    .end local v0    # "a":Landroid/app/Activity;
    :cond_0
    :goto_0
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    iget-object v3, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2, v3}, Lcom/qualcomm/ar/pl/CameraSurface;->setCamera(Landroid/hardware/Camera;)V

    .line 149
    return-void

    .line 135
    :cond_1
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    invoke-virtual {v2}, Lcom/qualcomm/ar/pl/CameraSurface;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_0

    const-class v2, Landroid/view/ViewGroup;

    iget-object v3, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    invoke-virtual {v3}, Lcom/qualcomm/ar/pl/CameraSurface;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    invoke-virtual {v2}, Lcom/qualcomm/ar/pl/CameraSurface;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 139
    .local v1, "vg":Landroid/view/ViewGroup;
    iget-object v2, p1, Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;->surface:Lcom/qualcomm/ar/pl/CameraSurface;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0
.end method


# virtual methods
.method public addCameraSurface(Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;)Z
    .locals 5
    .param p1, "cci"    # Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .prologue
    const/4 v3, 0x0

    .line 240
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 243
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 317
    :cond_0
    :goto_0
    return v3

    .line 250
    :cond_1
    iput-object p1, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->cciForSurface:Lcom/qualcomm/ar/pl/CameraPreview$CameraCacheInfo;

    .line 253
    const/4 v1, 0x0

    .line 257
    .local v1, "didExceptionHappen":Z
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->viewLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 264
    :try_start_0
    new-instance v4, Lcom/qualcomm/ar/pl/SurfaceManager$1;

    invoke-direct {v4, p0}, Lcom/qualcomm/ar/pl/SurfaceManager$1;-><init>(Lcom/qualcomm/ar/pl/SurfaceManager;)V

    invoke-virtual {v0, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 313
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->viewLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 317
    :goto_1
    if-nez v1, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    .line 305
    :catch_0
    move-exception v2

    .line 308
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v1, 0x1

    .line 313
    iget-object v4, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->viewLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1

    .end local v2    # "exception":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->viewLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3
.end method

.method public requestRender()V
    .locals 3

    .prologue
    .line 215
    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-nez v2, :cond_0

    .line 218
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 219
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 224
    .local v1, "decorView":Landroid/view/View;
    invoke-direct {p0, v1}, Lcom/qualcomm/ar/pl/SurfaceManager;->searchForGLSurfaceView(Landroid/view/View;)Landroid/opengl/GLSurfaceView;

    move-result-object v2

    iput-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 228
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "decorView":Landroid/view/View;
    :cond_0
    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v2, :cond_1

    .line 230
    iget-object v2, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v2}, Landroid/opengl/GLSurfaceView;->requestRender()V

    .line 232
    :cond_1
    return-void
.end method

.method public retrieveGLSurfaceView()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 164
    :try_start_0
    invoke-static {}, Lcom/qualcomm/ar/pl/SystemTools;->getActivityFromNative()Landroid/app/Activity;

    move-result-object v0

    .line 165
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 196
    .end local v0    # "activity":Landroid/app/Activity;
    :goto_0
    return v4

    .line 173
    .restart local v0    # "activity":Landroid/app/Activity;
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 174
    .local v1, "decorView":Landroid/view/View;
    invoke-direct {p0, v1}, Lcom/qualcomm/ar/pl/SurfaceManager;->searchForGLSurfaceView(Landroid/view/View;)Landroid/opengl/GLSurfaceView;

    move-result-object v3

    iput-object v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 177
    iget-object v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-nez v3, :cond_1

    .line 180
    iput-object v1, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->cameraSurfaceParentView:Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    :goto_1
    iget-object v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    :goto_2
    move v4, v3

    goto :goto_0

    .line 185
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->glSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v3}, Landroid/opengl/GLSurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iput-object v3, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->cameraSurfaceParentView:Landroid/view/View;

    .line 186
    invoke-direct {p0}, Lcom/qualcomm/ar/pl/SurfaceManager;->applyRenderWhenDirty()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 189
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "decorView":Landroid/view/View;
    :catch_0
    move-exception v2

    .line 192
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "activity":Landroid/app/Activity;
    .restart local v1    # "decorView":Landroid/view/View;
    :cond_2
    move v3, v4

    .line 196
    goto :goto_2
.end method

.method public setEnableRenderWhenDirty(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 204
    iput-boolean p1, p0, Lcom/qualcomm/ar/pl/SurfaceManager;->renderWhenDirtyEnabled:Z

    .line 205
    invoke-direct {p0}, Lcom/qualcomm/ar/pl/SurfaceManager;->applyRenderWhenDirty()Z

    move-result v0

    .line 207
    .local v0, "result":Z
    return v0
.end method
