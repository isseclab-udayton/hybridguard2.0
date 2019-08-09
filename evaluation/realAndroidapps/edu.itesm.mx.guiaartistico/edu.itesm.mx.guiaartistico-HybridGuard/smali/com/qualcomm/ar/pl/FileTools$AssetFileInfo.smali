.class public Lcom/qualcomm/ar/pl/FileTools$AssetFileInfo;
.super Ljava/lang/Object;
.source "FileTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/qualcomm/ar/pl/FileTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AssetFileInfo"
.end annotation


# instance fields
.field filePos:J

.field fileStream:Ljava/io/BufferedInputStream;

.field relativePath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
