$(document).ready(function(){

  var setupStatus = get_setup_status();
  if(setupStatus == null){
    set_setup_status(false);
  }

  var database = new dataBaseClass();
  var entryObject = new entryBudgetClass();
  var setupObject = new setUpClass();

  database.initializeDB(database,setupObject,entryObject);
  setHeightJqDivs();

  //displayAppTitle();

  //$(document).on('click','#startApp',function(){
    //hideAppTitle();
    //if initial time show setup page else show main app calc page
    var setupStatus = get_setup_status();
    var isAllowed = true;
    if(setupStatus == true ||  setupStatus == "true"){
      isAllowed = isBeginAllowed();
    }

    if(setupStatus == false || setupStatus == "false" || ((setupStatus == true || setupStatus == "true") && isAllowed == false)){
      showSetUpPage();
      pageOrder = "new";
      setupObject.initSetUp(entryObject, database, pageOrder);
    } else {
      showEntryBudget(entryObject, database);
    }
  //});

  $(document).on('click','#resetSetUpConfirm',function(){
    set_setup_status(false);
    setupObject.dropAllTables(database, setupObject, entryObject);
  });

  $(document).on('click','.cancelAction',function(){
    hide_message_screen(".backdrop","#popUpBox");
  });

  $(document).on('click','#resetAppConfirm',function(){
    set_setup_status(false);
    showSetUpPage();
    setupObject.dropAllTables(database, setupObject, entryObject);
  });
   $(document).on('click','#finishEntryConfirm',function(){
    set_setup_status(false);
    showSetUpPage();
    setupObject.dropAllTables(database, setupObject, entryObject);
  });

  $(document).on('click','.setUpButton',function(){
    showSetUpPage();
    pageOrder = "linked";
    setupObject.initSetUp(entryObject, database,pageOrder);
  });

});

function submitSetUpForm(){
  //submit validation already happening
  //no action required
}

function submitAddExpenseForm(){
  //no action required
}

//function to show a progress screen blocker
function showProgressOverlay(){
  var container = "body";
  var backdrop = ".progressBackDrop";
  var box = "#progressDisplay";
  overLayCentered(container,box,backdrop,"0.5");
}

//function to hide progress display
function hideProgressOverlay(){
  var backdrop = ".progressBackDrop";
  var box = "#progressDisplay";
  hide_message_screen(backdrop,box);
}

//function to show a pop-up message
function popUpDisplay(messageId, container){
  var box = "#popUpBox";
  var backdrop = ".backdrop";

  $('.popUpBoxContent').css("display","none");
  $(messageId).css("display","block");

  overLayCentered(container,box,backdrop,"0.50");
}

//function to show a overlay centered
function overLayCentered(container,box,backdrop,bg_opacity){
  var top_pos = $(container).offset().top;
  var left_pos = $(container).offset().left;
  var screen_height = $(container).height();
  var screen_width = $(container).width();
  $(box).width(0.8 * screen_width);
  var offset_y = ($(box).height())/2;
  var offset_x = ($(box).width())/2;
  var both = backdrop + "," + box;
  $(backdrop).css('top',top_pos);
  $(backdrop).css('left',left_pos);
  $(backdrop).css('height',screen_height);
  $(backdrop).css('width',screen_width);
  $(box).css('top',(top_pos+(screen_height/2)-offset_y));
  $(box).css('left',((screen_width/2)-offset_x));
  $(backdrop).animate({'opacity':bg_opacity}, 300, 'linear');
  $(box).animate({'opacity':'1.00'}, 300, 'linear');
  $(both).css('display', 'block');
}

//function to display a lightbox message on screen over the canvas
function show_message_screen(container,backdrop,box,bg_opacity,message){
  var top_pos = $(container).offset().top;
  var left_pos = $(container).offset().left;
  var screen_height = $(container).height();
  var screen_width = $(container).width();
  var box_width = 0.9 * screen_width;
  var box_height = screen_height;
  var offset_x = 0.05 * screen_width;
  var offset_y = 0.1 * screen_height;
  var both = backdrop + "," + box;
  if(typeof(message)!='undefined'){
	  var content = "<div class=\"message_content\">" + message + "</div>";
	  $(box).html(content);
  }
  $(backdrop).css('top',top_pos);
  $(backdrop).css('left',left_pos);
  $(backdrop).css('height',screen_height);
  $(backdrop).css('width',screen_width);
  //$(box).css('top',offset_y);
  //$(box).css('left', offset_x);
  //$(box).css('min-height', screen_height);
  //$(box).css('width', screen_width);
  $(both).animate({'opacity':bg_opacity}, 300, 'linear');
  $(box).animate({'opacity':'1.00'}, 300, 'linear');
  $(both).css('display', 'block');
}

//function to hide message screen
function hide_message_screen(backdrop,box){
  var both = backdrop + "," + box;
  $(both).animate({'opacity':'0'}, 300, 'linear', function(){
    $(both).css('display', 'none');
  });
}

//function to show stats info screen
function displayStatsOverlay(){
  hideAll();
  occupyWindow("#viewStatsOverlay");
  $('#viewStatsOverlay').css('display','block');
  var container = "#viewStatsOverlay";
  var backdrop = ".plainScreen";
  var box  = ".statsView";
  var bg_opacity = "1.00";
  show_message_screen(container,backdrop,box,bg_opacity);
}

//function to hide stats display
function hideStatsOverLay(){
  if($('#viewStatsOverlay').css('display') == 'block'){
    var box = ".statsView";
    var backdrop = ".plainScreen";
    hide_message_screen(backdrop,box);
    $('#viewStatsOverlay').css('display','none');
  }
}

//Function to hide all components from screen
function hideAll(){
  $('#displayEntryBudget').css('display','none');
  $('#displayBudgetCharts').css('display','none');
  hideStatsOverLay();
  if($('#setupPage').css('display') == 'block'){
    hideSetUp();
    $('#setupPage').css('display','none');
  }
}

//function to show Game Title on starting game
function displayAppTitle(){
  hideAll();
  occupyWindow("#homePage");
  $('#homePage').css('display','block');
}

//funtion to hide App title
function hideAppTitle(){
  var backdrop = ".plainScreen";
  $('#homePage').css('display','none');
  $('#startApp').css('display','none');
}

//function to display setup page
function showSetUpPage(){
  hideAll();
  occupyWindow("#setupPage");
  $('#setupPage').css('display','block');
  var container = "#setupPage";
  var backdrop = ".plainScreen";
  var box  = "#setUpBox";
  var bg_opacity = "1.00";
  show_message_screen(container,backdrop,box,bg_opacity);
}

//function to hide set up page 
function hideSetUp(){
    var backdrop = ".plainScreen";
    var box  = "#setUpBox";
    hide_message_screen(backdrop,box);
}

//function to display Entry Budget Section
function showEntryBudget(entryBudgetObject, dbClassObject){
  entryBudgetObject.initEntryBudget(dbClassObject, entryBudgetObject);
}

//function to display entry listing info
function showEntryListingInfo(remainingBudget, remainingDays, meanPerDay){
  remainingBudget = (Math.round(remainingBudget*100))/100;
  var currencySymbol = getValue("currencySymbol");
  $(".budgetDisplay").html(currencySymbol+remainingBudget);
  $(".daysRemainDisplay").html(remainingDays);
  $(".meanEntryProjection").html(currencySymbol+meanPerDay);
  if(meanPerDay <= 0){
    $(".meanProjectedDisplay").css("display","none");
  } else {
    $(".meanProjectedDisplay").css("display","inline-block");
  }
}

//function to show exceed budget message
function showExceedBudgetMessage(value){
  var currencySymbol = getValue("currencySymbol");
  var content = "<span class='alertIcon'>!</span>You have exceeded your budget by " + currencySymbol + value + "<span></span>";
  $("#exceedBudgetMsg").html(content);
  $("#exceedBudgetMsg").css("display","block");
  $("#meanEntryProjection").css("display","none");
}

//function to hide exceed budget message
function hideExceedBudgetMessage(){
  $("#exceedBudgetMsg").css("display","none");
  $("#meanEntryProjection").css("display","inline-block");
}

//function to occupy full window
function occupyWindow(id){
  /*var min_width  = $(window).width();
  var min_height = $(window).height();
  $(id).css("min-height",min_height);
  $(id).css("min-width",min_width); */
  $(id).height("100%");
  $(id).width("100%");
}

//function to get current date
function getTodayDate(){
  var thisDate = new Date();

  var month = thisDate.getMonth()+1;
  var day = thisDate.getDate();

  var fullDate =  (month<10 ? '0' : '') + month + '/' +
      (day<10 ? '0' : '') + day + '/' +
      thisDate.getFullYear();
  return fullDate;
}

