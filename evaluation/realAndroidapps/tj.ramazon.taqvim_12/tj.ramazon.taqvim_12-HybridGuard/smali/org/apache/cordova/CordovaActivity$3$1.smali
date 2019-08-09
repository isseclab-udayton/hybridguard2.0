.class Lorg/apache/cordova/CordovaActivity$3$1;
.super Ljava/lang/Object;
.source "CordovaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaActivity$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/CordovaActivity$3;

.field private final synthetic val$exit:Z

.field private final synthetic val$me:Lorg/apache/cordova/CordovaActivity;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaActivity$3;ZLorg/apache/cordova/CordovaActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/apache/cordova/CordovaActivity$3$1;->this$1:Lorg/apache/cordova/CordovaActivity$3;

    iput-boolean p2, p0, Lorg/apache/cordova/CordovaActivity$3$1;->val$exit:Z

    iput-object p3, p0, Lorg/apache/cordova/CordovaActivity$3$1;->val$me:Lorg/apache/cordova/CordovaActivity;

    .line 780
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 782
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 783
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaActivity$3$1;->val$exit:Z

    if-eqz v0, :cond_0

    .line 784
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity$3$1;->val$me:Lorg/apache/cordova/CordovaActivity;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaActivity;->endActivity()V

    .line 786
    :cond_0
    return-void
.end method
