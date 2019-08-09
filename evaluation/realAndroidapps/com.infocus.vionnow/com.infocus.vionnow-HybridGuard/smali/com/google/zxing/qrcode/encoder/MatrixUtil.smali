.class public final Lcom/google/zxing/qrcode/encoder/MatrixUtil;
.super Ljava/lang/Object;
.source "MatrixUtil.java"


# static fields
.field private static final HORIZONTAL_SEPARATION_PATTERN:[[I

.field private static final POSITION_ADJUSTMENT_PATTERN:[[I

.field private static final POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

.field private static final POSITION_DETECTION_PATTERN:[[I

.field private static final TYPE_INFO_COORDINATES:[[I

.field private static final TYPE_INFO_MASK_PATTERN:I = 0x5412

.field private static final TYPE_INFO_POLY:I = 0x537

.field private static final VERSION_INFO_POLY:I = 0x1f25

.field private static final VERTICAL_SEPARATION_PATTERN:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x7

    .line 33
    new-array v0, v4, [[I

    .line 34
    new-array v1, v4, [I

    fill-array-data v1, :array_0

    aput-object v1, v0, v7

    .line 35
    new-array v1, v4, [I

    aput v5, v1, v7

    const/4 v2, 0x6

    aput v5, v1, v2

    aput-object v1, v0, v5

    .line 36
    new-array v1, v4, [I

    aput v5, v1, v7

    aput v5, v1, v6

    const/4 v2, 0x3

    aput v5, v1, v2

    aput v5, v1, v8

    const/4 v2, 0x6

    aput v5, v1, v2

    aput-object v1, v0, v6

    const/4 v1, 0x3

    .line 37
    new-array v2, v4, [I

    aput v5, v2, v7

    aput v5, v2, v6

    const/4 v3, 0x3

    aput v5, v2, v3

    aput v5, v2, v8

    const/4 v3, 0x6

    aput v5, v2, v3

    aput-object v2, v0, v1

    .line 38
    new-array v1, v4, [I

    aput v5, v1, v7

    aput v5, v1, v6

    const/4 v2, 0x3

    aput v5, v1, v2

    aput v5, v1, v8

    const/4 v2, 0x6

    aput v5, v1, v2

    aput-object v1, v0, v8

    const/4 v1, 0x5

    .line 39
    new-array v2, v4, [I

    aput v5, v2, v7

    const/4 v3, 0x6

    aput v5, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 40
    new-array v2, v4, [I

    fill-array-data v2, :array_1

    aput-object v2, v0, v1

    .line 33
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    .line 43
    new-array v0, v5, [[I

    .line 44
    const/16 v1, 0x8

    new-array v1, v1, [I

    aput-object v1, v0, v7

    .line 43
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->HORIZONTAL_SEPARATION_PATTERN:[[I

    .line 47
    new-array v0, v4, [[I

    .line 48
    new-array v1, v5, [I

    aput-object v1, v0, v7

    new-array v1, v5, [I

    aput-object v1, v0, v5

    new-array v1, v5, [I

    aput-object v1, v0, v6

    const/4 v1, 0x3

    new-array v2, v5, [I

    aput-object v2, v0, v1

    new-array v1, v5, [I

    aput-object v1, v0, v8

    const/4 v1, 0x5

    new-array v2, v5, [I

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v5, [I

    aput-object v2, v0, v1

    .line 47
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->VERTICAL_SEPARATION_PATTERN:[[I

    .line 51
    const/4 v0, 0x5

    new-array v0, v0, [[I

    .line 52
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v7

    .line 53
    const/4 v1, 0x5

    new-array v1, v1, [I

    aput v5, v1, v7

    aput v5, v1, v8

    aput-object v1, v0, v5

    .line 54
    const/4 v1, 0x5

    new-array v1, v1, [I

    aput v5, v1, v7

    aput v5, v1, v6

    aput v5, v1, v8

    aput-object v1, v0, v6

    const/4 v1, 0x3

    .line 55
    const/4 v2, 0x5

    new-array v2, v2, [I

    aput v5, v2, v7

    aput v5, v2, v8

    aput-object v2, v0, v1

    .line 56
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v8

    .line 51
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    .line 60
    const/16 v0, 0x28

    new-array v0, v0, [[I

    .line 61
    new-array v1, v4, [I

    fill-array-data v1, :array_4

    aput-object v1, v0, v7

    .line 62
    new-array v1, v4, [I

    fill-array-data v1, :array_5

    aput-object v1, v0, v5

    .line 63
    new-array v1, v4, [I

    fill-array-data v1, :array_6

    aput-object v1, v0, v6

    const/4 v1, 0x3

    .line 64
    new-array v2, v4, [I

    fill-array-data v2, :array_7

    aput-object v2, v0, v1

    .line 65
    new-array v1, v4, [I

    fill-array-data v1, :array_8

    aput-object v1, v0, v8

    const/4 v1, 0x5

    .line 66
    new-array v2, v4, [I

    fill-array-data v2, :array_9

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 67
    new-array v2, v4, [I

    fill-array-data v2, :array_a

    aput-object v2, v0, v1

    .line 68
    new-array v1, v4, [I

    fill-array-data v1, :array_b

    aput-object v1, v0, v4

    const/16 v1, 0x8

    .line 69
    new-array v2, v4, [I

    fill-array-data v2, :array_c

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 70
    new-array v2, v4, [I

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 71
    new-array v2, v4, [I

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 72
    new-array v2, v4, [I

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 73
    new-array v2, v4, [I

    fill-array-data v2, :array_10

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 74
    new-array v2, v4, [I

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 75
    new-array v2, v4, [I

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 76
    new-array v2, v4, [I

    fill-array-data v2, :array_13

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 77
    new-array v2, v4, [I

    fill-array-data v2, :array_14

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 78
    new-array v2, v4, [I

    fill-array-data v2, :array_15

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 79
    new-array v2, v4, [I

    fill-array-data v2, :array_16

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 80
    new-array v2, v4, [I

    fill-array-data v2, :array_17

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 81
    new-array v2, v4, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 82
    new-array v2, v4, [I

    fill-array-data v2, :array_19

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 83
    new-array v2, v4, [I

    fill-array-data v2, :array_1a

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 84
    new-array v2, v4, [I

    fill-array-data v2, :array_1b

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 85
    new-array v2, v4, [I

    fill-array-data v2, :array_1c

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 86
    new-array v2, v4, [I

    fill-array-data v2, :array_1d

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 87
    new-array v2, v4, [I

    fill-array-data v2, :array_1e

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 88
    new-array v2, v4, [I

    fill-array-data v2, :array_1f

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 89
    new-array v2, v4, [I

    fill-array-data v2, :array_20

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 90
    new-array v2, v4, [I

    fill-array-data v2, :array_21

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 91
    new-array v2, v4, [I

    fill-array-data v2, :array_22

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 92
    new-array v2, v4, [I

    fill-array-data v2, :array_23

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 93
    new-array v2, v4, [I

    fill-array-data v2, :array_24

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 94
    new-array v2, v4, [I

    fill-array-data v2, :array_25

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 95
    new-array v2, v4, [I

    fill-array-data v2, :array_26

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 96
    new-array v2, v4, [I

    fill-array-data v2, :array_27

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 97
    new-array v2, v4, [I

    fill-array-data v2, :array_28

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 98
    new-array v2, v4, [I

    fill-array-data v2, :array_29

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 99
    new-array v2, v4, [I

    fill-array-data v2, :array_2a

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 100
    new-array v2, v4, [I

    fill-array-data v2, :array_2b

    aput-object v2, v0, v1

    .line 60
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    .line 104
    const/16 v0, 0xf

    new-array v0, v0, [[I

    .line 105
    new-array v1, v6, [I

    const/16 v2, 0x8

    aput v2, v1, v7

    aput-object v1, v0, v7

    .line 106
    new-array v1, v6, [I

    fill-array-data v1, :array_2c

    aput-object v1, v0, v5

    .line 107
    new-array v1, v6, [I

    fill-array-data v1, :array_2d

    aput-object v1, v0, v6

    const/4 v1, 0x3

    .line 108
    new-array v2, v6, [I

    fill-array-data v2, :array_2e

    aput-object v2, v0, v1

    .line 109
    new-array v1, v6, [I

    fill-array-data v1, :array_2f

    aput-object v1, v0, v8

    const/4 v1, 0x5

    .line 110
    new-array v2, v6, [I

    fill-array-data v2, :array_30

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 111
    new-array v2, v6, [I

    fill-array-data v2, :array_31

    aput-object v2, v0, v1

    .line 112
    new-array v1, v6, [I

    fill-array-data v1, :array_32

    aput-object v1, v0, v4

    const/16 v1, 0x8

    .line 113
    new-array v2, v6, [I

    fill-array-data v2, :array_33

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 114
    new-array v2, v6, [I

    fill-array-data v2, :array_34

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 115
    new-array v2, v6, [I

    fill-array-data v2, :array_35

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 116
    new-array v2, v6, [I

    fill-array-data v2, :array_36

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 117
    new-array v2, v6, [I

    fill-array-data v2, :array_37

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 118
    new-array v2, v6, [I

    fill-array-data v2, :array_38

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 119
    new-array v2, v6, [I

    const/16 v3, 0x8

    aput v3, v2, v5

    aput-object v2, v0, v1

    .line 104
    sput-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    .line 27
    return-void

    .line 34
    :array_0
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 40
    :array_1
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 52
    :array_2
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 56
    :array_3
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 61
    :array_4
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 62
    :array_5
    .array-data 4
        0x6
        0x12
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 63
    :array_6
    .array-data 4
        0x6
        0x16
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 64
    :array_7
    .array-data 4
        0x6
        0x1a
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 65
    :array_8
    .array-data 4
        0x6
        0x1e
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 66
    :array_9
    .array-data 4
        0x6
        0x22
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 67
    :array_a
    .array-data 4
        0x6
        0x16
        0x26
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 68
    :array_b
    .array-data 4
        0x6
        0x18
        0x2a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 69
    :array_c
    .array-data 4
        0x6
        0x1a
        0x2e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 70
    :array_d
    .array-data 4
        0x6
        0x1c
        0x32
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 71
    :array_e
    .array-data 4
        0x6
        0x1e
        0x36
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 72
    :array_f
    .array-data 4
        0x6
        0x20
        0x3a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 73
    :array_10
    .array-data 4
        0x6
        0x22
        0x3e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 74
    :array_11
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 75
    :array_12
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 76
    :array_13
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 77
    :array_14
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 78
    :array_15
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 79
    :array_16
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 80
    :array_17
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 81
    :array_18
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
        -0x1
        -0x1
    .end array-data

    .line 82
    :array_19
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        -0x1
        -0x1
    .end array-data

    .line 83
    :array_1a
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        -0x1
        -0x1
    .end array-data

    .line 84
    :array_1b
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        -0x1
        -0x1
    .end array-data

    .line 85
    :array_1c
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        -0x1
        -0x1
    .end array-data

    .line 86
    :array_1d
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        -0x1
        -0x1
    .end array-data

    .line 87
    :array_1e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        -0x1
        -0x1
    .end array-data

    .line 88
    :array_1f
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
        -0x1
    .end array-data

    .line 89
    :array_20
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        -0x1
    .end array-data

    .line 90
    :array_21
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
        -0x1
    .end array-data

    .line 91
    :array_22
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
        -0x1
    .end array-data

    .line 92
    :array_23
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
        -0x1
    .end array-data

    .line 93
    :array_24
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        -0x1
    .end array-data

    .line 94
    :array_25
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
        -0x1
    .end array-data

    .line 95
    :array_26
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    .line 96
    :array_27
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    .line 97
    :array_28
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    .line 98
    :array_29
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    .line 99
    :array_2a
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    .line 100
    :array_2b
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data

    .line 106
    :array_2c
    .array-data 4
        0x8
        0x1
    .end array-data

    .line 107
    :array_2d
    .array-data 4
        0x8
        0x2
    .end array-data

    .line 108
    :array_2e
    .array-data 4
        0x8
        0x3
    .end array-data

    .line 109
    :array_2f
    .array-data 4
        0x8
        0x4
    .end array-data

    .line 110
    :array_30
    .array-data 4
        0x8
        0x5
    .end array-data

    .line 111
    :array_31
    .array-data 4
        0x8
        0x7
    .end array-data

    .line 112
    :array_32
    .array-data 4
        0x8
        0x8
    .end array-data

    .line 113
    :array_33
    .array-data 4
        0x7
        0x8
    .end array-data

    .line 114
    :array_34
    .array-data 4
        0x5
        0x8
    .end array-data

    .line 115
    :array_35
    .array-data 4
        0x4
        0x8
    .end array-data

    .line 116
    :array_36
    .array-data 4
        0x3
        0x8
    .end array-data

    .line 117
    :array_37
    .array-data 4
        0x2
        0x8
    .end array-data

    .line 118
    :array_38
    .array-data 4
        0x1
        0x8
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 0
    .param p0, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p2, "version"    # I
    .param p3, "maskPattern"    # I
    .param p4, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-static {p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 142
    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedBasicPatterns(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 144
    invoke-static {p1, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 146
    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedVersionInfo(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 148
    invoke-static {p0, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 149
    return-void
.end method

.method public static calculateBCHCode(II)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "poly"    # I

    .prologue
    .line 316
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v0

    .line 317
    .local v0, "msbSetInPoly":I
    add-int/lit8 v1, v0, -0x1

    shl-int/2addr p0, v1

    .line 319
    :goto_0
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    if-ge v1, v0, :cond_0

    .line 323
    return p0

    .line 320
    :cond_0
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    sub-int/2addr v1, v0

    shl-int v1, p1, v1

    xor-int/2addr p0, v1

    goto :goto_0
.end method

.method public static clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 1
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    .prologue
    .line 134
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->clear(B)V

    .line 135
    return-void
.end method

.method public static embedBasicPatterns(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 0
    .param p0, "version"    # I
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 161
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 164
    invoke-static {p0, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedPositionAdjustmentPatterns(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 166
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 167
    return-void
.end method

.method private static embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 3
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    .line 397
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, -0x8

    invoke-virtual {p0, v2, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v0

    if-nez v0, :cond_0

    .line 398
    new-instance v0, Lcom/google/zxing/WriterException;

    invoke-direct {v0}, Lcom/google/zxing/WriterException;-><init>()V

    throw v0

    .line 400
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, -0x8

    const/4 v1, 0x1

    invoke-virtual {p0, v2, v0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 401
    return-void
.end method

.method public static embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 10
    .param p0, "dataBits"    # Lcom/google/zxing/common/BitArray;
    .param p1, "maskPattern"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 227
    const/4 v1, 0x0

    .line 228
    .local v1, "bitIndex":I
    const/4 v2, -0x1

    .line 230
    .local v2, "direction":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v7

    add-int/lit8 v4, v7, -0x1

    .line 231
    .local v4, "x":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v7

    add-int/lit8 v6, v7, -0x1

    .line 232
    .local v6, "y":I
    :goto_0
    if-gtz v4, :cond_0

    .line 269
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    if-eq v1, v7, :cond_9

    .line 270
    new-instance v7, Lcom/google/zxing/WriterException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Not all bits consumed: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x2f

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 234
    :cond_0
    const/4 v7, 0x6

    if-ne v4, v7, :cond_1

    .line 235
    add-int/lit8 v4, v4, -0x1

    .line 237
    :cond_1
    :goto_1
    if-ltz v6, :cond_2

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v7

    if-lt v6, v7, :cond_3

    .line 264
    :cond_2
    neg-int v2, v2

    .line 265
    add-int/2addr v6, v2

    .line 266
    add-int/lit8 v4, v4, -0x2

    goto :goto_0

    .line 238
    :cond_3
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    const/4 v7, 0x2

    if-lt v3, v7, :cond_4

    .line 262
    add-int/2addr v6, v2

    goto :goto_1

    .line 239
    :cond_4
    sub-int v5, v4, v3

    .line 241
    .local v5, "xx":I
    invoke-virtual {p2, v5, v6}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-nez v7, :cond_5

    .line 238
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 245
    :cond_5
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 246
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    .line 247
    .local v0, "bit":Z
    add-int/lit8 v1, v1, 0x1

    .line 255
    :goto_4
    const/4 v7, -0x1

    if-eq p1, v7, :cond_6

    .line 256
    invoke-static {p1, v5, v6}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->getDataMaskBit(III)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 257
    if-eqz v0, :cond_8

    const/4 v0, 0x0

    .line 260
    :cond_6
    :goto_5
    invoke-virtual {p2, v5, v6, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    goto :goto_3

    .line 251
    .end local v0    # "bit":Z
    :cond_7
    const/4 v0, 0x0

    .restart local v0    # "bit":Z
    goto :goto_4

    .line 257
    :cond_8
    const/4 v0, 0x1

    goto :goto_5

    .line 272
    .end local v0    # "bit":Z
    .end local v3    # "i":I
    .end local v5    # "xx":I
    :cond_9
    return-void
.end method

.method private static embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 5
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 406
    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->HORIZONTAL_SEPARATION_PATTERN:[[I

    aget-object v1, v1, v3

    array-length v1, v1

    if-ne v1, v4, :cond_0

    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->HORIZONTAL_SEPARATION_PATTERN:[[I

    array-length v1, v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 407
    :cond_0
    new-instance v1, Lcom/google/zxing/WriterException;

    const-string v2, "Bad horizontal separation pattern"

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 409
    :cond_1
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_0
    if-lt v0, v4, :cond_2

    .line 415
    return-void

    .line 410
    :cond_2
    add-int v1, p0, v0

    invoke-virtual {p2, v1, p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 411
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1

    .line 413
    :cond_3
    add-int v1, p0, v0

    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->HORIZONTAL_SEPARATION_PATTERN:[[I

    aget-object v2, v2, v3

    aget v2, v2, v0

    invoke-virtual {p2, v1, p1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 409
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x5

    .line 437
    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    const/4 v3, 0x0

    aget-object v2, v2, v3

    array-length v2, v2

    if-ne v2, v5, :cond_0

    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    array-length v2, v2

    if-eq v2, v5, :cond_1

    .line 438
    :cond_0
    new-instance v2, Lcom/google/zxing/WriterException;

    const-string v3, "Bad position adjustment"

    invoke-direct {v2, v3}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 440
    :cond_1
    const/4 v1, 0x0

    .local v1, "y":I
    :goto_0
    if-lt v1, v5, :cond_2

    .line 448
    return-void

    .line 441
    :cond_2
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_1
    if-lt v0, v5, :cond_3

    .line 440
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 442
    :cond_3
    add-int v2, p0, v0

    add-int v3, p1, v1

    invoke-virtual {p2, v2, v3}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v2

    if-nez v2, :cond_4

    .line 443
    new-instance v2, Lcom/google/zxing/WriterException;

    invoke-direct {v2}, Lcom/google/zxing/WriterException;-><init>()V

    throw v2

    .line 445
    :cond_4
    add-int v2, p0, v0

    add-int v3, p1, v1

    sget-object v4, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    aget-object v4, v4, v1

    aget v4, v4, v0

    invoke-virtual {p2, v2, v3, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 441
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x7

    .line 453
    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    const/4 v3, 0x0

    aget-object v2, v2, v3

    array-length v2, v2

    if-ne v2, v5, :cond_0

    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    array-length v2, v2

    if-eq v2, v5, :cond_1

    .line 454
    :cond_0
    new-instance v2, Lcom/google/zxing/WriterException;

    const-string v3, "Bad position detection pattern"

    invoke-direct {v2, v3}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 456
    :cond_1
    const/4 v1, 0x0

    .local v1, "y":I
    :goto_0
    if-lt v1, v5, :cond_2

    .line 464
    return-void

    .line 457
    :cond_2
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_1
    if-lt v0, v5, :cond_3

    .line 456
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 458
    :cond_3
    add-int v2, p0, v0

    add-int v3, p1, v1

    invoke-virtual {p2, v2, v3}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v2

    if-nez v2, :cond_4

    .line 459
    new-instance v2, Lcom/google/zxing/WriterException;

    invoke-direct {v2}, Lcom/google/zxing/WriterException;-><init>()V

    throw v2

    .line 461
    :cond_4
    add-int v2, p0, v0

    add-int v3, p1, v1

    sget-object v4, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    aget-object v4, v4, v1

    aget v4, v4, v0

    invoke-virtual {p2, v2, v3, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 457
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 469
    sget-object v3, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    aget-object v3, v3, v5

    array-length v1, v3

    .line 471
    .local v1, "pdpWidth":I
    invoke-static {v5, v5, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 473
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-static {v3, v5, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 475
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-static {v5, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 478
    sget-object v3, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->HORIZONTAL_SEPARATION_PATTERN:[[I

    aget-object v3, v3, v5

    array-length v0, v3

    .line 480
    .local v0, "hspWidth":I
    add-int/lit8 v3, v0, -0x1

    invoke-static {v5, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 482
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v0

    .line 483
    add-int/lit8 v4, v0, -0x1

    .line 482
    invoke-static {v3, v4, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 485
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-static {v5, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 488
    sget-object v3, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->VERTICAL_SEPARATION_PATTERN:[[I

    array-length v2, v3

    .line 490
    .local v2, "vspSize":I
    invoke-static {v2, v5, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 492
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3, v5, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 494
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v2, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    .line 496
    return-void
.end method

.method private static embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 4
    .param p0, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x6

    .line 376
    const/16 v1, 0x8

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    add-int/lit8 v2, v2, -0x8

    if-lt v1, v2, :cond_0

    .line 393
    return-void

    .line 377
    :cond_0
    add-int/lit8 v2, v1, 0x1

    rem-int/lit8 v0, v2, 0x2

    .line 379
    .local v0, "bit":I
    invoke-virtual {p0, v1, v3}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isValidValue(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 380
    new-instance v2, Lcom/google/zxing/WriterException;

    invoke-direct {v2}, Lcom/google/zxing/WriterException;-><init>()V

    throw v2

    .line 382
    :cond_1
    invoke-virtual {p0, v1, v3}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 383
    invoke-virtual {p0, v1, v3, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 386
    :cond_2
    invoke-virtual {p0, v3, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isValidValue(I)Z

    move-result v2

    if-nez v2, :cond_3

    .line 387
    new-instance v2, Lcom/google/zxing/WriterException;

    invoke-direct {v2}, Lcom/google/zxing/WriterException;-><init>()V

    throw v2

    .line 389
    :cond_3
    invoke-virtual {p0, v3, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 390
    invoke-virtual {p0, v3, v1, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 376
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 9
    .param p0, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p1, "maskPattern"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 172
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 173
    .local v2, "typeInfoBits":Lcom/google/zxing/common/BitArray;
    invoke-static {p0, p1, v2}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V

    .line 175
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    if-lt v1, v7, :cond_0

    .line 197
    return-void

    .line 178
    :cond_0
    invoke-virtual {v2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, v1

    invoke-virtual {v2, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    .line 181
    .local v0, "bit":Z
    sget-object v7, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v7, v7, v1

    const/4 v8, 0x0

    aget v3, v7, v8

    .line 182
    .local v3, "x1":I
    sget-object v7, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v7, v7, v1

    const/4 v8, 0x1

    aget v5, v7, v8

    .line 183
    .local v5, "y1":I
    invoke-virtual {p2, v3, v5, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 185
    const/16 v7, 0x8

    if-ge v1, v7, :cond_1

    .line 187
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v7

    sub-int/2addr v7, v1

    add-int/lit8 v4, v7, -0x1

    .line 188
    .local v4, "x2":I
    const/16 v6, 0x8

    .line 189
    .local v6, "y2":I
    invoke-virtual {p2, v4, v6, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 175
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    .end local v4    # "x2":I
    .end local v6    # "y2":I
    :cond_1
    const/16 v4, 0x8

    .line 193
    .restart local v4    # "x2":I
    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v7

    add-int/lit8 v7, v7, -0x7

    add-int/lit8 v8, v1, -0x8

    add-int v6, v7, v8

    .line 194
    .restart local v6    # "y2":I
    invoke-virtual {p2, v4, v6, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    goto :goto_1
.end method

.method private static embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 5
    .param p0, "xStart"    # I
    .param p1, "yStart"    # I
    .param p2, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x7

    const/4 v3, 0x0

    .line 420
    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->VERTICAL_SEPARATION_PATTERN:[[I

    aget-object v1, v1, v3

    array-length v1, v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->VERTICAL_SEPARATION_PATTERN:[[I

    array-length v1, v1

    if-eq v1, v4, :cond_1

    .line 421
    :cond_0
    new-instance v1, Lcom/google/zxing/WriterException;

    const-string v2, "Bad vertical separation pattern"

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 423
    :cond_1
    const/4 v0, 0x0

    .local v0, "y":I
    :goto_0
    if-lt v0, v4, :cond_2

    .line 429
    return-void

    .line 424
    :cond_2
    add-int v1, p1, v0

    invoke-virtual {p2, p0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 425
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1

    .line 427
    :cond_3
    add-int v1, p1, v0

    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->VERTICAL_SEPARATION_PATTERN:[[I

    aget-object v2, v2, v0

    aget v2, v2, v3

    invoke-virtual {p2, p0, v1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    .line 423
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static findMSBSet(I)I
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 280
    const/4 v0, 0x0

    .line 281
    .local v0, "numDigits":I
    :goto_0
    if-nez p0, :cond_0

    .line 285
    return v0

    .line 282
    :cond_0
    ushr-int/lit8 p0, p0, 0x1

    .line 283
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static isEmpty(I)Z
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 363
    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isValidValue(I)Z
    .locals 2
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x1

    .line 368
    const/4 v1, -0x1

    if-eq p0, v1, :cond_0

    .line 369
    if-eqz p0, :cond_0

    .line 370
    if-eq p0, v0, :cond_0

    const/4 v0, 0x0

    :cond_0
    return v0
.end method

.method public static makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V
    .locals 6
    .param p0, "ecLevel"    # Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    .param p1, "maskPattern"    # I
    .param p2, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xf

    .line 331
    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/QRCode;->isValidMaskPattern(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 332
    new-instance v3, Lcom/google/zxing/WriterException;

    const-string v4, "Invalid mask pattern"

    invoke-direct {v3, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->getBits()I

    move-result v3

    shl-int/lit8 v3, v3, 0x3

    or-int v2, v3, p1

    .line 335
    .local v2, "typeInfo":I
    const/4 v3, 0x5

    invoke-virtual {p2, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 337
    const/16 v3, 0x537

    invoke-static {v2, v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v0

    .line 338
    .local v0, "bchCode":I
    const/16 v3, 0xa

    invoke-virtual {p2, v0, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 340
    new-instance v1, Lcom/google/zxing/common/BitArray;

    invoke-direct {v1}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 341
    .local v1, "maskBits":Lcom/google/zxing/common/BitArray;
    const/16 v3, 0x5412

    invoke-virtual {v1, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 342
    invoke-virtual {p2, v1}, Lcom/google/zxing/common/BitArray;->xor(Lcom/google/zxing/common/BitArray;)V

    .line 344
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-eq v3, v4, :cond_1

    .line 345
    new-instance v3, Lcom/google/zxing/WriterException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "should not happen but we got: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 347
    :cond_1
    return-void
.end method

.method public static makeVersionInfoBits(ILcom/google/zxing/common/BitArray;)V
    .locals 4
    .param p0, "version"    # I
    .param p1, "bits"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 352
    const/4 v1, 0x6

    invoke-virtual {p1, p0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 353
    const/16 v1, 0x1f25

    invoke-static {p0, v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v0

    .line 354
    .local v0, "bchCode":I
    const/16 v1, 0xc

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    .line 356
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    const/16 v2, 0x12

    if-eq v1, v2, :cond_0

    .line 357
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "should not happen but we got: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 359
    :cond_0
    return-void
.end method

.method private static maybeEmbedPositionAdjustmentPatterns(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 10
    .param p0, "version"    # I
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 501
    const/4 v7, 0x2

    if-ge p0, v7, :cond_1

    .line 522
    :cond_0
    return-void

    .line 504
    :cond_1
    add-int/lit8 v2, p0, -0x1

    .line 505
    .local v2, "index":I
    sget-object v7, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v0, v7, v2

    .line 506
    .local v0, "coordinates":[I
    sget-object v7, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v7, v7, v2

    array-length v4, v7

    .line 507
    .local v4, "numCoordinates":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_0

    .line 508
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-lt v3, v4, :cond_2

    .line 507
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 509
    :cond_2
    aget v6, v0, v1

    .line 510
    .local v6, "y":I
    aget v5, v0, v3

    .line 511
    .local v5, "x":I
    if-eq v5, v9, :cond_3

    if-ne v6, v9, :cond_4

    .line 508
    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 515
    :cond_4
    invoke-virtual {p1, v5, v6}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 518
    add-int/lit8 v7, v5, -0x2

    add-int/lit8 v8, v6, -0x2

    invoke-static {v7, v8, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    goto :goto_2
.end method

.method public static maybeEmbedVersionInfo(ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .locals 6
    .param p0, "version"    # I
    .param p1, "matrix"    # Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v5, 0x7

    if-ge p0, v5, :cond_1

    .line 220
    :cond_0
    return-void

    .line 205
    :cond_1
    new-instance v4, Lcom/google/zxing/common/BitArray;

    invoke-direct {v4}, Lcom/google/zxing/common/BitArray;-><init>()V

    .line 206
    .local v4, "versionInfoBits":Lcom/google/zxing/common/BitArray;
    invoke-static {p0, v4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeVersionInfoBits(ILcom/google/zxing/common/BitArray;)V

    .line 208
    const/16 v1, 0x11

    .line 209
    .local v1, "bitIndex":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v5, 0x6

    if-ge v2, v5, :cond_0

    .line 210
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    const/4 v5, 0x3

    if-lt v3, v5, :cond_2

    .line 209
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 212
    :cond_2
    invoke-virtual {v4, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    .line 213
    .local v0, "bit":Z
    add-int/lit8 v1, v1, -0x1

    .line 215
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v2, v5, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 217
    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v5, v2, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    .line 210
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method