// get nth day from date Entered in format mm/dd/yyyy
function getDateN(date, n){
  //1 day = 86400000 milliseconds
  if(typeof(date)!='undefined'){
    var splitDate = date.split("/");
    var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
    var thisDate = new Date();
    thisDate.setFullYear(yyyy,mm,dd);
  } else {
    var thisDate = new Date();
  }
  n = parseInt(n);
  var nDate = thisDate;
  nDate.setDate(thisDate.getDate()+n);
  var month = nDate.getMonth()+1;
  var day = nDate.getDate();

  var fullDate =  (month<10 ? '0' : '') + month + '/' +
      (day<10 ? '0' : '') + day + '/' +
      nDate.getFullYear();

  return fullDate;
}

//function to get completed days
function getCompletedDays(){
  var thisDate = new Date();
  var start_date = getValue("start_date");
  var startdate = new Date(), completedDays = 0;
  if(typeof(start_date)!='undefined'){
    var splitDate = start_date.split("/");
    var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
    startdate.setFullYear(yyyy,mm,dd);
    completedDays = dateDifference(startdate,thisDate);
  } else {
    setError("start date error in getCompletedDays()!")
  }
  //console.log("completedDays : " + completedDays);
  //Set 1 day in milliseconds
  return completedDays;
}

//function to get duration
function getDuration(start_date, end_date){
  var startDate = new Date(), endDate = new Date(), duration;
  var splitDate = start_date.split("/");
  var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
  startDate.setFullYear(yyyy,mm,dd);
  var splitDate = end_date.split("/");
  var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
  endDate.setFullYear(yyyy,mm,dd);
  /* Incrementing end date to include end date as part of budget 
     Duration will include end date if we include the next two lines of code*/
    endDate.setHours(0,0,0,0);
    endDate.setDate(endDate.getDate()+1);
  duration = dateDifference(startDate,endDate);
  return duration;
}

//function get date difference secondDate - firstDate
function dateDifference(firstDate,secondDate){
  //Set 1 day in milliseconds
  firstDate.setHours(0,0,0,0);
  secondDate.setHours(0,0,0,0);
  var one_day=1000*60*60*24
  var difference = Math.ceil((secondDate.getTime()-firstDate.getTime())/(one_day));
  return difference;
}

//function to find out if current date is after the start date
function isBeginAllowed(){
  var thisDate = new Date(), start_date = getValue("start_date");
  var isAllowed = true, startdate = new Date();
  if(typeof(start_date)!='undefined'){
    var splitDate = start_date.split("/");
    var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
    startdate.setFullYear(yyyy,mm,dd);
  } else {
    setError("start date error in isBeginAllowed()!")
  }
  thisDate.setHours(0,0,0,0);
  startdate.setHours(0,0,0,0);
  if(startdate.getTime() > thisDate.getTime()){
    isAllowed = false;
  }
  return(isAllowed);
}

//function to find out whether the last day has passed
function isLastDayOver(){
  var thisDate = new Date(), lastDateString = getLastDate();
  var isLastDatePast = true,lastDate = new Date();
  if(typeof(lastDateString)!='undefined'){
    var splitDate = lastDateString.split("/");
    var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
    lastDate.setFullYear(yyyy,mm,dd);
  } else {
    setError("last date error in isLastDayOver()!")
  }
  thisDate.setHours(0,0,0,0);
  lastDate.setHours(0,0,0,0);
  if(lastDate.getTime() > thisDate.getTime()){
    isLastDatePast = false;
  }
  return(isLastDatePast);
}

//function to clear the jqplot
function clearPlotGraph(){
  $("#chartdiv").html("");
}

//function to set height of chart and pie containers
function setHeightJqDivs(){
  width  = $(window).width();
  height = $(window).height();
  if(height<width){
    width = height;
  }
  $('#pieChart').height(width * 0.5);
  $('#donutChart').height(width * 0.43);
  $("#chartdiv").height(height * 0.5);
}

//function to plot a pie chart
function plotPieChart(pieValues){
  $('#pieChart').html("");
  if(pieValues != null && pieValues != 'undefined'){ 
      var plot1 = jQuery.jqplot ('pieChart', [pieValues], 
        { 
          seriesDefaults: {
            // Make this a pie chart.
            renderer: $.jqplot.PieRenderer, 
            rendererOptions: {
              // Put data labels on the pie slices.
              // By default, labels show the percentage of the slice.
              startAngle: -90,
              // Add a margin to seperate the slices.
              sliceMargin: 3
              //showDataLabels: true,
              //dataLabels: 'value'
            }
          }, 
          grid: {backgroundColor:'#444849',textColor:'#FFF',borderWidth:0, shadow:false},
          //seriesColors: ['#3399FF', '#D0E8F4'] 
          seriesColors: ['#FFFFFF', '#288EDF'] 
        }
      );
  }
}

//function to plot a pie chart
function plotDonutChart(pieValues){
  $('#donutChart').html("");
  if(pieValues != null && pieValues != 'undefined'){ 
      var plot1 = jQuery.jqplot ('donutChart', [pieValues], 
        { 
          seriesDefaults: {
            // Make this a pie chart.
            renderer: $.jqplot.DonutRenderer, 
            rendererOptions: {
              // Put data labels on the pie slices.
              // By default, labels show the percentage of the slice.
              startAngle: -90,
              //showDataLabels: true,
              //dataLabels: 'value'
            }
          }, 
          grid: {backgroundColor:'#444849',textColor:'#FFF',borderWidth:0, shadow:false},
          //seriesColors: ['#3399FF', '#D0E8F4'] 
          seriesColors: ['#FFFFFF', '#288EDF'] 
        }
      );
  }
}

//function to plot a date graph
function plotDateGraph(plotValues, meanValues, startdate, datePlotYMax){
  clearPlotGraph();
  var hasMarker = true;
  if(meanValues.length > 1){
    hasMarker = false;
  }
  var duration = parseInt(getValue("duration"));
  var xMax = getDateN(startdate,duration);;
  var yMax = parseInt(datePlotYMax);
  //calculating tick intervals
  var totalTicks = 10;
  var intervalX = Math.ceil(duration/totalTicks);
  var intervalY = Math.ceil(yMax/totalTicks);

  var x_offset = intervalX - (duration%intervalX);
  duration = duration + x_offset;
  xMax = getDateN(startdate,duration);
  var y_offset = intervalY - (yMax%intervalY);
  yMax = yMax + y_offset;
  intervalX = intervalX + " day";

  if(plotValues.length === 0){
    $.jqplot('chartdiv', [meanValues], {
        axesDefaults: {
          labelRenderer: $.jqplot.CanvasAxisLabelRenderer
        },  
        gridPadding:{right:35},
        axes:{
          xaxis:{
            tickOptions:{
                labelPosition: 'middle', 
                angle:-30
            },
            tickRenderer:$.jqplot.CanvasAxisTickRenderer,
            renderer:$.jqplot.DateAxisRenderer, 
            tickOptions:{formatString:'%b %#d'},
            min: startdate, 
            tickInterval:intervalX
          },
          yaxis:{
            label:'Expense (Pounds)',
            max: yMax,
            min: 0,
            tickInterval: intervalY
          }
        },
        series:[{
          showMarker:false,
          lineWidth:1
        }]
    });
  } else {
    $.jqplot('chartdiv', [plotValues,meanValues], {
        axesDefaults: {
          labelRenderer: $.jqplot.CanvasAxisLabelRenderer
        },  
        gridPadding:{right:35},
        axes:{
          xaxis:{
            renderer: $.jqplot.DateAxisRenderer,
            labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
            tickRenderer: $.jqplot.CanvasAxisTickRenderer,
            tickOptions: {
                //labelPosition: 'middle', 
                formatString:'%b %#d',
                angle:-30,
                textColor:'#FFF'
            },

            min: startdate, 
            tickInterval:intervalX
          },
          yaxis:{
            label:'Expense (Pounds)',
            max: yMax,
            min: 0,
            tickInterval: intervalY
          }
        },
        series:[
        { 
          lineWidth:2
        },
        {
          lineWidth:3,
          markerOptions: { show: hasMarker,size: 7, style:"circle" }
        }
        ]
    });
  }
}

