.class public Lcom/adobe/phonegap/push/PermissionUtils;
.super Ljava/lang/Object;
.source "PermissionUtils.java"


# static fields
.field private static final CHECK_OP_NO_THROW:Ljava/lang/String; = "checkOpNoThrow"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 14
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "appOpsServiceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnknownError;
        }
    .end annotation

    .prologue
    .line 17
    const-string v10, "appops"

    invoke-virtual {p0, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AppOpsManager;

    .line 18
    .local v4, "mAppOps":Landroid/app/AppOpsManager;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 20
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 21
    .local v6, "pkg":Ljava/lang/String;
    iget v8, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 22
    .local v8, "uid":I
    const/4 v1, 0x0

    .line 26
    .local v1, "appOpsClass":Ljava/lang/Class;
    :try_start_0
    const-class v10, Landroid/app/AppOpsManager;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 29
    const-string v10, "checkOpNoThrow"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    .line 30
    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    .line 31
    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v13, v11, v12

    const/4 v12, 0x2

    .line 32
    const-class v13, Ljava/lang/String;

    aput-object v13, v11, v12

    .line 28
    invoke-virtual {v1, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 35
    .local v2, "checkOpNoThrowMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 37
    .local v5, "opValue":Ljava/lang/reflect/Field;
    const-class v10, Ljava/lang/Integer;

    invoke-virtual {v5, v10}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    .line 38
    .local v9, "value":I
    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    aput-object v6, v10, v11

    invoke-virtual {v2, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 40
    .local v7, "result":Ljava/lang/Object;
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_4

    move-result v10

    if-nez v10, :cond_0

    const/4 v10, 0x1

    :goto_0
    return v10

    :cond_0
    const/4 v10, 0x0

    goto :goto_0

    .line 42
    .end local v2    # "checkOpNoThrowMethod":Ljava/lang/reflect/Method;
    .end local v5    # "opValue":Ljava/lang/reflect/Field;
    .end local v7    # "result":Ljava/lang/Object;
    .end local v9    # "value":I
    :catch_0
    move-exception v3

    .line 43
    .local v3, "e":Ljava/lang/ClassNotFoundException;
    new-instance v10, Ljava/lang/UnknownError;

    const-string v11, "class not found"

    invoke-direct {v10, v11}, Ljava/lang/UnknownError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 44
    .end local v3    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v3

    .line 45
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    new-instance v10, Ljava/lang/UnknownError;

    const-string v11, "no such method"

    invoke-direct {v10, v11}, Ljava/lang/UnknownError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 46
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :catch_2
    move-exception v3

    .line 47
    .local v3, "e":Ljava/lang/NoSuchFieldException;
    new-instance v10, Ljava/lang/UnknownError;

    const-string v11, "no such field"

    invoke-direct {v10, v11}, Ljava/lang/UnknownError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 48
    .end local v3    # "e":Ljava/lang/NoSuchFieldException;
    :catch_3
    move-exception v3

    .line 49
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v10, Ljava/lang/UnknownError;

    const-string v11, "invocation target"

    invoke-direct {v10, v11}, Ljava/lang/UnknownError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 50
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_4
    move-exception v3

    .line 51
    .local v3, "e":Ljava/lang/IllegalAccessException;
    new-instance v10, Ljava/lang/UnknownError;

    const-string v11, "illegal access"

    invoke-direct {v10, v11}, Ljava/lang/UnknownError;-><init>(Ljava/lang/String;)V

    throw v10
.end method
