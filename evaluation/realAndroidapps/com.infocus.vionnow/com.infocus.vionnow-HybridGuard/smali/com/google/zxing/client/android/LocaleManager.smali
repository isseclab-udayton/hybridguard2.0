.class public final Lcom/google/zxing/client/android/LocaleManager;
.super Ljava/lang/Object;
.source "LocaleManager.java"


# static fields
.field private static final DEFAULT_TLD:Ljava/lang/String; = "com"

.field private static final GOOGLE_BOOK_SEARCH_COUNTRY_TLD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final GOOGLE_COUNTRY_TLD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    .line 37
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "en"

    const-string v3, "AU"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.au"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "bg"

    const-string v3, "BG"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.br"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->CANADA:Ljava/util/Locale;

    const-string v2, "ca"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    const-string v2, "cn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "cs"

    const-string v3, "CZ"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "cz"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "da"

    const-string v3, "DK"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "dk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "fi"

    const-string v3, "FI"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "fi"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->FRANCE:Ljava/util/Locale;

    const-string v2, "fr"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->GERMANY:Ljava/util/Locale;

    const-string v2, "de"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "hu"

    const-string v3, "HU"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "hu"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "he"

    const-string v3, "IL"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "co.il"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ITALY:Ljava/util/Locale;

    const-string v2, "it"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    const-string v2, "co.jp"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->KOREA:Ljava/util/Locale;

    const-string v2, "co.kr"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "nl"

    const-string v3, "NL"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "nl"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "pl"

    const-string v3, "PL"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "pl"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "pt"

    const-string v3, "PT"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "pt"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "ru"

    const-string v3, "RU"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "nl"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "sk"

    const-string v3, "SK"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "sk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "sl"

    const-string v3, "SI"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "si"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "es"

    const-string v3, "ES"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "es"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "sv"

    const-string v3, "SE"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "se"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->TAIWAN:Ljava/util/Locale;

    const-string v2, "de"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "tr"

    const-string v3, "TR"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.tr"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->UK:Ljava/util/Locale;

    const-string v2, "co.uk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    .line 69
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "en"

    const-string v3, "AU"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.au"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    const-string v2, "cn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->FRANCE:Ljava/util/Locale;

    const-string v2, "fr"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->GERMANY:Ljava/util/Locale;

    const-string v2, "de"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ITALY:Ljava/util/Locale;

    const-string v2, "it"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    const-string v2, "co.jp"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "nl"

    const-string v3, "NL"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "nl"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "es"

    const-string v3, "ES"

    const-string v4, ""

    invoke-direct {v1, v2, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "es"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->UK:Ljava/util/Locale;

    const-string v2, "co.uk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_BOOK_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    .line 84
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_BOOK_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    sget-object v1, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 28
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doGetTLD(Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/Locale;Ljava/lang/String;>;"
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 125
    .local v0, "locale":Ljava/util/Locale;
    if-nez v0, :cond_1

    .line 126
    const-string v1, "com"

    .line 132
    :cond_0
    :goto_0
    return-object v1

    .line 128
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 129
    .local v1, "tld":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 130
    const-string v1, "com"

    goto :goto_0
.end method

.method public static getBookSearchCountryTLD()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_BOOK_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    invoke-static {v0}, Lcom/google/zxing/client/android/LocaleManager;->doGetTLD(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCountryTLD()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_COUNTRY_TLD:Ljava/util/Map;

    invoke-static {v0}, Lcom/google/zxing/client/android/LocaleManager;->doGetTLD(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getProductSearchCountryTLD()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lcom/google/zxing/client/android/LocaleManager;->GOOGLE_PRODUCT_SEARCH_COUNTRY_TLD:Ljava/util/Map;

    invoke-static {v0}, Lcom/google/zxing/client/android/LocaleManager;->doGetTLD(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isBookSearchUrl(Ljava/lang/String;)Z
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 120
    const-string v0, "http://google.com/books"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "http://books.google."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