//Function to plot a graph based on plot Values eg: plotValues = [[1, 2],[3,5.12],[5,13.1],[7,33.6],[9,85.9],[11,219.9]];
function plotGraph(plotValues, plotXMax, plotYMax){

  clearPlotGraph();
  var xMax = parseInt(plotXMax);
  var yMax = parseInt(plotYMax);

  //calculating tick intervals
  var totalTicks = 10;
  var intervalX = Math.ceil(xMax/totalTicks);
  var intervalY = Math.ceil(yMax/totalTicks);

  var x_offset = intervalX - (xMax%intervalX);
  xMax = xMax + x_offset;
  var y_offset = intervalY - (yMax%intervalY);
  yMax = yMax + y_offset;

  $.jqplot('chartdiv', [plotValues], {  
      axesDefaults: {
        labelRenderer: $.jqplot.CanvasAxisLabelRenderer
      },
      series:[
      { 
        lineWidth:2
      }
      ],
      axes:{
        xaxis:{
          label:'Entry Number',
          labelOptions:{
              textColor : '#FFF',
          },
          max: xMax,
          min: 0,
          tickInterval: intervalX
        },
        yaxis:{
          label:'Expense (Pounds)',
          labelOptions:{
              textColor : '#FFF',
          },
          max: yMax,
          min: 0,
          tickInterval: intervalY
        }
      }
  });
  
}

//function to update stats
function populateStats(){
  //".budgetStatsId",".expenseStatsId",".balanceStatsId",".durationStatsId",
  //".daysLeftStatsId",".meanPerDayStatsId"
  var statsIdList = [".budgetStatsId",".startStatsId",".endStatsId",".expenseStatsId",".balanceStatsId",".durationStatsId",".daysLeftStatsId",".meanPerDayStatsId"];
  var statsValueList = new Array();
  var currencySymbol = getValue("currencySymbol");
  var budget = parseFloat(getValue("budget")),expenditure = (Math.round(parseFloat(getValue("expenditure"))*100)/100);
  statsValueList[0] = currencySymbol + budget;
  statsValueList[1] = getValue("start_date");
  statsValueList[2] = getValue("end_date");
  statsValueList[3] = currencySymbol + expenditure;
  statsValueList[4] = currencySymbol + (Math.round((budget-expenditure)*100)/100)
  statsValueList[5] = parseInt(getValue("duration")) + " days";
  statsValueList[6] = (parseInt(getValue("duration")) - parseInt(getValue("completedDays"))) + " days";
  statsValueList[7] = currencySymbol + getValue("meanPerDay");

  for(i=0;i<statsValueList.length;i++){
    $(statsIdList[i]).html(statsValueList[i]);
  }
}

/*--------------  Class that contains all the set up page manipulations -----------------*/
function setUpClass(){
  var entryClassObject = null;
  var dbClassObject = null;
  var setupStatus = false;
  var isBeginDateOk = true;
  var datePickerObject = new datePicker();
  var pageOrder = "new";

  this.initSetUp = initSetUp;
  this.onSubmitSetUp = onSubmitSetUp;
  this.dropAllTables = dropAllTables;

  //function to show Menu
  function initSetUp(entryObject, dbObject, pageOrderVal){
    entryClassObject = entryObject;
    dbClassObject = dbObject;
    pageOrder = pageOrderVal;
    setupStatus = get_setup_status();
    if(pageOrder == "linked"){
      $(".backButton").css('display','block');
    } else {
      $(".backButton").css('display','none');
    }
    //Set initial value of start date on form to today
    if((setupStatus == true || setupStatus == "true") && setupStatus != "false"){
      //$("#setUpForm input[type='text']").addClass("is-disabled");
      //$("#setUpForm .topcoat-button").removeClass("is-disabled");
      //$("#setUpForm .topcoat-button").addClass("is-active");
      //$("#setUpForm .topcoat-button--quiet").removeClass("is-disabled");
      isBeginDateOk = isBeginAllowed();
      $("#start_date_id").addClass("is-disabled");
      $("#start_date_id").attr('disabled','disabled');
      $("#budget_id").val(getValue("budget"));
      $("#currencySymbol").val(getValue("currencySymbol"));
      $("#currencySymbol").addClass("is-disabled");
      $("#start_date_id").val(getValue("start_date"));
      $("#end_date_id").val(getValue("end_date"));
      if(isBeginDateOk == true){
        $("#submitSetUp").removeClass("is-disabled");
        $("#submitSetUp").val("OK");
        $("#startDateInfoMsg").css("display","none");
      }
      if(isBeginDateOk == false){
        $("#submitSetUp").addClass("is-disabled");
        $("#submitSetUp").val("WAIT");
        $("#startDateInfo").html(getValue("start_date"));
        $("#startDateInfoMsg").css("display","block");
      }
      $("#resetSetUp").css("display","inline-block");
    } else {
      isBeginDateOk = true;
      $("#submitSetUp").removeClass("is-disabled");
      $("#start_date_id").removeClass("is-disabled");
      $("#start_date_id").removeAttr('disabled');
      $("#currencySymbol").removeClass("is-disabled");
      $("#start_date_id").val(getTodayDate());
      $("#end_date_id").val(getTodayDate());
      $("#resetSetUp").css("display","none");
      $("#submitSetUp").val("SUBMIT");
      $("#startDateInfoMsg").css("display","none");
      //$("#setUpForm input[type='text']").removeClass("is-disabled");
      //$("#setUpForm .topcoat-button").addClass("is-disabled");
      //$("#setUpForm .topcoat-button").removeClass("is-active");
      //$("#setUpForm .topcoat-button--quiet").addClass("is-disabled");
    }
  }

  function dropAllTables(dbClassObject, setUpObject, entryClassObject){
    //function to drop the entry Table
    window.localStorage.clear();
    dbClassObject.dropTable("ENTRYBUDGET",setUpObject,entryClassObject);
  }

  function onSubmitSetUp(){
    var keySet = setUpValidate();
    if(keySet != ""){
      //will hold values Budget, no of entries, start date, duration, mean budget per entry, mean budget per day
      if(!((setupStatus == true || setupStatus == "true") && setupStatus != "false")){
        createSetUpParams(keySet);
        set_SLNO_Key(0);
        set_setup_status(true);
        isBeginDateOk = isBeginAllowed();
        if(isBeginDateOk == false){
          initSetUp(entryClassObject, dbClassObject, pageOrder);
        } else {
          entryClassObject.createEntryTable(dbClassObject, entryClassObject);
        }
      } else {
        updateSetUpParams(keySet);
        isBeginDateOk = isBeginAllowed();
        if(isBeginDateOk != false){           
          showEntryBudget(entryClassObject, dbClassObject);
        }
      }
    }
  }

  //Function to validate setup form
  function setUpValidate(){
    $(".errorMsg").css("display","none");
    var ids = ["budget","start_date","end_date"];
    var errors = ["Please enter a value","Perfect!","Please enter a Number","Please enter a valid date in format mm/dd/yyyy","Please Enter a non-zero number","Sorry! Budget cannot start on a past date!","Date is more than date possible for the month!"];
    var keySet = "";
    var isValid = true;
    for(i=0;i<ids.length;i++){
      var input_id =  "#" + ids[i] + "_id";
      var error_id = "#" + ids[i] + "_error";
      var error_no = 1;
      var inputVal = $(input_id).val();
      if(ids[i] == "start_date" || ids[i] == "end_date"){
        error_no = validateDate(inputVal);
      }else {
        error_no = validateNumber(inputVal);
        if(error_no == 1){
          inputVal = (Math.round((inputVal * 100))/100);
        }
      }
      if(error_no != 1 && error_no != 5){
        isValid = false;
        $(error_id).css("display","block");
        $(error_id).html(errors[error_no]);
      }
      if(keySet != ""){ keySet += "|";}
      keySet += inputVal;
    }
    if(!isValid){
      keySet = "";
    } else {
      var currencySymbol = $("#currencySymbol").val();
      setValue("currencySymbol",currencySymbol);
    }
    return keySet;
  }

  $(document).on('click','#start_date_id',function(){
    datePickerObject.initDisplay("start_date_id");
  });

  $(document).on('change','#start_date_id',function(){
    startDateValue = $("#start_date_id").val();
    endDateValue = $("#end_date_id").val();
    var difference = getDuration(startDateValue, endDateValue);
    if(difference <= 0) {
      $("#end_date_id").val(startDateValue);
    }
  });

  $(document).on('change','#end_date_id',function(){
    startDateValue = $("#start_date_id").val();
    endDateValue = $("#end_date_id").val();
    var difference = getDuration(startDateValue, endDateValue);
    if(difference <= 0) {
      $("#end_date_id").val(startDateValue);
    }
  });

   $(document).on('focus','#start_date_id',function(){
    if(!$("#start_date_id").hasClass("is-disabled")){
      datePickerObject.initDisplay("start_date_id");
    }
  });

  $(document).on('click','#end_date_id',function(){
    datePickerObject.initDisplay("end_date_id");
  });
  $(document).on('focus','#end_date_id',function(){
    datePickerObject.initDisplay("end_date_id");
  });

  $("#setUpForm").submit(function(){
    onSubmitSetUp();
  });

  $(document).on('click','.backButton',function(){
    showEntryBudget(entryClassObject, dbClassObject);
  });

  $(document).on('click','#resetSetUp',function(){
    popUpDisplay("#setUpResetConfirm","#setupPage");
  });
}

