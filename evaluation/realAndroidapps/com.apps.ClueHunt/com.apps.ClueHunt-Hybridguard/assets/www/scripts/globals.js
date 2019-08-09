/* ==== ENUMERATIONS ==== */
var enumCourseType = {
    cCOURSE_SIMPLE : 0,
    cCOURSE_GPS : 1,
    cCOURSE_IBEACON : 2
}

var enumClueType = {
    cCLUE_NONE : 0,
    cCLUE_TEXT : 1,
    cCLUE_SOUND : 2
}

/* ==== GLOBAL VARIABLES ==== */
var g_objCourse;
var g_arrCPs = null;
var g_dtStartTime = null;
var g_dtEndTime;
var g_objCP = null;
var g_blnDidSetup = false;
var g_blnSaved = false;
var g_strCourseName = null;

/* ==== CLASSES ==== */
Checkpoint = function() { };
Checkpoint.prototype = {
    Index:null,
    Clue:null,
    Image:null,
    Display:null,
    Latitude:null,
    Longitude:null,
    Altitude:null,
    CodeNum:null
};

function clsCourse() {
    this.m_eCourseType = enumCourseType.cCOURSE_SIMPLE; //Default course type = simple
    this.m_eClueType = enumClueType.cCLUE_TEXT; //Default clue type = text
}

clsCourse.prototype = {
    GetCourseType: function() {
        return this.m_eCourseType;
    },
    SetCourseType: function(eCourseType) {
        this.m_eCourseType = eCourseType;
    },
    GetClueType: function() {
        return this.m_eClueType;
    },
    SetClueType: function(eClueType) {
        this.m_eClueType = eClueType;
    }
};