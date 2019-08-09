.class Lcom/qualcomm/ar/pl/CameraSurface;
.super Landroid/view/SurfaceView;
.source "CameraSurface.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final MODULENAME:Ljava/lang/String; = "CameraSurface"


# instance fields
.field camera:Landroid/hardware/Camera;

.field surfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    .line 35
    invoke-virtual {p0}, Lcom/qualcomm/ar/pl/CameraSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraSurface;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 36
    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraSurface;->surfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 37
    iget-object v0, p0, Lcom/qualcomm/ar/pl/CameraSurface;->surfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 38
    return-void
.end method


# virtual methods
.method public setCamera(Landroid/hardware/Camera;)V
    .locals 0
    .param p1, "cam"    # Landroid/hardware/Camera;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    .line 44
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 74
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 66
    .local v0, "exception":Ljava/io/IOException;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/qualcomm/ar/pl/CameraSurface;->camera:Landroid/hardware/Camera;

    .line 81
    return-void
.end method