/* --------------- Entry/Expense Page manipulation class ---------------------- */
function entryBudgetClass(){

  var dbClassObject = null;
  var thisObject = null;
  var tableName = "ENTRYBUDGET";
  var columns = "Id,EntryNo,Expense,Date";
  var plotXMax = 10;
  var plotYMax = 10;
  var lastDate = "";
  var datePlotYMax = 10;
  var subsection = "add";
  var screenHeight = $(window).height();
  var screenWidth = $(window).width();
  var currentPage = "add";
  var plotValues = new Array(); 
  var pieChartValues = new Array();
  var currencySymbol = "";
  //var table = new Array();
  var results = null;
  var isListDisplayed = false;

  this.initEntryBudget = initEntryBudget;
  this.addExpense = addExpense;
  this.createEntryTable = createEntryTable;
  this.reCalculate = reCalculate;
  this.rePlot = rePlot;
  this.deleteEntry = deleteEntry;
  this.recalculateEntryNumbers = recalculateEntryNumbers;
  this.resetAfterDeletion = resetAfterDeletion;
  this.showBudgetMainView = showBudgetMainView;
  this.showChartsView = showChartsView;
  this.viewBudgetChart = viewBudgetChart;
  this.showEntryBudgetChart = showEntryBudgetChart;
  this.showDateBudgetChart = showDateBudgetChart;
  this.viewDateChart = viewDateChart;

  //Init entry Budget Class
  function initEntryBudget(db, myobj){
    dbClassObject = db;
    thisObject = myobj;
    var completedDays = getCompletedDays();
    setValue("completedDays",completedDays);
    var meanPerDay = parseFloat(getValue("meanPerDay"));
    var budget = parseFloat(getValue("budget")), expenditure = parseFloat(getValue("expenditure"));
    plotYMax = parseFloat(getValue("maxExpense"));
    duration = parseInt(getValue("duration"));
    startdate = getValue("start_date");
    lastDate = getDateN(startdate,duration);
    setLastDate(lastDate);
    currencySymbol = getValue("currencySymbol");
    datePlotYMax = parseFloat(getValue("maxExpensePerDay"));
    if(meanPerDay > datePlotYMax){
      datePlotYMax = meanPerDay;
    }
    showBudgetMainView("add");    
  }

  function checkOrientation(){
    if($(window).height() !== screenHeight || $(window).width() !== screenWidth) {
        screenHeight = $(window).height();
        screenWidth = $(window).width();

        // orientation changed, do your magic here
        setHeightJqDivs();
        if(currentPage == "add"){
          plotBudgetPieChart("add");
        } else if(currentPage == "list"){
          plotBudgetPieChart("list");
        }
        if(currentPage == "dateChart" && plotValues != null &&  plotValues.length != 0){
          var meanValues = getMeanPerDateValues();
          var startdate = getValue("start_date");
          startdate = getDateN(startdate,-1);
          plotDateGraph(plotValues, meanValues, startdate, datePlotYMax);
        }
        if(currentPage  == "entryChart" && plotValues != null &&  plotValues.length != 0){
          plotGraph(plotValues, plotXMax, plotYMax);
        }
    }
  };
  window.addEventListener("resize", checkOrientation, false);
  document.addEventListener("resize", checkOrientation, false);

  /*
  * function to show list and add to budget views
  * If subsection = list show list view if its add show add to budget view
  */
  function showBudgetMainView(sub_section){
    hideAll();
    occupyWindow("#displayEntryBudget");
    currentPage = "add";
    subsection = sub_section;
    var budget = parseFloat(getValue("budget")),expenditure = parseFloat(getValue("expenditure"));
    var completedDays = parseInt(getValue("completedDays")), duration = parseInt(getValue("duration"));
    var completedEntries = parseInt(getValue("completedEntries"));
    $('#displayEntryBudget').css('display','block');
    $(".viewAddButton").removeClass("is-disabled");
    $(".add_disabled_img").css("display","none");
    $(".add_enabled_img").css("display","block");
    hideSuccessNotifications();
    if(completedEntries  <= 0){
      disableListSection();
    }
    if(expenditure >= budget) {
      if(expenditure > budget){
        var extra = (Math.round((expenditure - budget)*100))/100;
        showExceedBudgetMessage(extra);
      }
      //disable add button
      disableAddSection();
    }
    if(completedDays >= duration){
      var meanPerDay = 0;
      setValue("meanPerDay",meanPerDay);
      disableAddSection();
    }

    var thisDate = getTodayDate(), lastDate = getLastDate();

    if(thisDate === lastDate || isLastDayOver() == true){
      popUpDisplay("#lastDayMsg","#displayEntryBudget");
      disableAddSection();
    }

    if(subsection == "list") {
      currentPage = "list"; 
      $(".addExpenseSection").css("display","none");
      hideEntryStatusMsg();
      $("#entryListingSection").css("display","block");
      $(".tabGroup").removeClass("is-active");
      $(".viewListButton").addClass("is-active");
    }
    else {
      currentPage = "add";
      $(".addExpenseSection").css("display","block");
      hideExceedBudgetMessage();
      $(".tabGroup").removeClass("is-active");
      $(".viewAddButton").addClass("is-active");
      $("#entryListingSection").css("display","none");
    }

    dbClassObject.selectAll("init");
  }

  //function to disable add expense section and show list section
  function disableAddSection(){
    $(".addExpenseSection").css("display","none");
    hideEntryStatusMsg();
    $(".add_disabled_img").css("display","block");
    $(".add_enabled_img").css("display","none");
    subsection = "list";
    $("#entryListingSection").css("display","block");
    $(".viewAddButton").addClass("is-disabled");
    $(".tabGroup").removeClass("is-active");
    $(".viewListButton").addClass("is-active");
    if(pieChartValues != null && pieChartValues.length > 0){
      plotDonutChart(pieChartValues);
    }
  }

  //function to disable list entry view
  function disableListSection(){
    $(".viewListButton").addClass("is-disabled");
    $(".list_disabled_img").css("display","block");
    $(".list_enabled_img").css("display","none");
    $(".addExpenseSection").css("display","block");
    hideExceedBudgetMessage();
    subsection = "add";
    $("#entryListingSection").css("display","none");
    $(".tabGroup").removeClass("is-active");
    $(".viewAddButton").addClass("is-active");
    if(pieChartValues != null && pieChartValues.length > 0){
      plotPieChart(pieChartValues);
    }
  }

  //function to show charts
  function showChartsView() {
    //hide the display budget section
    hideAll();
    occupyWindow("#displayBudgetCharts");
    //show the charts section
    $('#displayBudgetCharts').css('display','block');
    //populate chart stats Info
    populateChartStatsInfo();
    //get plot values from table    
    // use db call  that calls back viewBudgetChart function to plot values in chart
    showDateBudgetChart();
  }

  //function to show chats stats Info
  function populateChartStatsInfo(){
    //populate stats
    //statsList = ["#chartStatBudget","#chartStatDaysLeft","#chartsDateProjection"];
    var budget = parseFloat(getValue("budget")), expenditure = parseFloat(getValue("expenditure")), 
        remainingBudget = budget-expenditure, meanPerDay = getValue("meanPerDay");
    var completedDays = parseInt(getValue("completedDays")), duration = parseInt(getValue("duration")), 
        remainingDays = duration - completedDays;
    remainingBudget = (Math.round(remainingBudget*100))/100;
    $("#chartStatBudget").html(currencySymbol + remainingBudget);
    $("#chartStatDaysLeft").html(remainingDays);
    $("#chartsDateProjection").html(currencySymbol + meanPerDay);
  }

  //function to show Entry view
  function showEntryBudgetChart(){
    $("#chartHeader").html("Expense/Entry Chart");
    $(".viewDateChartButton").css("display","inline-block");
    $(".viewEntryChartButton").css("display","none");
    dbClassObject.selectAllFromBudget();
  }

  //function to show date view
  function showDateBudgetChart(){
    var completedEntries = parseInt(getValue("completedEntries"));
    $("#chartHeader").html("Expense/Date Chart");
    $(".viewDateChartButton").css("display","none");
    $(".viewEntryChartButton").css("display","none");
    if(completedEntries > 0){
      $(".viewEntryChartButton").css("display","inline-block");
    }
    dbClassObject.selectAllForDateBudget();
  }

  function viewBudgetChart(results){
    //plots the budget chart here
    plotLineChart(results);
  }

  function viewDateChart(results){
    //plot date chart
    plotDateExpense(results);
  }

  //function to get the last entry number
  function getLastEntryNo(){
    var entry_no = getValue("completedEntries");
    return entry_no;
  }

  //function to create entry table
  function createEntryTable(dbClassObject, myobj){
    thisObject = myobj;
    dbClassObject.createBudgetTable();
  }

  //function to get mean per date value
  function getMeanPerDateValues(){
    var mean = getValue("meanPerDay");
    var total_entries = parseInt(getValue("duration"));
    var startdate = getValue("start_date");
    var date_i;
    var meanValues = new Array();
    for(i=0;i<total_entries;i++){
      date_i = getDateN(startdate,i);
      meanValues[i]=[date_i,mean];
    }
    return meanValues;

  }

  //function to get next entry index
  function getNextIndexNo(){
    var index = parseInt(get_SLNO_Key()) + 1;
    set_SLNO_Key(index);
    return(index);
  }


  //Function to add a new Entry to the tables
  function addEntry(expense){
    var entry_no = parseInt(getLastEntryNo()) + 1;
    var duration = parseInt(getValue("duration"));
    var completedDays = parseInt(getValue("completedDays"));
    if(completedDays < duration){
      showProgressOverlay();
      expense = parseFloat(expense);
      var date = getTodayDate();
      var sl_no = getNextIndexNo();
      var key = date + "_" + sl_no;
      var value = expense;    
      var query = "";
      var values= '"' + key + '",' + entry_no + ',' + expense + ',"' + date + '"';

      /*recalculate local storage variables for entry budget*/
      setValue("completedEntries",entry_no);
      
      var expenditure = parseFloat(getValue("expenditure")) + expense;
      setValue("expenditure",expenditure);

      var budget = parseFloat(getValue("budget"));

      var maxExpense = parseFloat(getValue("maxExpense"));
      if(expense > maxExpense){
        setValue("maxExpense",expense);
        maxExpense = expense;
      }

      plotYMax = maxExpense;

      var budget = parseFloat(getValue("budget"));
      if(expenditure > budget) {
        var extra = (Math.round((expenditure - budget)*100))/100;
        showExceedBudgetMessage(extra);
        popUpDisplay("#addTabDisabledMsg","#displayEntryBudget");
        //disable add button
        var budgetRemaining = budget - expenditure;
        pieChartValues = new Array();
        pieChartValues[0] = ["Total Expense : "+expenditure,expenditure];
        pieChartValues[1] = ["Remaining Budget : " + budgetRemaining,budgetRemaining];
        disableAddSection();
      }

      //Adding new entry to Entry List
      addToListing(entry_no,expense,date,key);

      //show Status message
      showEntryStatusMsg(expense);

      //Sample query: 'INSERT INTO '+tableName+' ('+columns+') VALUES ("'+values+'");'
      query = 'INSERT INTO '+tableName+' ('+columns+') VALUES ('+values+');';
      dbClassObject.insertIntoBudgetTable(query, date, expense); 
    }  else {
      disableAddSection();
      var meanPerDay = 0;
      setValue("meanPerDay",meanPerDay);
      popUpDisplay("#finishedConfirm","#displayEntryBudget");
    }
  }

  //Function to recalculate and plot on Add
  function reCalculate(){
    dbClassObject.selectAll();
  }

  //function to replot based on newly added value
  function rePlot(results){
    $(".chartSummary").height = $(window).height()/2;  
    plotBudgetPieChart();   
    var listingContent = $("#entryListBody").html();
    if(listingContent.indexOf("<!-- empty -->") >= 0){
      displayListing(results);
      isListDisplayed = true; 
    }
    hideProgressOverlay();
  }

  //function to plot line chart based on budget Computation
  function plotLineChart(results){
    plotValues = new Array();    

    for(i=0;(results!=null) && (i<results.rows.length);i++){
      var entryValue = results.rows.item(i)["EntryNo"];
      var budgetValue = results.rows.item(i)["Expense"];
      plotValues[i] = [entryValue,budgetValue];
    }
    currentPage = "entryChart";

    if(plotValues.length !== 0){
      plotXMax = parseInt(getValue("total_entries")) + 1;
      plotGraph(plotValues, plotXMax, plotYMax);
    }

  }

  //function to plot chart based on date wise expense
  function plotDateExpense(results){
    var meanValues = getMeanPerDateValues();
    plotValues = new Array();
    var startdate = getValue("start_date");
    startdate = getDateN(startdate,-1);
    var maxExpensePerDay = parseFloat(getValue("maxExpensePerDay"));
    datePlotYMax = parseFloat(getValue("meanPerDay"));
    if(maxExpensePerDay>datePlotYMax){
      datePlotYMax = maxExpensePerDay;
    }

    for(i=0;results!=null && i<results.rows.length;i++){
      var date = results.rows.item(i)["Id"];
      var expense = results.rows.item(i)["Expense"];
      plotValues[i] = [date, expense];
    }
    currentPage = "dateChart";
    plotDateGraph(plotValues, meanValues, startdate, datePlotYMax);
  }

  //function to plot pie chart based on budget computation
  function plotBudgetPieChart(){
    var expenditure = parseFloat(getValue("expenditure"));
    var budgetRemaining = parseFloat(getValue("budget")) - expenditure;
    var duration = parseInt(getValue("duration")),completedDays = parseInt(getValue("completedDays"));
    var remainingDays = duration - completedDays, meanPerDay = getValue("meanPerDay");
    showEntryListingInfo(budgetRemaining, remainingDays, meanPerDay);

    pieChartValues = new Array();
    pieChartValues[0] = ["Total Expense : "+expenditure,expenditure];
    pieChartValues[1] = ["Remaining Budget : " + budgetRemaining,budgetRemaining];
    if(currentPage == "add"){
      plotPieChart(pieChartValues);
    } else {
      plotDonutChart(pieChartValues);
    }
  }

  //function to show entry status message
  function  showEntryStatusMsg(expense){
    $("#expenseStatusMsg").css("display","none");
    var content = "<span class='infoIcon'>i</span><span>Entered "+currencySymbol+expense+" as Expense.</span>";
    $("#expenseStatusMsg").html(content);
    $("#expenseStatusMsg").css("display","block");
    $("#expenseStatusMsg").fadeOut(8000);
  }

  //function to show delete status message
  function showDeleteStatusMsg(){
    $("#deleteStatusMsg").css("display","none");
    var content = "<span class='infoIcon'>i</span><span>Entry deleted successfully.</span>";
    $("#deleteStatusMsg").html(content);
    $("#deleteStatusMsg").css("display","block");
    $("#deleteStatusMsg").fadeOut(8000);
  }

  //function to hide delete all status messages
  function hideSuccessNotifications(){
    $(".successNotice").css("display","none");
  }

  //function to hide entry status message
  function hideEntryStatusMsg(){
    $("#expenseStatusMsg").css("display","none");
  }

  //function to add to the listing
  function addToListing(sl_no,expense,date,key){
    if(sl_no == 1){
      $(".viewListButton").removeClass("is-disabled");
      $(".list_disabled_img").css("display","none");
      $(".list_enabled_img").css("display","block");
      if(subsection == "list"){
        $("#entryListingSection").css("display","block");
      }
    }
    var prevContent = $("#entryListBody").html();
    if(prevContent.indexOf("<!-- empty -->") >= 0){
      prevContent = "";
    }
    var content = "<li class='topcoat-list__item'><span class='smallColumn'>"+sl_no;
    content+= "</span><span class='bigColumn'>"+currencySymbol+expense+"</span>";
    content +="<span class='bigColumn'>"+date+"</span>";
    content += "<span class='smallColumn'><img class='deleteButton' src='img/ic_delete.png'";
    content += "key='"+key+"' entryNo='"+sl_no+"' expense='"+expense+"'/></span></li>" + prevContent;
    $("#entryListBody").html(content);
  }

  //function to display Listing of data
  function displayListing(results){
    $("#entryListingSection").css("display","none");

    var entry_no = getValue("completedEntries");
    if (entry_no <= 0) {
      disableListSection();
    }
    if(entry_no > 0){
      $(".viewListButton").removeClass("is-disabled");
      $(".list_disabled_img").css("display","none");
      $(".list_enabled_img").css("display","block");
      if(subsection == "list") {
        $("#entryListingSection").css("display","block");
      }
      var content = "";
      if(results != null){
        for(i=results.rows.length-1;i>=0;i--){
          var entryValue = results.rows.item(i)["EntryNo"];
          var budgetValue = results.rows.item(i)["Expense"];
          var date = results.rows.item(i)["Date"];
          var keyValue = results.rows.item(i)["Id"];
          content += "<li class='topcoat-list__item'><span class='smallColumn'>"+entryValue + "</span>";
          content+="<span class='bigColumn'>"+currencySymbol+budgetValue+"</span>";
          content +="<span class='bigColumn'>"+date+"</span>";
          content += "<span class='smallColumn'><img class='deleteButton' src='img/ic_delete.png' ";
          content += "key='"+keyValue+"' entryNo='"+entryValue+"' expense='"+budgetValue+"'/></span></li>";
        }
      }
      $("#entryListBody").html(content);
    }
  }

  function addExpense(){
    var expense = expenseValidate();
    if(expense !== "" && (!isNaN(expense) || expense == 0)){
      addEntry(expense);
    }
  }

  //function to delete an entry
  function deleteEntry(key, entryNo, expense){
    //get the entry number to delete and store it
    setValue("deletedEntryNo", entryNo);
    var expenditure = parseFloat(getValue("expenditure")) - parseFloat(expense);
    setValue("expenditure",expenditure);
    var completedEntries = getValue("completedEntries") - 1;
    setValue("completedEntries",completedEntries);
    showProgressOverlay();

    dbClassObject.deleteFromBudgetTable(key, expense);
  }

  // function to recalculate entry no's after deleting an entry
  function recalculateEntryNumbers(){
    var deletedEntryNo = getValue("deletedEntryNo");
    var query = "UPDATE ENTRYBUDGET SET EntryNo = EntryNo-1 WHERE EntryNo>"+deletedEntryNo;
    dbClassObject.updateTable(query);
  }

  //function to calculate max Y plot value for date and entry
  function setPlotYMax(){

    var plotYMax = parseInt(getValue("maxExpense"));

    var maxExpensePerDay = parseFloat(getValue("maxExpensePerDay"));
    datePlotYMax = parseFloat(getValue("meanPerDay"));
    if(maxExpensePerDay>datePlotYMax){
      datePlotYMax = maxExpensePerDay;
    }
  }

  //reset the page to new values after deletion
  function resetAfterDeletion(){
    //do plotymax calculation here
    setPlotYMax();
    
    var expenditure = parseFloat(getValue("expenditure"));
    var budget = parseFloat(getValue("budget"));
    var completedDays = parseInt(getValue("completedDays")), duration = parseInt(getValue("duration")); 
    var meanPerDay = parseFloat(getValue("meanPerDay"));
    if(expenditure < budget && completedDays < duration && isLastDayOver() == false){ 
      hideExceedBudgetMessage();
      $(".viewAddButton").removeClass("is-disabled");
      $(".add_disabled_img").css("display","none");
      $(".add_enabled_img").css("display","block");
      if(subsection == "add") {
        $(".addExpenseSection").css("display","block");
        hideExceedBudgetMessage();
      }

      if(meanPerDay > 0){
        $(".meanProjectedDisplay").css("display","inline-block");
      }
    }
    showDeleteStatusMsg();

    $("#entryListBody").html("<!-- empty -->");
    reCalculate();
  }

  function expenseValidate(){
    $("#expense_error").css("display","none");
    var errors = ["Please enter a value","Perfect!","Please enter a Number","Please enter a valid date in format mm/dd/yyyy","Please Enter a non-zero number"];
    var inputVal = $("#expense_id").val();
    var error_no = validateNumber(inputVal);
    if(error_no != 1 && error_no != 4){
      $("#expense_error").css("display","block");
      $("#expense_error").html(errors[error_no]);
      inputVal = "";
    }
    inputVal = (Math.round((inputVal * 100))/100);
    return(inputVal);
  }

  //Add expense button on add expense page
  $("#EntryForm").submit(function(){
    addExpense();
  });

  //Delete option on list entries page
  $(document).on('click','.deleteButton',function(){
    //calls delete handler function
    var key = $(this).attr('key');
    var entryNo = $(this).attr('entryNo');
    var expense = $(this).attr('expense');
    deleteEntry(key, entryNo, expense);
  });

  //functions for all these tab buttons
  $(document).on('click','.viewAddButton',function(){    
    if(!$(this).hasClass("is-active") && !$(this).hasClass("is-disabled")){
      $(".tabGroup").removeClass("is-active");
      $(".viewAddButton").addClass("is-active");
      showBudgetMainView("add");
    }
    if($(this).hasClass("is-disabled")){
      popUpDisplay("#addTabDisabledMsg","#displayEntryBudget");
    }
  });
  $(document).on('click','.viewListButton',function(){
    if(!$(this).hasClass("is-active") && !$(this).hasClass("is-disabled")){
      $(".tabGroup").removeClass("is-active");
      $(".viewListButton").addClass("is-active");
      showBudgetMainView("list");
    }
    if($(this).hasClass("is-disabled")){
      popUpDisplay("#listTabDisabledMsg","#displayEntryBudget");
    }
  });
  $(document).on('click','.viewChartsButton',function(){
    if(!$(this).hasClass("is-active")){
      $(".tabGroup").removeClass("is-active");
      $(".viewChartsButton").addClass("is-active");
      showChartsView();
    }
  });
  $(document).on('click','.viewDateChartButton',function(){
    showDateBudgetChart();
  });
  $(document).on('click','.viewEntryChartButton',function(){
    showEntryBudgetChart();
  });
  
  $(document).on('click','.statsDisplayButton',function(){
    if(!$(this).hasClass("is-active")){
      $(".tabGroup").removeClass("is-active");
      $(".statsDisplayButton").addClass("is-active");
      populateStats();
      displayStatsOverlay();
    }
  });

  //toggle section minimize and maximize
  $(document).on('click','.toggleSection',function(){
    var sectionId = "#" + $(this).attr('sectionId');
    if($(this).hasClass("minimize-button")){
      $(this).removeClass("minimize-button");
      $(this).addClass("maximize-button");
      $(this).html("+");
      $(sectionId).slideUp();
    }else {
      $(this).addClass("minimize-button");
      $(this).removeClass("maximize-button");
      $(this).html("_");
      $(sectionId).slideDown();
    }
  });

}

