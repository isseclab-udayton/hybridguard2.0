.class public Lcom/qualcomm/ar/pl/SystemTools;
.super Ljava/lang/Object;
.source "SystemTools.java"


# static fields
.field public static final AR_ERROR_INVALID_ENUM:I = 0x3

.field public static final AR_ERROR_INVALID_HANDLE:I = 0x4

.field public static final AR_ERROR_INVALID_OPERATION:I = 0x5

.field public static final AR_ERROR_INVALID_VALUE:I = 0x2

.field public static final AR_ERROR_NONE:I = 0x0

.field public static final AR_ERROR_OPERATION_CANCELED:I = 0x7

.field public static final AR_ERROR_OPERATION_FAILED:I = 0x6

.field public static final AR_ERROR_OPERATION_TIMEOUT:I = 0x8

.field public static final AR_ERROR_UNKNOWN:I = 0x1

.field public static final AR_RENDERING_TEXTURE_ROTATION_AUTO:I = 0x10005011

.field public static final AR_RENDERING_TEXTURE_ROTATION_LANDSCAPE_LEFT:I = 0x10005014

.field public static final AR_RENDERING_TEXTURE_ROTATION_LANDSCAPE_RIGHT:I = 0x10005015

.field public static final AR_RENDERING_TEXTURE_ROTATION_PORTRAIT:I = 0x10005012

.field public static final AR_RENDERING_TEXTURE_ROTATION_PORTRAIT_UPSIDEDOWN:I = 0x10005013

.field public static final AR_VIDEOTEXTURE_ROTATION_UNKNOWN:I = 0x10005010

.field private static final MODULENAME:Ljava/lang/String; = "SystemTools"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkMinimumApiLevel(I)Z
    .locals 1
    .param p0, "apiLevel"    # I

    .prologue
    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static native getActivityFromNative()Landroid/app/Activity;
.end method

.method public static getActivityOrientation(Landroid/app/Activity;)I
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 94
    if-nez p0, :cond_0

    .line 97
    const v0, 0x10005010

    .line 134
    :goto_0
    return v0

    .line 100
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 101
    .local v1, "config":Landroid/content/res/Configuration;
    const-string v4, "window"

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 104
    .local v2, "display":Landroid/view/Display;
    const/16 v4, 0x8

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 106
    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 114
    .local v3, "displayRotation":I
    :goto_1
    const v0, 0x10005010

    .line 116
    .local v0, "activityOrientation":I
    iget v4, v1, Landroid/content/res/Configuration;->orientation:I

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 120
    :pswitch_0
    if-eqz v3, :cond_1

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3

    :cond_1
    const v0, 0x10005012

    .line 121
    :goto_2
    goto :goto_0

    .line 110
    .end local v0    # "activityOrientation":I
    .end local v3    # "displayRotation":I
    :cond_2
    invoke-virtual {v2}, Landroid/view/Display;->getOrientation()I

    move-result v3

    .restart local v3    # "displayRotation":I
    goto :goto_1

    .line 120
    .restart local v0    # "activityOrientation":I
    :cond_3
    const v0, 0x10005013

    goto :goto_2

    .line 124
    :pswitch_1
    if-eqz v3, :cond_4

    const/4 v4, 0x1

    if-ne v3, v4, :cond_5

    :cond_4
    const v0, 0x10005014

    .line 125
    :goto_3
    goto :goto_0

    .line 124
    :cond_5
    const v0, 0x10005015

    goto :goto_3

    .line 116
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getActivitySize(Landroid/app/Activity;)[I
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x0

    .line 184
    if-nez p0, :cond_1

    .line 206
    :cond_0
    :goto_0
    return-object v2

    .line 190
    :cond_1
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 191
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 194
    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 195
    .local v3, "screenWidth":I
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 197
    .local v1, "screenHeight":I
    if-lez v3, :cond_0

    if-lez v1, :cond_0

    .line 199
    const/4 v4, 0x2

    new-array v2, v4, [I

    .line 200
    .local v2, "screenSize":[I
    const/4 v4, 0x0

    aput v3, v2, v4

    .line 201
    const/4 v4, 0x1

    aput v1, v2, v4

    goto :goto_0
.end method

.method public static getNativeLibraryPath(Landroid/app/Activity;)Ljava/lang/String;
    .locals 6
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v3, 0x0

    const/16 v5, 0x2f

    .line 143
    if-nez p0, :cond_1

    move-object v2, v3

    .line 177
    :cond_0
    :goto_0
    return-object v2

    .line 149
    :cond_1
    const/4 v2, 0x0

    .line 153
    .local v2, "path":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 154
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_0

    .line 156
    const/16 v4, 0x9

    invoke-static {v4}, Lcom/qualcomm/ar/pl/SystemTools;->checkMinimumApiLevel(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 158
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 159
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v5, :cond_0

    .line 162
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 167
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/lib/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 171
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v3

    .line 174
    goto :goto_0
.end method

.method public static native logSystemError(Ljava/lang/String;)V
.end method

.method public static varargs retrieveClassMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 73
    .local v0, "classMethod":Ljava/lang/reflect/Method;
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    if-eqz v0, :cond_0

    .line 85
    :cond_0
    return-object v0

    .line 75
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static native setSystemErrorCode(I)V
.end method
