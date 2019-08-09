.class public final Lcom/google/zxing/oned/Code128Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code128Reader.java"


# static fields
.field private static final CODE_CODE_A:I = 0x65

.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_FNC_1:I = 0x66

.field private static final CODE_FNC_2:I = 0x61

.field private static final CODE_FNC_3:I = 0x60

.field private static final CODE_FNC_4_A:I = 0x65

.field private static final CODE_FNC_4_B:I = 0x64

.field static final CODE_PATTERNS:[[I

.field private static final CODE_SHIFT:I = 0x62

.field private static final CODE_START_A:I = 0x67

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a

.field private static final MAX_AVG_VARIANCE:I = 0x40

.field private static final MAX_INDIVIDUAL_VARIANCE:I = 0xb3


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x7

    const/4 v3, 0x6

    .line 39
    const/16 v0, 0x6b

    new-array v0, v0, [[I

    const/4 v1, 0x0

    .line 40
    new-array v2, v3, [I

    fill-array-data v2, :array_0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 41
    new-array v2, v3, [I

    fill-array-data v2, :array_1

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 42
    new-array v2, v3, [I

    fill-array-data v2, :array_2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 43
    new-array v2, v3, [I

    fill-array-data v2, :array_3

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 44
    new-array v2, v3, [I

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 45
    new-array v2, v3, [I

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    .line 46
    new-array v1, v3, [I

    fill-array-data v1, :array_6

    aput-object v1, v0, v3

    .line 47
    new-array v1, v3, [I

    fill-array-data v1, :array_7

    aput-object v1, v0, v4

    const/16 v1, 0x8

    .line 48
    new-array v2, v3, [I

    fill-array-data v2, :array_8

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 49
    new-array v2, v3, [I

    fill-array-data v2, :array_9

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 50
    new-array v2, v3, [I

    fill-array-data v2, :array_a

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 51
    new-array v2, v3, [I

    fill-array-data v2, :array_b

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 52
    new-array v2, v3, [I

    fill-array-data v2, :array_c

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 53
    new-array v2, v3, [I

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 54
    new-array v2, v3, [I

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 55
    new-array v2, v3, [I

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 56
    new-array v2, v3, [I

    fill-array-data v2, :array_10

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 57
    new-array v2, v3, [I

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 58
    new-array v2, v3, [I

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 59
    new-array v2, v3, [I

    fill-array-data v2, :array_13

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 60
    new-array v2, v3, [I

    fill-array-data v2, :array_14

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 61
    new-array v2, v3, [I

    fill-array-data v2, :array_15

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 62
    new-array v2, v3, [I

    fill-array-data v2, :array_16

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 63
    new-array v2, v3, [I

    fill-array-data v2, :array_17

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 64
    new-array v2, v3, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 65
    new-array v2, v3, [I

    fill-array-data v2, :array_19

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 66
    new-array v2, v3, [I

    fill-array-data v2, :array_1a

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 67
    new-array v2, v3, [I

    fill-array-data v2, :array_1b

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 68
    new-array v2, v3, [I

    fill-array-data v2, :array_1c

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 69
    new-array v2, v3, [I

    fill-array-data v2, :array_1d

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 70
    new-array v2, v3, [I

    fill-array-data v2, :array_1e

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 71
    new-array v2, v3, [I

    fill-array-data v2, :array_1f

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 72
    new-array v2, v3, [I

    fill-array-data v2, :array_20

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 73
    new-array v2, v3, [I

    fill-array-data v2, :array_21

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 74
    new-array v2, v3, [I

    fill-array-data v2, :array_22

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 75
    new-array v2, v3, [I

    fill-array-data v2, :array_23

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 76
    new-array v2, v3, [I

    fill-array-data v2, :array_24

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 77
    new-array v2, v3, [I

    fill-array-data v2, :array_25

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 78
    new-array v2, v3, [I

    fill-array-data v2, :array_26

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 79
    new-array v2, v3, [I

    fill-array-data v2, :array_27

    aput-object v2, v0, v1

    const/16 v1, 0x28

    .line 80
    new-array v2, v3, [I

    fill-array-data v2, :array_28

    aput-object v2, v0, v1

    const/16 v1, 0x29

    .line 81
    new-array v2, v3, [I

    fill-array-data v2, :array_29

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    .line 82
    new-array v2, v3, [I

    fill-array-data v2, :array_2a

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    .line 83
    new-array v2, v3, [I

    fill-array-data v2, :array_2b

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    .line 84
    new-array v2, v3, [I

    fill-array-data v2, :array_2c

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    .line 85
    new-array v2, v3, [I

    fill-array-data v2, :array_2d

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    .line 86
    new-array v2, v3, [I

    fill-array-data v2, :array_2e

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    .line 87
    new-array v2, v3, [I

    fill-array-data v2, :array_2f

    aput-object v2, v0, v1

    const/16 v1, 0x30

    .line 88
    new-array v2, v3, [I

    fill-array-data v2, :array_30

    aput-object v2, v0, v1

    const/16 v1, 0x31

    .line 89
    new-array v2, v3, [I

    fill-array-data v2, :array_31

    aput-object v2, v0, v1

    const/16 v1, 0x32

    .line 90
    new-array v2, v3, [I

    fill-array-data v2, :array_32

    aput-object v2, v0, v1

    const/16 v1, 0x33

    .line 91
    new-array v2, v3, [I

    fill-array-data v2, :array_33

    aput-object v2, v0, v1

    const/16 v1, 0x34

    .line 92
    new-array v2, v3, [I

    fill-array-data v2, :array_34

    aput-object v2, v0, v1

    const/16 v1, 0x35

    .line 93
    new-array v2, v3, [I

    fill-array-data v2, :array_35

    aput-object v2, v0, v1

    const/16 v1, 0x36

    .line 94
    new-array v2, v3, [I

    fill-array-data v2, :array_36

    aput-object v2, v0, v1

    const/16 v1, 0x37

    .line 95
    new-array v2, v3, [I

    fill-array-data v2, :array_37

    aput-object v2, v0, v1

    const/16 v1, 0x38

    .line 96
    new-array v2, v3, [I

    fill-array-data v2, :array_38

    aput-object v2, v0, v1

    const/16 v1, 0x39

    .line 97
    new-array v2, v3, [I

    fill-array-data v2, :array_39

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    .line 98
    new-array v2, v3, [I

    fill-array-data v2, :array_3a

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    .line 99
    new-array v2, v3, [I

    fill-array-data v2, :array_3b

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    .line 100
    new-array v2, v3, [I

    fill-array-data v2, :array_3c

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    .line 101
    new-array v2, v3, [I

    fill-array-data v2, :array_3d

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    .line 102
    new-array v2, v3, [I

    fill-array-data v2, :array_3e

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    .line 103
    new-array v2, v3, [I

    fill-array-data v2, :array_3f

    aput-object v2, v0, v1

    const/16 v1, 0x40

    .line 104
    new-array v2, v3, [I

    fill-array-data v2, :array_40

    aput-object v2, v0, v1

    const/16 v1, 0x41

    .line 105
    new-array v2, v3, [I

    fill-array-data v2, :array_41

    aput-object v2, v0, v1

    const/16 v1, 0x42

    .line 106
    new-array v2, v3, [I

    fill-array-data v2, :array_42

    aput-object v2, v0, v1

    const/16 v1, 0x43

    .line 107
    new-array v2, v3, [I

    fill-array-data v2, :array_43

    aput-object v2, v0, v1

    const/16 v1, 0x44

    .line 108
    new-array v2, v3, [I

    fill-array-data v2, :array_44

    aput-object v2, v0, v1

    const/16 v1, 0x45

    .line 109
    new-array v2, v3, [I

    fill-array-data v2, :array_45

    aput-object v2, v0, v1

    const/16 v1, 0x46

    .line 110
    new-array v2, v3, [I

    fill-array-data v2, :array_46

    aput-object v2, v0, v1

    const/16 v1, 0x47

    .line 111
    new-array v2, v3, [I

    fill-array-data v2, :array_47

    aput-object v2, v0, v1

    const/16 v1, 0x48

    .line 112
    new-array v2, v3, [I

    fill-array-data v2, :array_48

    aput-object v2, v0, v1

    const/16 v1, 0x49

    .line 113
    new-array v2, v3, [I

    fill-array-data v2, :array_49

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    .line 114
    new-array v2, v3, [I

    fill-array-data v2, :array_4a

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    .line 115
    new-array v2, v3, [I

    fill-array-data v2, :array_4b

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    .line 116
    new-array v2, v3, [I

    fill-array-data v2, :array_4c

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    .line 117
    new-array v2, v3, [I

    fill-array-data v2, :array_4d

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    .line 118
    new-array v2, v3, [I

    fill-array-data v2, :array_4e

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    .line 119
    new-array v2, v3, [I

    fill-array-data v2, :array_4f

    aput-object v2, v0, v1

    const/16 v1, 0x50

    .line 120
    new-array v2, v3, [I

    fill-array-data v2, :array_50

    aput-object v2, v0, v1

    const/16 v1, 0x51

    .line 121
    new-array v2, v3, [I

    fill-array-data v2, :array_51

    aput-object v2, v0, v1

    const/16 v1, 0x52

    .line 122
    new-array v2, v3, [I

    fill-array-data v2, :array_52

    aput-object v2, v0, v1

    const/16 v1, 0x53

    .line 123
    new-array v2, v3, [I

    fill-array-data v2, :array_53

    aput-object v2, v0, v1

    const/16 v1, 0x54

    .line 124
    new-array v2, v3, [I

    fill-array-data v2, :array_54

    aput-object v2, v0, v1

    const/16 v1, 0x55

    .line 125
    new-array v2, v3, [I

    fill-array-data v2, :array_55

    aput-object v2, v0, v1

    const/16 v1, 0x56

    .line 126
    new-array v2, v3, [I

    fill-array-data v2, :array_56

    aput-object v2, v0, v1

    const/16 v1, 0x57

    .line 127
    new-array v2, v3, [I

    fill-array-data v2, :array_57

    aput-object v2, v0, v1

    const/16 v1, 0x58

    .line 128
    new-array v2, v3, [I

    fill-array-data v2, :array_58

    aput-object v2, v0, v1

    const/16 v1, 0x59

    .line 129
    new-array v2, v3, [I

    fill-array-data v2, :array_59

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    .line 130
    new-array v2, v3, [I

    fill-array-data v2, :array_5a

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    .line 131
    new-array v2, v3, [I

    fill-array-data v2, :array_5b

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    .line 132
    new-array v2, v3, [I

    fill-array-data v2, :array_5c

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    .line 133
    new-array v2, v3, [I

    fill-array-data v2, :array_5d

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    .line 134
    new-array v2, v3, [I

    fill-array-data v2, :array_5e

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    .line 135
    new-array v2, v3, [I

    fill-array-data v2, :array_5f

    aput-object v2, v0, v1

    const/16 v1, 0x60

    .line 136
    new-array v2, v3, [I

    fill-array-data v2, :array_60

    aput-object v2, v0, v1

    const/16 v1, 0x61

    .line 137
    new-array v2, v3, [I

    fill-array-data v2, :array_61

    aput-object v2, v0, v1

    const/16 v1, 0x62

    .line 138
    new-array v2, v3, [I

    fill-array-data v2, :array_62

    aput-object v2, v0, v1

    const/16 v1, 0x63

    .line 139
    new-array v2, v3, [I

    fill-array-data v2, :array_63

    aput-object v2, v0, v1

    const/16 v1, 0x64

    .line 140
    new-array v2, v3, [I

    fill-array-data v2, :array_64

    aput-object v2, v0, v1

    const/16 v1, 0x65

    .line 141
    new-array v2, v3, [I

    fill-array-data v2, :array_65

    aput-object v2, v0, v1

    const/16 v1, 0x66

    .line 142
    new-array v2, v3, [I

    fill-array-data v2, :array_66

    aput-object v2, v0, v1

    const/16 v1, 0x67

    .line 143
    new-array v2, v3, [I

    fill-array-data v2, :array_67

    aput-object v2, v0, v1

    const/16 v1, 0x68

    .line 144
    new-array v2, v3, [I

    fill-array-data v2, :array_68

    aput-object v2, v0, v1

    const/16 v1, 0x69

    .line 145
    new-array v2, v3, [I

    fill-array-data v2, :array_69

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    .line 146
    new-array v2, v4, [I

    fill-array-data v2, :array_6a

    aput-object v2, v0, v1

    .line 39
    sput-object v0, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    .line 167
    return-void

    .line 40
    :array_0
    .array-data 4
        0x2
        0x1
        0x2
        0x2
        0x2
        0x2
    .end array-data

    .line 41
    :array_1
    .array-data 4
        0x2
        0x2
        0x2
        0x1
        0x2
        0x2
    .end array-data

    .line 42
    :array_2
    .array-data 4
        0x2
        0x2
        0x2
        0x2
        0x2
        0x1
    .end array-data

    .line 43
    :array_3
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x2
        0x3
    .end array-data

    .line 44
    :array_4
    .array-data 4
        0x1
        0x2
        0x1
        0x3
        0x2
        0x2
    .end array-data

    .line 45
    :array_5
    .array-data 4
        0x1
        0x3
        0x1
        0x2
        0x2
        0x2
    .end array-data

    .line 46
    :array_6
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x1
        0x3
    .end array-data

    .line 47
    :array_7
    .array-data 4
        0x1
        0x2
        0x2
        0x3
        0x1
        0x2
    .end array-data

    .line 48
    :array_8
    .array-data 4
        0x1
        0x3
        0x2
        0x2
        0x1
        0x2
    .end array-data

    .line 49
    :array_9
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x1
        0x3
    .end array-data

    .line 50
    :array_a
    .array-data 4
        0x2
        0x2
        0x1
        0x3
        0x1
        0x2
    .end array-data

    .line 51
    :array_b
    .array-data 4
        0x2
        0x3
        0x1
        0x2
        0x1
        0x2
    .end array-data

    .line 52
    :array_c
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x3
        0x2
    .end array-data

    .line 53
    :array_d
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x3
        0x2
    .end array-data

    .line 54
    :array_e
    .array-data 4
        0x1
        0x2
        0x2
        0x2
        0x3
        0x1
    .end array-data

    .line 55
    :array_f
    .array-data 4
        0x1
        0x1
        0x3
        0x2
        0x2
        0x2
    .end array-data

    .line 56
    :array_10
    .array-data 4
        0x1
        0x2
        0x3
        0x1
        0x2
        0x2
    .end array-data

    .line 57
    :array_11
    .array-data 4
        0x1
        0x2
        0x3
        0x2
        0x2
        0x1
    .end array-data

    .line 58
    :array_12
    .array-data 4
        0x2
        0x2
        0x3
        0x2
        0x1
        0x1
    .end array-data

    .line 59
    :array_13
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x3
        0x2
    .end array-data

    .line 60
    :array_14
    .array-data 4
        0x2
        0x2
        0x1
        0x2
        0x3
        0x1
    .end array-data

    .line 61
    :array_15
    .array-data 4
        0x2
        0x1
        0x3
        0x2
        0x1
        0x2
    .end array-data

    .line 62
    :array_16
    .array-data 4
        0x2
        0x2
        0x3
        0x1
        0x1
        0x2
    .end array-data

    .line 63
    :array_17
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x3
        0x1
    .end array-data

    .line 64
    :array_18
    .array-data 4
        0x3
        0x1
        0x1
        0x2
        0x2
        0x2
    .end array-data

    .line 65
    :array_19
    .array-data 4
        0x3
        0x2
        0x1
        0x1
        0x2
        0x2
    .end array-data

    .line 66
    :array_1a
    .array-data 4
        0x3
        0x2
        0x1
        0x2
        0x2
        0x1
    .end array-data

    .line 67
    :array_1b
    .array-data 4
        0x3
        0x1
        0x2
        0x2
        0x1
        0x2
    .end array-data

    .line 68
    :array_1c
    .array-data 4
        0x3
        0x2
        0x2
        0x1
        0x1
        0x2
    .end array-data

    .line 69
    :array_1d
    .array-data 4
        0x3
        0x2
        0x2
        0x2
        0x1
        0x1
    .end array-data

    .line 70
    :array_1e
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x2
        0x3
    .end array-data

    .line 71
    :array_1f
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x2
        0x1
    .end array-data

    .line 72
    :array_20
    .array-data 4
        0x2
        0x3
        0x2
        0x1
        0x2
        0x1
    .end array-data

    .line 73
    :array_21
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x2
        0x3
    .end array-data

    .line 74
    :array_22
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x2
        0x3
    .end array-data

    .line 75
    :array_23
    .array-data 4
        0x1
        0x3
        0x1
        0x3
        0x2
        0x1
    .end array-data

    .line 76
    :array_24
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x1
        0x3
    .end array-data

    .line 77
    :array_25
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x1
        0x3
    .end array-data

    .line 78
    :array_26
    .array-data 4
        0x1
        0x3
        0x2
        0x3
        0x1
        0x1
    .end array-data

    .line 79
    :array_27
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x1
        0x3
    .end array-data

    .line 80
    :array_28
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x1
        0x3
    .end array-data

    .line 81
    :array_29
    .array-data 4
        0x2
        0x3
        0x1
        0x3
        0x1
        0x1
    .end array-data

    .line 82
    :array_2a
    .array-data 4
        0x1
        0x1
        0x2
        0x1
        0x3
        0x3
    .end array-data

    .line 83
    :array_2b
    .array-data 4
        0x1
        0x1
        0x2
        0x3
        0x3
        0x1
    .end array-data

    .line 84
    :array_2c
    .array-data 4
        0x1
        0x3
        0x2
        0x1
        0x3
        0x1
    .end array-data

    .line 85
    :array_2d
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x2
        0x3
    .end array-data

    .line 86
    :array_2e
    .array-data 4
        0x1
        0x1
        0x3
        0x3
        0x2
        0x1
    .end array-data

    .line 87
    :array_2f
    .array-data 4
        0x1
        0x3
        0x3
        0x1
        0x2
        0x1
    .end array-data

    .line 88
    :array_30
    .array-data 4
        0x3
        0x1
        0x3
        0x1
        0x2
        0x1
    .end array-data

    .line 89
    :array_31
    .array-data 4
        0x2
        0x1
        0x1
        0x3
        0x3
        0x1
    .end array-data

    .line 90
    :array_32
    .array-data 4
        0x2
        0x3
        0x1
        0x1
        0x3
        0x1
    .end array-data

    .line 91
    :array_33
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x1
        0x3
    .end array-data

    .line 92
    :array_34
    .array-data 4
        0x2
        0x1
        0x3
        0x3
        0x1
        0x1
    .end array-data

    .line 93
    :array_35
    .array-data 4
        0x2
        0x1
        0x3
        0x1
        0x3
        0x1
    .end array-data

    .line 94
    :array_36
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x2
        0x3
    .end array-data

    .line 95
    :array_37
    .array-data 4
        0x3
        0x1
        0x1
        0x3
        0x2
        0x1
    .end array-data

    .line 96
    :array_38
    .array-data 4
        0x3
        0x3
        0x1
        0x1
        0x2
        0x1
    .end array-data

    .line 97
    :array_39
    .array-data 4
        0x3
        0x1
        0x2
        0x1
        0x1
        0x3
    .end array-data

    .line 98
    :array_3a
    .array-data 4
        0x3
        0x1
        0x2
        0x3
        0x1
        0x1
    .end array-data

    .line 99
    :array_3b
    .array-data 4
        0x3
        0x3
        0x2
        0x1
        0x1
        0x1
    .end array-data

    .line 100
    :array_3c
    .array-data 4
        0x3
        0x1
        0x4
        0x1
        0x1
        0x1
    .end array-data

    .line 101
    :array_3d
    .array-data 4
        0x2
        0x2
        0x1
        0x4
        0x1
        0x1
    .end array-data

    .line 102
    :array_3e
    .array-data 4
        0x4
        0x3
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 103
    :array_3f
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x2
        0x4
    .end array-data

    .line 104
    :array_40
    .array-data 4
        0x1
        0x1
        0x1
        0x4
        0x2
        0x2
    .end array-data

    .line 105
    :array_41
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x2
        0x4
    .end array-data

    .line 106
    :array_42
    .array-data 4
        0x1
        0x2
        0x1
        0x4
        0x2
        0x1
    .end array-data

    .line 107
    :array_43
    .array-data 4
        0x1
        0x4
        0x1
        0x1
        0x2
        0x2
    .end array-data

    .line 108
    :array_44
    .array-data 4
        0x1
        0x4
        0x1
        0x2
        0x2
        0x1
    .end array-data

    .line 109
    :array_45
    .array-data 4
        0x1
        0x1
        0x2
        0x2
        0x1
        0x4
    .end array-data

    .line 110
    :array_46
    .array-data 4
        0x1
        0x1
        0x2
        0x4
        0x1
        0x2
    .end array-data

    .line 111
    :array_47
    .array-data 4
        0x1
        0x2
        0x2
        0x1
        0x1
        0x4
    .end array-data

    .line 112
    :array_48
    .array-data 4
        0x1
        0x2
        0x2
        0x4
        0x1
        0x1
    .end array-data

    .line 113
    :array_49
    .array-data 4
        0x1
        0x4
        0x2
        0x1
        0x1
        0x2
    .end array-data

    .line 114
    :array_4a
    .array-data 4
        0x1
        0x4
        0x2
        0x2
        0x1
        0x1
    .end array-data

    .line 115
    :array_4b
    .array-data 4
        0x2
        0x4
        0x1
        0x2
        0x1
        0x1
    .end array-data

    .line 116
    :array_4c
    .array-data 4
        0x2
        0x2
        0x1
        0x1
        0x1
        0x4
    .end array-data

    .line 117
    :array_4d
    .array-data 4
        0x4
        0x1
        0x3
        0x1
        0x1
        0x1
    .end array-data

    .line 118
    :array_4e
    .array-data 4
        0x2
        0x4
        0x1
        0x1
        0x1
        0x2
    .end array-data

    .line 119
    :array_4f
    .array-data 4
        0x1
        0x3
        0x4
        0x1
        0x1
        0x1
    .end array-data

    .line 120
    :array_50
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x4
        0x2
    .end array-data

    .line 121
    :array_51
    .array-data 4
        0x1
        0x2
        0x1
        0x1
        0x4
        0x2
    .end array-data

    .line 122
    :array_52
    .array-data 4
        0x1
        0x2
        0x1
        0x2
        0x4
        0x1
    .end array-data

    .line 123
    :array_53
    .array-data 4
        0x1
        0x1
        0x4
        0x2
        0x1
        0x2
    .end array-data

    .line 124
    :array_54
    .array-data 4
        0x1
        0x2
        0x4
        0x1
        0x1
        0x2
    .end array-data

    .line 125
    :array_55
    .array-data 4
        0x1
        0x2
        0x4
        0x2
        0x1
        0x1
    .end array-data

    .line 126
    :array_56
    .array-data 4
        0x4
        0x1
        0x1
        0x2
        0x1
        0x2
    .end array-data

    .line 127
    :array_57
    .array-data 4
        0x4
        0x2
        0x1
        0x1
        0x1
        0x2
    .end array-data

    .line 128
    :array_58
    .array-data 4
        0x4
        0x2
        0x1
        0x2
        0x1
        0x1
    .end array-data

    .line 129
    :array_59
    .array-data 4
        0x2
        0x1
        0x2
        0x1
        0x4
        0x1
    .end array-data

    .line 130
    :array_5a
    .array-data 4
        0x2
        0x1
        0x4
        0x1
        0x2
        0x1
    .end array-data

    .line 131
    :array_5b
    .array-data 4
        0x4
        0x1
        0x2
        0x1
        0x2
        0x1
    .end array-data

    .line 132
    :array_5c
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x4
        0x3
    .end array-data

    .line 133
    :array_5d
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x4
        0x1
    .end array-data

    .line 134
    :array_5e
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x4
        0x1
    .end array-data

    .line 135
    :array_5f
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x1
        0x3
    .end array-data

    .line 136
    :array_60
    .array-data 4
        0x1
        0x1
        0x4
        0x3
        0x1
        0x1
    .end array-data

    .line 137
    :array_61
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    .line 138
    :array_62
    .array-data 4
        0x4
        0x1
        0x1
        0x3
        0x1
        0x1
    .end array-data

    .line 139
    :array_63
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x4
        0x1
    .end array-data

    .line 140
    :array_64
    .array-data 4
        0x1
        0x1
        0x4
        0x1
        0x3
        0x1
    .end array-data

    .line 141
    :array_65
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x4
        0x1
    .end array-data

    .line 142
    :array_66
    .array-data 4
        0x4
        0x1
        0x1
        0x1
        0x3
        0x1
    .end array-data

    .line 143
    :array_67
    .array-data 4
        0x2
        0x1
        0x1
        0x4
        0x1
        0x2
    .end array-data

    .line 144
    :array_68
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x1
        0x4
    .end array-data

    .line 145
    :array_69
    .array-data 4
        0x2
        0x1
        0x1
        0x2
        0x3
        0x2
    .end array-data

    .line 146
    :array_6a
    .array-data 4
        0x2
        0x3
        0x3
        0x1
        0x1
        0x1
        0x2
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    return-void
.end method

.method private static decodeCode(Lcom/google/zxing/common/BitArray;[II)I
    .locals 6
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .param p1, "counters"    # [I
    .param p2, "rowOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-static {p0, p2, p1}, Lcom/google/zxing/oned/Code128Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    .line 217
    const/16 v1, 0x40

    .line 218
    .local v1, "bestVariance":I
    const/4 v0, -0x1

    .line 219
    .local v0, "bestMatch":I
    const/4 v2, 0x0

    .local v2, "d":I
    :goto_0
    sget-object v5, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    array-length v5, v5

    if-lt v2, v5, :cond_0

    .line 228
    if-ltz v0, :cond_2

    .line 229
    return v0

    .line 220
    :cond_0
    sget-object v5, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v3, v5, v2

    .line 221
    .local v3, "pattern":[I
    const/16 v5, 0xb3

    invoke-static {p1, v3, v5}, Lcom/google/zxing/oned/Code128Reader;->patternMatchVariance([I[II)I

    move-result v4

    .line 222
    .local v4, "variance":I
    if-ge v4, v1, :cond_1

    .line 223
    move v1, v4

    .line 224
    move v0, v2

    .line 219
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 231
    .end local v3    # "pattern":[I
    .end local v4    # "variance":I
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private static findStartPattern(Lcom/google/zxing/common/BitArray;)[I
    .locals 15
    .param p0, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v11

    .line 171
    .local v11, "width":I
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v8

    .line 173
    .local v8, "rowOffset":I
    const/4 v2, 0x0

    .line 174
    .local v2, "counterPosition":I
    const/4 v12, 0x6

    new-array v3, v12, [I

    .line 175
    .local v3, "counters":[I
    move v7, v8

    .line 176
    .local v7, "patternStart":I
    const/4 v5, 0x0

    .line 177
    .local v5, "isWhite":Z
    array-length v6, v3

    .line 179
    .local v6, "patternLength":I
    move v4, v8

    .local v4, "i":I
    :goto_0
    if-lt v4, v11, :cond_0

    .line 211
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v12

    throw v12

    .line 180
    :cond_0
    invoke-virtual {p0, v4}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v12

    xor-int/2addr v12, v5

    if-eqz v12, :cond_1

    .line 181
    aget v12, v3, v2

    add-int/lit8 v12, v12, 0x1

    aput v12, v3, v2

    .line 179
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 183
    :cond_1
    add-int/lit8 v12, v6, -0x1

    if-ne v2, v12, :cond_5

    .line 184
    const/16 v1, 0x40

    .line 185
    .local v1, "bestVariance":I
    const/4 v0, -0x1

    .line 186
    .local v0, "bestMatch":I
    const/16 v9, 0x67

    .local v9, "startCode":I
    :goto_2
    const/16 v12, 0x69

    if-le v9, v12, :cond_2

    .line 195
    if-ltz v0, :cond_4

    .line 196
    const/4 v12, 0x0

    sub-int v13, v4, v7

    div-int/lit8 v13, v13, 0x2

    sub-int v13, v7, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    const/4 v13, 0x0

    invoke-virtual {p0, v12, v7, v13}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 197
    const/4 v12, 0x3

    new-array v12, v12, [I

    const/4 v13, 0x0

    aput v7, v12, v13

    const/4 v13, 0x1

    aput v4, v12, v13

    const/4 v13, 0x2

    aput v0, v12, v13

    return-object v12

    .line 187
    :cond_2
    sget-object v12, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v12, v12, v9

    .line 188
    const/16 v13, 0xb3

    .line 187
    invoke-static {v3, v12, v13}, Lcom/google/zxing/oned/Code128Reader;->patternMatchVariance([I[II)I

    move-result v10

    .line 189
    .local v10, "variance":I
    if-ge v10, v1, :cond_3

    .line 190
    move v1, v10

    .line 191
    move v0, v9

    .line 186
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 199
    .end local v10    # "variance":I
    :cond_4
    const/4 v12, 0x0

    aget v12, v3, v12

    const/4 v13, 0x1

    aget v13, v3, v13

    add-int/2addr v12, v13

    add-int/2addr v7, v12

    .line 200
    const/4 v12, 0x2

    const/4 v13, 0x0

    add-int/lit8 v14, v6, -0x2

    invoke-static {v3, v12, v3, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    add-int/lit8 v12, v6, -0x2

    const/4 v13, 0x0

    aput v13, v3, v12

    .line 202
    add-int/lit8 v12, v6, -0x1

    const/4 v13, 0x0

    aput v13, v3, v12

    .line 203
    add-int/lit8 v2, v2, -0x1

    .line 207
    .end local v0    # "bestMatch":I
    .end local v1    # "bestVariance":I
    .end local v9    # "startCode":I
    :goto_3
    const/4 v12, 0x1

    aput v12, v3, v2

    .line 208
    if-eqz v5, :cond_6

    const/4 v5, 0x0

    :goto_4
    goto :goto_1

    .line 205
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 208
    :cond_6
    const/4 v5, 0x1

    goto :goto_4
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .locals 34
    .param p1, "rowNumber"    # I
    .param p2, "row"    # Lcom/google/zxing/common/BitArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    .prologue
    .line 239
    .local p3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-static/range {p2 .. p2}, Lcom/google/zxing/oned/Code128Reader;->findStartPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v26

    .line 240
    .local v26, "startPatternInfo":[I
    const/16 v28, 0x2

    aget v25, v26, v28

    .line 242
    .local v25, "startCode":I
    packed-switch v25, :pswitch_data_0

    .line 253
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v28

    throw v28

    .line 244
    :pswitch_0
    const/16 v7, 0x65

    .line 256
    .local v7, "codeSet":I
    :goto_0
    const/4 v10, 0x0

    .line 257
    .local v10, "done":Z
    const/4 v12, 0x0

    .line 259
    .local v12, "isNextShifted":Z
    new-instance v22, Ljava/lang/StringBuilder;

    const/16 v28, 0x14

    move-object/from16 v0, v22

    move/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 260
    .local v22, "result":Ljava/lang/StringBuilder;
    new-instance v20, Ljava/util/ArrayList;

    const/16 v28, 0x14

    move-object/from16 v0, v20

    move/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 262
    .local v20, "rawCodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    const/16 v28, 0x0

    aget v15, v26, v28

    .line 263
    .local v15, "lastStart":I
    const/16 v28, 0x1

    aget v18, v26, v28

    .line 264
    .local v18, "nextStart":I
    const/16 v28, 0x6

    move/from16 v0, v28

    new-array v9, v0, [I

    .line 266
    .local v9, "counters":[I
    const/4 v14, 0x0

    .line 267
    .local v14, "lastCode":I
    const/4 v6, 0x0

    .line 268
    .local v6, "code":I
    move/from16 v5, v25

    .line 269
    .local v5, "checksumTotal":I
    const/16 v17, 0x0

    .line 270
    .local v17, "multiplier":I
    const/4 v13, 0x1

    .line 272
    .local v13, "lastCharacterWasPrintable":Z
    :cond_0
    :goto_1
    if-eqz v10, :cond_1

    .line 414
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v18

    .line 416
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v28

    sub-int v29, v18, v15

    div-int/lit8 v29, v29, 0x2

    add-int v29, v29, v18

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->min(II)I

    move-result v28

    .line 417
    const/16 v29, 0x0

    .line 415
    move-object/from16 v0, p2

    move/from16 v1, v18

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/zxing/common/BitArray;->isRange(IIZ)Z

    move-result v28

    .line 417
    if-nez v28, :cond_e

    .line 418
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v28

    throw v28

    .line 247
    .end local v5    # "checksumTotal":I
    .end local v6    # "code":I
    .end local v7    # "codeSet":I
    .end local v9    # "counters":[I
    .end local v10    # "done":Z
    .end local v12    # "isNextShifted":Z
    .end local v13    # "lastCharacterWasPrintable":Z
    .end local v14    # "lastCode":I
    .end local v15    # "lastStart":I
    .end local v17    # "multiplier":I
    .end local v18    # "nextStart":I
    .end local v20    # "rawCodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    .end local v22    # "result":Ljava/lang/StringBuilder;
    :pswitch_1
    const/16 v7, 0x64

    .line 248
    .restart local v7    # "codeSet":I
    goto :goto_0

    .line 250
    .end local v7    # "codeSet":I
    :pswitch_2
    const/16 v7, 0x63

    .line 251
    .restart local v7    # "codeSet":I
    goto :goto_0

    .line 274
    .restart local v5    # "checksumTotal":I
    .restart local v6    # "code":I
    .restart local v9    # "counters":[I
    .restart local v10    # "done":Z
    .restart local v12    # "isNextShifted":Z
    .restart local v13    # "lastCharacterWasPrintable":Z
    .restart local v14    # "lastCode":I
    .restart local v15    # "lastStart":I
    .restart local v17    # "multiplier":I
    .restart local v18    # "nextStart":I
    .restart local v20    # "rawCodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    .restart local v22    # "result":Ljava/lang/StringBuilder;
    :cond_1
    move/from16 v27, v12

    .line 275
    .local v27, "unshift":Z
    const/4 v12, 0x0

    .line 278
    move v14, v6

    .line 281
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-static {v0, v9, v1}, Lcom/google/zxing/oned/Code128Reader;->decodeCode(Lcom/google/zxing/common/BitArray;[II)I

    move-result v6

    .line 283
    int-to-byte v0, v6

    move/from16 v28, v0

    invoke-static/range {v28 .. v28}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v28

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    const/16 v28, 0x6a

    move/from16 v0, v28

    if-eq v6, v0, :cond_2

    .line 287
    const/4 v13, 0x1

    .line 291
    :cond_2
    const/16 v28, 0x6a

    move/from16 v0, v28

    if-eq v6, v0, :cond_3

    .line 292
    add-int/lit8 v17, v17, 0x1

    .line 293
    mul-int v28, v17, v6

    add-int v5, v5, v28

    .line 297
    :cond_3
    move/from16 v15, v18

    .line 298
    array-length v0, v9

    move/from16 v29, v0

    const/16 v28, 0x0

    :goto_2
    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_4

    .line 303
    packed-switch v6, :pswitch_data_1

    .line 310
    packed-switch v7, :pswitch_data_2

    .line 405
    :goto_3
    :pswitch_3
    if-eqz v27, :cond_0

    .line 406
    const/16 v28, 0x65

    move/from16 v0, v28

    if-ne v7, v0, :cond_d

    const/16 v7, 0x64

    :goto_4
    goto :goto_1

    .line 298
    :cond_4
    aget v8, v9, v28

    .line 299
    .local v8, "counter":I
    add-int v18, v18, v8

    .line 298
    add-int/lit8 v28, v28, 0x1

    goto :goto_2

    .line 307
    .end local v8    # "counter":I
    :pswitch_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v28

    throw v28

    .line 313
    :pswitch_5
    const/16 v28, 0x40

    move/from16 v0, v28

    if-ge v6, v0, :cond_5

    .line 314
    add-int/lit8 v28, v6, 0x20

    move/from16 v0, v28

    int-to-char v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v22

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 315
    :cond_5
    const/16 v28, 0x60

    move/from16 v0, v28

    if-ge v6, v0, :cond_6

    .line 316
    add-int/lit8 v28, v6, -0x40

    move/from16 v0, v28

    int-to-char v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v22

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 320
    :cond_6
    const/16 v28, 0x6a

    move/from16 v0, v28

    if-eq v6, v0, :cond_7

    .line 321
    const/4 v13, 0x0

    .line 323
    :cond_7
    packed-switch v6, :pswitch_data_3

    :pswitch_6
    goto :goto_3

    .line 331
    :pswitch_7
    const/4 v12, 0x1

    .line 332
    const/16 v7, 0x64

    .line 333
    goto :goto_3

    .line 335
    :pswitch_8
    const/16 v7, 0x64

    .line 336
    goto :goto_3

    .line 338
    :pswitch_9
    const/16 v7, 0x63

    .line 339
    goto :goto_3

    .line 341
    :pswitch_a
    const/4 v10, 0x1

    goto :goto_3

    .line 347
    :pswitch_b
    const/16 v28, 0x60

    move/from16 v0, v28

    if-ge v6, v0, :cond_8

    .line 348
    add-int/lit8 v28, v6, 0x20

    move/from16 v0, v28

    int-to-char v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v22

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 350
    :cond_8
    const/16 v28, 0x6a

    move/from16 v0, v28

    if-eq v6, v0, :cond_9

    .line 351
    const/4 v13, 0x0

    .line 353
    :cond_9
    packed-switch v6, :pswitch_data_4

    :pswitch_c
    goto :goto_3

    .line 361
    :pswitch_d
    const/4 v12, 0x1

    .line 362
    const/16 v7, 0x65

    .line 363
    goto :goto_3

    .line 365
    :pswitch_e
    const/16 v7, 0x65

    .line 366
    goto :goto_3

    .line 368
    :pswitch_f
    const/16 v7, 0x63

    .line 369
    goto/16 :goto_3

    .line 371
    :pswitch_10
    const/4 v10, 0x1

    goto/16 :goto_3

    .line 377
    :pswitch_11
    const/16 v28, 0x64

    move/from16 v0, v28

    if-ge v6, v0, :cond_b

    .line 378
    const/16 v28, 0xa

    move/from16 v0, v28

    if-ge v6, v0, :cond_a

    .line 379
    const/16 v28, 0x30

    move-object/from16 v0, v22

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 381
    :cond_a
    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 383
    :cond_b
    const/16 v28, 0x6a

    move/from16 v0, v28

    if-eq v6, v0, :cond_c

    .line 384
    const/4 v13, 0x0

    .line 386
    :cond_c
    packed-switch v6, :pswitch_data_5

    :pswitch_12
    goto/16 :goto_3

    .line 394
    :pswitch_13
    const/16 v7, 0x64

    .line 395
    goto/16 :goto_3

    .line 391
    :pswitch_14
    const/16 v7, 0x65

    .line 392
    goto/16 :goto_3

    .line 397
    :pswitch_15
    const/4 v10, 0x1

    goto/16 :goto_3

    .line 406
    :cond_d
    const/16 v7, 0x65

    goto/16 :goto_4

    .line 422
    .end local v27    # "unshift":Z
    :cond_e
    mul-int v28, v17, v14

    sub-int v5, v5, v28

    .line 424
    rem-int/lit8 v28, v5, 0x67

    move/from16 v0, v28

    if-eq v0, v14, :cond_f

    .line 425
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v28

    throw v28

    .line 429
    :cond_f
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->length()I

    move-result v23

    .line 430
    .local v23, "resultLength":I
    if-nez v23, :cond_10

    .line 432
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v28

    throw v28

    .line 437
    :cond_10
    if-lez v23, :cond_11

    if-eqz v13, :cond_11

    .line 438
    const/16 v28, 0x63

    move/from16 v0, v28

    if-ne v7, v0, :cond_12

    .line 439
    add-int/lit8 v28, v23, -0x2

    move-object/from16 v0, v22

    move/from16 v1, v28

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 445
    :cond_11
    :goto_5
    const/16 v28, 0x1

    aget v28, v26, v28

    const/16 v29, 0x0

    aget v29, v26, v29

    add-int v28, v28, v29

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x40000000    # 2.0f

    div-float v16, v28, v29

    .line 446
    .local v16, "left":F
    add-int v28, v18, v15

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x40000000    # 2.0f

    div-float v24, v28, v29

    .line 448
    .local v24, "right":F
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v21

    .line 449
    .local v21, "rawCodesSize":I
    move/from16 v0, v21

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 450
    .local v19, "rawBytes":[B
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_6
    move/from16 v0, v21

    if-lt v11, v0, :cond_13

    .line 454
    new-instance v28, Lcom/google/zxing/Result;

    .line 455
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 457
    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    .line 458
    new-instance v32, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v32

    move/from16 v1, v16

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v32, v30, v31

    const/16 v31, 0x1

    .line 459
    new-instance v32, Lcom/google/zxing/ResultPoint;

    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v32

    move/from16 v1, v24

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v32, v30, v31

    .line 460
    sget-object v31, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    .line 454
    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v19

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v28

    .line 441
    .end local v11    # "i":I
    .end local v16    # "left":F
    .end local v19    # "rawBytes":[B
    .end local v21    # "rawCodesSize":I
    .end local v24    # "right":F
    :cond_12
    add-int/lit8 v28, v23, -0x1

    move-object/from16 v0, v22

    move/from16 v1, v28

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 451
    .restart local v11    # "i":I
    .restart local v16    # "left":F
    .restart local v19    # "rawBytes":[B
    .restart local v21    # "rawCodesSize":I
    .restart local v24    # "right":F
    :cond_13
    move-object/from16 v0, v20

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/Byte;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Byte;->byteValue()B

    move-result v28

    aput-byte v28, v19, v11

    .line 450
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 242
    :pswitch_data_0
    .packed-switch 0x67
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 303
    :pswitch_data_1
    .packed-switch 0x67
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch

    .line 310
    :pswitch_data_2
    .packed-switch 0x63
        :pswitch_11
        :pswitch_b
        :pswitch_5
    .end packed-switch

    .line 323
    :pswitch_data_3
    .packed-switch 0x60
        :pswitch_3
        :pswitch_3
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_a
    .end packed-switch

    .line 353
    :pswitch_data_4
    .packed-switch 0x60
        :pswitch_3
        :pswitch_3
        :pswitch_d
        :pswitch_f
        :pswitch_3
        :pswitch_e
        :pswitch_3
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_10
    .end packed-switch

    .line 386
    :pswitch_data_5
    .packed-switch 0x64
        :pswitch_13
        :pswitch_14
        :pswitch_3
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_15
    .end packed-switch
.end method