/* ---------------- Validation Section ---------------------- */
function validateEmpty(inputVal,status){
  if(inputVal.length == 0){
    status=0;
  }
  return status;
}

function validateZero(inputVal,status){
  inputVal = parseFloat(inputVal);
  if(inputVal == 0){
    status = 4;
  }
  return status;
}

function validateNumber(inputVal){
  var status = 1;
  var numericReg = /^\d*\.?\d+$/;
  if(!numericReg.test(inputVal)) {
    status = 2;
    status = validateEmpty(inputVal, status);
  }
  if(status == 1){
    status = validateZero(inputVal,status);
  }
  return status;
}

function validateDate(inputVal){
  var status = 1;
  var dateReg = /^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$/;
  if(!dateReg.test(inputVal)) {
    status = 3;
    status = validateEmpty(inputVal, status);
  }
  if(status != 3 && status != 4){
      var split = inputVal.split("/");
      var mm = parseInt(split[0]);
      var dd = parseInt(split[1]);
      var yyyy = parseInt(split[2]);
      var maxFeb = 28;
      //29 in each leap year
      if(yyyy%4 == 0){
        maxFeb = 29;
      }
      if((mm == 2 && dd > maxFeb) || ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && dd > 30)){
        status = 6;
      }
      if(status != 3){
        var enteredDate = new Date();
        enteredDate.setFullYear(yyyy,mm-1,dd);
        enteredDate.setHours(0,0,0,0);
        var today = new Date();
        today.setHours(0,0,0,0);
        if(enteredDate < today){
          status = 5;
        } 
      }
    }
  return status;
}
/* ---------------- End of Validation Section ---------------------- */

