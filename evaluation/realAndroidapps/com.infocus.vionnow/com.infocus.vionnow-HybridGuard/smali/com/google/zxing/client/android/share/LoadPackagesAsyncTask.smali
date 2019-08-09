.class final Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;
.super Landroid/os/AsyncTask;
.source "LoadPackagesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask$ByFirstStringComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/List",
        "<[",
        "Ljava/lang/String;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/util/List",
        "<[",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final PKG_PREFIX_BLACKLIST:[Ljava/lang/String;

.field private static final PKG_PREFIX_WHITELIST:[Ljava/lang/String;


# instance fields
.field private final activity:Lcom/google/zxing/client/android/share/AppPickerActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    new-array v0, v3, [Ljava/lang/String;

    .line 39
    const-string v1, "com.google.android.apps."

    aput-object v1, v0, v2

    .line 38
    sput-object v0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->PKG_PREFIX_WHITELIST:[Ljava/lang/String;

    .line 41
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    .line 42
    const-string v1, "com.android."

    aput-object v1, v0, v2

    .line 43
    const-string v1, "android"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    .line 44
    const-string v2, "com.google.android."

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 45
    const-string v2, "com.htc"

    aput-object v2, v0, v1

    .line 41
    sput-object v0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->PKG_PREFIX_BLACKLIST:[Ljava/lang/String;

    .line 36
    return-void
.end method

.method constructor <init>(Lcom/google/zxing/client/android/share/AppPickerActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/google/zxing/client/android/share/AppPickerActivity;

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->activity:Lcom/google/zxing/client/android/share/AppPickerActivity;

    .line 52
    return-void
.end method

.method private static isHidden(Ljava/lang/String;)Z
    .locals 7
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 73
    if-nez p0, :cond_1

    .line 86
    :cond_0
    :goto_0
    return v1

    .line 76
    :cond_1
    sget-object v4, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->PKG_PREFIX_WHITELIST:[Ljava/lang/String;

    array-length v5, v4

    move v3, v2

    :goto_1
    if-lt v3, v5, :cond_2

    .line 81
    sget-object v4, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->PKG_PREFIX_BLACKLIST:[Ljava/lang/String;

    array-length v5, v4

    move v3, v2

    :goto_2
    if-lt v3, v5, :cond_4

    move v1, v2

    .line 86
    goto :goto_0

    .line 76
    :cond_2
    aget-object v0, v4, v3

    .line 77
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v1, v2

    .line 78
    goto :goto_0

    .line 76
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 81
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_4
    aget-object v0, v4, v3

    .line 82
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 81
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->doInBackground([Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/util/List;)Ljava/util/List;
    .locals 10
    .param p1, "objects"    # [Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 56
    aget-object v3, p1, v9

    .line 57
    .local v3, "labelsPackages":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->activity:Lcom/google/zxing/client/android/share/AppPickerActivity;

    invoke-virtual {v6}, Lcom/google/zxing/client/android/share/AppPickerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 58
    .local v4, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v1

    .line 59
    .local v1, "appInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ApplicationInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_1

    .line 68
    new-instance v6, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask$ByFirstStringComparator;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask$ByFirstStringComparator;-><init>(Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask$ByFirstStringComparator;)V

    invoke-static {v3, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 69
    return-object v3

    .line 59
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 60
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v0, v4}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 61
    .local v2, "label":Ljava/lang/CharSequence;
    if-eqz v2, :cond_0

    .line 62
    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 63
    .local v5, "packageName":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->isHidden(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 64
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object v5, v7, v8

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected declared-synchronized onPostExecute(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "results":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 92
    .local v0, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 95
    new-instance v1, Landroid/widget/ArrayAdapter;

    iget-object v3, p0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->activity:Lcom/google/zxing/client/android/share/AppPickerActivity;

    .line 96
    const v4, 0x1090003

    .line 95
    invoke-direct {v1, v3, v4, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 97
    .local v1, "listAdapter":Landroid/widget/ListAdapter;
    iget-object v3, p0, Lcom/google/zxing/client/android/share/LoadPackagesAsyncTask;->activity:Lcom/google/zxing/client/android/share/AppPickerActivity;

    invoke-virtual {v3, v1}, Lcom/google/zxing/client/android/share/AppPickerActivity;->setListAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    monitor-exit p0

    return-void

    .line 92
    .end local v1    # "listAdapter":Landroid/widget/ListAdapter;
    :cond_0
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 93
    .local v2, "result":[Ljava/lang/String;
    const/4 v4, 0x0

    aget-object v4, v2, v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 91
    .end local v0    # "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "result":[Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
