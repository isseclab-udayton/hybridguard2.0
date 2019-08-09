.class public final Lcom/google/zxing/aztec/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# static fields
.field private static final BINARY:I = 0x5

.field private static final DIGIT:I = 0x3

.field private static final DIGIT_TABLE:[Ljava/lang/String;

.field private static final LOWER:I = 0x1

.field private static final LOWER_TABLE:[Ljava/lang/String;

.field private static final MIXED:I = 0x2

.field private static final MIXED_TABLE:[Ljava/lang/String;

.field private static final NB_BITS:[I

.field private static final NB_BITS_COMPACT:[I

.field private static final NB_DATABLOCK:[I

.field private static final NB_DATABLOCK_COMPACT:[I

.field private static final PUNCT:I = 0x4

.field private static final PUNCT_TABLE:[Ljava/lang/String;

.field private static final UPPER:I

.field private static final UPPER_TABLE:[Ljava/lang/String;


# instance fields
.field private codewordSize:I

.field private ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

.field private invertedBitCount:I

.field private numCodewords:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 42
    new-array v0, v7, [I

    .line 43
    const/16 v1, 0x68

    aput v1, v0, v3

    const/16 v1, 0xf0

    aput v1, v0, v4

    const/16 v1, 0x198

    aput v1, v0, v5

    const/16 v1, 0x260

    aput v1, v0, v6

    .line 42
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS_COMPACT:[I

    .line 46
    const/16 v0, 0x21

    new-array v0, v0, [I

    .line 47
    const/16 v1, 0x80

    aput v1, v0, v3

    const/16 v1, 0x120

    aput v1, v0, v4

    const/16 v1, 0x1e0

    aput v1, v0, v5

    const/16 v1, 0x2c0

    aput v1, v0, v6

    const/16 v1, 0x3c0

    aput v1, v0, v7

    const/4 v1, 0x6

    const/16 v2, 0x4e0

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x620

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x780

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x900

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0xaa0

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0xc60

    aput v2, v0, v1

    const/16 v1, 0xc

    const/16 v2, 0xe40

    aput v2, v0, v1

    const/16 v1, 0xd

    const/16 v2, 0x1040

    aput v2, v0, v1

    const/16 v1, 0xe

    const/16 v2, 0x1260

    aput v2, v0, v1

    const/16 v1, 0xf

    const/16 v2, 0x14a0

    aput v2, v0, v1

    const/16 v1, 0x10

    const/16 v2, 0x1700

    aput v2, v0, v1

    const/16 v1, 0x11

    const/16 v2, 0x1980

    aput v2, v0, v1

    const/16 v1, 0x12

    .line 48
    const/16 v2, 0x1c20

    aput v2, v0, v1

    const/16 v1, 0x13

    const/16 v2, 0x1ee0

    aput v2, v0, v1

    const/16 v1, 0x14

    const/16 v2, 0x21c0

    aput v2, v0, v1

    const/16 v1, 0x15

    const/16 v2, 0x24c0

    aput v2, v0, v1

    const/16 v1, 0x16

    const/16 v2, 0x27e0

    aput v2, v0, v1

    const/16 v1, 0x17

    const/16 v2, 0x2b20

    aput v2, v0, v1

    const/16 v1, 0x18

    const/16 v2, 0x2e80

    aput v2, v0, v1

    const/16 v1, 0x19

    const/16 v2, 0x3200

    aput v2, v0, v1

    const/16 v1, 0x1a

    const/16 v2, 0x35a0

    aput v2, v0, v1

    const/16 v1, 0x1b

    const/16 v2, 0x3960

    aput v2, v0, v1

    const/16 v1, 0x1c

    const/16 v2, 0x3d40

    aput v2, v0, v1

    const/16 v1, 0x1d

    const/16 v2, 0x4140

    aput v2, v0, v1

    const/16 v1, 0x1e

    const/16 v2, 0x4560

    aput v2, v0, v1

    const/16 v1, 0x1f

    const/16 v2, 0x49a0

    aput v2, v0, v1

    const/16 v1, 0x20

    const/16 v2, 0x4e00

    aput v2, v0, v1

    .line 46
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS:[I

    .line 51
    new-array v0, v7, [I

    .line 52
    const/16 v1, 0x11

    aput v1, v0, v3

    const/16 v1, 0x28

    aput v1, v0, v4

    const/16 v1, 0x33

    aput v1, v0, v5

    const/16 v1, 0x4c

    aput v1, v0, v6

    .line 51
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK_COMPACT:[I

    .line 55
    const/16 v0, 0x21

    new-array v0, v0, [I

    .line 56
    const/16 v1, 0x15

    aput v1, v0, v3

    const/16 v1, 0x30

    aput v1, v0, v4

    const/16 v1, 0x3c

    aput v1, v0, v5

    const/16 v1, 0x58

    aput v1, v0, v6

    const/16 v1, 0x78

    aput v1, v0, v7

    const/4 v1, 0x6

    const/16 v2, 0x9c

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0xc4

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0xf0

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0xe6

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x110

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0x13c

    aput v2, v0, v1

    const/16 v1, 0xc

    const/16 v2, 0x16c

    aput v2, v0, v1

    const/16 v1, 0xd

    const/16 v2, 0x1a0

    aput v2, v0, v1

    const/16 v1, 0xe

    const/16 v2, 0x1d6

    aput v2, v0, v1

    const/16 v1, 0xf

    const/16 v2, 0x210

    aput v2, v0, v1

    const/16 v1, 0x10

    const/16 v2, 0x24c

    aput v2, v0, v1

    const/16 v1, 0x11

    const/16 v2, 0x28c

    aput v2, v0, v1

    const/16 v1, 0x12

    const/16 v2, 0x2d0

    aput v2, v0, v1

    const/16 v1, 0x13

    const/16 v2, 0x316

    aput v2, v0, v1

    const/16 v1, 0x14

    const/16 v2, 0x360

    aput v2, v0, v1

    const/16 v1, 0x15

    .line 57
    const/16 v2, 0x3ac

    aput v2, v0, v1

    const/16 v1, 0x16

    const/16 v2, 0x3fc

    aput v2, v0, v1

    const/16 v1, 0x17

    const/16 v2, 0x398

    aput v2, v0, v1

    const/16 v1, 0x18

    const/16 v2, 0x3e0

    aput v2, v0, v1

    const/16 v1, 0x19

    const/16 v2, 0x42a

    aput v2, v0, v1

    const/16 v1, 0x1a

    const/16 v2, 0x478

    aput v2, v0, v1

    const/16 v1, 0x1b

    const/16 v2, 0x4c8

    aput v2, v0, v1

    const/16 v1, 0x1c

    const/16 v2, 0x51a

    aput v2, v0, v1

    const/16 v1, 0x1d

    const/16 v2, 0x570

    aput v2, v0, v1

    const/16 v1, 0x1e

    const/16 v2, 0x5c8

    aput v2, v0, v1

    const/16 v1, 0x1f

    const/16 v2, 0x622

    aput v2, v0, v1

    const/16 v1, 0x20

    const/16 v2, 0x680

    aput v2, v0, v1

    .line 55
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK:[I

    .line 60
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 61
    const-string v2, "CTRL_PS"

    aput-object v2, v0, v1

    const-string v1, " "

    aput-object v1, v0, v3

    const-string v1, "A"

    aput-object v1, v0, v4

    const-string v1, "B"

    aput-object v1, v0, v5

    const-string v1, "C"

    aput-object v1, v0, v6

    const-string v1, "D"

    aput-object v1, v0, v7

    const/4 v1, 0x6

    const-string v2, "E"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "F"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "G"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "H"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "I"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "J"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "K"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "L"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "M"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "N"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "O"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "P"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 62
    const-string v2, "Q"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "R"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "S"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "T"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "U"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "V"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "W"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "X"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "Y"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "Z"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "CTRL_LL"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "CTRL_ML"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "CTRL_DL"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "CTRL_BS"

    aput-object v2, v0, v1

    .line 60
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    .line 65
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 66
    const-string v2, "CTRL_PS"

    aput-object v2, v0, v1

    const-string v1, " "

    aput-object v1, v0, v3

    const-string v1, "a"

    aput-object v1, v0, v4

    const-string v1, "b"

    aput-object v1, v0, v5

    const-string v1, "c"

    aput-object v1, v0, v6

    const-string v1, "d"

    aput-object v1, v0, v7

    const/4 v1, 0x6

    const-string v2, "e"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "f"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "g"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "h"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "i"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "j"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "k"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "l"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "m"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "n"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "o"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "p"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 67
    const-string v2, "q"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "r"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "s"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "t"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "u"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "v"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "w"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "x"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "y"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "z"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "CTRL_US"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "CTRL_ML"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "CTRL_DL"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "CTRL_BS"

    aput-object v2, v0, v1

    .line 65
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    .line 70
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 71
    const-string v2, "CTRL_PS"

    aput-object v2, v0, v1

    const-string v1, " "

    aput-object v1, v0, v3

    const-string v1, "\u0001"

    aput-object v1, v0, v4

    const-string v1, "\u0002"

    aput-object v1, v0, v5

    const-string v1, "\u0003"

    aput-object v1, v0, v6

    const-string v1, "\u0004"

    aput-object v1, v0, v7

    const/4 v1, 0x6

    const-string v2, "\u0005"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "\u0006"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "\u0007"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "\u0008"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "\t"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "\n"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 72
    const-string v2, "\u000b"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "\u000c"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "\r"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "\u001b"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "\u001c"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "\u001d"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "\u001e"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "\u001f"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "@"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "\\"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "^"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "_"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 73
    const-string v2, "`"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "|"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "~"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "\u007f"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "CTRL_LL"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "CTRL_UL"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "CTRL_PL"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "CTRL_BS"

    aput-object v2, v0, v1

    .line 70
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    .line 76
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 77
    const-string v2, ""

    aput-object v2, v0, v1

    const-string v1, "\r"

    aput-object v1, v0, v3

    const-string v1, "\r\n"

    aput-object v1, v0, v4

    const-string v1, ". "

    aput-object v1, v0, v5

    const-string v1, ", "

    aput-object v1, v0, v6

    const-string v1, ": "

    aput-object v1, v0, v7

    const/4 v1, 0x6

    const-string v2, "!"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "\""

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "#"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "$"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "%"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "&"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "\'"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "("

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, ")"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 78
    const-string v2, "*"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "+"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, ","

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "-"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "."

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "/"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, ":"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, ";"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "<"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "="

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, ">"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "?"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "["

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "]"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "{"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "}"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "CTRL_UL"

    aput-object v2, v0, v1

    .line 76
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    .line 81
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 82
    const-string v2, "CTRL_PS"

    aput-object v2, v0, v1

    const-string v1, " "

    aput-object v1, v0, v3

    const-string v1, "0"

    aput-object v1, v0, v4

    const-string v1, "1"

    aput-object v1, v0, v5

    const-string v1, "2"

    aput-object v1, v0, v6

    const-string v1, "3"

    aput-object v1, v0, v7

    const/4 v1, 0x6

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "5"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "6"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, ","

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "."

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "CTRL_UL"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "CTRL_US"

    aput-object v2, v0, v1

    .line 81
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private correctBits([Z)[Z
    .locals 18
    .param p1, "rawbits"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 258
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v15}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v15

    const/16 v16, 0x2

    move/from16 v0, v16

    if-gt v15, v0, :cond_0

    .line 259
    const/4 v15, 0x6

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    .line 260
    sget-object v5, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .line 272
    .local v5, "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v15}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbDatablocks()I

    move-result v8

    .line 276
    .local v8, "numDataCodewords":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v15}, Lcom/google/zxing/aztec/AztecDetectorResult;->isCompact()Z

    move-result v15

    if-eqz v15, :cond_3

    .line 277
    sget-object v15, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS_COMPACT:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v16

    aget v15, v15, v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    move/from16 v17, v0

    mul-int v16, v16, v17

    sub-int v10, v15, v16

    .line 278
    .local v10, "offset":I
    sget-object v15, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK_COMPACT:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v16

    aget v15, v15, v16

    sub-int v9, v15, v8

    .line 284
    .local v9, "numECCodewords":I
    :goto_1
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    new-array v3, v15, [I

    .line 285
    .local v3, "dataWords":[I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    if-lt v6, v15, :cond_4

    .line 300
    :try_start_0
    new-instance v11, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-direct {v11, v5}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    .line 301
    .local v11, "rsDecoder":Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
    invoke-virtual {v11, v3, v9}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_0
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    const/4 v10, 0x0

    .line 307
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->invertedBitCount:I

    .line 309
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    mul-int/2addr v15, v8

    new-array v2, v15, [Z

    .line 310
    .local v2, "correctedBits":[Z
    const/4 v6, 0x0

    :goto_3
    if-lt v6, v8, :cond_7

    .line 348
    return-object v2

    .line 261
    .end local v2    # "correctedBits":[Z
    .end local v3    # "dataWords":[I
    .end local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    .end local v6    # "i":I
    .end local v8    # "numDataCodewords":I
    .end local v9    # "numECCodewords":I
    .end local v10    # "offset":I
    .end local v11    # "rsDecoder":Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v15}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v15

    const/16 v16, 0x8

    move/from16 v0, v16

    if-gt v15, v0, :cond_1

    .line 262
    const/16 v15, 0x8

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    .line 263
    sget-object v5, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .restart local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    goto :goto_0

    .line 264
    .end local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v15}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v15

    const/16 v16, 0x16

    move/from16 v0, v16

    if-gt v15, v0, :cond_2

    .line 265
    const/16 v15, 0xa

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    .line 266
    sget-object v5, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .restart local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    goto/16 :goto_0

    .line 268
    .end local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    :cond_2
    const/16 v15, 0xc

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    .line 269
    sget-object v5, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    .restart local v5    # "gf":Lcom/google/zxing/common/reedsolomon/GenericGF;
    goto/16 :goto_0

    .line 280
    .restart local v8    # "numDataCodewords":I
    :cond_3
    sget-object v15, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v16

    aget v15, v15, v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    move/from16 v17, v0

    mul-int v16, v16, v17

    sub-int v10, v15, v16

    .line 281
    .restart local v10    # "offset":I
    sget-object v15, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v16

    aget v15, v15, v16

    sub-int v9, v15, v8

    .restart local v9    # "numECCodewords":I
    goto/16 :goto_1

    .line 286
    .restart local v3    # "dataWords":[I
    .restart local v6    # "i":I
    :cond_4
    const/4 v4, 0x1

    .line 287
    .local v4, "flag":I
    const/4 v7, 0x1

    .local v7, "j":I
    :goto_4
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    if-le v7, v15, :cond_5

    .line 285
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_2

    .line 288
    :cond_5
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    mul-int/2addr v15, v6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    move/from16 v16, v0

    add-int v15, v15, v16

    sub-int/2addr v15, v7

    add-int/2addr v15, v10

    aget-boolean v15, p1, v15

    if-eqz v15, :cond_6

    .line 289
    aget v15, v3, v6

    add-int/2addr v15, v4

    aput v15, v3, v6

    .line 291
    :cond_6
    shl-int/lit8 v4, v4, 0x1

    .line 287
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 302
    .end local v4    # "flag":I
    .end local v7    # "j":I
    :catch_0
    move-exception v12

    .line 303
    .local v12, "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v15

    throw v15

    .line 312
    .end local v12    # "rse":Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
    .restart local v2    # "correctedBits":[Z
    .restart local v11    # "rsDecoder":Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
    :cond_7
    const/4 v13, 0x0

    .line 313
    .local v13, "seriesColor":Z
    const/4 v14, 0x0

    .line 314
    .local v14, "seriesCount":I
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    shl-int v4, v15, v16

    .line 316
    .restart local v4    # "flag":I
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_5
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    if-lt v7, v15, :cond_8

    .line 310
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_3

    .line 318
    :cond_8
    aget v15, v3, v6

    and-int/2addr v15, v4

    if-ne v15, v4, :cond_9

    const/4 v1, 0x1

    .line 320
    .local v1, "color":Z
    :goto_6
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    add-int/lit8 v15, v15, -0x1

    if-ne v14, v15, :cond_b

    .line 322
    if-ne v1, v13, :cond_a

    .line 324
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v15

    throw v15

    .line 318
    .end local v1    # "color":Z
    :cond_9
    const/4 v1, 0x0

    goto :goto_6

    .line 327
    .restart local v1    # "color":Z
    :cond_a
    const/4 v13, 0x0

    .line 328
    const/4 v14, 0x0

    .line 329
    add-int/lit8 v10, v10, 0x1

    .line 330
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->invertedBitCount:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->invertedBitCount:I

    .line 344
    :goto_7
    ushr-int/lit8 v4, v4, 0x1

    .line 316
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 333
    :cond_b
    if-ne v13, v1, :cond_c

    .line 334
    add-int/lit8 v14, v14, 0x1

    .line 340
    :goto_8
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    mul-int/2addr v15, v6

    add-int/2addr v15, v7

    sub-int/2addr v15, v10

    aput-boolean v1, v2, v15

    goto :goto_7

    .line 336
    :cond_c
    const/4 v14, 0x1

    .line 337
    move v13, v1

    goto :goto_8
.end method

.method private extractBits(Lcom/google/zxing/common/BitMatrix;)[Z
    .locals 10
    .param p1, "matrix"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 361
    iget-object v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v7}, Lcom/google/zxing/aztec/AztecDetectorResult;->isCompact()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 362
    iget-object v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v7}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v7

    sget-object v8, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS_COMPACT:[I

    array-length v8, v8

    if-le v7, v8, :cond_0

    .line 363
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 365
    :cond_0
    sget-object v7, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS_COMPACT:[I

    iget-object v8, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v8}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v8

    aget v7, v7, v8

    new-array v4, v7, [Z

    .line 366
    .local v4, "rawbits":[Z
    sget-object v7, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK_COMPACT:[I

    iget-object v8, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v8}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v8

    aget v7, v7, v8

    iput v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    .line 375
    :goto_0
    iget-object v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v7}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v2

    .line 376
    .local v2, "layer":I
    iget v6, p1, Lcom/google/zxing/common/BitMatrix;->height:I

    .line 377
    .local v6, "size":I
    const/4 v5, 0x0

    .line 378
    .local v5, "rawbitsOffset":I
    const/4 v3, 0x0

    .line 380
    .local v3, "matrixOffset":I
    :goto_1
    if-nez v2, :cond_3

    .line 402
    return-object v4

    .line 368
    .end local v2    # "layer":I
    .end local v3    # "matrixOffset":I
    .end local v4    # "rawbits":[Z
    .end local v5    # "rawbitsOffset":I
    .end local v6    # "size":I
    :cond_1
    iget-object v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v7}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v7

    sget-object v8, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS:[I

    array-length v8, v8

    if-le v7, v8, :cond_2

    .line 369
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v7

    throw v7

    .line 371
    :cond_2
    sget-object v7, Lcom/google/zxing/aztec/decoder/Decoder;->NB_BITS:[I

    iget-object v8, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v8}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v8

    aget v7, v7, v8

    new-array v4, v7, [Z

    .line 372
    .restart local v4    # "rawbits":[Z
    sget-object v7, Lcom/google/zxing/aztec/decoder/Decoder;->NB_DATABLOCK:[I

    iget-object v8, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v8}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v8

    aget v7, v7, v8

    iput v7, p0, Lcom/google/zxing/aztec/decoder/Decoder;->numCodewords:I

    goto :goto_0

    .line 382
    .restart local v2    # "layer":I
    .restart local v3    # "matrixOffset":I
    .restart local v5    # "rawbitsOffset":I
    .restart local v6    # "size":I
    :cond_3
    const/4 v0, 0x0

    .line 383
    .local v0, "flip":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    mul-int/lit8 v7, v6, 0x2

    add-int/lit8 v7, v7, -0x4

    if-lt v1, v7, :cond_4

    .line 389
    const/4 v0, 0x0

    .line 390
    mul-int/lit8 v7, v6, 0x2

    add-int/lit8 v1, v7, 0x1

    :goto_3
    const/4 v7, 0x5

    if-gt v1, v7, :cond_5

    .line 396
    add-int/lit8 v3, v3, 0x2

    .line 397
    mul-int/lit8 v7, v6, 0x8

    add-int/lit8 v7, v7, -0x10

    add-int/2addr v5, v7

    .line 398
    add-int/lit8 v2, v2, -0x1

    .line 399
    add-int/lit8 v6, v6, -0x4

    goto :goto_1

    .line 384
    :cond_4
    add-int v7, v5, v1

    add-int v8, v3, v0

    div-int/lit8 v9, v1, 0x2

    add-int/2addr v9, v3

    invoke-virtual {p1, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    aput-boolean v8, v4, v7

    .line 385
    mul-int/lit8 v7, v6, 0x2

    add-int/2addr v7, v5

    add-int/lit8 v7, v7, -0x4

    add-int/2addr v7, v1

    div-int/lit8 v8, v1, 0x2

    add-int/2addr v8, v3

    add-int v9, v3, v6

    add-int/lit8 v9, v9, -0x1

    sub-int/2addr v9, v0

    invoke-virtual {p1, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    aput-boolean v8, v4, v7

    .line 386
    add-int/lit8 v7, v0, 0x1

    rem-int/lit8 v0, v7, 0x2

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 391
    :cond_5
    mul-int/lit8 v7, v6, 0x4

    add-int/2addr v7, v5

    add-int/lit8 v7, v7, -0x8

    mul-int/lit8 v8, v6, 0x2

    sub-int/2addr v8, v1

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x1

    add-int v8, v3, v6

    add-int/lit8 v8, v8, -0x1

    sub-int/2addr v8, v0

    div-int/lit8 v9, v1, 0x2

    add-int/2addr v9, v3

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p1, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    aput-boolean v8, v4, v7

    .line 392
    mul-int/lit8 v7, v6, 0x6

    add-int/2addr v7, v5

    add-int/lit8 v7, v7, -0xc

    mul-int/lit8 v8, v6, 0x2

    sub-int/2addr v8, v1

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x1

    div-int/lit8 v8, v1, 0x2

    add-int/2addr v8, v3

    add-int/lit8 v8, v8, -0x1

    add-int v9, v3, v0

    invoke-virtual {p1, v8, v9}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    aput-boolean v8, v4, v7

    .line 393
    add-int/lit8 v7, v0, 0x1

    rem-int/lit8 v0, v7, 0x2

    .line 390
    add-int/lit8 v1, v1, -0x1

    goto :goto_3
.end method

.method private static getCharacter(II)Ljava/lang/String;
    .locals 1
    .param p0, "table"    # I
    .param p1, "code"    # I

    .prologue
    .line 232
    packed-switch p0, :pswitch_data_0

    .line 244
    const-string v0, ""

    :goto_0
    return-object v0

    .line 234
    :pswitch_0
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 236
    :pswitch_1
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 238
    :pswitch_2
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 240
    :pswitch_3
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 242
    :pswitch_4
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 232
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private getEncodedData([Z)Ljava/lang/String;
    .locals 14
    .param p1, "correctedBits"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x8

    .line 117
    iget v11, p0, Lcom/google/zxing/aztec/decoder/Decoder;->codewordSize:I

    iget-object v12, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v12}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbDatablocks()I

    move-result v12

    mul-int/2addr v11, v12

    iget v12, p0, Lcom/google/zxing/aztec/decoder/Decoder;->invertedBitCount:I

    sub-int v2, v11, v12

    .line 118
    .local v2, "endIndex":I
    array-length v11, p1

    if-le v2, v11, :cond_0

    .line 119
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v11

    throw v11

    .line 122
    :cond_0
    const/4 v3, 0x0

    .line 123
    .local v3, "lastTable":I
    const/4 v10, 0x0

    .line 124
    .local v10, "table":I
    const/4 v7, 0x0

    .line 125
    .local v7, "startIndex":I
    new-instance v4, Ljava/lang/StringBuffer;

    const/16 v11, 0x14

    invoke-direct {v4, v11}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 126
    .local v4, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 127
    .local v1, "end":Z
    const/4 v5, 0x0

    .line 128
    .local v5, "shift":Z
    const/4 v9, 0x0

    .line 130
    .local v9, "switchShift":Z
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 190
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11

    .line 132
    :cond_2
    if-eqz v5, :cond_5

    .line 134
    const/4 v9, 0x1

    .line 141
    :goto_1
    packed-switch v10, :pswitch_data_0

    .line 154
    const/4 v6, 0x5

    .line 156
    .local v6, "size":I
    const/4 v11, 0x3

    if-ne v10, v11, :cond_3

    .line 157
    const/4 v6, 0x4

    .line 160
    :cond_3
    sub-int v11, v2, v7

    if-ge v11, v6, :cond_7

    .line 161
    const/4 v1, 0x1

    .line 183
    .end local v6    # "size":I
    :cond_4
    :goto_2
    if-eqz v9, :cond_1

    .line 184
    move v10, v3

    .line 185
    const/4 v5, 0x0

    .line 186
    const/4 v9, 0x0

    goto :goto_0

    .line 137
    :cond_5
    move v3, v10

    goto :goto_1

    .line 143
    :pswitch_0
    sub-int v11, v2, v7

    if-ge v11, v13, :cond_6

    .line 144
    const/4 v1, 0x1

    .line 145
    goto :goto_2

    .line 147
    :cond_6
    invoke-static {p1, v7, v13}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v0

    .line 148
    .local v0, "code":I
    add-int/lit8 v7, v7, 0x8

    .line 150
    int-to-char v11, v0

    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 165
    .end local v0    # "code":I
    .restart local v6    # "size":I
    :cond_7
    invoke-static {p1, v7, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v0

    .line 166
    .restart local v0    # "code":I
    add-int/2addr v7, v6

    .line 168
    invoke-static {v10, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->getCharacter(II)Ljava/lang/String;

    move-result-object v8

    .line 169
    .local v8, "str":Ljava/lang/String;
    const-string v11, "CTRL_"

    invoke-virtual {v8, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 171
    const/4 v11, 0x5

    invoke-virtual {v8, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lcom/google/zxing/aztec/decoder/Decoder;->getTable(C)I

    move-result v10

    .line 173
    const/4 v11, 0x6

    invoke-virtual {v8, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x53

    if-ne v11, v12, :cond_4

    .line 174
    const/4 v5, 0x1

    goto :goto_2

    .line 177
    :cond_8
    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 141
    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
    .end packed-switch
.end method

.method private static getTable(C)I
    .locals 1
    .param p0, "t"    # C

    .prologue
    .line 198
    const/4 v0, 0x0

    .line 200
    .local v0, "table":I
    sparse-switch p0, :sswitch_data_0

    .line 221
    :goto_0
    return v0

    .line 202
    :sswitch_0
    const/4 v0, 0x0

    .line 203
    goto :goto_0

    .line 205
    :sswitch_1
    const/4 v0, 0x1

    .line 206
    goto :goto_0

    .line 208
    :sswitch_2
    const/4 v0, 0x4

    .line 209
    goto :goto_0

    .line 211
    :sswitch_3
    const/4 v0, 0x2

    .line 212
    goto :goto_0

    .line 214
    :sswitch_4
    const/4 v0, 0x3

    .line 215
    goto :goto_0

    .line 217
    :sswitch_5
    const/4 v0, 0x5

    goto :goto_0

    .line 200
    nop

    :sswitch_data_0
    .sparse-switch
        0x42 -> :sswitch_5
        0x44 -> :sswitch_4
        0x4c -> :sswitch_1
        0x4d -> :sswitch_3
        0x50 -> :sswitch_2
        0x55 -> :sswitch_0
    .end sparse-switch
.end method

.method private static readCode([ZII)I
    .locals 3
    .param p0, "rawbits"    # [Z
    .param p1, "startIndex"    # I
    .param p2, "length"    # I

    .prologue
    .line 443
    const/4 v1, 0x0

    .line 445
    .local v1, "res":I
    move v0, p1

    .local v0, "i":I
    :goto_0
    add-int v2, p1, p2

    if-lt v0, v2, :cond_0

    .line 452
    return v1

    .line 446
    :cond_0
    shl-int/lit8 v1, v1, 0x1

    .line 447
    aget-boolean v2, p0, v0

    if-eqz v2, :cond_1

    .line 448
    add-int/lit8 v1, v1, 0x1

    .line 445
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static removeDashedLines(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .locals 8
    .param p0, "matrix"    # Lcom/google/zxing/common/BitMatrix;

    .prologue
    .line 410
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    add-int/lit8 v6, v6, -0x1

    div-int/lit8 v6, v6, 0x2

    div-int/lit8 v6, v6, 0x10

    mul-int/lit8 v6, v6, 0x2

    add-int/lit8 v0, v6, 0x1

    .line 411
    .local v0, "nbDashed":I
    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    sub-int/2addr v6, v0

    iget v7, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    sub-int/2addr v7, v0

    invoke-direct {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 413
    .local v1, "newMatrix":Lcom/google/zxing/common/BitMatrix;
    const/4 v2, 0x0

    .line 415
    .local v2, "nx":I
    const/4 v4, 0x0

    .local v4, "x":I
    :goto_0
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-lt v4, v6, :cond_0

    .line 436
    return-object v1

    .line 417
    :cond_0
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v6, v4

    rem-int/lit8 v6, v6, 0x10

    if-nez v6, :cond_1

    .line 415
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 421
    :cond_1
    const/4 v3, 0x0

    .line 422
    .local v3, "ny":I
    const/4 v5, 0x0

    .local v5, "y":I
    :goto_2
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-lt v5, v6, :cond_2

    .line 433
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 424
    :cond_2
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v6, v5

    rem-int/lit8 v6, v6, 0x10

    if-nez v6, :cond_3

    .line 422
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 428
    :cond_3
    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 429
    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    .line 431
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3
.end method


# virtual methods
.method public decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;
    .locals 6
    .param p1, "detectorResult"    # Lcom/google/zxing/aztec/AztecDetectorResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 91
    iput-object p1, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    .line 92
    invoke-virtual {p1}, Lcom/google/zxing/aztec/AztecDetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    .line 94
    .local v1, "matrix":Lcom/google/zxing/common/BitMatrix;
    iget-object v4, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v4}, Lcom/google/zxing/aztec/AztecDetectorResult;->isCompact()Z

    move-result v4

    if-nez v4, :cond_0

    .line 95
    iget-object v4, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v4}, Lcom/google/zxing/aztec/AztecDetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v4

    invoke-static {v4}, Lcom/google/zxing/aztec/decoder/Decoder;->removeDashedLines(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    .line 98
    :cond_0
    invoke-direct {p0, v1}, Lcom/google/zxing/aztec/decoder/Decoder;->extractBits(Lcom/google/zxing/common/BitMatrix;)[Z

    move-result-object v2

    .line 100
    .local v2, "rawbits":[Z
    invoke-direct {p0, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->correctBits([Z)[Z

    move-result-object v0

    .line 102
    .local v0, "correctedBits":[Z
    invoke-direct {p0, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->getEncodedData([Z)Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "result":Ljava/lang/String;
    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    invoke-direct {v4, v5, v3, v5, v5}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/Vector;Ljava/lang/String;)V

    return-object v4
.end method