/* ------------------------------ Database Section -------------------------*/
function dataBaseClass(){

    var dbName = "BudgetTracker";
    var dbNameDisplay = "Budget Tracker";
    var dbVersion = "1.0";
    var dbSize = 200000;
    var tableName = "";
    var deviceReady = false;
    var dbObject = null;
    var userClassObject = null;
    var thisObject = null;
    var entryClassObject = null;
    var setUpClassObject = null;
    var date = "",expense = 0;
    var dateObject = new Date();

    this.initializeDB = initializeDB;
    this.createBudgetTable = createBudgetTable;
    this.dropTable = dropTable;
    this.insertIntoBudgetTable = insertIntoBudgetTable;
    this.deleteFromBudgetTable = deleteFromBudgetTable;
    this.selectAll = selectAll;
    this.selectAllFromBudget = selectAllFromBudget;
    this.selectAllForDateBudget = selectAllForDateBudget;
    this.selectQuery = selectQuery;
    this.updateTable = updateTable;

    //function to initialize db
    function initializeDB(classObject, setUpObject, entryObject) {
      // Wait for PhoneGap to load
      //
      thisObject = classObject;
      entryClassObject = entryObject;
      setUpClassObject = setUpObject;

      document.addEventListener("deviceready", openDB, false);
      openDB();
      return deviceReady;
    }

    //function to create a table
    function createBudgetTable(){
      var query = "CREATE TABLE IF NOT EXISTS ENTRYBUDGET (Id TEXT NOT NULL PRIMARY KEY, EntryNo INTEGER NOT NULL,Expense INTEGER NOT NULL,Date TEXT NOT NULL);";
      //Sample query: 'CREATE TABLE IF NOT EXISTS tableName (id TEXT NOT NULL PRIMARY KEY, data TEXT NOT NULL);'
      dbObject.transaction(function (transaction){
        transaction.executeSql(query,[], dateBudgetCaller, errorHandler);
      });
    }

    //Call back function for create budget table
    function dateBudgetCaller(){
      var query = "CREATE TABLE IF NOT EXISTS DATEBUDGET (Id TEXT NOT NULL PRIMARY KEY, Expense INTEGER NOT NULL);";
      dbObject.transaction(function (transaction){
        transaction.executeSql(query,[], showEntryBudgetHandler, errorHandler);
      });
    }

    //function call (callback) after entry and date budget tables are created
    function showEntryBudgetHandler(){
      showEntryBudget(entryClassObject, thisObject);
    }

    //function to Insert into table
    function insertIntoBudgetTable(query, dateValue, expenseValue){
      //Sample query: 'INSERT INTO '+tableName+' ('+columns+') VALUES ("'+values+'");'
      date = dateValue;
      expense = expenseValue;
      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], checkAddDateExists, errorHandler);
      });
    }

    //function to check whether date is present in date table - callback for above function
    function checkAddDateExists(){
      var query = 'SELECT * FROM DATEBUDGET WHERE Id = "' + date + '";';
      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], dateInsertOrUpdate, errorHandler);
      });
    }

    //function to insert/update into date table - call back for above function
    function dateInsertOrUpdate(tx, results){
      var query;
      var expenseToday = expense;
      var totalDays = parseInt(getValue("duration"));
      var completedDays = parseInt(getValue("completedDays"));
      var totalExpense = parseFloat(getValue("expenditure"));
      var budget = parseFloat(getValue("budget"));

      if (results.rows.length > 0){       
        expenseToday = results.rows.item(0)['Expense'] + expense;
        query = 'UPDATE DATEBUDGET SET Expense = Expense + '+expense+' WHERE Id = "'+date+'";';        
      } else {
        query = 'INSERT INTO DATEBUDGET (Id,Expense) VALUES ("'+date+'",'+expense+');';      
      }

      //recalculating total entries
      remainingDays = totalDays - completedDays;
      total_entries = parseInt(getValue("completedEntries")) + remainingDays;
      setValue("total_entries",total_entries);

      //Set value for maxExpensePerDay and mean per day
      var maxExpensePerDay = parseFloat(getValue("maxExpensePerDay"));
      if(expenseToday > maxExpensePerDay){
        setValue("maxExpensePerDay",expenseToday);
      }
      if(totalDays != completedDays){
        var meanPerDay = (budget - totalExpense)/(totalDays - completedDays);
        meanPerDay = Math.round((meanPerDay * 100))/100;
        setValue("meanPerDay",meanPerDay);
      }

      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], insertDataHandler, errorHandler);
      });
    }

    //function to handle insert into table
    function insertDataHandler(transaction,results){
      entryClassObject.reCalculate();
    }

    function deleteFromBudgetTable(id, expenseValue){
      date = id.split("_")[0];
      expense = expenseValue;
      dbObject.transaction(function (transaction){
        transaction.executeSql('DELETE FROM ENTRYBUDGET WHERE id="'+id+'";', [], checkDeleteDateExists, errorHandler);
      });
    }

    //function to check whether delete date exists in table
    function checkDeleteDateExists(){
      var query = 'SELECT * FROM DATEBUDGET WHERE Id = "' + date + '";';
      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], dateDeleteOrUpdate, errorHandler);
      });
    }

    //function to delete/update date table
    function dateDeleteOrUpdate(tx, results){
      var query;
      var totalDays = parseInt(getValue("duration"));
      var completedDays = parseInt(getValue("completedDays"));
      var totalExpense = parseFloat(getValue("expenditure"));
      var budget = parseFloat(getValue("budget"));
      if (results.rows.length > 0 && results.rows.item(0)['Expense'] > expense){
        query = 'UPDATE DATEBUDGET SET Expense = Expense - '+expense+' WHERE Id = "'+date+'";';        
      } else {
        query = 'DELETE FROM DATEBUDGET WHERE id="'+date+'";';  
      }

      //recomputing total-entries
      var remainingDays = totalDays - completedDays;
      var total_entries = parseInt(getValue("completedEntries")) + remainingDays;
      setValue("total_entries",total_entries);

      //computing mean per day
      if(totalDays != completedDays){
        var meanPerDay = (budget - totalExpense)/(totalDays - completedDays);
        meanPerDay = Math.round((meanPerDay * 100))/100;
        setValue("meanPerDay",meanPerDay);
      }

      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], deleteEntryHandler, errorHandler);
      });
    }

    //function to handle deleting of entry
    function deleteEntryHandler(){
      //console.log("Delete of row successful!")
      entryClassObject.recalculateEntryNumbers();
    }

    //function to open a database 
    function openDB(){
      //window.openDatabase(name, version, display_name, size);
      try {
        if (!window.openDatabase) {
          alert('Local Databases are not supported by your browser. Please use a Webkit browser for this demo');
        } else {
          dbObject = window.openDatabase(dbName, dbVersion, dbNameDisplay, dbSize);
          deviceReady = true;
        }
      } catch(e) {
        if (e == 2) {
            // Version mismatch.
            setError("Invalid database version in openDB()");
        } else {
            setError("Unknown error "+ e +" in openDB()");
        }
        return;
      }
    }

    // Query the database to get all data from a table
    //
    function selectAll(init) {
      if(init == "init" && isLastDayOver() == false){
        var thisDate = new Date();
        dateObject = thisDate;
        verifyDateTable();
      }
      else {
        dbObject.transaction(function (transaction){
          transaction.executeSql('SELECT * FROM ENTRYBUDGET;', [], resultHandler, selectErrorHandler);
        });
      }
    }

    //function to update date table
    function verifyDateTable(){

        var start_date = getValue("start_date");
        var splitDate = start_date.split("/");
        var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
        var startdate = new Date();
        startdate.setFullYear(yyyy,mm,dd);
        dateVar = dateObject;
        startdate.setHours(0,0,0,0);
        dateVar.setHours(0,0,0,0);

        if(dateVar > startdate || dateVar.getTime() == startdate.getTime()){
            var month = dateVar.getMonth()+1;
            var day = dateVar.getDate();

            var fullDate =  (month<10 ? '0' : '') + month + '/' +
                (day<10 ? '0' : '') + day + '/' +
                dateVar.getFullYear();
            date = fullDate;
            var query = 'SELECT * FROM DATEBUDGET WHERE Id = "' + fullDate + '";';
            dbObject.transaction(function (transaction){
              transaction.executeSql(query, [], updateZerosToDateTable, errorHandler);
            });          
        } else {
        dbObject.transaction(function (transaction){
          transaction.executeSql('SELECT * FROM ENTRYBUDGET;', [], resultHandler, selectErrorHandler);
        });
      }

    }

    //function to update zero's to table
    function updateZerosToDateTable(tx,results){
      var query;
      var totalDays = parseInt(getValue("duration"));
      var completedDays = parseInt(getValue("completedDays"));
      var totalExpense = parseFloat(getValue("expenditure"));
      var budget = parseFloat(getValue("budget"));

      if (results.rows.length > 0){
        var date_i = getDateN(date,-1);
        var splitDate = date_i.split("/");
        var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
        dateObject.setFullYear(yyyy,mm,dd);
        verifyDateTable();
      } else {
        //Set value for mean per day
        if(completedDays < totalDays){
          var meanPerDay = (budget - totalExpense)/(totalDays - completedDays);
          meanPerDay = Math.round((meanPerDay * 100))/100;
          setValue("meanPerDay",meanPerDay);
        }
        query = 'INSERT INTO DATEBUDGET (Id,Expense) VALUES ("'+date+'",'+0+');';   
        dbObject.transaction(function (transaction){
          transaction.executeSql(query, [], updateZeroHandler, errorHandler);
        });         
      }
    }

    // Update Zero handler callback
    function updateZeroHandler(tx, results) {
        //console.log("Update Zero Successful! ");
        var date_i = getDateN(date,-1);
        var splitDate = date_i.split("/");
        var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
        dateObject.setFullYear(yyyy,mm,dd);
        verifyDateTable();
    }

    //Query the database for a particular value
    function selectQuery(query, userObject) {
      userClassObject = userObject;
      dbObject.transaction(function (transaction){
        transaction.executeSql(query, [], resultHandler, errorHandler);
      });
    }

    //function to handle select error 
    function selectErrorHandler(tx,error){
      setError('Oops. Select Error! ::: '+error.message+' (Code '+error.code+')');
    }

    // Select Query success - results handler callback
    //
    function resultHandler(tx, results) {
        entryClassObject.rePlot(results);
        //console.log("Select All Successful! Result rows = " + results.rows.length);
    }

    // Query the database to get all data from a table
    //
    function selectAllFromBudget() {
      dbObject.transaction(function (transaction){
        transaction.executeSql('SELECT * FROM ENTRYBUDGET;', [], budgetChartHandler, errorHandler);
      });
    }

    // Select Query success - results handler callback
    //
    function budgetChartHandler(tx, results) {
        entryClassObject.viewBudgetChart(results);
        //console.log("Result rows = " + results.rows.length);
    }

    // Query the database to get all data from a table
    //
    function selectAllForDateBudget() {
      dbObject.transaction(function (transaction){
        transaction.executeSql('SELECT * FROM DATEBUDGET;', [], dateViewHandler, errorHandler);
      });
    }

    // Select Query success - results handler callback
    //
    function dateViewHandler(tx, results) {
        entryClassObject.viewDateChart(results);
        //console.log("Result rows = " + results.rows.length);
    }

    /***
    **** DELETE DB TABLE ** 
    ***/
    function dropTable(tableName){
      dbObject.transaction(
          function (transaction) {
            transaction.executeSql("DROP TABLE if exists "+tableName+";", [], dropDateTable, errorHandler);
          }
      );
      //console.log("Table '"+tableName+"' has been dropped.");
      //location.reload();
    }

    //call back function to delete date budget table after deleting entry budget table
    function dropDateTable(){
      dbObject.transaction(
          function (transaction) {
            transaction.executeSql("DROP TABLE if exists DATEBUDGET;", [], resetSetupDataHandler, errorHandler);
          }
      );
      //console.log("Table 'DATEBUDGET' has been dropped.");
    }

    //Reset setup handler
    function resetSetupDataHandler(){
      hide_message_screen(".backdrop","#popUpBox");
      $("#entryListBody").html("<!-- empty -->");
      pageOrder = "new";
      setUpClassObject.initSetUp(entryClassObject, thisObject, pageOrder);
    }


    //function to update a table
    function updateTable(query) {
      dbObject.transaction(function (transaction){
        // "UPDATE "+tableName+" SET id=?, bgcolor=?, font=?, favcar=? WHERE id = "+id, [fname, bg, font, car]
        transaction.executeSql(query, [], updateEntriesHandler, errorHandler);
      });
    }

    //function to handle update of entry nos
    function updateEntriesHandler(tx, results){
      //call handling function
      //console.log("updateEntriesHandler : entryobject" + entryClassObject + "results : " +results.rows.length);
      var completedEntries = getValue("completedEntries");
      if(completedEntries > 0){
        var getMaxExpenseQuery = "SELECT MAX(Expense) AS maxExpense from ENTRYBUDGET";
        dbObject.transaction(function (transaction){
          transaction.executeSql(getMaxExpenseQuery, [], updateMaxExpenseHandler, errorHandler);
        });  
      } else {
        setValue("maxExpense",0);
        setValue("maxExpensePerDay",0);
      }
      entryClassObject.resetAfterDeletion();   
    }

    function updateMaxExpenseHandler(tx, results){
      if(results.rows.length  > 0) {
        var maxExpense = results.rows.item(0)["maxExpense"];
        setValue("maxExpense",maxExpense);
      }
      var getMaxExpenseQuery = "SELECT MAX(Expense) AS maxExpense from DATEBUDGET";
      dbObject.transaction(function (transaction){
        transaction.executeSql(getMaxExpenseQuery, [], updateMaxExpensePerDateHandler, errorHandler);
      });    
    }
    function updateMaxExpensePerDateHandler(tx,results){
      if(results.rows.length  > 0) {
        var maxExpense = results.rows.item(0)["maxExpense"];
        setValue("maxExpensePerDay",maxExpense);
      }
      entryClassObject.resetAfterDeletion();
    }


    //error message display - transaction error callback
    function errorHandler(transaction, error){
      if (error.code==1){
        // DB Table already exists
      } else {
          // Error is a human-readable string.
          setError('Oops.  Error! ::: '+error.message+' (Code '+error.code+')');
      }
        return false;
    }

    //Success message display - success callback method
    function nullDataHandler(transaction,results){
      //console.log("SQL Query Succeeded");
      //console.log("Rows Affected = " + results.rows.length);
    }
}

