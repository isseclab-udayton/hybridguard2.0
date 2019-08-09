.class Lorg/apache/cordova/CordovaActivity$4$1;
.super Ljava/lang/Object;
.source "CordovaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/CordovaActivity$4;

.field private final synthetic val$exit:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaActivity$4;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/CordovaActivity$4$1;->this$1:Lorg/apache/cordova/CordovaActivity$4;

    iput-boolean p2, p0, Lorg/apache/cordova/CordovaActivity$4$1;->val$exit:Z

    .line 404
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 406
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 407
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaActivity$4$1;->val$exit:Z

    if-eqz v0, :cond_0

    .line 408
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity$4$1;->this$1:Lorg/apache/cordova/CordovaActivity$4;

    invoke-static {v0}, Lorg/apache/cordova/CordovaActivity$4;->access$0(Lorg/apache/cordova/CordovaActivity$4;)Lorg/apache/cordova/CordovaActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaActivity;->finish()V

    .line 410
    :cond_0
    return-void
.end method
