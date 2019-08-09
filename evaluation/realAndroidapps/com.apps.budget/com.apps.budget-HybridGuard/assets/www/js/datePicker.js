function datePicker(){
	var datePickerHtml = "";
	var day = 1;
	var month = 1;
	var year = 2012;
	var resultId = "";
	var jsResultId = "";
	var pickedDate = null;

	//CONSTANTS
	var dayPlusSelector = ".datePickerSection .plusDisplay .day";
	var monthPlusSelector = ".datePickerSection .plusDisplay .month";
	var yearPlusSelector = ".datePickerSection .plusDisplay .year";
	var dayMinusSelector = ".datePickerSection .minusDisplay .day";
	var monthMinusSelector = ".datePickerSection .minusDisplay .month";
	var yearMinusSelector = ".datePickerSection .minusDisplay .year";
	var daySelector = ".datePickerSection .dateDisplay .day";
	var monthSelector = ".datePickerSection .dateDisplay .month";
	var yearSelector = ".datePickerSection .dateDisplay .year";
	var setButton = ".datePickerSection .buttons .setDate";
	var cancelButton = ".datePickerSection .buttons .cancel";
	var monthMin = 1;
	var monthLowerLimit = 1;
	var dayLowerLimit = 1;
	var monthMax = 12;
	var dayMin = 1;
	var dayMax = 31;
	var yearLowerLimit =0;

	this.initDisplay = initDisplay;

	/* ------------------------------------------------
	 * function to initialize the display of date picker 
	*/
	function initDisplay(id){
		resultId = "#" + id;
		jsResultId = id;
		$(resultId).blur();
		document.getElementById(id).setAttribute('disabled');
		addToBody();
		overLay();
		populate();
	}

	/* ----------------------------------------------------
	 * function to the display of date picker as an overlay
	*/
	function overLay(){
		var box = ".datePickerSection";
		var backdrop = ".datePickerBackDrop";
		var top_pos = $(document.body).offset().top;
		var left_pos = $(document.body).offset().left;
		var screen_height = $(window).height();
		var screen_width = $(window).width();
		var offset_y = ($(box).height())/2;
		var offset_x = ($(box).width())/2;
		var both = backdrop + "," + box;
		$(backdrop).css('top',top_pos);
		$(backdrop).css('left',left_pos);
		$(backdrop).css('height',screen_height);
		$(backdrop).css('width',screen_width);
		$(box).css('top',((screen_height/2)-offset_y));
		$(box).css('left',((screen_width/2)-offset_x));
		$(backdrop).animate({'opacity':'0.50'}, 300, 'linear');
		$(box).animate({'opacity':'1.00'}, 300, 'linear');
		$(both).css('display','block');
	}

	/* ------------------------------------------------
	 * function to hide the datepicker overlay 
	*/
	function hideDatePicker(){
		var box = ".datePickerSection";
		var backdrop = ".datePickerBackDrop";
		var both = backdrop + "," + box;
		$(both).animate({'opacity':'0'}, 300, 'linear', function(){
			$(both).css('display', 'none');
		});
	}

	/* ------------------------------------------------
	 * function to create the html shell of date picker 
	*/
	function createShell(){
		var dateDisplay = "<div class='datePickerDate'></div>";
		var header = "<div class='datePickerHeader'><span>Month</span><span>Day</span><span>Year</span></div>";
		var plusDisplay = "<div class='plusDisplay'><a class='month'>+</a><a class='day'>+</a><a class='year'>+</a></div>";
		var chooseDateDisplay = "<div class='dateDisplay'><span class='month'>01</span><span class='day'>01</span><span class='year'>13</span></div>";
		var minusDisplay = "<div class='minusDisplay'><a class='month'>-</a><a class='day'>-</a><a class='year'>-</a></div>";
		var datePickerButtons = "<div class='buttons'><a class='setDate'>Set</a><a class='cancel'>Cancel</a></div>"
		var content = dateDisplay + header + plusDisplay + chooseDateDisplay + minusDisplay + datePickerButtons;
		return content;
	}

	/* ------------------------------------------------
	 * function to add the html shell of date picker 
	 * to body if not already present
	*/
	function addToBody(){
		if(!$(document.body).hasClass('datePickerSection')){
			var content = createShell();
			var backdrop = "<div class='datePickerBackDrop'></div>";
			var datePickerHtml = "<div class='datePickerSection'></div>";
			$(document.body).append(datePickerHtml);
			$(document.body).append(backdrop);
			$(".datePickerSection").html(content);
		}
	}

	/* ------------------------------------------------
	 * function to populate values to the date picker 
	*/
	function populate(){
		var date = new Date();
		date.setHours(0,0,0,0);
		monthLowerLimit = date.getMonth()+1;
		dayLowerLimit = date.getDate();
		yearLowerLimit = date.getFullYear();
		var inputVal = $(resultId).val();
		var isInputValid = validateDate(inputVal);
		if(isInputValid){
			var splitDate = inputVal.split("/");
	   		var mm = splitDate[0] - 1, dd = splitDate[1], yyyy = splitDate[2];
	    	date.setFullYear(yyyy,mm,dd);
	    }
	    pickedDate = date;
		month = date.getMonth()+1;
		day = date.getDate();
		var monthString = (month<10 ? '0' : '') + month;
		var dayString = (day<10 ? '0' : '') + day;
		year = date.getFullYear();
		var yearShort = year % 100;
		$(monthSelector).html(monthString);
		$(daySelector).html(dayString);
		$(yearSelector).html(yearShort);
		maintainMaxDate();
		maintainMinimumLimit();
		date.setFullYear(year,month-1,day);
		if(year == yearLowerLimit){
			$(yearMinusSelector).addClass("is-disabled");
			if(month == monthLowerLimit){
				$(monthMinusSelector).addClass("is-disabled");
				if(day == dayLowerLimit){
					$(dayMinusSelector).addClass("is-disabled");
				}
			}
		}
		var dateString = getDateString(date);
		$(".datePickerDate").html(dateString);
		$(resultId).val(dateString);
		pickedDate = date;
	}

	/*
	*/
	function validateDate(inputVal){
		var isValid = true;
		var dateReg = /^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$/;
		if(!dateReg.test(inputVal) || inputVal.length == 0) {
			isValid = false;
		}
		return isValid;
	}

	/* ---------------------------------------------------------
	 * function to get a string representation of a date object
	*/
	function getDateString(dateObj){
		var month = dateObj.getMonth()+1;
		var day = dateObj.getDate();
		var fullDate =  (month<10 ? '0' : '') + month + '/' +
		  (day<10 ? '0' : '') + day + '/' +
		  dateObj.getFullYear();
		return fullDate;
	}

	/* --------------------------------------------------
	 * function to update the max date possible based on 
	 * the current year and month
	*/
	function maintainMaxDate() {
		var isLeapYear = false;
		dayMax = 31;
		if(year%4 == 0){
			isLeapYear = true;
		}
		if(month == 2){
			dayMax = 28;
			if(isLeapYear){
				dayMax = 29;
			}
		}
		if(month == 4 || month == 6 || month == 9 || month == 11){
			dayMax = 30;
		}
		if(day > dayMax){
			day = dayMax;
			pickedDate.setDate(day);
			var dayString = (day<10 ? '0' : '') + day;
			$(daySelector).html(dayString);
		}
	}

	/* ------------------------------------------------
	 * function to create the html shell of date picker 
	*/
	function maintainMinimumLimit() {
		if(year == yearLowerLimit){
			if(month < monthLowerLimit){
				month = monthLowerLimit;
				pickedDate.setMonth(month-1);
				maintainMaxDate();
				var monthString = (month<10 ? '0' : '') + month;
				$(monthSelector).html(monthString);
				if(day < dayLowerLimit){
					day=dayLowerLimit;
					pickedDate.setDate(day);
					var dayString = (day<10 ? '0' : '') + day;
					$(daySelector).html(dayString);
				}
			}
			if(month == monthLowerLimit){
				maintainMaxDate();
				if(day < dayLowerLimit){
					day=dayLowerLimit;
					pickedDate.setDate(day);
					var dayString = (day<10 ? '0' : '') + day;
					$(daySelector).html(dayString);
				}					
			}
		}
	}

	/* ------------------------------------------------
	 * Action on click of month increment button 
	*/
	$(document).on('click',monthPlusSelector,function(){
		if(month < monthMax){
			month++;
		} else {
			month = monthMin;
		}
		pickedDate.setMonth(month-1);
		var monthString = (month<10 ? '0' : '') + month;
		$(monthSelector).html(monthString);
		maintainMaxDate();
		maintainMinimumLimit();
		if($(monthMinusSelector).hasClass("is-disabled")){
			$(monthMinusSelector).removeClass("is-disabled");
			$(dayMinusSelector).removeClass("is-disabled");
		}
		var dateString = getDateString(pickedDate);
		$(".datePickerDate").html(dateString);
	}); 

	/* ------------------------------------------------
	 * Action on click of month decrement button 
	*/
	$(document).on('click',monthMinusSelector,function(){
		isMinusValid = true;
		if(year == yearLowerLimit && month == monthLowerLimit){
			isMinusValid = false;
		}
		if(isMinusValid) {
			if(month > monthMin){
				month--;
			} else {
				month = monthMax;
			}
			pickedDate.setMonth(month-1);
			var monthString = (month<10 ? '0' : '') + month;
			$(monthSelector).html(monthString);
			maintainMaxDate();
			if(year == yearLowerLimit && month == monthLowerLimit){
				$(monthMinusSelector).addClass("is-disabled");
				if(day == dayLowerLimit){
					$(dayMinusSelector).addClass("is-disabled");
				}
			}
			var dateString = getDateString(pickedDate);
			$(".datePickerDate").html(dateString);
		}
	}); 

	/* ------------------------------------------------
	 * Action on click of day increment button 
	*/
	$(document).on('click',dayPlusSelector,function(){
		if(day < dayMax){
			day++;
		} else {
			day = dayMin;
		}
		pickedDate.setDate(day);
		var dayString = (day<10 ? '0' : '') + day;
		$(daySelector).html(dayString);
		maintainMinimumLimit();
		if($(dayMinusSelector).hasClass("is-disabled")){
			$(dayMinusSelector).removeClass("is-disabled");
		}
		var dateString = getDateString(pickedDate);
		$(".datePickerDate").html(dateString);
	}); 

	/* ------------------------------------------------
	 * Action on click of day decrement button 
	*/
	$(document).on('click',dayMinusSelector,function(){
		isMinusValid = true;
		if(year == yearLowerLimit && month == monthLowerLimit && day == dayLowerLimit){
			isMinusValid = false;
		}
		if(isMinusValid){
			if(day > dayMin){
				day--;
			} else {
				day = dayMax;
			}
			var dayString = (day<10 ? '0' : '') + day;
			$(daySelector).html(dayString);
			if(year == yearLowerLimit && month == monthLowerLimit && day == dayLowerLimit){
				$(dayMinusSelector).addClass("is-disabled");
			}
			pickedDate.setDate(day);
			var dateString = getDateString(pickedDate);
			$(".datePickerDate").html(dateString);
		}
	}); 

	/* ------------------------------------------------
	 * Action on click of year increment button 
	*/
	$(document).on('click',yearPlusSelector,function(){
		year++;
		pickedDate.setFullYear(year);
		yearShort = year % 100;
		$(yearSelector).html(yearShort);
		if($(yearMinusSelector).hasClass("is-disabled")){
			$(yearMinusSelector).removeClass("is-disabled");
			$(monthMinusSelector).removeClass("is-disabled");
			$(dayMinusSelector).removeClass("is-disabled");
		}
		var dateString = getDateString(pickedDate);
		$(".datePickerDate").html(dateString);
	}); 

	/* ------------------------------------------------
	 * Action on click of year decrement button 
	*/
	$(document).on('click',yearMinusSelector,function(){
		if(year > yearLowerLimit){
			year--;
			pickedDate.setFullYear(year);
			yearShort = year % 100;
			$(yearSelector).html(yearShort);
			if(year == yearLowerLimit){
				maintainMinimumLimit();
				$(yearMinusSelector).addClass("is-disabled");
				if(month == monthLowerLimit){
					$(monthMinusSelector).addClass("is-disabled");
					if(day == dayLowerLimit){
						$(dayMinusSelector).addClass("is-disabled");
					}
				}
			}
			var dateString = getDateString(pickedDate);
			$(".datePickerDate").html(dateString);
		}
	}); 

	/* ------------------------------------------------
	 * Action on click of year decrement button 
	*/
	$(document).on('click',setButton,function(){
		var dateString = getDateString(pickedDate);
		$(resultId).val(dateString);
		hideDatePicker();
		document.getElementById(jsResultId).removeAttribute('disabled');
		$(resultId).change();
	});

	/* ------------------------------------------------
	 * Action on click of year decrement button 
	*/
	$(document).on('click',cancelButton,function(){
		hideDatePicker();
		document.getElementById(jsResultId).removeAttribute('disabled');
	});
}