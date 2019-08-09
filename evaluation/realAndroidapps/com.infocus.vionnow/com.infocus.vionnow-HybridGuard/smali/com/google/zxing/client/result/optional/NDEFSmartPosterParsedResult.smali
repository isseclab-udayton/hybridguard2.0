.class public final Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "NDEFSmartPosterParsedResult.java"


# static fields
.field public static final ACTION_DO:I = 0x0

.field public static final ACTION_OPEN:I = 0x2

.field public static final ACTION_SAVE:I = 0x1

.field public static final ACTION_UNSPECIFIED:I = -0x1


# instance fields
.field private final action:I

.field private final title:Ljava/lang/String;

.field private final uri:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "action"    # I
    .param p2, "uri"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 37
    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->NDEF_SMART_POSTER:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    .line 38
    iput p1, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->action:I

    .line 39
    iput-object p2, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->uri:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->title:Ljava/lang/String;

    .line 41
    return-void
.end method


# virtual methods
.method public getAction()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->action:I

    return v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->title:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->uri:Ljava/lang/String;

    .line 59
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->title:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/zxing/client/result/optional/NDEFSmartPosterParsedResult;->uri:Ljava/lang/String;

    return-object v0
.end method
