.class public Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "GoogleAnalyticsPlugin.java"


# static fields
.field private static final GA_DISPATCH_PERIOD:I = 0xa

.field private static final GA_LOG_LEVEL:Lcom/google/analytics/tracking/android/Logger$LogLevel;

.field private static ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

.field private static serviceManager:Lcom/google/analytics/tracking/android/GAServiceManager;

.field private static tracker:Lcom/google/analytics/tracking/android/Tracker;

.field private static uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/google/analytics/tracking/android/Logger$LogLevel;->VERBOSE:Lcom/google/analytics/tracking/android/Logger$LogLevel;

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->GA_LOG_LEVEL:Lcom/google/analytics/tracking/android/Logger$LogLevel;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method private assertTracker()V
    .locals 2

    .prologue
    .line 149
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Tracker not initialized. Call setTrackingId prior to using tracker."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_0
    return-void
.end method

.method private close()V
    .locals 2

    .prologue
    .line 143
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->assertTracker()V

    .line 144
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    sget-object v1, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    invoke-virtual {v1}, Lcom/google/analytics/tracking/android/Tracker;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->closeTracker(Ljava/lang/String;)V

    .line 145
    const/4 v0, 0x0

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    .line 146
    return-void
.end method

.method private get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->assertTracker()V

    .line 129
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    invoke-virtual {v0, p1}, Lcom/google/analytics/tracking/android/Tracker;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initializeGa()V
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/analytics/tracking/android/GoogleAnalytics;

    move-result-object v0

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    .line 53
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    invoke-virtual {v0}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->getLogger()Lcom/google/analytics/tracking/android/Logger;

    move-result-object v0

    sget-object v1, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->GA_LOG_LEVEL:Lcom/google/analytics/tracking/android/Logger$LogLevel;

    invoke-interface {v0, v1}, Lcom/google/analytics/tracking/android/Logger;->setLogLevel(Lcom/google/analytics/tracking/android/Logger$LogLevel;)V

    .line 55
    invoke-static {}, Lcom/google/analytics/tracking/android/GAServiceManager;->getInstance()Lcom/google/analytics/tracking/android/GAServiceManager;

    move-result-object v0

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->serviceManager:Lcom/google/analytics/tracking/android/GAServiceManager;

    .line 56
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->serviceManager:Lcom/google/analytics/tracking/android/GAServiceManager;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/google/analytics/tracking/android/GAServiceManager;->setLocalDispatchPeriod(I)V

    .line 58
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 59
    return-void
.end method

.method private objectToMap(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 5
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 156
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    .line 166
    :cond_0
    return-object v2

    .line 158
    :cond_1
    new-instance v2, Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 159
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 161
    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 162
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 164
    .local v3, "value":Ljava/lang/String;
    :goto_1
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 163
    .end local v3    # "value":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private send(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->assertTracker()V

    .line 139
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    invoke-virtual {v0, p1}, Lcom/google/analytics/tracking/android/Tracker;->send(Ljava/util/Map;)V

    .line 140
    return-void
.end method

.method private set(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->assertTracker()V

    .line 134
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    invoke-virtual {v0, p1, p2}, Lcom/google/analytics/tracking/android/Tracker;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method private setTrackingId(Ljava/lang/String;)V
    .locals 5
    .param p1, "trackingId"    # Ljava/lang/String;

    .prologue
    .line 117
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    if-eqz v0, :cond_0

    .line 118
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->close()V

    .line 120
    :cond_0
    sget-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    invoke-virtual {v0, p1}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->getTracker(Ljava/lang/String;)Lcom/google/analytics/tracking/android/Tracker;

    move-result-object v0

    sput-object v0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    .line 123
    new-instance v0, Lcom/google/analytics/tracking/android/ExceptionReporter;

    sget-object v1, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->tracker:Lcom/google/analytics/tracking/android/Tracker;

    sget-object v2, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->serviceManager:Lcom/google/analytics/tracking/android/GAServiceManager;

    sget-object v3, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->uncaughtExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    iget-object v4, p0, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    .line 124
    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/analytics/tracking/android/ExceptionReporter;-><init>(Lcom/google/analytics/tracking/android/Tracker;Lcom/google/analytics/tracking/android/ServiceManager;Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V

    .line 123
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 125
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callback"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 85
    :try_start_0
    const-string v3, "setTrackingId"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->setTrackingId(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 113
    :goto_0
    return v1

    .line 90
    :cond_0
    const-string v3, "get"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 91
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->ga:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    invoke-virtual {v1}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->getLogger()Lcom/google/analytics/tracking/android/Logger;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/analytics/tracking/android/Logger;->error(Ljava/lang/Exception;)V

    .line 111
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    move v1, v2

    .line 113
    goto :goto_0

    .line 94
    :cond_2
    :try_start_1
    const-string v3, "set"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 95
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x0

    :goto_1
    invoke-direct {p0, v4, v3}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 95
    :cond_3
    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 99
    :cond_4
    const-string v3, "send"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 100
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->objectToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->send(Ljava/util/Map;)V

    .line 101
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 104
    :cond_5
    const-string v3, "close"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->close()V

    .line 106
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 70
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 71
    invoke-direct {p0}, Lcom/cmackay/plugins/googleanalytics/GoogleAnalyticsPlugin;->initializeGa()V

    .line 72
    return-void
.end method
