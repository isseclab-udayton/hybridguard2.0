.class public final Lcom/phonegap/helloworld/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/phonegap/helloworld/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final AdsAttrs:[I

.field public static final AdsAttrs_adSize:I = 0x0

.field public static final AdsAttrs_adSizes:I = 0x1

.field public static final AdsAttrs_adUnitId:I = 0x2

.field public static final LoadingImageView:[I

.field public static final LoadingImageView_circleCrop:I = 0x2

.field public static final LoadingImageView_imageAspectRatio:I = 0x1

.field public static final LoadingImageView_imageAspectRatioAdjust:I = 0x0

.field public static final SignInButton:[I

.field public static final SignInButton_buttonSize:I = 0x0

.field public static final SignInButton_colorScheme:I = 0x1

.field public static final SignInButton_scopeUris:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 223
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/phonegap/helloworld/R$styleable;->AdsAttrs:[I

    .line 282
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/phonegap/helloworld/R$styleable;->LoadingImageView:[I

    .line 345
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/phonegap/helloworld/R$styleable;->SignInButton:[I

    return-void

    .line 223
    nop

    :array_0
    .array-data 4
        0x7f010000
        0x7f010001
        0x7f010002
    .end array-data

    .line 282
    :array_1
    .array-data 4
        0x7f010003
        0x7f010004
        0x7f010005
    .end array-data

    .line 345
    :array_2
    .array-data 4
        0x7f010006
        0x7f010007
        0x7f010008
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
