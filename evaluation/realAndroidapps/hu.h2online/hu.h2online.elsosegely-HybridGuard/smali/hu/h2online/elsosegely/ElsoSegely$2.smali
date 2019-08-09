.class Lhu/h2online/elsosegely/ElsoSegely$2;
.super Ljava/lang/Object;
.source "ElsoSegely.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhu/h2online/elsosegely/ElsoSegely;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhu/h2online/elsosegely/ElsoSegely;


# direct methods
.method constructor <init>(Lhu/h2online/elsosegely/ElsoSegely;)V
    .locals 0
    .param p1, "this$0"    # Lhu/h2online/elsosegely/ElsoSegely;

    .prologue
    .line 158
    iput-object p1, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v7, 0x1

    .line 161
    packed-switch p2, :pswitch_data_0

    .line 200
    :goto_0
    return-void

    .line 165
    :pswitch_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 166
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "Status"

    const-string v6, "YES"

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, v5, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    .line 170
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v5, v5, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v6, "alertClicked"

    iget-object v7, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v7, v7, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 171
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v5, v5, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 173
    const-string v4, "https://play.google.com/store/apps/details?id=hu.h2online.webbeteg"

    .line 174
    .local v4, "url":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 175
    .local v0, "i":Landroid/content/Intent;
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 176
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    invoke-virtual {v5, v0}, Lhu/h2online/elsosegely/ElsoSegely;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 182
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "url":Ljava/lang/String;
    :pswitch_1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 183
    .local v2, "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "Status"

    const-string v6, "LATER"

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 190
    .end local v2    # "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :pswitch_2
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 191
    .local v3, "params3":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "Status"

    const-string v6, "NO"

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, v5, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    .line 195
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v5, v5, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v6, "alertClicked"

    iget-object v7, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v7, v7, Lhu/h2online/elsosegely/ElsoSegely;->alertClicked:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 196
    iget-object v5, p0, Lhu/h2online/elsosegely/ElsoSegely$2;->this$0:Lhu/h2online/elsosegely/ElsoSegely;

    iget-object v5, v5, Lhu/h2online/elsosegely/ElsoSegely;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 161
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