/* ------------------------------ End Database Section -------------------------*/

/* ---------------------------- Local Storage Section -------------------------*/

function createSetUpParams(keySet){
  /*will hold values 0- Budget, 1- start date, 2- end date, 3- no of entries, 4-expenditure till now, 
    5- no of entries till now, 6- mean budget per day, 7- max expense per entry, 8 - max expense per day,
    9 - completed days, 10 - duration    */
  var setUpParams = new Array();
  setUpParams = keySet.split("|");
  
  setUpParams[3] = getDuration(setUpParams[1], setUpParams[2]); /* total entries = duration initially */
  setUpParams[4] = 0;
  setUpParams[5] = 0;
  setUpParams[6] = (Math.round((setUpParams[0]/setUpParams[2]) * 100))/100;
  setUpParams[7] = 0;
  setUpParams[8] = 0;
  setUpParams[9] = 0;
  setUpParams[10] = setUpParams[3]; //duration

  var keys = ["budget","start_date","end_date","total_entries","expenditure","completedEntries","meanPerDay","maxExpense", "maxExpensePerDay","completedDays","duration"];
  for(i=0;i<setUpParams.length;i++){
    window.localStorage.setItem(keys[i], setUpParams[i]);
  }
}

function updateSetUpParams(keySet){
  var setUpParams = new Array();
  setUpParams = keySet.split("|");
  var budget = parseFloat(setUpParams[0]), expenditure = parseFloat(getValue("expenditure"));
  var completedEntries = parseInt(getValue("completedEntries"));
  var duration = parseInt(getDuration(setUpParams[1], setUpParams[2])), completedDays = parseInt(getValue("completedDays"));
  var total_entries = completedEntries;
  if(duration > completedDays) {
    var remainingDays = duration - completedDays;
    total_entries = total_entries + remainingDays;
  }
  setUpParams[3] = total_entries;

  var meanPerDay = (Math.round(budget - expenditure) * 100)/100;
  if(duration > completedDays){
    meanPerDay = (Math.round((budget - expenditure)/(duration - completedDays) * 100))/100;
  }
  setUpParams[4] = meanPerDay;
  setUpParams[5] = duration;
  var keys = ["budget","start_date","end_date","total_entries","meanPerDay","duration"];
  for(i=0;i<setUpParams.length;i++){
    window.localStorage.setItem(keys[i], setUpParams[i]);
  }
}

function set_SLNO_Key(value){
  window.localStorage.setItem("sl_no", value);
}

function get_SLNO_Key(){
  var value = window.localStorage.getItem("sl_no");
  return value;
}

function set_setup_status(value){
  window.localStorage.setItem("setup_status", value);
}

function get_setup_status(value){
  var value = window.localStorage.getItem("setup_status");
  return value;
}

function getValue(key){
  var value = window.localStorage.getItem(key);
  return value;
}

function setValue(key, value){
  window.localStorage.setItem(key, value);
}

function clearAllStorageData(){
  window.localStorage.clear();
}

function removeDataSet(key){
  window.localStorage.removeItem(key);
}

function setLastDate(date){
  window.localStorage.setItem("last_date", date);
}

function getLastDate(){
  var value = window.localStorage.getItem("last_date");
  return value;
}

function setError(errorMsg){
  var value = window.localStorage.getItem("errorList");
  value = errorMsg + ";" + value;
  window.localStorage.setItem("errorList", value);
}