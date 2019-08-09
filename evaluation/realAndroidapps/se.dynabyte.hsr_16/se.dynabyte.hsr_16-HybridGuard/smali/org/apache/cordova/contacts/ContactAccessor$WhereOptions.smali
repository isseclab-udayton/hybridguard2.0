.class Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;
.super Ljava/lang/Object;
.source "ContactAccessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/contacts/ContactAccessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WhereOptions"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/contacts/ContactAccessor;

.field private where:Ljava/lang/String;

.field private whereArgs:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/contacts/ContactAccessor;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/contacts/ContactAccessor;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->this$0:Lorg/apache/cordova/contacts/ContactAccessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWhere()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->where:Ljava/lang/String;

    return-object v0
.end method

.method public getWhereArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->whereArgs:[Ljava/lang/String;

    return-object v0
.end method

.method public setWhere(Ljava/lang/String;)V
    .locals 0
    .param p1, "where"    # Ljava/lang/String;

    .prologue
    .line 182
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->where:Ljava/lang/String;

    .line 183
    return-void
.end method

.method public setWhereArgs([Ljava/lang/String;)V
    .locals 0
    .param p1, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 188
    iput-object p1, p0, Lorg/apache/cordova/contacts/ContactAccessor$WhereOptions;->whereArgs:[Ljava/lang/String;

    .line 189
    return-void
.end method
